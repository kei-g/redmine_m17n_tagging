module M17nTagging
  module MultilingualTaggable
    def self.included(base)
      base.extend(ClassMethods)
      base.send(:include, InstanceMethods)
      base.class_eval do
        has_many :multilingual_tag_links, as: :target, dependent: :destroy
        has_many :multilingual_tags, through: :multilingual_tag_links
      end
    end

    module ClassMethods
    end

    module InstanceMethods
    end
  end
end
