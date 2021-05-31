require 'rails_helper'

RSpec.feature "TaskSearches", type: :feature do
  # describe "Task search" do
  #   before do
  #     task_1 = create(:task, 
  #                     name: "task_1", 
  #                     status: I18n.t("task.pending"), 
  #                     priority: I18n.t("task.low")
  #                   )
  #     task_2 = create(:task,
  #                      name: "task_2",
  #                      status: I18n.t("task.in_progress"),
  #                      priority: I18n.t("task.medium"))
  #     task_3 = create(:task,
  #                     name: "task_3",
  #                     status: I18n.t("task.done"),
  #                     priority: I18n.t("task.high"))
  #     visit root_path
  #   end
    
  #   context "By name" do
  #     scenario "Can only see specific-name task" do
  #       within "div.main_search" do
  #         find_field("q_name_cont").set("task_1")
  #         click_button I18n.t("search.submit_btn")
  #       end

  #       expect(page).to have_content "task_1"
  #       expect(page).to have_no_content "task_2"
  #       expect(page).to have_no_content "task_3"
  #     end
  #   end

  #   context "By status" do
  #     scenario "Can only see specific-status task" do
  #       within "div.main_search" do
  #         select task_enum(:status, :pending), :from => "q_status_eq"
  #         click_button I18n.t("search.submit_btn")
  #       end
  #       expect(page).to have_content "task_1"
  #       expect(page).to have_no_content "task_2"
  #       expect(page).to have_no_content "task_3"

  #       within "div.main_search" do
  #         select task_enum(:status, :in_progress), :from => "q_status_eq"
  #         click_button I18n.t("search.submit_btn")
  #       end

  #       expect(page).to have_no_content "task_1"
  #       expect(page).to have_content "task_2"
  #       expect(page).to have_no_content "task_3"

  #       within "div.main_search" do
  #         select task_enum(:status, :done), :from => "q_status_eq"
  #         click_button I18n.t("search.submit_btn")
  #       end

  #       expect(page).to have_no_content "task_1"
  #       expect(page).to have_no_content "task_2"
  #       expect(page).to have_content "task_3"
  #     end
  #   end

  #   context "By priority" do
  #     scenario "Can only see specific-priority task" do
  #       within "div.main_search" do
  #         select task_enum(:priority, :low), :from => "q_priority_eq"
  #         click_button I18n.t("search.submit_btn")
  #       end

  #       expect(page).to have_content "task_1"
  #       expect(page).to have_no_content "task_2"
  #       expect(page).to have_no_content "task_3"

  #       within "div.main_search" do
  #         select task_enum(:priority, :medium), :from => "q_priority_eq"
  #         click_button I18n.t("search.submit_btn")
  #       end

  #       expect(page).to have_no_content "task_1"
  #       expect(page).to have_content "task_2"
  #       expect(page).to have_no_content "task_3"

  #       within "div.main_search" do
  #         select task_enum(:priority, :high), :from => "q_priority_eq"
  #         click_button I18n.t("search.submit_btn")
  #       end
        
  #       expect(page).to have_no_content "task_1"
  #       expect(page).to have_no_content "task_2"
  #       expect(page).to have_content "task_3"
  #     end
  #   end

  #   context "By status and name and priority" do
  #     scenario "Can only see specific name, status and priority task" do
  #       within "div.main_search" do
  #         find_field("q_name_cont").set("task_1")
  #         select task_enum(:status, :pending), :from => "q_status_eq"
  #         select task_enum(:priority, :low), :from => "q_priority_eq"
  #         click_button I18n.t("search.submit_btn")
  #       end

  #       expect(page).to have_content "task_1"
  #       expect(page).to have_no_content "task_2"
  #       expect(page).to have_no_content "task_3"

  #       within "div.main_search" do  
  #         find_field("q_name_cont").set("task_2")
  #         select task_enum(:status, :pending), :from => "q_status_eq"
  #         select task_enum(:priority, :medium), :from => "q_priority_eq"
  #         click_button I18n.t("search.submit_btn")
  #       end
        
  #       expect(page).to have_no_content "task_1"
  #       expect(page).to have_no_content "task_2"
  #       expect(page).to have_no_content "task_3"
  #     end
  #   end

  # end
end
