require 'spec_helper'

describe Pdftotext::Document do

  subject { Pdftotext::Document.new(fixture_path) }

  it "knows the path" do
    expect(subject.path).to eql(fixture_path)
  end

  it "return the text" do
    text = subject.text
    expect(text).to eql("This is a test.\n\fThis is another test.\n\f")
  end

  it "returns the pages" do
    pages = subject.pages
    expect(pages.count).to eql(2)

    expect(pages.first.text).to eql("This is a test.\n")
    expect(pages.first.number).to eql(1)

    expect(pages.last.text).to eql("This is another test.\n")
    expect(pages.last.number).to eql(2)
  end

  it "respects non-default command line arguments" do
    pages = subject.pages({l: 1})
    expect(pages.count).to eql(1)
  end
end
