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
      "  |   |  \n" +
      "---------\n" +
      "  |   |  \n" +
      "---------\n" +
      "  |   |  "
    
  end

  describe "should allow player to move" do
    it "to top-left square #1" do
      @grid.play_square('X', 1)
      @grid[0,0].should == 'X'
    end
    it "to center square #5" do
      @grid.play_square('O', 5)
      @grid[1,1].should == 'O'
    end

    it "to bottom-right square #9" do
      @grid.play_square('X', 9)
      @grid[2,2].should == 'X'
    end
  end

  describe "should error on player move" do
    it "when player mark is not X or O" do
      lambda {@grid.play_square(' ', 1)}.should raise_error(ArgumentError, "Player Move must be for X or O")
    end

    it "when square use is < 1" do
      lambda {@grid.play_square('X', 0)}.should raise_error(ArgumentError, "Player Move must be for squares 1 to 9")
    end

    it "when square use is > 9" do
      lambda {@grid.play_square('X', 10)}.should raise_error(ArgumentError, "Player Move must be for squares 1 to 9")
    end
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
        "  | X | X\n" +
        "---------\n" +
        "X | X | X\n" +
        "---------\n" +
        "X | X | O"

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

  describe "with no win and unfilled spaces" do
    before(:each) do
      @grid = Grid.new([
          [' ', 'X', 'O'],
          ['X', ' ', 'O'],
          [' ', 'O', 'X']])
    end

    it "should have status In-Play" do
      @grid.status.should == "In-Play"
    end
  end

  describe "converts indexes to square numbers" do
    it "should convert rows" do
      [
        [0, [1, 2, 3]],
        [1, [4, 5, 6]],
        [2, [7, 8, 9]]
      ].each do |test|
        @grid.row_squares(test[0]).should == test[1]
      end      
    end

    it "should convert columns" do
      [
        [0, [1, 4, 7]],
        [1, [2, 5, 8]],
        [2, [3, 6, 9]]
      ].each do |test|
        @grid.column_squares(test[0]).should == test[1]
      end
    end
  end
end

