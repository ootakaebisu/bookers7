class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true,
                   length: { minimum: 2 ,maximum: 20 }
  validates :introduction, length: { maximum: 50 }

  has_many :books, dependent: :destroy
  attachment :image



  # # コピペ
  # def update_with_password(params, *options)
  #   params.delete(:current_password)

  #   if params[:password].blank?
  #       params.delete(:password)
  #       params.delete(:password_confirmation) if params[:password_confirmation].blank?
  #   end

  #   result = update(params, *options)

  #   clean_up_passwords
  #   result
  # end



end
