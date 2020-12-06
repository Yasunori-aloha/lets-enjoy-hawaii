# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SnsCredential, type: :model do
  let(:omniauth) { create(:sns_credential) }
  let(:another_omniauth) { build(:sns_credential) }

  describe 'SNS認証登録' do
    context 'SNSでの認証登録ができる場合' do
      it '初めてのSNSでの認証なら登録できる' do
        expect(omniauth).to be_valid
      end
    end

    context 'SNS認証登録ができない場合' do
      it '既に認証登録済みのユーザーとSNSの場合' do
        another_omniauth.uid = omniauth.uid
        another_omniauth.valid?
        expect(another_omniauth.errors.full_messages).to include 'Uidはすでに存在します'
      end
    end
  end
end
