class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in, :check_out, :person))
    @reservation.save
    flash[:notice] = "登録しました"
    redirect_to "/"
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
