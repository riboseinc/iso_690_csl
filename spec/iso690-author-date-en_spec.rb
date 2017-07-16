require 'spec_helper'

# This just sets an expectation on existing styles to check the spec env works.

describe :"iso690-author-date-en" do
  it { expect( bibliographic_entry_for('Nobody06') ).to eq('JR, Nobody, 2006. _My Article_. 2006. ') }
  it { expect( bibliographic_entry_for('ISO13586') ).to eq('') }
  it { expect( bibliographic_entry_for('DPA1984') ).to eq('') }
end
