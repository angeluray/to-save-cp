require 'rails_helper'

RSpec.describe 'relations/index', type: :view do
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

    @charge = Charge.create(
      name: 'Mcdonalds',
      amount: 100,
      author_id: @user.id
    )

    @group_charge = Relation.create(group_id: @category.id, charge_id: @charge.id)

    visit new_user_session_path
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'Log in'
    visit groups_path
  end

  describe 'GET /relations between groups and charges' do
    it 'displays all transactions' do
      visit group_relations_path(@category.id)
      expect(page).to have_content('Food')
      expect(page).to have_content('Mcdonalds')
      expect(page).to have_content('$100.0')
      expect(page).to have_content('Add a new transaction')
    end
  end
end
