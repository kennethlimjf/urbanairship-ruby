# Urbanairship::Ruby

Ruby binding for Urbanairship

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'urbanairship-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install urbanairship-ruby

## Usage

To use Urbanairship, set your Urbanairship application_key, application_secret and master_secret.

```ruby
client = Urbanairship.new({
  application_key: ENV['URBANAIRSHIP_APP_KEY'],
  application_secret: ENV['URBANAIRSHIP_APP_SECRET'],
  master_secret: ENV['URBANAIRSHIP_MASTER_SECRET']
})
```

Create a new push object, set message, add extra params and send.
```ruby
push_object = client.push_object(device_token: '...', message: '...')

push_object.message('Urbanairship is here!')
push_object.message         # "Urbanairship is here!"

push_object.add_params({
  key1: 'value1',
  key2: 'value2',
  key3: 'value3'
})

push_object.to_json         # { ... }

push_object.send            # Sends payload to Urbanairship API
```

Perform method chaining
```ruby
client.push_object(device_token: '...', message: '...')
      .add_params({key1: 'value1'})
      .send
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/urbanairship-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
