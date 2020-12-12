# O (N ^ 2)
# def windowed_max_range(arr,window_size)
#     current_max_range = nil
#     i = 0 
#     while i + window_size <= arr.length # N times
#         sub_array = arr[i...i + window_size]
#         window_max = sub_array.max  # N times
#         window_min = sub_array.min  # N times
#         current_range = window_max - window_min  
#         if current_max_range.nil? || current_range > current_max_range
#             current_max_range = current_range
#         end
#         i += 1
#     end
#     current_max_range
# end

# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8


class MyQueue
    def initialize
        @store = [] 
    end

    def size 
        @store.length
    end
    def empty?
        @store.length == 0
    end
    def enqueue(ele)
        @store.push(ele)    
    end
    def dequeue 
        @store.shift if !empty?
    end
    def peek
        @store[0] if !empty?
    end
end

class MyStack
    def initialize
        @store = []
    end

    def peek
        @store[-1] unless empty?
    end

    def size
        @store.length
    end

    def empty?
        @store.length == 0
    end

    def pop
        @store.pop unless empty?
    end

    def push(ele)
        @store.push(ele)
    end
end

class StackQueue 
    def initialize
        @push_stack = MyStack.new
        @pop_stack = MyStack.new
    end

    def size
        @push_stack.size + @pop_stack.size
    end

    def empty?
        size == 0
    end

    def enqueue(ele)
        @push_stack.push(ele)
    end

    def dequeue
        if @pop_stack.empty?
            # get the element from push stack
            # @pop_stack.push(@push_stack.pop) until @push_stack.empty?
            @push_stack.size.times{ @pop_stack.push(@push_stack.pop) }
        end
        @pop_stack.pop
        #enqueue onto push stack
        # so how do we move elements from push stack to pop stack to be popped?
    end
end


class MinMaxStack < MyStack
   
    def push(ele)
        if empty?
            super({value: ele, max: ele, min: ele})
        else
            new_max = [ele , peek[:max]].max
            new_min = [ele , peek[:min]].min
            super({value: ele, max: new_max, min: new_min})
        end
    end
    def pop
        hash = super
        hash[:value] if !hash.nil?
    end
    def max
        hash = peek
        hash[:max] if !hash.nil?
    end
    def min 
        hash = peek
        hash[:min] if !hash.nil?
    end

end

class MinMaxStackQueue < StackQueue
    def initialize
        @push_stack = MinMaxStack.new
        @pop_stack = MinMaxStack.new
    end

    def max
        return [@push_stack.max, @pop_stack.max].max if !@push_stack.empty? && !@pop_stack.empty?
        return @pop_stack.max if @push_stack.empty?
        @push_stack.max if @pop_stack.empty?
    end
    def min 
        return [@push_stack.min, @pop_stack.min].min if !@push_stack.empty? && !@pop_stack.empty?
        return @pop_stack.min if @push_stack.empty?
        @push_stack.min if @pop_stack.empty?
    end

end


#O(N) time ; O(N) space
def good_windowed_max_range(array, window_size)
    current_max_range = nil
    mmsq = MinMaxStackQueue.new
    array.each do |ele|
        mmsq.dequeue if mmsq.size == window_size
        mmsq.enqueue(ele)
        current_range = mmsq.max - mmsq.min
        current_max_range = current_range if current_max_range.nil? || current_range > current_max_range
    end
    current_max_range
end


p good_windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p good_windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p good_windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p good_windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8