# Textor
Textor is a Rails Engine to create TeX documents structure within Rails apps.

## Usage
Run `$ rails db:migrate` to have the following Models available:
* Paper
* Template
* Section
* Field

A User model (and users table) must be available.

## Installation
Add this line to your application's Gemfile:

```ruby
gem "textor"

# or

gem "textor", :github => "nu12/textor"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install textor
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
