# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'lib/blackjack/version'

Gem::Specification.new do |s|
  s.name                      = "simpleblackjack"
  s.version                   = BlackJack::VERSION
  s.authors                   = ["Ivan Marcin"]
  s.email                     = ["ivanmarcin@gmail.com"]
  s.homepage                  = "https://github.com/ivanmarcin/BJG"
  s.summary                   = "Simple Black Jack Game"
  s.description               = "Black Jack card game"

  s.executables << 'blackJack'

  s.required_rubygems_version = ">= 1.3.5"

  s.files                     = Dir.glob("{bin,lib}/**/*")
  s.require_path              = 'lib'

  #gem dependencies.
  s.add_dependency 'colorize'
end
