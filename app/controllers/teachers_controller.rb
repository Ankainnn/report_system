# -*- encoding : utf-8 -*-
class TeachersController < ApplicationController
  # GET /teachers
  # GET /teachers.json
  before_filter :only_admin_and_user, only: [:destroy, :edit, :update, :new, :create]
  def index
    if params[:id].present?
      @teacher = Teacher.find_by_id(params[:id])
    end
    @teachers = Teacher.order(:created_at).reverse_order.page(params[:page]).per(50)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teachers }
      format.js
    end
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
    @teacher = Teacher.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @teacher }
    end
  end

  # GET /teachers/new
  # GET /teachers/new.json
  def new
    @teacher = Teacher.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @teacher }
    end
  end

  # GET /teachers/1/edit
  def edit
    @teacher = Teacher.find(params[:id])
    
  end

  # POST /teachers
  # POST /teachers.json
  def create
    @teacher = Teacher.new(params[:teacher])

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to @teacher, notice: 'Teacher was successfully created.' }
        format.json { render json: @teacher, status: :created, location: @teacher }
      else
        format.html { render action: "new" }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teachers/1
  # PUT /teachers/1.json
  def update
    @teacher = Teacher.find(params[:id])

    respond_to do |format|
      if @teacher.update_attributes(params[:teacher])
        format.html { redirect_to @teacher, notice: 'Teacher was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy

    respond_to do |format|
      format.html { redirect_to teachers_url }
      format.json { head :no_content }
    end
  end

  def teachers_to_excel_format
    @teachers = Teacher.all
    respond_to do |format|
      format.html
      format.csv { send_data @teachers.to_csv }
      format.xls
    end
  end
end
