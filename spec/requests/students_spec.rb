require 'rails_helper'

RSpec.describe "Students", type: :request do
  describe "GET /students" do
    it "returns success" do
      get students_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /students/:id" do
    before do
      FactoryGirl.create(:student)
    end

    let(:student_id) { Student.last.id }

    it "returns success" do
      get student_path(student_id)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /students/new" do
    it "returns success" do
      get new_student_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /students/:id/edit" do
    before do
      FactoryGirl.create(:student)
    end

    let(:student_id) { Student.last.id }

    it "returns success" do
      get edit_student_path(student_id)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /students" do
    let(:name) { "name" }
    let(:register_number) { "1234"}
    let(:status) { 2 }
    let(:student_query) { Student.where(name: name, register_number: register_number, status: status) }

    it "creates a new student" do
      post students_path, student: { name: name, register_number: register_number, status: status }
      expect(student_query.size).to eq(1)
      expect(response).to redirect_to(student_path(student_query.first))
    end
  end

  describe "PUT /students/:id" do
    let(:student) { FactoryGirl.create(:student) }
    let(:student_query) { Student.find(student.id) }

    it "updates an existing student" do
      put student_path(student), student: { name: "NEW NAME" }
      expect(student_query.name).to eq("NEW NAME")
    end
  end

  describe "DESTROY /students/:id" do
    let(:student) { FactoryGirl.create(:student) }
    let(:student_query) { Student.where(id: student.id) }

    it "destroys an existing student" do
      delete student_path(student)
      expect(student_query).to be_empty
    end
  end
end
