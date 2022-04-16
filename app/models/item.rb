class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user

  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  has_one_attached :image

  has_one :order

  # validates :image, presence: true
  # validates :name, presence: true
  # validates :description, presence: true
  # validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  # validates :sales_status_id, numericality: { other_than: 1 , message: "can't be blank"}
  # validates :shipping_fee_status_id, numericality: { other_than: 1 , message: "can't be blank"}
  # validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  # validates :scheduled_delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
  # validates :price,  presence: {message: "can't be blank"}
  # numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "300~9,999,999" }, format: { with: /\A[0-9]+\z/ , message: "Half-width number" }

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
    # 300円以上かつ9,999,999円以下で、半角数字でないと入力不可
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  # ジャンルの選択が「--」の時は保存不可
  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end
end
