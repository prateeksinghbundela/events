Rails.application.routes.draw do
  namespace :api do
   namespace :v1 do 
     resources :events do 
       collection do 
         get :repo
        end 
     end  
   end
 end
end
