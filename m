Return-Path: <thitgahamtonghop@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0397EC433EF
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 11:11:57 +0000 (UTC)
Subject: Where is docker.cfg file in rocko?  #meta-virtualization #yocto 
To: meta-virtualization@lists.yoctoproject.org
From: thitgahamtonghop@gmail.com
X-Originating-Location: Vaasa, Ostrobothnia, FI (195.148.173.129)
X-Originating-Platform: Windows Chrome 96
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 04 Jan 2022 03:11:56 -0800
Message-ID: <3P52.1641294716031699062.nFhN@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="TCjd8IjgKGABjMS0Nelv"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 04 Jan 2022 11:11:57 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/6990

--TCjd8IjgKGABjMS0Nelv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,
So I am having problem running docker image. When I run command: *docker ru=
n hello-world* , this is the output:
>=20
>=20
> docker: Error response from daemon: failed to create endpoint
> elastic_hypatia on network bridge: failed to add the host (vethf9c4250)
> <=3D> sandbox (vethc439d7e) pair interfaces: operation not supported.
> ERRO[0000] error waiting for container: context canceled
>=20

So I suspect that the veth module is missing and as checking, I ran the che=
ck-config.sh script, and here is what I get

>=20
> root@procemex:~# bash check-config.sh
> info: reading kernel config from /proc/config.gz ...
>=20
> Generally Necessary:
> - check-config.sh: line 159: [: missing `]'
> check-config.sh: line 160: /sys/fs/cgroup/memory: Is a directory
> cgroup hierarchy: single mountpoint! [/sys/fs/cgroup/memory]
> (see https://github.com/tianon/cgroupfs-mount)
> - CONFIG_NAMESPACES: enabled
> - CONFIG_NET_NS: enabled
> - CONFIG_PID_NS: enabled
> - CONFIG_IPC_NS: enabled
> - CONFIG_UTS_NS: enabled
> - CONFIG_CGROUPS: enabled
> - CONFIG_CGROUP_CPUACCT: enabled
> - CONFIG_CGROUP_DEVICE: enabled
> - CONFIG_CGROUP_FREEZER: enabled
> - CONFIG_CGROUP_SCHED: enabled
> - CONFIG_CPUSETS: enabled
> - CONFIG_MEMCG: enabled
> - CONFIG_KEYS: enabled
> - CONFIG_VETH: missing
> - CONFIG_BRIDGE: enabled (as module)
> - CONFIG_BRIDGE_NETFILTER: enabled (as module)
> - CONFIG_NF_NAT_IPV4: enabled (as module)
> - CONFIG_IP_NF_FILTER: enabled (as module)
> - CONFIG_IP_NF_TARGET_MASQUERADE: missing
> - CONFIG_NETFILTER_XT_MATCH_ADDRTYPE: missing
> - CONFIG_NETFILTER_XT_MATCH_CONNTRACK: enabled (as module)
> - CONFIG_NETFILTER_XT_MATCH_IPVS: missing
> - CONFIG_IP_NF_NAT: missing
> - CONFIG_NF_NAT: enabled (as module)
> - CONFIG_NF_NAT_NEEDED: enabled
> - CONFIG_POSIX_MQUEUE: enabled
> - CONFIG_DEVPTS_MULTIPLE_INSTANCES: missing
>=20
> Optional Features:
> - CONFIG_USER_NS: enabled
> - CONFIG_SECCOMP: enabled
> - CONFIG_CGROUP_PIDS: missing
> - CONFIG_MEMCG_SWAP: enabled
> - CONFIG_MEMCG_SWAP_ENABLED: enabled
> (cgroup swap accounting is currently enabled)
> - CONFIG_LEGACY_VSYSCALL_EMULATE: enabled
> - CONFIG_MEMCG_KMEM: enabled
> - CONFIG_BLK_CGROUP: enabled
> - CONFIG_BLK_DEV_THROTTLING: missing
> - CONFIG_IOSCHED_CFQ: enabled
> - CONFIG_CFQ_GROUP_IOSCHED: missing
> - CONFIG_CGROUP_PERF: missing
> - CONFIG_CGROUP_HUGETLB: missing
> - CONFIG_NET_CLS_CGROUP: enabled
> - CONFIG_CGROUP_NET_PRIO: missing
> - CONFIG_CFS_BANDWIDTH: missing
> - CONFIG_FAIR_GROUP_SCHED: enabled
> - CONFIG_RT_GROUP_SCHED: enabled
> - CONFIG_IP_VS: missing
> - CONFIG_IP_VS_NFCT: missing
> - CONFIG_IP_VS_RR: missing
> - CONFIG_EXT3_FS: enabled
> - CONFIG_EXT3_FS_XATTR: missing
> - CONFIG_EXT3_FS_POSIX_ACL: enabled
> - CONFIG_EXT3_FS_SECURITY: enabled
> (enable these ext3 configs if you are using ext3 as backing filesystem)
> - CONFIG_EXT4_FS: enabled
> - CONFIG_EXT4_FS_POSIX_ACL: enabled
> - CONFIG_EXT4_FS_SECURITY: enabled
> - Network Drivers:
> - "overlay":
> - CONFIG_VXLAN: missing
> Optional (for encrypted networks):
> - CONFIG_CRYPTO: enabled
> - CONFIG_CRYPTO_AEAD: enabled
> - CONFIG_CRYPTO_GCM: enabled (as module)
> - CONFIG_CRYPTO_SEQIV: enabled (as module)
> - CONFIG_CRYPTO_GHASH: enabled (as module)
> - CONFIG_XFRM: enabled
> - CONFIG_XFRM_USER: enabled (as module)
> - CONFIG_XFRM_ALGO: enabled
> - CONFIG_INET_ESP: enabled (as module)
> - CONFIG_INET_XFRM_MODE_TRANSPORT: enabled
> - "ipvlan":
> - CONFIG_IPVLAN: missing
> - "macvlan":
> - CONFIG_MACVLAN: missing
> - CONFIG_DUMMY: enabled (as module)
> - "ftp,tftp client in container":
> - CONFIG_NF_NAT_FTP: enabled (as module)
> - CONFIG_NF_CONNTRACK_FTP: enabled (as module)
> - CONFIG_NF_NAT_TFTP: enabled (as module)
> - CONFIG_NF_CONNTRACK_TFTP: enabled (as module)
> - Storage Drivers:
> - "aufs":
> - CONFIG_AUFS_FS: enabled
> - "btrfs":
> - CONFIG_BTRFS_FS: enabled
> - CONFIG_BTRFS_FS_POSIX_ACL: enabled
> - "devicemapper":
> - CONFIG_BLK_DEV_DM: enabled
> - CONFIG_DM_THIN_PROVISIONING: missing
> - "overlay":
> - CONFIG_OVERLAY_FS: missing
> - "zfs":
> - /dev/zfs: missing
> - zfs command: missing
> - zpool command: missing
>=20
> Limits:
> - /proc/sys/kernel/keys/root_maxkeys: 1000000
>=20

Even running *modprobe veth* showing that veth is not there:

>=20
> modprobe: FATAL: Module veth not found in directory
> /lib/modules/4.4.113-yocto-standard
>=20

After going around the internet, I found out that somebody had the same iss=
ue with me: https://marc.info/?l=3Dopenembedded-devel&m=3D154773496216135&w=
=3D2 , and they also think that veth missing is the problem. And as suggest=
ion, I added in my local.conf:
CORE_IMAGE_EXTRA_INSTALL +=3D "kernel-modules docker"
But they also mentioned the actual solution is :
I found the issue.  The veth kernel parameter was not enabled.  Once I adde=
d
CONFIG_VETH=3Dy to my docker.cfg file, I was able to successfully run a
docker container in my openembedded OS So where could I do the same? I've u=
sed the rocko version and it doesn't have the linux/docker.cfg file? Or cou=
ld I can create one by myself?

--TCjd8IjgKGABjMS0Nelv
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,<br />So I am having problem running docker image. When I run command:&n=
bsp;<strong>docker run hello-world</strong>, this is the output:
<blockquote>docker: Error response from daemon: failed to create endpoint e=
lastic_hypatia on network bridge: failed to add the host (vethf9c4250) &lt;=
=3D&gt; sandbox (vethc439d7e) pair interfaces: operation not supported.
<div>ERRO[0000] error waiting for container: context canceled</div>
</blockquote>
So I suspect that the veth module is missing and as checking, I ran the che=
ck-config.sh script, and here is what I get<br />
<blockquote>
<div>
<div>root@procemex:~# bash check-config.sh</div>
<div>info: reading kernel config from /proc/config.gz ...</div>
<div>&nbsp;</div>
<div>Generally Necessary:</div>
<div>- check-config.sh: line 159: [: missing `]'</div>
<div>check-config.sh: line 160: /sys/fs/cgroup/memory: Is a directory</div>
<div>cgroup hierarchy: single mountpoint! [/sys/fs/cgroup/memory]</div>
<div>&nbsp; &nbsp; (see https://github.com/tianon/cgroupfs-mount)</div>
<div>- CONFIG_NAMESPACES: enabled</div>
<div>- CONFIG_NET_NS: enabled</div>
<div>- CONFIG_PID_NS: enabled</div>
<div>- CONFIG_IPC_NS: enabled</div>
<div>- CONFIG_UTS_NS: enabled</div>
<div>- CONFIG_CGROUPS: enabled</div>
<div>- CONFIG_CGROUP_CPUACCT: enabled</div>
<div>- CONFIG_CGROUP_DEVICE: enabled</div>
<div>- CONFIG_CGROUP_FREEZER: enabled</div>
<div>- CONFIG_CGROUP_SCHED: enabled</div>
<div>- CONFIG_CPUSETS: enabled</div>
<div>- CONFIG_MEMCG: enabled</div>
<div>- CONFIG_KEYS: enabled</div>
<div>- CONFIG_VETH: missing</div>
<div>- CONFIG_BRIDGE: enabled (as module)</div>
<div>- CONFIG_BRIDGE_NETFILTER: enabled (as module)</div>
<div>- CONFIG_NF_NAT_IPV4: enabled (as module)</div>
<div>- CONFIG_IP_NF_FILTER: enabled (as module)</div>
<div>- CONFIG_IP_NF_TARGET_MASQUERADE: missing</div>
<div>- CONFIG_NETFILTER_XT_MATCH_ADDRTYPE: missing</div>
<div>- CONFIG_NETFILTER_XT_MATCH_CONNTRACK: enabled (as module)</div>
<div>- CONFIG_NETFILTER_XT_MATCH_IPVS: missing</div>
<div>- CONFIG_IP_NF_NAT: missing</div>
<div>- CONFIG_NF_NAT: enabled (as module)</div>
<div>- CONFIG_NF_NAT_NEEDED: enabled</div>
<div>- CONFIG_POSIX_MQUEUE: enabled</div>
<div>- CONFIG_DEVPTS_MULTIPLE_INSTANCES: missing</div>
<div>&nbsp;</div>
<div>Optional Features:</div>
<div>- CONFIG_USER_NS: enabled</div>
<div>- CONFIG_SECCOMP: enabled</div>
<div>- CONFIG_CGROUP_PIDS: missing</div>
<div>- CONFIG_MEMCG_SWAP: enabled</div>
<div>- CONFIG_MEMCG_SWAP_ENABLED: enabled</div>
<div>&nbsp; &nbsp; (cgroup swap accounting is currently enabled)</div>
<div>- CONFIG_LEGACY_VSYSCALL_EMULATE: enabled</div>
<div>- CONFIG_MEMCG_KMEM: enabled</div>
<div>- CONFIG_BLK_CGROUP: enabled</div>
<div>- CONFIG_BLK_DEV_THROTTLING: missing</div>
<div>- CONFIG_IOSCHED_CFQ: enabled</div>
<div>- CONFIG_CFQ_GROUP_IOSCHED: missing</div>
<div>- CONFIG_CGROUP_PERF: missing</div>
<div>- CONFIG_CGROUP_HUGETLB: missing</div>
<div>- CONFIG_NET_CLS_CGROUP: enabled</div>
<div>- CONFIG_CGROUP_NET_PRIO: missing</div>
<div>- CONFIG_CFS_BANDWIDTH: missing</div>
<div>- CONFIG_FAIR_GROUP_SCHED: enabled</div>
<div>- CONFIG_RT_GROUP_SCHED: enabled</div>
<div>- CONFIG_IP_VS: missing</div>
<div>- CONFIG_IP_VS_NFCT: missing</div>
<div>- CONFIG_IP_VS_RR: missing</div>
<div>- CONFIG_EXT3_FS: enabled</div>
<div>- CONFIG_EXT3_FS_XATTR: missing</div>
<div>- CONFIG_EXT3_FS_POSIX_ACL: enabled</div>
<div>- CONFIG_EXT3_FS_SECURITY: enabled</div>
<div>&nbsp; &nbsp; (enable these ext3 configs if you are using ext3 as back=
ing filesystem)</div>
<div>- CONFIG_EXT4_FS: enabled</div>
<div>- CONFIG_EXT4_FS_POSIX_ACL: enabled</div>
<div>- CONFIG_EXT4_FS_SECURITY: enabled</div>
<div>- Network Drivers:</div>
<div>&nbsp; - "overlay":</div>
<div>&nbsp; &nbsp; - CONFIG_VXLAN: missing</div>
<div>&nbsp; &nbsp; &nbsp; Optional (for encrypted networks):</div>
<div>&nbsp; &nbsp; &nbsp; - CONFIG_CRYPTO: enabled</div>
<div>&nbsp; &nbsp; &nbsp; - CONFIG_CRYPTO_AEAD: enabled</div>
<div>&nbsp; &nbsp; &nbsp; - CONFIG_CRYPTO_GCM: enabled (as module)</div>
<div>&nbsp; &nbsp; &nbsp; - CONFIG_CRYPTO_SEQIV: enabled (as module)</div>
<div>&nbsp; &nbsp; &nbsp; - CONFIG_CRYPTO_GHASH: enabled (as module)</div>
<div>&nbsp; &nbsp; &nbsp; - CONFIG_XFRM: enabled</div>
<div>&nbsp; &nbsp; &nbsp; - CONFIG_XFRM_USER: enabled (as module)</div>
<div>&nbsp; &nbsp; &nbsp; - CONFIG_XFRM_ALGO: enabled</div>
<div>&nbsp; &nbsp; &nbsp; - CONFIG_INET_ESP: enabled (as module)</div>
<div>&nbsp; &nbsp; &nbsp; - CONFIG_INET_XFRM_MODE_TRANSPORT: enabled</div>
<div>&nbsp; - "ipvlan":</div>
<div>&nbsp; &nbsp; - CONFIG_IPVLAN: missing</div>
<div>&nbsp; - "macvlan":</div>
<div>&nbsp; &nbsp; - CONFIG_MACVLAN: missing</div>
<div>&nbsp; &nbsp; - CONFIG_DUMMY: enabled (as module)</div>
<div>&nbsp; - "ftp,tftp client in container":</div>
<div>&nbsp; &nbsp; - CONFIG_NF_NAT_FTP: enabled (as module)</div>
<div>&nbsp; &nbsp; - CONFIG_NF_CONNTRACK_FTP: enabled (as module)</div>
<div>&nbsp; &nbsp; - CONFIG_NF_NAT_TFTP: enabled (as module)</div>
<div>&nbsp; &nbsp; - CONFIG_NF_CONNTRACK_TFTP: enabled (as module)</div>
<div>- Storage Drivers:</div>
<div>&nbsp; - "aufs":</div>
<div>&nbsp; &nbsp; - CONFIG_AUFS_FS: enabled</div>
<div>&nbsp; - "btrfs":</div>
<div>&nbsp; &nbsp; - CONFIG_BTRFS_FS: enabled</div>
<div>&nbsp; &nbsp; - CONFIG_BTRFS_FS_POSIX_ACL: enabled</div>
<div>&nbsp; - "devicemapper":</div>
<div>&nbsp; &nbsp; - CONFIG_BLK_DEV_DM: enabled</div>
<div>&nbsp; &nbsp; - CONFIG_DM_THIN_PROVISIONING: missing</div>
<div>&nbsp; - "overlay":</div>
<div>&nbsp; &nbsp; - CONFIG_OVERLAY_FS: missing</div>
<div>&nbsp; - "zfs":</div>
<div>&nbsp; &nbsp; - /dev/zfs: missing</div>
<div>&nbsp; &nbsp; - zfs command: missing</div>
<div>&nbsp; &nbsp; - zpool command: missing</div>
<div>&nbsp;</div>
<div>Limits:</div>
<div>- /proc/sys/kernel/keys/root_maxkeys: 1000000</div>
</div>
</blockquote>
Even running&nbsp;<strong>modprobe veth</strong> showing that veth is not t=
here:<br />
<div>
<blockquote>
<div>modprobe: FATAL: Module veth not found in directory /lib/modules/4.4.1=
13-yocto-standard</div>
</blockquote>
</div>
<div>After going around the internet, I found out that somebody had the sam=
e issue with me:&nbsp;<a href=3D"https://marc.info/?l=3Dopenembedded-devel&=
amp;m=3D154773496216135&amp;w=3D2" target=3D"_blank" rel=3D"noopener">https=
://marc.info/?l=3Dopenembedded-devel&amp;m=3D154773496216135&amp;w=3D2</a>,=
 and they also think that veth missing is the problem. And as suggestion, I=
 added in my local.conf:<br /><span style=3D"background-color: #f5f5f5; col=
or: #000000; font-family: 'courier new', courier, monospace; font-size: 16p=
x; font-weight: 600;">CORE_IMAGE_EXTRA_INSTALL +=3D "kernel-modules docker"=
<br /></span>But they also mentioned the actual solution is :<br />
<pre style=3D"font-family: 'courier new', courier, monospace; font-size: 16=
px; font-weight: 600; color: #000000;">I found the issue.  The veth kernel =
parameter was not enabled.  Once I added
CONFIG_VETH=3Dy to my docker.cfg file, I was able to successfully run a
docker container in my openembedded OS</pre>
So where could I do the same? I've used the rocko version and it doesn't ha=
ve the linux/docker.cfg file? Or could I can create one by myself?</div>

--TCjd8IjgKGABjMS0Nelv--

