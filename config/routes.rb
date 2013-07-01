Kanban::Application.routes.draw do

  root :to => "Root#index"
  resource :root, :only => [:index]

  resource :session, :only => [:new, :create, :destroy]
  get "login" => "Sessions#new"
  get "logout" => "Sessions#destroy"

  resources :users, :only => [:show]

  namespace :api do
    resources :users, :only => [:show]
    resources :boards, :only => [:index, :show, :create] #do
    #   member do
    #     get :lists
    #   end
    # end
    resources :lists , :only => [:index, :show] do
      collection do
        post :sort
      end
    end
    resources :cards, :only => [:index, :show] do
      collection do
        post :sort
      end
    end
  end
end
