class Api::ReflectionsController < ApplicationController
  before_action :authenticate_user

  def index
    @reflections = Reflection.all
    render 'index.json.jb'
  end

  def create
    @reflection = Reflection.new(
                                  prompt_id: params[:prompt_id],
                                  user_id: current_user.id,
                                  date: Time.now,
                                  body: params[:body],
                                  gratitude_level: params[:gratitude_level],
                                  gratitude_change: params[:gratitude_change].to_i
                                )
    if @reflection.save
      render 'show.json.jb'
    else
      render json: { error: @reflection.errors.full_messages }, status: :unprocessable_entity
    end 
  end

  def show
    @reflection = Reflection.find(params[:id])
    render 'show.json.jb'
  end 

  def update
    @reflection = Reflection.find(params[:id])

    @reflection.update(
                        # prompt_id: params[:prompt_id] || @reflection.prompt_id,
                        user_id: current_user.id || @reflection.user_id,
                        body: params[:body] || @reflection.body,
                        gratitude_level: params[:gratitude_level] || @reflection.gratitude_level,
                        gratitude_change: params[:gratitude_change].to_i || @reflection.gratitude_change
                      )

    if @reflection.save
      render 'show.json.jb'
    else
      render json: { error: @reflection.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    reflection = Reflection.find(params[:id])

    reflection.destroy
    render json: {message: "Reflection #{reflection.id} was successfully removed from the database."}
  end

  
end
