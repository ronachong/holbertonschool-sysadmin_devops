#!/usr/bin/env ruby

# find_action searches arguments from cmd line for the action keyword and
# returns its value
def find_action(argv)
  begin
    argv.each { |argument|
      match = /(-a|--action)=(launch|stop|start|terminate)/.match(argument)
      if match != nil
        return match[2]
      end
    }
    # if no match was found:
    raise 'No valid value for server ID passed.'

  rescue Exception => e
    puts e.message
  end
end

# find_serverID searches arguments from cmd line for the server_id keyword and
# returns its value
def find_serverID(argv)
  begin
    # search argv for server_id
    argv.each { |argument|
      match = /(-i|--server_id)=(\S+)/.match(argument)
      if match != nil
        return match[2]
      end
    }
    # if no match was found:
    raise 'No valid value for action passed.'

  rescue Exception => e
    puts e.message
  end
end

action = find_action(ARGV)
server_id = find_serverID(ARGV)
