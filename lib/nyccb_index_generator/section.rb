#!/usr/bin/env ruby

module NyccbIndexGenerator

  class Section

    attr_reader :heading_identifier, :catch_text

    def initialize(heading_identifier, catch_text)
      @heading_identifier = heading_identifier
      @catch_text         = catch_text
  end
end