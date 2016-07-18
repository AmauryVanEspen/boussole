# encoding: utf-8
# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'bower_components')

# TODO: Remove after stop using bootsketch
Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'bower_components', 'bootsketch')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/
