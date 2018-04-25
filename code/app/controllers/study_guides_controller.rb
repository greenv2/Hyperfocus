=begin

Name: Victoria Green
Course: CSC 415
Semester: Spring 2018
Instructor: Dr. Pulimood
Project name: hyperfocus
Description: studyguide generator
Filename: study_guides_controller.rb0
Description: Study guide controller initializing creating and exporting

*** This file was generated by Framework ***
=end

class StudyGuidesController < ApplicationController
  before_action :set_study_guide, only: [:show, :edit, :update, :destroy]

  def index
    @study_guides = StudyGuide.all
  end

  def show
  end

  def new
    puts "making it!"
    @study_guide = StudyGuide.new
    @study_guide.sgfields.build
  end

  def edit
  end


  # user has filled in form and has selected create study Guide
  # function takes input and saves it in params
  # an html file is created and intialized the essentials
  # potentially the user inputs would be entered into it with the appropriate tags (to be implemented)
  # after html file is created it would be converted into a pdf (to be implemented) and would re route to download pages_edit_path
  # indicating sucess and that the user can download now

  def create
    @study_guide = StudyGuide.new(study_guide_params)

    if @study_guide.save


      html_file = File.new('public/temp.html', "w+")
      html_file.puts "<!DOCTYPE html>"
      html_file.puts "<html lang=\"en\"> "
      html_file.puts "<head>"
      html_file.puts "<meta charset=\"UTF-8\">"
      html_file.puts "<link href=\"https://fonts.googleapis.com/css?family=Dosis:300|Maven+Pro|Quicksand\" rel=\"stylesheet\">"
       html_file.puts "<style>" + "
       body{
            padding: 25px;
        }
        h1{
            text-align: center;
            font-family:'Maven Pro',sans-serif;
        }

        h2{
            font-family:'Maven Pro',sans-serif;
        }

        h3{
            font-family:'Dosis',sans-serif;
            font-weight: normal;
            font-size: 1.2em;
        }

        span{
            background-color: #fff2ac;
            background-image: linear-gradient(to right, #ffe359 0%, #fff2ac 100%);
        }

        p{
            font-family:'Dosis',sans-serif;
            font-weight: normal;
            font-size: 1.2em;
        }

        li{
            font-family:'Dosis',sans-serif;
            font-weight: normal;
            font-size: 1.2em;
        }

 " + "</style>"
      html_file.puts "</head>"

      html_file.puts "<body>"
 
      toprint_hash = study_guide_params.to_h
    
      tag = p
      span = 0;
      
      toprint_hash.each do |curr, currVal|
        if curr.to_s == 'title'
          html_file.puts "<h1>" + currVal.to_s + "</h1>"
        elsif curr.to_s == 'sgfields_attributes'
	  
	  currVal.each do |num, info|
	  	info.each do | name, value|
		 if name.to_s == 'type'
		     
		      	if value.to_s == "Heading"
				tag = 'h2'
			elsif value.to_s == "Mainpoint" 
				tag = 'h3'
			elsif value.to_s == "Term" 
				tag = 'p'
				span = 1
			elsif value.to_s == "BulletPoint"
				tag= 'ul'
			elsif value.to_s == "Definition" 
				tag = 'p'
				span = 2
		 	elsif value.to_s == "SubBulletPoint"
				tag = "ul ul"
			else 
			   tag = "p"
		     end
		 elsif name.to_s == 'content'
			if tag == 'ol' or tag == 'ul'
			  html_file.puts "<" + tag + ">"
			  html_file.puts "<li>"+ value.to_s + "</li>"
			  html_file.puts  "</" + tag + ">"

			elsif tag == "ul ul"
			  html_file.puts "<ul> <ul>"
                          html_file.puts "<li>"+ value.to_s + "</li>"
                          html_file.puts  "</ul></ul>"
			elsif span == 1
			  html_file.puts "<"+ tag.to_s+"><span > "+ value.to_s + "</span>"
			elsif span == 2
			  html_file.puts "-" + value.to_s + "</"+tag.to_s+">"
			  span = 0;
			else
			  html_file.puts "<"+ tag.to_s+">"+ value.to_s + "</"+tag.to_s+">"
			end
                 
		 end  
		
		
		 end
		
	  end
          

        end


        end
      



      html_file.puts "</body>"

      html_file.puts "</html>"
      html_file.close
	
      pdf = WickedPdf.new.pdf_from_html_file('/home/student1/Assignments/hyperfocus/code/public/temp.html')
	

send_data(pdf, :filename => "studyguide.pdf", :disposition => 'attachment', :notice => 'Study Guide was Successfully created.')

    else
      redirect_to pages_new_path
    end
	end


  # automatically generated function that would update values of studyguide
  def update
    if @study_guide.update(study_guide_params)
      redirect_to edit_study_guide_path(@study_guide), notice:'Study Guide Successfully Updated'
    else
      render :edit
    end
  end

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
