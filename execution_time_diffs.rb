list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

def my_min_one(list)
    min = list.first

    list.each do |num|
        temp_min = num

        list.each do |other_num|
            temp_min = num < other_num ? num : other_num
        end

        min = temp_min < min ? temp_min : min
    end

    min
end

# p my_min_one(list)

def my_min_two(list)
    min = list.first

    list.each { |num| min = num if num < min }
    
    min
end

# p my_min_two(list)

list = [5, 3, -7]

def largest_contiguous_subsum(list)
    subarrs = []

    list.each_with_index do |num1, i1|
        list.each_with_index do |num2, i2|
            if i1 <= i2
                subarrs << list[i1..i2]
            end
        end
    end

    sums = []

    # subarrs.each { |subarr| sums << subarr.sum }
    subarrs.map { |sub| sub.sum }.max

end

# p largest_contiguous_subsum(list)

def largest_contiguous_subsum_two(list)
    # n = list.length
    # largest_sum = list.first

    
    # (0...n).each do |i|
    #     current_sum = list[i] * (n - 1) * (i + 1)
    #     largest_sum = current_sum > largest_sum ? current_sum : largest_sum
    # end
    
    # largest_sum
    
    
    # temp = [7, -3, 14]
    return list.max if list.all? { |el| el < 0 }
    current_sum = 0
    largest_sum = 0
    
    (0...list.length).each do |idx|
        current = list[idx]
        current_sum += current
        if current_sum < 0
            current_sum = 0
        end
        
        if current_sum > largest_sum
            largest_sum = current_sum
        end
    end

    largest_sum
end

list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum_two(list)



