#!/usr/bin/env ruby
# encoding: utf-8
require "rubygems"
require "bundler/setup"
require 'gmail'
require 'active_record'
require 'yaml'
require_relative '../app/models/client'
require_relative '../app/models/mail_box'


dbconfig = YAML::load(File.open(File.join(File.dirname(__FILE__), 'database.yml')))

#ActiveRecord::Base.logger = Logger.new(STDERR) # Simple logging utility. logger.rb -- standart lib

ActiveRecord::Base.establish_connection(dbconfig)


mailboxes = MailBox.all

begin

  mailboxes.each do |mail_box|
    Gmail.new("#{mail_box.email}", "#{mail_box.password}").inbox.emails(:unread, :from => "yourprof@cc-srv").each do |m|
      Client.receive(m.body, mail_box.resource)
      m.mark(:read)
    end
  end

rescue Exception => e

  puts "#{e}"

end