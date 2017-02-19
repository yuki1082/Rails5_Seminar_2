require "rails_helper"

describe PlanItem do
  describe 'belongs_to association' do
#    before do
#      @item = FactoryGirl.create(:plan_item)
#    end

    example 'plan_item belongs to a user' do
      item = create(:plan_item)
      expect(item.user).to_not eq nil
    end



  end
end
