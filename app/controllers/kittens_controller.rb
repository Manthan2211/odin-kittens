class KittensController < ApplicationController

  def new
    @kitten = Kitten.new
  end

  def index
    @kittens = Kitten.paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html
      format.json{ render :json => @kittens }
    end 
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
     flash[:success] = 'Kitten Created'
     redirect_to @kitten
    else
      flash[:danger] = 'Kitten Cant Created'
      redirect_to root_url
    end
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update_attributes(kitten_params)
       flash[:success] = "Congratulations Event updated"
      redirect_to @kitten
    else
      render 'edit'
    end
  end

  def edit
    if @kitten = Kitten.find_by(id: params[:id])
    else
      flash[:danger] = "Kitten not found"
      redirect_to root_url
    end
  end

  def show
    @kitten=Kitten.find(params[:id])
     respond_to do |format|
      format.html
      format.json{ render :json => @kitten }
    end 
  end

  def destroy
    Kitten.find(params[:id]).destroy.destroy
    flash[:success] = "Kitten deleted"
    redirect_to request.referrer || root_url
  end 

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness, :image)
  end
end
