module ApplicationHelper

	def device
		require "browser"
		if browser.device.mobile?
			return "mobile"
		elsif browser.device.tablet?
			return "tablet"
		else
			return "desktop"
		end
	end

	def canonical
		request.original_url.gsub('http','https').gsub('www','')
	end

	def meta_date _date
		if _date.empty?
			return Date.today.strftime("%Y-%m-%d")
		else
			return _date.to_date.strftime("%Y-%m-%d")
		end
	end

	def only_text(_str="")
		Nokogiri::HTML(_str).text
	end

	def full_title title
		base_title = "#{Rails.application.credentials.app_name}"
		_title = only_text(title)
		if title.empty? || base_title == _title
			base_title
		else
			"#{_title} | #{base_title}"
		end
	end

	def meta_image image
		_url = image.empty? ? "/hive-share.png" : image
		return "#{request.protocol}#{request.host_with_port}#{_url}"
	end

	def meta_description description
		return description.empty? ? "" : description
	end

	def breadcrumb(_url="")
		urls = ["Home"]
		urls << _url if _url.present?
		return urls.join(" > ")
	end

	def meta_keys keys
		return keys.empty? ? "" : ""
	end

	def slugize(str)
		# Transliterate: Replaces non-ASCII characters with an ASCII approximation, or if none exists, a replacement character which defaults to “?”.
		# @see: https://apidock.com/rails/v5.2.3/ActiveSupport/Inflector/transliterate
		_slug = ActiveSupport::Inflector.transliterate(str)
		# downcase and remove extra spaces
		#@see: https://apidock.com/ruby/String/strip
		_slug = _slug.downcase.strip
		# convert spaces to '-'
		return _slug.gsub(/\W+/, "-")
		# return _slug.gsub(/[^0-9A-Za-z]/, '')
	end

end