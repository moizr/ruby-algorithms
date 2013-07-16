#!/usr/bin/ruby

def pack(target, start,arr , out)
  start.upto(arr.length - 1) do |i|
    p "i = #{i} Target = #{target}, Start = #{start} out= #{out.join(',')}, arr[i] = #{arr[i]}"
    if arr[i] == target then out.push(arr[i]); return true; end
    if arr[i] < target then 
      out.push(arr[i]); 
      return true if pack(target - arr[i], i+1, arr, out)
      out.pop();
    end
  end
  return false
end

out = []
pack(ARGV[0].to_i, 0, [11,8,7,6,5], out)

p out
