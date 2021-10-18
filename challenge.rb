# frozen_string_literal: true

def depth_first_search(graph)
  discovered = Array.new(graph.keys.length, false)
  path = []
  stack = []
  stack.push(0)
  discovered[0] = true
  until stack.empty?
    current = stack.pop
    # We're processing the current element at this point. So, push the current node to the result path
    path.push(current)
    # Explore the adjacent nodes of the current node in reverse order
    graph[current].reverse_each do |adjacent|
      # If it had not been discovered previously, push it to the end of the stack and mark it discoreved
      unless discovered[adjacent]
        stack.push(adjacent)
        discovered[adjacent] = true
      end
    end
  end
  path
end

p depth_first_search({
                        0 => [2],
                        1 => [4],
                        2 => [5, 0, 3],
                        3 => [2],
                        4 => [1, 5],
                        5 => [4, 2]
                      })
# => [0, 2, 5, 4, 1, 3]
