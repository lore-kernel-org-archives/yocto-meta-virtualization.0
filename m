Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5698BC433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 14:02:18 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.31952.1641823336673958566
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 10 Jan 2022 06:02:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NGpg8GDx;
 spf=pass (domain: gmail.com, ip: 209.85.208.54,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id i5so360253edf.9
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 10 Jan 2022 06:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vwldgmfWMjUTqZNpNQRP85yyn1HvZYXFoFEiCajHVQU=;
        b=NGpg8GDxppxTw75P9UpAIrrvGroxx+pZRlPeNhInvNy0mQY5wRURPVRQqqB7a/BKiO
         R0ieE80MpIlE4Qon5hpz5mRPYnNO07iAmbgeaRCGXGg4OveTWhe2Pu4g9MGgpPv4wZvu
         1uZQTuQKl1dO15q8YeLbGdvPvko52K6FEJz7KMxGrsarsoGTJmd9NJ+vFyi/vpMpnTc5
         r69nhN7gVq4fBRe2EHgxu4ZkBJRQHd0f6G/ZnxesflwpVEVC33x4TCRsj0GLa0HHaoJy
         LdLPo5W2p+OiiLNFbiQ0kpJt7Gwct+CtFx3xvIwyUmAT7EnbE6I92bnhAnYeV/JVMe7n
         dFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vwldgmfWMjUTqZNpNQRP85yyn1HvZYXFoFEiCajHVQU=;
        b=BpBiFfcbtkyQW2X896FDckEh8nCr3y5lmOR+KrCpMIfFf5Bx3Z4G+wWJeJKobt5br1
         G0ZsAYdmI5QXXJvkeCq4dcV6ywCEmGWDpR88Tucx0bIPAIlwDJkS7NqzW0xn5oDN6gOP
         qAt0qoaVSIfLZj1FmOJMqfUt5ne5oWg5G1qWY7unawxZDCGnuKSC+13KAjH/hs3ZQ052
         kPpi7EN3Zqbzuxx83oq/JmQ2FfCMet4+frXgSAw2RQ3x/J4vevxp0khcgpoKRlWutonw
         iGwxHiuJ9QtWNUkugXdl9DuYdrIG2jB5d92QoTa09zBb8ktzq/6v0PBEOsEBgcwV4beN
         wHEA==
X-Gm-Message-State: AOAM532tpvFjurnDVBd+dgzPYLiAdXR6oGUlSOYscEeROvcDa8wcX4ih
	tFLqETajaDck8V5Eu8Ahfy3swwcGJes4Q9K0Qu/4pkNAsZJOxg==
X-Google-Smtp-Source: 
 ABdhPJyse9bvQ8DRVuD/TSqkS/MnGXNlq+J2Zud+Q+9JN7mq4DMvO4S0diCfBcNIAxDYuRHd8uplh3HlCj+e3Yqny+g=
X-Received: by 2002:a17:907:b13:: with SMTP id
 h19mr6359767ejl.391.1641823334727;
 Mon, 10 Jan 2022 06:02:14 -0800 (PST)
MIME-Version: 1.0
References: <3P52.1641294716031699062.nFhN@lists.yoctoproject.org>
 <Groupsio.4.3P52.1641294716031699062.nFhN@lists.yoctoproject.org>
In-Reply-To: <Groupsio.4.3P52.1641294716031699062.nFhN@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 10 Jan 2022 09:02:03 -0500
Message-ID: 
 <CADkTA4Pv7B4+8eRNpZJEoBqZqv6ryxYN1hKBsZuZX6HD6dv=cw@mail.gmail.com>
Subject: Re: [meta-virtualization] Where is docker.cfg file in rocko?
 #meta-virtualization #yocto
To: thitgahamtonghop@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000a6824005d53ac811"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Jan 2022 14:02:18 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/6994

--000000000000a6824005d53ac811
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 5, 2022 at 4:46 AM <thitgahamtonghop@gmail.com> wrote:
>
> [Edited Message Follows]
>
> Hi,
> So I am having problem running docker image. When I run command: docker
run hello-world, this is the output:
>
> docker: Error response from daemon: failed to create endpoint
elastic_hypatia on network bridge: failed to add the host (vethf9c4250) <=>
sandbox (vethc439d7e) pair interfaces: operation not supported.
> ERRO[0000] error waiting for container: context canceled
>
> So I suspect that the veth module is missing and as checking, I ran the
check-config.sh script, and here is what I get
>
>
> info: reading kernel config from /proc/config.gz ...
>
> Generally Necessary:
> - check-config.sh: line 159: [: missing `]'
> check-config.sh: line 160: /sys/fs/cgroup/memory: Is a directory
> cgroup hierarchy: single mountpoint! [/sys/fs/cgroup/memory]
>     (see https://github.com/tianon/cgroupfs-mount)
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
>
> Optional Features:
> - CONFIG_USER_NS: enabled
> - CONFIG_SECCOMP: enabled
> - CONFIG_CGROUP_PIDS: missing
> - CONFIG_MEMCG_SWAP: enabled
> - CONFIG_MEMCG_SWAP_ENABLED: enabled
>     (cgroup swap accounting is currently enabled)
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
>     (enable these ext3 configs if you are using ext3 as backing
filesystem)
> - CONFIG_EXT4_FS: enabled
> - CONFIG_EXT4_FS_POSIX_ACL: enabled
> - CONFIG_EXT4_FS_SECURITY: enabled
> - Network Drivers:
>   - "overlay":
>     - CONFIG_VXLAN: missing
>       Optional (for encrypted networks):
>       - CONFIG_CRYPTO: enabled
>       - CONFIG_CRYPTO_AEAD: enabled
>       - CONFIG_CRYPTO_GCM: enabled (as module)
>       - CONFIG_CRYPTO_SEQIV: enabled (as module)
>       - CONFIG_CRYPTO_GHASH: enabled (as module)
>       - CONFIG_XFRM: enabled
>       - CONFIG_XFRM_USER: enabled (as module)
>       - CONFIG_XFRM_ALGO: enabled
>       - CONFIG_INET_ESP: enabled (as module)
>       - CONFIG_INET_XFRM_MODE_TRANSPORT: enabled
>   - "ipvlan":
>     - CONFIG_IPVLAN: missing
>   - "macvlan":
>     - CONFIG_MACVLAN: missing
>     - CONFIG_DUMMY: enabled (as module)
>   - "ftp,tftp client in container":
>     - CONFIG_NF_NAT_FTP: enabled (as module)
>     - CONFIG_NF_CONNTRACK_FTP: enabled (as module)
>     - CONFIG_NF_NAT_TFTP: enabled (as module)
>     - CONFIG_NF_CONNTRACK_TFTP: enabled (as module)
> - Storage Drivers:
>   - "aufs":
>     - CONFIG_AUFS_FS: enabled
>   - "btrfs":
>     - CONFIG_BTRFS_FS: enabled
>     - CONFIG_BTRFS_FS_POSIX_ACL: enabled
>   - "devicemapper":
>     - CONFIG_BLK_DEV_DM: enabled
>     - CONFIG_DM_THIN_PROVISIONING: missing
>   - "overlay":
>     - CONFIG_OVERLAY_FS: missing
>   - "zfs":
>     - /dev/zfs: missing
>     - zfs command: missing
>     - zpool command: missing
>
> Limits:
> - /proc/sys/kernel/keys/root_maxkeys: 1000000
>
> Even running modprobe veth showing that veth is not there:
>
> modprobe: FATAL: Module veth not found in directory
/lib/modules/4.4.113-yocto-standard
>
> And here is the output of lxc-checkconfig
>
> --- Namespaces ---
> Namespaces: enabled
> Utsname namespace: enabled
> Ipc namespace: enabled
> Pid namespace: enabled
> User namespace: enabled
> Network namespace: enabled
> Multiple /dev/pts instances: missing
>
> --- Control groups ---
> Cgroup: enabled
> Cgroup clone_children flag: enabled
> Cgroup device: enabled
> Cgroup sched: enabled
> Cgroup cpu account: enabled
> Cgroup memory controller: enabled
> Cgroup cpuset: enabled
>
> --- Misc ---
> Veth pair device: missing
> Macvlan: missing
> Vlan: enabled
> Bridges: enabled
> Advanced netfilter: enabled
> CONFIG_NF_NAT_IPV4: enabled
> CONFIG_NF_NAT_IPV6: missing
> CONFIG_IP_NF_TARGET_MASQUERADE: missing
> CONFIG_IP6_NF_TARGET_MASQUERADE: missing
> CONFIG_NETFILTER_XT_TARGET_CHECKSUM: missing
> FUSE (for use with lxcfs): enabled
>
> --- Checkpoint/Restore ---
> checkpoint restore: missing
> CONFIG_FHANDLE: enabled
> CONFIG_EVENTFD: enabled
> CONFIG_EPOLL: enabled
> CONFIG_UNIX_DIAG: missing
> CONFIG_INET_DIAG: enabled
> CONFIG_PACKET_DIAG: missing
> CONFIG_NETLINK_DIAG: missing
> File capabilities: enabled
>
> Note : Before booting a new kernel, you can check its configuration
> usage : CONFIG=/path/to/config /usr/bin/lxc-checkconfig
>
> After going around the internet, I found out that somebody had the same
issue with me: https://marc.info/?l=openembedded-devel&m=154773496216135&w=2,
and they also think that veth missing is the problem. And as suggestion, I
added in my local.conf:
> CORE_IMAGE_EXTRA_INSTALL += "kernel-modules docker"
> But they also mentioned the actual solution is :
>
> I found the issue.  The veth kernel parameter was not enabled.  Once I
added
> CONFIG_VETH=y to my docker.cfg file, I was able to successfully run a
> docker container in my openembedded OS
>
> So where could I do the same? I've used the rocko version and it doesn't
have the linux/docker.cfg file? Or could I can create one by myself?
>
> P/S:
> I found in meta-virtualization/recipes-kernel/linux/linux-yocto/ the file
docker.cfg, but there is no option as CONFIG_VETH, but in the file lxc.cfg,
it exists and already 'y'. I don't really know what needed to actually used
this. Why the veth module is not appeared?
>

Correct. Similar fragments did exist in the rocko timeframe, but if you are
looking for docker support .. a newer (and supported) release is highly
recommended.

Using the fragments depends on your kernel provider.

If it is linux yocto, then there is a .inc file in the layer that is
enabled whenever virtualization is in the DISTRO_FEATURES. That .inc file
adds the fragments to the linux-yocto SRC_URI, and the options will be
enabled (
https://git.yoctoproject.org/meta-virtualization/tree/recipes-kernel/linux/linux-yocto_virtualization.inc?h=rocko
)

If your kernel provider is linux-yocto based (i.e. it supports fragments),
then you could individually add the fragments via KERNEL_FEATURES (check
the yocto docs for details).

And finally, if you do have CONFIG_VETH enabled as a module (versus built
in), you'd also need to make sure the specific kernel module package is
installed to your image, or all modules are installed (via the
kernel-modules package that you have mentioned above).

Bruce



> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6990):
https://lists.yoctoproject.org/g/meta-virtualization/message/6990
> Mute This Topic: https://lists.yoctoproject.org/mt/88187835/1050810
> Mute #yocto:
https://lists.yoctoproject.org/g/meta-virtualization/mutehashtag/yocto
> Mute #meta-virtualization:
https://lists.yoctoproject.org/g/meta-virtualization/mutehashtag/meta-virtualization
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000a6824005d53ac811
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Wed, Jan 5, 2022 at 4:46 AM &lt;<a href=3D"mail=
to:thitgahamtonghop@gmail.com">thitgahamtonghop@gmail.com</a>&gt; wrote:<br=
>&gt;<br>&gt; [Edited Message Follows]<br>&gt;<br>&gt; Hi,<br>&gt; So I am =
having problem running docker image. When I run command: docker run hello-w=
orld, this is the output:<br>&gt;<br>&gt; docker: Error response from daemo=
n: failed to create endpoint elastic_hypatia on network bridge: failed to a=
dd the host (vethf9c4250) &lt;=3D&gt; sandbox (vethc439d7e) pair interfaces=
: operation not supported.<br>&gt; ERRO[0000] error waiting for container: =
context canceled<br>&gt;<br>&gt; So I suspect that the veth module is missi=
ng and as checking, I ran the check-config.sh script, and here is what I ge=
t<br>&gt;<br>&gt; =C2=A0<br>&gt; info: reading kernel config from /proc/con=
fig.gz ...<br>&gt; =C2=A0<br>&gt; Generally Necessary:<br>&gt; - check-conf=
ig.sh: line 159: [: missing `]&#39;<br>&gt; check-config.sh: line 160: /sys=
/fs/cgroup/memory: Is a directory<br>&gt; cgroup hierarchy: single mountpoi=
nt! [/sys/fs/cgroup/memory]<br>&gt; =C2=A0 =C2=A0 (see <a href=3D"https://g=
ithub.com/tianon/cgroupfs-mount">https://github.com/tianon/cgroupfs-mount</=
a>)<br>&gt; - CONFIG_NAMESPACES: enabled<br>&gt; - CONFIG_NET_NS: enabled<b=
r>&gt; - CONFIG_PID_NS: enabled<br>&gt; - CONFIG_IPC_NS: enabled<br>&gt; - =
CONFIG_UTS_NS: enabled<br>&gt; - CONFIG_CGROUPS: enabled<br>&gt; - CONFIG_C=
GROUP_CPUACCT: enabled<br>&gt; - CONFIG_CGROUP_DEVICE: enabled<br>&gt; - CO=
NFIG_CGROUP_FREEZER: enabled<br>&gt; - CONFIG_CGROUP_SCHED: enabled<br>&gt;=
 - CONFIG_CPUSETS: enabled<br>&gt; - CONFIG_MEMCG: enabled<br>&gt; - CONFIG=
_KEYS: enabled<br>&gt; - CONFIG_VETH: missing<br>&gt; - CONFIG_BRIDGE: enab=
led (as module)<br>&gt; - CONFIG_BRIDGE_NETFILTER: enabled (as module)<br>&=
gt; - CONFIG_NF_NAT_IPV4: enabled (as module)<br>&gt; - CONFIG_IP_NF_FILTER=
: enabled (as module)<br>&gt; - CONFIG_IP_NF_TARGET_MASQUERADE: missing<br>=
&gt; - CONFIG_NETFILTER_XT_MATCH_ADDRTYPE: missing<br>&gt; - CONFIG_NETFILT=
ER_XT_MATCH_CONNTRACK: enabled (as module)<br>&gt; - CONFIG_NETFILTER_XT_MA=
TCH_IPVS: missing<br>&gt; - CONFIG_IP_NF_NAT: missing<br>&gt; - CONFIG_NF_N=
AT: enabled (as module)<br>&gt; - CONFIG_NF_NAT_NEEDED: enabled<br>&gt; - C=
ONFIG_POSIX_MQUEUE: enabled<br>&gt; - CONFIG_DEVPTS_MULTIPLE_INSTANCES: mis=
sing<br>&gt; =C2=A0<br>&gt; Optional Features:<br>&gt; - CONFIG_USER_NS: en=
abled<br>&gt; - CONFIG_SECCOMP: enabled<br>&gt; - CONFIG_CGROUP_PIDS: missi=
ng<br>&gt; - CONFIG_MEMCG_SWAP: enabled<br>&gt; - CONFIG_MEMCG_SWAP_ENABLED=
: enabled<br>&gt; =C2=A0 =C2=A0 (cgroup swap accounting is currently enable=
d)<br>&gt; - CONFIG_LEGACY_VSYSCALL_EMULATE: enabled<br>&gt; - CONFIG_MEMCG=
_KMEM: enabled<br>&gt; - CONFIG_BLK_CGROUP: enabled<br>&gt; - CONFIG_BLK_DE=
V_THROTTLING: missing<br>&gt; - CONFIG_IOSCHED_CFQ: enabled<br>&gt; - CONFI=
G_CFQ_GROUP_IOSCHED: missing<br>&gt; - CONFIG_CGROUP_PERF: missing<br>&gt; =
- CONFIG_CGROUP_HUGETLB: missing<br>&gt; - CONFIG_NET_CLS_CGROUP: enabled<b=
r>&gt; - CONFIG_CGROUP_NET_PRIO: missing<br>&gt; - CONFIG_CFS_BANDWIDTH: mi=
ssing<br>&gt; - CONFIG_FAIR_GROUP_SCHED: enabled<br>&gt; - CONFIG_RT_GROUP_=
SCHED: enabled<br>&gt; - CONFIG_IP_VS: missing<br>&gt; - CONFIG_IP_VS_NFCT:=
 missing<br>&gt; - CONFIG_IP_VS_RR: missing<br>&gt; - CONFIG_EXT3_FS: enabl=
ed<br>&gt; - CONFIG_EXT3_FS_XATTR: missing<br>&gt; - CONFIG_EXT3_FS_POSIX_A=
CL: enabled<br>&gt; - CONFIG_EXT3_FS_SECURITY: enabled<br>&gt; =C2=A0 =C2=
=A0 (enable these ext3 configs if you are using ext3 as backing filesystem)=
<br>&gt; - CONFIG_EXT4_FS: enabled<br>&gt; - CONFIG_EXT4_FS_POSIX_ACL: enab=
led<br>&gt; - CONFIG_EXT4_FS_SECURITY: enabled<br>&gt; - Network Drivers:<b=
r>&gt; =C2=A0 - &quot;overlay&quot;:<br>&gt; =C2=A0 =C2=A0 - CONFIG_VXLAN: =
missing<br>&gt; =C2=A0 =C2=A0 =C2=A0 Optional (for encrypted networks):<br>=
&gt; =C2=A0 =C2=A0 =C2=A0 - CONFIG_CRYPTO: enabled<br>&gt; =C2=A0 =C2=A0 =
=C2=A0 - CONFIG_CRYPTO_AEAD: enabled<br>&gt; =C2=A0 =C2=A0 =C2=A0 - CONFIG_=
CRYPTO_GCM: enabled (as module)<br>&gt; =C2=A0 =C2=A0 =C2=A0 - CONFIG_CRYPT=
O_SEQIV: enabled (as module)<br>&gt; =C2=A0 =C2=A0 =C2=A0 - CONFIG_CRYPTO_G=
HASH: enabled (as module)<br>&gt; =C2=A0 =C2=A0 =C2=A0 - CONFIG_XFRM: enabl=
ed<br>&gt; =C2=A0 =C2=A0 =C2=A0 - CONFIG_XFRM_USER: enabled (as module)<br>=
&gt; =C2=A0 =C2=A0 =C2=A0 - CONFIG_XFRM_ALGO: enabled<br>&gt; =C2=A0 =C2=A0=
 =C2=A0 - CONFIG_INET_ESP: enabled (as module)<br>&gt; =C2=A0 =C2=A0 =C2=A0=
 - CONFIG_INET_XFRM_MODE_TRANSPORT: enabled<br>&gt; =C2=A0 - &quot;ipvlan&q=
uot;:<br>&gt; =C2=A0 =C2=A0 - CONFIG_IPVLAN: missing<br>&gt; =C2=A0 - &quot=
;macvlan&quot;:<br>&gt; =C2=A0 =C2=A0 - CONFIG_MACVLAN: missing<br>&gt; =C2=
=A0 =C2=A0 - CONFIG_DUMMY: enabled (as module)<br>&gt; =C2=A0 - &quot;ftp,t=
ftp client in container&quot;:<br>&gt; =C2=A0 =C2=A0 - CONFIG_NF_NAT_FTP: e=
nabled (as module)<br>&gt; =C2=A0 =C2=A0 - CONFIG_NF_CONNTRACK_FTP: enabled=
 (as module)<br>&gt; =C2=A0 =C2=A0 - CONFIG_NF_NAT_TFTP: enabled (as module=
)<br>&gt; =C2=A0 =C2=A0 - CONFIG_NF_CONNTRACK_TFTP: enabled (as module)<br>=
&gt; - Storage Drivers:<br>&gt; =C2=A0 - &quot;aufs&quot;:<br>&gt; =C2=A0 =
=C2=A0 - CONFIG_AUFS_FS: enabled<br>&gt; =C2=A0 - &quot;btrfs&quot;:<br>&gt=
; =C2=A0 =C2=A0 - CONFIG_BTRFS_FS: enabled<br>&gt; =C2=A0 =C2=A0 - CONFIG_B=
TRFS_FS_POSIX_ACL: enabled<br>&gt; =C2=A0 - &quot;devicemapper&quot;:<br>&g=
t; =C2=A0 =C2=A0 - CONFIG_BLK_DEV_DM: enabled<br>&gt; =C2=A0 =C2=A0 - CONFI=
G_DM_THIN_PROVISIONING: missing<br>&gt; =C2=A0 - &quot;overlay&quot;:<br>&g=
t; =C2=A0 =C2=A0 - CONFIG_OVERLAY_FS: missing<br>&gt; =C2=A0 - &quot;zfs&qu=
ot;:<br>&gt; =C2=A0 =C2=A0 - /dev/zfs: missing<br>&gt; =C2=A0 =C2=A0 - zfs =
command: missing<br>&gt; =C2=A0 =C2=A0 - zpool command: missing<br>&gt; =C2=
=A0<br>&gt; Limits:<br>&gt; - /proc/sys/kernel/keys/root_maxkeys: 1000000<b=
r>&gt;<br>&gt; Even running modprobe veth showing that veth is not there:<b=
r>&gt;<br>&gt; modprobe: FATAL: Module veth not found in directory /lib/mod=
ules/4.4.113-yocto-standard<br>&gt;<br>&gt; And here is the output of lxc-c=
heckconfig<br>&gt;<br>&gt; --- Namespaces ---<br>&gt; Namespaces: enabled<b=
r>&gt; Utsname namespace: enabled<br>&gt; Ipc namespace: enabled<br>&gt; Pi=
d namespace: enabled<br>&gt; User namespace: enabled<br>&gt; Network namesp=
ace: enabled<br>&gt; Multiple /dev/pts instances: missing<br>&gt; =C2=A0<br=
>&gt; --- Control groups ---<br>&gt; Cgroup: enabled<br>&gt; Cgroup clone_c=
hildren flag: enabled<br>&gt; Cgroup device: enabled<br>&gt; Cgroup sched: =
enabled<br>&gt; Cgroup cpu account: enabled<br>&gt; Cgroup memory controlle=
r: enabled<br>&gt; Cgroup cpuset: enabled<br>&gt; =C2=A0<br>&gt; --- Misc -=
--<br>&gt; Veth pair device: missing<br>&gt; Macvlan: missing<br>&gt; Vlan:=
 enabled<br>&gt; Bridges: enabled<br>&gt; Advanced netfilter: enabled<br>&g=
t; CONFIG_NF_NAT_IPV4: enabled<br>&gt; CONFIG_NF_NAT_IPV6: missing<br>&gt; =
CONFIG_IP_NF_TARGET_MASQUERADE: missing<br>&gt; CONFIG_IP6_NF_TARGET_MASQUE=
RADE: missing<br>&gt; CONFIG_NETFILTER_XT_TARGET_CHECKSUM: missing<br>&gt; =
FUSE (for use with lxcfs): enabled<br>&gt; =C2=A0<br>&gt; --- Checkpoint/Re=
store ---<br>&gt; checkpoint restore: missing<br>&gt; CONFIG_FHANDLE: enabl=
ed<br>&gt; CONFIG_EVENTFD: enabled<br>&gt; CONFIG_EPOLL: enabled<br>&gt; CO=
NFIG_UNIX_DIAG: missing<br>&gt; CONFIG_INET_DIAG: enabled<br>&gt; CONFIG_PA=
CKET_DIAG: missing<br>&gt; CONFIG_NETLINK_DIAG: missing<br>&gt; File capabi=
lities: enabled<br>&gt; =C2=A0<br>&gt; Note : Before booting a new kernel, =
you can check its configuration<br>&gt; usage : CONFIG=3D/path/to/config /u=
sr/bin/lxc-checkconfig<br>&gt;<br>&gt; After going around the internet, I f=
ound out that somebody had the same issue with me: <a href=3D"https://marc.=
info/?l=3Dopenembedded-devel&amp;m=3D154773496216135&amp;w=3D2">https://mar=
c.info/?l=3Dopenembedded-devel&amp;m=3D154773496216135&amp;w=3D2</a>, and t=
hey also think that veth missing is the problem. And as suggestion, I added=
 in my local.conf:<br>&gt; CORE_IMAGE_EXTRA_INSTALL +=3D &quot;kernel-modul=
es docker&quot;<br>&gt; But they also mentioned the actual solution is :<br=
>&gt;<br>&gt; I found the issue.=C2=A0 The veth kernel parameter was not en=
abled.=C2=A0 Once I added<br>&gt; CONFIG_VETH=3Dy to my docker.cfg file, I =
was able to successfully run a<br>&gt; docker container in my openembedded =
OS<br>&gt;<br>&gt; So where could I do the same? I&#39;ve used the rocko ve=
rsion and it doesn&#39;t have the linux/docker.cfg file? Or could I can cre=
ate one by myself?<br>&gt;<div>&gt; P/S:<br></div><div>&gt; I found in meta=
-virtualization/recipes-kernel/linux/linux-yocto/ the file docker.cfg, but =
there is no option as CONFIG_VETH, but in the file lxc.cfg, it exists and a=
lready &#39;y&#39;. I don&#39;t really know what needed to actually used th=
is. Why the veth module is not appeared?<br>&gt;<br><br></div><div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">Correct. Similar fragments d=
id exist in the rocko timeframe, but if you are looking for docker support =
.. a newer (and supported) release is highly recommended.</div><br></div><d=
iv><div class=3D"gmail_default" style=3D"font-size:small">Using the fragmen=
ts depends on your kernel provider.=C2=A0</div><div class=3D"gmail_default"=
 style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"=
font-size:small">If it is linux yocto, then there is a .inc file in the lay=
er that is enabled whenever virtualization is in the DISTRO_FEATURES. That =
.inc file adds the fragments to the linux-yocto SRC_URI, and the options wi=
ll be enabled (<a href=3D"https://git.yoctoproject.org/meta-virtualization/=
tree/recipes-kernel/linux/linux-yocto_virtualization.inc?h=3Drocko">https:/=
/git.yoctoproject.org/meta-virtualization/tree/recipes-kernel/linux/linux-y=
octo_virtualization.inc?h=3Drocko</a>)</div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fon=
t-size:small">If your kernel provider is linux-yocto based (i.e. it support=
s fragments), then you could individually add the fragments via KERNEL_FEAT=
URES (check the yocto docs for details).</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small">And finally, if you do have CONFIG_VETH enabled as a module=
 (versus built in), you&#39;d also need to make sure the specific kernel mo=
dule package is installed to your image, or all modules are installed (via =
the kernel-modules package that you have mentioned above).</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">Bruce</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><br></div><div><br></div><div>&gt; -=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>&gt; Links: You receive all me=
ssages sent to this group.<br>&gt; View/Reply Online (#6990): <a href=3D"ht=
tps://lists.yoctoproject.org/g/meta-virtualization/message/6990">https://li=
sts.yoctoproject.org/g/meta-virtualization/message/6990</a><br>&gt; Mute Th=
is Topic: <a href=3D"https://lists.yoctoproject.org/mt/88187835/1050810">ht=
tps://lists.yoctoproject.org/mt/88187835/1050810</a><br>&gt; Mute #yocto:<a=
 href=3D"https://lists.yoctoproject.org/g/meta-virtualization/mutehashtag/y=
octo">https://lists.yoctoproject.org/g/meta-virtualization/mutehashtag/yoct=
o</a><br>&gt; Mute #meta-virtualization:<a href=3D"https://lists.yoctoproje=
ct.org/g/meta-virtualization/mutehashtag/meta-virtualization">https://lists=
.yoctoproject.org/g/meta-virtualization/mutehashtag/meta-virtualization</a>=
<br>&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.y=
octoproject.org">meta-virtualization+owner@lists.yoctoproject.org</a><br>&g=
t; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualiza=
tion/unsub">https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> =
[<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>]<=
br>&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>&gt;<br><br><br>--=
 <br>- Thou shalt not follow the NULL pointer, for chaos and madness await =
thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek I=
I<br></div></div>

--000000000000a6824005d53ac811--

