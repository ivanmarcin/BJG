BlackJack
===

Simple console blackjack game.
Supports a simple computer dealer.

## Prerequistes
JRuby
bundler (or install colorize gem)

## Installation

Install is as simple as installing the gem. The gem includes an executable
From the console, execute the following commands:

    $ gem install simpleblackjack
    $ blackjack

To execute from Source:

Clone repository and then after checkout run:

    $ git clone https://github.com/ivanmarcin/BJG
    $ cd BJG
    $ rvm install jruby     # optional
    $ rvm use jruby         # optional
    $ bundle install        # or gem install colorize
    $ rake game:start       # runs the game

## Usage

    Rake version:
    $> rake game:start              # starts a new black jack game
    $> rake test:bvt                # show version
    $> rake spec                    # run tests via rake

    Gem version:
    $> gem install simpleblackjack
    $> blackjack

# Running tests (with sources)
    $> cd BJG
    $> rspec
    

##ChangeList

V 0.2.0
Initial Release

V 0.3.0
Minor comestic updates. 
Makes avatar display and win % nicer


last version showing up in rubygems is 0.2.0, v3 may take a while to pop up. (Why rubygems...why?!)

