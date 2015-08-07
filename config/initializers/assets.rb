# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

# Self added assets should be precompiled
Rails.application.config.assets.precompile += %w( style.css )

Rails.application.config.assets.precompile += %w( submissions.css )
Rails.application.config.assets.precompile += %w( submissions.js )

Rails.application.config.assets.precompile += %w( contests.css )
Rails.application.config.assets.precompile += %w( contests.js )

Rails.application.config.assets.precompile += %w( landings.css )
Rails.application.config.assets.precompile += %w( landings.js )

Rails.application.config.assets.precompile += %w( init.js )
