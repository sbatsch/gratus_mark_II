Rails.application.routes.draw do
  namespace :api do
    get "/prompts" => "prompts#index"
    post "/prompts" => "prompts#create"
    get "/prompts/:id" => "prompts#show"
  end
end
