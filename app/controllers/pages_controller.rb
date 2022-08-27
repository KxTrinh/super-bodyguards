class PagesController < ApplicationController
  def home
    @heros = Hero.all
  end
end
