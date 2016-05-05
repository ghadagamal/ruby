class LecturesController < ApplicationController
  before_action :set_lecture, only: [:show, :edit, :update, :destroy]

before_action :authenticate , only: [:new, :edit, :update, :destroy]

def authenticate
  redirect_to( new_user_session_path)  unless  user_signed_in? 
end




 def upvote
  @lectures = Lecture.find(params[:id])
  @lectures.liked_by current_user
  redirect_to @lectures
end

def downvote
  @lectures = Lecture.find(params[:id])
  @lectures.downvote_from current_user
  redirect_to @lectures
end

def score
  self.get_upvotes.size 
end
  # GET /lectures
  # GET /lectures.json
  def index
    @lectures = Lecture.all
   
  end



 def download 
     
      my_file = params[:attach]
    send_file my_file
  end




def showrelated
  @xxx=params[:id] 
 @lectures = Lecture.where(:course_id =>params[:id] );

end



def comment
   @lecture=Lecture.find(params[:id])


      @comment = @lecture.comments.create(params[:comment])

   if @comment.save
    redirect_to @lecture
  else
    flash.now[:danger] = "error"
  end
end




  # GET /lectures/1
  # GET /lectures/1.json
  def show
 


 
  
  end

  # GET /lectures/new
  def new
    @lecture = Lecture.new
    #@courses  = Course.find(:all, :conditions => { :user_id => current_user.id })
    @courses = Course.where(:user_id => current_user.id );
  
  end

  # GET /lectures/1/edit
  def edit
 @courses = Course.where(:user_id => current_user.id );
  end

  # POST /lectures
  # POST /lectures.json
  def create
    @lecture = Lecture.new(lecture_params)
 @courses = Course.where(:user_id => current_user.id );
if @courses
    respond_to do |format|
      if @lecture.save
        format.html { redirect_to @lecture, notice: 'Lecture was successfully created.' }
        format.json { render :show, status: :created, location: @lecture }
      else
        format.html { render :new }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
else
respond_to do |format|
        format.html { redirect_to courses_url, notice: 'add course first!!.' }
 format.json { head :no_content }
end
end
  end

  # PATCH/PUT /lectures/1
  # PATCH/PUT /lectures/1.json
  def update
@lecture= Lecture.find(params[:id])
    if current_user.id==@lecture.course.user.id
    respond_to do |format|
           @courses = Course.where(:user_id => current_user.id );
      if @lecture.update(lecture_params)
        format.html { redirect_to @lecture, notice: 'Lecture was successfully updated.' }
        format.json { render :show, status: :ok, location: @lecture }
      else
        format.html { render :edit }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
else
 respond_to do |format|
        format.html { redirect_to courses_url, notice: 'lecture cant be updated.' }
 format.json { head :no_content }
end
  end
 
end
#showrelated_lecture_path(:id=>@lecture.course_id)
  # DELETE /lectures/1
  # DELETE /lectures/1.json
  def destroy
@lecture= Lecture.find(params[:id])
    if current_user.id==@lecture.course.user.id
    @lecture.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Lecture was successfully destroyed.' }
      format.json { head :no_content }
    end
 
else
 respond_to do |format|
        format.html { redirect_to courses_url, notice: 'lecture cant be destoried.' }
 format.json { head :no_content }
end
end
end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecture
      @lecture = Lecture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lecture_params
      params.require(:lecture).permit(:title, :attach, :course_id)
    end












end
