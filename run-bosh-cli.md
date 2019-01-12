How to run bosh cli commands

- Get "Bosh Commandline Credentials" from pks tile

```
# ssh to your jumpbox first
# First ssh to jumpbox. Use the right password and ip
sshpass -p "$jumpbox_passwd" ssh -o StrictHostKeyChecking=no kubo@$jumpbox_ip

# Configure opsmanager credential. Use the right password.
export passwd='$ops_manager_passwd'
alias omcli="om -t https://30.0.0.5 -u admin -p $passwd -k"

# get bosh connect credential
omcli curl -p /api/v0/deployed/director/credentials/bosh_commandline_credentials

,----------- You will see output like below. We will need it later
| "credential": "BOSH_CLIENT=ops_manager BOSH_CLIENT_SECRET=oo1Pn-86gsWA_Y5kfsUhWo-xUNoBkMYE BOSH_CA_CERT=/var/tempest/workspaces/default/root_ca_certificate BOSH_ENVIRONMENT=30.0.0.11 bosh "
`-----------
```

- ssh to OpsManager

```
# First ssh to jumpbox. Use the right password and ip
sshpass -p "$jumpbox_passwd" ssh -o StrictHostKeyChecking=no kubo@$jumpbox_ip

# Then ssh to opsmanager VM
sshpass -p "$opsmanager_passwd" ssh -o StrictHostKeyChecking=no ubuntu@30.0.0.5

export bosh="BOSH_CLIENT=ops_manager BOSH_CLIENT_SECRET=oo1Pn-86gsWA_Y5kfsUhWo-xUNoBkMYE BOSH_CA_CERT=/var/tempest/workspaces/default/root_ca_certificate BOSH_ENVIRONMENT=30.0.0.11 bosh " # change to bosh_commandline_credentials you have retrieved before

# Run bosh commands and try
bosh vms

# ssh to vm. Remember customize below parameters per your env
bosh -d service-instance_4224ac94-7684-4f30-9872-57bf82c88fe1 ssh master/6d621ad4-e17d-4e27-875a-c8c3274a7bd5
```
