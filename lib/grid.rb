# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'grid_array_extensions'
class Array
  include GridArrayExtensions
end

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

  def row_squares(index)
    first_square = (index * 3) + 1
    return [first_square, first_square + 1, first_square + 2]
  end

  def column_squares(index)
    first_square = index + 1
    return [first_square, first_square + 3, first_square + 6]
  end

  #return array of 3-square tuples of potential wins for player
  def detect_potential_win(player)
    potential_wins = []
    #potential wins on rows
#    require 'ruby-debug'; debugger
    @data.each_with_index do |row, i|
      if row.player_count == {' ' => 1, player => 2}
        potential_wins << row_squares(i)
      end
    end

    #potential wins on columns
    @data.transpose.each_with_index do |column, i|
      if column.player_count == {' ' => 1, player => 2}
        potential_wins << column_squares(i)
      end
    end

    #potential wins on diagonals
    diag_down = [@data[0][0], @data[1][1], @data[2][2]]
      if diag_down.player_count == {' ' => 1, player => 2}
        potential_wins << [1, 5, 9]
      end
    diag_up = [@data[2][0], @data[1][1], @data[0][2]]
      if diag_up.player_count == {' ' => 1, player => 2}
        potential_wins << [7, 5, 3]
      end

    return potential_wins
  end

  def detect_row_win(data)
    data.each do |row|
      if row.uniq.size == 1 and not row.uniq.include?(' ')
        return "#{row.uniq} Wins!"
      end
    end
    return nil
  end

  def detect_diag_win(data)
    diag_tl_br = [data[0][0], data[1][1], data[2][2]]
    diag_bl_tr = [data[2][0], data[1][1], data[0][2]]
    if diag_tl_br.uniq.size == 1 and not diag_tl_br.include?(' ')
      return "#{diag_tl_br.uniq} Wins!"
    elsif diag_bl_tr.uniq.size == 1 and not diag_bl_tr.include?(' ')
      return "#{diag_bl_tr.uniq} Wins!"
    end
  end

  #detect Win, Tie, or In-Play
  #Win reported as "X Wins!" or "O Wins!"
  #Tie reported as "Tie"
  #non-winning unfilled game reported as In-Play
  def status
    #Row-win detect
    result = detect_row_win(@data)
    return result if result

    #Column-win detect
    col_data = @data.transpose
#    require 'ruby-debug'; debugger
    result = detect_row_win(col_data)
    return result if result 

    #Diagonal-win detect
    result = detect_diag_win(@data)
    return result if result

    return "In-Play" if @data.flatten.include?(' ')

    return "Tie" #no wins, no spaces
  end

  #Set player's mark (X or O) into square 1 to 9
  #Squares are arranged as follows
  #
  #  1 | 2 | 3
  # -----------
  #  4 | 5 | 6
  # -----------
  #  7 | 8 | 9
  def play_square(player, square)
    raise(ArgumentError, "Player Move must be for X or O") if not %w(X O).include?(player)
    raise(ArgumentError, "Player Move must be for squares 1 to 9") if not (1..9).include?(square)
    
    sq_idx = square - 1 #all math below is zero-based
    col = sq_idx % 3 #modulus 3 gives column on each row (zero-based)
    row = sq_idx / 3 #divsion by 3 gives row (zero-based)
    @data[row][col] = player
  end
end
