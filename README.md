# ionos-ddns
Docker Container for IONOS DynDNS Update

## On first run
1. `docker run -v /LOCAL-CONFIG-PATH:/config --name ionos-ddns --network host --restart unless-stopped -d dasred/ionos-dns`
1. `docker exec -it CONTAINER domain-connect-dyndns --config /config/config --domain DOMAIN setup`

## Environment Variables
| ENV        | Default       |
|------------|---------------|
| FREQUENCY  | */5 * * * *   |
| TZ         | Europe/Berlin |

## IP Update Script
https://pypi.org/project/domain-connect-dyndns/

## Usage

```
domain-connect-dyndns [-h] [--config CONFIG]
                      {setup,update,status,remove}
                      [--ignore-previous-ip]
                      [--protocols (ipv4, ipv6)] 
                      (--domain DOMAIN | --all)
```

**Positional arguments:**

- {setup,update,status,remove} --- action on domain

**Optional arguments:**

```
--config CONFIG         --- config file path
--domain DOMAIN         --- domain to keep up to date
--all                   --- update all domains in config
--ignore-previous-ip    --- update the IP even if no change detected.
--protocols             --- a space separated list of protocols to set up. Possible values: ipv4, ipv6. Default: ipv4
--backup-file           --- file path for backup domains before remove
-h                      --- display help and exit
```
## Examples
```
    domain-connect-dyndns setup --domain [domain]
    domain-connect-dyndns setup --domain [domain] --protocols ipv4 ipv6
    domain-connect-dyndns update --domain [domain]
    domain-connect-dyndns status --domain [domain]
    domain-connect-dyndns remove --domain [domain] --backup-file settings.bak
    
    domain-connect-dyndns update --all
    domain-connect-dyndns status --all
    domain-connect-dyndns remove --all
```
