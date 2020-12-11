
def my_uniq(arr)
    return [] if arr.empty?
    new_arr = []
    arr.each do |ele|
        new_arr << ele unless new_arr.include?(ele)
    end
    new_arr
end

def two_sum(arr)
    return [] if arr.empty?
    pos_arr = []
    arr.each_with_index do |ele_1, i|
        arr.each_with_index do |ele_2, j|
            if j > i
                pos_arr << [i,j] if ele_1 + ele_2 == 0
            end
        end
    end
    pos_arr
end

def my_transpose(arr) 
    raise ArgumentError unless arr.is_a?(Array) &&
    arr.all?{|row| row.is_a?(Array) && row.length == arr[0].length}
    transposed = []
    (0...arr[0].length).each do |old_col_idx|
        new_row = []
        (0...arr.length).each do |old_row_idx|
            new_row << arr[old_row_idx][old_col_idx]
        end
        transposed << new_row
    end
    transposed
end

def stock_picker(arr)
    raise ArgumentError unless arr.is_a?(Array) && arr.length > 1
    max_profit = 0
    max_profit_indices = []
    arr.each_with_index do |first_ele, i|
        (i+1...arr.length).each do |j|
            profit = arr[j] - first_ele
            if profit > max_profit
                max_profit = profit
                max_profit_indices = [i,j]
            end
        end
    end
    max_profit_indices
    
end