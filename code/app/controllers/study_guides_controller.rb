class StudyGuidesController < ApplicationController
  before_action :set_study_guide, only: [:show, :edit, :update, :destroy]

  # GET /study_guides
  # GET /study_guides.json
  def index
    @study_guides = StudyGuide.all
  end

  # GET /study_guides/1
  # GET /study_guides/1.json
  def show
  end

  # GET /study_guides/new
  def new
    @study_guide = StudyGuide.new
  end

  # GET /study_guides/1/edit
  def edit
  end

  # POST /study_guides
  # POST /study_guides.json
  def create
    @study_guide = StudyGuide.new(study_guide_params)

    respond_to do |format|
      if @study_guide.save
        format.html { redirect_to @study_guide, notice: 'Study guide was successfully created.' }
        format.json { render :show, status: :created, location: @study_guide }
      else
        format.html { render :new }
        format.json { render json: @study_guide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /study_guides/1
  # PATCH/PUT /study_guides/1.json
  def update
    respond_to do |format|
      if @study_guide.update(study_guide_params)
        format.html { redirect_to @study_guide, notice: 'Study guide was successfully updated.' }
        format.json { render :show, status: :ok, location: @study_guide }
      else
        format.html { render :edit }
        format.json { render json: @study_guide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /study_guides/1
  # DELETE /study_guides/1.json
  def destroy
    @study_guide.destroy
    respond_to do |format|
      format.html { redirect_to study_guides_url, notice: 'Study guide was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study_guide
      @study_guide = StudyGuide.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def study_guide_params
      params.require(:study_guide).permit(:title)
    end
end
