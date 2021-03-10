require 'socket'

message = "null"
response = "null"

print "SERVER\nInput port to use:\n" #server initialization (dunno if i spelled that correctly)
port = gets							#asks for port to use 
port = port.chomp
print "Port accepted\n"
socket = TCPServer.new('0.0.0.0', port)

def connection_loop(client)
	message = gets
	client.write "<Server> " + message
end

def connection_receive(client)
	loop do
		response = client.gets
		print response
	end
end

def connection_start(client)
	print "New client! Their ID is #{client}\n"
	
	client.write("Hello from server!\n")
	
	loop do
		connection_loop(client)
	end
end


loop do
	client = socket.accept
	Thread.new {connection_start(client)}
	Thread.new {connection_receive(client)}
end