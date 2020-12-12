def my_min(array)
    array.each do |el|
        return el if array.all? { |other_el| el <= other_el }
    end

end

def my_min2(array)
    min_so_far = array.first
    array.each do |el|
        min_so_far = el if el < min_so_far
    end
    min_so_far
end
# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min2(list)  # =>  -5



# speed: O(N^3) # Sapce Complexity: O(N^3)
def largest_contiguous_subsum(array)
    new_arr = []
    array.each_with_index do |el1, i1|
        array.each_with_index do |el2, i2|
            if i2 >= i1
                new_arr <<  array[i1..i2]
            end
        end
    end
    new_arr.map {|el| el.sum}.max
end

# list = [5, 3, -7]
# p largest_contiguous_subsum(list) # => 8
# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
# list = [-5, -1, -3]
# p largest_contiguous_subsum(list) # => -1 (from [-1])

#subarrays <- checking all subarrays is O(N^2) 
#inject
# require "byebug"
# Speed : O(N)   # space: O(1) 
def largest_contiguous_subsum2(array)
    #debugger
    largest_sum = array.first
    current_sum = array.first
    array[1..-1].each do |ele|
        # replace current_sum with ele if current_sum negative and ele > current_sum
        if current_sum.negative? && ele > current_sum
            current_sum = ele
        else #otherwise add ele to current_sum 
            current_sum += ele
        end
        #update largest sum 
        largest_sum = current_sum if current_sum > largest_sum
    end
    largest_sum
end

list = [5, 3, -7]
p largest_contiguous_subsum2(list) # => 8
list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum2(list) # => 8 (from [7, -6, 7])
list = [-5, -1, -3]
p largest_contiguous_subsum2(list) # => -1 (from [-1])


# [5,3,-7]

# value = 5
# best_sum = 5
# current_sum = 5

# value = 3
# best_sum = 8
# current_sum = 8

# value = -7
# best_sum = 8
# current_sum = 1

# output best_sum 


#[2, 3, -6, 7, -6, 7]

# value = 2
# best_sum = 2
# current_sum = 2

# value = 3
# best_sum = 2 + 3
# current_sum = 2 + 3 = 5

# value = -6
# best_sum = 2 + 3
# current_sum = 2 + 3 + (-6) = -1

# value = 7
# best_sum = 7
# current_sum = 7

# value = -6
# best_sum = 7
# current_sum = 1

# value = 7
# best_sum = 7 + -6 + 7 = 8
# current_sum = 8

