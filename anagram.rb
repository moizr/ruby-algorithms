#!/usr/bin/ruby

def anagram(n, word)
   return if n == 1
   0.upto(n-1) do |r|
    anagram(n-1,word)
    p word if n == 2
    pos = word.length - n
    first = word[pos,1]
    rest = word[pos+1, word.length-1] if pos < word.length - 1
    rest = "" if pos >= word.length - 1
    rot = rest + first
    word[pos, rot.size]= rot
   end
end

def do_anagram(word)
   anagram(word.size, word)
end

x = ARGV[0].dup
do_anagram(x)

