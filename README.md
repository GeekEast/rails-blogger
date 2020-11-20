## Config
- database
- uuid
- soft delete

## Gem
- [paranoia](https://github.com/rubysherpas/paranoia): soft delete records

## Concepts
- reflection: fields in database table automatically reflected in model's definition.


## Bricks
### UUID
- [Use UUID as primary key](https://blog.bigbinary.com/2016/04/04/rails-5-provides-application-config-to-use-uuid-as-primary-key)
```ruby
class ChangeUserIdTypeToUuid < ActiveRecord::Migration[5.2]

  def change
    add_column :users, :uuid, :uuid, default: "gen_random_uuid()", null: false

    change_table :users do |t|
      t.remove :id
      t.rename :uuid, :id
    end
    execute "ALTER TABLE users ADD PRIMARY KEY (id);"
  end
end
```

### [InvalidAuthenticityToken](https://stackoverflow.com/questions/58577488/invalidauthenticitytoken-for-rails-api-only-application-for-post-request)
- happens becauase of the `CSRF` protection in Rails Base Application
- if you are developing a rails `api`, you can do this
- change
```ruby
class ApplicationController < ActionController::Base
end
```
- to
```ruby
class ApplicationController < ActionController::API
end
```
- [or](https://dev.to/risafj/guide-to-devisetokenauth-simple-authentication-in-rails-api-pfj)
```ruby
# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }
end
```

### Look up a Record in Rails
- Basic
```ruby
User.create name: 'THE USER' # creates a user with id = 1
User.find(1) # returns the user
User.find_by(id: 1) # return the user
User.find_by_id(1) # returns the user
User.where(id: 1).first # returns the user
```
- Error Handling
```ruby
User.find(2) # raises an exception
User.find_by(id:2) # nil
User.find_by_id(2) # nil
User.where(id: 2).first # nil
```
- Other
```ruby
User.where(id: 2) # return an array
User.where(id: "not found") # return []
```

### Create Record in ActiveRecord
```ruby
# method 1
User.new
User.name = "james"

# method 2
User.create(:params)
```

### nil, blank, empty in rails
- **empty**: check no elements in a collection
```ruby
[].empty? # true
{}.empty? # true
Set.new.empty? # true
```
- **nil**: not initialized
```ruby
nil.nil? # true
false.nil? # false
0.nil? # false
"".nil? # false
```
- **blank**: nil, false, empty and "", 0 is not blank
```ruby
nil.blank? # true
false.blank? # true
[].blank? # true
{}.blank? # true
"".blank? # true
0.blank? # false
```
- **presence**: negation of `blank`


### Instance Variable in Controller
```ruby
# ArticlesController.rb
def index
  @article = Article.new # instance variable: available in view and controller
  article = Article.new # local variable: available only in index method
end
```

### class << self
- [Rails class << self](https://stackoverflow.com/questions/2567956/rails-class-self)
```ruby
module Utility
  class Options #:nodoc:
    class << self
      # we are inside Options's singleton class
      def parse(args)

      end
    end
  end
end


#  is same to 
module Utility
  class Options #:nodoc:
    def Options.parse(args)

    end
  end
end
```


### References
- [Rails API User Authentication](https://app.pluralsight.com/guides/token-based-authentication-with-ruby-on-rails-5-api)
- [AppSignal](https://blog.appsignal.com/)
- [Concerns in Rails](https://blog.appsignal.com/2020/09/16/rails-concers-to-concern-or-not-to-concern.html)