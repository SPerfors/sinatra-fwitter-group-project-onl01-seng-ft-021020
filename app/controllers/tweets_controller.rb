class TweetsController < ApplicationController

  get '/tweets' do 
    if logged_in?
      @user = User.find(session[:user_id])
      erb :tweets
    else
      redirect to "/login"
    end
  end
  
  post '/tweets' do 
    @tweet = Tweet.create(:content => params[:content])
    @tweet.save
    redirect to "/tweets/#{@tweet.id}"
  end
  
  get '/tweets/new' do 
    erb :new 
  end
  
  get '/tweets/:id' do 
    @tweet = Tweet.find_by_id(params[:id])
    erb :show_tweet 
  end
  
  get '/tweets/:id/edit' do
    @tweet = Tweet.find_by_id(params[:id])
    erb :edit_tweet
  end
  
  patch '/tweets/:id' do 
    
  end
  
  delete '/tweets/:id' do
    @tweet = Tweet.find_by_id(params[:id])
    @tweet.delete
    redirect to "/"
  end

end
