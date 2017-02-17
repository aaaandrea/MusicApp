class TracksController < ApplicationController
  before_action :require_user!

  def new
    @album = ALbum.find(params[:album_id])
    @track = Track.new(album_id: params[:album_id])
    render :new
  end

  def create
    @track = Track.create(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = track.errors.full_messages
      render :new
    end
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def update
    @track.find(params[:id])
    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    redirect_to tracks_url
  end

  private

  def track_params
    params.require(:track).permit(:name, :album_id, :ord, :bonus, :lyrics)
  end
end
