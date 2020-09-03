Rails.application.routes.draw do
  namespace :api do
    get "/prompts" => "prompts#index"
    get "/prompts/:id" => "prompts#show"
  end
end
