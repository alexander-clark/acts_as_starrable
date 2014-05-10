# Encoding: utf-8
class RatingsController < ApplicationController
  respond_to :json

  def create
    @rating = ::ActsAsStarrable::Rating.new(:starrable_type => params[:stype],
                                            :starrable_id => params[:id],
                                            :rating => params[:value])
    if @rating.save
      render :json => @rating, :status => :created
    else
      render :json => @rating.errors, :status => :unprocessable_entity
    end
  end
end
