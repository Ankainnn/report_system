# -*- encoding : utf-8 -*-
class SalariesController < ApplicationController
  # GET /salaries
  # GET /salaries.json
  before_filter :active_user
  def index
    @salaries = Salary.all

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

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @salary }
    end
  end

  # GET /salaries/1/edit
  def edit
    @salary = Salary.find(params[:id])
  end

  # POST /salaries
  # POST /salaries.json
  def create
    #params[:salary][:course] = params[:salary][:course].to_i
    @salary = Salary.new(params[:salary])

    respond_to do |format|
      if @salary.save
        format.html { redirect_to @salary, notice: 'Salary was successfully created.' }
        format.json { render json: @salary, status: :created, location: @salary }
      else
        format.html { render action: "new" }
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
end
