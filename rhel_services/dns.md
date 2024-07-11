# DNS - Domain Name System
DNS (Domain Name System) is a hierarchical and decentralized naming system used to resolve human-readable domain names (like www.example.com) into machine-readable IP addresses (like 192.0.2.1), which are required for locating and identifying computer services and devices on the Internet.

Setting up a DNS caching server along with a local zone for resolving specific domains on a Red Hat Enterprise Linux (RHEL) 9.5 system involves several steps, primarily using BIND (Berkeley Internet Name Domain), which is the most widely used DNS software on the Internet and supports DNS caching and zone management.

### Step 1: Install BIND
First, you need to install the BIND software package.

1. Open a terminal.
2. Update your package repository:
   ```bash
   sudo dnf update
   ```
3. Install BIND and related utilities:
   ```bash
   sudo dnf install bind bind-utils
   ```

### Step 2: Configure DNS Caching Server
To set up BIND as a caching DNS server:

1. Edit the main BIND configuration file:
   ```bash
   sudo nano /etc/named.conf
   ```
2. Ensure that the `listen-on` directive is set to listen on localhost or any other appropriate interfaces, and allow queries from your local network:
   ```conf
   options {
       listen-on port 53 { 127.0.0.1; any; };
       listen-on-v6 port 53 { ::1; any; };
       directory       "/var/named";
       dump-file       "/var/named/data/cache_dump.db";
       statistics-file "/var/named/data/named_stats.txt";
       memstatistics-file "/var/named/data/named_mem_stats.txt";
       allow-query     { localhost; 192.168.1.0/24; };  // Adjust the IP range as needed for your network

       recursion yes;

       dnssec-enable yes;
       dnssec-validation yes;

       /* Path to ISC DLV key */
       bindkeys-file "/etc/named.root.key";

       managed-keys-directory "/var/named/dynamic";
   };
   ```

3. Save and close the file.

### Step 3: Configure the Local Zone
To resolve `home.local` domains locally:

1. Add the following to `/etc/named.conf` within the `options` block:
   ```conf
   zone "home.local" IN {
       type master;
       file "home.local.zone";
       allow-update { none; };
   };
   ```
2. Create the zone file:
   ```bash
   sudo nano /var/named/home.local.zone
   ```
3. Populate the zone file with DNS records:
   ```zone
   $TTL 86400
   @   IN  SOA  ns1.home.local. admin.home.local. (
                   2023062701  ; Serial
                   3600        ; Refresh
                   1800        ; Retry
                   604800      ; Expire
                   86400       ; Minimum TTL
               )
       IN  NS      ns1.home.local.
   ns1 IN  A       192.168.1.1   ; IP address of DNS server
   @   IN  A       192.168.1.100 ; Default IP for home.local
   www IN  A       192.168.1.101 ; Subdomain www.home.local
   ```
   Replace `192.168.1.1`, `192.168.1.100`, and `192.168.1.101` with appropriate IP addresses.

4. Save and close the zone file.

### Step 4: Check BIND Configuration
Before starting the BIND service, check the configuration for errors:

1. Validate the configuration:
   ```bash
   sudo named-checkconf
   ```
2. Check the DNS zone files:
   ```bash
   sudo named-checkzone home.local /var/named/home.local.zone
   ```

### Step 5: Enable and Start BIND
Finally, enable and start the BIND service:

1. Enable BIND to start at boot:
   ```bash
   sudo systemctl enable named
   ```
2. Start the BIND service:
   ```bash
   sudo systemctl start named
   ```

3. Verify that BIND is running:
   ```bash
   sudo systemctl status named
   ```

### Step 6: Configure Firewall
Ensure the firewall allows DNS traffic:

1. Open DNS ports:
   ```bash
   sudo firewall-cmd --permanent --add-service=dns
   ```
2. Reload the firewall to apply changes:
   ```bash
   sudo firewall-cmd --reload
   ```
