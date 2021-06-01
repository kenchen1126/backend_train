require 'rails_helper'

RSpec.feature "Admins", type: :feature do
  let(:user) {create(:user, authority: 1)}
  describe "User login" do
    before do  
      user_login(user)
    end
    context "If user as Admin" do
      before do
        @test_user = create(:user, name: "test_user")
        create(:task, name:"task_1", user_id: @test_user.id)
        find('a', text: I18n.t("admin_page")).click
      end

      scenario "can enter admin page" do
        expect(page).to have_content I18n.t("user.create_user")
      end

      scenario "can create user" do
        find('a', text: I18n.t("user.create_user")).click
        fill_in "user_name", with: "user_1"
        fill_in "user_password", with: Faker::Internet.password
        fill_in "user_email", with: Faker::Internet.email
        click_button I18n.t("button.submit")
        expect(page).to have_content "user_1"
      end

      scenario "can read user profile" do
        find('a', text: "test_user").click
        expect(page).to have_content @test_user.name
        expect(page).to have_content @test_user.email
        expect(page).to have_content "task_1"
      end

      scenario "can edit user" do
        within "tr##{@test_user.id}" do
          find('a', text: I18n.t("user.edit_user")).click
        end

        fill_in "user_name", with: "edited user"
        fill_in "user_password", with: @test_user.password
        fill_in "user_email", with: @test_user.email
        click_button I18n.t("button.submit")

        expect(page).to have_content "edited user"
      end

      scenario "can delete user" do
        within "tr##{@test_user.id}" do
        find('a', text: I18n.t("user.delete_user")).click
        end
        expect(page).to have_no_content @test_user.name
      end

    end
  end
end
