require 'rails_helper'
include ActiveSupport::Testing::TimeHelpers
RSpec.feature "TaskSorts", type: :feature, js: true do
 
  before do
    task_1 = create(:task, name: "task_1")
    travel 5.days do 
      task_2 = create(:task, name: "task_2")
    end
    travel_back
    travel 8.days do
      task_3 = create(:task, name: "task_3")
    end
    travel_back
    visit root_path
  end

  scenario "Task can sort by created_at" do
    within "div.task_item:nth-child(1)" do
      expect(page).to have_content "task_3"
    end
    within "div.task_item:nth-child(2)" do
      expect(page).to have_content "task_2"
    end
    within "div.task_item:nth-child(3)" do
      expect(page).to have_content "task_1"
    end
  end

end