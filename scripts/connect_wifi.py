import subprocess

def connect_wifi(network_id):
    subprocess.run(['nmcli', 'connection', 'up', 'id', network_id])

def main():
    networks = {
        '1': 'stanja',
        '2': 'CloudSuite',
        '3': 'Markant',
        '4': 'Steven🍟'
    }

    print("Available wifi networks:")
    for key, value in networks.items():
        print(f"{key}. {value}")

    choice = input("Select the wifi network you want to connect to [1-4]: ")

    if choice in networks:
        connect_wifi(networks[choice])
    else:
        print("Invalid choice. Please try again.")

if __name__ == "__main__":
    main()

