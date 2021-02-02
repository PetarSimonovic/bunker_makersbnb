feature 'welcome' do
    scenario 'it should welcome and take us to log in' do 
        visit('/')
        click_link "Log in"
        expect(current_path).to eq '/log_in'
    end

    scenario 'it should welcome and take us to sign up' do 
        visit('/')
        click_link "Sign up"
        expect(current_path).to eq '/sign_up'
    end
end
