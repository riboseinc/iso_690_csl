require 'citeproc'
require 'csl/styles'

require 'yaml'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

CSL::Style.root = 'styles'

def bibliographic_entry_for(id)
  cpp = CiteProc::Processor.new style: described_class, format: 'html'
  cpp.import YAML.load_file('spec/fixtures/bib.yml')
  cpp.render(:bibliography, id: id).join.html_to_asciidoc
end

# NOTE: what follows is analogous to asciidoc-bibtex internals.

module StringHtmlToAsciiDoc
  def html_to_asciidoc
    r = self.gsub(/<\/?i>/, '_')
    r = r.gsub(/<\/?b>/, '*')
    r = r.gsub(/<\/?span.*?>/, '')
    r = r.gsub(/<\/?div.*?>/, '')
    # r = r.gsub(/\{|\}/, '')
    r
  end
end

class String
  include StringHtmlToAsciiDoc
end
