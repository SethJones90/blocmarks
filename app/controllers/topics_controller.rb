class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end


  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
  end

  def new
    @topic = Topic.new
  end

  def edit
  end

  def create
    @topic = Topic.new(params.require(:topic).permit(:title))
    if @topic.save
      flash[:notice] = "Topic was saved"
      redirect_to @topic
    else
      flash[:error] = "There was an error saving the topic. Please try again."
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.destroy
      flash[:notice] = "Topic was deleted."
      redirect_to topics_path
    else
      flash[:error] = "There was an error deleting the topic. Please try again."
      render :show
    end
  end
  
end
