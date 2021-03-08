class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :charge
  belongs_to :area
  belongs_to :day

  #空の投稿を保存できないようにする
  validates :name, :text, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :_id, numericality: { other_than: 1 } 
end

