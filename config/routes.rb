Rails.application.routes.draw do
 devise_for :users
 root "splash#index"
 devise_scope :user do  
     get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  resources :users 
  
  resources :groups do
    resources :expenses
  end
  delete 'groups/:group_id/expenses/:id', to: 'expenses#destroy'
end
