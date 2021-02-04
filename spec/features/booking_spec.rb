feature "request to book" do
  scenario "to be able to click book button" do
    sign_up
    adding_property
    visit ('/')
    click_link "Sign up"
    fill_in :username, with: "bill"
    fill_in :password, with: "123"
    fill_in :email, with: "bill@email.com"
    click_button "Confirm sign up"
    click_button "Book property"
    expect(page).to have_content "Booking requested"
  end
end

feature "request to book" do
  scenario "to be able to book a specific property" do
    user = User.create(username: "test_user", password: "password", email: "test@email.com")
    property = Property.create(host_id: user.user_id,name: "small bunker", description: "a tiny bunker", price: 1.00)
    visit ('/')
    click_link "Sign up"
    fill_in :username, with: "bill"
    fill_in :password, with: "123"
    fill_in :email, with: "bill@email.com"
    click_button "Confirm sign up"
    click_button "Book property"
    expect(current_path).to eq "/booking/#{property.property_id}/#{property.host_id}"
  end
end
