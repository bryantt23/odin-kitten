class KittensController < ApplicationController
  def new
    @kitten=Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:success] = "Kitten successfully created!"
      redirect_to @kitten
    else
      flash.now[:error] = "Kitten creation failed"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @kitten=Kitten.find(params[:id])
  end

  def index
    @kittens=Kitten.all
    respond_to do |format|
      format.html
      format.json { render json: @kittens }
    end
  end

  def update
    @kitten=Kitten.find(params[:id])
    if @kitten.update(kitten_params)
      flash[:success]="Kitten successfully updated!"
      redirect_to @kitten
    else
      flash.now[:error] = "Error: Kitten could not be updated"
      render :edit
    end
  end

  def destroy
    @kitten=Kitten.find(params[:id])
    if @kitten.destroy
      flash[:notice]="Kitten successfully deleted."
      redirect_to kittens_url
    else
      flash.now[:error] = "Error: Kitten could not be deleted"
      redirect_to kitten_url(@kitten)
    end
  end

  def edit
    @kitten=Kitten.find(params[:id])
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
