# frozen_string_literal: true

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)
<<<<<<< HEAD

require 'bundler/setup' # Set up gems listed in the Gemfile.
=======
# Set up gems listed in the Gemfile.
require 'bundler/setup'
# Require for bootsnap gem
>>>>>>> bf36825e7696b5d24f5e76bbce18ce62b2828af1
require 'bootsnap/setup'
