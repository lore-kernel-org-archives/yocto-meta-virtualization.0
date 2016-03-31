Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B5595E00C2D; Thu, 31 Mar 2016 06:16:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.218.51 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0D738E00BBF
	for <meta-virtualization@yoctoproject.org>;
	Thu, 31 Mar 2016 06:16:03 -0700 (PDT)
Received: by mail-oi0-f51.google.com with SMTP id p188so26959204oih.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 31 Mar 2016 06:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=T7KGAl3rJ2+Xr9eIHIEaVW3Z7BYaRt3B80VWOgacNOs=;
	b=EklMnNfYJjkkfLDVUDo1HVz/kx/a7dY1GRYuxGkmevTzeEz8LTh6s8Q0nLzxiC5AGQ
	g4GW+mxUPBJ8IbbuxjxLHESZvKweRMeHFR8JmaXZfFvjdIpoIw+DpE0luEeHXbLfttxO
	2By18SshGJYZP3uWkM4WxQ7nOlXY3SvCV8f3Artuj4hO0iIXFV9DBugP+0TumeZYXenr
	91bGsaCEDLqLEld4i/7QXMEwq8wwVwZTa5W+tlbdhXnpudelIAtablqEI6IxjdLrrIC7
	UdSkAb+SsM5vrXE/Vxq55ySOrTxxlygCbk9UYREUTd4FUByJGKnJBepQMfxysXNHVAmt
	0qgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=T7KGAl3rJ2+Xr9eIHIEaVW3Z7BYaRt3B80VWOgacNOs=;
	b=msnd4z12V1ns0ZP7ymAIjit6JZh/L2S1RiPH2YnTLBtg9LHhR+c6zrEi+pmA4qQefs
	SnYE3GpywIeAjOv4qQByS8Io//9dFGJMxVoc4SIq2RVW/h3dfabX5riTsNB1zvjK3iOk
	cDN/o9OOL0Tt189UtasptUkJ2opCDP4kVVyJ70J240/u+Rcvh0qfqcOOkKdlQNpMF2Pj
	Z1WX7n+1MhLyttsaIx4JtXDtiij8MdxkmYBkpa3j3QyIS4se94FAawUwYz04rG/oQmsk
	6vY9x/qoATkEwjgUtMarf0JD2eml1RgPWJpOfczjTVrNEbhUF0uBe0ww36YjP1HZZE9V
	ZA8Q==
X-Gm-Message-State: AD7BkJIztJN1Kyon7rvp20B+PzcuidzNoa/5qAIDHwN6C8Aut1tHmFAuVgy/do+lO9/LHW302kGOdSxa71ngIQ==
MIME-Version: 1.0
X-Received: by 10.202.90.3 with SMTP id o3mr1373450oib.96.1459430163145; Thu,
	31 Mar 2016 06:16:03 -0700 (PDT)
Received: by 10.157.5.101 with HTTP; Thu, 31 Mar 2016 06:16:03 -0700 (PDT)
In-Reply-To: <1459410944-43112-1-git-send-email-yunguo.wei@windriver.com>
References: <1459410944-43112-1-git-send-email-yunguo.wei@windriver.com>
Date: Thu, 31 Mar 2016 09:16:03 -0400
Message-ID: <CADkTA4M=sbkw1RPodczHFyQOG20HLLkdXWZyOo7Sja5jxxLspg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Yunguo Wei <yunguo.wei@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [V3][PATCH 0/1] libvirt: uprev to 1.3.2
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
X-List-Received-Date: Thu, 31 Mar 2016 13:16:08 -0000
Content-Type: multipart/alternative; boundary=001a113d5edc72e9cb052f581098

--001a113d5edc72e9cb052f581098
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2016 at 3:55 AM, Yunguo Wei <yunguo.wei@windriver.com>
wrote:

> V3 changes:
>
> Bring back the patch libvirt-use-pkg-config-to-locate-libcap.patch,
> which was dropped in V2 by mistake.
>
>
v3 is merged.

Bruce


> V2 changes:
>
> 1. use git "-M" option to generate patch for easy review.
>
> 2. Drop the patch
> 0001-Add-missing-split-to-properly-retrieve-cflags-and-ld.patch
> in V1 as the patch was actually fixing an issue introduced during
> rebasing 1.2.19 patches.
>
> 3. Rebase existing patches to make 2) happen.
> ---------------------------------------------
> commit c3e03a8f5d4c8dce3d4d4076b2be5cb9bb44a8b5
> Author: Yunguo Wei <yunguo.wei@windriver.com>
> Date:   Mon Mar 28 16:54:04 2016 +0800
>
>     libvirt: uprev to 1.3.2
>
>     Release notes here http://libvirt.org/news.html.
>
>     Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
>
>
> Added Files:
> ------------
>  .../libvirt-1.3.2/0001-to-fix-build-error.patch    |  46 ++++
>  recipes-extended/libvirt/libvirt_1.3.2.bb          | 287
> +++++++++++++++++++++
>
> Removed Files:
> --------------
>  .../libvirt-1.2.19/0001-to-fix-build-error.patch   |  44 ----
>  recipes-extended/libvirt/libvirt_1.2.19.bb         | 287
> ---------------------
>
> Remaining Changes (diffstat):
> -----------------------------
>  recipes-extended/libvirt/libvirt-python.inc        |   4 +-
>  ...vert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch |  52 +++-------
>  .../libvirt/libvirt/libvirt_api_xml_path.patch     |  14 +--
>  recipes-extended/libvirt/libvirt/runptest.patch    |   2 +-
>  ...ibvirt-net-rpc-to-virt-host-validate-when.patch | 107
> ++++++++-------------
>
> ---------------------------
> Test steps:
>
> t@SDP_Wildcat_Pass-1:/media# libvirtd -V
> libvirtd (libvirt) 1.3.2
> root@SDP_Wildcat_Pass-1:/media# systemctl status libvirtd
> =E2=97=8F libvirtd.service - Virtualization daemon
>    Loaded: loaded (/lib/systemd/system/libvirtd.service; enabled; vendor
> preset: enabled)
>    Active: active (running) since Thu 2016-03-31 03:43:57 UTC; 2s ago
>      Docs: man:libvirtd(8)
>            http://libvirt.org
>   Process: 2200 ExecStart=3D/usr/sbin/libvirtd $LIBVIRTD_ARGS
> (code=3Dexited, status=3D0/SUCCESS)
>  Main PID: 2202 (libvirtd)
>    CGroup: /system.slice/libvirtd.service
>            =E2=94=9C=E2=94=802026 /usr/bin/dnsmasq
> --conf-file=3D/var/lib/libvirt/dnsmasq/default.conf --leasefile-ro
> --dhcp-script=3D/usr/lib64/libvirt/libvirt_leaseshelper
>            =E2=94=9C=E2=94=802027 /usr/bin/dnsmasq
> --conf-file=3D/var/lib/libvirt/dnsmasq/default.conf --leasefile-ro
> --dhcp-script=3D/usr/lib64/libvirt/libvirt_leaseshelper
>            =E2=94=94=E2=94=802202 /usr/sbin/libvirtd --listen --daemon
>
> Mar 31 03:43:55 SDP_Wildcat_Pass-1 systemd[1]: Starting Virtualization
> daemon...
> Mar 31 03:43:57 SDP_Wildcat_Pass-1 libvirtd[2200]: 2016-03-31
> 03:43:57.284+0000: 2200: info : libvirt version: 1.3.2
> Mar 31 03:43:57 SDP_Wildcat_Pass-1 libvirtd[2200]: 2016-03-31
> 03:43:57.284+0000: 2200: info : hostname: SDP_Wildcat_Pass-1
> Mar 31 03:43:57 SDP_Wildcat_Pass-1 libvirtd[2200]: 2016-03-31
> 03:43:57.284+0000: 2200: warning : virGetHostnameImpl:703 : getaddrinfo
> failed for 'SD...ot known
> Mar 31 03:43:57 SDP_Wildcat_Pass-1 systemd[1]: Started Virtualization
> daemon.
> Mar 31 03:43:57 SDP_Wildcat_Pass-1 dnsmasq[2026]: read /etc/hosts - 6
> addresses
> Mar 31 03:43:57 SDP_Wildcat_Pass-1 dnsmasq[2026]: read
> /var/lib/libvirt/dnsmasq/default.addnhosts - 0 addresses
> Mar 31 03:43:57 SDP_Wildcat_Pass-1 dnsmasq-dhcp[2026]: read
> /var/lib/libvirt/dnsmasq/default.hostsfile
> Hint: Some lines were ellipsized, use -l to show in full.
>
> root@SDP_Wildcat_Pass-1:/media# cat test.xml
> <domain type=3D'kvm'>
>         <name>test</name>
>         <memory>2048000</memory>
>         <currentMemory>1024000</currentMemory>
>         <vcpu>1</vcpu>
>         <os>
>                 <type arch=3D'x86_64' machine=3D'pc'>hvm</type>
>                 <boot dev=3D'hd' />
>                 <kernel>/media/guest.kernel</kernel>
>                 <cmdline>root=3D/dev/vda2 selinux=3D0 enforcing=3D0
> console=3DttyS0 rw </cmdline>
>         </os>
>         <devices>
>                 <disk type=3D'file' device=3D'disk'>
>                         <source file=3D'/media/guest_70013.img' />
>                         <target dev=3D'vda' bus=3D'virtio'/>
>                 </disk>
>
>                 <serial type=3D'pty'>
>                         <target port=3D'0'/>
>                 </serial>
>                 <console type=3D'pty'>
>                         <target type=3D'serial' port=3D'0'/>
>                 </console>
>         </devices>
>         <devices>
>                 <memballoon model=3D'virtio'/>
>         </devices>
> </domain>
> root@SDP_Wildcat_Pass-1:/media# virsh define test.xml
> Domain test defined from test.xml
> root@SDP_Wildcat_Pass-1:/media# virsh start test
> Domain test started
>
> root@SDP_Wildcat_Pass-1:/media# virsh console test
> Connected to domain test
> Escape character is ^]
> EXT4-fs (vda2): re-mounted. Opts: (null)
> [  OK  ] Started Remount Root and Kernel File Systems.
> fuse init (API version 7.22)
>          Starting Create Static Device Nodes in /dev...
> [  OK  ] Started Load Kernel Modules.
>          Mounting FUSE Control File System...
>          Starting Apply Kernel Variables...
> [  OK  ] Mounted FUSE Control File System.
> [  OK  ] Started Apply Kernel Variables.
> [  OK  ] Started LSB: Set hostname based on /etc/hostname.
>          Starting (null)...
> [  OK  ] Started (null).
> [  OK  ] Started Create Static Device Nodes in /dev.
>          Starting udev Kernel Device Manager...
> [  OK  ] Reached target Local File Systems (Pre).
>          Mounting /mnt/huge...
> systemd-udevd[178]: starting version 216
>          Mounting /var/volatile...
> [  OK  ] Mounted /mnt/huge.
> [  OK  ] Started udev Kernel Device Manager.
> [  OK  ] Mounted /var/volatile.
>          Starting Load/Save Random Seed...
> [  OK  ] Started LVM activation.
> [  OK  ] Started Load/Save Random Seed.
> [  OK  ] Found device /dev/ttyS0.
> [  OK  ] Found device
> /dev/disk/by-uuid/c30d65b1-ac9c-4843-8ed0-1c572c45f411.
>          Starting File System Check on
> /dev/...1-ac9c-4843-8ed0-1c572c45f411...
> [  OK  ] Found device
> /dev/disk/by-uuid/dcb63b7b-29c5-46ca-bed4-561ddce91a10.
>          Activating swap
> /dev/disk/by-uuid/d...b-29c5-46ca-bed4-561ddce91a10...
> Adding 204796k swap on /dev/vda3.  Priority:-1 extents:1 across:204796k
> [  OK  ] Activated swap
> /dev/disk/by-uuid/dcb63b7b-29c5-46ca-bed4-561ddce91a10.
> [  OK  ] Reached target Swap.
> systemd-fsck[235]: /dev/vda1: recovering journal
> systemd-fsck[235]: /dev/vda1: clean, 251/128016 files, 260578/512000
> blocks
> [  OK  ] Started File System Check on
> /dev/d...5b1-ac9c-4843-8ed0-1c572c45f411.
>          Mounting /boot...
> EXT4-fs (vda1): mounted filesystem with ordered data mode. Opts: (null)
> [  OK  ] Mounted /boot.
> [  OK  ] Reached target Local File Systems.
>          Starting Trigger Flushing of Journal to Persistent Storage...
>          Starting Create Volatile Files and Directories...
> systemd-journald[131]: Received request to flush runtime journal from
> PID 1
> [  OK  ] Started Trigger Flushing of Journal to Persistent Storage.
> [  OK  ] Started Create Volatile Files and Directories.
> [  OK  ] Reached target System Time Synchronized.
>          Starting Security Auditing Service...
> systemd-journald[131]: File
> /var/log/journal/1a524f82242b49afb8353a2ab625087a/system.journal
> corrupted or uncleanly shut down, renaming and replacing.
> [  OK  ] Started Security Auditing Service.
>          Starting Update UTMP about System Boot/Shutdown...
> [  OK  ] Started Update UTMP about System Boot/Shutdown.
> [  OK  ] Reached target System Initialization.
> audit: type=3D1305 audit(1459395895.903:2): audit_pid=3D261 old=3D0
> auid=3D4294967295 ses=3D4294967295 res=3D1
> [  OK  ] Listening on CUPS Printing Service Sockets.
> [  OK  ] Listening on RPCbind Server Activation Socket.
> [  OK  ] Listening on Avahi mDNS/DNS-SD Stack Activation Socket.
> [  OK  ] Reached target Paths.
> [  OK  ] Listening on D-Bus System Message Bus Socket.
> [  OK  ] Reached target Timers.
>          Starting Restore Sound Card State...
> [  OK  ] Listening on sshd.socket.
> [  OK  ] Reached target Sockets.
> [  OK  ] Reached target Basic System.
>          Starting LSB: Raise network interfaces....
>          Starting Ethernet Bridge Filtering Tables...
>          Starting Dynamic Host Configuration Protocol (DHCP)...
> [  OK  ] Started Dynamic Host Configuration Protocol (DHCP).
>          Starting irqbalance daemon...
> [  OK  ] Started irqbalance daemon.
>          Starting GNU Zebra routing manager...
>          Starting Job spooling tools...
> [  OK  ] Started Job spooling tools.
>          Starting Avahi mDNS/DNS-SD Stack...
>          Starting System Logging Service...
>          Starting strongSwan IPsec...
> [  OK  ] Started strongSwan IPsec.
>          Starting ACPI Event Daemon...
>          Starting Periodic Command Scheduler...
> [  OK  ] Started Periodic Command Scheduler.
>          Starting Apply Cpu Microcode...
>          Starting Permit User Sessions...
>          Starting Login Service...
>          Starting D-Bus System Message Bus...
> [  OK  ] Started D-Bus System Message Bus.
> [  OK  ] Started Avahi mDNS/DNS-SD Stack.
>          Starting Network Service...
> [  OK  ] Started System Logging Service.
> [  OK  ] Started Restore Sound Card State.
> [FAILED] Failed to start LSB: Raise network interfaces..
> See 'systemctl status networking.service' for details.
> [  OK  ] Started Ethernet Bridge Filtering Tables.
> [  OK  ] Started ACPI Event Daemon.
> [  OK  ] Started Apply Cpu Microcode.
> [  OK  ] Started Permit User Sessions.
> [  OK  ] Started Login Service.
>          Starting (null)...
> NET: Registered protocol family 15
> [  OK  ] Started Network Service.
>          Starting Wait for Network to be Configured...
> Initializing XFRM netlink socket
> [  OK  ] Started (null).
> [  OK  ] Started GNU Zebra routing manager.
>          Starting IS-IS routing daemon...
> [  OK  ] Reached target Network.
>          Starting Simple Network Management Protocol (SNMP) Trap
> Daemon....
>          Starting Distccd A Distributed Compilation Server...
> [  OK  ] Started Distccd A Distributed Compilation Server.
>          Starting FreeRADIUS high performance RADIUS server....
>          Starting Xinetd A Powerful Replacement For Inetd...
>          Starting DNS forwarder and DHCP server...
>          Starting Postfix Mail Transport Agent...
>          Starting Vsftpd ftp daemon...
> [  OK  ] Started Vsftpd ftp daemon.
>          Starting Network Time Service...
>          Starting Berkeley Internet Name Domain (DNS)...
>          Starting The RPC portmapper...
>          Starting Collectd...
> [  OK  ] Started Collectd.
>          Starting HP Agentless Management Service daemon...
> [  OK  ] Started HP Agentless Management Service daemon.
>          Starting Check tcf-agent autostart...
>          Starting Simple Network Management Protocol (SNMP) Daemon....
>          Starting /etc/rc.local Compatibility...
>          Starting OSPF routing daemon...
>          Starting RIP routing daemon for IPv6...
>          Starting OSPF routing daemon for IPv6...
>          Starting Babel routing daemon...
>          Starting RIP routing daemon...
>          Starting BGP routing daemon...
> [  OK  ] Started IS-IS routing daemon.
> [  OK  ] Started Xinetd A Powerful Replacement For Inetd.
> [  OK  ] Started Network Time Service.
> [  OK  ] Started The RPC portmapper.
> [  OK  ] Started /etc/rc.local Compatibility.
>          Starting Serial Getty on ttyS0...
> [  OK  ] Started Serial Getty on ttyS0.
>          Starting Getty on tty1...
> [  OK  ] Started Getty on tty1.
> [  OK  ] Reached target Login Prompts.
> [  OK  ] Started Babel routing daemon.
> [  OK  ] Started RIP routing daemon for IPv6.
> [  OK  ] Started OSPF routing daemon for IPv6.
> [  OK  ] Started RIP routing daemon.
> [  OK  ] Started OSPF routing daemon.
> [  OK  ] Started DNS forwarder and DHCP server.
> [  OK  ] Started BGP routing daemon.
>
> tcf-agent: not configured to autostart, use /etc/cafe/tcf-agent.init
> force-start
> [  OK  ] Started Check tcf-agent autostart.
> systemd-journald[131]: File
> /var/log/journal/1a524f82242b49afb8353a2ab625087a/user-65534.journal
> corrupted or uncleanly shut down, renaming and replacing.
> [  OK  ] Started Simple Network Management Protocol (SNMP) Trap Daemon..
> [  OK  ] Started Simple Network Management Protocol (SNMP) Daemon..
> [  OK  ] Started Berkeley Internet Name Domain (DNS).
> [  OK  ] Reached target Host and Network Name Lookups.
> [  OK  ] Started Postfix Mail Transport Agent.
> [  OK  ] Started FreeRADIUS high performance RADIUS server..
>
> Wind River Linux CGP 7.0.0.13 cgp-70013 ttyS0
>
> cgp-70013 login: root
> Password:
> Last login: Tue Mar 29 04:21:57 EDT 2016 on ttyS0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113d5edc72e9cb052f581098
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Mar 31, 2016 at 3:55 AM, Yunguo Wei <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:yunguo.wei@windriver.com" target=3D"_blank">yunguo.wei@windriv=
er.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">V3 changes:<=
br>
<br>
Bring back the patch libvirt-use-pkg-config-to-locate-libcap.patch,<br>
which was dropped in V2 by mistake.<br>
<span class=3D""><br></span></blockquote><div><br></div><div>v3 is merged.<=
/div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><span class=3D"">
V2 changes:<br>
<br>
1. use git &quot;-M&quot; option to generate patch for easy review.<br>
<br>
2. Drop the patch<br>
0001-Add-missing-split-to-properly-retrieve-cflags-and-ld.patch<br>
in V1 as the patch was actually fixing an issue introduced during<br>
rebasing 1.2.19 patches.<br>
<br>
3. Rebase existing patches to make 2) happen.<br>
</span>---------------------------------------------<br>
commit c3e03a8f5d4c8dce3d4d4076b2be5cb9bb44a8b5<br>
<span class=3D"">Author: Yunguo Wei &lt;<a href=3D"mailto:yunguo.wei@windri=
ver.com">yunguo.wei@windriver.com</a>&gt;<br>
Date:=C2=A0 =C2=A0Mon Mar 28 16:54:04 2016 +0800<br>
<br>
=C2=A0 =C2=A0 libvirt: uprev to 1.3.2<br>
<br>
</span><span class=3D"">=C2=A0 =C2=A0 Release notes here <a href=3D"http://=
libvirt.org/news.html" rel=3D"noreferrer" target=3D"_blank">http://libvirt.=
org/news.html</a>.<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Yunguo Wei &lt;<a href=3D"mailto:yunguo.wei@wi=
ndriver.com">yunguo.wei@windriver.com</a>&gt;<br>
<br>
<br>
</span><span class=3D"">Added Files:<br>
------------<br>
=C2=A0.../libvirt-1.3.2/0001-to-fix-build-error.patch=C2=A0 =C2=A0 |=C2=A0 =
46 ++++<br>
</span>=C2=A0recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.2.bb" r=
el=3D"noreferrer" target=3D"_blank">libvirt_1.3.2.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 287 +++++++++++++++++++++<br>
<span class=3D""><br>
Removed Files:<br>
--------------<br>
=C2=A0.../libvirt-1.2.19/0001-to-fix-build-error.patch=C2=A0 =C2=A0|=C2=A0 =
44 ----<br>
=C2=A0recipes-extended/libvirt/<a href=3D"http://libvirt_1.2.19.bb" rel=3D"=
noreferrer" target=3D"_blank">libvirt_1.2.19.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 287 ---------------------<br>
<br>
Remaining Changes (diffstat):<br>
-----------------------------<br>
</span><span class=3D"">=C2=A0recipes-extended/libvirt/libvirt-python.inc=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0...vert-build-add-prefix-to-SYSTEMD_UNIT_DIR.patch |=C2=A0 52 +++----=
---<br>
=C2=A0.../libvirt/libvirt/libvirt_api_xml_path.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 14 +--<br>
=C2=A0recipes-extended/libvirt/libvirt/runptest.patch=C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...ibvirt-net-rpc-to-virt-host-validate-when.patch | 107 ++++++++----=
---------<br>
<br>
</span>---------------------------<br>
<div class=3D"HOEnZb"><div class=3D"h5">Test steps:<br>
<br>
t@SDP_Wildcat_Pass-1:/media# libvirtd -V<br>
libvirtd (libvirt) 1.3.2<br>
root@SDP_Wildcat_Pass-1:/media# systemctl status libvirtd<br>
=E2=97=8F libvirtd.service - Virtualization daemon<br>
=C2=A0 =C2=A0Loaded: loaded (/lib/systemd/system/libvirtd.service; enabled;=
 vendor<br>
preset: enabled)<br>
=C2=A0 =C2=A0Active: active (running) since Thu 2016-03-31 03:43:57 UTC; 2s=
 ago<br>
=C2=A0 =C2=A0 =C2=A0Docs: man:libvirtd(8)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://libvirt.org" rel=
=3D"noreferrer" target=3D"_blank">http://libvirt.org</a><br>
=C2=A0 Process: 2200 ExecStart=3D/usr/sbin/libvirtd $LIBVIRTD_ARGS<br>
(code=3Dexited, status=3D0/SUCCESS)<br>
=C2=A0Main PID: 2202 (libvirtd)<br>
=C2=A0 =C2=A0CGroup: /system.slice/libvirtd.service<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=94=9C=E2=94=802026 /usr/bin/dn=
smasq<br>
--conf-file=3D/var/lib/libvirt/dnsmasq/default.conf --leasefile-ro<br>
--dhcp-script=3D/usr/lib64/libvirt/libvirt_leaseshelper<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=94=9C=E2=94=802027 /usr/bin/dn=
smasq<br>
--conf-file=3D/var/lib/libvirt/dnsmasq/default.conf --leasefile-ro<br>
--dhcp-script=3D/usr/lib64/libvirt/libvirt_leaseshelper<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=94=94=E2=94=802202 /usr/sbin/l=
ibvirtd --listen --daemon<br>
<br>
Mar 31 03:43:55 SDP_Wildcat_Pass-1 systemd[1]: Starting Virtualization<br>
daemon...<br>
Mar 31 03:43:57 SDP_Wildcat_Pass-1 libvirtd[2200]: 2016-03-31<br>
03:43:57.284+0000: 2200: info : libvirt version: 1.3.2<br>
Mar 31 03:43:57 SDP_Wildcat_Pass-1 libvirtd[2200]: 2016-03-31<br>
03:43:57.284+0000: 2200: info : hostname: SDP_Wildcat_Pass-1<br>
Mar 31 03:43:57 SDP_Wildcat_Pass-1 libvirtd[2200]: 2016-03-31<br>
03:43:57.284+0000: 2200: warning : virGetHostnameImpl:703 : getaddrinfo<br>
failed for &#39;SD...ot known<br>
Mar 31 03:43:57 SDP_Wildcat_Pass-1 systemd[1]: Started Virtualization<br>
daemon.<br>
Mar 31 03:43:57 SDP_Wildcat_Pass-1 dnsmasq[2026]: read /etc/hosts - 6<br>
addresses<br>
Mar 31 03:43:57 SDP_Wildcat_Pass-1 dnsmasq[2026]: read<br>
/var/lib/libvirt/dnsmasq/default.addnhosts - 0 addresses<br>
Mar 31 03:43:57 SDP_Wildcat_Pass-1 dnsmasq-dhcp[2026]: read<br>
/var/lib/libvirt/dnsmasq/default.hostsfile<br>
Hint: Some lines were ellipsized, use -l to show in full.<br>
<br>
root@SDP_Wildcat_Pass-1:/media# cat test.xml<br>
&lt;domain type=3D&#39;kvm&#39;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;name&gt;test&lt;/name&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;memory&gt;2048000&lt;/memory&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;currentMemory&gt;1024000&lt;/currentMemory&=
gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;vcpu&gt;1&lt;/vcpu&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;os&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;type arch=3D&#3=
9;x86_64&#39; machine=3D&#39;pc&#39;&gt;hvm&lt;/type&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;boot dev=3D&#39=
;hd&#39; /&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;kernel&gt;/medi=
a/guest.kernel&lt;/kernel&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;cmdline&gt;root=
=3D/dev/vda2 selinux=3D0 enforcing=3D0<br>
console=3DttyS0 rw &lt;/cmdline&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/os&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;devices&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;disk type=3D&#3=
9;file&#39; device=3D&#39;disk&#39;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &lt;source file=3D&#39;/media/guest_70013.img&#39; /&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &lt;target dev=3D&#39;vda&#39; bus=3D&#39;virtio&#39;/&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/disk&gt;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;serial type=3D&=
#39;pty&#39;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &lt;target port=3D&#39;0&#39;/&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/serial&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;console type=3D=
&#39;pty&#39;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &lt;target type=3D&#39;serial&#39; port=3D&#39;0&#39;/&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/console&gt;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/devices&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;devices&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;memballoon mode=
l=3D&#39;virtio&#39;/&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/devices&gt;<br>
&lt;/domain&gt;<br>
root@SDP_Wildcat_Pass-1:/media# virsh define test.xml<br>
Domain test defined from test.xml<br>
root@SDP_Wildcat_Pass-1:/media# virsh start test<br>
Domain test started<br>
<br>
root@SDP_Wildcat_Pass-1:/media# virsh console test<br>
Connected to domain test<br>
Escape character is ^]<br>
EXT4-fs (vda2): re-mounted. Opts: (null)<br>
[=C2=A0 OK=C2=A0 ] Started Remount Root and Kernel File Systems.<br>
fuse init (API version 7.22)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Create Static Device Nodes in /d=
ev...<br>
[=C2=A0 OK=C2=A0 ] Started Load Kernel Modules.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mounting FUSE Control File System...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Apply Kernel Variables...<br>
[=C2=A0 OK=C2=A0 ] Mounted FUSE Control File System.<br>
[=C2=A0 OK=C2=A0 ] Started Apply Kernel Variables.<br>
[=C2=A0 OK=C2=A0 ] Started LSB: Set hostname based on /etc/hostname.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting (null)...<br>
[=C2=A0 OK=C2=A0 ] Started (null).<br>
[=C2=A0 OK=C2=A0 ] Started Create Static Device Nodes in /dev.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting udev Kernel Device Manager...<br=
>
[=C2=A0 OK=C2=A0 ] Reached target Local File Systems (Pre).<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mounting /mnt/huge...<br>
systemd-udevd[178]: starting version 216<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mounting /var/volatile...<br>
[=C2=A0 OK=C2=A0 ] Mounted /mnt/huge.<br>
[=C2=A0 OK=C2=A0 ] Started udev Kernel Device Manager.<br>
[=C2=A0 OK=C2=A0 ] Mounted /var/volatile.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Load/Save Random Seed...<br>
[=C2=A0 OK=C2=A0 ] Started LVM activation.<br>
[=C2=A0 OK=C2=A0 ] Started Load/Save Random Seed.<br>
[=C2=A0 OK=C2=A0 ] Found device /dev/ttyS0.<br>
[=C2=A0 OK=C2=A0 ] Found device<br>
/dev/disk/by-uuid/c30d65b1-ac9c-4843-8ed0-1c572c45f411.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting File System Check on<br>
/dev/...1-ac9c-4843-8ed0-1c572c45f411...<br>
[=C2=A0 OK=C2=A0 ] Found device<br>
/dev/disk/by-uuid/dcb63b7b-29c5-46ca-bed4-561ddce91a10.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Activating swap<br>
/dev/disk/by-uuid/d...b-29c5-46ca-bed4-561ddce91a10...<br>
Adding 204796k swap on /dev/vda3.=C2=A0 Priority:-1 extents:1 across:204796=
k<br>
[=C2=A0 OK=C2=A0 ] Activated swap<br>
/dev/disk/by-uuid/dcb63b7b-29c5-46ca-bed4-561ddce91a10.<br>
[=C2=A0 OK=C2=A0 ] Reached target Swap.<br>
systemd-fsck[235]: /dev/vda1: recovering journal<br>
systemd-fsck[235]: /dev/vda1: clean, 251/128016 files, 260578/512000<br>
blocks<br>
[=C2=A0 OK=C2=A0 ] Started File System Check on<br>
/dev/d...5b1-ac9c-4843-8ed0-1c572c45f411.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mounting /boot...<br>
EXT4-fs (vda1): mounted filesystem with ordered data mode. Opts: (null)<br>
[=C2=A0 OK=C2=A0 ] Mounted /boot.<br>
[=C2=A0 OK=C2=A0 ] Reached target Local File Systems.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Trigger Flushing of Journal to P=
ersistent Storage...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Create Volatile Files and Direct=
ories...<br>
systemd-journald[131]: Received request to flush runtime journal from<br>
PID 1<br>
[=C2=A0 OK=C2=A0 ] Started Trigger Flushing of Journal to Persistent Storag=
e.<br>
[=C2=A0 OK=C2=A0 ] Started Create Volatile Files and Directories.<br>
[=C2=A0 OK=C2=A0 ] Reached target System Time Synchronized.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Security Auditing Service...<br>
systemd-journald[131]: File<br>
/var/log/journal/1a524f82242b49afb8353a2ab625087a/system.journal<br>
corrupted or uncleanly shut down, renaming and replacing.<br>
[=C2=A0 OK=C2=A0 ] Started Security Auditing Service.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Update UTMP about System Boot/Sh=
utdown...<br>
[=C2=A0 OK=C2=A0 ] Started Update UTMP about System Boot/Shutdown.<br>
[=C2=A0 OK=C2=A0 ] Reached target System Initialization.<br>
audit: type=3D1305 audit(1459395895.903:2): audit_pid=3D261 old=3D0<br>
auid=3D4294967295 ses=3D4294967295 res=3D1<br>
[=C2=A0 OK=C2=A0 ] Listening on CUPS Printing Service Sockets.<br>
[=C2=A0 OK=C2=A0 ] Listening on RPCbind Server Activation Socket.<br>
[=C2=A0 OK=C2=A0 ] Listening on Avahi mDNS/DNS-SD Stack Activation Socket.<=
br>
[=C2=A0 OK=C2=A0 ] Reached target Paths.<br>
[=C2=A0 OK=C2=A0 ] Listening on D-Bus System Message Bus Socket.<br>
[=C2=A0 OK=C2=A0 ] Reached target Timers.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Restore Sound Card State...<br>
[=C2=A0 OK=C2=A0 ] Listening on sshd.socket.<br>
[=C2=A0 OK=C2=A0 ] Reached target Sockets.<br>
[=C2=A0 OK=C2=A0 ] Reached target Basic System.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting LSB: Raise network interfaces...=
.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Ethernet Bridge Filtering Tables=
...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Dynamic Host Configuration Proto=
col (DHCP)...<br>
[=C2=A0 OK=C2=A0 ] Started Dynamic Host Configuration Protocol (DHCP).<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting irqbalance daemon...<br>
[=C2=A0 OK=C2=A0 ] Started irqbalance daemon.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting GNU Zebra routing manager...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Job spooling tools...<br>
[=C2=A0 OK=C2=A0 ] Started Job spooling tools.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Avahi mDNS/DNS-SD Stack...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting System Logging Service...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting strongSwan IPsec...<br>
[=C2=A0 OK=C2=A0 ] Started strongSwan IPsec.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting ACPI Event Daemon...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Periodic Command Scheduler...<br=
>
[=C2=A0 OK=C2=A0 ] Started Periodic Command Scheduler.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Apply Cpu Microcode...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Permit User Sessions...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Login Service...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting D-Bus System Message Bus...<br>
[=C2=A0 OK=C2=A0 ] Started D-Bus System Message Bus.<br>
[=C2=A0 OK=C2=A0 ] Started Avahi mDNS/DNS-SD Stack.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Network Service...<br>
[=C2=A0 OK=C2=A0 ] Started System Logging Service.<br>
[=C2=A0 OK=C2=A0 ] Started Restore Sound Card State.<br>
[FAILED] Failed to start LSB: Raise network interfaces..<br>
See &#39;systemctl status networking.service&#39; for details.<br>
[=C2=A0 OK=C2=A0 ] Started Ethernet Bridge Filtering Tables.<br>
[=C2=A0 OK=C2=A0 ] Started ACPI Event Daemon.<br>
[=C2=A0 OK=C2=A0 ] Started Apply Cpu Microcode.<br>
[=C2=A0 OK=C2=A0 ] Started Permit User Sessions.<br>
[=C2=A0 OK=C2=A0 ] Started Login Service.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting (null)...<br>
NET: Registered protocol family 15<br>
[=C2=A0 OK=C2=A0 ] Started Network Service.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Wait for Network to be Configure=
d...<br>
Initializing XFRM netlink socket<br>
[=C2=A0 OK=C2=A0 ] Started (null).<br>
[=C2=A0 OK=C2=A0 ] Started GNU Zebra routing manager.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting IS-IS routing daemon...<br>
[=C2=A0 OK=C2=A0 ] Reached target Network.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Simple Network Management Protoc=
ol (SNMP) Trap<br>
Daemon....<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Distccd A Distributed Compilatio=
n Server...<br>
[=C2=A0 OK=C2=A0 ] Started Distccd A Distributed Compilation Server.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting FreeRADIUS high performance RADI=
US server....<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Xinetd A Powerful Replacement Fo=
r Inetd...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting DNS forwarder and DHCP server...=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Postfix Mail Transport Agent...<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Vsftpd ftp daemon...<br>
[=C2=A0 OK=C2=A0 ] Started Vsftpd ftp daemon.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Network Time Service...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Berkeley Internet Name Domain (D=
NS)...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting The RPC portmapper...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Collectd...<br>
[=C2=A0 OK=C2=A0 ] Started Collectd.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting HP Agentless Management Service =
daemon...<br>
[=C2=A0 OK=C2=A0 ] Started HP Agentless Management Service daemon.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Check tcf-agent autostart...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Simple Network Management Protoc=
ol (SNMP) Daemon....<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting /etc/rc.local Compatibility...<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting OSPF routing daemon...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting RIP routing daemon for IPv6...<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting OSPF routing daemon for IPv6...<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Babel routing daemon...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting RIP routing daemon...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting BGP routing daemon...<br>
[=C2=A0 OK=C2=A0 ] Started IS-IS routing daemon.<br>
[=C2=A0 OK=C2=A0 ] Started Xinetd A Powerful Replacement For Inetd.<br>
[=C2=A0 OK=C2=A0 ] Started Network Time Service.<br>
[=C2=A0 OK=C2=A0 ] Started The RPC portmapper.<br>
[=C2=A0 OK=C2=A0 ] Started /etc/rc.local Compatibility.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Serial Getty on ttyS0...<br>
[=C2=A0 OK=C2=A0 ] Started Serial Getty on ttyS0.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting Getty on tty1...<br>
[=C2=A0 OK=C2=A0 ] Started Getty on tty1.<br>
[=C2=A0 OK=C2=A0 ] Reached target Login Prompts.<br>
[=C2=A0 OK=C2=A0 ] Started Babel routing daemon.<br>
[=C2=A0 OK=C2=A0 ] Started RIP routing daemon for IPv6.<br>
[=C2=A0 OK=C2=A0 ] Started OSPF routing daemon for IPv6.<br>
[=C2=A0 OK=C2=A0 ] Started RIP routing daemon.<br>
[=C2=A0 OK=C2=A0 ] Started OSPF routing daemon.<br>
[=C2=A0 OK=C2=A0 ] Started DNS forwarder and DHCP server.<br>
[=C2=A0 OK=C2=A0 ] Started BGP routing daemon.<br>
<br>
tcf-agent: not configured to autostart, use /etc/cafe/tcf-agent.init<br>
force-start<br>
[=C2=A0 OK=C2=A0 ] Started Check tcf-agent autostart.<br>
systemd-journald[131]: File<br>
/var/log/journal/1a524f82242b49afb8353a2ab625087a/user-65534.journal<br>
corrupted or uncleanly shut down, renaming and replacing.<br>
[=C2=A0 OK=C2=A0 ] Started Simple Network Management Protocol (SNMP) Trap D=
aemon..<br>
[=C2=A0 OK=C2=A0 ] Started Simple Network Management Protocol (SNMP) Daemon=
..<br>
[=C2=A0 OK=C2=A0 ] Started Berkeley Internet Name Domain (DNS).<br>
[=C2=A0 OK=C2=A0 ] Reached target Host and Network Name Lookups.<br>
[=C2=A0 OK=C2=A0 ] Started Postfix Mail Transport Agent.<br>
[=C2=A0 OK=C2=A0 ] Started FreeRADIUS high performance RADIUS server..<br>
<br>
Wind River Linux CGP 7.0.0.13 cgp-70013 ttyS0<br>
<br>
cgp-70013 login: root<br>
Password:<br>
Last login: Tue Mar 29 04:21:57 EDT 2016 on ttyS0<br>
<br>
</div></div><div class=3D"HOEnZb"><div class=3D"h5">--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer=
, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a113d5edc72e9cb052f581098--
