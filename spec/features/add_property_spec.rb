feature 'add a property' do
  scenario 'can enter property information' do
    visit ('/add_property')
    fill_in :name, with: "nuclear bunker"
    fill_in :description, with: "Designed for up to 600 military and civilian personnel, possibly even the Prime Minister"
    fill_in :price, with: 10.00
    click_button "List your bunker!"
  end
end