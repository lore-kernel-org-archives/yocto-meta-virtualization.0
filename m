Return-Path: <Yunguo.Wei@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 95E34E00C75; Thu, 31 Mar 2016 01:00:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4A0F6E00C62
	for <meta-virtualization@yoctoproject.org>;
	Thu, 31 Mar 2016 01:00:14 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2V80DkF016016
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 31 Mar 2016 01:00:13 -0700 (PDT)
Received: from pek-bsp-build5.wrs.com (128.224.179.117) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Thu, 31 Mar 2016 01:00:12 -0700
From: Yunguo Wei <yunguo.wei@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Thu, 31 Mar 2016 15:55:43 +0800
Message-ID: <1459410944-43112-1-git-send-email-yunguo.wei@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [V3][PATCH 0/1] libvirt: uprev to 1.3.2
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
X-List-Received-Date: Thu, 31 Mar 2016 08:00:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

V3 changes:

Bring back the patch libvirt-use-pkg-config-to-locate-libcap.patch,
which was dropped in V2 by mistake.

V2 changes:

1. use git "-M" option to generate patch for easy review.

2. Drop the patch
0001-Add-missing-split-to-properly-retrieve-cflags-and-ld.patch
in V1 as the patch was actually fixing an issue introduced during
rebasing 1.2.19 patches.

3. Rebase existing patches to make 2) happen.
---------------------------------------------
commit c3e03a8f5d4c8dce3d4d4076b2be5cb9bb44a8b5
Author: Yunguo Wei <yunguo.wei@windriver.com>
Date:   Mon Mar 28 16:54:04 2016 +0800

    libvirt: uprev to 1.3.2
    
    Release notes here http://libvirt.org/news.html.
    
    Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>


Added Files:
------------
 .../libvirt-1.3.2/0001-to-fix-build-error.patch    |  46 ++++
 recipes-extended/libvirt/libvirt_1.3.2.bb          | 287 +++++++++++++++++++++

Removed Files:
--------------
 .../libvirt-1.2.19/0001-to-fix-build-error.patch   |  44 ----
 recipes-extended/libvirt/libvirt_1.2.19.bb         | 287 ---------------------

Remaining Changes (diffstat):
-----------------------------
 recipes-extended/libvirt/libvirt-python.inc        |   4 +-
 ...vert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch |  52 +++-------
 .../libvirt/libvirt/libvirt_api_xml_path.patch     |  14 +--
 recipes-extended/libvirt/libvirt/runptest.patch    |   2 +-
 ...ibvirt-net-rpc-to-virt-host-validate-when.patch | 107 ++++++++-------------

---------------------------
Test steps:

t@SDP_Wildcat_Pass-1:/media# libvirtd -V
libvirtd (libvirt) 1.3.2
root@SDP_Wildcat_Pass-1:/media# systemctl status libvirtd
● libvirtd.service - Virtualization daemon
   Loaded: loaded (/lib/systemd/system/libvirtd.service; enabled; vendor
preset: enabled)
   Active: active (running) since Thu 2016-03-31 03:43:57 UTC; 2s ago
     Docs: man:libvirtd(8)
           http://libvirt.org
  Process: 2200 ExecStart=/usr/sbin/libvirtd $LIBVIRTD_ARGS
(code=exited, status=0/SUCCESS)
 Main PID: 2202 (libvirtd)
   CGroup: /system.slice/libvirtd.service
           ├─2026 /usr/bin/dnsmasq
--conf-file=/var/lib/libvirt/dnsmasq/default.conf --leasefile-ro
--dhcp-script=/usr/lib64/libvirt/libvirt_leaseshelper
           ├─2027 /usr/bin/dnsmasq
--conf-file=/var/lib/libvirt/dnsmasq/default.conf --leasefile-ro
--dhcp-script=/usr/lib64/libvirt/libvirt_leaseshelper
           └─2202 /usr/sbin/libvirtd --listen --daemon

Mar 31 03:43:55 SDP_Wildcat_Pass-1 systemd[1]: Starting Virtualization
daemon...
Mar 31 03:43:57 SDP_Wildcat_Pass-1 libvirtd[2200]: 2016-03-31
03:43:57.284+0000: 2200: info : libvirt version: 1.3.2
Mar 31 03:43:57 SDP_Wildcat_Pass-1 libvirtd[2200]: 2016-03-31
03:43:57.284+0000: 2200: info : hostname: SDP_Wildcat_Pass-1
Mar 31 03:43:57 SDP_Wildcat_Pass-1 libvirtd[2200]: 2016-03-31
03:43:57.284+0000: 2200: warning : virGetHostnameImpl:703 : getaddrinfo
failed for 'SD...ot known
Mar 31 03:43:57 SDP_Wildcat_Pass-1 systemd[1]: Started Virtualization
daemon.
Mar 31 03:43:57 SDP_Wildcat_Pass-1 dnsmasq[2026]: read /etc/hosts - 6
addresses
Mar 31 03:43:57 SDP_Wildcat_Pass-1 dnsmasq[2026]: read
/var/lib/libvirt/dnsmasq/default.addnhosts - 0 addresses
Mar 31 03:43:57 SDP_Wildcat_Pass-1 dnsmasq-dhcp[2026]: read
/var/lib/libvirt/dnsmasq/default.hostsfile
Hint: Some lines were ellipsized, use -l to show in full.

root@SDP_Wildcat_Pass-1:/media# cat test.xml 
<domain type='kvm'>
	<name>test</name>
	<memory>2048000</memory>
	<currentMemory>1024000</currentMemory>
	<vcpu>1</vcpu>
	<os>
		<type arch='x86_64' machine='pc'>hvm</type>
		<boot dev='hd' />
		<kernel>/media/guest.kernel</kernel>
		<cmdline>root=/dev/vda2 selinux=0 enforcing=0
console=ttyS0 rw </cmdline>
	</os>
	<devices>
		<disk type='file' device='disk'>
			<source file='/media/guest_70013.img' />
			<target dev='vda' bus='virtio'/>
		</disk>
	
		<serial type='pty'>
		        <target port='0'/>
		</serial>
		<console type='pty'>
		        <target type='serial' port='0'/>
		</console>
	</devices>
	<devices>
		<memballoon model='virtio'/>
	</devices>
</domain>
root@SDP_Wildcat_Pass-1:/media# virsh define test.xml 
Domain test defined from test.xml
root@SDP_Wildcat_Pass-1:/media# virsh start test
Domain test started

root@SDP_Wildcat_Pass-1:/media# virsh console test
Connected to domain test
Escape character is ^]
EXT4-fs (vda2): re-mounted. Opts: (null)
[  OK  ] Started Remount Root and Kernel File Systems.
fuse init (API version 7.22)
         Starting Create Static Device Nodes in /dev...
[  OK  ] Started Load Kernel Modules.
         Mounting FUSE Control File System...
         Starting Apply Kernel Variables...
[  OK  ] Mounted FUSE Control File System.
[  OK  ] Started Apply Kernel Variables.
[  OK  ] Started LSB: Set hostname based on /etc/hostname.
         Starting (null)...
[  OK  ] Started (null).
[  OK  ] Started Create Static Device Nodes in /dev.
         Starting udev Kernel Device Manager...
[  OK  ] Reached target Local File Systems (Pre).
         Mounting /mnt/huge...
systemd-udevd[178]: starting version 216
         Mounting /var/volatile...
[  OK  ] Mounted /mnt/huge.
[  OK  ] Started udev Kernel Device Manager.
[  OK  ] Mounted /var/volatile.
         Starting Load/Save Random Seed...
[  OK  ] Started LVM activation.
[  OK  ] Started Load/Save Random Seed.
[  OK  ] Found device /dev/ttyS0.
[  OK  ] Found device
/dev/disk/by-uuid/c30d65b1-ac9c-4843-8ed0-1c572c45f411.
         Starting File System Check on
/dev/...1-ac9c-4843-8ed0-1c572c45f411...
[  OK  ] Found device
/dev/disk/by-uuid/dcb63b7b-29c5-46ca-bed4-561ddce91a10.
         Activating swap
/dev/disk/by-uuid/d...b-29c5-46ca-bed4-561ddce91a10...
Adding 204796k swap on /dev/vda3.  Priority:-1 extents:1 across:204796k 
[  OK  ] Activated swap
/dev/disk/by-uuid/dcb63b7b-29c5-46ca-bed4-561ddce91a10.
[  OK  ] Reached target Swap.
systemd-fsck[235]: /dev/vda1: recovering journal
systemd-fsck[235]: /dev/vda1: clean, 251/128016 files, 260578/512000
blocks
[  OK  ] Started File System Check on
/dev/d...5b1-ac9c-4843-8ed0-1c572c45f411.
         Mounting /boot...
EXT4-fs (vda1): mounted filesystem with ordered data mode. Opts: (null)
[  OK  ] Mounted /boot.
[  OK  ] Reached target Local File Systems.
         Starting Trigger Flushing of Journal to Persistent Storage...
         Starting Create Volatile Files and Directories...
systemd-journald[131]: Received request to flush runtime journal from
PID 1
[  OK  ] Started Trigger Flushing of Journal to Persistent Storage.
[  OK  ] Started Create Volatile Files and Directories.
[  OK  ] Reached target System Time Synchronized.
         Starting Security Auditing Service...
systemd-journald[131]: File
/var/log/journal/1a524f82242b49afb8353a2ab625087a/system.journal
corrupted or uncleanly shut down, renaming and replacing.
[  OK  ] Started Security Auditing Service.
         Starting Update UTMP about System Boot/Shutdown...
[  OK  ] Started Update UTMP about System Boot/Shutdown.
[  OK  ] Reached target System Initialization.
audit: type=1305 audit(1459395895.903:2): audit_pid=261 old=0
auid=4294967295 ses=4294967295 res=1
[  OK  ] Listening on CUPS Printing Service Sockets.
[  OK  ] Listening on RPCbind Server Activation Socket.
[  OK  ] Listening on Avahi mDNS/DNS-SD Stack Activation Socket.
[  OK  ] Reached target Paths.
[  OK  ] Listening on D-Bus System Message Bus Socket.
[  OK  ] Reached target Timers.
         Starting Restore Sound Card State...
[  OK  ] Listening on sshd.socket.
[  OK  ] Reached target Sockets.
[  OK  ] Reached target Basic System.
         Starting LSB: Raise network interfaces....
         Starting Ethernet Bridge Filtering Tables...
         Starting Dynamic Host Configuration Protocol (DHCP)...
[  OK  ] Started Dynamic Host Configuration Protocol (DHCP).
         Starting irqbalance daemon...
[  OK  ] Started irqbalance daemon.
         Starting GNU Zebra routing manager...
         Starting Job spooling tools...
[  OK  ] Started Job spooling tools.
         Starting Avahi mDNS/DNS-SD Stack...
         Starting System Logging Service...
         Starting strongSwan IPsec...
[  OK  ] Started strongSwan IPsec.
         Starting ACPI Event Daemon...
         Starting Periodic Command Scheduler...
[  OK  ] Started Periodic Command Scheduler.
         Starting Apply Cpu Microcode...
         Starting Permit User Sessions...
         Starting Login Service...
         Starting D-Bus System Message Bus...
[  OK  ] Started D-Bus System Message Bus.
[  OK  ] Started Avahi mDNS/DNS-SD Stack.
         Starting Network Service...
[  OK  ] Started System Logging Service.
[  OK  ] Started Restore Sound Card State.
[FAILED] Failed to start LSB: Raise network interfaces..
See 'systemctl status networking.service' for details.
[  OK  ] Started Ethernet Bridge Filtering Tables.
[  OK  ] Started ACPI Event Daemon.
[  OK  ] Started Apply Cpu Microcode.
[  OK  ] Started Permit User Sessions.
[  OK  ] Started Login Service.
         Starting (null)...
NET: Registered protocol family 15
[  OK  ] Started Network Service.
         Starting Wait for Network to be Configured...
Initializing XFRM netlink socket
[  OK  ] Started (null).
[  OK  ] Started GNU Zebra routing manager.
         Starting IS-IS routing daemon...
[  OK  ] Reached target Network.
         Starting Simple Network Management Protocol (SNMP) Trap
Daemon....
         Starting Distccd A Distributed Compilation Server...
[  OK  ] Started Distccd A Distributed Compilation Server.
         Starting FreeRADIUS high performance RADIUS server....
         Starting Xinetd A Powerful Replacement For Inetd...
         Starting DNS forwarder and DHCP server...
         Starting Postfix Mail Transport Agent...
         Starting Vsftpd ftp daemon...
[  OK  ] Started Vsftpd ftp daemon.
         Starting Network Time Service...
         Starting Berkeley Internet Name Domain (DNS)...
         Starting The RPC portmapper...
         Starting Collectd...
[  OK  ] Started Collectd.
         Starting HP Agentless Management Service daemon...
[  OK  ] Started HP Agentless Management Service daemon.
         Starting Check tcf-agent autostart...
         Starting Simple Network Management Protocol (SNMP) Daemon....
         Starting /etc/rc.local Compatibility...
         Starting OSPF routing daemon...
         Starting RIP routing daemon for IPv6...
         Starting OSPF routing daemon for IPv6...
         Starting Babel routing daemon...
         Starting RIP routing daemon...
         Starting BGP routing daemon...
[  OK  ] Started IS-IS routing daemon.
[  OK  ] Started Xinetd A Powerful Replacement For Inetd.
[  OK  ] Started Network Time Service.
[  OK  ] Started The RPC portmapper.
[  OK  ] Started /etc/rc.local Compatibility.
         Starting Serial Getty on ttyS0...
[  OK  ] Started Serial Getty on ttyS0.
         Starting Getty on tty1...
[  OK  ] Started Getty on tty1.
[  OK  ] Reached target Login Prompts.
[  OK  ] Started Babel routing daemon.
[  OK  ] Started RIP routing daemon for IPv6.
[  OK  ] Started OSPF routing daemon for IPv6.
[  OK  ] Started RIP routing daemon.
[  OK  ] Started OSPF routing daemon.
[  OK  ] Started DNS forwarder and DHCP server.
[  OK  ] Started BGP routing daemon.

tcf-agent: not configured to autostart, use /etc/cafe/tcf-agent.init
force-start
[  OK  ] Started Check tcf-agent autostart.
systemd-journald[131]: File
/var/log/journal/1a524f82242b49afb8353a2ab625087a/user-65534.journal
corrupted or uncleanly shut down, renaming and replacing.
[  OK  ] Started Simple Network Management Protocol (SNMP) Trap Daemon..
[  OK  ] Started Simple Network Management Protocol (SNMP) Daemon..
[  OK  ] Started Berkeley Internet Name Domain (DNS).
[  OK  ] Reached target Host and Network Name Lookups.
[  OK  ] Started Postfix Mail Transport Agent.
[  OK  ] Started FreeRADIUS high performance RADIUS server..

Wind River Linux CGP 7.0.0.13 cgp-70013 ttyS0

cgp-70013 login: root
Password: 
Last login: Tue Mar 29 04:21:57 EDT 2016 on ttyS0


