# Today

  Easy fetch today's happen from database, array

## Installation

Add this line to your application's Gemfile:

    gem 'today'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install today

## Usage
###ActiveRecord
    Post.today
    Post.today(:updated_at)
    Post.today(:created_at, Time.now)
    Post.today(at: Time.now)
    Post.today(key: updated_at, at: Time.now)
###Array
    Post.all.to_a.today
    Post.all.to_a.today(:updated_at)
    Post.all.to_a.today(:created_at, Time.now)
    Post.all.to_a.today(at: Time.now)
    Post.all.to_a.today(key: updated_at, at: Time.now)

## Contributing

1. Fork it ( https://github.com/[my-github-username]/today/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
