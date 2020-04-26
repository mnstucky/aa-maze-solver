require_relative "positionnode"
require 'byebug'

class MazeSolver

attr_reader :maze_array, :start, :end

def initialize
    @open_list = []
    @closed_list = []
    read_maze
    find_start
    find_end
    create_nodes
end

def read_maze
    maze_text = File.read("./maze1.txt")
    maze_rows = maze_text.split("\n")
    @maze_array = maze_rows.map { |row| row.split("") }
end

def find_start
    row = @maze_array.index { |row| row.include?("S") }
    column = @maze_array[row].index("S")
    @start = [row, column]
end

def find_end
    row = @maze_array.index { |row| row.include?("E") }
    column = @maze_array[row].index("E")
    @end = [row, column]
end

def create_nodes
    (0...@maze_array.length).each do |row|
        (0...@maze_array[0].length).each do |column|
            position = [row, column]
            maze_value = @maze_array[row][column]
            g_score = (@start[0] - row).abs + (@start[1] - column).abs
            h_score = (@end[0] - row).abs + (@end[1] - column).abs
            @maze_array[row][column] = PositionNode.new(position, maze_value, g_score, h_score)
        end
    end
end

end

# code for testing

m = MazeSolver.new
p m.maze_array[0][0]
p m.start
p m.end