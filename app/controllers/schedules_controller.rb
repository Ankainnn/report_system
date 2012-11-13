# -*- encoding : utf-8 -*-
class SchedulesController < ApplicationController
include ApplicationHelper
  # GET /schedules
  # GET /schedules.json
  before_filter :active_user
  def index
    @schedules = Schedule.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @schedules }
    end
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
    @schedule = Schedule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @schedule }
    end
  end

  # GET /schedules/new
  # GET /schedules/new.json
  def new
    @collect_hour = range_format((0..23))
    @collect_minute = range_format((0..59))
    @collect = %w(понедельник вторник среда четверг пятница суббота воскресение )
    @schedule = Schedule.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @schedule }
    end
  end

  # GET /schedules/1/edit
  def edit
    @collect = %w(понедельник вторник среда четверг пятница суббота воскресение )
    @schedule = Schedule.find(params[:id])
  end

  # POST /schedules
  # POST /schedules.json
  def create
    times =[]
    days = params[:day].join(", ") if params[:day]
    (0..6).each do |i|
      if params[:hour][i].present? && params[:minute][i].present?
      times<< "#{params[:hour][i]}:#{ params[:minute][i]}"
      end
    end
    times =  times.join(", ")
    @schedule = Schedule.new(params[:schedule])
    @schedule.day = days
    @schedule.time = times

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
        format.json { render json: @schedule, status: :created, location: @schedule }
      else
        format.html { render action: "new" }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /schedules/1
  # PUT /schedules/1.json
  def update
    @schedule = Schedule.find(params[:id])

    respond_to do |format|
      if @schedule.update_attributes(params[:schedule])
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy

    respond_to do |format|
      format.html { redirect_to schedules_url }
      format.json { head :no_content }
    end
  end

  def schedules_to_excel_format
    @schedules = Schedule.all
    respond_to do |format|
      format.html
      format.csv { send_data @schedules.to_csv }
      format.xls
    end
  end
end
