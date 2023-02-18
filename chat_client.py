

import socket,curses

import threading,binascii

HOST=input('enter Host (default : 127.0.0.1) ')

if HOST=='' or HOST.isspace==True:

    HOST="127.0.0.1"

    

PORT=input('(default-10001) PORT : ')

if PORT=='' or PORT.isspace==True:

    PORT=10001

else:

    PORT=int(PORT)



BUFFER_SIZE = 1024



class ChatClient:

    '''

    class for chat client throw which we communicate with the server

    '''

    def __init__(self, host, port):

        #create socket, connect to server

        self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

        self.sock.connect((host, port))





    def send_message(self, message):

        '''

        function for sending message to server

        '''

    

        self.sock.sendall(binascii.b2a_uu( message.encode()))

    

    def receive_message(self):

        '''

        function for receiving message from server

        '''

        data = self.sock.recv(BUFFER_SIZE)

        if not data:

            return None

        data = binascii.a2b_uu(data).decode()

        return data



class ChatInterface:

    '''

    class for creating required console interface

    '''

