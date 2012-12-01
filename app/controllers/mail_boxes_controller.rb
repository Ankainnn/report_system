# -*- encoding : utf-8 -*-
require "gmail"
class MailBoxesController < ApplicationController
  # GET /mail_boxes
  # GET /mail_boxes.json
  def index
    @mail_boxes = MailBox.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mail_boxes }
    end
  end

  # GET /mail_boxes/1
  # GET /mail_boxes/1.json
  def show
    @mail_box = MailBox.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mail_box }
    end
  end

  # GET /mail_boxes/new
  # GET /mail_boxes/new.json
  def new
    @mail_box = MailBox.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mail_box }
    end
  end

  # GET /mail_boxes/1/edit
  def edit
    @mail_box = MailBox.find(params[:id])
  end

  # POST /mail_boxes
  # POST /mail_boxes.json
  def create

    begin
    Gmail.new("#{params[:mail_box][:email]}", "#{params[:mail_box][:password]}").inbox.count
    @mail_box = MailBox.new(params[:mail_box])
    respond_to do |format|
      if @mail_box.save
        format.html { redirect_to @mail_box, notice: 'Mail box was successfully created.' }
        format.json { render json: @mail_box, status: :created, location: @mail_box }
      else
        format.html { render action: "new" }
        format.json { render json: @mail_box.errors, status: :unprocessable_entity }
      end
    end

    rescue => e
      redirect_to new_mail_box_path, notice: "не удалось установить соединенеи (email или пароль введены не верно)"
    end


  end

  # PUT /mail_boxes/1
  # PUT /mail_boxes/1.json
  def update

    begin

    @mail_box = MailBox.find(params[:id])
    Gmail.new("#{params[:mail_box][:email]}", "#{params[:mail_box][:password]}").inbox.count
    respond_to do |format|
      if @mail_box.update_attributes(params[:mail_box])
        format.html { redirect_to @mail_box, notice: 'Mail box was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mail_box.errors, status: :unprocessable_entity }
      end
    end

    rescue => e

      redirect_to edit_mail_box_path(@mail_box), notice: "не удалось установить соединенеи (email или пароль введены не верно)"

    end
  end


  # DELETE /mail_boxes/1
  # DELETE /mail_boxes/1.json
  def destroy
    @mail_box = MailBox.find(params[:id])
    @mail_box.destroy

    respond_to do |format|
      format.html { redirect_to mail_boxes_url }
      format.json { head :no_content }
    end
  end
end
