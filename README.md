# zabbix-keys-benchmark

Simple script to benchmark how fast are zabbix keys processed on given host

## Requirements

- Zabbix-agent proprely configured
- Host running this script added as zabbix server in agent's config (or run from server itself)
- Program zabbix_get available on host

## Usage

- Grab zabbix-keys-benchmark.pl and make it executable (chmod +x zabbix-keys-benchmark.pl)
- Place all keys (items) you want to process from given host, with their parameters to the file named keys.txt in the same directory (one per line)
- Run the script giving benchmarked host as a parameter
- Precision (and execution time) can be adjusted by changing $count variable

## Example

./zabbix-keys-benchmark.pl myhost.mydomain.com | sort -n

## How to commit

- Fork repo on GitHub
- Comment your changes
- Send pull request
