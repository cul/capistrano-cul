# Capistrano::Cul

Capistrano v3 tasks shared across CUL projects.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano-cul', git: 'https://github.com/cul/capistrano-cul'
```

_Note:_ If installing in a rails application, should only be in `:development` and `:test` groups.


And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-cul

In your application's `Capfile` include:

```
require 'capistrano/cul'
```

## Usage
Two tasks are provided as part of this gem:
1. `cap {env} cul:auto_tag`

   Tags the current commit as the version number provided in `VERSION`.
2. `cap {env} cul:downtime`

   Pulls down the downtime branch of the repository to a `/downtime` directory and symlinks `current` to `downtime`. To undo this action, redeploy your application.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cul/capistrano-cul.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
