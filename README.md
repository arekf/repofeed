[![Build Status](https://travis-ci.org/arekf/repofeed.svg?branch=develop)](https://travis-ci.org/arekf/repofeed) [![Code Climate](https://codeclimate.com/github/arekf/repofeed/badges/gpa.svg)](https://codeclimate.com/github/arekf/repofeed)

## Repofeed

Repofeed is a simple Ruby on Rails application that allows you to collect information about latest commits.

# Setup

This is fairly standard Rails application. It uses Ruby 2.4 and Rails 5.1.

When you have Ruby and Budler installed, install gems with:
```
bundle install
```

You should be able to run Rails server with:
```
rails server
```

It uses Sidekiq as ActiveJob adapter, so if you need it, run:
```
sidekiq
```

# Enjoy!
