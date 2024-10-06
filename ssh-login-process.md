```
Start
│
├── 1. Generate SSH Key Pair (on local machine)
│   ├── Run: `ssh-keygen -t rsa -b 2048`
│   └── Saves: Private Key (id_rsa), Public Key (id_rsa.pub)
│
├── 2. Copy Public Key to Remote Server (first-time setup)
│   ├── Run: `ssh-copy-id -i ~/.ssh/id_rsa.pub username@server-ip`
│   └── Adds Public Key to: `~/.ssh/authorized_keys` on the server
│
├── 3. SSH into Remote Server (with key)
│   ├── Run: `ssh -i ~/.ssh/id_rsa username@server-ip`
│   └── Establishes connection using private key (`id_rsa`) on local machine
│
├── 4. Server Authentication
│   ├── Verifies: If public key exists in `~/.ssh/authorized_keys`
│   └── If valid: Grants access; else, denies connection
│
├── 5. Successful Login (if authentication is successful)
│   ├── Login: You’re logged into the remote server’s shell
│   └── Commands: You can now execute commands remotely
│
└── End
