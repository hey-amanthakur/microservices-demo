#!/usr/bin/env ruby

# Check Health of each service
######################################
require 'net/http'
require 'optparse'
require 'json'
require 'awesome_print'

$stdout.sync = true
options = {}
health = {}

OptionParser.new do |opts|
    opts.banner = "Usage healthcheck.rb -h [host] -t [timeout] -r [retry]"
    opts.on("-h", "--hostname localhost", "Specify hostname") do |v|
        options[:hostname] = v
    end
    opts.on("-t", "--timeout 60", OptionParser::DecimalInteger, "Specify timeout in seconds") do |v|
        options[:timeout] = v
    end
    opts.on("-r", "--retry n", OptionParser::DecimalInteger, "Specify number of times to retry") do |v|
        options[:retry] = v
    end
    opts.on("-d", "--delay 60", OptionParser::DecimalInteger, "Specify seconds to delay") do |v|
        options[:delay] = v
    end
    opts.on("-s", "--services X,Y", "Specify services to check") do |v|
        options[:services] = v
    end
end.parse!

unless options.key?(:services)
    puts "\e[31mno services specified\e[0m"
    exit(1)
end

unless options.key?(:retry)
  options[:retry] = 1
end

services = options[:services].split(',')
(1..options[:retry]).each do |i|

  if options.key?(:delay)
      puts "\e[35mSleeping for #{options[:delay]}s...\e[0m"
      sleep options[:delay]
  end

  services.each do |service|
      begin
          url = service
          if options.key?(:hostname)
              url = "#{options[:hostname]}/#{url}"
          end
          uri = URI.parse("http://#{url}/health")
          resp = Net::HTTP.start(uri.host, uri.port) do |http|
              http.read_timeout = options[:timeout] if options[:timeout]
              http.get(uri.request_uri)
          end
      rescue
          health[service] = "err"
      else
          statuses = JSON.parse(resp.body)
          statuses = statuses['health'] if statuses.is_a?(Hash) && statuses.key?('health')
          statuses.each do |item|
              health[item["service"]] = item["status"]
          end
      end
  end
  ap health

  if health.all? { |service, status| status == "OK" }
    break
  end
end

unless health.all? {|service, status| status == "OK" }
    exit(1)
end
