class Task
  attr_accessor :size

  def initialize(options = {})
    # @completed = false
    @completed = options[:completed]
    @size = options[:size]
  end

  def complete?
    @completed
  end

  def mark_completed
    @completed = true
  end
end
