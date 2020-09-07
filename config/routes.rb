Rails.application.routes.draw do
  namespace :api do
    post '/users' => "users#create"

    post "/sessions" => "sessions#create"

    get "/reflections" => "reflections#index"

    get "/reflections/:id" => "reflections#show"

    
    get "/prompts" => "prompts#index"
    post "/prompts" => "prompts#create"
    get "/prompts/:id" => "prompts#show"
    patch "prompts/:id" => "prompts#update"
    delete "prompts/:id" => "prompts#destroy"
    
  end
end
