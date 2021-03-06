require 'rails_helper'

describe Image do
  it { should validate_presence_of :owner_id }
  it { should have_many(:users).through(:tags) }
end
