class PurchaseRecord < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one    :customer_infomation
end
