class MultilingualTagsController < ApplicationController
  unloadable

  before_action :find_project
  before_action :find_tag, only: [ :destroy, :edit, :show, :update ]
  before_filter :authorize

  def create
    @tag = MultilingualTag.create multilingual_tag_params.merge project: @project
    redirect_to project_multilingual_tag_path @project, @tag
  end

  def destroy
    @tag.destroy
    redirect_to project_multilingual_tags_path
  end

  def edit
  end

  def index
    @tags = (MultilingualTag.system + @project.own_multilingual_tags).uniq
  end

  def new
    @tag = MultilingualTag.new project: @project
  end

  def show
  end

  def update
    @tag.update multilingual_tag_params
    redirect_to project_multilingual_tag_path @project, @tag
  end

  private
    CREATE_PARAMS = %w(identifier note sharing).freeze

    def find_project
      @project = Project.find params[:project_id]
    end

    def find_tag
      @tag = MultilingualTag.find params[:id]
    end

    def multilingual_tag_params
      params[:multilingual_tag].select{|k, v|%w(identifier note sharing).include? k}
        .map{|k, v|[k.intern, v]}
        .to_h
    end
end
