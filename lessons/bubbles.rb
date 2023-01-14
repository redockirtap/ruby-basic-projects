
def bubble_sort(arr)
    count = arr.length * arr.length - arr.length
    while count > 0
        arr.each_with_index do |num, index|
            while arr.index(num) != arr.index(arr[-1]) && num > arr[index+1] 
                arr[index] = arr[index+1] 
                arr[index+1] = num
            end
            count -= 1
        end
    end
    arr
end

p bubble_sort([78,72,71,4,2,1])