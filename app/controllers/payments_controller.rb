# -*- encoding : utf-8 -*-
class PaymentsController < ApplicationController
  # GET /payments
  # GET /payments.json
  skip_before_filter :verify_authenticity_token
  before_filter :active_user
  before_filter :only_admin_and_user, only: [:destroy, :edit, :update, :new, :create]
  def index
    res = SortOption.find_by_user_id(current_user.id)
    @current_user = current_user.id
    @options = [['дата', 'date'],
                ['сумма', 'summ'],
                ['форма оплаты','type'],
                ['договор','order_id'],
                ['начало','start'],
                ['конец','end'],
                ['оплата с','pay_from'],
                ['оплата по','pay_to'],
                ['создано','created_at'],
                ['отредактировано','updated_at']]
    if res
      if res.payments.present?
        @payments = Payment.order("#{res.payments} ASC")
      else
        @payments = Payment.all
      end
    else
      @payments =  Payment.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @payments }
    end
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
    @payment = Payment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @payment }
    end
  end

  # GET /payments/new
  # GET /payments/new.json
  def new
    @payment = Payment.new

    @collect_c = collect_c

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @payments }
      format.js
    end
  end


  def search_options
    phone = params[:client].split(" - ").last
    client = Client.find_by_phone(phone)
    @client_id = client.id
    @client_courses = Client.find(@client_id).courses
    if params[:course_id].present?
    @current_order =  client.orders.where("course_id = ?", params[:course_id]).first
    if @current_order.present?
    @schedule = @current_order.schedule.graphic
    @order_number = @current_order.number
    @office = @current_order.office.try(:name)
    @order_id = @current_order.id
    end
    end
    respond_to do |format|
      format.html
      format.js
    end
  end


  # GET /payments/1/edit
  def edit
    @payment = Payment.find(params[:id])

    client_id = []
    Order.all.each do |order|
      client_id << order.client_id
    end
    uniq_client_id = client_id.uniq

    @collect_c = Client.where(id: uniq_client_id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @payments }
      format.js
    end
  end

  # POST /payments
  # POST /payments.json
  def create
    @collect_c = collect_c
    @payment = Payment.new(params[:payment])
    if params[:client].present?
    @payment.client = Client.find_by_phone(params[:client].split(" - ").last).fio
    end
    if params[:course_id].first.present?
    @payment.course = Course.find(params[:course_id].first).name
    end
    @payment.schedule = params[:schedule].first if params[:schedule].present?
    @payment.office = params[:office].first if params[:office].present?

    respond_to do |format|
      if @payment.save
        format.html { redirect_to @payment, notice: 'Payment was successfully created.' }
        format.json { render json: @payment, status: :created, location: @payment }
        format.js
      else
        format.html { render 'new'}
        format.json { render json: @payment.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /payments/1
  # PUT /payments/1.json
  def update
    @payment = Payment.find(params[:id])
    @collect_c = collect_c

    if params[:client].present? && params[:course_id].present? && params[:schedule].present? && params[:office].present?
    @payment.client = Client.find_by_phone(params[:client].split(" - ").last).fio
    if params[:course_id].first.present?
      @payment.course = Course.find(params[:course_id].first).name
    end
    @payment.schedule = params[:schedule].first
    @payment.office = params[:office].first

    respond_to do |format|
      if @payment.update_attributes(params[:payment])
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
    else
      render action: "edit"
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to payments_url }
      format.json { head :no_content }
    end
  end

  def payments_to_excel_format
    @payments = Payment.all
    respond_to do |format|
      format.html
      format.csv { send_data @paiments.to_csv }
      format.xls
    end
  end

  def sort_options
    if params[:selected].present?
      res = SortOption.find_or_create_by_user_id(current_user.id)
      res.update_attribute(:payments, params[:selected])
    end
    redirect_to payments_path
  end
end
