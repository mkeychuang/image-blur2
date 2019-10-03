class Image
	attr_accessor :array
    
	def initialize (array)
		@array = array
	end
    
	def output_image
		puts "Original Image"
		@array.each do |row|
			puts row.join
		end
	end
    
	def blur
		coordinates = []
		@array.each_with_index do |row, row_index|
			row.each_with_index do |value, value_index|
				if value == 1
					coordinates << [row_index, value_index]
				end
		end
    end       

    coordinates.each do |coordinate|
      row_coordinate = coordinate[0]
      value_coordinate = coordinate[1]
        @array[row_coordinate + 1][value_coordinate] = 1 if row_coordinate < @array.length - 1
        @array[row_coordinate - 1][value_coordinate] = 1
        @array[row_coordinate][value_coordinate + 1] = 1 if @array[row_coordinate][value_coordinate + 1] == 0
        @array[row_coordinate][value_coordinate - 1] = 1
    end
        puts "Blurred Image"
         @array.each do |row|
        puts row.join
        end
  end
end

 image = Image.new([
   [1, 0, 1, 0],
   [0, 0, 0, 0],
   [0, 0, 0, 0],
   [0, 0, 0, 1]
   ])

image.output_image
image.blur