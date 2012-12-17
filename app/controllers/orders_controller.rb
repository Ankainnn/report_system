# -*- encoding : utf-8 -*-
class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.json
  skip_before_filter :verify_authenticity_token
  before_filter :active_user
  before_filter :only_admin_and_user, only: [:destroy, :edit, :update, :new, :create]
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
    @client_collection = Client.where("status_id != ? AND status_id != ?", 11, 13)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  def search_optionss
    if params[:course_id].present?
      t_collect = Course.find(params[:course_id]).teachers
      @t_select_list = []
      t_collect.each do |t|
          @t_select_list << t if t.schedules.where(course_id: params[:course_id]).present?
      end

      if params[:teacher_id].present?
        @s_select_list = Teacher.find(params[:teacher_id]).schedules.where(course_id: params[:course_id])

        if params[:schedule_id].present?
          @office = Schedule.find(params[:schedule_id]).office
        end

      end
    end
    respond_to do |format|
      format.html # new.html.erb
      format.js
    end

  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
    @client_collection = Client.where("status_id != ? AND status_id != ?", 11, 13)
    @sts = Status.all.to_a
    @sts.delete(Status.where(:name => "Договор"))
    @sts.delete(Status.where(:name => "Отказ"))
    @sts.collect!{|s| s.id}
    @cls = Client.where(:status_id => @sts)
    @t_select_list = Teacher.where(id: @order.teacher_id)
    @s_select_list = Schedule.where(id: @order.schedule_id)
    @f_select_list = Office.where(id: @order.office_id)
    @client = Client.find(@order.client_id).fi_and_phone
    #<%= render 'form' %>
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])
    @client_collection = Client.where("status_id != ? AND status_id != ?", 11, 13)
    if params[:client].present? && params[:client].split(" - ").count == 2

    phone = params[:client].split(" - ").last

    client = Client.find_by_phone(phone)
    @current_client = client.fi_and_phone

    course = Course.find(params[:order][:course_id]) if params[:order][:course_id].present?

    @order.client_id = client.id
    @order.author = current_user.fio
    @order.teacher_id = params[:teacher_id].first if params[:teacher_id].present?
    @order.schedule_id = params[:schedule_id].first if params[:schedule_id].present?
    @order.office_id = params[:office_id].first if params[:office_id].present?

    respond_to do |format|
      if @order.save
        client.update_attribute(:status_id, 15)
        if client.courses.blank?
          client.courses<<course
        else
          unless client.courses.exists?(params[:order][:course_id])
            client.courses<<course
          end
        end
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        #format.html { redirect_to new_order_path}
        format.html { render action: "new"}
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
    else
      render action: "new"
      #notice: "поле 'клиент обезательно для заполнения'"
    end

  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    #render text: params
    @order = Order.find(params[:id])

    @t_select_list = Teacher.where(id: @order.teacher_id)
    @s_select_list = Schedule.where(id: @order.schedule_id)
    @f_select_list = Office.where(id: @order.office_id)
    @client = Client.find(@order.client_id).fi_and_phone

    @client_collection = Client.where("status_id != ? AND status_id != ?", 8, 9)
    if ((params[:teacher_id].present? || params[:order][:teacher_id].present?) && (params[:schedule_id].present? || params[:order][:schedule_id].present?) && (params[:office_id].present? || params[:order][:office_id].present?))
    if params[:client].present? && params[:client].split(" - ").count == 2
    phone = params[:client].split(" - ").last
    client = Client.find_by_phone(phone)


    res = Order.find(params[:id]).course.id

    old_record = Course.find(res)

    client.courses.delete(old_record)

    new_record = Course.find(params[:order][:course_id])
    client.courses<<new_record


    @order.author = current_user.fio
    @order.client_id = client.id
    if params[:teacher_id].present? && params[:schedule_id].present? && params[:office_id].present?
    @order.teacher_id = params[:teacher_id].first# if params[:teacher_id].present?
    @order.schedule_id = params[:schedule_id].first# if params[:schedule_id].present?
    @order.office_id = params[:office_id].first# if params[:office_id].present?
    end

    respond_to do |format|
      if @order.update_attributes(params[:order])  && @order.update_attribute(:editor, current_user.fio)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to edit_order_path(@order) }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
    else
    redirect_to edit_order_path(@order), notice: "поле 'клиент обезательно для заполнения'"
    end
    else
      respond_to do |format|
          format.html { render action: 'edit'}
          format.json { render json: @order.errors, status: "не достаточно данных, убедитесь что поля 'преподаватель', 'расписание', 'офис' - заполнены" }
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
