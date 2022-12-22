class ChargesController < ApplicationController
  before_action :set_charge, only: %i[show edit update destroy]

  # GET /charges or /charges.json
  def index
    @group_charges = Charges.all.order('charges.created_at DESC').includes[:user]
  end

  # GET /charges/1 or /charges/1.json
  def show; end

  # GET /charges/new
  def new
    @charge = Charge.new
  end

  # POST /charges or /charges.json
  def create
    @charge = Charge.new(charge_params)
    @charge.author_id = current_user.id

    respond_to do |format|
      if @charge.save
        @charge_category = Relation.create(charge_id: @charge.id, group_id: group_params[:group_id])
        format.html do
          redirect_to group_relations_path(@charge_category.group_id), notice: 'Charge was successfully created.'
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /charges/1 or /charges/1.json
  def destroy
    @charge.destroy

    respond_to do |format|
      format.html { redirect_to charges_url, notice: 'Charge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_charge
    @charge = Charge.find(params[:id])
  end

  def group_params
    params.require(:charge).permit(:group_id)
  end

  # Only allow a list of trusted parameters through.
  def charge_params
    params.require(:charge).permit(:name, :amount)
  end
end
