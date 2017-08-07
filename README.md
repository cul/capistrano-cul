# Capistrano::Cul

Capistrano v3 tasks shared across CUL projects.

This gem provides common cap tasks that are used in almost every cul project. It also includes a set of cap tasks and hooks that are specific for Wordpress deployments. Do not include the Wordpress library if you are not deploying a Wordpress site.

## Installation

### Install gem
Add this line to your application's Gemfile:

```ruby
gem 'capistrano-cul', git: 'https://github.com/cul/capistrano-cul'
```

_Note:_ If installing in a rails application, gem should only be installed in `:development` and `:test` groups.


And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-cul

### Add Cul::Capistrano tasks to `Capfile`
In your application's `Capfile` include:

```
require 'capistrano/cul'
```

For Wordpress deployments, in your application's `Capfile` additionally include:
```
require 'capistrano/cul'
require 'capistrano/cul/wp'
```

## Usage
### Shared cap tasks (part of `capistrano/cul`)
1. `cap {env} cul:auto_tag`

   Tags the current commit as the version number provided in `VERSION`.
2. `cap {env} cul:downtime`

   Pulls down the downtime branch of the repository to a `/downtime` directory and symlinks `current` to `downtime`. To undo this action, redeploy your application.

### Wordpress specific tasks (part of `capistrano/cul/wp`)
Tasks are provided to deploy, setup and update Wordpress instances.
1. `cap {env} cul:wp:setup`
2. `cap {env} cul:wp:update:core`
3. `cap {env} cul:wp:update:plugins`
4. `cap {env} cul:wp:update:themes`
5. `cap {env} cul:wp:update:all`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cul/capistrano-cul.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
