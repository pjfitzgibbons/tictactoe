# To change this template, choose Tools | Templates
# and open the template in the editor.

# Representing 3 x 3 Tic Tac Toe grid of space, X's and O's.
class Grid
  #Create new empty grid or pre-populated grid with input 2-d Array (see #validate)
  def initialize(data = nil)
    validate data
    @data = data || [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
  end

  # Verify that initializtion data is 3 x 3 2-d array of only space, X or O
  def validate(data)
    if data
      unless data.is_a?(Array) && data.size == 3
        raise ArgumentError, "Initialization data must be 3 x 3 array of space, X, O only"
      end
      data.each do |row|
        unless row.is_a?(Array) && row.size == 3
          raise ArgumentError, "Initialization data must be 3 x 3 array of space, X, O only"
        end
        row.each do |elem|
          unless [' ','X','O'].include?(elem)
            raise ArgumentError, "Initialization data must be 3 x 3 array of space, X, O only"
          end
        end
      end

    end
  end

  #Retrieve state (space, X, O) of single game space, indexed as zero-based 2-d
  #Element 0,0 is top-left
  #Element 2,2 is bottom-right
  def [](idx,idx2)
    @data[idx][idx2]
  end

  # return pretty text of current Tic Tac Toe game
  def display
    text = ''
    text_rows = @data.map do |row|
      row.join(' | ')
    end
    text_rows.join("\n---------\n")
#      "  |   |
#---------
#  |   |
#---------
#  |   |  "
#
#    return text

  end

  
end
