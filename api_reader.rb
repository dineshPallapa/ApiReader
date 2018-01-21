# Include this ruby module in any class and pass filename with path as an argument to get_json_file_path method
require 'json'

module UseApiLayer

  class ReadApiAndPrint

    def get_json_file_path(filename)
      read_json_file = File.read(filename)
      @convert_json_to_hash = JSON.parse(read_json_file)
      requested_data
    end

    def requested_data
      "phone_number: #{phone_number} email_address: #{email_address} full_name: #{full_name} product_name: #{product_name}"
    end

    private
    def phone_number
      @convert_json_to_hash["data"]["attributes"]["contact-number"]
    end

    def email_address
      @convert_json_to_hash["data"]["attributes"]["email-address"]
    end

    def full_name
      @convert_json_to_hash["data"]["attributes"]["title"] + " " + @convert_json_to_hash["data"]["attributes"]["first-name"] + " "+ @convert_json_to_hash["data"]["attributes"]["last-name"]
    end

    def product_name
      @convert_json_to_hash["included"][2]["attributes"]["name"]
    end
  end
end
