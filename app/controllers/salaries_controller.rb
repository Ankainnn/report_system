# -*- encoding : utf-8 -*-
class SalariesController < ApplicationController
  # GET /salaries
  # GET /salaries.json
  skip_before_filter :verify_authenticity_token
  before_filter :active_user
  before_filter :only_admin_and_user, only: [:destroy, :edit, :update, :new, :create]
  def index
    res = SortOption.find_by_user_id(current_user.id)
    @current_user = current_user.id
    @options = [['дата', 'date'],
                ['сумма', 'sum'],
                ['курс','course_id'],
                ['преподаватель','teacher_id'],
                ['график','schedule_id'],
                ['начало','start'],
                ['конец','end'],
                ['форма выплаты','type'],
                ['комментарий','comment'],
                ['оплата с','pay_from'],
                ['оплата по','pay_to'],
                ['создано','created_at'],
                ['отредактировано','updated_at']]
    if res
      if res.salaries.present?
        @salaries = Salary.order("#{res.salaries} ASC")
      else
        @salaries = Salary.all
      end
    else
      @salaries =  Salary.all
    end


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @salaries }
    end
  end

  # GET /salaries/1
  # GET /salaries/1.json
  def show
    @salary = Salary.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @salary }
    end
  end

  # GET /salaries/new
  # GET /salaries/new.json
  def new
    @salary = Salary.new
    @teacher_collect = Teacher.order(:name)
    @course_collect = Course.order(:id)
    if params[:teacher_id].present?
    @res = Teacher.find(params[:teacher_id]).courses

    end


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @salary }
      format.js
    end
  end


  def schedules
    if params[:teacher_id].present? && params[:course_id].present?
      @schedules = Schedule.where("teacher_id = ? AND course_id = ?", params[:teacher_id], params[:course_id])
    end

    respond_to do |format|
      format.html
      format.js
    end

  end

  # GET /salaries/1/edit
  def edit
    @salary = Salary.find(params[:id])
  end

  # POST /salaries
  # POST /salaries.json
  def create
    @salary = Salary.new(params[:salary])
    @salary.course_id = params[:course_id].first if params[:course_id].present?
    @salary.schedule_id = params[:schedule_id].first if params[:schedule_id].present?
    respond_to do |format|
      if @salary.save
        format.html { redirect_to @salary, notice: 'Salary was successfully created.' }
        format.json { render json: @salary, status: :created, location: @salary }
      else
        format.html { redirect_to new_salary_path }
        format.json { render json: @salary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /salaries/1
  # PUT /salaries/1.json
  def update
    @salary = Salary.find(params[:id])

    respond_to do |format|
      if @salary.update_attributes(params[:salary])
        format.html { redirect_to @salary, notice: 'Salary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @salary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salaries/1
  # DELETE /salaries/1.json
  def destroy
    @salary = Salary.find(params[:id])
    @salary.destroy

    respond_to do |format|
      format.html { redirect_to salaries_url }
      format.json { head :no_content }
    end
  end


  def salaries_to_excel_format
    @salaries = Salary.all
    respond_to do |format|
      format.html
      format.csv { send_data @salaries.to_csv }
      format.xls
    end
  end

  def sort_options
    if params[:selected].present?
      res = SortOption.find_or_create_by_user_id(current_user.id)
      res.update_attribute(:salaries, params[:selected])
    end
    redirect_to salaries_path
  end
end
