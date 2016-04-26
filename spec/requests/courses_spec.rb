require 'rails_helper'

RSpec.describe "Courses", type: :request do
  describe "GET /courses" do
    it "returns success" do
      get courses_path
      expect(response).to have_http_status(200)
    end
  end
  describe "GET /courses/:id" do
    before do
      FactoryGirl.create(:course)
    end

    let(:course_id) { Course.last.id }

    it "returns success" do
      get course_path(course_id)
      expect(response).to have_http_status(200)
    end
  end
  describe "GET /courses/new" do
    it "returns success" do
      get new_course_path
      expect(response).to have_http_status(200)
    end
  end
  describe "GET /courses/:id/edit" do
    before do
      FactoryGirl.create(:course)
    end

    let(:course_id) { Course.last.id }

    it "returns success" do
      get edit_course_path(course_id)
      expect(response).to have_http_status(200)
    end
  end
  describe "POST /courses" do
    let(:name) { "CREATE COURSE" }
    let(:description) { "DESCRIPTION" }
    let(:status) { 102 }
    let(:course_query) { Course.where(name: name, description: description, status: status) }

    it "creates a course" do
      post courses_path, course: { name: name, description: description, status: status}
      expect(course_query.size).to eq(1)
      expect(response).to redirect_to(course_path(course_query.first))
    end
  end

  describe "PUT /courses/:id" do
    let(:course) { FactoryGirl.create(:course) }
    let(:new_name) { "UPDATED COURSE NAME" }

    it "updates a course" do
      put course_path(course), course: {name: new_name}
      expect(response).to redirect_to(course_path(course))
      expect(course.reload.name).to eq(new_name)
    end
  end

  describe "DELETE /courses/:id" do
    let(:course) { FactoryGirl.create(:course) }

    it "destroys a course" do
      delete course_path(course)
      expect(response).to redirect_to(courses_path)
      expect(Course.where(id: course.id)).to be_empty
    end
  end
end
