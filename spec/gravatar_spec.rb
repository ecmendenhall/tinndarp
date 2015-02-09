require 'spec_helper'
require 'gravatar'

RSpec.describe Gravatar do

  it 'generates a gravatar URL for a given email' do
    gravatar_url = 'http://gravatar.com/avatar/1623c14bf528b7e51aa361e871452f9d.png?s=48'
    expect(Gravatar.for('ecmendenhall@gmail.com')).to eq(gravatar_url)
  end

  it 'uses a custom size when provided' do
    gravatar_url = 'http://gravatar.com/avatar/1623c14bf528b7e51aa361e871452f9d.png?s=12'
    expect(Gravatar.for('ecmendenhall@gmail.com', 12)).to eq(gravatar_url)
  end
end
