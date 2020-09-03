class Api::PromptsController < ApplicationController
  def index
    @prompts = Prompt.all
    render "index.json.jb"
  end

  def show
    @prompt = Prompt.find(params[:id])
    render 'show.json.jb'
  end
end
