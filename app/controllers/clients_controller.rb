# -*- encoding : utf-8 -*-
class ClientsController < ApplicationController
include ApplicationHelper
  # GET /clients
  # GET /clients.json
  #before_filter :active_user
before_filter :only_admin_and_user, only: [:destroy, :edit, :update, :new, :create]
  def index
    if params[:id].present?
      @client = Client.find_by_id(params[:id])
    end
    res = SortOption.find_by_user_id(current_user.id)
    @current_user = current_user.id
    @options = [['статус', 'status_id'],
                ['дата', 'date'],
                ['источник', 'resource_id'],
                ['фамилия','surname'],
                ['телефон','phone'],
                ['email','email'],
                ['vk(id)','idvk'],
                ['школа','school'],
                ['родитель','parent'],
                ['телефон родителя','parent_phone'],
                ['район','channel_id'],
                ['менеджер','manager_id'],
                ['день','day'],
                ['время','time'],
                ['продолжительность','period'],
                ['ожидаемое начало','presumed_start'],
                ['офис','office_id'],
                ['комментарий','comment'],
                ['создано','created_at'],
                ['создал','author'],
                ['отредактировано','updated_at'],
                ['редактировал','editor']]
    if res && res.clients.present?
      @prompt = @options.rassoc(res.clients).first
      @options.delete_if{|x| x.last == res.clients}
      @clients = Client.order("#{res.clients} ASC").order("created_at DESC").page(params[:page]).per(50)
    else
      @prompt = 'варианты'
      @clients = Client.order("created_at DESC").page(params[:page]).per(50)
    end


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clients }
      format.js
    end
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @client = Client.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @client }
    end
  end

  # GET /clients/new
  # GET /clients/new.json
  def new
    @client = Client.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @client }
    end
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(params[:client])
    flag = true
    if params[:day].present?
      days = params[:day]
      times=[]

      (0..6).each do |i|
        if params[:hour][i].present? && params[:minute][i].present?
          times << "#{params[:hour][i]}:#{ params[:minute][i]}"
        end
      end

      if days.count == times.count
        @client.time = times.join(", ")
        @client.day = days.join(", ")
      elsif times.blank? && days
        @client.day = days.join(", ")
      else
        flag = false
      end
    end

      respond_to do |format|
        if @client.save && flag == true
          format.html { redirect_to @client, notice: 'Client was successfully created.' }
          format.json { render json: @client, status: :created, location: @client }
        else
          format.html { render action: "new" }
          format.json { render json: @client.errors, status: :unprocessable_entity }
        end
      end
  end

  # PUT /clients/1
  # PUT /clients/1.json
  def update
    @client = Client.find(params[:id])

    flag = true
    if params[:day].present?
      days = params[:day]
      times=[]

      (0..6).each do |i|
        if params[:hour][i].present? && params[:minute][i].present?
          times << "#{params[:hour][i]}:#{ params[:minute][i]}"
        end
      end

      if days.count == times.count
        @client.time = times.join(", ")
        @client.day = days.join(", ")
      elsif times.blank? && days
        @client.day = days.join(", ")
        @client.time = nil
      else
        flag = false
      end
    end



    respond_to do |format|
      if @client.update_attributes(params[:client]) && @client.update_attribute(:editor, current_user.fio) && flag == true
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client = Client.find(params[:id])
    client_has_orders = @client.orders
    if client_has_orders.blank?
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_url }
      format.json { head :no_content }
    end
    else
    redirect_to clients_path, notice: "Удалить данного клиента нельзя, на клиенте записаны договоры"
    end
  end

  def clients_to_excel_format
    @clients = Client.all
    respond_to do |format|
      format.html
      format.csv { send_data @clients.to_csv }
      format.xls
    end
  end

  def sort_options
    if params[:selected].present?
      res = SortOption.find_or_create_by_user_id(current_user.id)
      res.update_attribute(:clients, params[:selected])
    end
    redirect_to clients_path
  end

end
