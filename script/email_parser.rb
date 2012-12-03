#!/usr/bin/env ruby
# encoding: utf-8
require "rubygems"
require "bundler/setup"
require 'gmail'
require "mailman"
require 'active_record'
require 'yaml'
require_relative '../app/models/client'
require_relative '../app/models/mail_box'


dbconfig = YAML::load(File.open(File.join(File.dirname(__FILE__), 'database.yml')))

#ActiveRecord::Base.logger = Logger.new(STDERR) # Simple logging utility. logger.rb -- standart lib

ActiveRecord::Base.establish_connection(dbconfig)
Mailman.config.logger = Logger.new("log/parser.log")


mailboxes = MailBox.all

begin

  mailboxes.each do |mail_box|
    Gmail.new("#{mail_box.email}", "#{mail_box.password}").inbox.emails(:unread).each do |m|
      begin
        Client.receive(m.body, mail_box.resource_id)
        m.mark(:read)
      rescue => a
        Mailman.logger.error "Письмо от #{m.from} не пригодно для обработки. Ошибка: #{a}"
      end
    end
  end

rescue Exception => e

  puts "#{e}"

end