# To change this template, choose Tools | Templates
# and open the template in the editor.
require 'spec/spec_helper'

require 'grid_array_extensions'

class Array
  include GridArrayExtensions
end

describe GridArrayExtensions do

  describe Array do
    it "should have player_count" do
      Array.new.methods.should include('player_count')
    end

    describe "player count" do
      it "should return hash of counts" do
        [' ', 'X', 'X'].player_count.should == {' ' => 1, 'X' => 2}
      end
    end
  end

  describe Hash do
    it "should not have player_count" do
      Hash.new.methods.should_not include('player_count')
    end
  end
end

