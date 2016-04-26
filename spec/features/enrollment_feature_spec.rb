require "rails_helper"

RSpec.describe 'Enrollment feature', type: :feature do
  describe 'enroll a student in a course' do
    let(:student) { FactoryGirl.create :student }
    let(:course) { FactoryGirl.create :course }

    before do
      student
      course
    end

    it 'enrolls student in a course on 10/10/2010' do
      visit enrollments_path
      expect(page).to have_content('New Enrollment')
      select student.name, from: 'enrollment_student_id'
      select course.name, from: 'enrollment_course_id'
      fill_in 'enrollment_entry_at', with: '10/10/2010'
      click_on 'Enroll'
      student.reload
      course.reload
      expect(student.courses).to include(course)
    end
  end
end
