class Task
  attr_accessor :size, :completed_at, :completed

  def initialize(options = {})
    # @completed = false
    @completed = options[:completed]
    @size = options[:size]
    # @completed_at = options[:completed_at]
    mark_completed(options[:completed_at]) if options[:completed_at]
  end

  def complete?
    # @completed
    completed || completed_at.present?
  end

  def mark_completed(date = nil)
    @completed = true
    @completed_at = (date || Time.current)
  end

  def part_of_velocity?
    # @completed
    # @completed && (@completed_at > 3.weeks.ago)
    # completed && (completed_at > 3.weeks.ago)
    return false unless complete?
    completed_at > 3.weeks.ago
  end

  def points_toward_velocity
    # if @completed then size else 0 end
    if part_of_velocity? then size else 0 end
  end

end
