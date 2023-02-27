Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51436C64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 14:26:23 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web11.91364.1677507979625883593
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Feb 2023 06:26:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iGTejeaa;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id m22so2202249ioy.4
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Feb 2023 06:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxg5dxNfTGQTdOqMe0BQdgFKUBpfK+3VWgqPR8Epc7A=;
        b=iGTejeaaFoq4Ldp8hqBLnrlSsLVmm55v2PaKWoSSUCIqlxf2VGDano9G5eHqucB8Bk
         Uz9hJCJyo3Gk6SM7kWiVdacEHdEzAGLjC9EeCFn2DCERAOGpvzxyxjrB6JGZxJ5doBNz
         eiAbqWlWPIWvTXbKnohV3UpTu0kVvB07HX5YIaKVCgQiAxiPGLbsDHeMC4/3N1EPr7AD
         ng0LlponaqAN/m8aLB0t0WUjrrR1pHgEtR2upYIrihcrBUh/LAn4pE5aUREFnV53mXjf
         mJzHZ8hk3IAOFVhiwfzkVqQ62EDLxYMSvvK4P7fE+N/XYptnQ6o3ql3OJ9qIY10Gq1Og
         RtWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxg5dxNfTGQTdOqMe0BQdgFKUBpfK+3VWgqPR8Epc7A=;
        b=0+c46qaZoHnAi6SVxwm9n32LKOPedgi1x5ycHhEx4o7826mq/QBx3W1eYeDo7JIDL2
         NCC+5SKgUz0RGBs6w06i1+lnI1E8v+7jCizyo1L55dzWmKlMjhNzPit0BIxN2CJBdJaY
         DF2lB5yj8umHqJwi6UXIZIr8d1/6wd7pyM9k4SIFzLNID92DBdR3AU7ax0n9M6o60gB4
         0ngqVVoq+dh73dr87JUwwvwJiF4wbI29d17IOdlwtYKJt83/tn//4kGyfmQXx1r/nqjC
         sioB3N/uzyCw57t5vKTTj98elQAHJuPy5P4bnoyt9NCPhLN63x7sM4a2Xs0KP0SeqRTK
         B9mg==
X-Gm-Message-State: AO0yUKU+HsayCFNrC0F+apRSCLC5lEjktcnj7sNzExJ/LZ6OPLXMyGvW
	RyJZ0wA+QndjErz/fbaDRSW/6Yz/oE3qAGLlHkmqbGhj/HxKXg==
X-Google-Smtp-Source: AK7set8RBAnXLhuGHIJYmyPgHUOpRf7aZDt9yylvPZDPTMUS5KZdztXJNdNKq5n0B8gcU8sTdhwTFNFMPpNyTzd8Ct8=
X-Received: by 2002:a02:85c6:0:b0:3e1:fb3d:4dce with SMTP id
 d64-20020a0285c6000000b003e1fb3d4dcemr8715870jai.0.1677507977083; Mon, 27 Feb
 2023 06:26:17 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4MLCRpqYA=OxRe-GdONo_ijpJXFcZdSF=O-tXGHxECgBw@mail.gmail.com>
 <17473B860936B482.18951@lists.yoctoproject.org> <CAEFUPH26tNiuYHEnWuszkPjizNSQo9kV08zNMuE8Bf1+vm-=zA@mail.gmail.com>
In-Reply-To: <CAEFUPH26tNiuYHEnWuszkPjizNSQo9kV08zNMuE8Bf1+vm-=zA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 27 Feb 2023 09:26:06 -0500
Message-ID: <CADkTA4OB46d04gTpz4bEon71izVVT90ZwKbN0gFKMhUKKo3wQA@mail.gmail.com>
Subject: Re: [meta-virtualization] query on docker support changes in yocto
To: SIMON BABY <simonkbaby@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Feb 2023 14:26:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7904

On Sun, Feb 26, 2023 at 1:42 PM SIMON BABY <simonkbaby@gmail.com> wrote:
>
> Hi Bruce,
> I have enabled some of the kernel flags. I am able to run the docker run =
command. But I see some logs when I run  the command even though it is exec=
uted. I also observed that docker daemon is not starting by default after e=
very reboot. Do we have any specific fix for this?
>

There's no specific fix for that, because it isn't broken in anything
that I've seen. docker starts fine on boot in all of my test cases.

Of course, you won't always see the daemon running on startup, as
there are socket and other systemd triggers that will launch the
daemon when required (and it will continue to run after that).

>
> root@imx8mpevk:~# docker run hello-world
> [  271.841466] docker0: port 1(vethd66b82d) entered blocking state
> [  271.847462] docker0: port 1(vethd66b82d) entered disabled state
> [  271.853592] device vethd66b82d entered promiscuous mode
> [  271.858934] audit: type=3D1700 audit(1677436586.264:37): dev=3Dvethd66=
b82d prom=3D256 old_prom=3D0 auid=3D4294967295 uid=3D0 gid=3D0 ses=3D429496=
7295
> [  271.871031] audit: type=3D1300 audit(1677436586.264:37): arch=3Dc00000=
b7 syscall=3D206 success=3Dyes exit=3D40 a0=3Df a1=3D4000f54c90 a2=3D28 a3=
=3D0 items=3D0 ppid=3D1 pid=3D969 auid=3D4294967295 uid=3D0 gid=3D0 euid=3D=
0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) ses=3D4294967=
295 comm=3D"dockerd" exe=3D"/usr/bin/dockerd" subj=3Dkernel key=3D(null)
> [  271.898659] audit: type=3D1327 audit(1677436586.264:37): proctitle=3D2=
F7573722F62696E2F646F636B657264002D480066643A2F2F
> [  272.315534] eth0: renamed from veth95a7c15
> [  272.326397] IPv6: ADDRCONF(NETDEV_CHANGE): vethd66b82d: link becomes r=
eady
> [  272.333388] docker0: port 1(vethd66b82d) entered blocking state
> [  272.339340] docker0: port 1(vethd66b82d) entered forwarding state
>
> Hello from Docker!
> This message shows that your installation appears to be working correctly=
.
>
> To generate this message, Docker took the following steps:
>  1. The Docker client contacted the Docker daemon.
>  2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
>     (arm64v8)
>  3. The Docker daemon created a new container from that image which runs =
the
>     executable that produces the output you are currently reading.
>  4. The Docker daemon streamed that output to the Docker client, which se=
nt it
>     to your terminal.
>
> To try something more ambitious, you can run an Ubuntu container with:
>  $ docker run -it ubuntu bash
>
> Share images, automate workflows, and more with a free Docker ID:
>  https://hub.docker.com/
>
> For more examples and ideas, visit:
>  https://docs.docker.com/get-started/
>
> [  272.466210] docker0: port 1(vethd66b82d) entered disabled state
> [  272.472523] veth95a7c15: renamed from eth0
> [  272.505514] docker0: port 1(vethd66b82d) entered disabled state
> [  272.513799] device vethd66b82d left promiscuous mode
> [  272.518809] docker0: port 1(vethd66b82d) entered disabled state
> [  272.518828] audit: type=3D1700 audit(1677436586.928:38): dev=3Dvethd66=
b82d prom=3D0 old_prom=3D256 auid=3D4294967295 uid=3D0 gid=3D0 ses=3D429496=
7295
> [  272.550854] audit: type=3D1300 audit(1677436586.928:38): arch=3Dc00000=
b7 syscall=3D206 success=3Dyes exit=3D32 a0=3Df a1=3D400014dfe0 a2=3D20 a3=
=3D0 items=3D0 ppid=3D1 pid=3D969 auid=3D4294967295 uid=3D0 gid=3D0 euid=3D=
0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) ses=3D4294967=
295 comm=3D"dockerd" exe=3D"/usr/bin/dockerd" subj=3Dkernel key=3D(null)
> [  272.578481] audit: type=3D1327 audit(1677436586.928:38): proctitle=3D2=
F7573722F62696E2F646F636B657264002D480066643A2F2F
>
>
> I have compared all the kernel configuration between my local ubuntu linu=
x and the imx8 I am running. Below are all the kernel configuration set on =
my target for the docker to run (as per nxp manual)
>

If you add docker-ce-contrib (or docker-moby-contrib, depending on
what flavour you are building), one of the docker supplied scripts
will be installed to the target. You can use that to check the running
kernel configuration and look for issues.

You'll find that script at: /usr/share/docker/check-config.sh

Bruce

>
>
> root@imx8mpevk:~# sh kernel.sh
> info: reading kernel config from /proc/config.gz ...
>
> Generally Necessary:
> - cgroup hierarchy: properly mounted [/sys/fs/cgroup]
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
> - CONFIG_VETH: enabled (as module)
> - CONFIG_BRIDGE: enabled
> - CONFIG_BRIDGE_NETFILTER: enabled (as module)
> - CONFIG_IP_NF_FILTER: enabled (as module)
> - CONFIG_IP_NF_TARGET_MASQUERADE: enabled (as module)
> - CONFIG_NETFILTER_XT_MATCH_ADDRTYPE: enabled (as module)
> - CONFIG_NETFILTER_XT_MATCH_CONNTRACK: enabled (as module)
> - CONFIG_NETFILTER_XT_MATCH_IPVS: enabled (as module)
> - CONFIG_NETFILTER_XT_MARK: enabled (as module)
> - CONFIG_IP_NF_NAT: enabled
> - CONFIG_NF_NAT: enabled
> - CONFIG_POSIX_MQUEUE: enabled
> - CONFIG_CGROUP_BPF: missing
>
> Optional Features:
> - CONFIG_USER_NS: enabled
> - CONFIG_SECCOMP: enabled
> - CONFIG_SECCOMP_FILTER: enabled
> - CONFIG_CGROUP_PIDS: enabled
> - CONFIG_MEMCG_SWAP: enabled
>     (cgroup swap accounting is currently enabled)
> - CONFIG_BLK_CGROUP: enabled
> - CONFIG_BLK_DEV_THROTTLING: enabled
> - CONFIG_CGROUP_PERF: enabled
> - CONFIG_CGROUP_HUGETLB: enabled
> - CONFIG_NET_CLS_CGROUP: enabled (as module)
> - CONFIG_CGROUP_NET_PRIO: enabled
> - CONFIG_CFS_BANDWIDTH: enabled
> - CONFIG_FAIR_GROUP_SCHED: enabled
> - CONFIG_RT_GROUP_SCHED: missing
> - CONFIG_IP_NF_TARGET_REDIRECT: enabled (as module)
> - CONFIG_IP_VS: enabled (as module)
> - CONFIG_IP_VS_NFCT: enabled
> - CONFIG_IP_VS_PROTO_TCP: enabled
> - CONFIG_IP_VS_PROTO_UDP: enabled
> - CONFIG_IP_VS_RR: enabled (as module)
> - CONFIG_SECURITY_SELINUX: enabled
> - CONFIG_SECURITY_APPARMOR: enabled
> - CONFIG_EXT3_FS: enabled
> - CONFIG_EXT3_FS_XATTR: missing
> - CONFIG_EXT3_FS_POSIX_ACL: missing
> - CONFIG_EXT3_FS_SECURITY: missing
>     (enable these ext3 configs if you are using ext3 as backing filesyste=
m)
> - CONFIG_EXT4_FS: enabled
> - CONFIG_EXT4_FS_POSIX_ACL: enabled
> - CONFIG_EXT4_FS_SECURITY: enabled
> - Network Drivers:
>   - "overlay":
>     - CONFIG_VXLAN: enabled (as module)
>     - CONFIG_BRIDGE_VLAN_FILTERING: enabled
>       Optional (for encrypted networks):
>       - CONFIG_CRYPTO: enabled
>       - CONFIG_CRYPTO_AEAD: enabled
>       - CONFIG_CRYPTO_GCM: enabled
>       - CONFIG_CRYPTO_SEQIV: missing
>       - CONFIG_CRYPTO_GHASH: enabled
>       - CONFIG_XFRM: missing
>       - CONFIG_XFRM_USER: missing
>       - CONFIG_XFRM_ALGO: missing
>       - CONFIG_INET_ESP: missing
>   - "ipvlan":
>     - CONFIG_IPVLAN: enabled (as module)
>   - "macvlan":
>     - CONFIG_MACVLAN: enabled (as module)
>     - CONFIG_DUMMY: enabled (as module)
>   - "ftp,tftp client in container":
>     - CONFIG_NF_NAT_FTP: enabled (as module)
>     - CONFIG_NF_CONNTRACK_FTP: enabled (as module)
>     - CONFIG_NF_NAT_TFTP: enabled (as module)
>     - CONFIG_NF_CONNTRACK_TFTP: enabled (as module)
> - Storage Drivers:
>   - "aufs":
>     - CONFIG_AUFS_FS: missing
>   - "btrfs":
>     - CONFIG_BTRFS_FS: enabled (as module)
>     - CONFIG_BTRFS_FS_POSIX_ACL: enabled
>   - "devicemapper":
>     - CONFIG_BLK_DEV_DM: enabled (as module)
>     - CONFIG_DM_THIN_PROVISIONING: enabled (as module)
>   - "overlay":
>     - CONFIG_OVERLAY_FS: enabled (as module)
>   - "zfs":
>     - /dev/zfs: missing
>     - zfs command: missing
>     - zpool command: missing
>
>
> Regards
> Simon
>
> On Sat, Feb 25, 2023 at 5:27=E2=80=AFPM SIMON BABY via lists.yoctoproject=
.org <simonkbaby=3Dgmail.com@lists.yoctoproject.org> wrote:
>>
>> Thank you Bruce . I will do more research in that direction ( kernel con=
figuration)
>>
>> Regards
>> Simon
>> > On Feb 25, 2023, at 5:20 PM, Bruce Ashfield <bruce.ashfield@gmail.com>=
 wrote:
>> >
>> > =EF=BB=BFOn Sat, Feb 25, 2023 at 5:35 PM SIMON BABY <simonkbaby@gmail.=
com> wrote:
>> >>
>> >> Hi Bruce,
>> >> I also observed that the docker daemon is not starting by default and=
 if I launch it manually , it takes a long time to start. Am I missing any =
kernel modules?
>> >>
>> >> Here is the  o/p from  "systemctl status docker.service".
>> >>
>> >> root@imx8mpevk:~# systemctl status docker.service
>> >> * docker.service - Docker Application Container Engine
>> >>     Loaded: loaded (/lib/systemd/system/docker.service; disabled; ven=
dor preset: disabled)
>> >>     Active: active (running) since Sat 2023-02-25 22:19:54 UTC; 4min =
10s ago
>> >> TriggeredBy: * docker.socket
>> >>       Docs: https://docs.docker.com
>> >>   Main PID: 423 (dockerd)
>> >>      Tasks: 11 (limit: 5578)
>> >>     Memory: 115.0M
>> >>     CGroup: /system.slice/docker.service
>> >>             `-423 /usr/bin/dockerd -H fd://
>> >>
>> >> Feb 25 22:19:53 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:19:53.8=
37738928Z" level=3Dwarning msg=3D"Running modprobe bridge br_netfilter fail=
ed with message: modprobe: WARNING: Module br_netfilter not found in direct=
or...ror: exit status 1"
>> >
>> > The above error could be a missing module, or a missing iptables modul=
e.
>> >
>> >
>> >> Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:19:54.0=
71250923Z" level=3Dwarning msg=3D"Could not load necessary modules for IPSE=
C rules: protocol not supported"
>> >> Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:19:54.0=
78250217Z" level=3Dwarning msg=3D"Could not load necessary modules for Conn=
track: Running modprobe nf_conntrack_netlink failed with message: `modprobe=
: WARNING: Module nf_...
>> >
>> > As does the above one.
>> >
>> > so you definitely have missing configuration.
>> >
>> > Bruce
>> >
>> >> Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:19:54.0=
81471487Z" level=3Dinfo msg=3D"Default bridge (docker0) is assigned with an=
 IP address 172.17.0.0/16. Daemon option --bip can be used to set a preferr=
ed IP address"
>> >> Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:19:54.1=
99132980Z" level=3Dinfo msg=3D"Loading containers: done."
>> >> Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:19:54.2=
96845346Z" level=3Dinfo msg=3D"Docker daemon" commit=3D906f57ff5b-unsupport=
ed graphdriver(s)=3Doverlay2 version=3D20.10.12-ce
>> >> Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:19:54.2=
97236599Z" level=3Dinfo msg=3D"Daemon has completed initialization"
>> >> Feb 25 22:19:54 imx8mpevk systemd[1]: Started Docker Application Cont=
ainer Engine.
>> >> Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:19:54.3=
72354197Z" level=3Dinfo msg=3D"API listen on /run/docker.sock"
>> >> Feb 25 22:23:14 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:23:14.1=
88738979Z" level=3Dinfo msg=3D"ignoring event" container=3Da973c205bf7c0e57=
450de3241767f39e4983b6b174e231e014159ed8ae220791 module=3Dlibcontainerd nam=
espace...*events.TaskDelete"
>> >> Hint: Some lines were ellipsized, use -l to show in full.
>> >> root@imx8mpevk:~# Feb 25 22:19:53 imx8mpevk dockerd[423]: time=3D"202=
3-02-25T22:19:53.837738928Z" level=3Dwarning msg=3D"Running modprobe bridge=
 br_netfilter failed with message: modprobe: WARNING: Module br_netfilter n=
ot found in director...ror: exit status 1"
>> >>
>> >>
>> >> Regards
>> >> Simon
>> >>
>> >>> On Fri, Feb 24, 2023 at 6:47 PM SIMON BABY via lists.yoctoproject.or=
g <simonkbaby=3Dgmail.com@lists.yoctoproject.org> wrote:
>> >>>
>> >>> Hello Bruce,
>> >>>
>> >>> Thank you for the inputs.
>> >>>
>> >>>
>> >>> Yes, I use linux-yocto. The target linux version is below.
>> >>>
>> >>>
>> >>>
>> >>> Linux imx8mpevk 5.15.32-rt39-lts-next+g2a8a193a07b4 #1 SMP PREEMPT_R=
T Tue Jun 7 02:34:46 UTC 2022 aarch64 aarch64 aarch64 GNU/Linux
>> >>>
>> >>>
>> >>>
>> >>> The layers used are in the link below.
>> >>>
>> >>> https://source.codeaurora.org/external/imx/imx-manifest/tree/imx-5.1=
5.32-2.0.0.xml?h=3Dimx-linux-kirkstone
>> >>>
>> >>>
>> >>>
>> >>> I tried to add IMAGE_INSTALL:append =3D " kernel-modules" in local.c=
onf but it did not make any difference.
>> >>>
>> >>>
>> >>>
>> >>> The docker version I am running on the target is 20.10.12-ce
>> >>>
>> >>>
>> >>>
>> >>> Below is the error I am getting on the target.
>> >>>
>> >>>
>> >>>
>> >>> root@imx8mpevk:~# docker run hello-world
>> >>>
>> >>> [ 1359.005452] docker0: port 1(veth4dc9000) entered blocking state
>> >>>
>> >>> [ 1359.005512] docker0: port 1(veth4dc9000) entered disabled state
>> >>>
>> >>> [ 1359.005921] device veth4dc9000 entered promiscuous mode
>> >>>
>> >>> [ 1359.005994] audit: type=3D1700 audit(1677283528.914:37): dev=3Dve=
th4dc9000 prom=3D256 old_prom=3D0 auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4=
294967295
>> >>>
>> >>> [ 1359.013139] audit: type=3D1300 audit(1677283528.914:37): arch=3Dc=
00000b7 syscall=3D206 success=3Dyes exit=3D40 a0=3De a1=3D4000ec0d50 a2=3D2=
8 a3=3D0 items=3D0 ppid=3D1 pid=3D446 auid=3D4294967295 uid=3D0 gid=3D0 eui=
d=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) ses=3D429=
4967295 comm=3D"dockerd" exe=3D"/usr/bin/dockerd" key=3D(null)
>> >>>
>> >>> [ 1359.013228] audit: type=3D1327 audit(1677283528.914:37): proctitl=
e=3D2F7573722F62696E2F646F636B657264002D480066643A2F2F
>> >>>
>> >>> [ 1359.263483] docker0: port 1(veth4dc9000) entered disabled state
>> >>>
>> >>> [ 1359.298263] device veth4dc9000 left promiscuous mode
>> >>>
>> >>> [ 1359.298305] docker0: port 1(veth4dc9000) entered disabled state
>> >>>
>> >>> [ 1359.298646] audit: type=3D1700 audit(1677283529.164:38): dev=3Dve=
th4dc9000 prom=3D0 old_prom=3D256 auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4=
294967295
>> >>>
>> >>> docker: Error response from daemon: failed to create shim task: OCI =
runtime create failed: runc create failed: unable to start container proces=
s: can't get final child's PID from pipe: EOF: unknown.
>> >>>
>> >>> ERRO[0000] error waiting for container: context canceled
>> >>>
>> >>>
>> >>>
>> >>>
>> >>>
>> >>>
>> >>>
>> >>> Also sending the local.conf and bblayers.conf file
>> >>>
>> >>>
>> >>>
>> >>> local.conf:
>> >>>
>> >>>
>> >>>
>> >>> MACHINE ??=3D 'imx8mpevk'
>> >>>
>> >>> DISTRO ?=3D 'fsl-imx-wayland'
>> >>>
>> >>> PACKAGE_CLASSES ?=3D 'package_rpm'
>> >>>
>> >>> EXTRA_IMAGE_FEATURES ?=3D "debug-tweaks"
>> >>>
>> >>> USER_CLASSES ?=3D "buildstats"
>> >>>
>> >>> PATCHRESOLVE =3D "noop"
>> >>>
>> >>> BB_DISKMON_DIRS ??=3D "\
>> >>>
>> >>>    STOPTASKS,${TMPDIR},1G,100K \
>> >>>
>> >>>    STOPTASKS,${DL_DIR},1G,100K \
>> >>>
>> >>>    STOPTASKS,${SSTATE_DIR},1G,100K \
>> >>>
>> >>>   STOPTASKS,/tmp,100M,100K \
>> >>>
>> >>>    HALT,${TMPDIR},100M,1K \
>> >>>
>> >>>    HALT,${DL_DIR},100M,1K \
>> >>>
>> >>>    HALT,${SSTATE_DIR},100M,1K \
>> >>>
>> >>>    HALT,/tmp,10M,1K"
>> >>>
>> >>> PACKAGECONFIG:append:pn-qemu-system-native =3D " sdl"
>> >>>
>> >>> CONF_VERSION =3D "2"
>> >>>
>> >>>
>> >>>
>> >>> DL_DIR ?=3D "${BSPDIR}/downloads/"
>> >>>
>> >>> ACCEPT_FSL_EULA =3D "1"
>> >>>
>> >>>
>> >>>
>> >>> # Switch to Debian packaging and include package-management in the i=
mage
>> >>>
>> >>> PACKAGE_CLASSES =3D "package_deb"
>> >>>
>> >>> EXTRA_IMAGE_FEATURES +=3D "package-management"
>> >>>
>> >>> DISTRO_FEATURES:append =3D " virtualization"
>> >>>
>> >>> IMAGE_INSTALL:append =3D " docker-ce"
>> >>>
>> >>> IMAGE_INSTALL:append =3D " kernel-modules"
>> >>>
>> >>>
>> >>>
>> >>> EXTRA_IMAGE_FEATURES =3D "debug-tweaks tools-profile"
>> >>>
>> >>>
>> >>>
>> >>>
>> >>>
>> >>>
>> >>>
>> >>> bblayers.conf
>> >>>
>> >>>
>> >>>
>> >>> LCONF_VERSION =3D "7"
>> >>>
>> >>>
>> >>>
>> >>> BBPATH =3D "${TOPDIR}"
>> >>>
>> >>> BSPDIR :=3D ${@os.path.abspath(os.path.dirname(d.getVar('FILE', True=
)) + '/../..')}
>> >>>
>> >>>
>> >>>
>> >>> BBFILES ?=3D ""
>> >>>
>> >>> BBLAYERS =3D " \
>> >>>
>> >>>  ${BSPDIR}/sources/poky/meta \
>> >>>
>> >>>  ${BSPDIR}/sources/poky/meta-poky \
>> >>>
>> >>>  \
>> >>>
>> >>>  ${BSPDIR}/sources/meta-openembedded/meta-oe \
>> >>>
>> >>>  ${BSPDIR}/sources/meta-openembedded/meta-multimedia \
>> >>>
>> >>>  ${BSPDIR}/sources/meta-openembedded/meta-python \
>> >>>
>> >>>  \
>> >>>
>> >>>  ${BSPDIR}/sources/meta-freescale \
>> >>>
>> >>>  ${BSPDIR}/sources/meta-freescale-3rdparty \
>> >>>
>> >>>  ${BSPDIR}/sources/meta-freescale-distro \
>> >>>
>> >>> "
>> >>>
>> >>>
>> >>>
>> >>> # i.MX Yocto Project Release layers
>> >>>
>> >>> BBLAYERS +=3D "${BSPDIR}/sources/meta-imx/meta-bsp"
>> >>>
>> >>> BBLAYERS +=3D "${BSPDIR}/sources/meta-imx/meta-sdk"
>> >>>
>> >>> BBLAYERS +=3D "${BSPDIR}/sources/meta-imx/meta-ml"
>> >>>
>> >>> BBLAYERS +=3D "${BSPDIR}/sources/meta-imx/meta-v2x"
>> >>>
>> >>> #BBLAYERS +=3D "${BSPDIR}/sources/meta-nxp-demo-experience"
>> >>>
>> >>>
>> >>>
>> >>> #BBLAYERS +=3D "${BSPDIR}/sources/meta-browser/meta-chromium"
>> >>>
>> >>> #BBLAYERS +=3D "${BSPDIR}/sources/meta-clang"
>> >>>
>> >>> #BBLAYERS +=3D "${BSPDIR}/sources/meta-openembedded/meta-gnome"
>> >>>
>> >>> BBLAYERS +=3D "${BSPDIR}/sources/meta-openembedded/meta-networking"
>> >>>
>> >>> BBLAYERS +=3D "${BSPDIR}/sources/meta-openembedded/meta-filesystems"
>> >>>
>> >>> BBLAYERS +=3D "${BSPDIR}/sources/meta-virtualization"
>> >>>
>> >>> BBLAYERS +=3D "${BSPDIR}/sources/meta-teledyne-wapng"
>> >>>
>> >>> BBLAYERS +=3D "${BSPDIR}/sources/meta-aws"
>> >>>
>> >>>
>> >>>
>> >>> Regards
>> >>>
>> >>> Simon
>> >>>
>> >>>
>> >>> On Thu, Feb 23, 2023 at 12:03 PM Bruce Ashfield <bruce.ashfield@gmai=
l.com> wrote:
>> >>>>
>> >>>> On Wed, Feb 22, 2023 at 9:47 PM SIMON BABY <simonkbaby@gmail.com> w=
rote:
>> >>>>>
>> >>>>> Hello Team,
>> >>>>>
>> >>>>> Can I know what are the changes required in yocto to run docker an=
d its dependencies  on my target embedded system. I have added the below ch=
anges. Do I need more plugins and packages ?
>> >>>>>
>> >>>>> bblayers.conf:
>> >>>>>
>> >>>>>
>> >>>>>
>> >>>>> BBLAYERS +=3D "${BSPDIR}/sources/meta-openembedded/meta-networking=
"
>> >>>>>
>> >>>>> BBLAYERS +=3D "${BSPDIR}/sources/meta-openembedded/meta-filesystem=
s"
>> >>>>>
>> >>>>> BBLAYERS +=3D "${BSPDIR}/sources/meta-virtualization"
>> >>>>>
>> >>>>>
>> >>>>>
>> >>>>> local.conf:
>> >>>>>
>> >>>>>
>> >>>>>
>> >>>>> DISTRO_FEATURES:append =3D " virtualization"
>> >>>>>
>> >>>>> IMAGE_INSTALL:append =3D " docker-ce"
>> >>>>>
>> >>>>
>> >>>> You likely are missing kernel configuration values required to run =
the
>> >>>> containers.
>> >>>>
>> >>>> What kernel are you using (linux-yocto?), and are you on the master
>> >>>> branch of the layers ?
>> >>>>
>> >>>> As you can see, it is working in my latest tests:
>> >>>>
>> >>>> root@qemux86-64:~# docker --version
>> >>>> Docker version 23.0.1, build a5ee5b1dfc
>> >>>> root@qemux86-64:~# docker pull alpine
>> >>>> Using default tag: latest
>> >>>> latest: Pulling from library/alpine
>> >>>> 63b65145d645: Pull complete
>> >>>> Digest: sha256:69665d02cb32192e52e07644d76bc6f25abeb5410edc1c7a81a1=
0ba3f0efb90a
>> >>>> Status: Downloaded newer image for alpine:latest
>> >>>> docker.io/library/alpine:latest
>> >>>> root@qemux86-64:~# docker run -it alpine /bin/sh
>> >>>> / #
>> >>>>
>> >>>> Try adding "kernel-modules" to your IMAGE_INSTALL, and see if that
>> >>>> makes a difference.
>> >>>>
>> >>>> Bruce
>> >>>>
>> >>>>
>> >>>>>
>> >>>>>
>> >>>>> WIth the above changes and tested on the target I am getting the b=
elow error when try to run "docker run hello-world"
>> >>>>>
>> >>>>>
>> >>>>> root@imx8mpevk:~# docker run hello-world
>> >>>>> DEBU[2023-02-23T00:53:57.064704083Z] Calling HEAD /_ping
>> >>>>> DEBU[2023-02-23T00:53:57.068355788Z] Calling POST /v1.41/container=
s/create
>> >>>>> DEBU[2023-02-23T00:53:57.069098805Z] form data: {=E2=80=9CAttachSt=
derr=E2=80=9D:true,=E2=80=9CAttachStdin=E2=80=9D:false,=E2=80=9CAttachStdou=
t=E2=80=9D:true,=E2=80=9CCmd=E2=80=9D:null,=E2=80=9CDomainname=E2=80=9D:=E2=
=80=9C=E2=80=9D,=E2=80=9CEntrypoint=E2=80=9D:null,=E2=80=9CEnv=E2=80=9D:nul=
l,=E2=80=9CHostConfig=E2=80=9D:{=E2=80=9CAutoRemove=E2=80=9D:false,=E2=80=
=9CBinds=E2=80=9D:null,=E2=80=9CBlkioDeviceReadBps=E2=80=9D:null,=E2=80=9CB=
lkioDeviceReadIOps=E2=80=9D:null,=E2=80=9CBlkioDeviceWriteBps=E2=80=9D:null=
,=E2=80=9CBlkioDeviceWriteIOps=E2=80=9D:null,=E2=80=9CBlkioWeight=E2=80=9D:=
0,=E2=80=9CBlkioWeightDevice=E2=80=9D:,=E2=80=9CCapAdd=E2=80=9D:null,=E2=80=
=9CCapDrop=E2=80=9D:null,=E2=80=9CCgroup=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=
=9CCgroupParent=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CCgroupnsMode=E2=80=9D:=
=E2=80=9C=E2=80=9D,=E2=80=9CConsoleSize=E2=80=9D:[0,0],=E2=80=9CContainerID=
File=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CCpuCount=E2=80=9D:0,=E2=80=9CCpuP=
ercent=E2=80=9D:0,=E2=80=9CCpuPeriod=E2=80=9D:0,=E2=80=9CCpuQuota=E2=80=9D:=
0,=E2=80=9CCpuRealtimePeriod=E2=80=9D:0,=E2=80=9CCpuRealtimeRuntime=E2=80=
=9D:0,=E2=80=9CCpuShares=E2=80=9D:0,=E2=80=9CCpusetCpus=E2=80=9D:=E2=80=9C=
=E2=80=9D,=E2=80=9CCpusetMems=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CDeviceCg=
roupRules=E2=80=9D:null,=E2=80=9CDeviceRequests=E2=80=9D:null,=E2=80=9CDevi=
ces=E2=80=9D:,=E2=80=9CDns=E2=80=9D:,=E2=80=9CDnsOptions=E2=80=9D:,=E2=80=
=9CDnsSearch=E2=80=9D:,=E2=80=9CExtraHosts=E2=80=9D:null,=E2=80=9CGroupAdd=
=E2=80=9D:null,=E2=80=9CIOMaximumBandwidth=E2=80=9D:0,=E2=80=9CIOMaximumIOp=
s=E2=80=9D:0,=E2=80=9CIpcMode=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CIsolatio=
n=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CKernelMemory=E2=80=9D:0,=E2=80=9CKer=
nelMemoryTCP=E2=80=9D:0,=E2=80=9CLinks=E2=80=9D:null,=E2=80=9CLogConfig=E2=
=80=9D:{=E2=80=9CConfig=E2=80=9D:{},=E2=80=9CType=E2=80=9D:=E2=80=9C=E2=80=
=9D},=E2=80=9CMaskedPaths=E2=80=9D:null,=E2=80=9CMemory=E2=80=9D:0,=E2=80=
=9CMemoryReservation=E2=80=9D:0,=E2=80=9CMemorySwap=E2=80=9D:0,=E2=80=9CMem=
orySwappiness=E2=80=9D:-1,=E2=80=9CNanoCpus=E2=80=9D:0,=E2=80=9CNetworkMode=
=E2=80=9D:=E2=80=9Cdefault=E2=80=9D,=E2=80=9COomKillDisable=E2=80=9D:false,=
=E2=80=9COomScoreAdj=E2=80=9D:0,=E2=80=9CPidMode=E2=80=9D:=E2=80=9C=E2=80=
=9D,=E2=80=9CPidsLimit=E2=80=9D:0,=E2=80=9CPortBindings=E2=80=9D:{},=E2=80=
=9CPrivileged=E2=80=9D:false,=E2=80=9CPublishAllPorts=E2=80=9D:false,=E2=80=
=9CReadonlyPaths=E2=80=9D:null,=E2=80=9CReadonlyRootfs=E2=80=9D:false,=E2=
=80=9CRestartPolicy=E2=80=9D:{=E2=80=9CMaximumRetryCount=E2=80=9D:0,=E2=80=
=9CName=E2=80=9D:=E2=80=9Cno=E2=80=9D},=E2=80=9CSecurityOpt=E2=80=9D:null,=
=E2=80=9CShmSize=E2=80=9D:0,=E2=80=9CUTSMode=E2=80=9D:=E2=80=9C=E2=80=9D,=
=E2=80=9CUlimits=E2=80=9D:null,=E2=80=9CUsernsMode=E2=80=9D:=E2=80=9C=E2=80=
=9D,=E2=80=9CVolumeDriver=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CVolumesFrom=
=E2=80=9D:null},=E2=80=9CHostname=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CImag=
e=E2=80=9D:=E2=80=9Chello-world=E2=80=9D,=E2=80=9CLabels=E2=80=9D:{},=E2=80=
=9CNetworkingConfig=E2=80=9D:{=E2=80=9CEndpointsConfig=E2=80=9D:{}},=E2=80=
=9COnBuild=E2=80=9D:null,=E2=80=9COpenStdin=E2=80=9D:false,=E2=80=9CPlatfor=
m=E2=80=9D:null,=E2=80=9CStdinOnce=E2=80=9D:false,=E2=80=9CTty=E2=80=9D:fal=
se,=E2=80=9CUser=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CVolumes=E2=80=9D:{},=
=E2=80=9CWorkingDir=E2=80=9D:=E2=80=9C=E2=80=9D}
>> >>>>> DEBU[25846.680992] docker0: port 1(veth659d267) entered blocking s=
tate
>> >>>>> [25846.681041] docker0: port 1(veth659d267) entered disabled state
>> >>>>> [2023-02-23T00:53:57.121358454Z] [25846.681312] device veth659d267=
 entered promiscuous mode
>> >>>>> container mounted via layerStore:[25846.681392] audit: type=3D1700=
 audit(1677113637.219:205): dev=3Dveth659d267 prom=3D256 old_prom=3D0 auid=
=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295
>> >>>>> &{/var/lib/docker/overlay2/d664e[25846.683022] audit: type=3D1300 =
audit(1677113637.219:205): arch=3Dc00000b7 syscall=3D206 success=3Dyes exit=
=3D40 a0=3Dd a1=3D4000c507b0 a2=3D28 a3=3D0 items=3D0 ppid=3D409 pid=3D1551=
 auid=3D4294967295 uid=3D0 gid=3D0 euid=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgi=
d=3D0 fsgid=3D0 tty=3Dttymxc1 ses=3D4294967295 comm=3D=E2=80=9Cdockerd=E2=
=80=9D exe=3D=E2=80=9C/usr/bin/dockerd=E2=80=9D key=3D(null)
>> >>>>> 7963d79b51cb1322f9995853ff56f54a3[25846.683091] audit: type=3D1327=
 audit(1677113637.219:205): proctitle=3D2F7573722F62696E2F646F636B657264002=
D44
>> >>>>> aa2994ae5b99b3bcb65c33ec2f/merged 0xaaaabdb0b060 0xaaaabdb0b060} c=
ontainer=3D4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190
>> >>>>> DEBU[2023-02-23T00:53:57.184741848Z] Calling POST /v1.41/container=
s/4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190/attach?s=
tderr=3D1&stdout=3D1&stream=3D1
>> >>>>> DEBU[2023-02-23T00:53:57.185112606Z] attach: stderr: begin
>> >>>>> DEBU[2023-02-23T00:53:57.185130357Z] attach: stdout: begin
>> >>>>> DEBU[2023-02-23T00:53:57.186340258Z] Calling POST /v1.41/container=
s/4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190/wait?con=
dition=3Dnext-exit
>> >>>>> DEBU[2023-02-23T00:53:57.188347802Z] Calling POST /v1.41/container=
s/4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190/start
>> >>>>> DEBU[2023-02-23T00:53:57.190864983Z] container mounted via layerSt=
ore: &{/var/lib/docker/overlay2/d664e7963d79b51cb1322f9995853ff56f54a3aa299=
4ae5b99b3bcb65c33ec2f/merged 0xaaaabdb0b060 0xaaaabdb0b060} container=3D4f9=
26f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190
>> >>>>> DEBU[2023-02-23T00:53:57.191993758Z] Assigning addresses for endpo=
int crazy_bell=E2=80=99s interface on network bridge
>> >>>>> DEBU[2023-02-23T00:53:57.192083760Z] RequestAddress(LocalDefault/1=
72.17.0.0/16, , map)
>> >>>>> DEBU[2023-02-23T00:53:57.192149761Z] Request address PoolID:172.17=
.0.0/16 App: ipam/default/data, ID: LocalDefault/172.17.0.0/16, DBIndex: 0x=
0, Bits: 65536, Unselected: 65533, Sequence: (0xc0000000, 1)->(0x0, 2046)->=
(0x1, 1)->end Curr:3 Serial:false PrefAddress:
>> >>>>> ERRO[2023-02-23T00:53:57.192262764Z] failed to set to initial name=
space, readlink /proc/1551/task/1555/ns/net: no such file or directory, ini=
tns fd -1: bad file descriptor
>> >>>>> DEBU[2023-02-23T00:53:57.252893597Z] Assigning addresses for endpo=
int crazy_bell=E2=80=99s interface on network bridge
>> >>>>> ERRO[2023-02-23T00:53:57.274329693Z] failed to set to initial name=
space, readlink /proc/1551/task/1555/ns/net: no such file or directory, ini=
tns fd -1: bad file descriptor
>> >>>>> DEBU[2023-02-23T00:53:57.294111754Z] Programming external connecti=
vity on endpoint crazy_bell (1a86f3778b61204dcc7106bed28728a001028ba51f5c5f=
e731042007ec0ebd3c)
>> >>>>> ERRO[2023-02-23T00:53:57.299150489Z] failed [25846.962844] docker0=
: port 1(veth659d267) entered disabled state
>> >>>>> to set to initial namespace, readlink /proc/1551/task/1555/ns/net:=
 no such file or directory, initns fd -1: bad file descriptor
>> >>>>> DEBU[2023-02-23T00:53:57.304933242Z] EnableService 4f926f032e0566c=
4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190 START
>> >>>>> DEBU[2023-02-23T00:53:57.305002118Z] Enabl[25846.996647] device ve=
th659d267 left promiscuous mode
>> >>>>> eService 4f926f032e0566c4dbdfbb02[25846.996686] docker0: port 1(ve=
th659d267) entered disabled state
>> >>>>> [25846.996703] audit: type=3D1700 audit(1677113637.488:206): dev=
=3Dveth659d267 prom=3D0 old_prom=3D256 auid=3D4294967295 uid=3D0 gid=3D0 se=
s=3D4294967295
>> >>>>> 7787b42e6e19ef6e633864f09a4c9edbdb62d190 DONE
>> >>>>> DEBU[2023-02-23T00:53:57.313909564Z] bundle dir created bundle=3D/=
var/run/docker/containerd/4f926f032e0566c4dbdfbb027787b42e6e19ef[25847.0409=
86] audit: type=3D1300 audit(1677113637.488:206): arch=3Dc00000b7 syscall=
=3D206 success=3Dyes exit=3D32 a0=3Dd a1=3D4000ccd240 a2=3D20 a3=3D0 items=
=3D0 ppid=3D409 pid=3D1551 auid=3D4294967295 uid=3D0 gid=3D0 euid=3D0 suid=
=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3Dttymxc1 ses=3D4294967295 c=
omm=3D=E2=80=9Cdockerd=E2=80=9D exe=3D=E2=80=9C/usr/bin/dockerd=E2=80=9D ke=
y=3D(null)
>> >>>>> [25847.041004] audit: type=3D1327 audit(1677113637.488:206): proct=
itle=3D2F7573722F62696E2F646F636B657264002D44
>> >>>>> 6e633864f09a4c9edbdb62d190 module=3Dlibcontainerd namespace=3Dmoby=
 root=3D/var/lib/docker/overlay2/d664e7963d79b51cb1322f9995853ff56f54a3aa29=
94ae5b99b3bcb65c33ec2f/merged
>> >>>>> ERRO[2023-02-23T00:53:57.445101824Z] stream copy error: reading fr=
om a closed fifo
>> >>>>> ERRO[2023-02-23T00:53:57.445126200Z] stream copy error: reading fr=
om a closed fifo
>> >>>>> DEBU[2023-02-23T00:53:57.445172451Z] attach: stderr: end
>> >>>>> DEBU[2023-02-23T00:53:57.445174576Z] attach: stdout: end
>> >>>>> DEBU[2023-02-23T00:53:57.445349705Z] attach done
>> >>>>> DEBU[2023-02-23T00:53:57.469084602Z] Revoking external connectivit=
y on endpoint crazy_bell (1a86f3778b61204dcc7106bed28728a001028ba51f5c5fe73=
1042007ec0ebd3c)
>> >>>>> ERRO[2023-02-23T00:53:57.469206980Z] failed to set to initial name=
space, readlink /proc/1551/task/1558/ns/net: no such file or directory, ini=
tns fd -1: bad file descriptor
>> >>>>> ERRO[2023-02-23T00:53:57.475388115Z] failed to set to initial name=
space, readlink /proc/1551/task/1558/ns/net: no such file or directory, ini=
tns fd -1: bad file descriptor
>> >>>>> ERRO[2023-02-23T00:53:57.489002290Z] failed to set to initial name=
space, readlink /proc/1551/task/1558/ns/net: no such file or directory, ini=
tns fd -1: bad file descriptor
>> >>>>> DEBU[2023-02-23T00:53:57.587904715Z] Releasing addresses for endpo=
int crazy_bell=E2=80=99s interface on network bridge
>> >>>>> DEBU[2023-02-23T00:53:57.610361084Z] ReleaseAddress(LocalDefault/1=
72.17.0.0/16, 172.17.0.2)
>> >>>>> DEBU[2023-02-23T00:53:57.619890544Z] Released address PoolID:Local=
Default/172.17.0.0/16, Address:172.17.0.2 Sequence:App: ipam/default/data, =
ID: LocalDefault/172.17.0.0/16, DBIndex: 0x0, Bits: 65536, Unselected: 6553=
2, Sequence: (0xe0000000, 1)->(0x0, 2046)->(0x1, 1)->end Curr:3
>> >>>>> ERRO[2023-02-23T00:53:57.659608292Z] 4f926f032e0566c4dbdfbb027787b=
42e6e19ef6e633864f09a4c9edbdb62d190 cleanup: failed to delete container fro=
m containerd: no such container
>> >>>>> ERRO[2023-02-23T00:53:57.659718420Z] Handler for POST /v1.41/conta=
iners/4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190/star=
t returned error: failed to create shim task: OCI runtime create failed: ru=
nc create failed: unable to start container process: can=E2=80=99t get fina=
l child=E2=80=99s PID from pipe: EOF: unknown
>> >>>>> docker: Error response from daemon: failed to create shim task: OC=
I runtime create failed: runc create failed: unable to start container proc=
ess: can=E2=80=99t get final child=E2=80=99s PID from pipe: EOF: unknown.
>> >>>>> ERRO[0000] error waiting for container: context canceled
>> >>>>>
>> >>>>>
>> >>>>>
>> >>>>>
>> >>>>> Regards
>> >>>>>
>> >>>>> Simon
>> >>>>>
>> >>>>>
>> >>>>>
>> >>>>>
>> >>>>>
>> >>>>>
>> >>>>
>> >>>>
>> >>>> --
>> >>>> - Thou shalt not follow the NULL pointer, for chaos and madness awa=
it
>> >>>> thee at its end
>> >>>> - "Use the force Harry" - Gandalf, Star Trek II
>> >>>
>> >>>
>> >>>
>> >>>
>> >
>> >
>> > --
>> > - Thou shalt not follow the NULL pointer, for chaos and madness await
>> > thee at its end
>> > - "Use the force Harry" - Gandalf, Star Trek II
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#7902): https://lists.yoctoproject.org/g/meta-virtual=
ization/message/7902
>> Mute This Topic: https://lists.yoctoproject.org/mt/97175886/4946642
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub =
[simonkbaby@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

