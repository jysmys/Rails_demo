RSpec.describe Comment, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :commenter }
    it { is_expected.to have_db_column :body }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :commenter }
    it { is_expected.to validate_presence_of :body }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:comment)).to be_valid
    end
  end
end