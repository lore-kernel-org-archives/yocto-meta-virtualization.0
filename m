Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.4926.1605191220877778154
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 12 Nov 2020 06:27:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@axis.com header.s=axis-central1 header.b=leQG/vu4;
 spf=fail (domain: axis.com, ip: 198.145.29.25, mailfrom: joakim.roubert@axis.com)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.yoctoproject.org (Postfix) with ESMTPS id A322A38C1108
	for <meta-virtualization@yoctoproject.org>; Thu, 12 Nov 2020 14:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=7357; q=dns/txt; s=axis-central1;
  t=1605191220; x=1636727220;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+CUUPA8qfiU29aaoh8ZYsnBcr78kC4fcgHNMuGGMSTA=;
  b=leQG/vu4+MlqtzSrPToycyekYAhGaM4U2cWWj4JkQLdKzMIb7n0cSdhR
   lHmpRIp9cvTWYIF5pgc487qxqSUlbyiyKdbpHggTiLSCeu+Ef9OpOdZuL
   sxilOYDE/uQ6ySWZ5mrr0m43vseCU7HIdOKN5UfUd7FTMveOd9cbcE01j
   fktFqncCMCEXQMhzliLR7FBJAmM5aZ7pLz6PkCeyEk1IeCQD7VHj1bceO
   kdAfNyqCBXjv6N3rMMWZJxVsa1Oc6wYuLWFKrxlIm1DGKOLWLb/HcKuOI
   n242AU3mFxsvXV4Zqmd/bCC/MOklWsr9qWQ/wR0WEg39aHtjj6TfxUfa5
   A==;
IronPort-SDR: wrD1TD9D5Ft0MStFhRNYePoUk9b22zoZv71kpI+m3SF5URlq3LVVV03bTxzNWwcstftNq6SNW2
 /zDmwn10qSaKgRIXeMjPug1wi2dbK6DfOk78OrA2BdXziFYc+kkBirJmF66H6KjWeY33Jn0RAS
 D2fZ4W+KcwP3WxFMFYWL0C5wDanWvHpzMCkz3qaeCKjBkiTUNTL7/bmhNWPENHPfPVYx+Q0BTb
 qbHy3otnoxeuWHiEeUC7ObrMGMyXhaL4Ndnc+WuLmqHhdTbuA8AC9O0/oLjznAQeKKDlyqnZHK
 hf8=
X-IronPort-AV: E=Sophos;i="5.77,472,1596492000"; 
   d="scan'208";a="14471008"
From: "Joakim Roubert" <joakim.roubert@axis.com>
To: <meta-virtualization@yoctoproject.org>
CC: Joakim Roubert <joakimr@axis.com>
Subject: [meta-virtualization][PATCH] k3s: Update README.md
Date: Thu, 12 Nov 2020 15:26:43 +0100
Message-ID: <20201112142643.24215-1-joakimr@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <CADkTA4MYg8ayOej7ZV+saSnDzXod4URBCHitxFDOrfbLifwf4A@mail.gmail.com>
References: <CADkTA4MYg8ayOej7ZV+saSnDzXod4URBCHitxFDOrfbLifwf4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Fix suggestions from markdownlint, i.e.

docker run -it --rm -v $(pwd):/x -w /x \
peterdavehello/markdownlint:0.22.0 markdownlint .

and some formatting done.

Change-Id: Ic8f9ccd40607258d934a9510113ae44344253f65
Signed-off-by: Joakim Roubert <joakimr@axis.com>
---
 recipes-containers/k3s/README.md | 63 +++++++++++++++++---------------
 1 file changed, 34 insertions(+), 29 deletions(-)

diff --git a/recipes-containers/k3s/README.md b/recipes-containers/k3s/RE=
ADME.md
index e4cb3e3..70f92a6 100644
--- a/recipes-containers/k3s/README.md
+++ b/recipes-containers/k3s/README.md
@@ -29,35 +29,37 @@ k3s-agent -t <token> -s https://<master>:6443
 (Here `<token>` is found in `/var/lib/rancher/k3s/server/node-token` at =
the
 k3s master.)
=20
-Example:
+### Example
+
 ```shell
 k3s-agent -t /var/lib/rancher/k3s/server/node-token -s https://localhost=
:6443
 ```
=20
-## Notes:
+## Notes
=20
-if running under qemu, the default of 256M of memory is not enough, k3s =
will
-OOM and exit.
+**If running under qemu**, the default of 256 MB of memory is not enough=
, k3s
+will OOM and exit.
=20
-Boot with qemuparams=3D"-m 2048" to boot with 2G of memory (or choose th=
e
+Boot with `qemuparams=3D"-m 2048"` to boot with 2 GB of memory (or choos=
e the
 appropriate amount for your configuration)
=20
-Disk: if using qemu and core-image* you'll need to add extra space in yo=
ur disks
-to ensure containers can start. The following in your image recipe, or l=
ocal.conf
-would add 2G of extra space to the rootfs:
+Disk: if using qemu and core-image* you will need to add extra space in =
your
+disks to ensure containers can start. The following in your image recipe=
,
+or `local.conf` would add 2 GB of extra space to the rootfs:
=20
 ```shell
 IMAGE_ROOTFS_EXTRA_SPACE =3D "2097152"
 ```
=20
-## Example output from qemux86-64 running k3s server:
+## Example output from qemux86-64 running k3s server
=20
 ```shell
 root@qemux86-64:~# kubectl get nodes
 NAME         STATUS   ROLES    AGE   VERSION
 qemux86-64   Ready    master   46s   v1.18.9-k3s1
+```
=20
-
+```shell
 root@qemux86-64:~# kubectl get pods -n kube-system
 NAME                                     READY   STATUS      RESTARTS   =
AGE
 local-path-provisioner-6d59f47c7-h7lxk   1/1     Running     0          =
2m32s
@@ -66,7 +68,9 @@ helm-install-traefik-229v7               0/1     Comple=
ted   0          2m32s
 coredns-7944c66d8d-9rfj7                 1/1     Running     0          =
2m32s
 svclb-traefik-pb5j4                      2/2     Running     0          =
89s
 traefik-758cd5fc85-lxpr8                 1/1     Running     0          =
89s
+```
=20
+```shell
 root@qemux86-64:~# kubectl describe pods -n kube-system
=20
 root@qemux86-64:~# ip a s
@@ -74,25 +78,25 @@ root@qemux86-64:~# ip a s
     link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
     inet 127.0.0.1/8 scope host lo
        valid_lft forever preferred_lft forever
-    inet6 ::1/128 scope host=20
+    inet6 ::1/128 scope host
        valid_lft forever preferred_lft forever
 2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast sta=
te UP group default qlen 1000
     link/ether 52:54:00:12:35:02 brd ff:ff:ff:ff:ff:ff
     inet 10.0.2.15/24 brd 10.0.2.255 scope global eth0
        valid_lft forever preferred_lft forever
-    inet6 fec0::5054:ff:fe12:3502/64 scope site dynamic mngtmpaddr=20
+    inet6 fec0::5054:ff:fe12:3502/64 scope site dynamic mngtmpaddrg
        valid_lft 86239sec preferred_lft 14239sec
-    inet6 fe80::5054:ff:fe12:3502/64 scope link=20
+    inet6 fe80::5054:ff:fe12:3502/64 scope linkg
        valid_lft forever preferred_lft forever
 3: sit0@NONE: <NOARP> mtu 1480 qdisc noop state DOWN group default qlen =
1000
     link/sit 0.0.0.0 brd 0.0.0.0
-4: flannel.1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue s=
tate UNKNOWN group default=20
+4: flannel.1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc noqueue s=
tate UNKNOWN group defaultg
     link/ether e2:aa:04:89:e6:0a brd ff:ff:ff:ff:ff:ff
     inet 10.42.0.0/32 brd 10.42.0.0 scope global flannel.1
        valid_lft forever preferred_lft forever
-    inet6 fe80::e0aa:4ff:fe89:e60a/64 scope link=20
+    inet6 fe80::e0aa:4ff:fe89:e60a/64 scope linkg
        valid_lft forever preferred_lft forever
-5: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue s=
tate DOWN group default=20
+5: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue s=
tate DOWN group defaultg
     link/ether 02:42:be:3e:25:e7 brd ff:ff:ff:ff:ff:ff
     inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
        valid_lft forever preferred_lft forever
@@ -100,30 +104,31 @@ root@qemux86-64:~# ip a s
     link/ether 82:8e:b4:f8:06:e7 brd ff:ff:ff:ff:ff:ff
     inet 10.42.0.1/24 brd 10.42.0.255 scope global cni0
        valid_lft forever preferred_lft forever
-    inet6 fe80::808e:b4ff:fef8:6e7/64 scope link=20
+    inet6 fe80::808e:b4ff:fef8:6e7/64 scope linkg
        valid_lft forever preferred_lft forever
-7: veth82ac482e@if4: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc no=
queue master cni0 state UP group default=20
+7: veth82ac482e@if4: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc no=
queue master cni0 state UP group defaultg
     link/ether ea:9d:14:c1:00:70 brd ff:ff:ff:ff:ff:ff link-netns cni-c5=
2e6e09-f6e0-a47b-aea3-d6c47d3e2d01
-    inet6 fe80::e89d:14ff:fec1:70/64 scope link=20
+    inet6 fe80::e89d:14ff:fec1:70/64 scope linkg
        valid_lft forever preferred_lft forever
-8: vethb94745ed@if4: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc no=
queue master cni0 state UP group default=20
+8: vethb94745ed@if4: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc no=
queue master cni0 state UP group defaultg
     link/ether 1e:7f:7e:d3:ca:e8 brd ff:ff:ff:ff:ff:ff link-netns cni-86=
958efe-2462-016f-292d-81dbccc16a83
-    inet6 fe80::8046:3cff:fe23:ced1/64 scope link=20
+    inet6 fe80::8046:3cff:fe23:ced1/64 scope linkg
        valid_lft forever preferred_lft forever
-9: veth81ffb276@if4: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc no=
queue master cni0 state UP group default=20
+9: veth81ffb276@if4: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc no=
queue master cni0 state UP group defaultg
     link/ether 2a:1d:48:54:76:50 brd ff:ff:ff:ff:ff:ff link-netns cni-5d=
77238e-6452-4fa3-40d2-91d48386080b
-    inet6 fe80::acf4:7fff:fe11:b6f2/64 scope link=20
+    inet6 fe80::acf4:7fff:fe11:b6f2/64 scope linkg
        valid_lft forever preferred_lft forever
-10: vethce261f6a@if4: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc n=
oqueue master cni0 state UP group default=20
+10: vethce261f6a@if4: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc n=
oqueue master cni0 state UP group defaultg
     link/ether 72:a3:90:4a:c5:12 brd ff:ff:ff:ff:ff:ff link-netns cni-55=
675948-77f2-a952-31ce-615f2bdb0093
-    inet6 fe80::4d5:1bff:fe5d:db3a/64 scope link=20
+    inet6 fe80::4d5:1bff:fe5d:db3a/64 scope linkg
        valid_lft forever preferred_lft forever
-11: vethee199cf4@if4: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc n=
oqueue master cni0 state UP group default=20
+11: vethee199cf4@if4: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1450 qdisc n=
oqueue master cni0 state UP group defaultg
     link/ether e6:90:a4:a3:bc:a1 brd ff:ff:ff:ff:ff:ff link-netns cni-4a=
eccd16-2976-8a78-b2c4-e028da3bb1ea
-    inet6 fe80::c85a:8bff:fe0b:aea0/64 scope link=20
+    inet6 fe80::c85a:8bff:fe0b:aea0/64 scope linkg
        valid_lft forever preferred_lft forever
+```
=20
-
+```shell
 root@qemux86-64:~# kubectl describe nodes
=20
 Name:               qemux86-64
@@ -235,4 +240,4 @@ Events:
   Normal   NodeHasSufficientPID     10m (x2 over 10m)  kubelet     Node =
qemux86-64 status is now: NodeHasSufficientPID
   Normal   NodeReady                10m                kubelet     Node =
qemux86-64 status is now: NodeReady
=20
-```shell
+```
--=20
2.20.1

