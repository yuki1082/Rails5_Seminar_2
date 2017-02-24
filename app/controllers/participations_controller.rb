class ParticipationsController < ApplicationController
	def create
		plan_item = PlanItem.find(params[:plan_item_id])
		plan_item.participations.create!(user: current_user)
		flash.notice = '申し込みを受付ました'
		redirect_to [current_user, :plan_items] 
	end 

	def destroy
		plan_item = PlanItem.find(params[:plan_item_id])
		user = User.find_by(id: current_user.id)
		plan_item.participants.destroy(user)
		flash.notice = '#{plan_item.name}の申し込みをキャンセルしました'
		redirect_to [current_user, :plan_items]
	end 
end