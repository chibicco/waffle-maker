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

By passing the WAF log from the standard input, the log that matches the route is written to the standard output.

```sh
$ bundle exec rake waffle:filter < alert-201912.txt
```

Depending on the execution environment, you may need to pre-convert the character encoding of the log.

```sh
$ iconv -f CP932 -t UTF-8 < alert-201912.txt | bundle exec rake waffle:filter 
```

with options
- `-f`: Specify the column number (offset) that contains the Rails route path. default is `2`.
- `-w`: Specify the column number (offset) that contains the path in the WAF log. default is `2`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/chibicco/waffle-maker.
