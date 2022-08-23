#!/usr/bin/env ruby

require 'csv'

class Parser
  def initialize(argv)
    abort "#{ self.class.name }: Filename missing!" if argv.first.nil?
    abort "#{ self.class.name }: File does not exist!" unless File.exists?(argv.first)

    @views = CSV.read(argv.first, col_sep: ' ')
  end

  def call
    visits = grouped_by_url.transform_values{ |v| v.count }.sort_by { |k, v| -v }
    uniq = grouped_by_url.transform_values{ |v| v.uniq.count }.sort_by { |k, v| -v }

    print_count('VISITS BY URL', visits)
    print_count('UNIQ VISITS BY URL', uniq)
  rescue => e
    puts "#{ self.class.name }: while parsing logfile: #{ argv.first }, errors occured: #{ e }"
  end

  private

  attr_reader :views

  def grouped_by_url
    @grouped_by_url ||= views.group_by { |e| e[0] }
  end

  def print_count(counter_name, counter)
    puts counter_name
    counter.each { |url, visits_count| puts "#{ url } #{ visits_count } visits" }
    puts
  end
end

Parser.new(ARGV).call
