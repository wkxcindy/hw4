class EntriesController < ApplicationController
  def new
    @place = Place.find_by({ "id" => params["place_id"] })
  end

  def create
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["place_id"] = params["place_id"]
    @entry["user_id"] = session["user_id"]

    # Attach the uploaded image if provided
    if params[:image]
      @entry.image.attach(params[:image])
    end

    @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
  end
end


