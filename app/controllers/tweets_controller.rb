class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ show edit update destroy ]


  # GET /tweets or /tweets.json
  def index
    @tweets = Tweet.order(created_at: :desc)
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

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to tweets_path(@tweet), notice: "Le tweet a été créé." }
        format.json { render :show, status: :created, location: @tweet }
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
        format.html { redirect_to tweet_url(@tweet), notice: "Le tweet a été modifié." }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1 or /tweets/1.json
  def destroy
    if params[:password] == "123"
      @tweet.destroy
      redirect_to tweets_url, notice: "Le tweet a été supprimé."
    else
      redirect_to tweets_url, notice: "Mot de passe incorrect, le tweet n'a pas été supprimé."
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:username, :body, :image, :profilepicture, :name, :check)
    end
end
