require 'active_record'
require_relative '../app/models/contact.rb'
require 'faker'

ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => "#{File.dirname(__FILE__)}/../db/ar-address.sqlite3")
