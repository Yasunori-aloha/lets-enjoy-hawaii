require 'rails_helper'

RSpec.describe SnsCredential, type: :model do
  describe 'SNS認証登録' do
    context 'SNSでの認証登録ができる場合' do
      it '初めてのSNSでの認証なら登録できる' do
        binding.pry
      end
    end
    context 'SNS認証登録ができない場合' do
      it '既に認証登録済みのユーザーとSNSの場合' do
      end
    end
  end
end
