
require 'grid'

Given /a blank grid/ do
  @grid = Grid.new
end

Given /the following grid.*/ do |data|
#  debugger
  grid_data = data.raw
  grid_data.each do |row|
    row.collect! {|x| x == '' ? ' ' : x}
  end
  @grid = Grid.new(grid_data)
end

Then /the grid should display/ do |data|
#  debugger
  @grid.display.should == data
end

Then /^(\S) should Win$/ do |player|
  @grid.status.should == "#{player} Wins!"
end

Then /^the game is In\-Play$/ do
  @grid.status.should == "In-Play"
end

Then /^the game is a Tie$/ do
  @grid.status.should == "Tie"
end

