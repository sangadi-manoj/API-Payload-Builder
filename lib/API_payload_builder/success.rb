module APIPayloadBuilder
  class Success
    DEFAULT_MESSAGE = 'success'

    def self.build(response, message = DEFAULT_MESSAGE)
      {
        message: message,
        data: response,
        code: 200
      }
    end
  end
end