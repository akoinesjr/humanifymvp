class ListingCommunitiesController < ApplicationController
  before_action :authenticate_user!

  def create
    @listing = current_user.listing_communities.build(listing_community_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to listing_path(@listing.id), notice: 'Your community project has been created.' }
        format.json { render :show, status: :created,
                             location: listing_path(@listing.id) }
      else
        @listing.form_part = "community"
        format.html { render "listings/new" }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def listing_community_params
    params.require(:listing_community).permit(
      :title,
      :description,
      :image,
      :points,
      :visibility,
      :tag_list)
  end
end
