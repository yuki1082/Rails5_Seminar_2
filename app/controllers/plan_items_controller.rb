class PlanItemsController < ApplicationController
  before_action :login_required
  def index
    if params[:user_id] && params[:user_id].to_i == current_user.id
      @plan_items = current_user.participating_events.
        order(:starts_at).page(params[:page])
    else
      @plan_items = PlanItem.order(:starts_at).page(params[:page])
    end
  end

  def show
    @plan_item = PlanItem.find(params[:id])
  end

  def new
    @plan_item = PlanItem.new
    time0 = Time.current.beginning_of_hour
    @plan_item.starts_at = time0.advance(hours: 1)
    @plan_item.ends_at = time0.advance(hours: 2)
  end

  def edit
    @plan_item = current_user.plan_items.find(params[:id])
  end

  def create
    @plan_item = PlanItem.new(plan_item_params)
    @plan_item.user = current_user
    if @plan_item.save
      @plan_item.participants << current_user
      redirect_to [current_user, :plan_items], notice: '予定を追加しました。'
    else
      render "new"
    end
  end

  def update
    plan_item = PlanItem.find(params[:id])
    plan_item.update_attributes(plan_item_params)

    redirect_to :plan_items, notice: '予定を更新しました。'
  end

  def destroy
    plan_item = current_user.plan_items.find(params[:id])
    plan_item.destroy!
    redirect_to :plan_items, notice: '予定を削除しました。'
  end

  private
  def plan_item_params
    params[:plan_item].permit(
      :name, :description,
      :starts_at_date_part, :starts_at_time_part,
      :ends_at_date_part, :ends_at_time_part
    )
  end
end
