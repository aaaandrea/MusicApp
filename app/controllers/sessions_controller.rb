class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    # find user
    # if user.save
    #   set session_token & session[session_token]
    # else
    #   raise errors
    #   redirect to new
    # end
  end

  def destroy
    logout
  end

end
