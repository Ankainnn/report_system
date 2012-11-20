# -*- encoding : utf-8 -*-
class Client < ActiveRecord::Base
  belongs_to :status
  belongs_to :resource
  belongs_to :channel
  belongs_to :manager
  belongs_to :office
  has_and_belongs_to_many :courses
  has_many :orders
  validates_format_of :email,
                      :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                      :message => 'E-mail адресс введен не коректно'
  validates :email, presence: true

  def fio
    if self.try(:surname)
    	self.try(:name) + " " + self.try(:surname)
    else
    	self.try(:name)
    end
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
     each do |client|
        csv << client.attributes.values_at(*column_names)
      end
    end
  end

  def autocomplete
    self.name   + " " +    self.surname
  end


end
