SELinux, or Security-Enhanced Linux, is a security module integrated into the Linux kernel that provides a mechanism for supporting access control security policies. It's a set of kernel modifications and user-space tools that enhances the security of a Linux system by implementing Mandatory Access Control (MAC).

### How SELinux Works:

SELinux adds an additional layer of security policies that govern the access processes and users have to files, devices, and other resources. Unlike traditional Discretionary Access Control (DAC) systems where access is controlled based on the owner of the resource, SELinux controls access based on the policy defined by the administrator, taking into consideration the roles and states of processes and users.

### Key Concepts in SELinux:

1. **Contexts**: In SELinux, everything (users, processes, files, etc.) is assigned a security context, which is a set of data that dictates access permissions. This context consists of a user, role, type, and, optionally, a level.

2. **Policies**: SELinux operates based on policies that define rules for how subjects (like processes) can access objects (like files). These policies are enforced regardless of the traditional Unix permissions.

3. **Enforcing and Permissive Modes**: SELinux can run in:
   - **Enforcing mode**: SELinux policies are enforced, and access is denied based on policy rules.
   - **Permissive mode**: SELinux policies are not enforced but violations are logged for auditing.

4. **Booleans**: SELinux booleans are toggle settings within the policy that enable or disable certain policy options, providing a flexible way to modify policy behavior without needing to write or compile new policies.

### Examples of SELinux Commands:

1. **Viewing the Current Status**:
   ```bash
   getenforce
   ```
   This command displays whether SELinux is in enforcing, permissive, or disabled mode.

2. **Changing Modes**:
   ```bash
   setenforce 0   # Set SELinux to permissive mode
   setenforce 1   # Set SELinux to enforcing mode
   ```

3. **Viewing and Changing Contexts**:
   - View the context of a file:
     ```bash
     ls -Z filename
     ```
   - Change the context of a file:
     ```bash
     chcon -t httpd_sys_content_t /path/to/file
     ```

4. **Managing Booleans**:
   - List booleans:
     ```bash
     getsebool -a
     ```
   - Change a boolean setting:
     ```bash
     setsebool httpd_can_network_connect on
     ```

5. **Restoring Contexts**:
   - If file contexts get messed up or you change a policy:
     ```bash
     restorecon -v /path/to/file
     ```

### SELinux Use Cases:

- **Enhanced Server Security**: By restricting services like Apache or MySQL only to access necessary files and deny others, reducing the risk of a compromised server being used to attack other parts of the system.
- **Protection Against Zero-Day Exploits**: Even if an application has a security flaw that isn't yet known, SELinux policies can prevent the application from performing unauthorized actions.
- **Multi-Level Security**: Enforcing different security levels and categories, allowing administrators to control which users and applications can access sensitive data.

SELinux represents a robust security architecture and is part of a defense-in-depth strategy that can greatly enhance the security posture of a Linux environment. It can be complex to manage and requires a deep understanding of your system's operations and the security policies it requires. Properly configuring SELinux and understanding its policies can substantially mitigate the impact of vulnerabilities and limit the damage potential of breaches.

```bash
[root@server1 opt]# dnf whatprovides */sepolicy
Last metadata expiration check: 0:05:32 ago on Mon 08 Jul 2024 22:55:51 BST.
policycoreutils-devel-3.6-2.1.el9.i686 : SELinux policy core policy devel utilities
Repo        : appstream
Matched from:
Filename    : /usr/bin/sepolicy
Filename    : /usr/share/bash-completion/completions/sepolicy

policycoreutils-devel-3.6-2.1.el9.x86_64 : SELinux policy core policy devel utilities
Repo        : appstream
Matched from:
Filename    : /usr/bin/sepolicy
Filename    : /usr/share/bash-completion/completions/sepolicy

python3-policycoreutils-3.6-2.1.el9.noarch : SELinux policy core python3 interfaces
Repo        : @System
Matched from:
Filename    : /usr/lib/python3.9/site-packages/sepolicy

python3-policycoreutils-3.6-2.1.el9.noarch : SELinux policy core python3 interfaces
Repo        : appstream
Matched from:
Filename    : /usr/lib/python3.9/site-packages/sepolicy
```
```bash
dnf -y install policycoreutils-devel
```
