require 'thread'

module Imggrabber
  module Adapters
    class ThreadsAdapter
      def self.run(number, path, images)
        queue = Queue.new
        images.each { |image| queue << image }

        threads = number.times.map do
          Thread.new do
            while !queue.empty? && image = queue.pop
              response = Net::HTTP.get(image)
              Utils.write_file(path, image, response)
            end
          end
        end

        threads.each(&:join)
      end
    end
  end
end