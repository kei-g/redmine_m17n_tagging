require_dependency 'patches/multilingual_taggable'

module M17nTagging
  module NewsPatch
    def self.included(base)
      base.extend(ClassMethods)
      base.send(:include, InstanceMethods)
      base.class_eval do
      end
    end

    module ClassMethods
    end

    module InstanceMethods
    end
  end
end

News.include M17nTagging::MultilingualTaggable
News.include M17nTagging::NewsPatch
