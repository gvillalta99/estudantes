require 'rails_helper'

RSpec.describe Student, type: :model do
  it { should have_many(:classrooms) }
  it { should have_many(:courses) }
end
