class RelationsController < ApplicationController

  # GET /relations or /relations.json
  def index
    @group = Group.find(params[:group_id])
    @charges = @group.relations.includes(:charge).map(&:charge)
  end
end
