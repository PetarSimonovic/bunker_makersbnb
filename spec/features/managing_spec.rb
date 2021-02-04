feature "Managing properties" do

  scenario "View booking requests" do

     visit ('/')
     click_link "Sign up"
     fill_in :username, with: "Test Host"
     fill_in :password, with: "password123"
     fill_in :email, with: "my_email@email.com"
     click_button "Confirm sign up"
     adding_property
     visit('/')
     click_link "Sign up"
     fill_in :username, with: "Test Guest"
     fill_in :password, with: "password123"
     fill_in :email, with: "my_email@email.com"
     click_button "Confirm sign up"
     click_button "Book property"
     visit ('/')
     click_link "Log in"
     fill_in :username, with: "Test Host"
     fill_in :password, with: "password123"
     click_button "Log in"
     click_link("Manage Properties")
     expect(page).to have_content("")
   end

 end
