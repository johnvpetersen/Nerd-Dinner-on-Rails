class Dinner < ActiveRecord::Base
   has_many :Rsvp, :dependent => :destroy

   validates_presence_of :Eventdate, :Title, :Description, :Contactphone, :Address

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
