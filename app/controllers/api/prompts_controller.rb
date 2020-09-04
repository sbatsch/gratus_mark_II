class Api::PromptsController < ApplicationController
  def index
    @prompts = Prompt.all
    render "index.json.jb"
  end

  def create
    @prompt = Prompt.new(
                         content: params[:content],
                         topic: params[:topic].to_i                      
                        )
    if @prompt.save
      render 'show.json.jb'
    else
      render json: { error: @prompt.errors.full_messages }, status: :unprocessable_entity
    end 
  end 

  def show
    @prompt = Prompt.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @prompt = Prompt.find(params[:id])

    @prompt.content = params[:content] || @prompt.content
    @prompt.topic = params[:topic].to_i || @prompt.topic

    if @prompt.save
      render 'show.json.jb'
    else
      render json: { error: @prompt.errors.full_messages }, status: :unprocessable_entity
    end
  end 

  def destroy
    prompt = Prompt.find(params[:id])
    prompt.destroy
    render json: {message: "Prompt #{prompt.id} was successfully destroyed."}
  end 

end
