require 'rails_helper'
include ActiveSupport::Testing::TimeHelpers
RSpec.feature "TaskSorts", type: :feature, js: true do
  describe "Task sort" do
    context "sort by create_at" do
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
        
        find('.sort_link', text: I18n.t("task.create_at")).click

        within "tbody:nth-child(2) td:nth-child(1)" do
          expect(page).to have_content "task_3"
        end
        within "tbody:nth-child(3) td:nth-child(1)" do
          expect(page).to have_content "task_2"
        end
        within "tbody:nth-child(4) td:nth-child(1)" do
          expect(page).to have_content "task_1"
        end
      end
    end

    context "sort by end_at" do
      before do
        task_1 = create(:task, name: "task_1", end_at: Faker::Time.forward(days: 1, period: :evening))
        task_2 = create(:task, name: "task_2", end_at: Faker::Time.forward(days: 2, period: :evening))
        task_3 = create(:task, name: "task_3", end_at: Faker::Time.forward(days: 3, period: :evening))
        visit root_path
      end

      scenario "Task can sort by created_at" do
        
        find('.sort_link', text: I18n.t("task.end_at")).click

        within "tbody:nth-child(2) td:nth-child(1)" do
          expect(page).to have_content "task_3"
        end
        within "tbody:nth-child(3) td:nth-child(1)" do
          expect(page).to have_content "task_2"
        end
        within "tbody:nth-child(4) td:nth-child(1)" do
          expect(page).to have_content "task_1"
        end
      end
    end
  end
end