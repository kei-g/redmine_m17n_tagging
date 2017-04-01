class MultilingualTag < ActiveRecord::Base
  IDENTIFIER_MAX_LENGTH = 24

  @sharing_options = %w(none system).freeze

  class << self
    attr_reader :sharing_options

    def labelize_sharing_option(s)
      "label_version_sharing_#{s}".intern
    end
  end

  unloadable

  belongs_to :project
  has_many :multilingual_tag_links, dependent: :destroy
  has_many :multilingual_tag_names, dependent: :destroy

  validates_length_of :identifier, maximum: IDENTIFIER_MAX_LENGTH
  validates_presence_of :identifier
  validates_uniqueness_of :identifier, scope: :project_id
  validates_length_of :note, maximum: 1024
  validates_associated :project
  validates_inclusion_of :sharing, in: @sharing_options

  alias_attribute :links, :multilingual_tag_links
  alias_attribute :names, :multilingual_tag_names

  scope :system, ->{where(sharing: "system")}

  def name
    representative ? representative.name : identifier
  end

  def description
    representative ? representative.description : nil
  end

  def sharing_label
    self.class.labelize_sharing_option sharing
  end

  private
    def representative
      @representative ||= names.find_by(locale: I18n.locale)
    end
end
