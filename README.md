# Capistrano::Cul

Capistrano v3 tasks shared across CUL projects.

This gem provides common cap tasks that are used in almost every cul project. It also includes a set of cap tasks and hooks that are specific for Wordpress deployments. Do not include the Wordpress library if you are not deploying a Wordpress site.

## Installation

### Install gem
Add this line to your application's Gemfile:

```ruby
gem 'capistrano-cul', require: false
```

_Note:_ If installing in a rails application, gem should only be installed in `:development` and `:test` groups.


And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-cul

### Add Capistrano::Cul tasks to `Capfile`
In your application's `Capfile` include:

```ruby
require 'capistrano/cul'
```

For Wordpress deployments, in your application's `Capfile` include:
```ruby
require 'capistrano/cul'
require 'capistrano/cul/wp'
```

## Usage
### Shared cap tasks (`capistrano/cul`)
1. `cap {env} cul:auto_tag`

   Tags the current commit as the version number provided in `VERSION`.
2. `cap {env} cul:downtime`

   Pulls down the downtime branch of the repository to a `/downtime` directory and symlinks `current` to `downtime`. To undo this action, redeploy your application.

### Wordpress deployment (`capistrano/cul/wp`)
#### Tasks
1. `cap {env} cul:wp:setup`

   Sets up a WordPress docroot and runs deployment; does not install WordPress and does not create any users.
2. `cap {env} cul:wp:install`

   Runs a WordPress installation for a newly set up instance and creates a new admin user.
3. `cap {env} cul:wp:symlink_custom_plugins_and_themes`

   Creates symlinks for custom plugins and themes as part of a WordPress deployment. Generally run as an `after :deploy` hook.
4. `cap {env} cul:wp:searchreplace`

   Runs a search and replace operation on the tables in a WordPress installation.
5. `cap {env} cul:wp:update:core`

   Updates WordPress core to the latest version.
6. `cap {env} cul:wp:update:plugins`

   Updates non-repo-managed plugins to the latest version.
7. `cap {env} cul:wp:update:themes`

   Updates non-repo-managed themes to the latest version.
8. `cap {env} cul:wp:update:all`

   Updates WordPress core, plugins, and themes (in that order) by calling update:core, update:plugins and update:themes tasks.

#### Configurable variables
The Wordpress tasks listed above require the following variables .
```ruby
set :wp_docroot # (string) Path to webserver document root for site
set :wp_data_path # (string) Path to data directory (outside of wp_docroot) that contains wp-content
set :url # (string) Public website URL
set :title # (string) Website title
set :multisite # (boolean) Whether or not this is a multisite wordpress installation
set :wp_custom_plugins # (hash) Map of custom plugin file/directory names to repo-relative paths
set :wp_custom_mu_plugins # (hash) Map of custom MUST-USE plugin file/directory names to repo-relative paths
set :wp_custom_themes # (hash) Map of custom theme file/directory names to repo-relative paths
```

Here's a sample configuration:

```ruby
set :wp_docroot, "#{fetch(:deploy_to)}/wp-docroot"
set :wp_content_path, "#{fetch(:deploy_to)}/wp-content"
set :multisite, false
set :title, 'Amazing WordPress Site'

set :wp_custom_plugins, {
  'custom-plugin-file.php' => 'plugins/custom-plugin-file.php',
  'custom-plugin-directory' => 'plugins/custom-plugin-directory'
}
set :wp_custom_themes, {
  'mytheme' => 'themes/mytheme'
}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cul/capistrano-cul.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
