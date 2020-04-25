feature 'user can sign up' do
  let(:user) {create(:user, email: "gittan@gmail.com")}
    before do
    visit root_path
  end
  
  
  context 'successfully created a new account' do
    before do
      click_on "Sign up"
    end

    it 'User should see success message' do
      fill_in "Name", with: "fredagsmys"
      fill_in "Email", with: "myspys@gmail.com"
      fill_in "Password", with: user.password
      fill_in "Password confirmation", with: user.password_confirmation
      click_on "SignUp"
      expect(page).to have_content "You have signed up successfully"
    end
  end

  context 'couldnt created a new account' do
    before do
      click_on "Sign up"
    end

    it 'User should see error message' do
      fill_in "Name", with: "Loppan"
      fill_in "Email", with: "loppan@gmail.com"
      fill_in "Password", with: user.password
      fill_in "Password confirmation", with: "123456"
      click_on "SignUp"
      expect(page).to have_content "Password confirmation doesn't match"
    end

    it 'User should see that password is to short error message' do
      fill_in "Name", with: "Loppan"
      fill_in "Email", with: "loppan@gmail.com"
      fill_in "Password", with: "blogger"
      fill_in "Password confirmation", with: "blogger"
      click_on "SignUp"
      expect(page).to have_content "Password is too short (minimum is 8 characters)"
    end
  end
end