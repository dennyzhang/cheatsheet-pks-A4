How to run pks cli commands

- ssh to jumpbox

- Find ip of pks api server from vsphere

- Find api hostname(FQDN) from pks tile

- In jumpbox, change /etc/hosts
Usually it's like below
```
30.0.0.12 api.pks.local
# 30.0.0.12 pks.pks-api.cf-app.com
```

- pks login

From pks tile in ops manager, get API hostname(FQDN) for your PKS api server. It's probably `api.pks.local` or `pks.pks-api.cf-app.com`

```
export passwd='XXX'
alias omcli="om -t https://30.0.0.5 -u admin -p $passwd -k"
```

From pks tile in ops Manager, get "Uaa Admin Password"
```

bosh deployments
export bosh_deployment='pivotal-container-service-XXX'

omcli curl -p /api/v0/deployed/products/${bosh_deployment}/credentials/.properties.uaa_admin_password
```

Sample:
```
export uaa_admin_passwd='XXX'
pks login -a api.pks.local -u admin -p "$uaa_admin_passwd" -k
# pks login -a pks.pks-api.cf-app.com -u admin -p "$uaa_admin_passwd" -k

pks clusters
```
