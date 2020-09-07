class Api::ReflectionsController < ApplicationController
  before_action :authenticate_user

  def index
    @reflections = Reflection.all
    render 'index.json.jb'
  end

  
end
