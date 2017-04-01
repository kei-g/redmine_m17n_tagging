require_dependency 'patches/multilingual_taggable'

module M17nTagging
  module BoardPatch
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

Board.include M17nTagging::BoardPatch
Board.include M17nTagging::MultilingualTaggable
