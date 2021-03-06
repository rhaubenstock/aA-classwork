require 'byebug'
class ArtworksController < ApplicationController

  def index
    render json: Artwork.where(artist_id: params[:user_id]) + 
                 Artwork.joins(:shared_viewers).where(users: {id: params[:user_id]})
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    artwork = Artwork.find_by(id: params[:id])
    render json: artwork
  end

  def update
    artwork = Artwork.find(params[:id])
    artwork.update!(artwork_params)
    render json: artwork
  end

  def destroy
    artwork = Artwork.find(params[:id])
    arwork.destroy
    render json: artwork
  end

  def favorite
    debugger
    artwork = Artwork.find(params[:id])
    if artwork.artist_id == params[:user_id].to_i
      artwork.update!(favorited: true)
      artwork.save
      render json: artwork
    else
      artwork_share = artwork.artwork_shares.find_by(viewer_id: params[:user_id])
      artwork_share.update!(favorited: true)
      artwork_share.save
      render json: artwork_share
    end
  end
  
  private

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id, :favorited)
  end
end