class RedirectController < ApplicationController
   def index
      redirect_to dinners_path
   end
   
end
