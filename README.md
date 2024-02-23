# Network Monitoring Tool

## Description
This shell script is designed to monitor the network connectivity and status of nodes in a network. It provides various functionalities to check the status of specified nodes, log the results for historical analysis, and send email notifications in case any node becomes unreachable.

## Functionalities
- **Ping Nodes**: Ping a list of specified nodes and display their status (reachable or unreachable).
- **Logging**: Log the timestamp and status of each node in a file for historical analysis.
- **Email Notification**: Provide an option to send an email notification if any node becomes unreachable.

## Requirements
- Accepts a list of node IP addresses or hostnames as input.
- Uses the ping command to check the connectivity status of each node.
- Logs the results to a file with timestamps.
- Implements an option to send an email notification if any node is unreachable.

## Usage
1. Clone the repository.
2. Navigate to the directory where the script is located.
3. Run the script with appropriate parameters:

```bash
./network_monitor.sh <node1> <node2> ...
```

Replace `<node1>`, `<node2>`, etc. with the IP addresses or hostnames of the nodes you want to monitor.

## Example
```bash
./network_monitor.sh 192.168.1.1 google.com
```

## Contributors
- [Augustine Ubong](https://github.com/ubongcloud)

## License
This project is licensed under the [MIT License](LICENSE).