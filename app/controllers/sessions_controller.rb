class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.where({ email: params["email"] })[0]
    if @user
      if BCrypt::Password.new(@user.password) == params["password"]
        session[:user_id] = @user.id
        flash[:notice] = "Welcome, you are now logged in."
        redirect_to "/places"
      else
        flash[:notice] = "Not logged in."
        redirect_to "/sessions/new"
      end
    else
      flash[:notice] = "Not logged in."
      redirect_to "/sessions/new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Goodbye."
    redirect_to "/sessions/new"
  end
end


# ---------- Code from Tacogram ------------

# class SessionsController < ApplicationController
#   def new
#   end
  
#   def create
#     @user = User.where({ email: params["email"] })[0]
#     if @user
#       if BCrypt::Password.new(@user.password) == params["password"]
#         session[:user_id] = @user.id
#         flash[:notice] = "Welcome."
#         redirect_to "/posts"
#       else
#         flash[:notice] = "Nope."
#         redirect_to "/sessions/new"
#       end
#     else
#       flash[:notice] = "Nope."
#       redirect_to "/sessions/new"
#     end
#   end
  
#   def destroy
#     session[:user_id] = nil
#     flash[:notice] = "Goodbye."
#     redirect_to "/sessions/new"
#   end
# end