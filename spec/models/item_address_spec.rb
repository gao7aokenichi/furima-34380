require 'rails_helper'

RSpec.describe ItemAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @item_address = FactoryBot.build(:item_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '保存できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @item_address.building_name = ''
        expect(@item_address).to be_valid
      end
      it 'tokenがあれば保存ができること' do
        expect(@item_address).to be_valid
      end
    end

    context '保存できない場合' do
      it 'postal_codeが空だと保存できないこと' do
        @item_address.postal_code = ''
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @item_address.token = nil
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'municipalityは空だと保存できないこと' do
        @item_address.municipality = ''
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressは空だと保存できないこと' do
        @item_address.municipality = ''
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @item_address.postal_code = '1234567'
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'area_idが1では登録できないこと' do
        @item_address.area_id = 1
        @item_address.valid?
        expect(@item_address.errors.full_messages).to include('Area must be other than 1')
      end
    end
  end
end
