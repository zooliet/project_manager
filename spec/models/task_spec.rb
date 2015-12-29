require 'rails_helper'

RSpec.describe Task do
  it "can distinguish a completed task" do
    task = Task.new
    expect(task).not_to be_complete

    task.mark_completed
    expect(task).to be_complete
  end

  describe "velocity" do
    let(:task) { Task.new(size: 3) }

    it "does not count an incomplete task toward velocity" do
      expect(task).not_to be_part_of_velocity
      expect(task.points_toward_velocity).to eq(0)
    end

    it "does not count a long-ago task toward velocity" do
      task.mark_completed(6.months.ago)
      expect(task).not_to be_part_of_velocity
      expect(task.points_toward_velocity).to eq(0)
    end

    it "counts a recently completed task toward velocity" do
      task.mark_completed(1.day.ago)
      expect(task).to be_part_of_velocity
      expect(task.points_toward_velocity).to eq(3)
    end
  end

  describe 'initialization' do
    let(:task_recent) { Task.new(size: 3, completed_at: 2.days.ago) }
    let(:task_old) { Task.new(size: 3, completed_at: 22.days.ago) }

    it "accpets completed_at on initialization" do
      expect(task_recent).to be_complete
      expect(task_recent).to be_part_of_velocity
      expect(task_recent.points_toward_velocity).to eq(3)

      expect(task_old).to be_complete
      expect(task_old).not_to be_part_of_velocity
      expect(task_old.points_toward_velocity).to eq(0)
    end
  end
end
