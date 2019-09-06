Rails.application.routes.draw do
  #root = главная страница
  #posts = запускаемый контроллер
  #index = поиск метода индекс. Он запускает шаблон в папке views.
root 'posts#index' , as: 'home'

get 'about' => 'pages#about' ,as: 'about'

resources :posts do
  resources :comments
end
end
