require "rails_helper"

describe Author do
  let(:author) {Author.new first_name: 'Jon', last_name: 'Dailey'}

  it 'has a full name' do
    expect(author.full_name).to eq('Dailey, Jon')
  end
end
