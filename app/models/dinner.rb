class Dinner < ActiveRecord::Base
has_many :Rsvp, :dependent => :destroy

validates_presence_of :Eventdate, :Title, :Description, :Contactphone, :Address

	acts_as_mappable :default_units => :miles, 
                   :default_formula => :sphere, 
                   :distance_field_name => :distance,
                   :lat_column_name => :Latitude,
                   :lng_column_name => :Longitude



def Formatted_Eventdate
      if self.Eventdate != nil
	 self.Eventdate.to_s(:event_date)
      end
 end

def Formatted_Eventdate=(value)
   self.Eventdate = Time.parse(value)
end


def IsHostedBy(user,id)
   @dinner = Dinner.find(:first, :conditions=>['Hostedby == ? and id==?',user,id])
   return @dinner
end


def IsUserRegistered(user,id)
        @rsvp = Rsvp.find(:first, :conditions =>['Attendeename==? and Dinner_id==?',user,id])
        return @rsvp
end
end

class JsonDinner

	
   def initialize(dinnerid,title,latitude,longitude,description,rsvpcount,searchlatitude,searchlongitude,searchlocation,distance)
      @DinnerID = dinnerid
      @Title = title
      @Latitude = latitude
      @Longitude = longitude
      @Description = description
      @RSVPCount = rsvpcount
      @SearchLatitude = searchlatitude
      @SearchLongitude = searchlongitude
      @SearchLocation = searchlocation
      @Distance = distance      
   end
   
   
    def Distance
       return @Distance
    end
    

    def SearchLocation
      return @SearchLocation
   end
   
   def SearchLatitude
      return @SearchLatitude
   end
   
   def SearchLongitude
      return @SearchLongitude
   end
   
   def DinnerID
      return @DinnerID
   end
   
   def Title
      return @Title
   end
   
   def Latitude
      return @Latitude
   end
   
   def Longitude
      return @Longitude
   end
   
   def Description
      return @Description
   end

   def RSVPCount
      return @RSVPCount
   end

end
