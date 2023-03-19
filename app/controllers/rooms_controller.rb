class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy ]

  # GET /rooms or /rooms.json
  def index
    @rooms = Room.all
    @room = Room.find_by(id: params[:id])
  end

  # GET /rooms/1 or /rooms/1.json
  def show
    @room = Room.find(params[:id])
    @user = current_user
    @reservation = Reservation.new
    @reservation.room_id = @room.id
  end

  # GET /rooms/new
  def new
    @user = current_user
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
    @user = current_user
  end

  # POST /rooms or /rooms.json
  def create
    @room = Room.new(params.require(:room).permit(:name, :detail, :price, :address, :image, :user_id))
    @room.user_id = current_user.id
    respond_to do |format|
      if @room.save
        format.html { redirect_to room_url(@room), notice: "施設が登録されました" }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to room_url(@room), notice: "施設情報が更新されました" }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: "施設が削除されました" }
      format.json { head :no_content }
    end
  end

  def own
    @rooms = Room.where(user_id: current_user)
  end

  def search
    @area = params[:area]
    @keyword = params[:keyword]
    if @area.present?
      @rooms = Room.where(["address like?", "%#{params[:area]}%"])
    else @keyword.present?
      @rooms = Room.where(["name like? OR detail like? OR address like?", "%#{params[:keyword]}%", "%#{params[:keyword]}", "%#{params[:keyword]}%"])
    end
    render "index"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:name, :detail, :price, :address, :image)
    end
    
end
