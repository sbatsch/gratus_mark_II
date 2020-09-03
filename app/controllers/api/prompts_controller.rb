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
    @prompt.save
    render 'show.json.jb'
  end 

  def show
    @prompt = Prompt.find(params[:id])
    render 'show.json.jb'
  end
end
