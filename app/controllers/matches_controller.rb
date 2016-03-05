class MatchesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  layout "user_layout"
  def index
  	@matches = Match.order(created_at: :desc).paginate(page: params[:page],per_page:10)
  end

  def new
    @match = Match.new
  end

  def edit
  end 

  def create
      @match = current_user.matches.build(match_params)
      respond_to do |format|
        if @match.save
          format.html { redirect_to @match, notice: 'Match was successfully created.' }
          format.json { render :show, status: :created, location: @match }
        else
          format.html { render :new }
          format.json { render json: @match_params.errors, status: :unprocessable_entity }
        end
      end
  end

  def update
    respond_to do |format|
        if @match.update(match_params)
          format.html { redirect_to @match, notice: 'Match was successfully updated.' }
          format.json { render :show, status: :ok, location: @match }
        else
          format.html { render :edit }
          format.json { render json: @match.errors, status: :unprocessable_entity }
        end
    end
  end

  def destroy
    @match.destroy!
    respond_to do |format|
      format.html { redirect_to matches_path, notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show
  end

  private
    def match_params
      params.require(:match).permit(:match_title,:match_type, :host_team, :guest_team, :kick_of_time, :host_image, :guest_image, :place)
    end

    def set_match
      @match = Match.find(params[:id])
    end
end
