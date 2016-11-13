module LocalizedName
  def localize(locale = I18n.locale)
    string = YAML.load(self)
    return string[locale.to_s] if string.is_a?(Hash) && string[locale.to_s]
    self
  rescue NoMethodError
    self
  end
end

class String
  include LocalizedName
end
