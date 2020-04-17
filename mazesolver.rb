class MazeSolver

attr_reader :maze_array

def initialize
    read_maze
end

def read_maze
    maze_text = File.read("./maze1.txt")
    maze_rows = maze_text.split("\n")
    @maze_array = maze_rows.map { |row| row.split("") }
end

end

# code for testing

m = MazeSolver.new
p m.maze_array