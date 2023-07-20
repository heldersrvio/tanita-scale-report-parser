require "pdf-reader"

class ReportContent
  def initialize(report_path)
    reader = PDF::Reader.new(report_path)
    @text = reader.pages.map(&:text).join("\n")
  end

  attr_accessor :text
end
