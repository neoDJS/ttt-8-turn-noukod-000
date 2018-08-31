def tab_line(l_num, tab)
    line = " "
	count = 0
	3.times{ line  += "#{tab[ l_num*3 + count ]}"
	         if count < 2
			          line += " | "
			     else
			          line += " "
			     end
	         count += 1 }
	return line
end


def display_board(board)
  sLine = ""
  count_l = 0

  3.times{
  	puts tab_line(count_l, board)
  	if count_l < 2
  		puts "-----------"
  	end
    count_l += 1
  }

end

# code your #valid_move? method here
def valid_move?(board, index)
  if index.between?(0,8)
    if position_taken?(board, index)
      false
    else
      true
    end
  else
    false
  end
end

# re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
def position_taken?(board, index)
  if(board[index] == " " || board[index] == "" || board[index] == nil)
    false
  else
    true
  end
end


def move(board, index, sign="X")
   board[index] = sign
end


def input_to_index(user_input)
  index = user_input.to_i
  index -= 1
  return index
end


def turn(board)
  puts "Please enter 1-9:"
  index = input_to_index(gets.strip)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end
