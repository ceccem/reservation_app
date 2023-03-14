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
    redirect_to "/reservations"
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @reservation = Reservation.find_by(id: params[:id])
    @reservation.destroy
    redirect_to :reservations
  end

  def confirm
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in, :check_out, :person))
  end


  private
    def permit_params
      @attr = params.require(:reservation).permit(:check_in, :check_out, :person)
    end


end
