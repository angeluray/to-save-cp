class RelationsController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @charges = @group.relations.includes(:charge).order('charges.created_at DESC').map(&:charge)
  end
end
