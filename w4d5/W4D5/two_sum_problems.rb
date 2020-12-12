
#total work = outer_loop_num_times * inner_loop_num_times * work in loop
#              N * N * 1
#              N^2


# def bad_two_sum?(arr, num)
#     arr.each_with_index do |ele1, i1| # N times
#         arr.each_with_index do |ele2, i2| # N times 
#             if i2 > i1 && ele1 + ele2 == num # O(1) work
#                 return true
#             end
#         end
#     end
#     false
# end


# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false


# O(N log N)
# def okay_two_sum?(arr,num)
#     arr.sort! # O(N log N) work
    
#     #binary search -> works on sorted arrays
#     arr.each_with_index do |ele, idx| # N times
#         return true if binary_search?(arr[idx+1..-1], num - ele) # log(N) work
#     end
#     false
# end

# O(log(N))
# def binary_search?(arr, target)
#     return false if arr.empty?
#     mid_idx = arr.length/2
#     return true if arr[mid_idx] == target
#     left = arr[0...mid_idx]
#     right = arr[mid_idx+1..-1]
#     if target > arr[mid_idx]
#         binary_search?(right, target)
#     else
#         binary_search?(left, target)
#     end
# end


# arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 10) # => should be false
# p okay_two_sum?(arr, 6) # => should be true

# O(N)
def hash_two_sum?(arr, num)
    hash = Hash.new(0) #O(1) work
    arr.each do |ele| # N times
        return true if hash.has_key?(num - ele) # O(1) work
        hash[ele]+= 1 # O(1) work
    end
    false
end

arr = [0, 1, 5, 7]
p hash_two_sum?(arr, 10) # => should be false
p hash_two_sum?(arr, 6) # => should be true