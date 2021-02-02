# frozen_string_literal: true

feature 'Testing infrastructure' do
  scenario 'can run app and check content' do
    visit('/')
    expect(page).to have_content 'Welcome to Bunker!'
  end
end
