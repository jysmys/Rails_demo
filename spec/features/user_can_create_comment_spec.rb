feature 'User can create comments' do
  before do
    create(:article, title: 'More news in home')
    visit root_path
    click_on "More news in home"
  end
  
  context "Successfully create a comment" do
    before do
      fill_in "comment[commenter]", with: "Tiger Woods"
      fill_in "comment[body]", with: "I'll be in sweden next month, can i come over on a Swedish fika"
      click_on "Create Comment"
    end
    
    it 'User should see the comment' do
      expect(page).to have_content 'i come over on a Swedish fika'
    end
  
  end
end