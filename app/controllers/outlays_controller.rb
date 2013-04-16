# -*- encoding : utf-8 -*-
class OutlaysController < ApplicationController
  # GET /outlays
  # GET /outlays.json
  before_filter :only_admin_and_user, only: [:destroy, :edit, :update, :new, :create]
  def index
    res = SortOption.find_by_user_id(current_user.id)
    @current_user = current_user.id
    @options = [['дата', 'date'],
                ['сумма', 'summ'],
                ['тип расходов','type'],
                ['форма оплаты','cost_id'],
                ['автор','person'],
                ['комментарий','comment'],
                ['создано','created_at'],
                ['отредактировано','updated_at']]
    if res && res.outlays.present?
      @prompt = @options.rassoc(res.outlays).first
      @options.delete_if{|x| x.last == res.outlays}
      @outlays = Outlay.order("#{res.outlays} ASC").order("created_at DESC")
    else
      @prompt = 'варианты'
      @outlays = Outlay.order("created_at DESC")
    end


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @outlays }
    end
  end

  # GET /outlays/1
  # GET /outlays/1.json
  def show
    @outlay = Outlay.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @outlay }
    end
  end

  # GET /outlays/new
  # GET /outlays/new.json
  def new
    @outlay = Outlay.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @outlay }
    end
  end

  # GET /outlays/1/edit
  def edit
    @outlay = Outlay.find(params[:id])
  end

  # POST /outlays
  # POST /outlays.json
  def create
    @outlay = Outlay.new(params[:outlay])

    respond_to do |format|
      if @outlay.save
        format.html { redirect_to @outlay, notice: 'Outlay was successfully created.' }
        format.json { render json: @outlay, status: :created, location: @outlay }
      else
        format.html { render action: "new" }
        format.json { render json: @outlay.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /outlays/1
  # PUT /outlays/1.json
  def update
    @outlay = Outlay.find(params[:id])

    respond_to do |format|
      if @outlay.update_attributes(params[:outlay])
        format.html { redirect_to @outlay, notice: 'Outlay was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @outlay.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outlays/1
  # DELETE /outlays/1.json
  def destroy
    @outlay = Outlay.find(params[:id])
    @outlay.destroy

    respond_to do |format|
      format.html { redirect_to outlays_url }
      format.json { head :no_content }
    end
  end

  def outlays_to_excel_format
    @outlays = Outlay.all
    respond_to do |format|
      format.html
      format.csv { send_data @outlays.to_csv }
      format.xls
    end
  end

  def sort_options
    if params[:selected].present?
      res = SortOption.find_or_create_by_user_id(current_user.id)
      res.update_attribute(:outlays, params[:selected])
    end
    redirect_to outlays_path
  end

end
