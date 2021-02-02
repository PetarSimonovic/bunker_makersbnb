feature 'sign up' do 
    scenario 'it allows a user to sign up' do 
    visit ('/')
    click_link "Sign up"
    fill_in :username, with: "John Doe"
    fill_in :password, with: "password123"
    fill_in :email, with: "my_email@email.com"
    click_button "Confirm sign up"
    expect(page).to have_content "User: John Doe"
  end
end