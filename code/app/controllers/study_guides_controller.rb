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
    puts "creating it!"
    if @study_guide.save
      redirect_to edit_study_guide_path(@study_guide), notice: 'Study Guide Form was Successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /study_guides/1
  # PATCH/PUT /study_guides/1.json
  def update
    if @study_guide.update(study_guide_params)
      redirect_to edit_study_guide_path(@study_guide), notice:'Study Guide Successfully Updated'
    else
      render :edit
    end
  end

  # DELETE /study_guides/1
  # DELETE /study_guides/1.json
  def destroy
    @study_guide.destroy
    redirect_to study_guides_url, notice: 'Study Guide was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_study_guide
    @study_guide = StudyGuide.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def study_guide_params
    params.require(:study_guide).permit(:title, sgfields_attributes: Sgfield.attribute_names.map(&:to_sym).push(:_destroy))
  end

end
