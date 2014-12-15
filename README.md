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

### 1. Initial Setup
To use Urbanairship, set your Urbanairship application_key, application_secret and master_secret.
```ruby
Urbanairship.application_key = '...'
Urbanairship.application_secret = '...'
Urbanairship.master_secret = '...'
```

### 2. Device Registration

#### 2.1 Device Token Registration
To register an iOS device token:
```ruby
Urbanairship::DeviceToken.register("<device_token>")
```

To delete an iOS device token:
```ruby
Urbanairship::DeviceToken.delete("<device_token>")
```


#### 2.2 APID Registration
To register an Android APID:
```ruby
Urbanairship::APID.register("<apid>")
```

To delete an Android APID:
```ruby
Urbanairship::APID.delete("<apid>")
```


### 3. Push Objects
Create a new push object:
```ruby
push_object = Urbanairship::PushObject.create(
  push_token: '...',
  message: '...'
)
```

To send a push notification:
```ruby
response = push_object.send
```

Perform method chaining:
```ruby
repsonse = Urbanairship::PushObject.create
             .push_token("< device_token | apid >")
             .message("Welcome to Github")
             .send
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/urbanairship-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
