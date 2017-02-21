class ParticipationsController < ApplicationController
	def create
		plan_item = PlanItem.find(params[:plan_item_id])
		plan_item.participations.create!(user: current_user)
		flash.notice = '申し込みを受付ました'
		redirect_to [current_user, :plan_items] 
	end 
end