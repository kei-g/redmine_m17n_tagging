require_dependency 'patches/multilingual_taggable'

module M17nTagging
  module ProjectPatch
    def self.included(base)
      base.extend(ClassMethods)
      base.send(:include, InstanceMethods)
      base.class_eval do
        has_many :own_multilingual_tags, class_name: "MultilingualTag", dependent: :destroy, foreign_key: :project_id
      end
    end

    module ClassMethods
    end

    module InstanceMethods
    end
  end
end

Project.include M17nTagging::MultilingualTaggable
Project.include M17nTagging::ProjectPatch
