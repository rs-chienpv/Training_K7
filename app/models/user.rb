class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :confirmable

  validate :password_regex
  validates :phone, presence: true, format: { with: /(84|0[3|5|7|8|9])+([0-9]{8})\b/}, uniqueness: true

  private

  def password_regex
    return if password.blank? || password =~ /\A(?=.*\d)(?=.*[A-Z])(?=.*\W)[^ ]{8,}\z/

    errors.add :password, 'Password should have more than 8 characters including 1 uppercase letter, 1 number, 1 special character'
  end
end
