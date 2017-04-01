Dir.glob File.expand_path("../lib/patches/*", __FILE__) do |p|
  require_dependency p
end

Redmine::Plugin.register :m17n_tagging do
  name 'Multilingual Tagging plugin'
  author 'kei-g'
  description 'Multilingual tagging support'
  version '0.0.1'
  url 'https://github.com/kei-g/redmine_m17n_tagging'
  author_url 'https://github.com/kei-g'

  menu :project_menu,
       :multilingual_tags,
       { action: :index, controller: :multilingual_tags },
       caption: :multilingual_tags,
       param: :project_id

  permission :multilingual_tagging, { multilingual_tags: [ :create, :destroy, :edit, :index, :new, :show, :update ] }, public: true
end
