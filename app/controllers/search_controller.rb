class SearchController < ApplicationController

      def SearchByLocation
           @dinners = Dinner.all

	   @latitude = params[:latitude]
           @longitude = params[:longitude] 	    
	   @location = params[:location]	
	    @distance = params[:distance]
	    #@distance = 100
	    #@location = "19301"
	    @origin = Geokit::Geocoders::YahooGeocoder.geocode(@location)
 
            #@dinners = Dinner.find(:all, :origin => [@latitude,@longitude], :within => 10000)
            #@dinners = Dinner.find_within(100,:origin => [@latitude,@longitude])

           @jsondinners = []
	   @dinners.each do |dinner|
              @target = Geokit::Geocoders::YahooGeocoder.geocode(dinner.Address)
              @distance_to = @origin.distance_to(@target)
	       if  @distance_to <= @distance.to_i
                  @jsondinner = JsonDinner.new(dinner.id,dinner.Title,dinner.Latitude,dinner.Longitude,dinner.Description,dinner.Rsvp.count,@latitude,@longitude,@location,@distance_to)
                  @jsondinners.push(@jsondinner)
	       end
	  
          end

		#finally, sort the resulting @jsondinners array
		 @jsondinners.sort! {|a,b| a.Distance <=> b.Distance}  


           respond_to do |format|
              format.json  { render :json => @jsondinners }
	    end 
         end
end
