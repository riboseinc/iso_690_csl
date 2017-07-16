require 'spec_helper'

# This just sets an expectation on existing styles to check the spec env works.

describe :"iso690-author-date-en" do
  it { expect( bibliographic_entry_for('Nobody06') ).to eq('JR, Nobody, 2006. _My Article_. 2006. ') }
end
