# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'spec/spec_helper'

require 'grid'

describe Grid do
  before(:each) do
    @grid = Grid.new
  end

  it "should display blank grid" do
    @grid.display.should == 
"  |   |  
---------
  |   |  
---------
  |   |  "
    
  end

  describe "with initial data" do
    before(:each) do
    @grid = Grid.new([[' ', 'X', 'X'], ['X', 'X', 'X'], ['X', 'X', 'O']])
    end

    it "should have data" do
      @grid[0,0].should == ' '
      @grid[1,1].should == 'X'
      @grid[2,2].should == 'O'
    end

  it "should display filled grid" do
    @grid.display.should ==
"  | X | X
---------
X | X | X
---------
X | X | O"

  end

  end

  describe "with invalid initial data" do

    it "should not allow non-Array" do
      lambda {Grid.new("")}.should raise_error(ArgumentError, "Initialization data must be 3 x 3 array of space, X, O only")
    end

    it "should not allow 1-d Array" do
      lambda {Grid.new([])}.should raise_error(ArgumentError, "Initialization data must be 3 x 3 array of space, X, O only")
    end

    it "should not allow 2nd-d non-Array" do
      lambda {Grid.new(['', '', ''])}.should raise_error(ArgumentError, "Initialization data must be 3 x 3 array of space, X, O only")
    end

    it "should require 1st-d Array size 3" do
      lambda {Grid.new([[], []])}.should raise_error(ArgumentError, "Initialization data must be 3 x 3 array of space, X, O only")
    end

    it "should require 2nd-d Arrays size 3" do
      lambda {Grid.new([[], [], []])}.should raise_error(ArgumentError, "Initialization data must be 3 x 3 array of space, X, O only")
    end

    it "should limit seed elements to space, X, O" do
      lambda {Grid.new([[nil,nil,nil], [nil,nil,nil], [nil,nil,nil]])}.should raise_error(ArgumentError, "Initialization data must be 3 x 3 array of space, X, O only")
    end

  end
end

