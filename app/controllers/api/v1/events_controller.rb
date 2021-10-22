class Api::V1::EventsController < ApplicationController

	def index 
		@events = Event.all
		render :json => @events
	end
	
	def create
	  resource = Event.new(event_type: params[:event_type], public: params[:public],repo_id:params[:repo_id],actor_id: params[:actor_id]) 
	  event_type = resource.event_type
	  if (event_type == "PushEvent") or (event_type == "ReleaseEvent") or (event_type == "WatchEvent")
	    if resource.save
	      render json: {status: "successful"}
	    else
	   	 render json: {status: "please fill all the event fieldss"}
      end
	  else
	   render json: {status: "Please Enter valid Event_type"}
	 end
	end
  
  def show   
   	@resource = Event.find(params[:id]) rescue nil
  	if @resource.present?
    	render :json => @resource
    else
   		render json: {status:"error 404"}
   	end
  end
	def repo
   @resource =Event.where(repo_id:params[:repo_id])
   render :json => @resource
	end

end
 