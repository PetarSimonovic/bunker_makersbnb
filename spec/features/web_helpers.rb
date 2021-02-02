def adding_property
  visit ('/bunker')
  click_link "Add Property"
  fill_in :name, with: "nuclear bunker"
  fill_in :description, with: "Designed for up to 600 military and civilian personnel, possibly even the Prime Minister"
  fill_in :price, with: 10.00
  click_button "List your bunker!"
end

def sign_up
  visit ('/')
  click_link "Sign up"
  fill_in :username, with: "John Doe"
  fill_in :password, with: "password123"
  fill_in :email, with: "my_email@email.com"
  click_button "Confirm sign up"
  expect(page).to have_content "User: John Doe"
end
