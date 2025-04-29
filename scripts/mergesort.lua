#!/usr/bin/lua mergesort.lua

function mergesort(array)
    local left = {}
    local right = {}
    local size = #array
    local middle = size / 2
    local index = 1
    local i = 1

    if size <= 1 then
        return array
    end
    i = 1
    while index <= middle do
        left[i] = array[index]
        index = index + 1
        i = i + 1
    end
    i = 1
    while index <= size do
        right[i] = array[index]
        index = index + 1
        i = i + 1
    end
	left = mergesort(left)
	right = mergesort(right)


    return merge(left, right)
end

function merge(left, right)
    local merged = {}
    local leftSize = #left
    local rightSize = #right
    local leftIndex = 1
    local rightIndex = 1
    local index = 1
    while leftIndex <= leftSize and rightIndex <= rightSize do
        if left[leftIndex] < right[rightIndex] then
            merged[index] = left[leftIndex]
            leftIndex = leftIndex + 1
            index = index + 1
        else
            merged[index] = right[rightIndex]
            rightIndex = rightIndex + 1
            index = index + 1
        end
    end
    while leftIndex <= leftSize do
        merged[index] = left[leftIndex]
        leftIndex = leftIndex + 1
        index = index + 1
    end
    while rightIndex <= rightSize do
		merged[index] = right[rightIndex]
		rightIndex = rightIndex + 1
		index = index + 1
    end
    return merged
end

function randomArray(array)
    array = array or {}
    local size = math.random(5, 25)
    for i = 1, size do
        array[i] = math.random(0, 100)
    end
end

function printArray(array)
    if (array and #array > 1) then
        io.write("[", array[1])
        for i = 2, #array do
            io.write(", ", array[i])
        end
        io.write("]\n")
    end
end

-- Set rand seed using current time
math.randomseed(os.time())

-- Generate random array
array = {}
randomArray(array)

io.write("Unsorted Array:\n")
printArray(array)

-- Sort the array
array = mergesort(array)

io.write("Sorted Array:\n")
printArray(array)
