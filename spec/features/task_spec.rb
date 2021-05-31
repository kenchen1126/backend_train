require 'rails_helper'

RSpec.feature "Tasks", type: :feature, js: true do

  before do
    visit root_path

    find('a', text: '新增任務').click 
    fill_in "task_name", with: "測試任務"
    fill_in "task_description", with: "test"
    select task_enum(:status, :pending), :from => "task_status"
    select task_enum(:priority, :low), :from => "task_priority"
    click_button "提交"
  end

  
  scenario "Task can be created" do

    expect(current_url) == root_path
    expect(page).to have_content "測試任務"
  end

  scenario "Task can be readed" do
    find('a', text: '測試任務').click

    expect(page).to have_content "測試任務"
    expect(page).to have_content "test"
    expect(page).to have_content task_enum(:status, :pending)
    expect(page).to have_content task_enum(:priority, :low)
  end

  scenario "Task can be edited" do
    find('a', text: '修改').click  
    fill_in "task_name", with: "修改任務"
    fill_in "task_description", with: "edit task"
    click_button "提交"

    expect(current_url) == root_path
    expect(page).to have_content "修改任務"  
  end

  scenario "Task can be deleted" do
    find('a', text: '刪除').click  

    expect(current_url) == root_path
    expect(page).to have_no_content "測試任務"
  end
  

end
