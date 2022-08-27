class BookingsController < ApplicationController
  before_action :set_hero, only: %i[new create]
  before_action :set_booking, only: %i[update destroy]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if booking.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
  end

  def destroy
    @booking.destroy
    redirect_to root_path
  end

  private

  def set_hero
    @hero = Hero.find(params[:hero_id])
  end

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def booking_params
    params.require(:booking).permit(:start_rent, :end_rent, :user_id, :hero_id)
  end
end
