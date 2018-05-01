run on server nomad run :
nomad job plan microservice-job-02.nomad
nomad job run -check-index 0 microservice-job-02.nomad
verify job on noamd server gui (http://54.227.230.51:4646/ui/jobs)

verify  on nomad client :

root@ip-172-31-83-173:~# nomad job status
ID               Type     Priority  Status   Submit Date
microservice-02  service  50        running  2018-05-01T21:29:31Z
root@ip-172-31-83-173:~# docker ps
CONTAINER ID        IMAGE                COMMAND                  CREATED             STATUS              PORTS                                                          NAMES
9cc797d7f4d1        219358f21991         "bundle exec rails s…"   4 minutes ago       Up 4 minutes        172.31.83.173:21349->3000/tcp, 172.31.83.173:21349->3000/udp   microservice-02-bd92b1f8-adfb-52a1-8b8d-2036608261f2
e264a71863c4        drorvt/spree:ver11   "bundle exec rails s…"   31 hours ago        Up 9 hours          0.0.0.0:3000->3000/tcp                                         job2
root@ip-172-31-83-173:~# 
