class MultilingualTagLink < ActiveRecord::Base
  unloadable

  belongs_to :multilingual_tag
  belongs_to :target, polymorphic: true

  validates_associated :multilingual_tag
  validates_associated :target
  validates_numericality_of :distance, greater_than: 0
  validates_presence_of :distance
  validates_length_of :note, maximum: 1024

  alias_attribute :tag, :multilingual_tag
end
