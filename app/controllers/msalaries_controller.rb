# -*- encoding : utf-8 -*-
class MsalariesController < ApplicationController
  # GET /msalaries
  # GET /msalaries.json
  before_filter :active_user
  helper_method :sort_column, :sort_direction
  def index
    @msalaries = Msalary.order(sort_column + ' ' + sort_direction)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @msalaries }
    end
  end

  # GET /msalaries/1
  # GET /msalaries/1.json
  def show
    @msalary = Msalary.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @msalary }
    end
  end

  # GET /msalaries/new
  # GET /msalaries/new.json
  def new
    @msalary = Msalary.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @msalary }
    end
  end

  # GET /msalaries/1/edit
  def edit
    @msalary = Msalary.find(params[:id])
  end

  # POST /msalaries
  # POST /msalaries.json
  def create
    @msalary = Msalary.new(params[:msalary])

    respond_to do |format|
      if @msalary.save
        format.html { redirect_to @msalary, notice: 'Msalary was successfully created.' }
        format.json { render json: @msalary, status: :created, location: @msalary }
      else
        format.html { render action: "new" }
        format.json { render json: @msalary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /msalaries/1
  # PUT /msalaries/1.json
  def update
    @msalary = Msalary.find(params[:id])

    respond_to do |format|
      if @msalary.update_attributes(params[:msalary])
        format.html { redirect_to @msalary, notice: 'Msalary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @msalary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /msalaries/1
  # DELETE /msalaries/1.json
  def destroy
    @msalary = Msalary.find(params[:id])
    @msalary.destroy

    respond_to do |format|
      format.html { redirect_to msalaries_url }
      format.json { head :no_content }
    end
  end

  private
  def sort_column
    Order.column_names.include?(params[:sort]) ? params[:sort] : "date"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
end
