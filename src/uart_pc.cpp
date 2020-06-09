#include <windows.h>
#include <iostream>
#include <ctime>

void set_up_serial_port(HANDLE& h);
bool get_data_from_serial_port(unsigned& data);
bool write_data_to_serial_port(unsigned data);
const int NO_DEFAULT_DEVICE = 2;

using namespace std;
int main(int argc, char* argv[])
{   
    unsigned data, result;
    const int range_min = 0, range_max = 0xff;
    srand (static_cast<unsigned>(time(0))); 
    
    char operation;
    do {
        cout << "Select Operation (r - read switches, s - send hashed password, e - exit program)" << endl;
        cin >> operation;
        switch (operation)
        { 
            case 'r':
                if (get_data_from_serial_port(result))
                    cout << "The result from FPGA is: " << hex << result << endl;
                break;
            case 's':
                //Break down the hashed passwords into bitstream

                data = static_cast<unsigned>((double)rand() / (RAND_MAX + 1) *(range_max - range_min) + range_min);
                //send data to the FPGA
                if (write_data_to_serial_port(data))
                    cout << "The data " << hex << data <" have been successfully transmitted to the FPGA" << endl;
                break;
            case 'e' :
                break;
            default:
                cout << "Wrong parameter" << endl;
        }
    }
    while (operation != 'e');
        return 0;
};

void set_up_serial_port(HANDLE& serial_port)
{ 
    const long baud_rate = 9600;                 //baud rate
    char port_name[] = "COM9:";                  //name of serial port (consult the Device Manager)
    //open up a handle to the serial port
    serial_port = CreateFile(port_name, GENERIC_READ | GENERIC_WRITE, 0, 0,OPEN_EXISTING, 0, 0);
    
    if (serial_port == INVALID_HANDLE_VALUE)     //make sure the port was opened
    { 
        cerr << "Error opening port" << endl;
        CloseHandle(serial_port);
    }   
    //set up the serial port
    DCB properties;
    //properties of serial port
    GetCommState(serial_port, &properties); //get the properties
    properties.BaudRate = baud_rate;
    //set the baud rate
    //set the other properties
    properties.Parity = NOPARITY;
    properties.ByteSize = 8;
    properties.StopBits = ONESTOPBIT;
    SetCommState(serial_port, &properties);
}

bool get_data_from_serial_port(unsigned& data)
{ 
    unsigned long bytes_to_receive = 1;
    //number of bytes to receive from COM
    unsigned long bytes_received;
    //number of bytes actually received from COM
    HANDLE serial_port = 0;
    set_up_serial_port(serial_port);
    //receive data from the serial port
    ReadFile(serial_port,static_cast<void *>(&data),bytes_to_receive,&bytes_received, 0);
    
    if (bytes_received != bytes_to_receive)
    { 
        cerr << "Error reading file" << endl;
        CloseHandle(serial_port);
        return false;
    }
    CloseHandle(serial_port);
    data = *data & 0xff;
    return true;
}

bool write_data_to_serial_port(unsigned data)
{ 
    unsigned long bytes_to_send = 1;
    //number of bytes to send to COM
    unsigned long bytes_sent;
    //number of bytes actually sent to COM
    data = data & 0xff;
    HANDLE serial_port = 0;
    set_up_serial_port(serial_port);
    //send data to the serial port
    WriteFile(serial_port, static_cast<void *>(&data), bytes_to_send, &bytes_sent, 0);
    if (bytes_sent != bytes_to_send)
    {
         cerr << "Error writing file" << endl;
        CloseHandle(serial_port);
        return false;
    }
    CloseHandle(serial_port);
    return true;
}