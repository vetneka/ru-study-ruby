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

      def search_iterate(array, query, left_index, rigth_index)
        if left_index > rigth_index
          return -1
        end

        middle_index = (left_index + rigth_index) / 2
        current_value = array[middle_index]

        if current_value == query
          return middle_index
        elsif current_value < query
          search_iterate(array, query, middle_index + 1, rigth_index)
        else
          search_iterate(array, query, left_index, middle_index - 1)
        end
      end

      def search(_array, _query)
        left_index = 0
        right_index = _array.length - 1
        
        search_iterate(_array, _query, left_index, right_index)
      end
    end
  end
end
