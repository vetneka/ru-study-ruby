module Exercise
  module Arrays
    class << self
      def max(array)
        max_value = array[0]

        array.each_with_index do |item, index|
          next if index.zero?

          max_value = item if item > max_value
        end

        max_value
      end

      def replace(array)
        max_value = max array

        array.map { |item| item.positive? ? max_value : item }
      end

      def search(array, query, left_index = 0, right_index = array.length - 1)
        return -1 if end_of_search?(array, query, left_index, right_index)

        middle_index = (left_index + right_index) / 2
        current_value = array[middle_index]

        return middle_index if current_value == query

        current_value < query ? search(array, query, middle_index + 1, right_index) : search(array, query, left_index, middle_index - 1)
      end

      private

      def query_exist_in_array?(array, query, left_index, right_index)
        query >= array[left_index].to_f && query <= array[right_index].to_f
      end

      def end_of_search?(array, query, left_index, right_index)
        !query_exist_in_array?(array, query, left_index, right_index) || left_index > right_index
      end
    end
  end
end
