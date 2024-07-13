class SiteInfoController < ApplicationController

	def manifest
		@base_url = "#{request.protocol}#{request.host_with_port}"
		render json: {
			"name": "#{Rails.application.credentials.app_name}",
			"short_name": "#{Rails.application.credentials.app_short_name}",
			"description": "#{Rails.application.credentials.app_description}",
			"icons": [
				{ "src": "/android-chrome-192x192.png", "sizes": "192x192", "type": "image/png", "purpose": "any maskable" },
				{ "src": "/android-chrome-512x512.png", "sizes": "512x512", "type": "image/png" },
			],
			"start_url": "/",
			"theme_color": "#00F",
			"background_color": "#00F",
			"display": "standalone",
			"scope": "/"
		}
	end

end