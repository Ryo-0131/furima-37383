FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    ward { '1-1' }
    building { '東京ハイツ' }
    phone_number { 12345678912 }
    user_id { FactoryBot.create(:user).id }
    item_id { FactoryBot.create(:item).id }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
