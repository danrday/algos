defmodule Lists do

  def len([]), do: 0
  def len([_head | tail]), do: 1 + len(tail)

  def sum([]), do: 0
  def sum([head | tail]), do: head + sum(tail)

  def double([]), do: []
  def double([ head | tail ]), do: [ 2*head | double(tail) ]

  def square([]), do: []
  def square([ head | tail ]), do: [ head*head | square(tail) ]

  def sum_pairs([]), do: []
  def sum_pairs([ h1, h2 | t]), do: [ h1 + h2 | sum_pairs(t) ]

#  def even_length?([]) do
#    true
#  end

#  def even_length?([_head | tail]) do
#    !even_length?(tail)
#  end

  def even_length?([_, _ | t]) do
    even_length?(t)
  end

  def even_length?([_ | []]) do
    false
  end

  def even_length?([]) do
    true
  end


end
