How to run bosh cli commands

- ssh to OpsManager

```
# First ssh to jumpbox
sshpass -p "$jumpbox_passwd" ssh -o StrictHostKeyChecking=no kubo@$jumpbox_ip

# Then ssh to opsmanager VM
sshpass -p "$opsmanager_passwd" ssh -o StrictHostKeyChecking=no ubuntu@30.0.0.5
```

- Get "Bosh Commandline Credentials" from pks tile

```
# Inside OpsManager VM
alias bosh="BOSH_CLIENT=ops_manager BOSH_CLIENT_SECRET=$bosh_client_secret BOSH_CA_CERT=/var/tempest/workspaces/default/root_ca_certificate BOSH_ENVIRONMENT=30.0.0.11 bosh "

bosh vms
```
