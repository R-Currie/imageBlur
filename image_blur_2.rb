class Image
    attr_reader :pixels
    def initialize(pixels)
        @pixels = pixels
    end

    def identify_ones
    ones_coordinates = []
        @pixels.each_with_index do |row, row_number|
            row.each_with_index do |item, col_number|
                if item == 1
                    ones_coordinates << [row_number, col_number]
                end
            end
        end
        ones_coordinates
    end

    def transform_image
        ones = identify_ones
        @pixels.each_with_index do |row, row_number|
            row.each_with_index do |item, col_number|
                ones.each do |ones_row_number, ones_col_number|
                    if row_number == ones_row_number && col_number == ones_col_number
                        @pixels[row_number + 1][col_number] = 1 unless row_number > @pixels.length
                        @pixels[row_number - 1][col_number] = 1 unless row_number == 0
                        @pixels[row_number][col_number + 1] = 1 unless col_number + 1 >= @pixels[row_number].length
                        @pixels[row_number][col_number - 1] = 1 unless col_number == 0
                    end
                end
            end
        end
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
image.transform_image
image.output_image