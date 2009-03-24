When /^(\S) moves to square (\d)$/ do |player, square|
#  debugger
  @grid.play_square(player, square.to_i)
end

When /^(\S) \(computer\) takes turn$/ do |player|
  
end

Then /^(\S) should be in a corner square$/ do
end
