# A Demo for using this ApiReader libray
require './api_reader'

class Customer
  include UseApiLayer

  def customer_json_filename(filename)
    UseApiLayer::ReadApiAndPrint.new.get_json_file_path(filename)
  end
end

p Customer.new.customer_json_filename("collection.json")
