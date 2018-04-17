# Name: Victoria Green
# Course: CSC 415
# Semester: Spring 2018
# Instructor: Dr. Pulimood
# Project name: hyperfocus
# Description: studyguide generator
# Filename: study_guides_controller.rb
# Description: Study guide controller initializing creating and exporting


class StudyGuidesController < ApplicationController
  before_action :set_study_guide, only: [:show, :edit, :update, :destroy]

  # GET /study_guides
  # GET /study_guides.json
  #automatically generated
  def index
    @study_guides = StudyGuide.all
  end

  # GET /study_guides/1
  # GET /study_guides/1.json
  #automatically generated
  def show
  end

  # GET /study_guides/new
  #automatically generated
  def new
    puts "making it!"
    @study_guide = StudyGuide.new

  end

  # GET /study_guides/1/edit
  #automatically generated
  def edit
  end

  # POST /study_guides
  # POST /study_guides.json
  #automatically generated

  # user has filled in form and has selected create study Guide
  # function takes input and saves it in params
  # an html file is created and intialized the essentials
  # potentially the user inputs would be entered into it with the appropriate tags (to be implemented)
  # after html file is created it would be converted into a pdf (to be implemented) and would re route to download pages_edit_path
  # indicating sucess and that the user can download now

  def create
    @study_guide = StudyGuide.new(study_guide_params)
    #wicked_pdf stuff

    if @study_guide.save
      #redirect_to edit_study_guide_path(@study_guide), notice: 'Study Guide Form was Successfully created.'


      html_file = File.new('public/temp.html', "w+")
      #send_data("<!DOCTYPE html>" => 'temp.html')
      html_file.puts "<!DOCTYPE html>"
      #send_data("<html lang=\"en\"> " => 'temp.html')
      html_file.puts "<html lang=\"en\"> "
      #send_data("<head>"=> 'temp.html')
      html_file.puts "<head>"
      #send_data("<meta charset=\"UTF-8\">"=> 'temp.html')
      html_file.puts "<meta charset=\"UTF-8\">"

      #style sheet
      # fonts
      #send_data( "</head>" => 'temp.html')
      html_file.puts "</head>"

      html_file.puts "<body>"
      #send_data("<body>"=> 'temp.html')
      html_file.puts "<h1>"
      html_file.puts  'title'
      html_file.puts "</h1>"

      html_file.puts "<h2>"
      html_file.puts  'Mainpoint'
      html_file.puts "</h2>"

      html_file.puts "<ul>"
      html_file.puts  "<li> bullet point </li> "
      html_file.puts  "<li> bullet point </li>"
      html_file.puts "</ul>"

      html_file.puts "<ol>"
      html_file.puts  "<li> numbering </li> "
      html_file.puts  "<li> number </li>"
      html_file.puts "</ol>"

      toprint_hash = study_guide_params.to_h
      html_file.puts toprint_hash


      topprint_hash.each do |curr, currVal|
        if curr.to_s == 'title'
          html_file.puts "<h1>" + curr=>currVal.to_s + "</h1>"
        elsif curr.to_s == 'sgfields_attributes'
          separatefields_hash = curr.to_h

          separatefields_hash.each do |number, info|
            information_hash = info.to_h
            html_file.puts information_hash

            end

        end


        end
      


      #title = toprint_hash.select { |key, value| key.to_s.match(/^title\d+/)}
      #html_file.puts  title.to_s
      #toprint_hash.delete(title)

      #toprint_hash each do |field, value|
        #value.each do |type , content|
          #case type
         # if type == 'Heading'
         #   html_file.puts "<h1> content is" + content + "</h1>"
         # else if type == 'Mainpoint'
         # else if type == 'bullet point'
         # else if type == 'numbering'
         # else if type == 'term definition'
         # else
            #html_file.puts "<h1> content is" + content + " and type is" + type + "</h1>"
         # end

      #  end


    #  end

      #send_data(study_guide_params => 'temp.html')

      html_file.puts "</body>"
      #send_data("</body>"=> 'temp.html')

      html_file.puts "</html>"
      #end_data("</html>"=> 'temp.html')
      html_file.close


      redirect_to pages_download_path, notice: 'Study Guide Form was Successfully created.'

    else
      redirect_to pages_new_path
      #render :new
    end
	end


  # PATCH/PUT /study_guides/1
  # PATCH/PUT /study_guides/1.json
  # automatically generated function that would update values of studyguide
  def update
    if @study_guide.update(study_guide_params)
      redirect_to edit_study_guide_path(@study_guide), notice:'Study Guide Successfully Updated'
    else
      render :edit
    end
  end

  # DELETE /study_guides/1
  # DELETE /study_guides/1.json
  #automatically generated
  #Delete study guide
  def destroy
    @study_guide.destroy
    redirect_to study_guides_url, notice: 'Study Guide was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_study_guide
    @study_guide = StudyGuide.find(params[:id])
  end

  #automatically generated.
  def study_guide_params
    params.require(:study_guide).permit(:title, sgfields_attributes: Sgfield.attribute_names.map(&:to_sym).push(:_destroy))
  end

end
