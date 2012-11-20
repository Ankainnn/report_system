# -*- encoding : utf-8 -*-
class PaymentsController < ApplicationController
  # GET /payments
  # GET /payments.json
  skip_before_filter :verify_authenticity_token
  before_filter :active_user
  def index
    @payments = Payment.all
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

    client_id = []

    Order.all.each do |order|
      client_id << order.client_id
    end
    uniq_client_id = client_id.uniq

    @collect_c = Client.where(id: uniq_client_id)


    if params[:client] #если ФИО не уникальное значение
      client = params[:client].split(" ")
      session[:client]= Client.where(surname: client[0], name: client[1], middle_name: client[2]).first
    end

    if params[:course]
      if params[:course][0].present?
      session[:course] = Course.find(params[:course][0])
      else
      session[:course] = nil
      end
    end

    if session[:client].present? && session[:course].present?
      @order = Order.where(client_id: session[:client].id, course_id: session[:course]).first
      if @order.present?
        @order_number = @order.id
        @schedule = @order.schedule.graphic
        #session[:client] = nil
        #session[:course] = nil

      end
    end

    @res = Client.first.courses
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @payments }
      format.js
    end
  end

  # GET /payments/1/edit
  def edit
    @payment = Payment.find(params[:id])
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = Payment.new(params[:payment])

    respond_to do |format|
      if @payment.save
        session[:client] = nil
        session[:course] = nil
        format.html { redirect_to @payment, notice: 'Payment was successfully created.' }
        format.json { render json: @payment, status: :created, location: @payment }
      else
        format.html { render action: "new" }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /payments/1
  # PUT /payments/1.json
  def update
    @payment = Payment.find(params[:id])

    respond_to do |format|
      if @payment.update_attributes(params[:payment])
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
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


end
