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



## References
- [devise_token_auth docs](https://www.rubydoc.info/gems/devise_token_auth/0.1.31#usage)
- [Guide to devise_token_auth: Simple Authentication in Rails API ](https://dev.to/risafj/guide-to-devisetokenauth-simple-authentication-in-rails-api-pfj)