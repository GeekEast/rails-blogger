## Config
- database
- uuid
- soft delete

### Gem
- [paranoia](https://github.com/rubysherpas/paranoia): soft delete records

### Concepts
- reflection: fields in database table automatically reflected in model's definition.


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