class Admin < ApplicationRecord
  # account password 必填
  validates :account, presence: true, uniqueness: true
  validates :password, presence: true
  # 密碼加密
  before_create :encrypt_password

  def self.login(options)
    if options[:account] && options[:password]
      find_by(account: options[:account],
              password: Digest::SHA1.hexdigest('x' + options[:password] + 'y'))
    end
  end

  private

  def encrypt_password
    self.password = popper(password)
  end

  def popper(string)
    string = 'x' + string + 'y'
    Digest::SHA1.hexdigest(string)
  end
end
