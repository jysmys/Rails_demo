feature 'user can log in' do
  let(:registered_user) {create(:user)}
  before do
      visit root_path
      click_on 'Login'
  end

  describe 'user inputs correct credentials' do
    it 'user can successfully log in' do
      # login_as(registered_user, scope: :user)
      fill_in "Email", with: registered_user.email
      fill_in "Password", with: registered_user.password
      click_on "Log in"
      # visit root_path
      expect(page).to have_content "Signed in successfully."
    end
  end

  describe 'user inputs incorrect credentials' do
    it 'user input the wrong password' do 
      fill_in "Email", with: registered_user.email
      fill_in "Password", with: "summertime"
      click_on "Log in"
      expect(page).to have_content "Invalid Email or password"
    end

    it 'user inputs the wrong email' do
      fill_in "Email", with: "summertime@mail.com"
      fill_in "Password", with: registered_user.password
      click_on "Log in"
      expect(page).to have_content "Invalid Email or password"
    end
  end
end
