class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipping_cost
  belongs_to :shipping_day
  belongs_to :condition
  has_many :purchase_records

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price, inclusion: { in: 300..9_999_999, message: '販売価格は、300円から9,999,999円まで' }
    validates :price, numericality: { only_integer: true, message: '販売価格は半角数字のみ' }

    with_options numericality: { other_than: 1, message: '選択してください' } do
      validates :category_id
      validates :state_id
      validates :shipping_cost_id
      validates :shipping_day_id
      validates :condition_id
    end
  end
end
