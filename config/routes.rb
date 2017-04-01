# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

resources :projects do
  resources :multilingual_tags
end
