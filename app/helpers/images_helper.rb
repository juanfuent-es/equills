module ImagesHelper

    def img_dimensions(img)
        `identify -format "%wx %h" #{Rails.public_path}#{img}`.split(/x/).map{|dim| dim.to_i }
    end
    
    def file_size(img)
        size = File.size("#{Rails.public_path}#{img}").to_f
        "#{(size / 1024000).round(2)}mb"
    end

    def video_info(video_url)
        FFMPEG::Movie.new(File.join Rails.root, 'public', video_url)
    end

end