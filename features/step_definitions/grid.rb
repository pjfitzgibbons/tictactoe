
require 'grid'

Given /a blank grid/ do
  @grid = Grid.new
end

Given /the following grid.*/ do |data|
#  debugger
  @grid = Grid.new(data.raw)
end

Then /the grid should display/ do |data|
#  debugger
  @grid.display.should == data
end