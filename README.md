# Asterisk 18 

### Description

The docker image with Asterisk PBX latest 18 version (LTS) and Lua. Image based on CentoOS

This image contains asterisk with pbx_lua module, chan_pjsip, lua interpreter with useful libs.

Asterisk is installed from rpm packages which build in tucny.com repositories.


### How you can use that

For example. We can run container which will use host networking and mount directories to the host volumes:
 
+ /etc/asterisk
+ /var/spool/asterisk 
+ /var/lib/asterisk 
+ /var/log/asterisk

```bash
docker run --name asterisk18 -d \
--net=host \
--mount source=ast-etc-vol,destination=/etc/asterisk \
--mount source=ast-spool-vol,destination=/var/spool/asterisk \
--mount source=ast-lib-vol,destination=/var/lib/asterisk \
--mount source=ast-logs-vol,destination=/var/log/asterisk \
gostkov/asterisk:18
```
In this example all files from asterisk container will be available in host volumes for edit.
Volumes directory you can find there
```bash
ls -l /var/lib/docker/volumes/
```
