
# @param {Integer[][]} points
# @return {Integer}
# Multiple points are on the same line if they have the same slope as each other.
# Iterate over each point once and create a Hash with the calculated slopes between
# that one point and every other point, to tally the count of how many points are on that slope.
def max_points(points)
  return points.length if points.length < 3
  result = 1

  for i in 0...points.length
      point1 = points[i]
      count = Hash.new(1) # set all default counts to 1 since we begin with point1
      for j in i+1...points.length
          point2 = points[j]
          if point2.first == point1.first
              slope = Float::INFINITY
          else
              slope = ((point2.last - point1.last).to_f / (point2.first - point1.first).to_f)
          end
          count[slope] += 1
          result = [result, count[slope]].max
      end
  end

  return result
end