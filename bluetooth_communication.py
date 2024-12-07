import bluetooth

# Create a Bluetooth server
server_socket = bluetooth.BluetoothSocket(bluetooth.RFCOMM)

# Bind the socket to a specific port (1 in this case)
server_socket.bind(("", 1))

# Start listening for incoming connections
server_socket.listen(1)

# Accept an incoming connection
client_socket, address = server_socket.accept()
print("Connected to ", address)

# Continuously receive data from the client
while True:
    data = client_socket.recv(1024) # Receive up to 1024 bytes
    if not data: # If no data is received, break the loop
        break
    print("Received data:", data.decode()) # Decode the received bytes into a string

    # Send a response (optional)
    client_socket.send("Message received".encode()) # encode the response as bytes

# Close the client and server sockets
client_socket.close()
server_socket.close()
