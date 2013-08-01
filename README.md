ActiveRecordImmutable
------

Make ActiveRecord objects immutable.

Installation
======

Add this line to your application's Gemfile:

```console
gem 'active_record_immutable'
```

And then execute:

```console
$ bundle
```

Or install it yourself as:

```console
$ gem install active_record_immutable
```

Usage
=====

```ruby
class Record << ActiveRecord::Base
  include ActiveRecordImmutable
end
```

Contributing
=====

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
