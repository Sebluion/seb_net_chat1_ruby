require 'socket'

print "CLIENT\nEnter your username:" #username setup
username = gets
username = username.chomp

message = "null"
def connection_loop(socket, username)
	message = gets
	socket.write "<" + username + "> " + message
	
	Thread.new {connection_receive(socket)}	
end

def connection_receive(socket)
	line = socket.gets
	print line
end

print "Input IPv4 adress (without port) to connect to:\n" #client initialization (dunno if i spelled that correctly)
ipv4 = gets
ipv4 = ipv4.chomp
print "Input port to connect to:\n" # port setup
port = gets
port = port.chomp
socket = TCPSocket.new(ipv4, port)
print "Connection successful!\n"

line = "null"

loop do #connection loop
	while (line = socket.gets)
		print line
	end
	message = gets
	socket.write "<" + username + "> " + message
	
	Thread.new {connection_receive(socket)}	
end