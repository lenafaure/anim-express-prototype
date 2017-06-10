class AnimatorsController < ApplicationController

  def index
    @animators = Animator.all
  end

  def new
    @animator = Animator.new
  end

  def edit
    @animator = Animator.find(params[:id])
  end

  def create
    #render plain: params[:animator].inspect
    @animator = Animator.new(animator_params)

    if @animator.save
      flash[:notice] = "Animator was succesfully created"
      redirect_to animator_path(@animator)
    else
      render 'new'
    end
  end

  def update
    @animator = Animator.find(params[:id])
    if @animator.update(animator_params)
      flash[:notice] = "Animator was succesfully updated"
      redirect_to animator_path(@animator)
    else
      render 'edit'
    end

  end

  def show
    @animator = Animator.find(params[:id])
  end

  def destroy
    @animator = Animator.find(params[:id])
    @animator.destroy
    flash[:notice] = "Animator was successfully deleted"
    redirect_to animators_path
  end

  private
    def animator_params
      params.require(:animator).permit(:first_name, :last_name)
    end

end