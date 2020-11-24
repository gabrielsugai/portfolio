require 'rails_helper'

feature 'Visitor open home page' do
  scenario 'Successfully' do

    visit root_path

    expect(page).to have_content('Gabriel Sugai')
    expect(page).to have_content('Bem vindo!')
  end
end