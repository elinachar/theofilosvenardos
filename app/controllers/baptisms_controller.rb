class BaptismsController < ApplicationController
  before_action :set_baptism, only: [:show, :edit, :update, :destroy]

  # GET /baptisms
  # GET /baptisms.json
  def index
    @baptisms = Baptism.all
  end

  # GET /baptisms/1
  # GET /baptisms/1.json
  def show
  end

  # GET /baptisms/new
  def new
    @baptism = Baptism.new
  end

  # GET /baptisms/1/edit
  def edit
  end

  # POST /baptisms
  # POST /baptisms.json
  def create
    @baptism = Baptism.new(baptism_params)

    respond_to do |format|
      if @baptism.save
        format.html { redirect_to @baptism, notice: 'Baptism was successfully created.' }
        format.json { render :show, status: :created, location: @baptism }
      else
        format.html { render :new }
        format.json { render json: @baptism.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /baptisms/1
  # PATCH/PUT /baptisms/1.json
  def update
    respond_to do |format|
      if @baptism.update(baptism_params)
        format.html { redirect_to @baptism, notice: 'Baptism was successfully updated.' }
        format.json { render :show, status: :ok, location: @baptism }
      else
        format.html { render :edit }
        format.json { render json: @baptism.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /baptisms/1
  # DELETE /baptisms/1.json
  def destroy
    @baptism.destroy
    respond_to do |format|
      format.html { redirect_to baptisms_url, notice: 'Baptism was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_baptism
      @baptism = Baptism.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def baptism_params
      params.require(:baptism).permit(:photo)
    end
end
