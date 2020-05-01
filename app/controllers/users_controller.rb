class UsersController < ApplicationController

  get '/signup' do 
    
  end
  
  post '/signup' do 
    if params[:username].empty? || params[:password].empty?
      redirect "/tweets"
    else 
      redirect "/signup"
    end
    
    user = User.new(:username => params[:username], :password => params[:password], :email => [:email])
    
    if user.save 
      redirect "/tweets"
    else 
      redirect "/signup"
    end
  end
  
  get '/login' do 
    erb :login 
  end
  
  post '/login' do 
    user = User.find_by(:username => params[:username])
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      redirect "/show"
    else 
      redirect "/xxx"
    end
  end
  
  get '/logout' do 
    session.clear
    redirect "/login"
  end
  
end
