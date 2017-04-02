# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

resources :projects do
  resources :multilingual_tags do
    resources :multilingual_tag_links
    resources :multilingual_tag_names
  end
end

