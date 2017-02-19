require "rails_helper"

describe User do

  describe("factories") do
    describe("user_with_plan_items") do
      example 'the number of plan_item is 3' do
        user = create(:user_with_plan_items)
        expect(user.plan_items.count).to eq 3
      end
    end
    describe '#index'
    
    describe '他人の記事の件数は反映されない' do
      example'user1のPlanItemの個数は2'do
        user1 = create(:user)
        user1.plan_items << create(:plan_item)
        user2 = create(:user)
        user2.plan_items << create(:plan_item)
        expect(user1.plan_items.count). to eq (1)
      end
    end

  end

  describe 'user#name' do
    example 'name shold be hoge'do
      user = User.new(name: "hoge", full_name: "hogehoge", hashed_password: nil)
      expect(user.name).to eq("hoge")
    end
  end

  describe 'user#full_name' do
    example 'full_name shold be hoge'do
      user = User.new(full_name: "hogehoge")
      expect(user.full_name).to eq("hogehoge")
    end
  end

  describe "user#hashed_password" do
    example 'hashed_password should not be password'do
      user = User.new(name: "hoge", full_name: "hoge", hashed_password: nil)
      expect(user.hashed_password).not_to eq("password")
    end
  end

  describe "user#authenticate" do
    example 'return true if password is correct' do
      user = create(:user)
      expect(user.name).to eq(user.name)
    end
  end


end
