module MultilingualTagsHelper
  def multilingual_tag_sharing_options
    MultilingualTag.sharing_options.map{|s|[l(MultilingualTag.labelize_sharing_option(s)), s]}
  end
end
