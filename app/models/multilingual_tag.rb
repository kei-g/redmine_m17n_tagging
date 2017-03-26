class MultilingualTag < ActiveRecord::Base
  IDENTIFIER_MAX_LENGTH = 24

  unloadable

  belongs_to :project
  has_many :multilingual_tag_links, dependent: :destroy

  validates_length_of :identifier, maximum: IDENTIFIER_MAX_LENGTH
  validates_presence_of :identifier
  validates_uniqueness_of :identifier, scope: :project_id
  validates_length_of :note, maximum: 1024
  validates_associated :project
  validates_inclusion_of :sharing, in: %w(none system)

  alias_attribute :links, :multilingual_tag_links
end
