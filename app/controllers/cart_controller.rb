class CartController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if session[:cart] then
      @cart = session[:cart]
    else
      @cart = {}
    end
  end
  
  
  def add
    id = params[:id]
    
    if session[:cart] then
      cart = session[:cart]
    else
      session[:cart] = {}
      cart = session[:cart]
    end
    
    if cart[id] then
      cart[id] = cart[id] + 1
    else
      cart[id] = 1
    end
    redirect_to :action => :index
  end
  
  
  def clearcart
    session[:cart] = nil
    redirect_to :action => :index
  end
  
  
  def remove
    id = params[:id]
    cart = session[:cart]
    cart.delete id
    redirect_to :root
  end
  
  
  def decrease
    id = params[:id]
    cart = session[:cart]
    if cart[id] == 1 then
      cart.delete id
    else
    cart[id] = cart[id] -1
    end
    redirect_to :action => :index
  end
  
  def increase
    id = params[:id]
    cart = session[:cart]
    if cart[id] == cart[id] then
      cart[id] = cart[id] +1
    else
    end
    redirect_to :action => :index
  end
   
  
  
  
  
  
  
  
  def createBooking
    @user = User.find(current_user.id)
    @booking = @user.bookings.build(:booking_date => DateTime.now, :status => 'Pending')
    @booking.save
    @cart = session[:cart] || {}  
    @cart.each do | id, quantity |
      item = Item.find_by_id(id)
      @bookitem = @booking.bookitems.build(:item_id => item.id, :title => item.title, :description => item.description, :quantity => quantity, :price => item.price)
      @bookitem.save
    end
    @bookings = Booking.all
    @bookitems = Bookitem.where(booking_id: Booking.last)
  end
  
end
