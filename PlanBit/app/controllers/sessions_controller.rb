class SessionsController < ApplicationController
 	  USER_ID   = "admin"
  	PASSWORD  = "planbit"
	
	skip_before_filter :authenticate
	#before_filter :save_login_state, :only => [:index, :login, :login_attempt]

	def home
		#Home Page
	end

	def profile
		#Profile Page
	end

	def setting
		#Setting Page
	end

	def login
		if session[:user_id]
			redirect_to(:action => 'home')
		end
	end

	def login_attempt
		if params[:username_or_email] == USER_ID && params[:login_password] == PASSWORD
			session[:user_id] = 1
			flash[:notice] = "Welcome"
			redirect_to(:action => 'home')
		else
			flash[:notice] = "Invalid Username or Password"
        	flash[:color]= "invalid"
			render "login"	
		end
	end

	def logout
		session[:user_id] = nil
		redirect_to :action => 'login'
	end

end
