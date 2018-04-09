class StudyGuideController < ApplicationController
  def index
  end

  def show
  end

  def new
    @study_guide = Study_guide.new
  end

  def create
    @study_guide = Study_guide.new(sgparams)
  end

  def update
  end

  def delete
  end

  private

  def find_sg
  end

  def sgparams
    params.require(:sgform).permit(:title)
  end


end
