class PhoneDetailsController < ApplicationController
  before_action :set_phone_detail, only: [:show, :edit, :update, :destroy]

  # GET /phone_details
  # GET /phone_details.json
  def index
    @phone_details = PhoneDetail.all
  end

  # GET /phone_details/1
  # GET /phone_details/1.json
  def show
  end

  # GET /phone_details/new
  def new
    # @phone_detail = PhoneDetail.new
  end

  # GET /phone_details/1/edit
  def edit
  end

  # POST /phone_details
  # POST /phone_details.json
  def create
    # @phone_detail = PhoneDetail.new(phone_detail_params)
    new_id = !PhoneDetail.last[:id].blank? ? PhoneDetail.last[:id].to_i+1 : 1
    @phone_detail = PhoneDetail.new(id: new_id, name: params[:name], processor: params[:processor], storage: params[:storage].to_i, battery: params[:battery].to_i, display: params[:display].to_f)
    @phone_detail.create
    respond_to do |format|
      if !@phone_detail.id.blank?
        format.html { redirect_to phone_details_path, notice: 'Phone detail was successfully created.' }
        format.json { render :show, status: :created, location: @phone_detail }
      else
        format.html { render :new }
        format.json { render json: @phone_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phone_details/1
  # PATCH/PUT /phone_details/1.json
  def update
    unless params[:id].blank?
      ph_detail_params = { rec_id: params[:id], name: params[:name], processor: params[:processor], storage: params[:storage], battery: params[:battery], display: params[:display] }
      @phone_detail = PhoneDetail.update ph_detail_params
    end
    respond_to do |format|
      if @phone_detail
        format.html { redirect_to phone_details_path, notice: 'Phone detail was successfully updated.' }
        format.json { render :index, status: :ok, location: @phone_detail }
      else
        format.html { render :edit }
        format.json { render json: @phone_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phone_details/1
  # DELETE /phone_details/1.json
  def destroy
    @phone_detail = PhoneDetail.find(params[:id])
    @phone_detail.destroy
    respond_to do |format|
      format.html { redirect_to phone_details_path, notice: 'Phone detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phone_detail
      @phone_detail = PhoneDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def phone_detail_params
      params.require(:phone_detail).permit(:id, :name, :processor, :storage, :battery, :display, :display)
    end
end
