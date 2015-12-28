class Project
  attr_accessor :tasks

  def initialize
    @tasks = []
  end

  def done?
    # true
    tasks.empty?
  end
end
