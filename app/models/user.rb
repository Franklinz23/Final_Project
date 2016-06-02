class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  validates :f_name, :l_name,
           presence: true,
           length: { maximum: 50 }

  validates :password,
            confirmation: true

  validates :password_confirmation, presence: true


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i



  validates :email,
           presence:   true,
           format:     { with: VALID_EMAIL_REGEX },
           uniqueness: true,
           length:     { maximum: 55 }


  validates :type,
            presence:   true,
            format:     { with: /(Family|Teacher)/ }
end
