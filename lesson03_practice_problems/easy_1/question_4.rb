# The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:


numbers = [1, 2, 3, 4, 5]
# What do the following method calls do (assume we reset numbers to the original array between method calls)?


numbers.delete_at(1) # deletes the element at an idx of the given arg; 1
# numbers -> [1, 3, 4, 5]
numbers.delete(1) #deletes all elements that match the arg; 1
# numbers -> [2, 3, 4, 5]