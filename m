Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D37F7E00B6F; Tue, 29 Mar 2016 03:22:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C766DE00AE4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Mar 2016 03:22:28 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2TAMRkt016229
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Mar 2016 03:22:27 -0700 (PDT)
Received: from PEK-ZHE-D1.wrs.com (128.224.162.234) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 29 Mar 2016 03:22:26 -0700
From: <zhe.he@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Tue, 29 Mar 2016 18:22:23 +0800
Message-ID: <cover.1459246648.git.zhe.he@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] openvswith: Uprev to latest version 2.5.0
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Mar 2016 10:22:30 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Test it as follow:

--------------------------------
host:
root@genericx86-64:~# nohup qemu-system-x86_64 -nographic -k en-us -m 256 -net nic,macaddr=1a:46:0b:ca:bc:7a,model=virtio -net tap,script=/etc/qemu-ifup1 -enable-kvm -kernel /boot/bzIma
ge -append 'root=/dev/vda ro console=ttyS0' -drive file=/core-image-minimal-genericx86-64.ext4,cache=none,if=virtio -serial telnet::4443,server,nowait &
[1] 384
root@genericx86-64:~# nohup: ignoring input and appending output to 'nohup.out'
device tap0 entered promiscuous mode
device ovsbr0 left promiscuous mode
device tap0 left promiscuous mode
device ovsbr0 entered promiscuous mode
device tap0 entered promiscuous mode

root@genericx86-64:~# nohup qemu-system-x86_64 -nographic -k en-us -m 256 -net nic,macaddr=1a:46:0b:ca:bc:7b,model=virtio -net tap,script=/etc/qemu-ifup2 -enable-kvm -kernel /boot/bzIma
ge -append 'root=/dev/vda ro console=ttyS0' -drive file=/core-image-minimal-genericx86-64.ext4,cache=none,if=virtio -serial telnet::4444,server,nowait &
[2] 413
root@genericx86-64:~# nohup: ignoring input and appending output to 'nohup.out'
device tap1 entered promiscuous mode
kvm [384]: vcpu0 disabled perfctr wrmsr: 0xc2 data 0xffff
kvm [413]: vcpu0 disabled perfctr wrmsr: 0xc2 data 0xffff

root@genericx86-64:~# ifconfig
eth0      Link encap:Ethernet  HWaddr 00:1A:A0:10:C3:B7  
          inet addr:128.224.165.55  Bcast:128.224.165.255  Mask:255.255.255.0
          inet6 addr: fe80::21a:a0ff:fe10:c3b7%119/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:64658 errors:0 dropped:0 overruns:0 frame:0
          TX packets:24444 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:87027867 (82.9 MiB)  TX bytes:4205887 (4.0 MiB)
          Interrupt:17 

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1%119/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

ovsbr0    Link encap:Ethernet  HWaddr 92:A2:85:64:6A:42  
          inet addr:192.168.1.1  Bcast:192.168.1.255  Mask:255.255.255.0
          inet6 addr: fe80::90a2:85ff:fe64:6a42%119/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:38 errors:0 dropped:0 overruns:0 frame:0
          TX packets:15 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:8776 (8.5 KiB)  TX bytes:1166 (1.1 KiB)

tap0      Link encap:Ethernet  HWaddr E2:52:86:35:F8:FB  
          inet6 addr: fe80::e052:86ff:fe35:f8fb%119/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:24 errors:0 dropped:0 overruns:0 frame:0
          TX packets:40 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:500 
          RX bytes:5088 (4.9 KiB)  TX bytes:6336 (6.1 KiB)

tap1      Link encap:Ethernet  HWaddr FA:C3:63:45:40:A8                                                                                                                         [20/5517]
          inet6 addr: fe80::f8c3:63ff:fe45:40a8%119/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:25 errors:0 dropped:0 overruns:0 frame:0
          TX packets:34 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:500 
          RX bytes:5130 (5.0 KiB)  TX bytes:5820 (5.6 KiB)

root@genericx86-64:~# ping 192.168.1.2
PING 192.168.1.2 (192.168.1.2): 56 data bytes
64 bytes from 192.168.1.2: seq=0 ttl=64 time=0.533 ms
64 bytes from 192.168.1.2: seq=1 ttl=64 time=0.281 ms
^C
--- 192.168.1.2 ping statistics ---
2 packets transmitted, 2 packets received, 0% packet loss
round-trip min/avg/max = 0.281/0.407/0.533 ms
root@genericx86-64:~# ping 192.168.1.3
PING 192.168.1.3 (192.168.1.3): 56 data bytes
64 bytes from 192.168.1.3: seq=0 ttl=64 time=0.581 ms
64 bytes from 192.168.1.3: seq=1 ttl=64 time=0.258 ms
^C
--- 192.168.1.3 ping statistics ---
2 packets transmitted, 2 packets received, 0% packet loss
round-trip min/avg/max = 0.258/0.419/0.581 ms
root@genericx86-64:~# cat /proc/net/arp   
IP address       HW type     Flags       HW address            Mask     Device
128.224.165.20   0x1         0x2         b8:ca:3a:f0:99:bf     *        eth0
128.224.165.1    0x1         0x2         00:17:df:e5:ac:00     *        eth0
192.168.1.2      0x1         0x2         1a:46:0b:ca:bc:7a     *        ovsbr0
192.168.1.3      0x1         0x2         1a:46:0b:ca:bc:7b     *        ovsbr0
root@genericx86-64:~# ovs-vsctl show
5f6b161b-efb7-4de2-8db5-012a7cd1835e
    Bridge "ovsbr0"
        Port "tap1"
            Interface "tap1"
        Port "ovsbr0"
            Interface "ovsbr0"
                type: internal
        Port "tap0"
            Interface "tap0"
    ovs_version: "2.5.1"
root@genericx86-64:~#

--------------------------------
guest1:
telnet host-ip-address 4443
root@genericx86-64:~# ifconfig eth0 192.168.1.2 up
root@genericx86-64:~# ifconfig
eth0      Link encap:Ethernet  HWaddr 1A:46:0B:CA:BC:7A  
          inet addr:192.168.1.2  Bcast:192.168.1.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:20 errors:0 dropped:0 overruns:0 frame:0
          TX packets:8 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:3168 (3.0 KiB)  TX bytes:1980 (1.9 KiB)

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1%119/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

root@genericx86-64:~# ping 192.168.1.1
PING 192.168.1.1 (192.168.1.1): 56 data bytes
64 bytes from 192.168.1.1: seq=0 ttl=64 time=6.018 ms
64 bytes from 192.168.1.1: seq=1 ttl=64 time=0.258 ms
^C
--- 192.168.1.1 ping statistics ---
2 packets transmitted, 2 packets received, 0% packet loss
round-trip min/avg/max = 0.258/3.138/6.018 ms
root@genericx86-64:~# ping 192.168.1.3
PING 192.168.1.3 (192.168.1.3): 56 data bytes
64 bytes from 192.168.1.3: seq=0 ttl=64 time=1.294 ms
64 bytes from 192.168.1.3: seq=1 ttl=64 time=0.459 ms
^C
--- 192.168.1.3 ping statistics ---
2 packets transmitted, 2 packets received, 0% packet loss
round-trip min/avg/max = 0.459/0.876/1.294 ms
root@genericx86-64:~# cat /proc/net/arp 
IP address       HW type     Flags       HW address            Mask     Device
192.168.1.3      0x1         0x2         1a:46:0b:ca:bc:7b     *        eth0
192.168.1.1      0x1         0x2         92:a2:85:64:6a:42     *        eth0

--------------------------------
guest2:
telnet host-ip-address 4444
root@genericx86-64:~# ifconfig eth0 192.168.1.3 up
root@genericx86-64:~# ifconfig
eth0      Link encap:Ethernet  HWaddr 1A:46:0B:CA:BC:7B  
          inet addr:192.168.1.3  Bcast:192.168.1.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:15 errors:0 dropped:0 overruns:0 frame:0
          TX packets:8 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:2790 (2.7 KiB)  TX bytes:1980 (1.9 KiB)

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1%119/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

root@genericx86-64:~# ping 192.168.1.1
PING 192.168.1.1 (192.168.1.1): 56 data bytes
64 bytes from 192.168.1.1: seq=0 ttl=64 time=0.920 ms
64 bytes from 192.168.1.1: seq=1 ttl=64 time=0.286 ms
^C
--- 192.168.1.1 ping statistics ---
2 packets transmitted, 2 packets received, 0% packet loss
round-trip min/avg/max = 0.286/0.603/0.920 ms
root@genericx86-64:~# ping 192.168.1.2
PING 192.168.1.2 (192.168.1.2): 56 data bytes
64 bytes from 192.168.1.2: seq=0 ttl=64 time=0.566 ms
64 bytes from 192.168.1.2: seq=1 ttl=64 time=0.439 ms
^C
--- 192.168.1.2 ping statistics ---
2 packets transmitted, 2 packets received, 0% packet loss
round-trip min/avg/max = 0.439/0.502/0.566 ms
root@genericx86-64:~# cat /proc/net/arp 
IP address       HW type     Flags       HW address            Mask     Device
192.168.1.2      0x1         0x2         1a:46:0b:ca:bc:7a     *        eth0
192.168.1.1      0x1         0x2         92:a2:85:64:6a:42     *        eth0

He Zhe (1):
  openvswith: Uprev to latest version 2.5.0

 ...-8c0b419a0b9ac0141d6973dcc80306dfc6a83d31.patch | 69 ++++++++++++++++++++++
 ...-bb429e09f7783f1ba23ac0682ed9edf424f0cfbb.patch | 69 ----------------------
 recipes-networking/openvswitch/openvswitch_git.bb  |  8 +--
 3 files changed, 73 insertions(+), 73 deletions(-)
 create mode 100644 recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-8c0b419a0b9ac0141d6973dcc80306dfc6a83d31.patch
 delete mode 100644 recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-bb429e09f7783f1ba23ac0682ed9edf424f0cfbb.patch

-- 
2.0.1


