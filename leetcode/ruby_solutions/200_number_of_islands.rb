#########################
# 200. Number of Islands
#
# Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water),
# return the number of islands.
#
# An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically.
# You may assume all four edges of the grid are all surrounded by water.
#
# Example 1:
#   Input: grid = [
#     ["1","1","1","1","0"],
#     ["1","1","0","1","0"],
#     ["1","1","0","0","0"],
#     ["0","0","0","0","0"]
#   ]
#   Output: 1
# Example 2:
#   Input: grid = [
#     ["1","1","0","0","0"],
#     ["1","1","0","0","0"],
#     ["0","0","1","0","0"],
#     ["0","0","0","1","1"]
#   ]
#   Output: 3
#
# Constraints:
#   m == grid.length
#   n == grid[i].length
#   1 <= m, n <= 300
#   grid[i][j] is '0' or '1'.
#
#########################
# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
  @rows, @cols, @grid = grid.length, grid[0].length, grid
  @directions = [[1,0], [-1,0], [0,1], [0,-1]]
  @visited = Set.new
  islands = 0

  (0...@rows).each do |r|
    (0...@cols).each do |c|
      if unvisited_land_point?(r, c)
        bfs(r, c)
        islands += 1
      end
    end
  end

  islands
end

def bfs(row, col)
  search_area = [[row, col]]
  @visited.add([row, col])

  until search_area.empty?
    row, col = search_area.shift
    
    @directions.each do |dr, dc|
      r, c = row + dr, col + dc

      if unvisited_land_point_on_grid?(r, c)
        search_area << [r, c]
        @visited << [r, c]
      end
    end
  end
end

def unvisited_land_point?(row, col)
  @grid[row][col] == '1' &&
  !@visited.include?([row, col])
end

def unvisited_land_point_on_grid?(row, col)
  (0...@rows).include?(row) &&
  (0...@cols).include?(col) &&
  unvisited_land_point?(row, col)
end
#########################
# Beats 9% Runtime, 11% Memory
