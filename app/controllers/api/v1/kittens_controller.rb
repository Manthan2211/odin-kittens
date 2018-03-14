
    class API::V1::KittensController < ApplicationController
      
      
      def new
        @kitten = Kitten.new
      end

      def index
        @kittens = Kitten.paginate(page: params[:page], per_page: 10)
        render :json => @kittens
      end

      def create
         @kitten = Kitten.new(kitten_params)
         if @kitten.save
          render :json => @kitten
         else
           render :json => 'cant created'
         end
      end

      def update
        @kitten = Kitten.find(params[:id])
        if @kitten.update_attributes(kitten_params)
           render :json => @kitten
        else
          render :json => 'cant updated'
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
          render :json => @kitten 
       
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

