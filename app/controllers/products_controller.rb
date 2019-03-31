class ProductsController < ApplicationController
	def index
       @products=Product.all 
       
	end
	def new
      @products=Product.new
      @categories=Category.all.map{|c|[c.name,c.id]}
	end
	def create
		#render plain: params[:product].inspect
       @products=Product.new(product_params)
       @products.category_id=params[:category_id]
       #@products.category_id=params[:category_id]
       if @products.save
            redirect_to product_path(@products)
       	flash[:notice]="Saved"
       else
       	flash[:notice]="not saved"
       	render 'new'
       end
	end
      def show
          @products=Product.find(params[:id])
      end
      def edit
        @products=Product.find(params[:id])
        @categories=Category.all.map{|c|[c.name,c.id]}
      end
      def update
            @products=Product.find(params[:id])
            @products.category_id=params[:category_id]
            @products.update_attributes(product_params)
             redirect_to product_path(@products)
         
      end
	private
	    def product_params
           params.require(:product).permit(:title,:description)
	    end
end


#(condition) && (statement)

#height = a.height || 100