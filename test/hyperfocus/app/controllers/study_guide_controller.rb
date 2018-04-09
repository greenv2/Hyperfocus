class StudyGuideController < ApplicationController
  def index
  end

  def show
  end

  def new
    @study_guide = study_guide.new
  end

  def create
    @study_guide = study_guide.new(sgparams)
  end

  def update
  end

  def destroy
  end

  private

  def find_sg
  end

  def sgparams
    params.require(:sgform).permit(:title)
  end


end
