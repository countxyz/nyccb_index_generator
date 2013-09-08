#!/usr/bin/env ruby

require 'csv'
require 'json'

require_relative 'section'

module NyccbIndexGenerator

  class JsonAssembler

    attr_reader :section_parts

    def initialize
      @section_parts = []
    end

    def get_csv_data(csv_file)
      CSV.foreach(csv_file, headers: true) do |row|
        @section_parts << Section.new(row["heading_identifier"], row["catch_text"])
      end
    end

    def build_json
      p JSON.pretty_generate(@section_parts)
    end
  end
end