require 'rmagick'
# 
class Rainbow

  def initialize(image_src, levels = 8)
    @full_src = "#{Rails.root.to_s}/public#{image_src}"
    @levels = levels
    @image = nil
    @image = ::Magick::Image.read(@full_src)[0] if FileTest.exist?(@full_src)
  end

  def to_hex(channel)
    return (channel/256).to_s(16).rjust(2, '0')
  end

  def rgb_to_hex(rgb)
    r = to_hex(rgb[0])
    g = to_hex(rgb[1])
    b = to_hex(rgb[2])
    return [r,g,b].join("")
  end
  
  def palette(levels)
    return [] if @image.nil?
    colors = []
    @image.quantize(levels, Magick::RGBColorspace).color_histogram.each do |rgba|
      color = []
      color[0] = rgb_to_hex([rgba[0].red, rgba[0].green, rgba[0].blue]) #rgb
      color[1] = ((rgba[0].red + rgba[0].green + rgba[0].blue) / 3) / 256 #gray
      colors << color
    end
    return colors
  end

  def predominant
    colors = palette(4).sort {|a, b| b[1] <=> a[1]}[2]
    if colors
      return "##{colors[0] == "fffff" ? colors[1] : colors[0]}"
    else
      return "#000000"
    end
  end

  def colors
    hexadecimals = []
    palette(@levels).sort { |a, b| a[1] <=> b[1] }.each do |color|
      hexadecimals << "##{color[0].upcase}"
    end
    return hexadecimals.map { |a| a }.join(",")
  end

end