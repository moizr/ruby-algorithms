#!/usr/bin/ruby

def towers(top, from, inter, to)
  if top == 1 then
    p "Move #{top} from #{from} to #{to}"
    return
  end
  towers(top-1, from, to, inter)
  p "Move #{top} from #{from} to #{to}"
  towers(top-1, inter, from, to)
end

towers(4, 'A', 'B', 'C')

