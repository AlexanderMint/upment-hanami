# frozen_string_literal: true

require_relative '../../../spec_helper'

describe User::Show do
  let(:user) { Fabricate.create(:user) }
  let(:params) { Hash[id: user.id] }
  let(:options) { Hash[current_user: user] }

  it 'is successful' do
    response = User::Show.call(params, options)
    expect(response[:model].id).to eql user.id
  end

  it 'without current user' do
    response = User::Show.call(params, {})
    expect(response.failure?).to eq true
    expect(response[:error][:message]).to eq 'Forbidden'
  end

  it 'deleting someone else is token' do
    new_user = Fabricate.create(:user)

    response = User::Show.call({ id: new_user.id }, options)
    expect(response.failure?).to eq true
    expect(response[:error][:message]).to eq 'Forbidden'
  end

  it 'non-existent id' do
    response = User::Show.call({ id: 0 }, options)
    expect(response.failure?).to eq true
    expect(response[:error][:message]).to eq 'Forbidden'
  end

  it 'without params' do
    response = User::Show.call({}, options)
    expect(response.failure?).to eq true
  end
end
