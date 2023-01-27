<p align="center">
    <img src="https://github.com/pymumu/smartdns/raw/master/doc/smartdns.png" width="150" />
</p>

<h1 align="center">SmartDNS</h1>

<p align="center">A local DNS server to obtain the fastest website IP for the best Internet experience.</p>

<p align="center">
    <a href="https://ghcr.io/akafeng/smartdns">Container Registry</a> ·
    <a href="https://github.com/pymumu/smartdns">Project Source</a>
</p>

<p align="center">
    <img src="https://img.shields.io/github/actions/workflow/status/akafeng/docker-smartdns/push.yml?branch=main" />
    <img src="https://img.shields.io/github/last-commit/akafeng/docker-smartdns" />
    <img src="https://img.shields.io/github/v/release/akafeng/docker-smartdns" />
    <img src="https://img.shields.io/github/release-date/akafeng/docker-smartdns" />
</p>

---

### Pull The Image

```bash
$ docker pull ghcr.io/akafeng/smartdns
```

### Start Container

```bash
$ docker run -d \
  -p 53:53/udp \
  -v /etc/smartdns/:/etc/smartdns/ \
  --restart=always \
  --name=smartdns \
  ghcr.io/akafeng/smartdns
```
