require "rails_helper"
describe PlanItemsController do
  describe '#create success' do
    example "template index" do
      m =  FactoryGirl.create(:user)
      session[:user_id] = m.id
      get :index
      expect(response).to have_http_status 200
    end
  end
end

describe PlanItemsController, "ログイン前" do
  example "Forbiddenエラーが出る" do
    m =  FactoryGirl.create(:user)
    expect {
      get :index
    }.to raise_error(ApplicationController::Forbidden)
  end
end

describe PlanItemsController, 'ログイン後' do
  describe '#index' do
    let(:user_1) { create(:user_with_plan_items) }
    let(:user_2) { create(:user_with_plan_items) }

#    before do
#      @user_1 = create(:user_with_plan_items)
#      @user_2 = create(:user_with_plan_items)
#    end
    example 'user_1のplan_itemsの件数は3件' do
      session[:user_id] = user_1.id
      get :index
      expect(assigns(:plan_items).count).to eq(3)
    end

    example 'plan_itemsのオーナの名前はuser_1' do 
      session[:user_id] = user_1.id
      get :index
      plan_items = assigns(:plan_items)
      expect(plan_items.any? {|item| item.user == user_2 }).to be_falsey     
#      expect(plan_items.all? {|item| item.user == user_1 }).to be_truthy     

    end 

  end
end
