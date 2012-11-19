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
    client_id = []
    schedules_id = []

    Payment.includes(:order).each do |p|
      client_id << p.order.client_id if p.order_id.present?
    end

    uniq_client_id = client_id.uniq

    @collect_c = Client.includes(:orders).where(id: uniq_client_id)


    @payment = Payment.new
    #if params[:client] если ФИО не уникальное значение
    client = Client.first #find(params[:client].split(" ").first.to_i)
    @res= client.courses
    #end
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
