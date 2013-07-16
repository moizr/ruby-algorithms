#!/usr/bin/ruby

def merge_sort(arr)
  p "Original: #{arr.inspect}"
  rec_merge_sort(arr,Array.new(arr.size),0, arr.size-1)
  return arr
end


def rec_merge_sort(arr, workspace, lower, upper)
  return if lower == upper
  mid = (upper + lower)/2
  rec_merge_sort(arr, workspace, lower, mid)
  rec_merge_sort(arr, workspace, mid+1, upper)
  merge(arr, workspace, lower, mid+1, upper)
end


def merge(arr, workspace, lower_ptr, upper_ptr, upper)
  j = 0
  lower = lower_ptr
  mid = upper_ptr - 1
  n = upper - lower + 1 
 
  while(lower_ptr <= mid and upper_ptr <= upper) do
    if (arr[lower_ptr] < arr[upper_ptr]) then
     workspace[j] = arr[lower_ptr]
     lower_ptr += 1
    else
     workspace[j] = arr[upper_ptr]
     upper_ptr += 1
    end
    j += 1
  end  
  
  while(lower_ptr <= mid) do
    workspace[j] = arr[lower_ptr]
    j += 1
    lower_ptr += 1
  end
  
  while(upper_ptr <= upper) do
    workspace[j] = arr[upper_ptr]
    j += 1
    upper_ptr += 1
  end
  arr[lower, n] = workspace[0, n]
end


p "Sorted: #{merge_sort([8,9,126,3,0,12,7,3,10,4]).inspect}"
