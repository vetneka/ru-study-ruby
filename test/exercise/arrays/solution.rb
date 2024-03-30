module Exercise
  module Arrays
    class << self
      def max(array)
        max_value = array[0]

        for item in array do
          if item > max_value
            max_value = item 
          end
        end

        max_value
      end

      def replace(array)
        max_value = max array
        result = []

        for item in array do
          result << (item.positive? ? max_value : item)
        end

        result
      end

      def search(_array, _query)
        0
      end
    end
  end
end
