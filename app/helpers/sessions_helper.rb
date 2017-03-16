module SessionsHelper
    
  # Logs in user
  def log_in(user)
    session[:user_id] = user.id
  end
  
 def current_user
     if @current_user.nil?
         @current_user = User.find_by(id: session[:user_id])
     else
         @current_user
     end
 end
 
 def log_out
     session.delete(:user_id)
     @current_user = nil
 end
 
 def logged_in?
    !current_user.nil?
 end
end