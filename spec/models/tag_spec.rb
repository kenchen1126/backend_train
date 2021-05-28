require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "Tag validation" do
    let(:tag) {create(:tag)}
    context "create tag success" do
      it "valid successfully" do
        expect(tag).to be_valid
      end
    end

    context " failed to create tag" do
      it "is not valid without a name" do
        tag.name = nil
        
        expect(tag).to_not be_valid
        expect(tag.errors.full_messages).to include "Name 不能為空白"
      end
    end
  end
end
