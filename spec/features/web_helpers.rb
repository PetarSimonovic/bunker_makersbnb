def adding_property
  visit ('/')
  click_link "Add Property"
  fill_in :name, with: "nuclear bunker"
  fill_in :description, with: "Designed for up to 600 military and civilian personnel, possibly even the Prime Minister"
  fill_in :price, with: 10.00
  click_button "List your bunker!"
end
