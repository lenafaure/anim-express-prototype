class PagesController < ApplicationController

  def home
    @animators = Animator.all.order(id: :desc)
    redirect_to animators_path if logged_in?
  end

end