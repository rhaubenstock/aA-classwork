require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    root_node = TicTacToeNode.new(game.board, mark)
    children = root_node.children
    next_child = children[0]
    children.each do |child_node|
      if child_node.winning_node?(mark)
        return child_node.prev_move_pos
      elsif !child_node.losing_node?(mark)
        next_child = child_node
      end
    end
    raise 000 if next_child.losing_node?(mark)
    next_child.prev_move_pos
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
