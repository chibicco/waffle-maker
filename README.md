# WaffleMaker

[![Gem Version](https://badge.fury.io/rb/waffle-maker.svg)](http://badge.fury.io/rb/waffle-maker)
[![Coverage Status](https://img.shields.io/coveralls/chibicco/waffle-maker.svg)](https://coveralls.io/r/chibicco/waffle-maker)
[![Build Status](https://travis-ci.org/chibicco/waffle-maker.svg)](https://travis-ci.org/chibicco/waffle-maker)

Find waf logs that match rails routing.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'waffle-maker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install waffle-maker

## Usage

```ruby
$ iconv -f cp932 -t utf-8 < alert-201912.txt | bundle exec rake waffle:filter
```

with options

```ruby
$ iconv -f cp932 -t utf-8 < alert-201912.txt | bundle exec rake waffle:filter -f 2 -w 2
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/chibicco/waffle-maker.
