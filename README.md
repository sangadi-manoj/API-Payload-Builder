# APIPayloadBuilder

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'API_payload_builder'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install API_payload_builder

## Usage

Success response => $ APIPayloadBuilder::Success.build(response, message)
        *note: - message is by default set to success
               - status code will always be 200 

        success response example ->  APIPayloadBuilder::Success.build({ users: [ name: 'Manoj Nandha Sangadi' ] }, "users fetched")

        response -> { message: "users fetched", data: { users: [ name: 'Manoj Nandha Sangadi' ] }, code: 200}

    Failure response => $ APIPayloadBuilder::Error.failure(response, error_type)
        *note: - response should always be in json object { key: value } / { key: { nested_key: value} } / { key: [value] }

        error_type should be any from the below list => 
                1. paramValidation
                2. invalidResponse
                3. dataNotFound
                4. dataInvalid
                5. internalServerError 
        based on these error types status code will be setup.

        by default error type was setup to 'invalidResponse' it will always set status code to 400
          paramValidation will status code to set 400
          dataNotFound will set status code to 404
          dataInvalid will set status code to 422
          internalServerError will set status code to 500

        example error response -> APIPayloadBuilder::Error.failure({name: ["is missing"], :mobile=>["is missing"], :registered_address=>["is missing"], :activity_status=>["is missing"] }, 'invalidResponse')

        response -> { status: "failed",
                      status_code: "invalidResponse",
                      code: 400,
                      errors:
                          [
                            { field: "name", msg: "Name is missing" },
                            { field: "mobile", msg: "Mobile is missing" },
                            { field: "registered_address", msg: "Registered Address is missing" },
                            { field: "activity_status", msg: "Activity Status is missing"},
                            { field: "pincode", msg: "Pincode is missing" }
                          ]
                    }


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sangadi-manoj/API-Payload-Builder. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the APIPayloadBuilder project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/sangadi-manoj/API-Payload-Builder/blob/master/CODE_OF_CONDUCT.md).
