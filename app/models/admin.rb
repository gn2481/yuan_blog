class Admin < ApplicationRecord
  validates :account, presence: true, uniqueness: true
  validates :password, presence: true
  # 密碼加密
  before_create :encrypt_password

  has_many :posts

  # 定義
  def self.login(options)
    if options[:account] && options[:password]
      find_by(account: options[:account],
              password: Digest::SHA1.hexdigest('cu' + options[:password] + 'te'))
    end
  end

  private

  def encrypt_password
    self.password = popper(password)
  end

  def popper(string)
    string = 'cu' + string + 'te'
    Digest::SHA1.hexdigest(string)
  end
end
