require 'rails_helper'

RSpec.feature "Tasks", type: :feature, js: true do
  let(:user) {create(:user)}
  before do
    user_login(user)

    find('a', text: '新增任務').click 
    fill_in "task_name", with: "測試任務"
    fill_in "task_description", with: "test"
    select task_enum(:status, :pending), :from => "task_status"
    select task_enum(:priority, :low), :from => "task_priority"
    click_button "提交"
  end

  describe "Task CRUD" do
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

  describe "user can only see his task" do
    before do
      task_1 = create(:task,
                      name: "task_1", 
                      created_at: Faker::Time.forward(days: 10, period: :evening),
      )
      task_2 = create(:task, 
                      name: "task_2",
                      created_at: Time.now,
                      user_id: user.id
      )
      task_3 = create(:task, 
                      name: "task_3",
                      created_at: Faker::Time.backward(days: 20, period: :evening),
                      user_id: user.id
      )
      user_login(user)
    end

    scenario "user can see his task " do
      expect(page).to have_content "task_2"
      expect(page).to have_content "task_3"
      expect(page).to have_no_content "task_1"
    end
  end
end
