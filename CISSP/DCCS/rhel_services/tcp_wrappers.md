# TCP WRAPPERS

TCP Wrapper is a host-based networking ACL (Access Control List) system, used to filter network access to Internet Protocol (IP) servers on Unix-like operating systems. It allows host or subnetwork IP addresses, names and/or ident query replies, to be used as tokens to grant or deny access to services. TCP Wrapper works by specifying in its configuration file which hosts are (or are not) allowed to connect to "wrapped" network services.

### How TCP Wrapper Works

When a client initiates a TCP/IP connection to a server that is protected by TCP Wrapper, the wrapper first checks the client's host address and other details against its configuration rules. These rules are specified in two primary files:

1. **`/etc/hosts.allow`**: This file contains the list of hosts that are allowed to access network services.
2. **`/etc/hosts.deny`**: This file contains the list of hosts that are denied access to network services.

If a host is not mentioned in either file, it is granted access. If a host is mentioned in both files, the access rules in `hosts.allow` take precedence, meaning the order of rules is significant.

### Configuring TCP Wrapper

To use TCP Wrapper, you must have network services linked with the libwrap library. Commonly wrapped services include SSH, FTP, and Telnet.

Here’s a basic example of entries in the `hosts.allow` and `hosts.deny` files:

- **`/etc/hosts.allow`**:
  ```
  sshd: 192.168.1.100
  ```
  This rule allows SSH connections from the IP address `192.168.1.100`.

- **`/etc/hosts.deny`**:
  ```
  sshd: ALL
  ```
  This rule denies SSH connections from all other IP addresses.

### Examples of Using TCP Wrapper

1. **Allow access from a specific domain**:
   ```bash
   in.telnetd: .example.com
   ```
   This configuration allows access to the telnet service from any host in the `example.com` domain.

2. **Deny access from a specific IP address**:
   ```bash
   sshd: 203.0.113.45
   ```
   This entry in `hosts.deny` would block all SSH attempts from the IP address `203.0.113.45`.

3. **Combining conditions with EXCEPT**:
   ```bash
   sshd: ALL EXCEPT 192.168.1.100
   ```
   This rule in `hosts.allow` permits SSH access for all hosts except `192.168.1.100`.

### Security Considerations

While TCP Wrapper provides a basic level of security by controlling access based on IP address, hostname, or network, it does not inspect the content of the traffic. As such, it should be used in conjunction with other security measures such as firewalls and intrusion detection systems.

Additionally, because TCP Wrapper relies on IP addresses and hostnames, it can be susceptible to IP spoofing and DNS spoofing attacks. Therefore, it is important to ensure your network is secured against such vulnerabilities.

### Conclusion

TCP Wrapper is a useful tool for adding an additional layer of security to Unix-like systems by controlling access to network services. It's relatively simple to configure but powerful in its ability to restrict or allow access based on host, domain, or IP address criteria. However, it's essential to use it as part of a broader security strategy.
