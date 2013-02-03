paperclip_rotation
==================

Paperclip Rotation add rotation feature to your Paperclip

Installation
------------

Install the gem:

```
gem install paperclip_rotation
```

Or even better, add it to your Gemfile.

```
source "https://rubygems.org"
gem 'paperclip_rotation'
```

Dependencies:
* Paperclip

Usage
-----

```ruby
  class User < ActiveRecord::Base
    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  end
  user = User.new
  user.image = 'image_path'
  user.image.rotate!
```

Contributing
------------

Checkout out CONTRIBUTING for more info.
