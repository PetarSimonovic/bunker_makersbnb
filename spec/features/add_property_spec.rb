feature 'add a property' do
  scenario 'can enter property information' do
    adding_property
  end

feature 'add a property' do
  scenario 'add a property and show it on main page' do
    adding_property
    expect(current_path).to eq '/'
  end
end

end
