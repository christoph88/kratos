# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

# Self added assets should be precompiled
Rails.application.config.assets.precompile += %w( landingpage.css )
Rails.application.config.assets.precompile += %w( style.css )
Rails.application.config.assets.precompile += %w( style-responsive.css )
Rails.application.config.assets.precompile += %w( table-responsive.css )
Rails.application.config.assets.precompile += %w( landingpage.js )
Rails.application.config.assets.precompile += %w( common-scripts.js )
