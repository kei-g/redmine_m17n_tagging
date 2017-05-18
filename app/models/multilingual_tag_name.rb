class MultilingualTagName < ActiveRecord::Base
  unloadable

  belongs_to :multilingual_tag

  validates_associated :multilingual_tag
  validates_presence_of :language
  validates_length_of :language, in: 2..8
  validates_presence_of :name
  validates_length_of :name, maximum: 255
  validates_length_of :description, maximum: 1024
end
