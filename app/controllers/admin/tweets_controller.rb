class Admin::TweetsController < Admin::BaseController
  def index
    @tweets = Tweet.all.order("created_at DESC")
  end

  def destroy
    @tweet = Tweet.find(params[:id])   
    @tweet.destroy
    redirect_to admin_root_path
    flash[:alert] = "tweet was deleted"
  end

  private

    def tweet_params
      params.require(:tweet).permit(:description)
    end
end
