Return-Path: <heyday-welds.0b@icloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45A06C47258
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 01:26:15 +0000 (UTC)
Subject: [Question] Podman port mapping is not working properly. #meta-virtualization
To: meta-virtualization@lists.yoctoproject.org
From: heyday-welds.0b@icloud.com
X-Originating-Location: Suwon, Gyeonggi-do, KR (27.122.242.81)
X-Originating-Platform: Mac Safari 17.2
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 23 Jan 2024 17:26:06 -0800
Message-ID: <bh1m.1706059566449530085.DzVM@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="5ppLcJi5wOruKeRQXoqm"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Jan 2024 01:26:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8551

--5ppLcJi5wOruKeRQXoqm
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

First of all, please let me know, if this is not right place for a question=
.

I'm a newbie to Yocto Project and consisting running environment of podman.

I enabled virtualization layer, podman and iproute2.
Now podman can run container without port mapping.
But below error occurs when I use port mapping as below.

Can I get any clue about it?

root@qemux86-64:/media/disk# podman run -dit -p 8080:80 httpd
[ 1055.281577] cni-podman0: port 1(vethefec5ab0) entered blocking state
[ 1055.282447] cni-podman0: port 1(vethefec5ab0) entered disabled state
[ 1055.283999] device vethefec5ab0 entered promiscuous mode
[ 1055.507799] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[ 1055.508566] IPv6: ADDRCONF(NETDEV_CHANGE): vethefec5ab0: link becomes re=
ady
[ 1055.509053] cni-podman0: port 1(vethefec5ab0) entered blocking state
[ 1055.509417] cni-podman0: port 1(vethefec5ab0) entered forwarding state
WARN[0003] Failed to load cached network config: network podman not found i=
n CNI cache, falling back to loading network podman from disk
[ 1058.204483] cni-podman0: port 1(vethefec5ab0) entered disabled state
[ 1058.232123] device vethefec5ab0 left promiscuous mode
[ 1058.232665] cni-podman0: port 1(vethefec5ab0) entered disabled state
Error: plugin type=3D"portmap" failed (add): cni plugin portmap failed: una=
ble to create chain CNI-HOSTPORT-SETMARK: running [/usr/sbin/iptables -t na=
t -C CNI-HOSTPORT-SETMARK -m comment --comment CNI portfwd masquerade mark =
-j MARK --set-xmark 0x2000/0x2000 --wait]: exit status 2: iptables v1.8.7 (=
legacy): *unknown option "--set-xmark"*
Try `iptables -h' or 'iptables --help' for more information.

Kernel configuration is

root@qemux86-64:/media/disk# bash check-config.sh
info: reading kernel config from /proc/config.gz ...

Generally Necessary:
- cgroup hierarchy: properly mounted [/sys/fs/cgroup]
- CONFIG_NAMESPACES: enabled
- CONFIG_NET_NS: enabled
- CONFIG_PID_NS: enabled
- CONFIG_IPC_NS: enabled
- CONFIG_UTS_NS: enabled
- CONFIG_CGROUPS: enabled
- CONFIG_CGROUP_CPUACCT: enabled
- CONFIG_CGROUP_DEVICE: enabled
- CONFIG_CGROUP_FREEZER: enabled
- CONFIG_CGROUP_SCHED: enabled
- CONFIG_CPUSETS: enabled
- CONFIG_MEMCG: enabled
- CONFIG_KEYS: enabled
- CONFIG_VETH: enabled
- CONFIG_BRIDGE: enabled
- CONFIG_BRIDGE_NETFILTER: enabled
- CONFIG_IP_NF_FILTER: enabled (as module)
- CONFIG_IP_NF_MANGLE: enabled (as module)
- CONFIG_IP_NF_TARGET_MASQUERADE: enabled (as module)
- CONFIG_NETFILTER_XT_MATCH_ADDRTYPE: enabled (as module)
- CONFIG_NETFILTER_XT_MATCH_CONNTRACK: enabled (as module)
- CONFIG_NETFILTER_XT_MATCH_IPVS: enabled (as module)
- CONFIG_NETFILTER_XT_MARK: enabled (as module)
- CONFIG_IP_NF_NAT: enabled (as module)
- CONFIG_NF_NAT: enabled (as module)
- CONFIG_POSIX_MQUEUE: enabled
- CONFIG_CGROUP_BPF: enabled

Optional Features:
- CONFIG_USER_NS: enabled
- CONFIG_SECCOMP: enabled
- CONFIG_SECCOMP_FILTER: enabled
- CONFIG_CGROUP_PIDS: enabled
- CONFIG_MEMCG_SWAP: enabled
(cgroup swap accounting is currently enabled)
- CONFIG_BLK_CGROUP: enabled
- CONFIG_BLK_DEV_THROTTLING: missing
- CONFIG_CGROUP_PERF: enabled
- CONFIG_CGROUP_HUGETLB: missing
- CONFIG_NET_CLS_CGROUP: enabled (as module)
- CONFIG_CGROUP_NET_PRIO: enabled
- CONFIG_CFS_BANDWIDTH: missing
- CONFIG_FAIR_GROUP_SCHED: enabled
- CONFIG_IP_NF_TARGET_REDIRECT: enabled (as module)
- CONFIG_IP_VS: enabled (as module)
- CONFIG_IP_VS_NFCT: missing
- CONFIG_IP_VS_PROTO_TCP: missing
- CONFIG_IP_VS_PROTO_UDP: missing
- CONFIG_IP_VS_RR: missing
- CONFIG_SECURITY_SELINUX: missing
- CONFIG_SECURITY_APPARMOR: missing
- CONFIG_EXT4_FS: enabled
- CONFIG_EXT4_FS_POSIX_ACL: enabled
- CONFIG_EXT4_FS_SECURITY: enabled
- Network Drivers:
- "overlay":
- CONFIG_VXLAN: enabled (as module)
- CONFIG_BRIDGE_VLAN_FILTERING: enabled
Optional (for encrypted networks):
- CONFIG_CRYPTO: enabled
- CONFIG_CRYPTO_AEAD: enabled
- CONFIG_CRYPTO_GCM: enabled
- CONFIG_CRYPTO_SEQIV: enabled
- CONFIG_CRYPTO_GHASH: enabled
- CONFIG_XFRM: enabled
- CONFIG_XFRM_USER: enabled (as module)
- CONFIG_XFRM_ALGO: enabled
- CONFIG_INET_ESP: enabled (as module)
- CONFIG_NETFILTER_XT_MATCH_BPF: enabled (as module)
- "ipvlan":
- CONFIG_IPVLAN: enabled
- "macvlan":
- CONFIG_MACVLAN: enabled
- CONFIG_DUMMY: enabled (as module)
- "ftp,tftp client in container":
- CONFIG_NF_NAT_FTP: enabled (as module)
- CONFIG_NF_CONNTRACK_FTP: enabled (as module)
- CONFIG_NF_NAT_TFTP: enabled (as module)
- CONFIG_NF_CONNTRACK_TFTP: enabled (as module)
- Storage Drivers:
- "btrfs":
- CONFIG_BTRFS_FS: enabled
- CONFIG_BTRFS_FS_POSIX_ACL: enabled
- "overlay":
- CONFIG_OVERLAY_FS: enabled
- "zfs":
- /dev/zfs: missing
- zfs command: missing
- zpool command: missing

Limits:
- /proc/sys/kernel/keys/root_maxkeys: 1000000

Thanks, Chris.

--5ppLcJi5wOruKeRQXoqm
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

First of all, please let me know, if this is not right place for a question=
.<br /><br />I'm a newbie to Yocto Project and consisting running environme=
nt of podman.<br /><br />I enabled virtualization layer, podman and iproute=
2.<br />Now podman can run container without port mapping.<br />But below e=
rror occurs when I use port mapping as below.<br /><br />Can I get any clue=
 about it?<br /><br />
<div style=3D"padding-left: 30px;">root@qemux86-64:/media/disk# podman run =
-dit -p 8080:80 httpd</div>
<div style=3D"padding-left: 30px;">[ 1055.281577] cni-podman0: port 1(vethe=
fec5ab0) entered blocking state</div>
<div style=3D"padding-left: 30px;">[ 1055.282447] cni-podman0: port 1(vethe=
fec5ab0) entered disabled state</div>
<div style=3D"padding-left: 30px;">[ 1055.283999] device vethefec5ab0 enter=
ed promiscuous mode</div>
<div style=3D"padding-left: 30px;">[ 1055.507799] IPv6: ADDRCONF(NETDEV_CHA=
NGE): eth0: link becomes ready</div>
<div style=3D"padding-left: 30px;">[ 1055.508566] IPv6: ADDRCONF(NETDEV_CHA=
NGE): vethefec5ab0: link becomes ready</div>
<div style=3D"padding-left: 30px;">[ 1055.509053] cni-podman0: port 1(vethe=
fec5ab0) entered blocking state</div>
<div style=3D"padding-left: 30px;">[ 1055.509417] cni-podman0: port 1(vethe=
fec5ab0) entered forwarding state</div>
<div style=3D"padding-left: 30px;">WARN[0003] Failed to load cached network=
 config: network podman not found in CNI cache, falling back to loading net=
work podman from disk</div>
<div style=3D"padding-left: 30px;">[ 1058.204483] cni-podman0: port 1(vethe=
fec5ab0) entered disabled state</div>
<div style=3D"padding-left: 30px;">[ 1058.232123] device vethefec5ab0 left =
promiscuous mode</div>
<div style=3D"padding-left: 30px;">[ 1058.232665] cni-podman0: port 1(vethe=
fec5ab0) entered disabled state</div>
<div style=3D"padding-left: 30px;">Error: plugin type=3D"portmap" failed (a=
dd): cni plugin portmap failed: unable to create chain CNI-HOSTPORT-SETMARK=
: running [/usr/sbin/iptables -t nat -C CNI-HOSTPORT-SETMARK -m comment --c=
omment CNI portfwd masquerade mark -j MARK --set-xmark 0x2000/0x2000 --wait=
]: exit status 2: iptables v1.8.7 (legacy): <strong>unknown option "--set-x=
mark"</strong></div>
<div style=3D"padding-left: 30px;">Try `iptables -h' or 'iptables --help' f=
or more information.</div>
<div><br />Kernel configuration is<br /><br />
<div>root@qemux86-64:/media/disk# bash check-config.sh</div>
<div>info: reading kernel config from /proc/config.gz ...</div>
<div>&nbsp;</div>
<div>Generally Necessary:</div>
<div>- cgroup hierarchy: properly mounted [/sys/fs/cgroup]</div>
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
<div>- CONFIG_VETH: enabled</div>
<div>- CONFIG_BRIDGE: enabled</div>
<div>- CONFIG_BRIDGE_NETFILTER: enabled</div>
<div>- CONFIG_IP_NF_FILTER: enabled (as module)</div>
<div>- CONFIG_IP_NF_MANGLE: enabled (as module)</div>
<div>- CONFIG_IP_NF_TARGET_MASQUERADE: enabled (as module)</div>
<div>- CONFIG_NETFILTER_XT_MATCH_ADDRTYPE: enabled (as module)</div>
<div>- CONFIG_NETFILTER_XT_MATCH_CONNTRACK: enabled (as module)</div>
<div>- CONFIG_NETFILTER_XT_MATCH_IPVS: enabled (as module)</div>
<div>- CONFIG_NETFILTER_XT_MARK: enabled (as module)</div>
<div>- CONFIG_IP_NF_NAT: enabled (as module)</div>
<div>- CONFIG_NF_NAT: enabled (as module)</div>
<div>- CONFIG_POSIX_MQUEUE: enabled</div>
<div>- CONFIG_CGROUP_BPF: enabled</div>
<div>&nbsp;</div>
<div>Optional Features:</div>
<div>- CONFIG_USER_NS: enabled</div>
<div>- CONFIG_SECCOMP: enabled</div>
<div>- CONFIG_SECCOMP_FILTER: enabled</div>
<div>- CONFIG_CGROUP_PIDS: enabled</div>
<div>- CONFIG_MEMCG_SWAP: enabled</div>
<div>&nbsp; &nbsp; (cgroup swap accounting is currently enabled)</div>
<div>- CONFIG_BLK_CGROUP: enabled</div>
<div>- CONFIG_BLK_DEV_THROTTLING: missing</div>
<div>- CONFIG_CGROUP_PERF: enabled</div>
<div>- CONFIG_CGROUP_HUGETLB: missing</div>
<div>- CONFIG_NET_CLS_CGROUP: enabled (as module)</div>
<div>- CONFIG_CGROUP_NET_PRIO: enabled</div>
<div>- CONFIG_CFS_BANDWIDTH: missing</div>
<div>- CONFIG_FAIR_GROUP_SCHED: enabled</div>
<div>- CONFIG_IP_NF_TARGET_REDIRECT: enabled (as module)</div>
<div>- CONFIG_IP_VS: enabled (as module)</div>
<div>- CONFIG_IP_VS_NFCT: missing</div>
<div>- CONFIG_IP_VS_PROTO_TCP: missing</div>
<div>- CONFIG_IP_VS_PROTO_UDP: missing</div>
<div>- CONFIG_IP_VS_RR: missing</div>
<div>- CONFIG_SECURITY_SELINUX: missing</div>
<div>- CONFIG_SECURITY_APPARMOR: missing</div>
<div>- CONFIG_EXT4_FS: enabled</div>
<div>- CONFIG_EXT4_FS_POSIX_ACL: enabled</div>
<div>- CONFIG_EXT4_FS_SECURITY: enabled</div>
<div>- Network Drivers:</div>
<div>&nbsp; - "overlay":</div>
<div>&nbsp; &nbsp; - CONFIG_VXLAN: enabled (as module)</div>
<div>&nbsp; &nbsp; - CONFIG_BRIDGE_VLAN_FILTERING: enabled</div>
<div>&nbsp; &nbsp; &nbsp; Optional (for encrypted networks):</div>
<div>&nbsp; &nbsp; &nbsp; - CONFIG_CRYPTO: enabled</div>
<div>&nbsp; &nbsp; &nbsp; - CONFIG_CRYPTO_AEAD: enabled</div>
<div>&nbsp; &nbsp; &nbsp; - CONFIG_CRYPTO_GCM: enabled</div>
<div>&nbsp; &nbsp; &nbsp; - CONFIG_CRYPTO_SEQIV: enabled</div>
<div>&nbsp; &nbsp; &nbsp; - CONFIG_CRYPTO_GHASH: enabled</div>
<div>&nbsp; &nbsp; &nbsp; - CONFIG_XFRM: enabled</div>
<div>&nbsp; &nbsp; &nbsp; - CONFIG_XFRM_USER: enabled (as module)</div>
<div>&nbsp; &nbsp; &nbsp; - CONFIG_XFRM_ALGO: enabled</div>
<div>&nbsp; &nbsp; &nbsp; - CONFIG_INET_ESP: enabled (as module)</div>
<div>&nbsp; &nbsp; &nbsp; - CONFIG_NETFILTER_XT_MATCH_BPF: enabled (as modu=
le)</div>
<div>&nbsp; - "ipvlan":</div>
<div>&nbsp; &nbsp; - CONFIG_IPVLAN: enabled</div>
<div>&nbsp; - "macvlan":</div>
<div>&nbsp; &nbsp; - CONFIG_MACVLAN: enabled</div>
<div>&nbsp; &nbsp; - CONFIG_DUMMY: enabled (as module)</div>
<div>&nbsp; - "ftp,tftp client in container":</div>
<div>&nbsp; &nbsp; - CONFIG_NF_NAT_FTP: enabled (as module)</div>
<div>&nbsp; &nbsp; - CONFIG_NF_CONNTRACK_FTP: enabled (as module)</div>
<div>&nbsp; &nbsp; - CONFIG_NF_NAT_TFTP: enabled (as module)</div>
<div>&nbsp; &nbsp; - CONFIG_NF_CONNTRACK_TFTP: enabled (as module)</div>
<div>- Storage Drivers:</div>
<div>&nbsp; - "btrfs":</div>
<div>&nbsp; &nbsp; - CONFIG_BTRFS_FS: enabled</div>
<div>&nbsp; &nbsp; - CONFIG_BTRFS_FS_POSIX_ACL: enabled</div>
<div>&nbsp; - "overlay":</div>
<div>&nbsp; &nbsp; - CONFIG_OVERLAY_FS: enabled</div>
<div>&nbsp; - "zfs":</div>
<div>&nbsp; &nbsp; - /dev/zfs: missing</div>
<div>&nbsp; &nbsp; - zfs command: missing</div>
<div>&nbsp; &nbsp; - zpool command: missing</div>
<div>&nbsp;</div>
<div>Limits:</div>
<div>- /proc/sys/kernel/keys/root_maxkeys: 1000000<br /><br />Thanks, Chris=
.</div>
</div>

--5ppLcJi5wOruKeRQXoqm--

