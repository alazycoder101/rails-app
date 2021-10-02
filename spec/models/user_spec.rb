require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create_user }

  describe 'roles' do
    context 'admin' do
      it 'is valid admin' do
        user.add_role(:admin)
        expect(user.has_role?(:admin)).to be_truthy
      end
    end

    context 'user' do
      it 'not valid admin' do
        expect(user.has_role?(:admin)).to be_falsy
      end
    end
  end

  describe 'slug' do
    let(:slug) { user.slug }

    it 'email as slug' do
      expect(user.slug == user.email.gsub('.', '-').gsub('@', '-')).to be_truthy
    end

    it 'search with slug' do
      expect(User.friendly.find(slug)).not_to be_nil
    end
  end
end
