# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0, 1, 2],
                    [3, 4, 5],
                    [6, 7, 8],
                    [0, 3, 6],
                    [1, 4, 7],
                    [2, 5, 8],
                    [0, 4, 8],
                    [2, 4, 6]]

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    position_taken?(board, combo[0]) && position_taken?(board, combo[1]) &&
    position_taken?(board, combo[2]) && ((board[combo[0]] == "X" &&
    board[combo[1]] == "X" && board[combo[2]] == "X") || (board[combo[0]] == "O" &&
    board[combo[1]] == "O" && board[combo[2]] == "O"))
  end
end

def full?(board)
  value = true
  board.each do |space|
    value = value && space != " "
  end
  value
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  won = won?(board)
  if won
    board[won[0]]
  else
    nil
  end
end