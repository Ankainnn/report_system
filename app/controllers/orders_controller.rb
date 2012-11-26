# -*- encoding : utf-8 -*-
class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.json
  before_filter :active_user
  def index
    res = SortOption.find_by_user_id(current_user.id)
    @current_user = current_user.id
    @options = [['номер', 'number'],
                ['клиент', 'client_id'],
                ['дата','date'],
                ['дата заключения','contract'],
                ['курс','course_id'],
                ['преподаватель','teacher_id'],
                ['расписание','schedule_id'],
                ['офис','office_id'],
                ['начало','start'],
                ['конец','end'],
                ['скидка','discount'],
                ['цена','price'],
                ['создано','created_at'],
                ['создал','author'],
                ['отредактировано','updated_at'],
                ['редактировал','editor']]
    if res
      if res.orders.present?
        @orders = Order.order("#{res.orders} ASC")
      else
        @orders = Order.all
      end
    else
      @orders = Order.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new
    @sts = Status.all.to_a
    @sts.delete(Status.where(:name => "Договор"))
    @sts.delete(Status.where(:name => "Отказ"))
    @sts.collect!{|s| s.id}
    @cls = Client.where(:status_id => @sts)
    @client_collection = Client.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
    @client_collection = Client.all
    @sts = Status.all.to_a
    @sts.delete(Status.where(:name => "Договор"))
    @sts.delete(Status.where(:name => "Отказ"))
    @sts.collect!{|s| s.id}
    @cls = Client.where(:status_id => @sts)
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])
    fio = params[:client].split(" ")
    client = Client.where(surname: fio[0], name: fio[1], middle_name: fio[2]).first
    @order.client_id = client.id
    @order.author = current_user.user_nick

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end

  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])
    fio = params[:client].split(" ")
    client = Client.where(surname: fio[0], name: fio[1], middle_name: fio[2]).first
    @order.client_id = client.id
    @order.author = current_user.user_nick

    respond_to do |format|
      if @order.update_attributes(params[:order])  && @order.update_attribute(:editor, current_user.user_nick)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  def find_statuses
    @sts = Status.all.to_a
    @sts.delete(Status.where(:name => "Договор"))
    @sts.delete(Status.where(:name => "Отказ"))

  end

  #экшен вызывается при клике на кнопку "оплата по договору"
  def payment
    @order = Order.find(params[:id])
  end

  def orders_to_excel_format
    @orders = Order.all
    respond_to do |format|
      format.html
      format.csv { send_data @order.to_csv }
      format.xls
    end
  end

  def sort_options
    if params[:selected].present?
      res = SortOption.find_or_create_by_user_id(current_user.id)
      res.update_attribute(:orders, params[:selected])
    end
    redirect_to orders_path
  end

end
