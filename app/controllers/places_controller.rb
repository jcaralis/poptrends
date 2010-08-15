class PlacesController < ApplicationController
  # GET /places
  # GET /places.xml
  
  
  require('json') 

  def getPlaces

           @radius = 2
           @location = params['location']
           api_key = "8pvw4ckh94ekte6a7gfs3wn8"
           query = "starbucks"

           url = URI.parse('http://api2.citysearch.com')
           res = Net::HTTP.start(url.host, url.port) {|http|
                http.get("/search/locations?what=#{query}&where=#{@location}&radius=#{@radius}&publisher=geocade&api_key=#{api_key}&rpp=50&format=json")
               }

           json_resp = res.body
           @places = JSON.parse(json_resp) 

           @count =  @places['jsonResponse']['totalhits']
           @caffeination_level = @count.div(@radius)
           
           place = Place.new
              place.location = @location
              place.count = @count
              place.caffeination_level = @caffeination_level
            place.save  



     end
  
  
  
  def index
    @places = Place.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @places }
    end
  end

  # GET /places/1
  # GET /places/1.xml
  def show
    @place = Place.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @place }
    end
  end

  # GET /places/new
  # GET /places/new.xml
  def new
    @place = Place.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @place }
    end
  end

  # GET /places/1/edit
  def edit
    @place = Place.find(params[:id])
  end

  # POST /places
  # POST /places.xml
  def create
    @place = Place.new(params[:place])

    respond_to do |format|
      if @place.save
        format.html { redirect_to(@place, :notice => 'Place was successfully created.') }
        format.xml  { render :xml => @place, :status => :created, :location => @place }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @place.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /places/1
  # PUT /places/1.xml
  def update
    @place = Place.find(params[:id])

    respond_to do |format|
      if @place.update_attributes(params[:place])
        format.html { redirect_to(@place, :notice => 'Place was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @place.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.xml
  def destroy
    @place = Place.find(params[:id])
    @place.destroy

    respond_to do |format|
      format.html { redirect_to(places_url) }
      format.xml  { head :ok }
    end
  end
end
