class OrdersController < ApplicationController
    before_action :get_order, only: [:show_order, :update_order, :destroy]
    def create_order
        order = current_user.orders.build(order_params)
        if order.save
           # byebug
           
        # render json: {
        #         "order_no" => order.order_no,
        #         "name" => order.name,
        #         "description" => order.description,
        #         "price" => order.price,
        #         "quantity" => order.quantity,
        #         "order_items" => get_order_items(order.order_items) 
        #     }
        # render json: OrderSerializer.new(@order).serializable_hash, status: 200
        render json: order
        else
            render json: {error: 'order not insert'}
        end
    end

    def index
        @order = Order.all
        render json: @order

    end

    def show_order
            if @order.present?
                # this method uses hash to showing another table data (order items) with order id 
                # we are define hash (get_order_items)
            # render json: {
            # "order_no" => @order.order_no,
            #     "name" => @order.name,
            #     "description" => @order.description,
            #     "price" => @order.price,
            #     "quantity" => @order.quantity,
            #          "order_items" =>get_order_items(@order.order_items)
            # }
            
            # render json: OrderSerializer.new(@order, meta: {message: 'order list'})

            # in this we are using serilalizer for getting order with order items
            render json: OrderSerializer.new(@order).serializable_hash, status: 200
            else
            render json: {error: 'order not found'}
            end
    end

    def update_order
        if @order.present?
            @order.update(order_params)
            # render json: {
            # "order_no" => @order.order_no,
            #     "name" => @order.name,
            #     "description" => @order.description,
            #     "price" => @order.price,
            #     "quantity" => @order.quantity,
            #          "order_items" =>get_order_items(@order.order_items)
            # }
            render json: OrderSerializer.new(@order).serializable_hash, status: 200

        else
            render json: {error: 'order not found'}
        end
    end

   

    private
    def order_params
        params.require(:order).permit(:order_no, :name, :description, :price, :quantity, :user_id, order_items_attributes: [:id, :name, :description, :price, :quantity, :order_id] )
    end

    def get_order
        @order = current_user.orders.find_by(id: params[:id])
    end

    def get_order_items(order_items)
        oi1 = []
        order_items.each do | order_item | 
        oi = {}
                             oi["id"] = order_item.id
                             oi["name"] = order_item.name
                             oi["description"] =  order_item.description 
                             oi["price"] =  order_item.price
                             oi["quantity"] = order_item.quantity
                             oi1 << oi
                        
         end
         oi1
    end
end
