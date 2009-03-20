# To change this template, choose Tools | Templates
# and open the template in the editor.

module GridArrayExtensions
    def player_count
      sq_count = Hash.new(0)
#      require 'ruby-debug'; debugger
      self.map {|sq| sq_count[sq] += 1}
      sq_count
    end
end
