class MyQueue
  def initialize()
    @list = []
  end

  def enqueue(value)
    list.push(value)
  end

  def dequeue
    list.shift
  end

  def show
    print list
  end

  def size
    list.length
  end

  def empty?
    list.empty?
  end

  private
  attr_reader :list
end