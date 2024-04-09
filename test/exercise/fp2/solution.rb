module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        return if empty?

        first, *rest = self

        yield(first) if block_given?

        MyArray.new(rest).my_each(&block)

        self
      end

      # Написать свою функцию my_map
      def my_map
        my_reduce(MyArray.new) { |acc, item| acc << yield(item) }
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) { |acc, item| item.nil? ? acc : acc << item }
      end

      # Написать свою функцию my_reduce
      def my_reduce(*args)
        array = MyArray.new(args.empty? ? slice(1..) : self)

        accumulator = args.first || first

        array.my_each { |item| accumulator = yield(accumulator, item) if block_given? }

        accumulator
      end
    end
  end
end
