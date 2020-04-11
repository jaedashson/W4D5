# phase 1

# O(n^2)
def bad_two_sum?(arr, target)

    (0...arr.length-1).each do |idx1|
        (idx1+1...arr.length).each do |idx2|
            return true if arr[idx1] + arr[idx2] == target
        end
    end

    false
end

def okay_two_sum?(arr, target)
    arr.sort!

    left_index = 0
    right_index = arr.length - 1

    until left_index == right_index
        sum = arr[left_index] + arr[right_index]

        case sum <=> target
        when -1 # sum is too low
            left_index += 1 # increase
        when 0
            return true
        when 1 # sum is too high
            right_index -= 1
        end
    end

    false

    # start with outside indices and see if it sums to target
    # if sum is too high, rightmost index should move left
    # if sum is too low, leftmost index should move right


end

def two_sum?(arr, target)
    hash = Hash.new(false)
    # debugger
    arr.each do |num|
        return true if hash[target - num]
        hash[num] = true
    end

    false
end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false