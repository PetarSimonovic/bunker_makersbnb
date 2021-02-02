feature 'sign up' do
    scenario 'it allows a user to sign up' do
    sign_up
    expect(page).to have_content "User: John Doe"
  end
end
