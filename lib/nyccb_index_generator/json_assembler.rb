#!/usr/bin/env ruby

require 'csv'
require 'json'

module NyccbIndexGenerator

  class JsonAssembler

    attr_reader :section_parts, :pretty_json

    def initialize
      @section_parts  = []
      @pretty_json    = pretty_json
    end

    def get_csv_data(csv_file)
      CSV.foreach(csv_file, headers: true) do |row|
        row_array = [row["heading_identifier"], row["catch_text"]]
        @section_parts << row_array
      end
    end

    def build_json
      @section_parts.each do |section|
        @pretty_json = JSON.pretty_generate(@section_parts)
      end
    end

    def json_to_file
      File.open("index.json", "w") do |file|
        file.print @pretty_json
      end
    end
  end
end
