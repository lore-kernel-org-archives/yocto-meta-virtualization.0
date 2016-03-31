Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 912F9E00C2D; Thu, 31 Mar 2016 06:15:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.214.169 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 94A12E00BBF
	for <meta-virtualization@yoctoproject.org>;
	Thu, 31 Mar 2016 06:15:43 -0700 (PDT)
Received: by mail-ob0-f169.google.com with SMTP id kf9so97647521obc.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 31 Mar 2016 06:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=wFqcRtO6WbLnj6ZKJ3sEHIgx4TsN6lqt06tey00Wroo=;
	b=01j6xDeHss58vPogKLYfTfWgY64PTIIgTgp4g1WucVqBR9BLc5REI2ArhUYsNK6pAn
	y/3DQCHrfbBKZvdP/ovSXLNHAJsro06lHdV/MY3ulhg+rAwPZWP45pH5YgPXfbdMj7as
	KhVvsqX+0uRrAY9ZkjKnrvWhJorJ/q7//P6RhqdU+2qsmY4QfFS/8gtFQ8rfYo3nOIKR
	YZGxpmNxXKUvtldvzPh4H7p2492AXdhoxPME/cVIFD0UQJpKj2wBVl9wy7ngbC31Ya4W
	l229DL/9kNO0oI9sekqnw88n4qoqv7RWsdh5Xym83J33T1TmMQQ0aUGL+JyPe1QArMz1
	YQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=wFqcRtO6WbLnj6ZKJ3sEHIgx4TsN6lqt06tey00Wroo=;
	b=Xqhd4d54mh/bwOpAY7MHNixAduDmzuO9cQFyjNZdgynV+wk0YlomaMUXb38RvHjCzy
	6Ht1loEQnlhSWyVNVmBaEdNMZ3pDVrQFlhQFbFKqeGc8oJAzaa8aFT2KG0J6X/Sq/UY9
	xk4OOl5Tj8d+LwNcOZUPvCW17KXAvd9oAMJEFp80iIh9M5GDYE/iPStADc0V4Gl2czwn
	VPYuoqbvBOkWA7AhYkaWHaxQRuro4Eqpyn/Fn9sk+PYHSw8oG0ocl+IIRnu7ceLvgAri
	WSdiubxpa889vdVE9G7EESGHCqHam+GHFRVvlvobHZCeogyV66y1kaS8po0uO9wgzFJZ
	2DJQ==
X-Gm-Message-State: AD7BkJKeDtDE+4LLecHGqFXRrjwo9A8fBt+6kSs7/yj955NG9xlKrUTkO/amK4ydh924KYTxbzMx/6JSFpkf/w==
MIME-Version: 1.0
X-Received: by 10.60.227.72 with SMTP id ry8mr8552708oec.49.1459430142777;
	Thu, 31 Mar 2016 06:15:42 -0700 (PDT)
Received: by 10.157.5.101 with HTTP; Thu, 31 Mar 2016 06:15:42 -0700 (PDT)
In-Reply-To: <cover.1459246648.git.zhe.he@windriver.com>
References: <cover.1459246648.git.zhe.he@windriver.com>
Date: Thu, 31 Mar 2016 09:15:42 -0400
Message-ID: <CADkTA4P9hGKy=bM5+BYnaecgWhtV8vSzBiNh4BZsrKFrueQ8vQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 0/1] openvswith: Uprev to latest version 2.5.0
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
X-List-Received-Date: Thu, 31 Mar 2016 13:15:46 -0000
Content-Type: multipart/alternative; boundary=001a1136ab063c2027052f580f37

--001a1136ab063c2027052f580f37
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 29, 2016 at 6:22 AM, <zhe.he@windriver.com> wrote:

> From: He Zhe <zhe.he@windriver.com>
>
> Test it as follow:
>
>
merged. There was a typo in the shortlog, but I fixed it as part of the
merge process.

Bruce


> --------------------------------
> host:
> root@genericx86-64:~# nohup qemu-system-x86_64 -nographic -k en-us -m 256
> -net nic,macaddr=1a:46:0b:ca:bc:7a,model=virtio -net
> tap,script=/etc/qemu-ifup1 -enable-kvm -kernel /boot/bzIma
> ge -append 'root=/dev/vda ro console=ttyS0' -drive
> file=/core-image-minimal-genericx86-64.ext4,cache=none,if=virtio -serial
> telnet::4443,server,nowait &
> [1] 384
> root@genericx86-64:~# nohup: ignoring input and appending output to
> 'nohup.out'
> device tap0 entered promiscuous mode
> device ovsbr0 left promiscuous mode
> device tap0 left promiscuous mode
> device ovsbr0 entered promiscuous mode
> device tap0 entered promiscuous mode
>
> root@genericx86-64:~# nohup qemu-system-x86_64 -nographic -k en-us -m 256
> -net nic,macaddr=1a:46:0b:ca:bc:7b,model=virtio -net
> tap,script=/etc/qemu-ifup2 -enable-kvm -kernel /boot/bzIma
> ge -append 'root=/dev/vda ro console=ttyS0' -drive
> file=/core-image-minimal-genericx86-64.ext4,cache=none,if=virtio -serial
> telnet::4444,server,nowait &
> [2] 413
> root@genericx86-64:~# nohup: ignoring input and appending output to
> 'nohup.out'
> device tap1 entered promiscuous mode
> kvm [384]: vcpu0 disabled perfctr wrmsr: 0xc2 data 0xffff
> kvm [413]: vcpu0 disabled perfctr wrmsr: 0xc2 data 0xffff
>
> root@genericx86-64:~# ifconfig
> eth0      Link encap:Ethernet  HWaddr 00:1A:A0:10:C3:B7
>           inet addr:128.224.165.55  Bcast:128.224.165.255
> Mask:255.255.255.0
>           inet6 addr: fe80::21a:a0ff:fe10:c3b7%119/64 Scope:Link
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:64658 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:24444 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:1000
>           RX bytes:87027867 (82.9 MiB)  TX bytes:4205887 (4.0 MiB)
>           Interrupt:17
>
> lo        Link encap:Local Loopback
>           inet addr:127.0.0.1  Mask:255.0.0.0
>           inet6 addr: ::1%119/128 Scope:Host
>           UP LOOPBACK RUNNING  MTU:65536  Metric:1
>           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:0
>           RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
>
> ovsbr0    Link encap:Ethernet  HWaddr 92:A2:85:64:6A:42
>           inet addr:192.168.1.1  Bcast:192.168.1.255  Mask:255.255.255.0
>           inet6 addr: fe80::90a2:85ff:fe64:6a42%119/64 Scope:Link
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:38 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:15 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:0
>           RX bytes:8776 (8.5 KiB)  TX bytes:1166 (1.1 KiB)
>
> tap0      Link encap:Ethernet  HWaddr E2:52:86:35:F8:FB
>           inet6 addr: fe80::e052:86ff:fe35:f8fb%119/64 Scope:Link
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:24 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:40 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:500
>           RX bytes:5088 (4.9 KiB)  TX bytes:6336 (6.1 KiB)
>
> tap1      Link encap:Ethernet  HWaddr FA:C3:63:45:40:A8
>
>                          [20/5517]
>           inet6 addr: fe80::f8c3:63ff:fe45:40a8%119/64 Scope:Link
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:25 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:34 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:500
>           RX bytes:5130 (5.0 KiB)  TX bytes:5820 (5.6 KiB)
>
> root@genericx86-64:~# ping 192.168.1.2
> PING 192.168.1.2 (192.168.1.2): 56 data bytes
> 64 bytes from 192.168.1.2: seq=0 ttl=64 time=0.533 ms
> 64 bytes from 192.168.1.2: seq=1 ttl=64 time=0.281 ms
> ^C
> --- 192.168.1.2 ping statistics ---
> 2 packets transmitted, 2 packets received, 0% packet loss
> round-trip min/avg/max = 0.281/0.407/0.533 ms
> root@genericx86-64:~# ping 192.168.1.3
> PING 192.168.1.3 (192.168.1.3): 56 data bytes
> 64 bytes from 192.168.1.3: seq=0 ttl=64 time=0.581 ms
> 64 bytes from 192.168.1.3: seq=1 ttl=64 time=0.258 ms
> ^C
> --- 192.168.1.3 ping statistics ---
> 2 packets transmitted, 2 packets received, 0% packet loss
> round-trip min/avg/max = 0.258/0.419/0.581 ms
> root@genericx86-64:~# cat /proc/net/arp
> IP address       HW type     Flags       HW address            Mask
>  Device
> 128.224.165.20   0x1         0x2         b8:ca:3a:f0:99:bf     *
> eth0
> 128.224.165.1    0x1         0x2         00:17:df:e5:ac:00     *
> eth0
> 192.168.1.2      0x1         0x2         1a:46:0b:ca:bc:7a     *
> ovsbr0
> 192.168.1.3      0x1         0x2         1a:46:0b:ca:bc:7b     *
> ovsbr0
> root@genericx86-64:~# ovs-vsctl show
> 5f6b161b-efb7-4de2-8db5-012a7cd1835e
>     Bridge "ovsbr0"
>         Port "tap1"
>             Interface "tap1"
>         Port "ovsbr0"
>             Interface "ovsbr0"
>                 type: internal
>         Port "tap0"
>             Interface "tap0"
>     ovs_version: "2.5.1"
> root@genericx86-64:~#
>
> --------------------------------
> guest1:
> telnet host-ip-address 4443
> root@genericx86-64:~# ifconfig eth0 192.168.1.2 up
> root@genericx86-64:~# ifconfig
> eth0      Link encap:Ethernet  HWaddr 1A:46:0B:CA:BC:7A
>           inet addr:192.168.1.2  Bcast:192.168.1.255  Mask:255.255.255.0
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:20 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:8 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:1000
>           RX bytes:3168 (3.0 KiB)  TX bytes:1980 (1.9 KiB)
>
> lo        Link encap:Local Loopback
>           inet addr:127.0.0.1  Mask:255.0.0.0
>           inet6 addr: ::1%119/128 Scope:Host
>           UP LOOPBACK RUNNING  MTU:65536  Metric:1
>           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:0
>           RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
>
> root@genericx86-64:~# ping 192.168.1.1
> PING 192.168.1.1 (192.168.1.1): 56 data bytes
> 64 bytes from 192.168.1.1: seq=0 ttl=64 time=6.018 ms
> 64 bytes from 192.168.1.1: seq=1 ttl=64 time=0.258 ms
> ^C
> --- 192.168.1.1 ping statistics ---
> 2 packets transmitted, 2 packets received, 0% packet loss
> round-trip min/avg/max = 0.258/3.138/6.018 ms
> root@genericx86-64:~# ping 192.168.1.3
> PING 192.168.1.3 (192.168.1.3): 56 data bytes
> 64 bytes from 192.168.1.3: seq=0 ttl=64 time=1.294 ms
> 64 bytes from 192.168.1.3: seq=1 ttl=64 time=0.459 ms
> ^C
> --- 192.168.1.3 ping statistics ---
> 2 packets transmitted, 2 packets received, 0% packet loss
> round-trip min/avg/max = 0.459/0.876/1.294 ms
> root@genericx86-64:~# cat /proc/net/arp
> IP address       HW type     Flags       HW address            Mask
>  Device
> 192.168.1.3      0x1         0x2         1a:46:0b:ca:bc:7b     *
> eth0
> 192.168.1.1      0x1         0x2         92:a2:85:64:6a:42     *
> eth0
>
> --------------------------------
> guest2:
> telnet host-ip-address 4444
> root@genericx86-64:~# ifconfig eth0 192.168.1.3 up
> root@genericx86-64:~# ifconfig
> eth0      Link encap:Ethernet  HWaddr 1A:46:0B:CA:BC:7B
>           inet addr:192.168.1.3  Bcast:192.168.1.255  Mask:255.255.255.0
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:15 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:8 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:1000
>           RX bytes:2790 (2.7 KiB)  TX bytes:1980 (1.9 KiB)
>
> lo        Link encap:Local Loopback
>           inet addr:127.0.0.1  Mask:255.0.0.0
>           inet6 addr: ::1%119/128 Scope:Host
>           UP LOOPBACK RUNNING  MTU:65536  Metric:1
>           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:0
>           RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
>
> root@genericx86-64:~# ping 192.168.1.1
> PING 192.168.1.1 (192.168.1.1): 56 data bytes
> 64 bytes from 192.168.1.1: seq=0 ttl=64 time=0.920 ms
> 64 bytes from 192.168.1.1: seq=1 ttl=64 time=0.286 ms
> ^C
> --- 192.168.1.1 ping statistics ---
> 2 packets transmitted, 2 packets received, 0% packet loss
> round-trip min/avg/max = 0.286/0.603/0.920 ms
> root@genericx86-64:~# ping 192.168.1.2
> PING 192.168.1.2 (192.168.1.2): 56 data bytes
> 64 bytes from 192.168.1.2: seq=0 ttl=64 time=0.566 ms
> 64 bytes from 192.168.1.2: seq=1 ttl=64 time=0.439 ms
> ^C
> --- 192.168.1.2 ping statistics ---
> 2 packets transmitted, 2 packets received, 0% packet loss
> round-trip min/avg/max = 0.439/0.502/0.566 ms
> root@genericx86-64:~# cat /proc/net/arp
> IP address       HW type     Flags       HW address            Mask
>  Device
> 192.168.1.2      0x1         0x2         1a:46:0b:ca:bc:7a     *
> eth0
> 192.168.1.1      0x1         0x2         92:a2:85:64:6a:42     *
> eth0
>
> He Zhe (1):
>   openvswith: Uprev to latest version 2.5.0
>
>  ...-8c0b419a0b9ac0141d6973dcc80306dfc6a83d31.patch | 69
> ++++++++++++++++++++++
>  ...-bb429e09f7783f1ba23ac0682ed9edf424f0cfbb.patch | 69
> ----------------------
>  recipes-networking/openvswitch/openvswitch_git.bb  |  8 +--
>  3 files changed, 73 insertions(+), 73 deletions(-)
>  create mode 100644
> recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-8c0b419a0b9ac0141d6973dcc80306dfc6a83d31.patch
>  delete mode 100644
> recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-bb429e09f7783f1ba23ac0682ed9edf424f0cfbb.patch
>
> --
> 2.0.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1136ab063c2027052f580f37
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Mar 29, 2016 at 6:22 AM,  <span dir=3D"ltr">&lt;<a href=3D"mail=
to:zhe.he@windriver.com" target=3D"_blank">zhe.he@windriver.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">From: He Zhe &lt;<a href=3D"ma=
ilto:zhe.he@windriver.com">zhe.he@windriver.com</a>&gt;<br>
<br>
Test it as follow:<br>
<br></blockquote><div><br></div><div>merged. There was a typo in the shortl=
og, but I fixed it as part of the merge process.</div><div><br></div><div>B=
ruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
--------------------------------<br>
host:<br>
root@genericx86-64:~# nohup qemu-system-x86_64 -nographic -k en-us -m 256 -=
net nic,macaddr=3D1a:46:0b:ca:bc:7a,model=3Dvirtio -net tap,script=3D/etc/q=
emu-ifup1 -enable-kvm -kernel /boot/bzIma<br>
ge -append &#39;root=3D/dev/vda ro console=3DttyS0&#39; -drive file=3D/core=
-image-minimal-genericx86-64.ext4,cache=3Dnone,if=3Dvirtio -serial telnet::=
4443,server,nowait &amp;<br>
[1] 384<br>
root@genericx86-64:~# nohup: ignoring input and appending output to &#39;no=
hup.out&#39;<br>
device tap0 entered promiscuous mode<br>
device ovsbr0 left promiscuous mode<br>
device tap0 left promiscuous mode<br>
device ovsbr0 entered promiscuous mode<br>
device tap0 entered promiscuous mode<br>
<br>
root@genericx86-64:~# nohup qemu-system-x86_64 -nographic -k en-us -m 256 -=
net nic,macaddr=3D1a:46:0b:ca:bc:7b,model=3Dvirtio -net tap,script=3D/etc/q=
emu-ifup2 -enable-kvm -kernel /boot/bzIma<br>
ge -append &#39;root=3D/dev/vda ro console=3DttyS0&#39; -drive file=3D/core=
-image-minimal-genericx86-64.ext4,cache=3Dnone,if=3Dvirtio -serial telnet::=
4444,server,nowait &amp;<br>
[2] 413<br>
root@genericx86-64:~# nohup: ignoring input and appending output to &#39;no=
hup.out&#39;<br>
device tap1 entered promiscuous mode<br>
kvm [384]: vcpu0 disabled perfctr wrmsr: 0xc2 data 0xffff<br>
kvm [413]: vcpu0 disabled perfctr wrmsr: 0xc2 data 0xffff<br>
<br>
root@genericx86-64:~# ifconfig<br>
eth0=C2=A0 =C2=A0 =C2=A0 Link encap:Ethernet=C2=A0 HWaddr 00:1A:A0:10:C3:B7=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet addr:128.224.165.55=C2=A0 Bcast:128=
.224.165.255=C2=A0 Mask:255.255.255.0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: fe80::21a:a0ff:fe10:c3b7%119=
/64 Scope:Link<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST RUNNING MULTICAST=C2=A0 MTU=
:1500=C2=A0 Metric:1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:64658 errors:0 dropped:0 over=
runs:0 frame:0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:24444 errors:0 dropped:0 over=
runs:0 carrier:0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:1000<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:87027867 (82.9 MiB)=C2=A0 TX by=
tes:4205887 (4.0 MiB)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Interrupt:17<br>
<br>
lo=C2=A0 =C2=A0 =C2=A0 =C2=A0 Link encap:Local Loopback<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet addr:127.0.0.1=C2=A0 Mask:255.0.0.0=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: ::1%119/128 Scope:Host<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP LOOPBACK RUNNING=C2=A0 MTU:65536=C2=
=A0 Metric:1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:0 errors:0 dropped:0 overruns=
:0 frame:0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:0 errors:0 dropped:0 overruns=
:0 carrier:0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0.0 B)=C2=A0 TX bytes:0 (0.0=
 B)<br>
<br>
ovsbr0=C2=A0 =C2=A0 Link encap:Ethernet=C2=A0 HWaddr 92:A2:85:64:6A:42<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet addr:192.168.1.1=C2=A0 Bcast:192.16=
8.1.255=C2=A0 Mask:255.255.255.0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: fe80::90a2:85ff:fe64:6a42%11=
9/64 Scope:Link<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST RUNNING MULTICAST=C2=A0 MTU=
:1500=C2=A0 Metric:1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:38 errors:0 dropped:0 overrun=
s:0 frame:0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:15 errors:0 dropped:0 overrun=
s:0 carrier:0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:8776 (8.5 KiB)=C2=A0 TX bytes:1=
166 (1.1 KiB)<br>
<br>
tap0=C2=A0 =C2=A0 =C2=A0 Link encap:Ethernet=C2=A0 HWaddr E2:52:86:35:F8:FB=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: fe80::e052:86ff:fe35:f8fb%11=
9/64 Scope:Link<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST RUNNING MULTICAST=C2=A0 MTU=
:1500=C2=A0 Metric:1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:24 errors:0 dropped:0 overrun=
s:0 frame:0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:40 errors:0 dropped:0 overrun=
s:0 carrier:0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:500<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:5088 (4.9 KiB)=C2=A0 TX bytes:6=
336 (6.1 KiB)<br>
<br>
tap1=C2=A0 =C2=A0 =C2=A0 Link encap:Ethernet=C2=A0 HWaddr FA:C3:63:45:40:A8=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[20/5517]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: fe80::f8c3:63ff:fe45:40a8%11=
9/64 Scope:Link<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST RUNNING MULTICAST=C2=A0 MTU=
:1500=C2=A0 Metric:1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:25 errors:0 dropped:0 overrun=
s:0 frame:0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:34 errors:0 dropped:0 overrun=
s:0 carrier:0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:500<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:5130 (5.0 KiB)=C2=A0 TX bytes:5=
820 (5.6 KiB)<br>
<br>
root@genericx86-64:~# ping 192.168.1.2<br>
PING 192.168.1.2 (192.168.1.2): 56 data bytes<br>
64 bytes from <a href=3D"http://192.168.1.2" rel=3D"noreferrer" target=3D"_=
blank">192.168.1.2</a>: seq=3D0 ttl=3D64 time=3D0.533 ms<br>
64 bytes from <a href=3D"http://192.168.1.2" rel=3D"noreferrer" target=3D"_=
blank">192.168.1.2</a>: seq=3D1 ttl=3D64 time=3D0.281 ms<br>
^C<br>
--- 192.168.1.2 ping statistics ---<br>
2 packets transmitted, 2 packets received, 0% packet loss<br>
round-trip min/avg/max =3D 0.281/0.407/0.533 ms<br>
root@genericx86-64:~# ping 192.168.1.3<br>
PING 192.168.1.3 (192.168.1.3): 56 data bytes<br>
64 bytes from <a href=3D"http://192.168.1.3" rel=3D"noreferrer" target=3D"_=
blank">192.168.1.3</a>: seq=3D0 ttl=3D64 time=3D0.581 ms<br>
64 bytes from <a href=3D"http://192.168.1.3" rel=3D"noreferrer" target=3D"_=
blank">192.168.1.3</a>: seq=3D1 ttl=3D64 time=3D0.258 ms<br>
^C<br>
--- 192.168.1.3 ping statistics ---<br>
2 packets transmitted, 2 packets received, 0% packet loss<br>
round-trip min/avg/max =3D 0.258/0.419/0.581 ms<br>
root@genericx86-64:~# cat /proc/net/arp<br>
IP address=C2=A0 =C2=A0 =C2=A0 =C2=A0HW type=C2=A0 =C2=A0 =C2=A0Flags=C2=A0=
 =C2=A0 =C2=A0 =C2=A0HW address=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Ma=
sk=C2=A0 =C2=A0 =C2=A0Device<br>
128.224.165.20=C2=A0 =C2=A00x1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x2=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0b8:ca:3a:f0:99:bf=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 eth0<br>
128.224.165.1=C2=A0 =C2=A0 0x1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x2=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A000:17:df:e5:ac:00=C2=A0 =C2=A0 =C2=A0*=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 eth0<br>
192.168.1.2=C2=A0 =C2=A0 =C2=A0 0x1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x2=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01a:46:0b:ca:bc:7a=C2=A0 =C2=A0 =C2=A0*=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 ovsbr0<br>
192.168.1.3=C2=A0 =C2=A0 =C2=A0 0x1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x2=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01a:46:0b:ca:bc:7b=C2=A0 =C2=A0 =C2=A0*=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 ovsbr0<br>
root@genericx86-64:~# ovs-vsctl show<br>
5f6b161b-efb7-4de2-8db5-012a7cd1835e<br>
=C2=A0 =C2=A0 Bridge &quot;ovsbr0&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Port &quot;tap1&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Interface &quot;tap1&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Port &quot;ovsbr0&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Interface &quot;ovsbr0&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type: internal<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Port &quot;tap0&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Interface &quot;tap0&quot;<br>
=C2=A0 =C2=A0 ovs_version: &quot;2.5.1&quot;<br>
root@genericx86-64:~#<br>
<br>
--------------------------------<br>
guest1:<br>
telnet host-ip-address 4443<br>
root@genericx86-64:~# ifconfig eth0 192.168.1.2 up<br>
root@genericx86-64:~# ifconfig<br>
eth0=C2=A0 =C2=A0 =C2=A0 Link encap:Ethernet=C2=A0 HWaddr 1A:46:0B:CA:BC:7A=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet addr:192.168.1.2=C2=A0 Bcast:192.16=
8.1.255=C2=A0 Mask:255.255.255.0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST RUNNING MULTICAST=C2=A0 MTU=
:1500=C2=A0 Metric:1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:20 errors:0 dropped:0 overrun=
s:0 frame:0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:8 errors:0 dropped:0 overruns=
:0 carrier:0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:1000<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:3168 (3.0 KiB)=C2=A0 TX bytes:1=
980 (1.9 KiB)<br>
<br>
lo=C2=A0 =C2=A0 =C2=A0 =C2=A0 Link encap:Local Loopback<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet addr:127.0.0.1=C2=A0 Mask:255.0.0.0=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: ::1%119/128 Scope:Host<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP LOOPBACK RUNNING=C2=A0 MTU:65536=C2=
=A0 Metric:1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:0 errors:0 dropped:0 overruns=
:0 frame:0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:0 errors:0 dropped:0 overruns=
:0 carrier:0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0.0 B)=C2=A0 TX bytes:0 (0.0=
 B)<br>
<br>
root@genericx86-64:~# ping 192.168.1.1<br>
PING 192.168.1.1 (192.168.1.1): 56 data bytes<br>
64 bytes from <a href=3D"http://192.168.1.1" rel=3D"noreferrer" target=3D"_=
blank">192.168.1.1</a>: seq=3D0 ttl=3D64 time=3D6.018 ms<br>
64 bytes from <a href=3D"http://192.168.1.1" rel=3D"noreferrer" target=3D"_=
blank">192.168.1.1</a>: seq=3D1 ttl=3D64 time=3D0.258 ms<br>
^C<br>
--- 192.168.1.1 ping statistics ---<br>
2 packets transmitted, 2 packets received, 0% packet loss<br>
round-trip min/avg/max =3D 0.258/3.138/6.018 ms<br>
root@genericx86-64:~# ping 192.168.1.3<br>
PING 192.168.1.3 (192.168.1.3): 56 data bytes<br>
64 bytes from <a href=3D"http://192.168.1.3" rel=3D"noreferrer" target=3D"_=
blank">192.168.1.3</a>: seq=3D0 ttl=3D64 time=3D1.294 ms<br>
64 bytes from <a href=3D"http://192.168.1.3" rel=3D"noreferrer" target=3D"_=
blank">192.168.1.3</a>: seq=3D1 ttl=3D64 time=3D0.459 ms<br>
^C<br>
--- 192.168.1.3 ping statistics ---<br>
2 packets transmitted, 2 packets received, 0% packet loss<br>
round-trip min/avg/max =3D 0.459/0.876/1.294 ms<br>
root@genericx86-64:~# cat /proc/net/arp<br>
IP address=C2=A0 =C2=A0 =C2=A0 =C2=A0HW type=C2=A0 =C2=A0 =C2=A0Flags=C2=A0=
 =C2=A0 =C2=A0 =C2=A0HW address=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Ma=
sk=C2=A0 =C2=A0 =C2=A0Device<br>
192.168.1.3=C2=A0 =C2=A0 =C2=A0 0x1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x2=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01a:46:0b:ca:bc:7b=C2=A0 =C2=A0 =C2=A0*=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 eth0<br>
192.168.1.1=C2=A0 =C2=A0 =C2=A0 0x1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x2=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A092:a2:85:64:6a:42=C2=A0 =C2=A0 =C2=A0*=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 eth0<br>
<br>
--------------------------------<br>
guest2:<br>
telnet host-ip-address 4444<br>
root@genericx86-64:~# ifconfig eth0 192.168.1.3 up<br>
root@genericx86-64:~# ifconfig<br>
eth0=C2=A0 =C2=A0 =C2=A0 Link encap:Ethernet=C2=A0 HWaddr 1A:46:0B:CA:BC:7B=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet addr:192.168.1.3=C2=A0 Bcast:192.16=
8.1.255=C2=A0 Mask:255.255.255.0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST RUNNING MULTICAST=C2=A0 MTU=
:1500=C2=A0 Metric:1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:15 errors:0 dropped:0 overrun=
s:0 frame:0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:8 errors:0 dropped:0 overruns=
:0 carrier:0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:1000<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:2790 (2.7 KiB)=C2=A0 TX bytes:1=
980 (1.9 KiB)<br>
<br>
lo=C2=A0 =C2=A0 =C2=A0 =C2=A0 Link encap:Local Loopback<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet addr:127.0.0.1=C2=A0 Mask:255.0.0.0=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: ::1%119/128 Scope:Host<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP LOOPBACK RUNNING=C2=A0 MTU:65536=C2=
=A0 Metric:1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:0 errors:0 dropped:0 overruns=
:0 frame:0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:0 errors:0 dropped:0 overruns=
:0 carrier:0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0.0 B)=C2=A0 TX bytes:0 (0.0=
 B)<br>
<br>
root@genericx86-64:~# ping 192.168.1.1<br>
PING 192.168.1.1 (192.168.1.1): 56 data bytes<br>
64 bytes from <a href=3D"http://192.168.1.1" rel=3D"noreferrer" target=3D"_=
blank">192.168.1.1</a>: seq=3D0 ttl=3D64 time=3D0.920 ms<br>
64 bytes from <a href=3D"http://192.168.1.1" rel=3D"noreferrer" target=3D"_=
blank">192.168.1.1</a>: seq=3D1 ttl=3D64 time=3D0.286 ms<br>
^C<br>
--- 192.168.1.1 ping statistics ---<br>
2 packets transmitted, 2 packets received, 0% packet loss<br>
round-trip min/avg/max =3D 0.286/0.603/0.920 ms<br>
root@genericx86-64:~# ping 192.168.1.2<br>
PING 192.168.1.2 (192.168.1.2): 56 data bytes<br>
64 bytes from <a href=3D"http://192.168.1.2" rel=3D"noreferrer" target=3D"_=
blank">192.168.1.2</a>: seq=3D0 ttl=3D64 time=3D0.566 ms<br>
64 bytes from <a href=3D"http://192.168.1.2" rel=3D"noreferrer" target=3D"_=
blank">192.168.1.2</a>: seq=3D1 ttl=3D64 time=3D0.439 ms<br>
^C<br>
--- 192.168.1.2 ping statistics ---<br>
2 packets transmitted, 2 packets received, 0% packet loss<br>
round-trip min/avg/max =3D 0.439/0.502/0.566 ms<br>
root@genericx86-64:~# cat /proc/net/arp<br>
IP address=C2=A0 =C2=A0 =C2=A0 =C2=A0HW type=C2=A0 =C2=A0 =C2=A0Flags=C2=A0=
 =C2=A0 =C2=A0 =C2=A0HW address=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Ma=
sk=C2=A0 =C2=A0 =C2=A0Device<br>
192.168.1.2=C2=A0 =C2=A0 =C2=A0 0x1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x2=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01a:46:0b:ca:bc:7a=C2=A0 =C2=A0 =C2=A0*=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 eth0<br>
192.168.1.1=C2=A0 =C2=A0 =C2=A0 0x1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x2=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A092:a2:85:64:6a:42=C2=A0 =C2=A0 =C2=A0*=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 eth0<br>
<br>
He Zhe (1):<br>
=C2=A0 openvswith: Uprev to latest version 2.5.0<br>
<br>
=C2=A0...-8c0b419a0b9ac0141d6973dcc80306dfc6a83d31.patch | 69 +++++++++++++=
+++++++++<br>
=C2=A0...-bb429e09f7783f1ba23ac0682ed9edf424f0cfbb.patch | 69 -------------=
---------<br>
=C2=A0recipes-networking/openvswitch/<a href=3D"http://openvswitch_git.bb" =
rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a>=C2=A0 |=C2=A0 8=
 +--<br>
=C2=A03 files changed, 73 insertions(+), 73 deletions(-)<br>
=C2=A0create mode 100644 recipes-networking/openvswitch/openvswitch-git/ope=
nvswitch-add-ptest-8c0b419a0b9ac0141d6973dcc80306dfc6a83d31.patch<br>
=C2=A0delete mode 100644 recipes-networking/openvswitch/openvswitch-git/ope=
nvswitch-add-ptest-bb429e09f7783f1ba23ac0682ed9edf424f0cfbb.patch<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.0.1<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a1136ab063c2027052f580f37--
