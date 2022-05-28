require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(email: 'test@mail.com', name: 'John doe', role: 'member') }
  before { subject.save }

  it 'should not be valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should not be valid without an email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'should not be valid without a role' do
    subject.role = nil
    expect(subject).to_not be_valid
  end

  it 'is valid with valid attributes' do
    expect(User.new(email: 'test@mail.com', password: 'password', name: 'John doe', role: 'member')).to be_valid
  end

  it 'should not be valid with a duplicate email' do
    subject.email = 'test@mail.com'
    expect(subject).to_not be_valid
  end

  it 'name should not be too short' do
    subject.name = 'a' * 5
    expect(subject).to_not be_valid
  end

end