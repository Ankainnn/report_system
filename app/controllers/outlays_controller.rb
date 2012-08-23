# -*- encoding : utf-8 -*-
class OutlaysController < ApplicationController
  # GET /outlays
  # GET /outlays.json
  before_filter :active_user
  def index
    @outlays = Outlay.all

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
end
