require_relative '03_title'

title("Monkey-Patching")
# You can change the way things work at runtime. Try this at home!
# (But maybe not in production without talking to your team first...)

# Every whole number in Ruby is a tiny robot, stamped from this factory!
# We can monkey with the factory to change the way they all work!
class Integer
  def even_split?(by)
    self % by == 0
  end

  # whoa... we can rename the original #to_s so we can still call it!
  alias old_to_s to_s

  def to_s
    out = ""
    out << "fizz" if even_split?(3)
    out << "buzz" if even_split?(5)

    out.empty? ? old_to_s : out
  end
end

puts "Now the numbers themselves can handle the conditionals:"
puts 15.even_split?(3)
puts 15.even_split?(4)
puts 15.even_split?(5)

puts "\nAnd fizz buzz is just iterating outputing numbers as strings:"
(1..15).to_a.each { |number| puts number }
