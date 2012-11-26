# encoding: utf-8
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
  #validates :email, :surname, :name, :middle_name, presence: true

  def fio
    if self.try(:surname)
      self.try(:surname)  + " " +  	self.try(:name) + " " + self.try(:middle_name)
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

  def self.receive_mail(message)
    array_hash = []
    array_info = message.body.decoded
    array_hash = array_info.split(";")

    array_hash.pop

    fio = array_hash[0].split(":.").last.split(" ")
    surname = fio[0]
    name = fio[1]
    middle_name = fio[2]

    email = array_hash[1].split(":").last
    phone = array_hash[2].split(":").last
    school = array_hash[3].split(":").last
    vk_page = array_hash[4].split(":").last

    subjects = array_hash[5].split(":").last.split(",").delete_if{|x| x == " "}.sort
    subjects.delete_at(0)
    subjects = subjects.join(", ")

    Client.create surname: surname, name: name, middle_name: middle_name, email: "tester@yandex.ru", phone: phone, school: school, idvk: vk_page, subjects: subjects
  end

end
