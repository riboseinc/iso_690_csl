require 'citeproc'
require 'csl/styles'
require 'bibtex'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

CSL::Style.root = 'styles'

def bibliographic_entry_for(id)
  cpp = CiteProc::Processor.new style: described_class, format: 'html'
  cpp.import BibTeX.open('spec/fixtures/refs.bib').to_citeproc
  cpp.render(:bibliography, id: id).join
end
