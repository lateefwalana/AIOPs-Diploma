# firewalld
**Firewalld** is a dynamic firewall manager with support for network/firewall zones that define the trust level of network connections or interfaces. It is part of the Linux system and uses iptables in the background for managing firewall configurations. Firewalld provides a more manageable and flexible way to handle your firewall configurations and rules without the need for restarting the firewall service to apply changes.

### Key Features of Firewalld:

1. **Dynamic Updates**: Changes to the firewall rules can be applied on the fly, without the need for a complete firewall restart. This reduces downtime and makes it easier to make and test configuration changes.

2. **Zones**: Firewalld categorizes traffic based on zones. Each zone has its own set of rules and policies that apply to the network interfaces assigned to them. This makes it easier to separate and manage network traffic based on levels of trust and function.

3. **Support for IPv4 and IPv6**: Firewalld can handle both IPv4 and IPv6 traffic, ensuring compatibility and flexibility for modern network environments.

4. **Rich Language and Direct Interface**: Firewalld allows administrators to use a 'rich language' to express firewall rules succinctly, or a 'direct interface' to add raw iptables rules.

5. **Interfaces and Sources**: Interfaces and source addresses can be added to or removed from zones, which adjusts the handling of traffic accordingly.

6. **Services and Ports**: Specific services and ports can be enabled or disabled within zones, providing control over what network traffic is allowed or blocked.

### Examples of Firewalld Commands and Configurations:

1. **Starting and Enabling Firewalld**:
   ```bash
   sudo systemctl start firewalld
   sudo systemctl enable firewalld
   ```

2. **Checking the Status**:
   ```bash
   sudo firewall-cmd --state
   ```

3. **Listing Active Zones**:
   ```bash
   sudo firewall-cmd --get-active-zones
   ```
   This shows which zones are active and which interfaces are bound to these zones.

4. **Adding a Service to a Zone**:
   ```bash
   sudo firewall-cmd --zone=public --add-service=http
   ```
   This command temporarily allows HTTP traffic in the public zone.

5. **Making Rule Permanent**:
   ```bash
   sudo firewall-cmd --zone=public --add-service=https --permanent
   ```
   This permanently allows HTTPS traffic in the public zone.

6. **Reloading Firewalld**:
   ```bash
   sudo firewall-cmd --reload
   ```
   This applies all changes made since the last reload or restart.

7. **Blocking an IP Address**:
   ```bash
   sudo firewall-cmd --zone=public --add-rich-rule='rule family="ipv4" source address="192.168.1.100" reject'
   ```
   This command blocks all traffic from the IP address `192.168.1.100` in the public zone.

### Use Cases for Firewalld:

- **Securing a Home Network**: Set up different zones for your home network to manage what devices have internet access and what services are exposed to the public internet.
- **Enterprise Network Security**: Manage a complex set of rules dictating what traffic is allowed into different parts of an enterprise network.
- **Server Management**: Configure specific firewall rules tailored to the services running on the servers, enhancing security without affecting accessibility.

**Firewalld** is a powerful tool that can be used to increase the security and manageability of network environments in both personal and professional settings. Its dynamic nature allows system administrators to implement changes quickly and effectively, ensuring that the network adapts to new threats and requirements without significant downtime.