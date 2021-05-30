require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "Task validation" do
    let(:user) {create(:user)}
    let(:task) {user.tasks.create(name:"task_1")}
    context "create task success" do
      it "valid successfully" do
        expect(task).to be_valid
      end
    end

    context " failed to create task" do
      it "is not valid without a name" do
        task.name = nil
        expect(task).to_not be_valid
        expect(task.errors.full_messages).to include "Name 不能為空白"
      end
    end
  end
end
