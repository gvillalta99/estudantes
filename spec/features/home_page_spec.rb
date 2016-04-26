require 'rails_helper'

RSpec.describe 'Home page', type: :feature do
  describe 'visiting the students page' do
    it 'visits the students listing page' do
      visit root_path
      click_on 'Students Page!'
      expect(page).to have_content 'Listing students '
    end
  end
  describe 'visiting the courses page' do
    it 'visits the courses listing page' do
      visit root_path
      click_on 'Courses Page!'
      expect(page).to have_content 'Listing Courses'
    end
  end
  describe 'visiting the enrollment page' do
    it 'visits the enrollment page' do
      visit root_path
      click_on 'Enrollments Page!'
      expect(page).to have_content 'New Enrollment'
    end
  end
end
