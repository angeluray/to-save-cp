require 'rails_helper'

RSpec.describe 'groups/index', type: :view do
  before :each do
    @user = User.create(
      name: 'Angel',
      email: 'angel@gmail.com',
      password: '1234567'
    )

    @category = @user.groups.create(
      name: 'Food',
      icon: 'http://fasfa-utensils',
      user_id: @user.id
    )

    visit new_user_session_path
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'Log in'
    visit groups_path
  end

  describe 'GET /categories' do
    it 'displays all categories' do
      expect(page).to have_content('Food')
      expect(page).to have_content('ADD A NEW CATEGORY')
      expect(page).to have_content('Transactions: 0')
    end

    it 'displays new category' do
      visit new_group_path
      expect(page).to have_content('New group')
      expect(page).to have_content('Back to groups')
    end
  end
end
