class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #  それぞれのカラムが空では保存できない」というバリデーションを設定する
  validates :name, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birthday, presence: true
            
  # has_many :items
  # has_many :orders

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
  
  with_options format:{with: /\A[ぁ-んァ-ン一-龥]+\z/} do
    validates :first_name
    validates :last_name
  end

  with_options format:{with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/} do
     validates :first_name_kana
     validates :last_name_kana
  end

end