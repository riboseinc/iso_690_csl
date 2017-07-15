require 'spec_helper'

# NOTE: this just ensures the spec env is in working order.

describe :apa do
  it { expect( bibliographic_entry_for('Nobody06') ).to eq('Jr, N. (2006). My Article.') }
end
