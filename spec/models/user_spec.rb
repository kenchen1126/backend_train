require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User validation" do
    let(:user) {create(:user)}
    context "create user success" do
      it "valid successfully" do
        expect(user).to be_valid
      end
    end

    context " failed to create user" do
      it "is not valid without a name" do
        user.name = nil
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include "Name 不能為空白"
      end
      it "is not valid with duplicate name" do
        another_user = build(:user, name: user.name)
        another_user.save
        expect(another_user).to_not be_valid
        expect(another_user.errors.full_messages).to include "Name 已經被使用"
      end
      it "is not valid without a email" do
        user.email = nil
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include "Email 不能為空白"
      end
      it "is not valid with a wrong format email" do
        user.email = "test"
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include "Email 是無效的"
      end
      it "is not valid with duplicate email" do
        another_user = build(:user, email: user.email)
        another_user.save
        expect(another_user).to_not be_valid
        expect(another_user.errors.full_messages).to include "Email 已經被使用" 
      end
      it "is not valid without a password" do
        user.password = nil
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include "Password 不能為空白"
      end
      it "is not valid with a password shorter than six" do
        user.password = "12345"
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include "Password 過短（最短是 6 個字）"
      end

    end
  end
end
