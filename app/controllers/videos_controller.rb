class VideosController < InheritedResources::Base

  def index
    @videos = Video.all
  end

  def show
    id = params.require(:id)
    @video = Video.find(id)
  end

  def new
    if not signed_in?
      flash[:sucess] = "You must sign in"
      redirect_to new_session_path
    end
    @video = Video.new
  end

  def upload
    upload_info = params.require(:video).permit(:title, :description)
    gon.title = upload_info['title']
    gon.description = upload_info['description']

    @video = Video.create(upload_info)

    if @video
      # redirects me to save_video method (??)
      @upload_info = Video.token_form(params[:video], save_video_new_video_url(:video_id => @video.id))
    else
      # go to the new.html.erb page -- happens just encase somehow the user
      # reached this page without going through the new page
      respond_to do |format|
        format.html { render "/videos/new" }
      end
    end
  end

  def save_video
    # got here from upload method
    @video = Video.find(params[:video_id])
    if params[:status].to_i == 200
      @video.update_attributes(:yt_video_id => params[:id].to_s, :is_complete => true)
      Video.delete_incomplete_videos
      current_user.videos << @video
    else
      Video.delete_video(@video)
    end
    # redirected to the index page
    redirect_to videos_path, :notice => "video successfully uploaded"
  end


  def edit
    id = params.require(:id)

    if signed_in?
      if not current_user.videos.where(:id => id).first
        flash[:sucess] = "You can only edit your own videos"
        redirect_to root_path
      end
    end

    @video = Video.find(id)

  end 

  def update
    updated_info = params.require(:video).permit(:title, :description)
    @video = Video.find(params[:id])
    @result = Video.update_video(@video, updated_info)
    respond_to do |format|
      format.html do
        if @result
          redirect_to @video, :notice => "video successfully updated"
        else
          respond_to do |format|
            format.html { render "/videos/_edit" }
          end
        end
      end
    end
  end

  def destroy
    id = params[:id]
    @video = Video.find(id)

    if not current_user.videos.where(:id => id).first
      flash[:sucess] = "You can only delete your own videos"
      redirect_to root_path
      return
          
    elsif Video.delete_video(@video)
      flash[:notice] = "video successfully deleted"

    else
      flash[:error] = "video unsuccessfully deleted"

    end

    redirect_to videos_path
  end


  def add_comment
    @video = Video.find(params[:id])
    if @video.create_comment(params[:video][:comment])
      flash[:notice] = "Comment has been sucessfully added."
    else
      flash[:error] = "Sorry the comment has not been added."
    end
    redirect_to @video    
  end

  protected
    def collection
      @videos ||= end_of_association_chain.completes
    end

end
