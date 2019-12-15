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
  if valid_move?(user_input) == true
      move(user_input, char)
      display_board
      
  else
    turn
    
    
  end
end


# #won?
# def won?(board) 
# 	WIN_COMBINATIONS.each do |win_combo| 
# 		if (board[win_combo[0]]) == "X" && (board[win_combo[1]]) == "X" && (board[win_combo[2]]) == "X" 
# 			return win_combo 
# 		elsif (board[win_combo[0]]) == "O" && (board[win_combo[1]]) == "O" && (board[win_combo[2]]) == "O" 
# 			return win_combo
# 		end
# 	end
# 	false
# end	

# #full?
# def full?(board)
#   if board.include?(" ") || board.include?("")
#     return false
#   else
#     return true
#   end
# end

# #draw?
# def draw?(board)
#   if !won?(board) && full?(board)
#     return true
#   end
# end

# #game over?
# def over?(board)
#   if won?(board) || draw?(board) || full?(board)
#     return true
#   else
#     return false
#   end
# end

# #who won?
# def winner(board)
#   WIN_COMBINATIONS.each do |win_combo|
#     if (board[win_combo[0]]) == "X" && (board[win_combo[1]]) == "X" && (board[win_combo[2]]) == "X" 
# 			return "X"
# 		elsif (board[win_combo[0]]) == "O" && (board[win_combo[1]]) == "O" && (board[win_combo[2]]) == "O" 
# 			return "O"
# 		end
# 	end
# 	nil
# end


# def play(board)
#   until over?(board) == true
#     turn(board)
#   end
#   if winner(board) == "X"
#     puts "Congratulations X!"
#   elsif winner(board) == "O"
#     puts "Congratulations O!"
#   elsif draw?(board)
#     puts "Cat's Game!"
#   end
# end




  
end