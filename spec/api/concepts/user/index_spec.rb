# frozen_string_literal: true

require_relative '../../../spec_helper'

describe User::Index do
  it 'is successful' do
    5.times { Fabricate.create(:user) }

    response = User::Index.call({}, {})
    expect(response[:collection].count).to eql 5
  end

  it 'limit 3' do
    5.times { Fabricate.create(:user) }

    response = User::Index.call({ limit: 3 }, {})
    expect(response[:collection].count).to eql 3
  end

  it 'order DESC' do
    3.times { Fabricate.create(:user) }

    response = User::Index.call({ order: :desc }, {})
    expect(response[:collection].first.id).to be > response[:collection].last.id
  end

  it 'order ASC' do
    3.times { Fabricate.create(:user) }

    response = User::Index.call({ order: :asc }, {})
    expect(response[:collection].first.id).to be < response[:collection].last.id
  end
end
