class UploadsController < ApplicationController
  before_action :set_upload, only: [:destroy]

  def index
    @uploads = Upload.order("created_at DESC").all
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(upload_params)
    @upload.save

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @upload.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload
      @upload = Upload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def upload_params
      params.require(:upload).permit(:image, :fbID, :name, :tel, :email)
    end
end
