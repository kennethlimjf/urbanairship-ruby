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
Urbanairship.application_key = '<application_key>'
Urbanairship.application_secret = '<application_secret>'
Urbanairship.master_secret = '<master_secret>'
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
A push object describes everything about a push including the audience and push
payload. The audience, notification and device_type can be set on an
`Urbanairship::PushObject` instance.

#### 3.1 Audience
An audience selector determines the set of devices that a push will be delivered to.

##### 3.1.1 Audience - iOS
To create a new push object where the audience is a single iOS device:
```ruby
push_object = Urbanairship::PushObject.create(
  audience: { device_token: "<device_token>" },
  notification: { alert: "Welcome to Urbanairship!" }
)
```

To create a push object for multiple iOS devices:
```ruby
# An array of device token strings
dt_ary = ['<device_token_1>', '<device_token_2>', '<device_token_3>', ... ]

# Create an audience hash for all device tokens
device_tokens = Urbanairship::PushObject.device_tokens(dt_ary)

# Set audience in push object
push_object = Urbanairship::PushObject.create(
  audience: device_tokens,
  notification: { alert: "Welcome to Urbanairship!" }
)
```
##### 3.1.2 Audience - Android
To create a new push object where the audience is a single Android device:
```ruby
push_object = Urbanairship::PushObject.create(
  audience: { apid: "<apid>" },
  notification: { alert: "Welcome to Urbanairship!" }
)
```

To create a push object for multiple Android devices:
```ruby
# An array of APID strings
apid_ary = ['<apid_1>', '<apid_2>', '<apid_3>', ... ]

# Create an audience hash for all APIDs
apids = Urbanairship::PushObject.apids(apid_ary)

# Set audience in push object
push_object = Urbanairship::PushObject.create(
  audience: apids,
  notification: { alert: "Welcome to Urbanairship!" }
)
```

##### 3.1.3 Audience - iOS/Android
To create a push object for all iOS and Android devices:
```ruby
# An array of device token strings
dt_ary = ['<device_token_1>', '<device_token_2>', '<device_token_3>', ... ]

# An array of APID strings
apid_ary = ['<apid_1>', '<apid_2>', '<apid_3>', ... ]

# Create hash for iOS Device Tokens and Android APIDs
audience_ary = Urbanairship::PushObject.audience(
  apids: apid_ary,
  device_tokens: dt_ary
)

# Set audience in push object
push_object = Urbanairship::PushObject.create(
  audience: audience_ary,
  notification: { alert: "Welcome to Urbanairship!" }
)
```

##### 3.1.4 Audience - Others

To set audience using push object instance:
```ruby
# Push object instance
push_object = Urbanairship::PushObject.new

# Set audience as all
push_object.audience(:all)
                
# Set audience as tag
push_object.audience(tag: '<tag_name>')

# Set custom audience hash with compound selectors
push_object.audience({ 
  AND: [
    {
      OR: [
        tag3,
        tag4
      ]
    },
    tag5
  ]
})
```

### 4. Notification

The notification payload is a JSON object assigned to the "notification" attribute on a Push Object, which contains the actual contents to be delivered to devices.

At its simplest, the payload consists of a single string-valued attribute, "alert", which sends a push notification consisting of a single piece of text.

#### 4.1 Notification - Alert
An alert is a single piece of text that is displayed to the user in a push notification.
```ruby
push_object = Urbanairship::PushObject.create(
  audience: { device_token: "<device_token>" },
  notification: { alert: "Welcome to Urbanairship! This is a single piece of text." }
)
```

#### 4.2 Notification - Extras
An extra is a dictionary of string keys to arbitrary JSON values, included in a push object.
```ruby
# Generate extras for both iOS and Android
contents = Urbanairship::PushObject.notification(
             alert: "Congrats! You have just won a prize!",
             extra: {
               prize_id: 1,
               name: '$10 Coupon'
             }
           )

push_object = Urbanairship::PushObject.create(
  audience: { device_token: "<device_token>" },
  notification: contents
)
```



### 5. Push
To send a push notification:
```ruby
# Create push object
push_object = Urbanairship::PushObject.create(
  audience: audience_ary,
  notification: { alert: "Welcome to Urbanairship!" }
)

# Send push
response = Urbanairship::Push.push(push_object)
```

Perform method chaining:
```ruby
response = Urbanairship::PushObject.new
             .audience(:all)
             .notification(alert: "Hello World!")
             .push
```

## Contributing

1. Fork it ( https://github.com/kennethlimjf/urbanairship-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
