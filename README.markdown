# Officer - Ruby lock server and client built on EventMachine

Officer is designed to help you coordinate distributed processes and avoid race conditions.  Inspiration comes from [elock](http://github.com/dustin/elock).

Read more in my blog post: [http://remesch.com/officer-the-ruby-lock-server-and-client](http://remesch.com/officer-the-ruby-lock-server-and-client)

## Installation

    gem install officer

## Usage

Officer uses the 'daemons' gem to simplify creating long lived background processes.
Here are some simple examples in case you aren't familiar with it.

'daemons' help information:
    sudo officer --help

Officer's help information:
    sudo officer run -- --help

Run Officer in the foreground with full logging and statistics:
    sudo officer run -- -l debug -s

Run officer in the foreground with full logging and statistics, but listening on a Unix socket:
	sudo officer run -- -l debug -s -o UNIX -f /var/run/officer.sock

Same command as above, but change pid and sock path to a non-priveleged path to run officer
as a non-privileged user:
	officer run -- --pid-dir=/tmp -l debug -s -o UNIX -f /writeable/path/officer.sock

Run Officer in the background (production mode) and listen on a specific IP and port:
    sudo officer start -- -h 127.0.0.1 -p 9999

Same command as above, but running as unprivileged user
	officer start -- --pid-dir=/writeable/path -h 127.0.0.1 -p 9999

Same command as above, but running as unprivileged user and listening on an Unix socket
	officer start -- --pid-dir=/writeable/path -o UNIX -f /writeable/path/officer.sock

### Other notes:

- The server listens on 0.0.0.0:11500 by default.
- All debugging and error output goes to stdout for now.
- The daemons gem will create a pid file in /var/run and redirect stdout to /var/log/officer.output when using the 'start' option for background mode.
- I personally run Officer in production using Ruby Enterprise Edition (REE) which is based on Ruby 1.8.7.
- RVM and JRuby users should check the [Known Issues](https://github.com/chadrem/officer/wiki/Known-Issues) wiki page.

## Ruby Client

    require 'rubygems'
    require 'officer'

### Create a client object - Officer listening on TCP 

    client = Officer::Client.new :host => 'localhost', :port => 11500

### Create a client object - Officer listening on UNIX Socket

    client = Officer::Client.new :sockfile => '/sock/path/officer.sock'

Options:

- :host => Hostname or IP address of the server to bind to (default: 0.0.0.0).
- :port => TCP Port to listen on (default: 11500).


### Lock

    client.lock 'some_lock_name'

Options:

- :timeout => The number of seconds to wait for a lock to become available (default: wait forever).
- :namespace => Prepend a namespace to each lock name (default: empty string).
- :queue_max => If the lock queue length is greater than :queue_max then don't wait for the lock (default: infinite).


### Unlock

    client.unlock 'some_lock_name'


### Lock a block of code

    client.with_lock('some_lock_name', :timeout => 5) do
      puts 'hello world'
    end

Options:

- Same options as the above Lock command.


### Release all locks for this connection

    client.reset


### Reconnect (all locks will be released)

    client.reconnect

- Useful if you use Officer with Phusion Passenger and smart spawning.  See [Passenger's documentation](http://www.modrails.com/documentation/Users%20guide%20Apache.html#_smart_spawning_gotcha_1_unintential_file_descriptor_sharing) for more information.

### Close connection to officer service

    client.close


### Show locks

    client.locks

- Returns the internal state of all the server's locks.


### Show connections

    client.connections

- Returns the internal state of all the server's connections.


### Show my locks

    client.my_locks


## Copyright

Copyright (c) 2010 Chad Remesch. See LICENSE for details.
