feature 'log in' do
    scenario 'it allows a user to log in' do
    sign_up
    visit('/')
    click_link "Log in"
    fill_in :username, with: "John Doe"
    fill_in :password, with: "password123"
    click_button "Log in"
    expect(page).to have_content "User: John Doe"
  end
end
