require 'rails_helper'

RSpec.feature "Tasks", type: :feature, js: true do

  scenario "Task can be created" do
    click_link "新增任務"
    fill_in "task_name", with: "test"
    fill_in "task_description", with: "test test test"
    select "pending", :from => "task_status"
    select "low", :from => "task_priority"
    click_button "提交"

    
    expect(page).to have_content "test"
  end

  # scenario "Task can be edited" do
    
  #   click_link "新增任務"
  #   fill_in "task_name", with: "test"
  #   fill_in "task_description", with: "test123"
  #   click_button "create"
  #   find('a', text: 'test').click  
  #   click_link "task_edit"
  #   fill_in "task_name", with: "edittest"
  #   fill_in "task_description", with: "edittest123"
  #   click_button "提交"
    
  #   expect(page).to have_content "edittest"  
  # end

  # scenario "Task can be deleted" do
  #   click_link "new"
  #   fill_in "task_name", with: "test"
  #   fill_in "task_description", with: "test123"
  #   click_button "create"
  #   find('a', text: 'test').click  
  #   click_link "刪除"

  #   expect(page).to have_no_content "test"
  # end

end
