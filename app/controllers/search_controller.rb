class SearchController < ApplicationController
      require 'jsondinner.rb'
      def SearchByLocation
	      
        @latitude = params[:latitude]
        @longitude = params[:longitude] 	    
        @location = params[:location]	
        @distance = params[:distance]
	@origin = Geokit::Geocoders::YahooGeocoder.geocode(@location)

        @dinners = Dinner.find(:all, :conditions=> ["Eventdate > ?",Time.now.utc])

        @jsondinners = []
	@dinners.each do |dinner|
        @target = Geokit::Geocoders::YahooGeocoder.geocode(dinner.Address)
           @distance_to = @origin.distance_to(@target)
	   if  @distance_to <= @distance.to_i 
              @jsondinner = JsonDinner.new(dinner.id,dinner.Title,dinner.Latitude,
	                                                dinner.Longitude,dinner.Description,
							dinner.Rsvp.count,@latitude,@longitude,
							@location,@distance_to)
              @jsondinners.push(@jsondinner)
	   end
        end

        if @jsondinners.length == 0
	    @jsondinner = 
	       JsonDinner.new(0,"No dinners matched your criteria",0,0,"",0,0,0,0,0)
	    @jsondinners.push(@jsondinner)
	end
	
        @jsondinners.sort! {|a,b| a.Distance <=> b.Distance}  
        respond_to do |format|
           format.json  { render :json => @jsondinners }
	end 
     end
end
