Rails.application.routes.draw do
  get 'taskpipelines/index'
  get 'taskpipelines/create'
  get 'taskpipelines/update'
  get 'taskpipelines/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  scope '/api/version1' do
    resources :taskpipelines
  end
end
