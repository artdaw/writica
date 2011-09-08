class ErrorsController < ApplicationController
  layout 'errors'
  
  ERRORS = [ 
     :internal_server_error,
     :not_found,
     :unprocessable_entity
   ].freeze

   ERRORS.each do |e|
     define_method e do
       respond_to do |format|
         format.html { render e, :status => e }
         format.any { head e }
       end
     end
   end
end
