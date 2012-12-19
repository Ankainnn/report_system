# -*- encoding : utf-8 -*-
class MsalariesController < ApplicationController
  # GET /msalaries
  # GET /msalaries.json
  before_filter :active_user
  before_filter :only_admin_and_user, only: [:destroy, :edit, :update, :new, :create]
  def index
    res = SortOption.find_by_user_id(current_user.id)
    @current_user = current_user.id
    @options = [['менеджер','manager_id'],
                ['дата', 'date'],
                ['сумма', 'summ'],
                ['начало','start'],
                ['конец','end'],
                ['форма выплаты','type'],
                ['комментарий','comment'],
                ['оплата с','pay_from'],
                ['оплата по','pay_to'],
                ['создано','created_at'],
                ['отредактировано','updated_at']]
    if res.msalaries.present?
      @prompt = @options.rassoc(res.msalaries).first
      @options.delete_if{|x| x.last == res.msalaries}
      @msalaries = Msalary.order("#{res.msalaries} ASC")
    else
      @prompt = 'варианты'
      @msalaries = Msalary.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @msalaries }
    end
  end

  # GET /msalaries/1
  # GET /msalaries/1.json
  def show
    @msalary = Msalary.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @msalary }
    end
  end

  # GET /msalaries/new
  # GET /msalaries/new.json
  def new
    @msalary = Msalary.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @msalary }
    end
  end

  # GET /msalaries/1/edit
  def edit
    @msalary = Msalary.find(params[:id])
  end

  # POST /msalaries
  # POST /msalaries.json
  def create
    @msalary = Msalary.new(params[:msalary])

    respond_to do |format|
      if @msalary.save
        format.html { redirect_to @msalary, notice: 'Msalary was successfully created.' }
        format.json { render json: @msalary, status: :created, location: @msalary }
      else
        format.html { render action: "new" }
        format.json { render json: @msalary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /msalaries/1
  # PUT /msalaries/1.json
  def update
    @msalary = Msalary.find(params[:id])

    respond_to do |format|
      if @msalary.update_attributes(params[:msalary])
        format.html { redirect_to @msalary, notice: 'Msalary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @msalary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /msalaries/1
  # DELETE /msalaries/1.json
  def destroy
    @msalary = Msalary.find(params[:id])
    @msalary.destroy

    respond_to do |format|
      format.html { redirect_to msalaries_url }
      format.json { head :no_content }
    end
  end

  def msalaries_to_excel_format
    @msalaries = Msalary.all
    respond_to do |format|
      format.html
      format.csv { send_data @msalaries.to_csv }
      format.xls
    end
  end

  def sort_options
    if params[:selected].present?
      res = SortOption.find_or_create_by_user_id(current_user.id)
      res.update_attribute(:msalaries, params[:selected])
    end
    redirect_to msalaries_path
  end

end
