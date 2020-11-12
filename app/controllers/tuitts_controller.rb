class TuittsController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new create edit update]

  # GET /tuitts
  # GET /tuitts.json
  def index
    @tuitts = Tuitt.all.order(created_at: :desc)
    @newtuitt = Tuitt.new
  end

  # GET /tuitts/1
  # GET /tuitts/1.json
  def show; end

  # GET /tuitts/new
  def new
    @tuitt = Tuitt.new
  end

  # GET /tuitts/1/edit
  def edit; end

  # POST /tuitts
  # POST /tuitts.json
  def create
    @tuitt = Tuitt.new(tuitt_params)
    @tuitt.user_id = current_user.id

    respond_to do |format|
      if @tuitt.save
        format.html { redirect_to root_path, notice: 'Tuitt was successfully created.' }
        format.json { render :show, status: :created, location: @tuitt }
      else
        format.html { render :new }
        format.json { render json: @tuitt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tuitts/1
  # PATCH/PUT /tuitts/1.json
  def update
    respond_to do |format|
      if @tuitt.update(tuitt_params)
        format.html { redirect_to @tuitt, notice: 'Tuitt was successfully updated.' }
        format.json { render :show, status: :ok, location: @tuitt }
      else
        format.html { render :edit }
        format.json { render json: @tuitt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tuitts/1
  # DELETE /tuitts/1.json
  def destroy
    @tuitt.destroy
    respond_to do |format|
      format.html { redirect_to tuitts_url, notice: 'Tuitt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def my_tuitts
    @tuitts = Tuitt.all.order(created_at: :desc)
    @newtuitt = Tuitt.new
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @tuitt = Tuitt.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tuitt_params
    params.require(:tuitt).permit(:tuitt)
  end
end
