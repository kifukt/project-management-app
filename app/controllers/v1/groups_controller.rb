class V1::GroupsController < ApplicationController
  before_action :set_group, only: [:destroy, :show, :change_leader,
                                   :add_user_to_group, :show_group_users,
                                   :remove_user_from_group, :update]

  def index
    @groups = current_user.groups
    render :index, status: :ok
  end

  def create
    @group = Group.new(group_params)
    @group.leader_id = current_user.id
    if @group.save
      current_user.groups << @group
      render :create
    else
      head(:unprocessable_entity)
    end
  end

  def destroy
    if @group.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  def show

  end

  def change_leader
    if params[:group][:leader_id].present? && current_user.id == @group.leader_id
      @group.leader_id = params[:group][:leader_id]
      if @group.save
        render :change_leader
      else
        head(:unprocessable_entity)
      end
    else
      head(:forbidden)
    end
  end

  def add_user_to_group
    if current_user.id == @group.leader_id
      @group.users << User.find(params[:user_id])
    else
      head(:forbidden)
    end
  end

  def remove_user_from_group
    if current_user.id == @group.leader_id
      @group.users.delete(User.find(params[:user_id]))
    else
      head(:forbidden)
    end
  end

  def update
    if @group.update(group_params)
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private

  def set_group
    @group = current_user.groups.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :leader_id)
  end

end
