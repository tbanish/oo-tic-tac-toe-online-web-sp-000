class TicTacToe
  
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]

@user_input = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end


def input_to_index(user_input)
  @user_input = user_input
  user_input.to_i - 1
end

def move(position, char)
  @board[position] = char
end

def position_taken?(position)
  if @board[position] == " " || @board[position] == "" || @board[position]== nil
    false
  else @board[position] == "X" || "O"
    true
  end
end

def valid_move?(position)
  if position_taken?(position) == false && position.between?(0,8) == true
    true
  else position_taken?(position) == true
    false
  end
end

def turn_count
  number_of_turns = 0
  @board.each do |token|
    if token == "X" || token == "O"
    number_of_turns += 1
    end
  end
  return number_of_turns
end

def current_player
  turn_count.even? ? "X" : "O"
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  char = current_player
  if valid_move?(index) == true
    move(index, char)
    display_board
  else
    turn
  end
end

def won?
	WIN_COMBINATIONS.each do |win_combo| 
		if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X" 
	    return win_combo 
		elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O" 
	    return win_combo
		end
	end
	false
end	

def full?
  if @board.include?(" ") || @board.include?("")
    false
  else
    true
  end
end

def draw?
  if !won? && full?
    true
  end
end

def over?
  if won? || draw? || full?
    true
  else
    false
  end
end

def winner
  WIN_COMBINATIONS.each do |win_combo|
    if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X" 
		  return "X"
		elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O" 
	    return "O"
		end
	end
	nil
end


def play
  until over? == true
    turn
  end
  if winner == "X"
    puts "Congratulations X!"
  elsif winner == "O"
    puts "Congratulations O!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end