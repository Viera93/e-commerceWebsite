class StaticPagesController < ApplicationController
  def home
    @categories = Category.all
    @items = Item.all
  end

  def menu
     
  end

  def about
  end

  def contact
    #session[:cart] = nil
  end
  
  
  def adminsection
    @bookings = Booking.all
    @users = User.all
  end 
  
  
  def paid
    @booking = Booking.last
    @booking.update_attribute(:status, 'Paid')
  end
  
  def category
    cat = params[:title]
    @items = Item.where("category like ?", cat)
  end
  
  
  def upgrade_admin
    @user = User.find_by(id: params[:id])
    @user.update_attribute(:admin, true)
    redirect_to "/"
  end
  
  def downgrade_admin
    @user = User.find_by(id: params[:id])
    @user.update_attribute(:admin, false)
    redirect_to "/"
  end    
  
end
