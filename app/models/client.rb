# encoding: utf-8
class Client < ActiveRecord::Base
  belongs_to :status
  belongs_to :resource
  belongs_to :channel
  belongs_to :manager
  belongs_to :office
  has_and_belongs_to_many :courses
  has_many :orders
  validates :email,
            :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i},
            :allow_blank => true
  validates :email, :surname, :name, :middle_name, :date, :course, presence: true

  def fio
    if self.try(:surname)
      "#{self.try(:surname)} #{self.try(:name)} #{self.try(:middle_name)}"
    else
      "#{self.try(:name)}"
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

  def self.receive(m, resource)
    mail = m.to_s
    array_hash = mail.split(";")

    array_hash.pop

    fio = array_hash[0].split(":.").last.split(" ")
    surname = fio[0]
    name = fio[1]
    middle_name = fio[2]

    email = array_hash[1].split(":").last.lstrip
    phone = array_hash[2].split(":").last
    school = array_hash[3].split(":").last
    vk_page = array_hash[4].split(":").last

    subjects = array_hash[5].split(":").last.split(",").delete_if{|x| x == " "}.sort
    subjects.delete_at(0)
    #subjects = subjects.collect{|x| r + x}.first
    subjects = subjects.join(", ")

    Client.create surname: surname, name: name, middle_name: middle_name, email: email, phone: phone, school: school, idvk: vk_page, course: subjects, resource_id: resource, date: Time.now.strftime('%d-%m-%Y')
  end

end
