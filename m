Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DCC4DE00D28; Sun,  3 Jul 2016 21:30:48 -0700 (PDT)
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
	*      [209.85.220.178 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 41086E00CF2
	for <meta-virtualization@yoctoproject.org>;
	Sun,  3 Jul 2016 21:30:46 -0700 (PDT)
Received: by mail-qk0-f178.google.com with SMTP id t127so257586794qkf.1
	for <meta-virtualization@yoctoproject.org>;
	Sun, 03 Jul 2016 21:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=h4TP1yQSZcZm3ty4BKyra3hr8s30de//+8J9KjDXB9E=;
	b=gCS5sZzD2SjnKFM02SP+MsRyqmJhNMlL+xVIQGIGKB41s0TALE17651G6l1fA7VTNt
	45DXbfprmkUiCP5YSjdpa2kLER27u+fiM3mDBiXoZFj86DwFj69r01YblqSAmyHDm3q7
	GpJIFqTvqCeHyn83C8vdH91YHAvxTeUReCo2aZwALJJp+5dFUP93XCM7gXAnzg7iEnQF
	uT+r2vfF7GqKvDHMMuIhwNusnk+mAxZoLbiaLxAnTrMxlVRmln1gfAgRf0r21ajbHLte
	2b2Hg5ca4vgW/gAxcxCHkoo7s7ebkZziNUV9PqM5CKiLQ7l8OzG4EnzSa700W8mjUUNS
	ekLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=h4TP1yQSZcZm3ty4BKyra3hr8s30de//+8J9KjDXB9E=;
	b=HmiclOB99HPpuvttBeDzWKK6gUazEhaSb+v9xmubMxlG8rwT4qRE2xGgO+Ukhjd2E2
	4sHB4toHBtnnBDIuwDss6PQ1Cseuw0hkXsZWNf2bT6qH7oHSuI+ZBQxg/M0dc8VXUiep
	w7hkIFzlA1Y8mS5DmzgelugpAF89lBSR+0kFfOaZmFFc/Zge3JhTYQtMvQXUC8IT02VI
	WI+TFAYrggjvwuMnTg/EMRD8l6smkM/cvXAq5pHoqoJqv+ahQjGmrqOGSZfWvt3EDTO/
	4B5ZjJtUKtMseN3jwN4PQ0npg5nE6mPshIp0rh9iFW/09n/+KgAD35ZdFh4K/F+qq2OF
	vv0A==
X-Gm-Message-State: ALyK8tJdimW8HqVVh29djHjfyRHIRPVQXtbPWaz6ve3OMsguSFYqO/PVqNrXFvvM4fXMzirH/a3YhJ9Hmt3Iiw==
X-Received: by 10.55.23.25 with SMTP id i25mr13739157qkh.142.1467606646351;
	Sun, 03 Jul 2016 21:30:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.52.184 with HTTP; Sun, 3 Jul 2016 21:30:45 -0700 (PDT)
In-Reply-To: <E2C6389C-370A-4B0F-81EA-95D6F9F51BFE@gmail.com>
References: <E2C6389C-370A-4B0F-81EA-95D6F9F51BFE@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 4 Jul 2016 00:30:45 -0400
Message-ID: <CADkTA4PBi1cT2QqVeWr39vB2Zvu2i=A4tD7QF=fBGC4LvPW93A@mail.gmail.com>
To: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: docker: error creating default bridge network: package not installed
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
X-List-Received-Date: Mon, 04 Jul 2016 04:30:48 -0000
Content-Type: multipart/alternative; boundary=001a114596a8d36cbe0536c7cceb

--001a114596a8d36cbe0536c7cceb
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 30, 2016 at 11:39 PM, Jean-Francois Dagenais <
jeff.dagenais@gmail.com> wrote:

> Hi all,
>
> Ive managed to build docker into my image using meta-virtualization.
>
> Ive used the master branch (c4a1711dd31659b027c70c07e4ef6da98591ac95) on
> top of
> which I had to make tiny hacks to get it to compile with fido.
>
> So Im using linux-yocto_3.19.bbappend which I dug out of branch fido.
>
> When I run docker daemon log-level=debug, I get:
>
> DEBU[0000] /usr/sbin/iptables, [--wait --version]
> DEBU[0000] /usr/sbin/iptables, [--wait -t nat -D PREROUTING -m addrtype
> --dst-type LOCAL -j DOCKER]
> DEBU[0000] /usr/sbin/iptables, [--wait -t nat -D OUTPUT -m addrtype
> --dst-type LOCAL ! --dst 127.0.0.0/8 -j DOCKER]
> DEBU[0000] /usr/sbin/iptables, [--wait -t nat -D OUTPUT -m addrtype
> --dst-type LOCAL -j DOCKER]
> DEBU[0000] /usr/sbin/iptables, [--wait -t nat -D PREROUTING]
> DEBU[0000] /usr/sbin/iptables, [--wait -t nat -D OUTPUT]
> DEBU[0000] /usr/sbin/iptables, [--wait -t nat -F DOCKER]
> DEBU[0000] /usr/sbin/iptables, [--wait -t nat -X DOCKER]
> DEBU[0000] /usr/sbin/iptables, [--wait -t filter -F DOCKER]
> DEBU[0000] /usr/sbin/iptables, [--wait -t filter -X DOCKER]
> DEBU[0000] /usr/sbin/iptables, [--wait -t filter -F DOCKER-ISOLATION]
> DEBU[0000] /usr/sbin/iptables, [--wait -t filter -X DOCKER-ISOLATION]
> DEBU[0000] /usr/sbin/iptables, [--wait -t nat -n -L DOCKER]
> DEBU[0000] /usr/sbin/iptables, [--wait -t nat -N DOCKER]
> DEBU[0000] /usr/sbin/iptables, [--wait -t filter -n -L DOCKER]
> DEBU[0000] /usr/sbin/iptables, [--wait -t filter -N DOCKER]
> DEBU[0000] /usr/sbin/iptables, [--wait -t filter -n -L DOCKER-ISOLATION]
> DEBU[0000] /usr/sbin/iptables, [--wait -t filter -N DOCKER-ISOLATION]
> DEBU[0000] /usr/sbin/iptables, [--wait -t filter -C DOCKER-ISOLATION -j
> RETURN]
> DEBU[0000] /usr/sbin/iptables, [--wait -I DOCKER-ISOLATION -j RETURN]
> DEBU[0000] Registering ipam driver: "default"
> DEBU[0000] Registering ipam driver: "null"
> INFO[0000] Default bridge (docker0) is assigned with an IP address
> 172.17.0.0/16. Daemon option --bip can be used to set a preferred IP
> address
> DEBU[0000] Allocating IPv4 pools for network bridge
> (6eeb9cc6567681c6e7f78a2e529db97eaf129ec2acfc4c5568ef74df1d2c1cab)
> DEBU[0000] RequestPool(LocalDefault, 172.17.0.0/16, , map[], false)
> DEBU[0000] RequestAddress(LocalDefault/172.17.0.0/16, <nil>,
> map[RequestAddressType:com.docker.network.gateway])
> DEBU[0000] Failed to create bridge docker0 via netlink. Trying ioctl
> DEBU[0000] releasing IPv4 pools from network bridge
> (6eeb9cc6567681c6e7f78a2e529db97eaf129ec2acfc4c5568ef74df1d2c1cab)
> DEBU[0000] ReleaseAddress(LocalDefault/172.17.0.0/16, 172.17.0.1)
> DEBU[0000] ReleasePool(LocalDefault/172.17.0.0/16)
> DEBU[0000] Cleaning up old mountid : start.
> FATA[0000] Error starting daemon: Error initializing network controller:
> Error creating default "bridge" network: package not installed
>
> I am just guessing my kernel is missing something, so I ran [docker
> source]/contribs/check-config.sh against my kernel config and got MANY
> missing
> config items:
>
> # ./check-config.sh
> warning: /proc/config.gz does not exist, searching other paths for kernel
> config ...
> info: reading kernel config from /boot/config-3.19.8-yocto-standard ...
> Generally Necessary:
> - cgroup hierarchy: properly mounted [/sys/fs/cgroup]
> - CONFIG_NAMESPACES: enabled
> - CONFIG_NET_NS: enabled
> - CONFIG_PID_NS: enabled
> - CONFIG_IPC_NS: enabled
> - CONFIG_UTS_NS: enabled
> - CONFIG_DEVPTS_MULTIPLE_INSTANCES: enabled
> - CONFIG_CGROUPS: missing
> - CONFIG_CGROUP_CPUACCT: missing
> - CONFIG_CGROUP_DEVICE: missing
> - CONFIG_CGROUP_FREEZER: missing
> - CONFIG_CGROUP_SCHED: missing
> - CONFIG_CPUSETS: missing
> - CONFIG_MEMCG: missing
> - CONFIG_KEYS: enabled
> - CONFIG_MACVLAN: missing
> - CONFIG_VETH: missing
> - CONFIG_BRIDGE: missing
> - CONFIG_BRIDGE_NETFILTER: missing
> - CONFIG_NF_NAT_IPV4: enabled (as module)
> - CONFIG_IP_NF_FILTER: enabled (as module)
> - CONFIG_IP_NF_TARGET_MASQUERADE: enabled (as module)
> - CONFIG_NETFILTER_XT_MATCH_ADDRTYPE: missing
> - CONFIG_NETFILTER_XT_MATCH_CONNTRACK: enabled (as module)
> - CONFIG_NF_NAT: enabled (as module)
> - CONFIG_NF_NAT_NEEDED: enabled
> - CONFIG_POSIX_MQUEUE: enabled
>
> Optional Features:
> - CONFIG_USER_NS: enabled
> - CONFIG_SECCOMP: enabled
> - CONFIG_CGROUP_PIDS: missing
> - CONFIG_MEMCG_KMEM: missing
> - CONFIG_MEMCG_SWAP: missing
> - CONFIG_MEMCG_SWAP_ENABLED: missing
> - CONFIG_RESOURCE_COUNTERS: missing
> - CONFIG_BLK_CGROUP: missing
> - CONFIG_IOSCHED_CFQ: enabled
> - CONFIG_BLK_DEV_THROTTLING: missing
> - CONFIG_CGROUP_PERF: missing
> - CONFIG_CGROUP_HUGETLB: missing
> - CONFIG_NET_CLS_CGROUP: missing
> - CONFIG_CGROUP_NET_PRIO: missing
> - CONFIG_CFS_BANDWIDTH: missing
> - CONFIG_FAIR_GROUP_SCHED: missing
> - CONFIG_RT_GROUP_SCHED: missing
>
>
> My question is: why isnt all the generally necessary" items being added by
> the
> kernel config files (scc) mentioned in meta-virtualization's linux-yocto
> bbappend?
>


Most of those settings are covered in the core kernel type configurations,
and aren't
repeated in any docker specific configuration. If values are sprayed all
across the
meta data, it makes changing them and enforcing policy more difficult.

I run the docker check scripts across linux-yocto* periodically, and my
reports are
clean. So there's could be something up with the mixing of the new docker
and
the older fido bbappend, or simply that 3.19 didn't get much love.

Bruce


>
> Thanks for the help!
>
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

--001a114596a8d36cbe0536c7cceb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Jun 30, 2016 at 11:39 PM, Jean-Francois Dagenais <span dir=3D"l=
tr">&lt;<a href=3D"mailto:jeff.dagenais@gmail.com" target=3D"_blank">jeff.d=
agenais@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">H=
i all,<br>
<br>
Ive managed to build docker into my image using meta-virtualization.<br>
<br>
Ive used the master branch (c4a1711dd31659b027c70c07e4ef6da98591ac95) on to=
p of<br>
which I had to make tiny hacks to get it to compile with fido.<br>
<br>
So Im using linux-yocto_3.19.bbappend which I dug out of branch fido.<br>
<br>
When I run docker daemon log-level=3Ddebug, I get:<br>
<br>
DEBU[0000] /usr/sbin/iptables, [--wait --version]<br>
DEBU[0000] /usr/sbin/iptables, [--wait -t nat -D PREROUTING -m addrtype --d=
st-type LOCAL -j DOCKER]<br>
DEBU[0000] /usr/sbin/iptables, [--wait -t nat -D OUTPUT -m addrtype --dst-t=
ype LOCAL ! --dst <a href=3D"http://127.0.0.0/8" rel=3D"noreferrer" target=
=3D"_blank">127.0.0.0/8</a> -j DOCKER]<br>
DEBU[0000] /usr/sbin/iptables, [--wait -t nat -D OUTPUT -m addrtype --dst-t=
ype LOCAL -j DOCKER]<br>
DEBU[0000] /usr/sbin/iptables, [--wait -t nat -D PREROUTING]<br>
DEBU[0000] /usr/sbin/iptables, [--wait -t nat -D OUTPUT]<br>
DEBU[0000] /usr/sbin/iptables, [--wait -t nat -F DOCKER]<br>
DEBU[0000] /usr/sbin/iptables, [--wait -t nat -X DOCKER]<br>
DEBU[0000] /usr/sbin/iptables, [--wait -t filter -F DOCKER]<br>
DEBU[0000] /usr/sbin/iptables, [--wait -t filter -X DOCKER]<br>
DEBU[0000] /usr/sbin/iptables, [--wait -t filter -F DOCKER-ISOLATION]<br>
DEBU[0000] /usr/sbin/iptables, [--wait -t filter -X DOCKER-ISOLATION]<br>
DEBU[0000] /usr/sbin/iptables, [--wait -t nat -n -L DOCKER]<br>
DEBU[0000] /usr/sbin/iptables, [--wait -t nat -N DOCKER]<br>
DEBU[0000] /usr/sbin/iptables, [--wait -t filter -n -L DOCKER]<br>
DEBU[0000] /usr/sbin/iptables, [--wait -t filter -N DOCKER]<br>
DEBU[0000] /usr/sbin/iptables, [--wait -t filter -n -L DOCKER-ISOLATION]<br=
>
DEBU[0000] /usr/sbin/iptables, [--wait -t filter -N DOCKER-ISOLATION]<br>
DEBU[0000] /usr/sbin/iptables, [--wait -t filter -C DOCKER-ISOLATION -j RET=
URN]<br>
DEBU[0000] /usr/sbin/iptables, [--wait -I DOCKER-ISOLATION -j RETURN]<br>
DEBU[0000] Registering ipam driver: &quot;default&quot;<br>
DEBU[0000] Registering ipam driver: &quot;null&quot;<br>
INFO[0000] Default bridge (docker0) is assigned with an IP address <a href=
=3D"http://172.17.0.0/16" rel=3D"noreferrer" target=3D"_blank">172.17.0.0/1=
6</a>. Daemon option --bip can be used to set a preferred IP address<br>
DEBU[0000] Allocating IPv4 pools for network bridge (6eeb9cc6567681c6e7f78a=
2e529db97eaf129ec2acfc4c5568ef74df1d2c1cab)<br>
DEBU[0000] RequestPool(LocalDefault, <a href=3D"http://172.17.0.0/16" rel=
=3D"noreferrer" target=3D"_blank">172.17.0.0/16</a>, , map[], false)<br>
DEBU[0000] RequestAddress(LocalDefault/<a href=3D"http://172.17.0.0/16" rel=
=3D"noreferrer" target=3D"_blank">172.17.0.0/16</a>, &lt;nil&gt;, map[Reque=
stAddressType:com.docker.network.gateway])<br>
DEBU[0000] Failed to create bridge docker0 via netlink. Trying ioctl<br>
DEBU[0000] releasing IPv4 pools from network bridge (6eeb9cc6567681c6e7f78a=
2e529db97eaf129ec2acfc4c5568ef74df1d2c1cab)<br>
DEBU[0000] ReleaseAddress(LocalDefault/<a href=3D"http://172.17.0.0/16" rel=
=3D"noreferrer" target=3D"_blank">172.17.0.0/16</a>, 172.17.0.1)<br>
DEBU[0000] ReleasePool(LocalDefault/<a href=3D"http://172.17.0.0/16" rel=3D=
"noreferrer" target=3D"_blank">172.17.0.0/16</a>)<br>
DEBU[0000] Cleaning up old mountid : start.<br>
FATA[0000] Error starting daemon: Error initializing network controller: Er=
ror creating default &quot;bridge&quot; network: package not installed<br>
<br>
I am just guessing my kernel is missing something, so I ran [docker<br>
source]/contribs/check-config.sh against my kernel config and got MANY miss=
ing<br>
config items:<br>
<br>
# ./check-config.sh<br>
warning: /proc/config.gz does not exist, searching other paths for kernel c=
onfig ...<br>
info: reading kernel config from /boot/config-3.19.8-yocto-standard ...<br>
Generally Necessary:<br>
- cgroup hierarchy: properly mounted [/sys/fs/cgroup]<br>
- CONFIG_NAMESPACES: enabled<br>
- CONFIG_NET_NS: enabled<br>
- CONFIG_PID_NS: enabled<br>
- CONFIG_IPC_NS: enabled<br>
- CONFIG_UTS_NS: enabled<br>
- CONFIG_DEVPTS_MULTIPLE_INSTANCES: enabled<br>
- CONFIG_CGROUPS: missing<br>
- CONFIG_CGROUP_CPUACCT: missing<br>
- CONFIG_CGROUP_DEVICE: missing<br>
- CONFIG_CGROUP_FREEZER: missing<br>
- CONFIG_CGROUP_SCHED: missing<br>
- CONFIG_CPUSETS: missing<br>
- CONFIG_MEMCG: missing<br>
- CONFIG_KEYS: enabled<br>
- CONFIG_MACVLAN: missing<br>
- CONFIG_VETH: missing<br>
- CONFIG_BRIDGE: missing<br>
- CONFIG_BRIDGE_NETFILTER: missing<br>
- CONFIG_NF_NAT_IPV4: enabled (as module)<br>
- CONFIG_IP_NF_FILTER: enabled (as module)<br>
- CONFIG_IP_NF_TARGET_MASQUERADE: enabled (as module)<br>
- CONFIG_NETFILTER_XT_MATCH_ADDRTYPE: missing<br>
- CONFIG_NETFILTER_XT_MATCH_CONNTRACK: enabled (as module)<br>
- CONFIG_NF_NAT: enabled (as module)<br>
- CONFIG_NF_NAT_NEEDED: enabled<br>
- CONFIG_POSIX_MQUEUE: enabled<br>
<br>
Optional Features:<br>
- CONFIG_USER_NS: enabled<br>
- CONFIG_SECCOMP: enabled<br>
- CONFIG_CGROUP_PIDS: missing<br>
- CONFIG_MEMCG_KMEM: missing<br>
- CONFIG_MEMCG_SWAP: missing<br>
- CONFIG_MEMCG_SWAP_ENABLED: missing<br>
- CONFIG_RESOURCE_COUNTERS: missing<br>
- CONFIG_BLK_CGROUP: missing<br>
- CONFIG_IOSCHED_CFQ: enabled<br>
- CONFIG_BLK_DEV_THROTTLING: missing<br>
- CONFIG_CGROUP_PERF: missing<br>
- CONFIG_CGROUP_HUGETLB: missing<br>
- CONFIG_NET_CLS_CGROUP: missing<br>
- CONFIG_CGROUP_NET_PRIO: missing<br>
- CONFIG_CFS_BANDWIDTH: missing<br>
- CONFIG_FAIR_GROUP_SCHED: missing<br>
- CONFIG_RT_GROUP_SCHED: missing<br>
<br>
<br>
My question is: why isnt all the generally necessary&quot; items being adde=
d by the<br>
kernel config files (scc) mentioned in meta-virtualization&#39;s linux-yoct=
o<br>
bbappend?<br></blockquote><div><br></div><div><br></div><div>Most of those =
settings are covered in the core kernel type configurations, and aren&#39;t=
</div><div>repeated in any docker specific configuration. If values are spr=
ayed all across the</div><div>meta data, it makes changing them and enforci=
ng policy more difficult.</div><div><br></div><div>I run the docker check s=
cripts across linux-yocto* periodically, and my reports are</div><div>clean=
. So there&#39;s could be something up with the mixing of the new docker an=
d</div><div>the older fido bbappend, or simply that 3.19 didn&#39;t get muc=
h love.</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">
<br>
Thanks for the help!<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
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
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--001a114596a8d36cbe0536c7cceb--
