# frozen_string_literal: true

def traverse_board(from, to)
  to_visit = [[[from], from]]
  until to_visit.empty?
    path, cell = to_visit.shift
    break if cell == to

    get_legal_moves(path, cell).each do |move|
      to_visit.push([path + [move], move])
    end
  end
  return path unless to_visit.empty?

  "error"
end

def get_legal_moves(used, square)
  list = []
  [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]].each do |shift|
    new = [shift[0] + square[0], shift[1] + square[1]]
    list.push(new) if new[0].between?(0, 8) && new[1].between?(0, 8) && !used.include?(new)
  end
  list
end

p traverse_board([0, 0], [1, 1])
p traverse_board([0, 0], [1, 8])
p traverse_board([0, 0], [8, 8])
p traverse_board([0, 0], [8, 1])
p traverse_board([0, 0], [3, 3])
p traverse_board([0, 0], [7, 7])
p traverse_board([3, 3], [4, 3])
