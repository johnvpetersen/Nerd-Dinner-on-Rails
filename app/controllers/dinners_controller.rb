class DinnersController < ApplicationController

before_filter :login_required

  def index
        #we only want future dinners.
         @dinners = Dinner.find(:all, :conditions => ['Eventdate >= ?',DateTime.now]) 
         respond_to do |format|
         format.html # index.html.erb
         format.xml  { render :xml => @dinners }
    end
  end

  def show
    @dinner = Dinner.find(params[:id])
     
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dinner }
    end
  end

  def new
    @dinner = Dinner.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dinner }
    end
  end

  def edit
    @dinner = Dinner.find(params[:id])
    
    if !@dinner.IsHostedBy(current_user.login, @dinner.id)
       redirect_to :action => "show"
    end
    
    
  end

  def rsvp
   
      @msg = ""

      @dinner = Dinner.find(params[:id])
      
      @rsvp = @dinner.IsUserRegistered(params[:user],@dinner.id)
      if @rsvp == nil
         @rsvp = Rsvp.new(:Attendeename=>params[:user], :Dinner_id=>@dinner.id)
          if @rsvp.save
	     @msg =  "<H2>Thanks - we'll see you there!</H2>"
	  else
   	     @msg =  "<H2>There was a problem with your RSVP. Please try again.</H2>"  
	  end	  
     end

    render :text => @msg
end
  
  def create
    @dinner = Dinner.new(params[:dinner])

     respond_to do |format|
      if @dinner.save
                
        flash[:notice] = 'Dinner was successfully created.'
        format.html { redirect_to(@dinner) }
        format.xml  { render :xml => @dinner, :status => :created, :location => @dinner }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dinner.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @dinner = Dinner.find(params[:id])
   respond_to do |format|
    if @dinner.IsHostedBy(current_user.login, @dinner.id)
       if @dinner.update_attributes(params[:dinner])
           flash[:notice] = 'Dinner was successfully updated.'
           format.html { redirect_to(@dinner) }
           format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dinner.errors, :status => :unprocessable_entity }
      end
    end
  end
end

  def destroy
    @dinner = Dinner.find(params[:id])

    @msg = "Your selected dinner [" + @dinner.Title + "] has been deleted."

   if @dinner.IsHostedBy(current_user.login, @dinner.id)
      @dinner.destroy
      flash[:notice] = @msg
   else
       flash[:notice] = "You must be the organizer of this dinner in order to delete/edit."
    end

    respond_to do |format|
      format.html { redirect_to(dinners_url) }
      format.xml  { head :ok }
    end
  end
end
