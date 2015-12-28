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

  # def part_of_velocity?
  #   @completed
  # end

  # def points_toward_velocity
  #   if @completed then size else 0 end
  # end

end
