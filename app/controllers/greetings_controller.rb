class GreetingsController < ApplicationController
  before_action :set_greeting, only: %i[show]

  # GET /greetings
  def index
    @greetings = Greeting.all
    @greetings = @greetings.map(&:greeting)
    @greetings = @greetings.sample
    render json: { greeting: @greetings }
  end

  # GET /greetings/1
  def show
    @greeting = @greeting.greeting
    render json: @greeting
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_greeting
    @greeting = Greeting.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def greeting_params
    params.require(:greeting).permit(:greeting)
  end
end
