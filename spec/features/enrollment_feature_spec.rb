require "rails_helper"

RSpec.describe 'Enrollment feature', type: :feature do
  describe 'enrollment a student in a course' do
    it 'see enrollments' do
      visit enrollments_path
      expect(page).to have_content('New Enrollment')
    end
  end
end
