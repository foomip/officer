# Standard Ruby.
require 'singleton'
require 'set'
require 'logger'
require 'delegate'
require 'thread'

# Gems.
require 'rubygems'
require 'eventmachine'
require 'json'
require 'daemons'
require 'choice'
# require 'ruby-debug'

# Application.
require File.expand_path(File.dirname(__FILE__) + '/../lib/officer/log')
require File.expand_path(File.dirname(__FILE__) + '/../lib/officer/commands')
require File.expand_path(File.dirname(__FILE__) + '/../lib/officer/connection')
require File.expand_path(File.dirname(__FILE__) + '/../lib/officer/lock_store')
require File.expand_path(File.dirname(__FILE__) + '/../lib/officer/server')
require File.expand_path(File.dirname(__FILE__) + '/../lib/officer/client')
