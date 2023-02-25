class User < ApplicationRecord
  before_save { email.downcase! } # 保存前に小文字に変換
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, 
                    format: { with: VALID_EMAIL_REGEX }, # 正規表現にマッチするかどうか
                    uniqueness: { case_sensitive: false } # 大文字小文字を区別しない
  has_secure_password # パスワードのハッシュ化
  validates :password, presence: true, length: { minimum: 6 }
end
