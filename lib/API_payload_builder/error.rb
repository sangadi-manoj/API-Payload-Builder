module APIPayloadBuilder
  class Error
    DEFAULT_ERROR_TYPE = 'invalidResponse'
    KEY_INCLUDE_IN_VALUE = false

    def self.failure(response, type = DEFAULT_ERROR_TYPE, inculde = KEY_INCLUDE_IN_VALUE)
      {
        status: 'failed',
        status_code: type,
        code: set_code(type),
        errors: build_error_response(response)
      }
    end

    def self.build_error_response(response)
      errors = []
      response.each do |key, value|
        errors << (parse_error(key, value))
      end

      errors.flatten
    end

    def self.parse_error(key, value)
      return [] if key.nil? || key.to_s.strip.empty?

      if value.is_a?(Hash)
        puts "Inside hash condition"
        value.map { |k, val| { field: k.to_s, msg: "#{k.to_s.capitalize.titleize} #{format_value(val)}" } }
      elsif value.is_a?(Array)
        puts "Inside array condition"
        value.map { |var| { field: key.to_s, message: key.to_s.capitalize.titleize + ' ' +  format_value(var) } }
      else
        puts "Inside else condition"
        { field: key.to_s, msg: key.to_s.capitalize.titleize + ' ' + format_value(value) }
      end
    end

    def self.format_hash
    end

    def self.format_value(value)
      value.is_a?(Array) ? value.join(',') : value.to_s
    end

    def self.set_code(error)
      codes = {
        'paramValidation' => 400,
        'invalidResponse' => 400,
        'dataNotFound' => 404,
        'dataInvalid' => 422,
        'internalServerError' => 500,
        'forbidden' => 403,
        'unauthorise' => 401,
      }
      codes[error]
    end
  end
end
