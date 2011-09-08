require 'typogruby'

module ArticlesHelper
  def wikiAndTypogrify(text)
    text.blank? ? "" : Typogruby.improve(text.to_wikitext)
  end
  
  def typogrify(text)
    text.blank? ? "" : Typogruby.improve(text)
  end
  
  def wiki(text)
    text.blank? ? "" : text.to_wikitext
  end
end
