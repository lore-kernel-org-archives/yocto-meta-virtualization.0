Return-Path: <sundareswaram@hotmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68956C433F5
	for <webhook@archiver.kernel.org>; Sat,  8 Oct 2022 05:40:40 +0000 (UTC)
Subject: [issue] macvtap dropping all packets as errors #libvirt
To: meta-virtualization@lists.yoctoproject.org
From: sundareswaram@hotmail.com
X-Originating-Location: Bengaluru, Karnataka, IN (116.197.184.11)
X-Originating-Platform: Windows Firefox 104
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 07 Oct 2022 22:40:33 -0700
Message-ID: <jYPM.1665207633143567331.kx62@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="7OT1lRmWpoxAB0qqytJR"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 08 Oct 2022 05:40:40 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7650

--7OT1lRmWpoxAB0qqytJR
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

i am using QEMU KVM to launch my Guest VM. the management interface of the =
Guest VM is connected via macvtap
i am debugging an issue with Guest VM's mgmt interface isnt receving any pa=
ckets, which all seem to be getting dropped in the macvtap0 interface

the packet path is as below;

Guest VM Host OS
me0 <-- --> macvtap0 <--> eth0

the tx direction from me0 packets are visible at macvtap0
while, the packets recvd through eth0 on HostOS are received well at macvta=
p0. but, all are dropped as error packets

tcpdump on macvtap0 is dumping all packets as well received.

i am unable to troubleshoot the issue further. how do i troubleshoot the is=
sue ?

any pointers will help

root@local-node:~# ifconfig macvtap0 ; tcpdump -i macvtap0 -c 2 ;ifconfig m=
acvtap0
macvtap0 Link encap:Ethernet HWaddr 74:e7:98:b6:e4:1a
inet addr:10.0.50.179 Bcast:10.0.255.255 Mask:255.255.0.0
inet6 addr: fe80::76e7:98ff:feb6:e41a/64 Scope:Link
UP BROADCAST RUNNING ALLMULTI MULTICAST MTU:1500 Metric:1
RX packets:4027390 errors:4023310 dropped:4023310 overruns:0 frame:0
TX packets:40317 errors:0 dropped:0 overruns:0 carrier:0
collisions:0 txqueuelen:500
RX bytes:432084441 (412.0 MiB) TX bytes:1723136 (1.6 MiB)

tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on macvtap0, link-type EN10MB (Ethernet), capture size 262144 byt=
es
09:58:22.643089 IP6 fe80::4e73:4fff:fe09:6501.dhcpv6-client > ff02::1:2.dhc=
pv6-server: dhcp6 solicit
09:58:22.689583 IP 10.0.0.2 > 224.0.0.18: VRRPv2, Advertisement, vrid 7, pr=
io 95, authtype none, intvl 1s, length 20
2 packets captured
4 packets received by filter
0 packets dropped by kernel
2 packets dropped by interface
macvtap0 Link encap:Ethernet HWaddr 74:e7:98:b6:e4:1a
inet addr:10.0.50.179 Bcast:10.0.255.255 Mask:255.255.0.0
inet6 addr: fe80::76e7:98ff:feb6:e41a/64 Scope:Link
UP BROADCAST RUNNING ALLMULTI MULTICAST MTU:1500 Metric:1
RX packets:4027392 errors:4023312 dropped:4023312 overruns:0 frame:0
TX packets:40317 errors:0 dropped:0 overruns:0 carrier:0
collisions:0 txqueuelen:500
RX bytes:432084650 (412.0 MiB) TX bytes:1723136 (1.6 MiB)

--7OT1lRmWpoxAB0qqytJR
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

i am using QEMU KVM to launch my Guest VM. the management interface of the =
Guest VM is connected via macvtap<br />i am debugging an issue with Guest V=
M's mgmt interface isnt receving any packets, which all seem to be getting =
dropped in the macvtap0 interface<br />
<div class=3D"Message userContent">
<p><br />the packet path is as below;</p>
<p>Guest VM Host OS<br />me0 &lt;-- --&gt; macvtap0 &lt;--&gt; eth0</p>
<p>the tx direction from me0 packets are visible at macvtap0<br />while, th=
e packets recvd through eth0 on HostOS are received well at macvtap0. but, =
all are dropped as error packets</p>
<p>tcpdump on macvtap0 is dumping all packets as well received.<br /><br />=
i am unable to troubleshoot the issue further. how do i troubleshoot the is=
sue ?</p>
<p>any pointers will help</p>
<p>root@local-node:~# ifconfig macvtap0 ; tcpdump -i macvtap0 -c 2 ;ifconfi=
g macvtap0<br />macvtap0 Link encap:Ethernet HWaddr 74:e7:98:b6:e4:1a<br />=
inet addr:10.0.50.179 Bcast:10.0.255.255 Mask:255.255.0.0<br />inet6 addr: =
fe80::76e7:98ff:feb6:e41a/64 Scope:Link<br />UP BROADCAST RUNNING ALLMULTI =
MULTICAST MTU:1500 Metric:1<br />RX packets:4027390 errors:4023310 dropped:=
4023310 overruns:0 frame:0<br />TX packets:40317 errors:0 dropped:0 overrun=
s:0 carrier:0<br />collisions:0 txqueuelen:500<br />RX bytes:432084441 (412=
.0 MiB) TX bytes:1723136 (1.6 MiB)</p>
<p>tcpdump: verbose output suppressed, use -v or -vv for full protocol deco=
de<br />listening on macvtap0, link-type EN10MB (Ethernet), capture size 26=
2144 bytes<br />09:58:22.643089 IP6 fe80::4e73:4fff:fe09:6501.dhcpv6-client=
 &gt; ff02::1:2.dhcpv6-server: dhcp6 solicit<br />09:58:22.689583 IP 10.0.0=
.2 &gt; 224.0.0.18: VRRPv2, Advertisement, vrid 7, prio 95, authtype none, =
intvl 1s, length 20<br />2 packets captured<br />4 packets received by filt=
er<br />0 packets dropped by kernel<br />2 packets dropped by interface<br =
/>macvtap0 Link encap:Ethernet HWaddr 74:e7:98:b6:e4:1a<br />inet addr:10.0=
.50.179 Bcast:10.0.255.255 Mask:255.255.0.0<br />inet6 addr: fe80::76e7:98f=
f:feb6:e41a/64 Scope:Link<br />UP BROADCAST RUNNING ALLMULTI MULTICAST MTU:=
1500 Metric:1<br />RX packets:4027392 errors:4023312 dropped:4023312 overru=
ns:0 frame:0<br />TX packets:40317 errors:0 dropped:0 overruns:0 carrier:0<=
br />collisions:0 txqueuelen:500<br />RX bytes:432084650 (412.0 MiB) TX byt=
es:1723136 (1.6 MiB)</p>
</div>

--7OT1lRmWpoxAB0qqytJR--

