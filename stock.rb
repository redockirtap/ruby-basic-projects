

def stock_picker(arr)
    sum = 0
    days = []
    arr.each do |num1| 
        arr.each do |num2| 
            if (num2 - num1).abs > sum && arr.index(num2) > arr.index(num1) && num2 > num1
                sum = (num2 - num1) 
                days = [arr.index(num1), arr.index(num2)]
            end
        end
    end
    p sum, days
end

stock_picker([502, 2,6,3,1])