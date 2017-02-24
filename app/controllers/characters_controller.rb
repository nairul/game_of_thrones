class CharactersController < ApplicationController
  # index
  def index
    @characters = Character.all
  end

  # new
  def new
    @house = House.find(params[:house_id])
    @character = @house.characters.new
  end

  # create
  def create
    @house = House.find(params[:house_id])
    @character = @house.characters.create(character_params)

    redirect_to @character
  end

  #show
  def show
    @character = Character.find(params[:id])
  end

  # edit
  def edit
    @character = Character.find(params[:id])
  end

  # update
  def update
    @character = Character.find(params[:id])
    @character.update(character_params)

    redirect_to @character
  end

  # destroy
  def destroy
    @character = Character.find(params[:id])
    @character.destroy

    redirect_to characters_path
  end

  private
  def character_params
    params.require(:character).permit(:name, :house_id)
  end
end
