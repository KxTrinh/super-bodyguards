class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @heroes = Hero.all
  end
end
