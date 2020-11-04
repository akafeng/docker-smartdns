<p align="center">
    <img src="https://raw.githubusercontent.com/pymumu/smartdns/master/doc/smartdns.png" width="150" />
</p>

<h1 align="center">SmartDNS</h1>

<p align="center">
    <a href="https://hub.docker.com/r/akafeng/smartdns">Docker Hub</a> ·
    <a href="https://github.com/pymumu/smartdns">Project Source</a>
</p>

<p align="center">
    <img src="https://img.shields.io/docker/v/akafeng/smartdns?sort=semver&style=flat-square" />
    <img src="https://img.shields.io/docker/pulls/akafeng/smartdns?style=flat-square" />
    <img src="https://img.shields.io/microbadger/layers/akafeng/smartdns?style=flat-square" />
    <img src="https://img.shields.io/docker/image-size/akafeng/smartdns??sort=semver&style=flat-square" />
</p>

---

### Pull The Image

```bash
$ docker pull akafeng/smartdns
```

### Start Container

```bash
$ docker run -d \
  -p 53:53/udp \
  -v /etc/smartdns/smartdns.conf:/etc/smartdns/smartdns.conf \
  --restart always \
  --name=smartdns \
  akafeng/smartdns
```
