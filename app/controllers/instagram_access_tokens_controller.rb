class InstagramAccessTokensController < ApplicationController
  # GET /instagram_access_tokens
  # GET /instagram_access_tokens.json
  def index
    @instagram_access_tokens = InstagramAccessToken.all
  end

  # GET /instagram_access_tokens/1
  # GET /instagram_access_tokens/1.json
  def show
  end

  # GET /instagram_access_tokens/new
  def new
    @instagram_access_token = InstagramAccessToken.new
  end

  # GET /instagram_access_tokens/1/edit
  def edit
  end

  # POST /instagram_access_tokens
  # POST /instagram_access_tokens.json
  def create
    @instagram_access_token = InstagramAccessToken.new(instagram_access_token_params)

    respond_to do |format|
      if @instagram_access_token.save
        format.html { redirect_to @instagram_access_token, notice: 'Instagram Access Token was successfully created.' }
        format.json { render :show, status: :created, location: @instagram_access_token }
      else
        format.html { render :new }
        format.json { render json: @instagram_access_token.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instagram_access_tokens/1
  # PATCH/PUT /instagram_access_tokens/1.json
  def update
    respond_to do |format|
      if @instagram_access_token.update(instagram_access_token_params)
        format.html { redirect_to @instagram_access_token, notice: 'Instagram Access Token was successfully updated.' }
        format.json { render :show, status: :ok, location: @instagram_access_token }
      else
        format.html { render :edit }
        format.json { render json: @instagram_access_token.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instagram_access_tokens/1
  # DELETE /instagram_access_tokens/1.json
  def destroy
    @instagram_access_token.destroy
    respond_to do |format|
      format.html { redirect_to instagram_access_tokens_url, notice: 'Instagram Access Token was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instagram_accesss_token
      @instagram_access_token = InstagramAccessToken.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instagram_access_token_params
      params.require(:instagram_access_token).permit(:access_token, :expires_at)
    end
end
