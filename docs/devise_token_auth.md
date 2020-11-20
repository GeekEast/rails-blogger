## Devise Token Auth
- [docs](https://www.rubydoc.info/gems/devise_token_auth/0.1.31#usage-tldr)
- mount
```ruby
# add gem
gem 'devise_token_auth'
# install, will generate migration file
rails g devise_token_auth:install User auth
# add extend Devise::Models to User model
rails db:migration
# add one line configuration to developemnt.rb, this is to config devise
config.action_mailer.default_url_options = { :host => 'localhost' }
```
- Test in Postman