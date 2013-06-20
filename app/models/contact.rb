require_relative '../../db/config'

class Contact < ActiveRecord::Base
  validates :company, :presence => true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
  validates_format_of :phone, :with => /\(?\d{3}\)?-?\s?\d{3}\-\d{4}/

  def initialize
    @first_name = hash[:first_name]
    @last_name = hash[:last_name]
    @company = hash[:company]
    @phone = hash[:phone]
    @email = hash[:email]
  end

  def name
    first_name + " " + last_name
  end

  def area_code
    phone.to_s.scan(/^\d{3}/).join
  end
  
  def self.add_contact(argument)
    Contact.create
  end
end

person = Contact.find(1)

p person.name
p person.area_code

person = Contact.new({'hammy', 'sammy', 'las vegas', 8384858483, 'jddj@liljdlkgg.com'})
