class ObjectsOfExpendituresController < ApplicationController
  # GET /objects_of_expenditures
  # GET /objects_of_expenditures.json
  def index
    @objects_of_expenditures = ObjectsOfExpenditure.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @objects_of_expenditures }
    end
  end

  # GET /objects_of_expenditures/1
  # GET /objects_of_expenditures/1.json
  def show
    @objects_of_expenditure = ObjectsOfExpenditure.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @objects_of_expenditure }
    end
  end

  # GET /objects_of_expenditures/new
  # GET /objects_of_expenditures/new.json
  def new
    @objects_of_expenditure = ObjectsOfExpenditure.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @objects_of_expenditure }
    end
  end

  # GET /objects_of_expenditures/1/edit
  def edit
    @objects_of_expenditure = ObjectsOfExpenditure.find(params[:id])
  end

  # POST /objects_of_expenditures
  # POST /objects_of_expenditures.json
  def create
    @objects_of_expenditure = ObjectsOfExpenditure.new(params[:objects_of_expenditure])

    respond_to do |format|
      if @objects_of_expenditure.save
        format.html { redirect_to @objects_of_expenditure, notice: 'Objects of expenditure was successfully created.' }
        format.json { render json: @objects_of_expenditure, status: :created, location: @objects_of_expenditure }
      else
        format.html { render action: "new" }
        format.json { render json: @objects_of_expenditure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /objects_of_expenditures/1
  # PUT /objects_of_expenditures/1.json
  def update
    @objects_of_expenditure = ObjectsOfExpenditure.find(params[:id])

    respond_to do |format|
      if @objects_of_expenditure.update_attributes(params[:objects_of_expenditure])
        format.html { redirect_to @objects_of_expenditure, notice: 'Objects of expenditure was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @objects_of_expenditure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /objects_of_expenditures/1
  # DELETE /objects_of_expenditures/1.json
  def destroy
    @objects_of_expenditure = ObjectsOfExpenditure.find(params[:id])
    @objects_of_expenditure.destroy

    respond_to do |format|
      format.html { redirect_to objects_of_expenditures_url }
      format.json { head :no_content }
    end
  end
end
