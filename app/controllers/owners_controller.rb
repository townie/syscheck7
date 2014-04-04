class OwnersController < ApplicationController

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)

    if @owner.save
      redirect_to new_owner_path, notice: "New owner created successfully"
    else
      render 'new'
    end

  end

  protected

  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email, :company)
  end
end
