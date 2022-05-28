require 'rails_helper'

RSpec.describe Category, type: :model do
    subject { Category.new(name: 'test', icon: 'test') }
    before { subject.save }

    it 'should not be valid without a name' do
        subject.name = nil
        expect(subject).to_not be_valid
    end

    it 'should not be valid without an icon' do
        subject.name = nil
        expect(subject).to_not be_valid
    end

    it 'name should not be too short' do
        subject.name = 'a' * 5
        expect(subject).to_not be_valid
    end

    it 'icons should not be too short' do
        subject.icon = 'a' * 5
        expect(subject).to_not be_valid
    end
end