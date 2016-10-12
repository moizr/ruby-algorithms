#!/usr/bin/ruby 

#In ruby the array class itself has a method called combination which can list
#the combinations of any number of elements within the array
#%w(A B C D E).combination(2) do |n| p n end

str = "ABCDE"

arr = str.chars.collect do |c| c end
#arr.combination(2) do |n| p n end

class Array

def my_combination(k,&b)
  do_combination(self.size,k,[],self,&b)
end

# This implementation of combination is based on the theorem
# (n,k) = (n-1, k-1) + (n-1,k)
# n - The current level
# k - The current combination level
# pre - The array that maintains a history of elements that have been traversed. A kind of travel history.
# arr - The array for which the combinations need to be found
# b - This is a block that can be passed to the combination method so that any action that may be required
# on the combo can be carried out. The block will be passed the combination of elements as an array 
# 
def do_combination(n,k,pre,arr,&b)
  return if k > n #invalid case. you cannot have a combination with more elements than elements in the array
  return if k == 0 or n == 0 #all combinations in this tree have been identified
  if k == 1 then #if k == 1 then a combination has been found. print it or add it to some sort of output.
    #p pre + arr[arr.size - n, 1]
    b.call(pre + arr[arr.size - n, 1])
  end
  pre.push(arr[arr.size-n])
  do_combination(n-1,k-1,pre,arr,&b)
  pre.pop
  do_combination(n-1,k,pre,arr,&b)
end

end

#combination(5,4,[],%w(A B C D E))
[10, 20, 30, 40, 50].my_combination(2) do |combo|
   if (combo[0] + combo[1]) == 60 then
     p combo
     p "found"
   end
end


# This is a test comment to test gerrit/github integration
