module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for item in self do
          yield(item) if block_given?
        end
      end

      # Написать свою функцию my_map
      def my_map
        result = my_reduce([]) { |acc, item| acc << yield(item) }

        MyArray.new(result)
      end

      # Написать свою функцию my_compact
      def my_compact
        result = my_reduce([]) do |acc, item|
          if item.nil?
            acc
          else
            acc << item
          end
        end

        MyArray.new(result)
      end

      # Написать свою функцию my_reduce
      def my_reduce(*args)
        array = args.empty? ? slice(1..) : self

        accumulator = args.first || first

        for item in array do
          accumulator = yield(accumulator, item) if block_given?
        end

        accumulator
      end
    end
  end
end
