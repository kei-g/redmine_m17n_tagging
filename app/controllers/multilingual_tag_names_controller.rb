class MultilingualTagNamesController < ApplicationController
  unloadable

  before_action :find_tag
  before_action :find_tag_name, only: [ :destroy, :edit, :show, :update ]

  def create
    @name = MultilingualTagName.create multilingual_tag_name_params.merge multilingual_tag: @tag
    redirect_to project_multilingual_tag_path @tag.project, @tag
  end

  def destroy
    @name.destroy
    redirect_to project_multilingual_tag_path @tag.project, @tag
  end

  def edit
    languages = @tag.names.map(&:language).reject{|s|@name.language == s}.map(&:intern)
    @languages = I18n.available_locales.reject{|s|languages.include? s}
  end

  def index
  end

  def new
    languages = @tag.names.map(&:language).map(&:intern)
    @languages = I18n.available_locales.reject{|s|languages.include? s}
    @name = MultilingualTagName.new multilingual_tag: @tag, language: @languages.include?(I18n.locale) ? I18n.locale : :en
  end

  def show
  end

  def update
    @name.update multilingual_tag_name_params
    redirect_to project_multilingual_tag_path @tag.project, @tag
  end

  private
    def find_tag
      @tag = MultilingualTag.find params[:multilingual_tag_id]
    end

    def find_tag_name
      @name = MultilingualTagName.find params[:id]
    end

    def multilingual_tag_name_params
      params[:multilingual_tag_name].select{|k, v|%w(language name description).include? k}
        .map{|k, v|[k.intern, v]}
        .to_h
    end
end
