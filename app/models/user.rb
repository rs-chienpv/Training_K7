class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :confirmable

  enum gender: { Male: 0, Female: 1, Other: 2 }

  validate :password_regex
  validates :phone, allow_nil: true, format: { with: /\A(84|0[3|5|7|8|9])?([0-9]{8})?\z/ }
  validates :first_name, allow_nil: true, length: {maximum: 100}
  validates :last_name, allow_nil: true, length: {maximum: 100}
  validates :gender, allow_nil: true, numericality: { only_integer: true }
  validates :address, allow_nil: true, length: {maximum: 255}

  private
  def password_regex
    return if password.blank? || password =~ /\A(?=.*\d)(?=.*[A-Z])(?=.*\W)[^ ]{8,}\z/
    errors.add :password, 'Password should have more than 8 characters including 1 uppercase letter, 1 number, 1 special character'
  end
end
