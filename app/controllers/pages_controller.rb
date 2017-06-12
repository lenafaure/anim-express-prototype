class PagesController < ApplicationController

  def home
    redirect_to animators_path if logged_in?
  end

end