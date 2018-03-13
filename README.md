# LazyPreloader

LazyPreloader is defers ActiveRecord preloading when using a multifetch cache, and only preloads the records that miss the cache.

You should only use this with caution as it monkey patches ActiveRecord and Actionview and could possibly break across versions.

This gem servers as a proof of concept for https://github.com/rails/rails/pull/31250, which hopefully will be merged into Ruby on Raisl in some form at some point.


## Usage

Use `ActiveRecord::Relation#preload` and `ActionView::Base#render` with the `cached` option. See the demo app in `test/dummy` for an example.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'lazy_preloader', github: 'lsylvester/lazy_preloader'
```

And then execute:
```bash
$ bundle
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lsylvester/lazy_preloader. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Foobar project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/lsylvester/lazy_preloader/blob/master/CODE_OF_CONDUCT.md).