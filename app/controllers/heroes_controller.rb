class HeroesController < ApplicationController
  before_action :set_hero, only: %i[index show edit update destroy]

  def index
    @heroes = Hero.all
  end

  def show
    @hero = Hero.new
  end

  def new
    @hero = Hero.new
  end

  def create
    @hero = Hero.new(hero_params)
    if hero.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @hero.update(hero_params)
    redirect_to hero_path(@hero)
  end

  def destroy
    @hero.destroy
    redirect_to hero_path
  end

  private

  def hero_params
    params.require(:hero).permit(:name, :address, :overview, :user_id)
  end

  def set_hero
    @hero = Hero.find(params[:id])
  end
end
