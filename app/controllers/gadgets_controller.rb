class GadgetsController < ApplicationController

  def index
    @gadgets = current_user.gadgets
    @gadgets = @gadgets.search(params[:search]) if params[:search]
  end

  def new
    @gadget = Gadget.new
  end

  def create
    @gadget = Gadget.new(user_id: current_user.id)
    if @gadget.update_attributes(gadget_params)
      upload_images
      flash[:success] = 'Sucessufully created'
      redirect_to gadgets_path
    else
      flash.now.alert = "Failed"
      render :new
    end
  end

  def edit
    @gadget = Gadget.find_by(id: params[:id], user_id: current_user.id)
  end

  def update
    @gadget = Gadget.find_by(id: params[:id], user_id: current_user.id)
    if @gadget.update_attributes(gadget_params)
      upload_images
      flash[:success] = 'Updated'
      redirect_to edit_gadget_path(@gadget)
    else
      flash.now.alert = "Failed"
      render :edit
    end
  end

  def destroy
    @gadget = Gadget.find_by(id: params[:id], user_id: current_user.id)
    @gadget.destroy
    flash[:success] = 'Deleted'
    redirect_to gadgets_path
  end

  private

  def upload_images
    params[:images].each do |image|
      @gadget.images.create(image: image)
    end if params[:images]
  end

  def gadget_params
    params.require(:gadget).permit(:name, :description)
  end

end
