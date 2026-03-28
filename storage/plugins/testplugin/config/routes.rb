resources :accounts, module: :accounts, only: [] do
  resources :deals, module: :deals, only: [] do
    member do
      post :recalculate_ai_score
      post :toggle_follow_up
    end
  end
end
