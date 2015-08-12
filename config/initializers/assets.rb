# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.

precomplie_assets = %w( listings listing_offers
                        listing_asks listing_communities
                        pages devise/registrations
                        devise/sessions inbox )

compile = []
precomplie_assets.each do |a|
  compile += [a+".js", a+".css"]
end
Rails.application.config.assets.precompile += compile
