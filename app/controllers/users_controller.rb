class UsersController < ApplicationController

def create
# User user = new User();   ---- java
user = User.new(user_params)

    if user.save
        # render json: {message: 'user insert successfull'}
        # render json: user
        render json: UserSerializer.new(user).serializable_hash, status: 200
    else
    render json: {error: 'user not insert'}
    end
end



def update
    user = User.find_by(id: params[:id])
    if user.present?
        user.update(user_params)
        render json: {message: 'user update successfull'}
    else
        render json: {error: 'user not found for update'}
    end
end

def index
    users = User.all
    render json: users
end


def destroy
    user = User.find_by(params[:id])
    if user.present?
        user.destroy
        render json: {message: 'user deleted successfull'}
    else
        render json: {error: 'user not found for delete'}
    end
end

def show
    user = User.find_by(id: params[:id])
    # render json:{         
    #     "first_name" => user.first_name, 
    #     "last_name" => user.last_name,
    #     "token" => user.token,
    #             "profile" => {
    #                     "phone" => user.profile.present? ? user.profile.phone_number : "",
    #                     "city" => user.profile.present? ? user.profile.city : ""

    #             }
    #     }
    render json: UserSerializer.new(user).serializable_hash, status: 200
    
end

def bulk_order_delete
    orders = current_user.orders.where(id: params[:id])
    if orders.present?
        orders.destroy.all
        render json: {message: 'All Orders deleted'}
    else 
        render json: {error: 'order not found'}
    end
end

private 
def user_params
params.require(:users).permit(:first_name, :last_name, :email, :active, :token)
end

end
