class AnimatorsController < ApplicationController
  before_action :set_animator, only: [:edit, :update, :show, :destroy]
  before_action :require_user
  before_action :require_admin, except: [:show, :index]

  def index
    @animators = Animator.all.order(id: :desc)
  end

  def new
    @animator = Animator.new
  end

  def edit
  end

  def create
    #render plain: params[:animator].inspect
    @animator = Animator.new(animator_params)
    @animator.user = User.first
    if @animator.save
      flash[:success] = "L'animateur #{@animator.first_name} #{@animator.last_name} a été créé avec succès"
      redirect_to animator_path(@animator)
    else
      render 'new'
    end
  end

  def update
    if @animator.update(animator_params)
      flash[:success] = "L'animateur #{@animator.first_name} #{@animator.last_name} a été modifié avec succès"
      redirect_to animator_path(@animator)
    else
      render 'edit'
    end

  end

  def show
  end

  def destroy
    @animator.destroy
    flash[:danger] = "Animator was successfully deleted"
    redirect_to animators_path
  end

  private
    def set_animator
      @animator = Animator.find(params[:id])
    end
    def animator_params
      params.require(:animator).permit(:first_name, :last_name)
    end
  def require_admin
    if !current_user.admin?
        flash[:danger] = "You are not an admin"
        redirect_to root_path
    end
  end

end