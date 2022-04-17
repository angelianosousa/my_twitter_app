class UsersBackoffice::TweetsController < UsersBackofficeController
  before_action :set_tweet, only: %i[ show edit update destroy like dislike ]

  # GET /tweets or /tweets.json
  def index
    @tweets = Tweet.all.includes(:user)
  end

  # GET /tweets/1 or /tweets/1.json
  def show
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets or /tweets.json
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to users_backoffice_tweet_path(@tweet), notice: "Tweet was successfully created." }
        format.json { render users_backoffice_tweet_path(@tweet), status: :created, location: @tweet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1 or /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to users_backoffice_tweet_path(@tweet), notice: "Tweet was successfully updated." }
        format.json { render users_backoffice_tweet_path(@tweet), status: :ok, location: @tweet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1 or /tweets/1.json
  def destroy
    @tweet.destroy

    respond_to do |format|
      format.html { redirect_to users_backoffice_tweets_path, notice: "Tweet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def like
    @tweet.like current_user.id
    respond_to do |format|
      format.html { redirect_to users_backoffice_tweets_path, notice: 'Tweet was liked.' }
      format.json { head :no_content }
    end
  end

  def dislike
    @tweet.dislike current_user.id
    respond_to do |format|
      format.html { redirect_to users_backoffice_tweets_path, notice: 'Tweet was disliked' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:user_id, :declaration)
    end
end
