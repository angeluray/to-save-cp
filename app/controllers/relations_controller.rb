class RelationsController < ApplicationController
  before_action :set_relation, only: %i[ show edit update destroy ]

  # GET /relations or /relations.json
  def index
    @relations = Relation.all
  end

  # GET /relations/1 or /relations/1.json
  def show
  end

  # GET /relations/new
  def new
    @relation = Relation.new
  end

  # GET /relations/1/edit
  def edit
  end

  # POST /relations or /relations.json
  def create
    @relation = Relation.new(relation_params)

    respond_to do |format|
      if @relation.save
        format.html { redirect_to relation_url(@relation), notice: "Relation was successfully created." }
        format.json { render :show, status: :created, location: @relation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relations/1 or /relations/1.json
  def update
    respond_to do |format|
      if @relation.update(relation_params)
        format.html { redirect_to relation_url(@relation), notice: "Relation was successfully updated." }
        format.json { render :show, status: :ok, location: @relation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relations/1 or /relations/1.json
  def destroy
    @relation.destroy

    respond_to do |format|
      format.html { redirect_to relations_url, notice: "Relation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relation
      @relation = Relation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def relation_params
      params.fetch(:relation, {})
    end
end
