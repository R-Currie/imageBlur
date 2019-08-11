class Image
    attr_reader :pixels
    def initialize(pixels)
        @pixels = pixels
    end
    def output_image
        pixels.each do |pixel|
            puts pixel.join
        end
    end
end



#this should work
image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image