Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B431C678D4
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 15:20:40 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web11.18705.1677770432761136533
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 02 Mar 2023 07:20:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BMEtdFjr;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id b16so6845686iof.11
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 02 Mar 2023 07:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ve//j6fvwLUEoOYgOjjWjJOGLB2OWUgBOtuWG0LDyF4=;
        b=BMEtdFjrth0EYfNccXvzQyUUjJNYipvXEcVdnpOTa5T3XEEamy4f25S7sAhcu3Xtei
         lyMXYhRRgH/bOiNdpOChmsHhvsKTR1iwvr1NVYOLzu1t0CS9OgwMt2ntnSSrn9kYSmoP
         Cv992LTrufmxznScwJihSbiil4aYDIaD0N7phex+rNcbAxZiuEd/hMhC88MCWNIdJ9K4
         XyH7IB9ZqGe4URdyWp+sA7puqPp78AQ4AU3LNKITP2lKMrGQMQn1rEy/kvoXtLjCg8+f
         mfvpSuEpTegmcpjFB7NST1EX7K5vnBUSL6+yVjIuxegOHScRyGcX49raFDp/1TZdTMSC
         5X8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ve//j6fvwLUEoOYgOjjWjJOGLB2OWUgBOtuWG0LDyF4=;
        b=R8+3UUWa09rlKqqKXb0x6KRykjJrHnqY4/XQ0EQjhYkTA1oxLlbZA/tu9IWW4XpE5w
         PucUp7YA+kf6EyPiSV5x+0s+Dw+ZMBE1MZlKRB0PQ67BQg9XIrBVfNlYyUSZRdsBGZ0q
         wrOCzoVa3JLQgRjjXcqt8YAdIWvGPnV4OfRURdxHOX/8YvRs/OscwsaNeTpZmQ9CsK1Z
         UmIsK9DkmWzeSGWrf1yUJkAo48KgZgmpJUra4LlHK7Dcnq2X8TZQlG4xeviSCvpZ7BOf
         7Dbndz05LHR6LZFCy23ftkRk8rH8kobFx20INB9GkgnpKzLmS3PAXIZQddYlBu73tPhS
         HjtA==
X-Gm-Message-State: AO0yUKURGypkebuetHGE9sFaF2e/oaMO7o8ORjrPTofky+d5YiIEJpgb
	sHoUXVB7VP5XBtOt0NpB1WPeSzfF8S9J2adMFtU=
X-Google-Smtp-Source: AK7set/Z5v1zyjreGCoXgF+9DO5FtZVabqbdMwesUYnE2xqcCaxRaGDcfiltmw7LBKGKRygqZv6d0ReQT681qF9fGqs=
X-Received: by 2002:a6b:ee19:0:b0:745:405d:b703 with SMTP id
 i25-20020a6bee19000000b00745405db703mr4754805ioh.3.1677770431502; Thu, 02 Mar
 2023 07:20:31 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4MLCRpqYA=OxRe-GdONo_ijpJXFcZdSF=O-tXGHxECgBw@mail.gmail.com>
 <17473B860936B482.18951@lists.yoctoproject.org> <CAEFUPH26tNiuYHEnWuszkPjizNSQo9kV08zNMuE8Bf1+vm-=zA@mail.gmail.com>
 <CADkTA4OB46d04gTpz4bEon71izVVT90ZwKbN0gFKMhUKKo3wQA@mail.gmail.com> <CAEFUPH3VW4f-8fUKgEoJB5HYqgT=o+Yg70Sk_UtrE+frJQYpnQ@mail.gmail.com>
In-Reply-To: <CAEFUPH3VW4f-8fUKgEoJB5HYqgT=o+Yg70Sk_UtrE+frJQYpnQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 2 Mar 2023 10:20:28 -0500
Message-ID: <CADkTA4N2MZuYXw+9a9Re+wJRFDb4rXv=BKvk2BjfGB-PnCFpFA@mail.gmail.com>
Subject: Re: [meta-virtualization] query on docker support changes in yocto
To: SIMON BABY <simonkbaby@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 02 Mar 2023 15:20:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7923

On Wed, Mar 1, 2023 at 10:54=E2=80=AFAM SIMON BABY <simonkbaby@gmail.com> w=
rote:
>
> Hello Bruce,
>
> Of course, you won't always see the daemon running on startup, as
> there are socket and other systemd triggers that will launch the
> daemon when required (and it will continue to run after that).
> Simon> The daemon is not starting by default after every boot. I need to =
type any docker command and wait for 2-3 minutes to get docker run.

A slow startup of the docker daemon is almost always due to networking
being slow, or bouncing between active/inactive. The issues may not
even be on your target, but the target's connection to the network
itself.


> If you add docker-ce-contrib (or docker-moby-contrib, depending on
> what flavour you are building), one of the docker supplied scripts
> will be installed to the target. You can use that to check the running
> kernel configuration and look for issues.
> Simon> yes I run the script check-config.sh and below is the o/p
>

At a glance, the configuration looks fine. As long as you aren't
seeing any missing/errors reported, the core functionality will work
without issue.

Bruce

>
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
> - CONFIG_MEMCG: missing
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
> - CONFIG_CGROUP_BPF: enabled
>
> Optional Features:
> - CONFIG_USER_NS: enabled
> - CONFIG_SECCOMP: enabled
> - CONFIG_SECCOMP_FILTER: enabled
> - CONFIG_CGROUP_PIDS: enabled
> - CONFIG_MEMCG_SWAP: missing
>     (cgroup swap accounting is currently enabled)
> - CONFIG_BLK_CGROUP: enabled
> - CONFIG_BLK_DEV_THROTTLING: enabled
> - CONFIG_CGROUP_PERF: enabled
> - CONFIG_CGROUP_HUGETLB: enabled
> - CONFIG_NET_CLS_CGROUP: enabled (as module)
> - CONFIG_CGROUP_NET_PRIO: enabled
> - CONFIG_CFS_BANDWIDTH: enabled
> - CONFIG_FAIR_GROUP_SCHED: enabled
> - CONFIG_RT_GROUP_SCHED: enabled
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
> - CONFIG_EXT3_FS_POSIX_ACL: enabled
> - CONFIG_EXT3_FS_SECURITY: enabled
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
>       - CONFIG_CRYPTO_SEQIV: enabled
>       - CONFIG_CRYPTO_GHASH: enabled
>       - CONFIG_XFRM: enabled
>       - CONFIG_XFRM_USER: enabled
>       - CONFIG_XFRM_ALGO: enabled
>       - CONFIG_INET_ESP: enabled
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
> You'll find that script at: /usr/share/docker/check-config.sh
>
> On Mon, Feb 27, 2023 at 6:26=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gm=
ail.com> wrote:
>>
>> On Sun, Feb 26, 2023 at 1:42 PM SIMON BABY <simonkbaby@gmail.com> wrote:
>> >
>> > Hi Bruce,
>> > I have enabled some of the kernel flags. I am able to run the docker r=
un command. But I see some logs when I run  the command even though it is e=
xecuted. I also observed that docker daemon is not starting by default afte=
r every reboot. Do we have any specific fix for this?
>> >
>>
>> There's no specific fix for that, because it isn't broken in anything
>> that I've seen. docker starts fine on boot in all of my test cases.
>>
>> Of course, you won't always see the daemon running on startup, as
>> there are socket and other systemd triggers that will launch the
>> daemon when required (and it will continue to run after that).
>>
>> >
>> > root@imx8mpevk:~# docker run hello-world
>> > [  271.841466] docker0: port 1(vethd66b82d) entered blocking state
>> > [  271.847462] docker0: port 1(vethd66b82d) entered disabled state
>> > [  271.853592] device vethd66b82d entered promiscuous mode
>> > [  271.858934] audit: type=3D1700 audit(1677436586.264:37): dev=3Dveth=
d66b82d prom=3D256 old_prom=3D0 auid=3D4294967295 uid=3D0 gid=3D0 ses=3D429=
4967295
>> > [  271.871031] audit: type=3D1300 audit(1677436586.264:37): arch=3Dc00=
000b7 syscall=3D206 success=3Dyes exit=3D40 a0=3Df a1=3D4000f54c90 a2=3D28 =
a3=3D0 items=3D0 ppid=3D1 pid=3D969 auid=3D4294967295 uid=3D0 gid=3D0 euid=
=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) ses=3D4294=
967295 comm=3D"dockerd" exe=3D"/usr/bin/dockerd" subj=3Dkernel key=3D(null)
>> > [  271.898659] audit: type=3D1327 audit(1677436586.264:37): proctitle=
=3D2F7573722F62696E2F646F636B657264002D480066643A2F2F
>> > [  272.315534] eth0: renamed from veth95a7c15
>> > [  272.326397] IPv6: ADDRCONF(NETDEV_CHANGE): vethd66b82d: link become=
s ready
>> > [  272.333388] docker0: port 1(vethd66b82d) entered blocking state
>> > [  272.339340] docker0: port 1(vethd66b82d) entered forwarding state
>> >
>> > Hello from Docker!
>> > This message shows that your installation appears to be working correc=
tly.
>> >
>> > To generate this message, Docker took the following steps:
>> >  1. The Docker client contacted the Docker daemon.
>> >  2. The Docker daemon pulled the "hello-world" image from the Docker H=
ub.
>> >     (arm64v8)
>> >  3. The Docker daemon created a new container from that image which ru=
ns the
>> >     executable that produces the output you are currently reading.
>> >  4. The Docker daemon streamed that output to the Docker client, which=
 sent it
>> >     to your terminal.
>> >
>> > To try something more ambitious, you can run an Ubuntu container with:
>> >  $ docker run -it ubuntu bash
>> >
>> > Share images, automate workflows, and more with a free Docker ID:
>> >  https://hub.docker.com/
>> >
>> > For more examples and ideas, visit:
>> >  https://docs.docker.com/get-started/
>> >
>> > [  272.466210] docker0: port 1(vethd66b82d) entered disabled state
>> > [  272.472523] veth95a7c15: renamed from eth0
>> > [  272.505514] docker0: port 1(vethd66b82d) entered disabled state
>> > [  272.513799] device vethd66b82d left promiscuous mode
>> > [  272.518809] docker0: port 1(vethd66b82d) entered disabled state
>> > [  272.518828] audit: type=3D1700 audit(1677436586.928:38): dev=3Dveth=
d66b82d prom=3D0 old_prom=3D256 auid=3D4294967295 uid=3D0 gid=3D0 ses=3D429=
4967295
>> > [  272.550854] audit: type=3D1300 audit(1677436586.928:38): arch=3Dc00=
000b7 syscall=3D206 success=3Dyes exit=3D32 a0=3Df a1=3D400014dfe0 a2=3D20 =
a3=3D0 items=3D0 ppid=3D1 pid=3D969 auid=3D4294967295 uid=3D0 gid=3D0 euid=
=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) ses=3D4294=
967295 comm=3D"dockerd" exe=3D"/usr/bin/dockerd" subj=3Dkernel key=3D(null)
>> > [  272.578481] audit: type=3D1327 audit(1677436586.928:38): proctitle=
=3D2F7573722F62696E2F646F636B657264002D480066643A2F2F
>> >
>> >
>> > I have compared all the kernel configuration between my local ubuntu l=
inux and the imx8 I am running. Below are all the kernel configuration set =
on my target for the docker to run (as per nxp manual)
>> >
>>
>> If you add docker-ce-contrib (or docker-moby-contrib, depending on
>> what flavour you are building), one of the docker supplied scripts
>> will be installed to the target. You can use that to check the running
>> kernel configuration and look for issues.
>>
>> You'll find that script at: /usr/share/docker/check-config.sh
>>
>> Bruce
>>
>> >
>> >
>> > root@imx8mpevk:~# sh kernel.sh
>> > info: reading kernel config from /proc/config.gz ...
>> >
>> > Generally Necessary:
>> > - cgroup hierarchy: properly mounted [/sys/fs/cgroup]
>> > - CONFIG_NAMESPACES: enabled
>> > - CONFIG_NET_NS: enabled
>> > - CONFIG_PID_NS: enabled
>> > - CONFIG_IPC_NS: enabled
>> > - CONFIG_UTS_NS: enabled
>> > - CONFIG_CGROUPS: enabled
>> > - CONFIG_CGROUP_CPUACCT: enabled
>> > - CONFIG_CGROUP_DEVICE: enabled
>> > - CONFIG_CGROUP_FREEZER: enabled
>> > - CONFIG_CGROUP_SCHED: enabled
>> > - CONFIG_CPUSETS: enabled
>> > - CONFIG_MEMCG: enabled
>> > - CONFIG_KEYS: enabled
>> > - CONFIG_VETH: enabled (as module)
>> > - CONFIG_BRIDGE: enabled
>> > - CONFIG_BRIDGE_NETFILTER: enabled (as module)
>> > - CONFIG_IP_NF_FILTER: enabled (as module)
>> > - CONFIG_IP_NF_TARGET_MASQUERADE: enabled (as module)
>> > - CONFIG_NETFILTER_XT_MATCH_ADDRTYPE: enabled (as module)
>> > - CONFIG_NETFILTER_XT_MATCH_CONNTRACK: enabled (as module)
>> > - CONFIG_NETFILTER_XT_MATCH_IPVS: enabled (as module)
>> > - CONFIG_NETFILTER_XT_MARK: enabled (as module)
>> > - CONFIG_IP_NF_NAT: enabled
>> > - CONFIG_NF_NAT: enabled
>> > - CONFIG_POSIX_MQUEUE: enabled
>> > - CONFIG_CGROUP_BPF: missing
>> >
>> > Optional Features:
>> > - CONFIG_USER_NS: enabled
>> > - CONFIG_SECCOMP: enabled
>> > - CONFIG_SECCOMP_FILTER: enabled
>> > - CONFIG_CGROUP_PIDS: enabled
>> > - CONFIG_MEMCG_SWAP: enabled
>> >     (cgroup swap accounting is currently enabled)
>> > - CONFIG_BLK_CGROUP: enabled
>> > - CONFIG_BLK_DEV_THROTTLING: enabled
>> > - CONFIG_CGROUP_PERF: enabled
>> > - CONFIG_CGROUP_HUGETLB: enabled
>> > - CONFIG_NET_CLS_CGROUP: enabled (as module)
>> > - CONFIG_CGROUP_NET_PRIO: enabled
>> > - CONFIG_CFS_BANDWIDTH: enabled
>> > - CONFIG_FAIR_GROUP_SCHED: enabled
>> > - CONFIG_RT_GROUP_SCHED: missing
>> > - CONFIG_IP_NF_TARGET_REDIRECT: enabled (as module)
>> > - CONFIG_IP_VS: enabled (as module)
>> > - CONFIG_IP_VS_NFCT: enabled
>> > - CONFIG_IP_VS_PROTO_TCP: enabled
>> > - CONFIG_IP_VS_PROTO_UDP: enabled
>> > - CONFIG_IP_VS_RR: enabled (as module)
>> > - CONFIG_SECURITY_SELINUX: enabled
>> > - CONFIG_SECURITY_APPARMOR: enabled
>> > - CONFIG_EXT3_FS: enabled
>> > - CONFIG_EXT3_FS_XATTR: missing
>> > - CONFIG_EXT3_FS_POSIX_ACL: missing
>> > - CONFIG_EXT3_FS_SECURITY: missing
>> >     (enable these ext3 configs if you are using ext3 as backing filesy=
stem)
>> > - CONFIG_EXT4_FS: enabled
>> > - CONFIG_EXT4_FS_POSIX_ACL: enabled
>> > - CONFIG_EXT4_FS_SECURITY: enabled
>> > - Network Drivers:
>> >   - "overlay":
>> >     - CONFIG_VXLAN: enabled (as module)
>> >     - CONFIG_BRIDGE_VLAN_FILTERING: enabled
>> >       Optional (for encrypted networks):
>> >       - CONFIG_CRYPTO: enabled
>> >       - CONFIG_CRYPTO_AEAD: enabled
>> >       - CONFIG_CRYPTO_GCM: enabled
>> >       - CONFIG_CRYPTO_SEQIV: missing
>> >       - CONFIG_CRYPTO_GHASH: enabled
>> >       - CONFIG_XFRM: missing
>> >       - CONFIG_XFRM_USER: missing
>> >       - CONFIG_XFRM_ALGO: missing
>> >       - CONFIG_INET_ESP: missing
>> >   - "ipvlan":
>> >     - CONFIG_IPVLAN: enabled (as module)
>> >   - "macvlan":
>> >     - CONFIG_MACVLAN: enabled (as module)
>> >     - CONFIG_DUMMY: enabled (as module)
>> >   - "ftp,tftp client in container":
>> >     - CONFIG_NF_NAT_FTP: enabled (as module)
>> >     - CONFIG_NF_CONNTRACK_FTP: enabled (as module)
>> >     - CONFIG_NF_NAT_TFTP: enabled (as module)
>> >     - CONFIG_NF_CONNTRACK_TFTP: enabled (as module)
>> > - Storage Drivers:
>> >   - "aufs":
>> >     - CONFIG_AUFS_FS: missing
>> >   - "btrfs":
>> >     - CONFIG_BTRFS_FS: enabled (as module)
>> >     - CONFIG_BTRFS_FS_POSIX_ACL: enabled
>> >   - "devicemapper":
>> >     - CONFIG_BLK_DEV_DM: enabled (as module)
>> >     - CONFIG_DM_THIN_PROVISIONING: enabled (as module)
>> >   - "overlay":
>> >     - CONFIG_OVERLAY_FS: enabled (as module)
>> >   - "zfs":
>> >     - /dev/zfs: missing
>> >     - zfs command: missing
>> >     - zpool command: missing
>> >
>> >
>> > Regards
>> > Simon
>> >
>> > On Sat, Feb 25, 2023 at 5:27=E2=80=AFPM SIMON BABY via lists.yoctoproj=
ect.org <simonkbaby=3Dgmail.com@lists.yoctoproject.org> wrote:
>> >>
>> >> Thank you Bruce . I will do more research in that direction ( kernel =
configuration)
>> >>
>> >> Regards
>> >> Simon
>> >> > On Feb 25, 2023, at 5:20 PM, Bruce Ashfield <bruce.ashfield@gmail.c=
om> wrote:
>> >> >
>> >> > =EF=BB=BFOn Sat, Feb 25, 2023 at 5:35 PM SIMON BABY <simonkbaby@gma=
il.com> wrote:
>> >> >>
>> >> >> Hi Bruce,
>> >> >> I also observed that the docker daemon is not starting by default =
and if I launch it manually , it takes a long time to start. Am I missing a=
ny kernel modules?
>> >> >>
>> >> >> Here is the  o/p from  "systemctl status docker.service".
>> >> >>
>> >> >> root@imx8mpevk:~# systemctl status docker.service
>> >> >> * docker.service - Docker Application Container Engine
>> >> >>     Loaded: loaded (/lib/systemd/system/docker.service; disabled; =
vendor preset: disabled)
>> >> >>     Active: active (running) since Sat 2023-02-25 22:19:54 UTC; 4m=
in 10s ago
>> >> >> TriggeredBy: * docker.socket
>> >> >>       Docs: https://docs.docker.com
>> >> >>   Main PID: 423 (dockerd)
>> >> >>      Tasks: 11 (limit: 5578)
>> >> >>     Memory: 115.0M
>> >> >>     CGroup: /system.slice/docker.service
>> >> >>             `-423 /usr/bin/dockerd -H fd://
>> >> >>
>> >> >> Feb 25 22:19:53 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:19:5=
3.837738928Z" level=3Dwarning msg=3D"Running modprobe bridge br_netfilter f=
ailed with message: modprobe: WARNING: Module br_netfilter not found in dir=
ector...ror: exit status 1"
>> >> >
>> >> > The above error could be a missing module, or a missing iptables mo=
dule.
>> >> >
>> >> >
>> >> >> Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:19:5=
4.071250923Z" level=3Dwarning msg=3D"Could not load necessary modules for I=
PSEC rules: protocol not supported"
>> >> >> Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:19:5=
4.078250217Z" level=3Dwarning msg=3D"Could not load necessary modules for C=
onntrack: Running modprobe nf_conntrack_netlink failed with message: `modpr=
obe: WARNING: Module nf_...
>> >> >
>> >> > As does the above one.
>> >> >
>> >> > so you definitely have missing configuration.
>> >> >
>> >> > Bruce
>> >> >
>> >> >> Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:19:5=
4.081471487Z" level=3Dinfo msg=3D"Default bridge (docker0) is assigned with=
 an IP address 172.17.0.0/16. Daemon option --bip can be used to set a pref=
erred IP address"
>> >> >> Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:19:5=
4.199132980Z" level=3Dinfo msg=3D"Loading containers: done."
>> >> >> Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:19:5=
4.296845346Z" level=3Dinfo msg=3D"Docker daemon" commit=3D906f57ff5b-unsupp=
orted graphdriver(s)=3Doverlay2 version=3D20.10.12-ce
>> >> >> Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:19:5=
4.297236599Z" level=3Dinfo msg=3D"Daemon has completed initialization"
>> >> >> Feb 25 22:19:54 imx8mpevk systemd[1]: Started Docker Application C=
ontainer Engine.
>> >> >> Feb 25 22:19:54 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:19:5=
4.372354197Z" level=3Dinfo msg=3D"API listen on /run/docker.sock"
>> >> >> Feb 25 22:23:14 imx8mpevk dockerd[423]: time=3D"2023-02-25T22:23:1=
4.188738979Z" level=3Dinfo msg=3D"ignoring event" container=3Da973c205bf7c0=
e57450de3241767f39e4983b6b174e231e014159ed8ae220791 module=3Dlibcontainerd =
namespace...*events.TaskDelete"
>> >> >> Hint: Some lines were ellipsized, use -l to show in full.
>> >> >> root@imx8mpevk:~# Feb 25 22:19:53 imx8mpevk dockerd[423]: time=3D"=
2023-02-25T22:19:53.837738928Z" level=3Dwarning msg=3D"Running modprobe bri=
dge br_netfilter failed with message: modprobe: WARNING: Module br_netfilte=
r not found in director...ror: exit status 1"
>> >> >>
>> >> >>
>> >> >> Regards
>> >> >> Simon
>> >> >>
>> >> >>> On Fri, Feb 24, 2023 at 6:47 PM SIMON BABY via lists.yoctoproject=
.org <simonkbaby=3Dgmail.com@lists.yoctoproject.org> wrote:
>> >> >>>
>> >> >>> Hello Bruce,
>> >> >>>
>> >> >>> Thank you for the inputs.
>> >> >>>
>> >> >>>
>> >> >>> Yes, I use linux-yocto. The target linux version is below.
>> >> >>>
>> >> >>>
>> >> >>>
>> >> >>> Linux imx8mpevk 5.15.32-rt39-lts-next+g2a8a193a07b4 #1 SMP PREEMP=
T_RT Tue Jun 7 02:34:46 UTC 2022 aarch64 aarch64 aarch64 GNU/Linux
>> >> >>>
>> >> >>>
>> >> >>>
>> >> >>> The layers used are in the link below.
>> >> >>>
>> >> >>> https://source.codeaurora.org/external/imx/imx-manifest/tree/imx-=
5.15.32-2.0.0.xml?h=3Dimx-linux-kirkstone
>> >> >>>
>> >> >>>
>> >> >>>
>> >> >>> I tried to add IMAGE_INSTALL:append =3D " kernel-modules" in loca=
l.conf but it did not make any difference.
>> >> >>>
>> >> >>>
>> >> >>>
>> >> >>> The docker version I am running on the target is 20.10.12-ce
>> >> >>>
>> >> >>>
>> >> >>>
>> >> >>> Below is the error I am getting on the target.
>> >> >>>
>> >> >>>
>> >> >>>
>> >> >>> root@imx8mpevk:~# docker run hello-world
>> >> >>>
>> >> >>> [ 1359.005452] docker0: port 1(veth4dc9000) entered blocking stat=
e
>> >> >>>
>> >> >>> [ 1359.005512] docker0: port 1(veth4dc9000) entered disabled stat=
e
>> >> >>>
>> >> >>> [ 1359.005921] device veth4dc9000 entered promiscuous mode
>> >> >>>
>> >> >>> [ 1359.005994] audit: type=3D1700 audit(1677283528.914:37): dev=
=3Dveth4dc9000 prom=3D256 old_prom=3D0 auid=3D4294967295 uid=3D0 gid=3D0 se=
s=3D4294967295
>> >> >>>
>> >> >>> [ 1359.013139] audit: type=3D1300 audit(1677283528.914:37): arch=
=3Dc00000b7 syscall=3D206 success=3Dyes exit=3D40 a0=3De a1=3D4000ec0d50 a2=
=3D28 a3=3D0 items=3D0 ppid=3D1 pid=3D446 auid=3D4294967295 uid=3D0 gid=3D0=
 euid=3D0 suid=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3D(none) ses=
=3D4294967295 comm=3D"dockerd" exe=3D"/usr/bin/dockerd" key=3D(null)
>> >> >>>
>> >> >>> [ 1359.013228] audit: type=3D1327 audit(1677283528.914:37): proct=
itle=3D2F7573722F62696E2F646F636B657264002D480066643A2F2F
>> >> >>>
>> >> >>> [ 1359.263483] docker0: port 1(veth4dc9000) entered disabled stat=
e
>> >> >>>
>> >> >>> [ 1359.298263] device veth4dc9000 left promiscuous mode
>> >> >>>
>> >> >>> [ 1359.298305] docker0: port 1(veth4dc9000) entered disabled stat=
e
>> >> >>>
>> >> >>> [ 1359.298646] audit: type=3D1700 audit(1677283529.164:38): dev=
=3Dveth4dc9000 prom=3D0 old_prom=3D256 auid=3D4294967295 uid=3D0 gid=3D0 se=
s=3D4294967295
>> >> >>>
>> >> >>> docker: Error response from daemon: failed to create shim task: O=
CI runtime create failed: runc create failed: unable to start container pro=
cess: can't get final child's PID from pipe: EOF: unknown.
>> >> >>>
>> >> >>> ERRO[0000] error waiting for container: context canceled
>> >> >>>
>> >> >>>
>> >> >>>
>> >> >>>
>> >> >>>
>> >> >>>
>> >> >>>
>> >> >>> Also sending the local.conf and bblayers.conf file
>> >> >>>
>> >> >>>
>> >> >>>
>> >> >>> local.conf:
>> >> >>>
>> >> >>>
>> >> >>>
>> >> >>> MACHINE ??=3D 'imx8mpevk'
>> >> >>>
>> >> >>> DISTRO ?=3D 'fsl-imx-wayland'
>> >> >>>
>> >> >>> PACKAGE_CLASSES ?=3D 'package_rpm'
>> >> >>>
>> >> >>> EXTRA_IMAGE_FEATURES ?=3D "debug-tweaks"
>> >> >>>
>> >> >>> USER_CLASSES ?=3D "buildstats"
>> >> >>>
>> >> >>> PATCHRESOLVE =3D "noop"
>> >> >>>
>> >> >>> BB_DISKMON_DIRS ??=3D "\
>> >> >>>
>> >> >>>    STOPTASKS,${TMPDIR},1G,100K \
>> >> >>>
>> >> >>>    STOPTASKS,${DL_DIR},1G,100K \
>> >> >>>
>> >> >>>    STOPTASKS,${SSTATE_DIR},1G,100K \
>> >> >>>
>> >> >>>   STOPTASKS,/tmp,100M,100K \
>> >> >>>
>> >> >>>    HALT,${TMPDIR},100M,1K \
>> >> >>>
>> >> >>>    HALT,${DL_DIR},100M,1K \
>> >> >>>
>> >> >>>    HALT,${SSTATE_DIR},100M,1K \
>> >> >>>
>> >> >>>    HALT,/tmp,10M,1K"
>> >> >>>
>> >> >>> PACKAGECONFIG:append:pn-qemu-system-native =3D " sdl"
>> >> >>>
>> >> >>> CONF_VERSION =3D "2"
>> >> >>>
>> >> >>>
>> >> >>>
>> >> >>> DL_DIR ?=3D "${BSPDIR}/downloads/"
>> >> >>>
>> >> >>> ACCEPT_FSL_EULA =3D "1"
>> >> >>>
>> >> >>>
>> >> >>>
>> >> >>> # Switch to Debian packaging and include package-management in th=
e image
>> >> >>>
>> >> >>> PACKAGE_CLASSES =3D "package_deb"
>> >> >>>
>> >> >>> EXTRA_IMAGE_FEATURES +=3D "package-management"
>> >> >>>
>> >> >>> DISTRO_FEATURES:append =3D " virtualization"
>> >> >>>
>> >> >>> IMAGE_INSTALL:append =3D " docker-ce"
>> >> >>>
>> >> >>> IMAGE_INSTALL:append =3D " kernel-modules"
>> >> >>>
>> >> >>>
>> >> >>>
>> >> >>> EXTRA_IMAGE_FEATURES =3D "debug-tweaks tools-profile"
>> >> >>>
>> >> >>>
>> >> >>>
>> >> >>>
>> >> >>>
>> >> >>>
>> >> >>>
>> >> >>> bblayers.conf
>> >> >>>
>> >> >>>
>> >> >>>
>> >> >>> LCONF_VERSION =3D "7"
>> >> >>>
>> >> >>>
>> >> >>>
>> >> >>> BBPATH =3D "${TOPDIR}"
>> >> >>>
>> >> >>> BSPDIR :=3D ${@os.path.abspath(os.path.dirname(d.getVar('FILE', T=
rue)) + '/../..')}
>> >> >>>
>> >> >>>
>> >> >>>
>> >> >>> BBFILES ?=3D ""
>> >> >>>
>> >> >>> BBLAYERS =3D " \
>> >> >>>
>> >> >>>  ${BSPDIR}/sources/poky/meta \
>> >> >>>
>> >> >>>  ${BSPDIR}/sources/poky/meta-poky \
>> >> >>>
>> >> >>>  \
>> >> >>>
>> >> >>>  ${BSPDIR}/sources/meta-openembedded/meta-oe \
>> >> >>>
>> >> >>>  ${BSPDIR}/sources/meta-openembedded/meta-multimedia \
>> >> >>>
>> >> >>>  ${BSPDIR}/sources/meta-openembedded/meta-python \
>> >> >>>
>> >> >>>  \
>> >> >>>
>> >> >>>  ${BSPDIR}/sources/meta-freescale \
>> >> >>>
>> >> >>>  ${BSPDIR}/sources/meta-freescale-3rdparty \
>> >> >>>
>> >> >>>  ${BSPDIR}/sources/meta-freescale-distro \
>> >> >>>
>> >> >>> "
>> >> >>>
>> >> >>>
>> >> >>>
>> >> >>> # i.MX Yocto Project Release layers
>> >> >>>
>> >> >>> BBLAYERS +=3D "${BSPDIR}/sources/meta-imx/meta-bsp"
>> >> >>>
>> >> >>> BBLAYERS +=3D "${BSPDIR}/sources/meta-imx/meta-sdk"
>> >> >>>
>> >> >>> BBLAYERS +=3D "${BSPDIR}/sources/meta-imx/meta-ml"
>> >> >>>
>> >> >>> BBLAYERS +=3D "${BSPDIR}/sources/meta-imx/meta-v2x"
>> >> >>>
>> >> >>> #BBLAYERS +=3D "${BSPDIR}/sources/meta-nxp-demo-experience"
>> >> >>>
>> >> >>>
>> >> >>>
>> >> >>> #BBLAYERS +=3D "${BSPDIR}/sources/meta-browser/meta-chromium"
>> >> >>>
>> >> >>> #BBLAYERS +=3D "${BSPDIR}/sources/meta-clang"
>> >> >>>
>> >> >>> #BBLAYERS +=3D "${BSPDIR}/sources/meta-openembedded/meta-gnome"
>> >> >>>
>> >> >>> BBLAYERS +=3D "${BSPDIR}/sources/meta-openembedded/meta-networkin=
g"
>> >> >>>
>> >> >>> BBLAYERS +=3D "${BSPDIR}/sources/meta-openembedded/meta-filesyste=
ms"
>> >> >>>
>> >> >>> BBLAYERS +=3D "${BSPDIR}/sources/meta-virtualization"
>> >> >>>
>> >> >>> BBLAYERS +=3D "${BSPDIR}/sources/meta-teledyne-wapng"
>> >> >>>
>> >> >>> BBLAYERS +=3D "${BSPDIR}/sources/meta-aws"
>> >> >>>
>> >> >>>
>> >> >>>
>> >> >>> Regards
>> >> >>>
>> >> >>> Simon
>> >> >>>
>> >> >>>
>> >> >>> On Thu, Feb 23, 2023 at 12:03 PM Bruce Ashfield <bruce.ashfield@g=
mail.com> wrote:
>> >> >>>>
>> >> >>>> On Wed, Feb 22, 2023 at 9:47 PM SIMON BABY <simonkbaby@gmail.com=
> wrote:
>> >> >>>>>
>> >> >>>>> Hello Team,
>> >> >>>>>
>> >> >>>>> Can I know what are the changes required in yocto to run docker=
 and its dependencies  on my target embedded system. I have added the below=
 changes. Do I need more plugins and packages ?
>> >> >>>>>
>> >> >>>>> bblayers.conf:
>> >> >>>>>
>> >> >>>>>
>> >> >>>>>
>> >> >>>>> BBLAYERS +=3D "${BSPDIR}/sources/meta-openembedded/meta-network=
ing"
>> >> >>>>>
>> >> >>>>> BBLAYERS +=3D "${BSPDIR}/sources/meta-openembedded/meta-filesys=
tems"
>> >> >>>>>
>> >> >>>>> BBLAYERS +=3D "${BSPDIR}/sources/meta-virtualization"
>> >> >>>>>
>> >> >>>>>
>> >> >>>>>
>> >> >>>>> local.conf:
>> >> >>>>>
>> >> >>>>>
>> >> >>>>>
>> >> >>>>> DISTRO_FEATURES:append =3D " virtualization"
>> >> >>>>>
>> >> >>>>> IMAGE_INSTALL:append =3D " docker-ce"
>> >> >>>>>
>> >> >>>>
>> >> >>>> You likely are missing kernel configuration values required to r=
un the
>> >> >>>> containers.
>> >> >>>>
>> >> >>>> What kernel are you using (linux-yocto?), and are you on the mas=
ter
>> >> >>>> branch of the layers ?
>> >> >>>>
>> >> >>>> As you can see, it is working in my latest tests:
>> >> >>>>
>> >> >>>> root@qemux86-64:~# docker --version
>> >> >>>> Docker version 23.0.1, build a5ee5b1dfc
>> >> >>>> root@qemux86-64:~# docker pull alpine
>> >> >>>> Using default tag: latest
>> >> >>>> latest: Pulling from library/alpine
>> >> >>>> 63b65145d645: Pull complete
>> >> >>>> Digest: sha256:69665d02cb32192e52e07644d76bc6f25abeb5410edc1c7a8=
1a10ba3f0efb90a
>> >> >>>> Status: Downloaded newer image for alpine:latest
>> >> >>>> docker.io/library/alpine:latest
>> >> >>>> root@qemux86-64:~# docker run -it alpine /bin/sh
>> >> >>>> / #
>> >> >>>>
>> >> >>>> Try adding "kernel-modules" to your IMAGE_INSTALL, and see if th=
at
>> >> >>>> makes a difference.
>> >> >>>>
>> >> >>>> Bruce
>> >> >>>>
>> >> >>>>
>> >> >>>>>
>> >> >>>>>
>> >> >>>>> WIth the above changes and tested on the target I am getting th=
e below error when try to run "docker run hello-world"
>> >> >>>>>
>> >> >>>>>
>> >> >>>>> root@imx8mpevk:~# docker run hello-world
>> >> >>>>> DEBU[2023-02-23T00:53:57.064704083Z] Calling HEAD /_ping
>> >> >>>>> DEBU[2023-02-23T00:53:57.068355788Z] Calling POST /v1.41/contai=
ners/create
>> >> >>>>> DEBU[2023-02-23T00:53:57.069098805Z] form data: {=E2=80=9CAttac=
hStderr=E2=80=9D:true,=E2=80=9CAttachStdin=E2=80=9D:false,=E2=80=9CAttachSt=
dout=E2=80=9D:true,=E2=80=9CCmd=E2=80=9D:null,=E2=80=9CDomainname=E2=80=9D:=
=E2=80=9C=E2=80=9D,=E2=80=9CEntrypoint=E2=80=9D:null,=E2=80=9CEnv=E2=80=9D:=
null,=E2=80=9CHostConfig=E2=80=9D:{=E2=80=9CAutoRemove=E2=80=9D:false,=E2=
=80=9CBinds=E2=80=9D:null,=E2=80=9CBlkioDeviceReadBps=E2=80=9D:null,=E2=80=
=9CBlkioDeviceReadIOps=E2=80=9D:null,=E2=80=9CBlkioDeviceWriteBps=E2=80=9D:=
null,=E2=80=9CBlkioDeviceWriteIOps=E2=80=9D:null,=E2=80=9CBlkioWeight=E2=80=
=9D:0,=E2=80=9CBlkioWeightDevice=E2=80=9D:,=E2=80=9CCapAdd=E2=80=9D:null,=
=E2=80=9CCapDrop=E2=80=9D:null,=E2=80=9CCgroup=E2=80=9D:=E2=80=9C=E2=80=9D,=
=E2=80=9CCgroupParent=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CCgroupnsMode=E2=
=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CConsoleSize=E2=80=9D:[0,0],=E2=80=9CCont=
ainerIDFile=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CCpuCount=E2=80=9D:0,=E2=80=
=9CCpuPercent=E2=80=9D:0,=E2=80=9CCpuPeriod=E2=80=9D:0,=E2=80=9CCpuQuota=E2=
=80=9D:0,=E2=80=9CCpuRealtimePeriod=E2=80=9D:0,=E2=80=9CCpuRealtimeRuntime=
=E2=80=9D:0,=E2=80=9CCpuShares=E2=80=9D:0,=E2=80=9CCpusetCpus=E2=80=9D:=E2=
=80=9C=E2=80=9D,=E2=80=9CCpusetMems=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CDe=
viceCgroupRules=E2=80=9D:null,=E2=80=9CDeviceRequests=E2=80=9D:null,=E2=80=
=9CDevices=E2=80=9D:,=E2=80=9CDns=E2=80=9D:,=E2=80=9CDnsOptions=E2=80=9D:,=
=E2=80=9CDnsSearch=E2=80=9D:,=E2=80=9CExtraHosts=E2=80=9D:null,=E2=80=9CGro=
upAdd=E2=80=9D:null,=E2=80=9CIOMaximumBandwidth=E2=80=9D:0,=E2=80=9CIOMaxim=
umIOps=E2=80=9D:0,=E2=80=9CIpcMode=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CIso=
lation=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CKernelMemory=E2=80=9D:0,=E2=80=
=9CKernelMemoryTCP=E2=80=9D:0,=E2=80=9CLinks=E2=80=9D:null,=E2=80=9CLogConf=
ig=E2=80=9D:{=E2=80=9CConfig=E2=80=9D:{},=E2=80=9CType=E2=80=9D:=E2=80=9C=
=E2=80=9D},=E2=80=9CMaskedPaths=E2=80=9D:null,=E2=80=9CMemory=E2=80=9D:0,=
=E2=80=9CMemoryReservation=E2=80=9D:0,=E2=80=9CMemorySwap=E2=80=9D:0,=E2=80=
=9CMemorySwappiness=E2=80=9D:-1,=E2=80=9CNanoCpus=E2=80=9D:0,=E2=80=9CNetwo=
rkMode=E2=80=9D:=E2=80=9Cdefault=E2=80=9D,=E2=80=9COomKillDisable=E2=80=9D:=
false,=E2=80=9COomScoreAdj=E2=80=9D:0,=E2=80=9CPidMode=E2=80=9D:=E2=80=9C=
=E2=80=9D,=E2=80=9CPidsLimit=E2=80=9D:0,=E2=80=9CPortBindings=E2=80=9D:{},=
=E2=80=9CPrivileged=E2=80=9D:false,=E2=80=9CPublishAllPorts=E2=80=9D:false,=
=E2=80=9CReadonlyPaths=E2=80=9D:null,=E2=80=9CReadonlyRootfs=E2=80=9D:false=
,=E2=80=9CRestartPolicy=E2=80=9D:{=E2=80=9CMaximumRetryCount=E2=80=9D:0,=E2=
=80=9CName=E2=80=9D:=E2=80=9Cno=E2=80=9D},=E2=80=9CSecurityOpt=E2=80=9D:nul=
l,=E2=80=9CShmSize=E2=80=9D:0,=E2=80=9CUTSMode=E2=80=9D:=E2=80=9C=E2=80=9D,=
=E2=80=9CUlimits=E2=80=9D:null,=E2=80=9CUsernsMode=E2=80=9D:=E2=80=9C=E2=80=
=9D,=E2=80=9CVolumeDriver=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CVolumesFrom=
=E2=80=9D:null},=E2=80=9CHostname=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CImag=
e=E2=80=9D:=E2=80=9Chello-world=E2=80=9D,=E2=80=9CLabels=E2=80=9D:{},=E2=80=
=9CNetworkingConfig=E2=80=9D:{=E2=80=9CEndpointsConfig=E2=80=9D:{}},=E2=80=
=9COnBuild=E2=80=9D:null,=E2=80=9COpenStdin=E2=80=9D:false,=E2=80=9CPlatfor=
m=E2=80=9D:null,=E2=80=9CStdinOnce=E2=80=9D:false,=E2=80=9CTty=E2=80=9D:fal=
se,=E2=80=9CUser=E2=80=9D:=E2=80=9C=E2=80=9D,=E2=80=9CVolumes=E2=80=9D:{},=
=E2=80=9CWorkingDir=E2=80=9D:=E2=80=9C=E2=80=9D}
>> >> >>>>> DEBU[25846.680992] docker0: port 1(veth659d267) entered blockin=
g state
>> >> >>>>> [25846.681041] docker0: port 1(veth659d267) entered disabled st=
ate
>> >> >>>>> [2023-02-23T00:53:57.121358454Z] [25846.681312] device veth659d=
267 entered promiscuous mode
>> >> >>>>> container mounted via layerStore:[25846.681392] audit: type=3D1=
700 audit(1677113637.219:205): dev=3Dveth659d267 prom=3D256 old_prom=3D0 au=
id=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295
>> >> >>>>> &{/var/lib/docker/overlay2/d664e[25846.683022] audit: type=3D13=
00 audit(1677113637.219:205): arch=3Dc00000b7 syscall=3D206 success=3Dyes e=
xit=3D40 a0=3Dd a1=3D4000c507b0 a2=3D28 a3=3D0 items=3D0 ppid=3D409 pid=3D1=
551 auid=3D4294967295 uid=3D0 gid=3D0 euid=3D0 suid=3D0 fsuid=3D0 egid=3D0 =
sgid=3D0 fsgid=3D0 tty=3Dttymxc1 ses=3D4294967295 comm=3D=E2=80=9Cdockerd=
=E2=80=9D exe=3D=E2=80=9C/usr/bin/dockerd=E2=80=9D key=3D(null)
>> >> >>>>> 7963d79b51cb1322f9995853ff56f54a3[25846.683091] audit: type=3D1=
327 audit(1677113637.219:205): proctitle=3D2F7573722F62696E2F646F636B657264=
002D44
>> >> >>>>> aa2994ae5b99b3bcb65c33ec2f/merged 0xaaaabdb0b060 0xaaaabdb0b060=
} container=3D4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d=
190
>> >> >>>>> DEBU[2023-02-23T00:53:57.184741848Z] Calling POST /v1.41/contai=
ners/4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190/attac=
h?stderr=3D1&stdout=3D1&stream=3D1
>> >> >>>>> DEBU[2023-02-23T00:53:57.185112606Z] attach: stderr: begin
>> >> >>>>> DEBU[2023-02-23T00:53:57.185130357Z] attach: stdout: begin
>> >> >>>>> DEBU[2023-02-23T00:53:57.186340258Z] Calling POST /v1.41/contai=
ners/4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190/wait?=
condition=3Dnext-exit
>> >> >>>>> DEBU[2023-02-23T00:53:57.188347802Z] Calling POST /v1.41/contai=
ners/4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190/start
>> >> >>>>> DEBU[2023-02-23T00:53:57.190864983Z] container mounted via laye=
rStore: &{/var/lib/docker/overlay2/d664e7963d79b51cb1322f9995853ff56f54a3aa=
2994ae5b99b3bcb65c33ec2f/merged 0xaaaabdb0b060 0xaaaabdb0b060} container=3D=
4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190
>> >> >>>>> DEBU[2023-02-23T00:53:57.191993758Z] Assigning addresses for en=
dpoint crazy_bell=E2=80=99s interface on network bridge
>> >> >>>>> DEBU[2023-02-23T00:53:57.192083760Z] RequestAddress(LocalDefaul=
t/172.17.0.0/16, , map)
>> >> >>>>> DEBU[2023-02-23T00:53:57.192149761Z] Request address PoolID:172=
.17.0.0/16 App: ipam/default/data, ID: LocalDefault/172.17.0.0/16, DBIndex:=
 0x0, Bits: 65536, Unselected: 65533, Sequence: (0xc0000000, 1)->(0x0, 2046=
)->(0x1, 1)->end Curr:3 Serial:false PrefAddress:
>> >> >>>>> ERRO[2023-02-23T00:53:57.192262764Z] failed to set to initial n=
amespace, readlink /proc/1551/task/1555/ns/net: no such file or directory, =
initns fd -1: bad file descriptor
>> >> >>>>> DEBU[2023-02-23T00:53:57.252893597Z] Assigning addresses for en=
dpoint crazy_bell=E2=80=99s interface on network bridge
>> >> >>>>> ERRO[2023-02-23T00:53:57.274329693Z] failed to set to initial n=
amespace, readlink /proc/1551/task/1555/ns/net: no such file or directory, =
initns fd -1: bad file descriptor
>> >> >>>>> DEBU[2023-02-23T00:53:57.294111754Z] Programming external conne=
ctivity on endpoint crazy_bell (1a86f3778b61204dcc7106bed28728a001028ba51f5=
c5fe731042007ec0ebd3c)
>> >> >>>>> ERRO[2023-02-23T00:53:57.299150489Z] failed [25846.962844] dock=
er0: port 1(veth659d267) entered disabled state
>> >> >>>>> to set to initial namespace, readlink /proc/1551/task/1555/ns/n=
et: no such file or directory, initns fd -1: bad file descriptor
>> >> >>>>> DEBU[2023-02-23T00:53:57.304933242Z] EnableService 4f926f032e05=
66c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190 START
>> >> >>>>> DEBU[2023-02-23T00:53:57.305002118Z] Enabl[25846.996647] device=
 veth659d267 left promiscuous mode
>> >> >>>>> eService 4f926f032e0566c4dbdfbb02[25846.996686] docker0: port 1=
(veth659d267) entered disabled state
>> >> >>>>> [25846.996703] audit: type=3D1700 audit(1677113637.488:206): de=
v=3Dveth659d267 prom=3D0 old_prom=3D256 auid=3D4294967295 uid=3D0 gid=3D0 s=
es=3D4294967295
>> >> >>>>> 7787b42e6e19ef6e633864f09a4c9edbdb62d190 DONE
>> >> >>>>> DEBU[2023-02-23T00:53:57.313909564Z] bundle dir created bundle=
=3D/var/run/docker/containerd/4f926f032e0566c4dbdfbb027787b42e6e19ef[25847.=
040986] audit: type=3D1300 audit(1677113637.488:206): arch=3Dc00000b7 sysca=
ll=3D206 success=3Dyes exit=3D32 a0=3Dd a1=3D4000ccd240 a2=3D20 a3=3D0 item=
s=3D0 ppid=3D409 pid=3D1551 auid=3D4294967295 uid=3D0 gid=3D0 euid=3D0 suid=
=3D0 fsuid=3D0 egid=3D0 sgid=3D0 fsgid=3D0 tty=3Dttymxc1 ses=3D4294967295 c=
omm=3D=E2=80=9Cdockerd=E2=80=9D exe=3D=E2=80=9C/usr/bin/dockerd=E2=80=9D ke=
y=3D(null)
>> >> >>>>> [25847.041004] audit: type=3D1327 audit(1677113637.488:206): pr=
octitle=3D2F7573722F62696E2F646F636B657264002D44
>> >> >>>>> 6e633864f09a4c9edbdb62d190 module=3Dlibcontainerd namespace=3Dm=
oby root=3D/var/lib/docker/overlay2/d664e7963d79b51cb1322f9995853ff56f54a3a=
a2994ae5b99b3bcb65c33ec2f/merged
>> >> >>>>> ERRO[2023-02-23T00:53:57.445101824Z] stream copy error: reading=
 from a closed fifo
>> >> >>>>> ERRO[2023-02-23T00:53:57.445126200Z] stream copy error: reading=
 from a closed fifo
>> >> >>>>> DEBU[2023-02-23T00:53:57.445172451Z] attach: stderr: end
>> >> >>>>> DEBU[2023-02-23T00:53:57.445174576Z] attach: stdout: end
>> >> >>>>> DEBU[2023-02-23T00:53:57.445349705Z] attach done
>> >> >>>>> DEBU[2023-02-23T00:53:57.469084602Z] Revoking external connecti=
vity on endpoint crazy_bell (1a86f3778b61204dcc7106bed28728a001028ba51f5c5f=
e731042007ec0ebd3c)
>> >> >>>>> ERRO[2023-02-23T00:53:57.469206980Z] failed to set to initial n=
amespace, readlink /proc/1551/task/1558/ns/net: no such file or directory, =
initns fd -1: bad file descriptor
>> >> >>>>> ERRO[2023-02-23T00:53:57.475388115Z] failed to set to initial n=
amespace, readlink /proc/1551/task/1558/ns/net: no such file or directory, =
initns fd -1: bad file descriptor
>> >> >>>>> ERRO[2023-02-23T00:53:57.489002290Z] failed to set to initial n=
amespace, readlink /proc/1551/task/1558/ns/net: no such file or directory, =
initns fd -1: bad file descriptor
>> >> >>>>> DEBU[2023-02-23T00:53:57.587904715Z] Releasing addresses for en=
dpoint crazy_bell=E2=80=99s interface on network bridge
>> >> >>>>> DEBU[2023-02-23T00:53:57.610361084Z] ReleaseAddress(LocalDefaul=
t/172.17.0.0/16, 172.17.0.2)
>> >> >>>>> DEBU[2023-02-23T00:53:57.619890544Z] Released address PoolID:Lo=
calDefault/172.17.0.0/16, Address:172.17.0.2 Sequence:App: ipam/default/dat=
a, ID: LocalDefault/172.17.0.0/16, DBIndex: 0x0, Bits: 65536, Unselected: 6=
5532, Sequence: (0xe0000000, 1)->(0x0, 2046)->(0x1, 1)->end Curr:3
>> >> >>>>> ERRO[2023-02-23T00:53:57.659608292Z] 4f926f032e0566c4dbdfbb0277=
87b42e6e19ef6e633864f09a4c9edbdb62d190 cleanup: failed to delete container =
from containerd: no such container
>> >> >>>>> ERRO[2023-02-23T00:53:57.659718420Z] Handler for POST /v1.41/co=
ntainers/4f926f032e0566c4dbdfbb027787b42e6e19ef6e633864f09a4c9edbdb62d190/s=
tart returned error: failed to create shim task: OCI runtime create failed:=
 runc create failed: unable to start container process: can=E2=80=99t get f=
inal child=E2=80=99s PID from pipe: EOF: unknown
>> >> >>>>> docker: Error response from daemon: failed to create shim task:=
 OCI runtime create failed: runc create failed: unable to start container p=
rocess: can=E2=80=99t get final child=E2=80=99s PID from pipe: EOF: unknown=
.
>> >> >>>>> ERRO[0000] error waiting for container: context canceled
>> >> >>>>>
>> >> >>>>>
>> >> >>>>>
>> >> >>>>>
>> >> >>>>> Regards
>> >> >>>>>
>> >> >>>>> Simon
>> >> >>>>>
>> >> >>>>>
>> >> >>>>>
>> >> >>>>>
>> >> >>>>>
>> >> >>>>>
>> >> >>>>
>> >> >>>>
>> >> >>>> --
>> >> >>>> - Thou shalt not follow the NULL pointer, for chaos and madness =
await
>> >> >>>> thee at its end
>> >> >>>> - "Use the force Harry" - Gandalf, Star Trek II
>> >> >>>
>> >> >>>
>> >> >>>
>> >> >>>
>> >> >
>> >> >
>> >> > --
>> >> > - Thou shalt not follow the NULL pointer, for chaos and madness awa=
it
>> >> > thee at its end
>> >> > - "Use the force Harry" - Gandalf, Star Trek II
>> >>
>> >>
>> >>
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7921): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7921
> Mute This Topic: https://lists.yoctoproject.org/mt/97175886/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

