class Video < ApplicationRecord
	before_save :set_slug
    validates :title, length: { maximum: 160 }, uniqueness: { case_sensitive: true }, presence: true

    mount_uploader :file, VideoUploader
	has_many :blocks
	has_many :pages

    validate :video_is_present?
	
    private

    def set_slug
		self.slug = safe_title(self.title) if self.slug.blank?
	end

	def safe_title(_title)
		_clean_title = ActiveSupport::Inflector.transliterate(_title.downcase).gsub(/\W+/, "-")
		_clean_title = _clean_title.strip.squeeze(' ').gsub(/[^0-9A-Za-z]/, '-')
		random = SecureRandom.hex(2)
		return "#{_clean_title}.#{random}"
	end

	def video_is_present?
		if self.title.present? && !self.file.present?
			errors.add(:file, "El video es requerido")
		end
	end
    
end