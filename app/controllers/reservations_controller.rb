class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def new
    @reservation = Reservation.new
  
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in, :check_out, :person, :user_id, :room_id))
    if @reservation.save
      flash[:notice] = "登録しました"
      redirect_to "/reservations"
    else
      flash[:notice] = "登録に失敗しました"
      render room
    end
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
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in, :check_out, :person, :user_id, :room_id))
    @user = current_user
    if @reservation.check_in.nil? || @reservation.check_out.nil? || @reservation.person.nil? || @reservation.check_in >= @reservation.check_out
      flash[:notice] = "入力内容に不備があります"
      redirect_back(fallback_location: root_path)
    end
  end


  private
    def permit_params
      @attr = params.require(:reservation).permit(:check_in, :check_out, :person, :user_id, :room_id)
    end


end
