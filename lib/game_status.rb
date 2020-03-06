
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #Top Row
  [3,4,5], #Middle Row
  [6,7,8], #Bottom Row
  [0,3,6], #Left Column
  [1,4,7], #Middle Column
  [2,5,8], #Right Column
  [0,4,8], #Diagonal Left
  [6,4,2]  #Diagonal Right
  ]


def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
      return win_combination
    end
  end
  return false
end

#()

def full?(board)
  board.all? {|i| i == "X" || i == "O"}
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  elsif full?(board) && won?(board) 
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
    return false
end

