# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

# Self added assets should be precompiled

# Default 
%w(eot woff ttf).each do |font|
  Rails.application.config.assets.precompile += ["simple-line-icons/fonts/Simple-Line-Icons.#{font}"]
end
Rails.application.config.assets.precompile += %w( unify/init.js )

# contests#index
Rails.application.config.assets.precompile += %w( masonry/blog_masonry_3col.css )
Rails.application.config.assets.precompile += %w( masonry/blog-masonry.js )
Rails.application.config.assets.precompile += %w( masonry/jquery.masonry.min.js )
# submissions#index
Rails.application.config.assets.precompile += %w( pages/profile.css )
# landings#index
Rails.application.config.assets.precompile += %w( pages/page_one.css )
