class Project
  attr_accessor :tasks

  def initialize
    @tasks = []
  end

  def done?
    # true
    # tasks.empty?
    tasks.reject(&:complete?).empty?
  end
end
