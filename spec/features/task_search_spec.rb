require 'rails_helper'

RSpec.feature "TaskSearches", type: :feature do
  describe "Task search" do
    before do
      task_1 = create(:task, name: "task_1", status: I18n.t("task.pending"))
      task_2 = create(:task, name: "task_2", status: I18n.t("task.in_progress"))
      task_3 = create(:task, name: "task_3", status: I18n.t("task.done"))
      visit root_path
    end
    context "By name" do
      scenario "Can only see specific-name task" do
        find_field("q_name_cont").set("task_1")
        click_button I18n.t("search.submit_btn")

        expect(page).to have_content "task_1"
        expect(page).to have_no_content "task_2"
        expect(page).to have_no_content "task_3"
      end
    end
    context "By status" do
      scenario "Can only see specific-status task" do
        select task_enum(:status, :pending), :from => "q_status_eq"
        click_button I18n.t("search.submit_btn")

        expect(page).to have_content "task_1"
        expect(page).to have_no_content "task_2"
        expect(page).to have_no_content "task_3"

        select task_enum(:status, :in_progress), :from => "q_status_eq"
        click_button I18n.t("search.submit_btn")

        expect(page).to have_no_content "task_1"
        expect(page).to have_content "task_2"
        expect(page).to have_no_content "task_3"

        select task_enum(:status, :done), :from => "q_status_eq"
        click_button I18n.t("search.submit_btn")

        expect(page).to have_no_content "task_1"
        expect(page).to have_no_content "task_2"
        expect(page).to have_content "task_3"
      end
    end
    context "By status and name" do
      scenario "Can only see specific name and status task" do
        find_field("q_name_cont").set("task_1")
        select task_enum(:status, :pending), :from => "q_status_eq"
        click_button I18n.t("search.submit_btn")

        expect(page).to have_content "task_1"
        expect(page).to have_no_content "task_2"
        expect(page).to have_no_content "task_3"

        find_field("q_name_cont").set("task_2")
        select task_enum(:status, :pending), :from => "q_status_eq"
        click_button I18n.t("search.submit_btn")

        expect(page).to have_no_content "task_1"
        expect(page).to have_no_content "task_2"
        expect(page).to have_no_content "task_3"
      end
    end
  end
end
