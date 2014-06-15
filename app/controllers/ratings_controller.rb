# Encoding: utf-8
class RatingsController < ApplicationController
  respond_to :json

  def create
    @rating = ::ActsAsStarrable::Rating.new(:starrable_type => params[:stype],
                                            :starrable_id => params[:id],
                                            :rating => params[:value],
                                            :rater_type => params[:rtype],
                                            :rater_id => params[:rid])
    if @rating.save
      render :json => @rating, :status => :created
    else
      render :json => @rating.errors, :status => :unprocessable_entity
    end
  end

  def update
    rating = ::ActsAsStarrable::Rating.find(params[:id])
    if rating.update_attributes(:rating => params[:value])
      render :nothing => true, :status => 204
    else
      render :nothing => true, :status => :unprocessable_entity
    end
  end

  def destroy
    rating = ::ActsAsStarrable::Rating.find(params[:id])
    rating.destroy
    render :nothing => true, :status => 204
  end
end
