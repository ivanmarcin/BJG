BlackJack
===

Simple console blackjack game.
Supports a simple computer dealer.

## Prerequistes
RVM (preferably)
JRuby
bundler

## Installation

From Gem, execute the following commands:

    $ gem install bjg
    $ bjg

From Source:

Clone repository and then after checkout run
    $ git clone .........BJG.git
    $ cd BJG
    $ rvm install jruby     #optional
    $ rvm use jruby         #optional
    $ bundle install        #or gem install colorize
    $ rake game:start       # runs the game

## Usage

    Rake version:
    $> bundle exec rake -T
    $> bundle exec rake game:start              # starts a new black jack game

    Gem version:
    $> gem install bjg
    $> bjg

# Running tests
    $> cd BJG
    $> rspec
