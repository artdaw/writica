class Article < ActiveRecord::Base
  validates :title, :presence => true, :length => { :minimum => 2 }
  validates :content, :presence => true, :length => { :minimum => 2 }
  validates :password, :length => { :minimum => 3 }, :if => "!password.empty?" 
  validate :isPrivate_checked_if_password
  
  def isPrivate_checked_if_password
    if isPrivate && password.empty?
      errors.add(:password, I18n.t("validation.isPrivate_checked_if_password"))
    end
  end
end
