class WordPath

  def initialize(start_word, end_word)
    @start_word = start_word
    @end_word = end_word
    @rank = start_word.length
    @words = File.read(File.join("dict","#{@rank}.txt")).split(" ")
    @letters = ("a".."z").to_a
    @queue = AQueue.new()
    @solution = nil
    find_solution
  end


  private
  def find_solution()
    @queue.push(TTreeWithParent.new(@start_word))
    while (!@queue.empty?) do
      build_children(@queue.pull)
    end
    puts "No path found"
  end


  def build_children(node)
    valid_paths = find_valid_paths(node.value)
    valid_paths.each do |word|
      new_node = TTreeWithParent.new(word, node)
      if new_node.value == @end_word
        @solution = new_node
        display_solution
      else
        @queue.push(new_node)
      end
    end
  end

  def display_solution()
    puts @solution.tree_string
  end

  def find_valid_paths(word)
    words = []
    0.upto @rank - 1 do |i|
      chk_word = word[0...i] + word[i] + word[i+1..@rank - 1]
      @letters.each do |letter|
        next if letter == word[i]
        chk_word[i] = letter
        if @words.include?(chk_word)
          words << chk_word.dup
          @words.delete(chk_word)
        end
      end
    end
    words
  end

end

class TTreeWithParent

  attr_accessor :value, :parent

  def initialize(value, parent=nil)
    @value = value
    @parent = parent
    @children = []
  end

  def to_s
    @value
  end

  def tree_string
    build_tree(self).reverse.join(" -> ")
  end

  private
  def build_tree(node, tree=[])
    tree << node
    if (node.parent)
      build_tree(node.parent, tree)
    else
      tree
    end
  end


end

class AQueue < Array

  def initialize
    super
  end

  def pull
    self.delete_at(0)
  end

end

#WordPath.new("ruby", "code")
