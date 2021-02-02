feature 'displaying our properties' do
  scenario 'once property is added, we can view it on the homepage' do
    adding_property
    expect(page).to have_content "nuclear bunker"
  end

end