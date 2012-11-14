# -*- encoding : utf-8 -*-
class ClientsController < ApplicationController
include ApplicationHelper
  # GET /clients
  # GET /clients.json
  before_filter :active_user
  def index
    @clients = Client.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clients }
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
    @collect_hour = range_format((0..23))
    @collect_minute = range_format((0..59))
    @collect = %w(понедельник вторник среда четверг пятница суббота воскресение )
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
    times =[]
    days = params[:day]
    (0..6).each do |i|
      if params[:hour][i].present? && params[:minute][i].present?
        times<< "#{params[:hour][i]}:#{ params[:minute][i]}"
      end
    end
    days = days.collect{|x| x + " | #{times[days.index(x)]}"}
    days = days.join(", ")
    @client = Client.new(params[:client])
    @client.daysandtime = days

    respond_to do |format|
      if @client.save
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

    respond_to do |format|
      if @client.update_attributes(params[:client])
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
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_url }
      format.json { head :no_content }
    end
  end

  def date_to_excel_format
    @clients = Client.all
    respond_to do |format|
      format.html
      format.csv { send_data @clients.to_csv }
      format.xls
    end
  end

end
