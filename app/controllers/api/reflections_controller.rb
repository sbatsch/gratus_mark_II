class Api::ReflectionsController < ApplicationController
  before_action :authenticate_user

  def index
    @reflections = Reflection.all
    render 'index.json.jb'
  end

  def show
    @reflection = Reflection.find(params[:id])
    render 'show.json.jb'
  end 

  
end
