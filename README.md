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

Quick Start
-----------

In your model:

```ruby
  class User < ActiveRecord::Base
    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  end
```

In your migrations:

```ruby
class AddAvatarRotationToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :avatar, :integer
  end

  def self.down
    remove_column :users, :avatar
  end
end
```

(Or you can use migration generator: rails generate paperclip_rotation user avatar)

In your code:

```ruby
@user = User.find( params[:id] )
@user.image.rotate!
```

Contributing
------------

Checkout out CONTRIBUTING for more info.
