Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 013C8C7618E
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 02:23:26 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web10.586.1682130200203912372
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 21 Apr 2023 19:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=W+CaQMu1;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-7606d460da7so74975839f.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 21 Apr 2023 19:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682130199; x=1684722199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3Q+mrvuWXrsDav1v1t95KmpeWv6wn0AbDxB2tXiq3g=;
        b=W+CaQMu1DmGZnAQ/Xgk2PwCqBufgYZzIFf5ELCWDBQeYclgPL4zDTtcKboQOWR9k/3
         XaUMX33OG0uFTL41OiV8Cc4up0OYSZGPpHqGnEUxbezCNerFtEDGHJSB08UaxdrGgJfx
         fzrrQD+CyOaG5UxWQdoHSdHHR1XIlH5KdnLfgcAWBKDpuaEPRf3UTnHGUBmT9TtJPEAX
         LHKe/VD6Ma3S/iokcOQXOaBPXYPMvBa0l9Qvk2h3h7qBzAJ/k6He70ZGPctDZFHAjNpl
         VDupDXAIK/4bWTke44SM5gfuosf/JWx5KANKACWc3NG2xVCwRnKyDa2WogGMdLzTT473
         W3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682130199; x=1684722199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C3Q+mrvuWXrsDav1v1t95KmpeWv6wn0AbDxB2tXiq3g=;
        b=Zm21QoSpepH1JWxhqSV2I3F4lOnfLvvJE00o32twansh/6UC2J4CgUt9sfhWBunUGj
         02/o5l99PpE+aFk8Zsde72OuQ46jbZTJ2/mkSJGiurdzX7E8OLbMe3HYGncFEwloL8Zo
         R9BYKd7/6swk/262QdTcGrHvC5Gz+/4AJyFWshRqGnrm4Mpx8VTnfrJ+I6fZCPd0cfkL
         IDV4LPTlCjpRaLMqeKW7b7Vj2q7lol6FbAnwIrZEylcAi1qO8mrB3u1MeEM70gcRyf9D
         NtutVaVsn4BZPtof+9urJh/dN/2H6DRx1r7VVMzDvPKW802qjXGqHgBTl/x9MQth3XAB
         bgWA==
X-Gm-Message-State: AAQBX9ek0YEE8HLHL4FqBT4WWs6hCvoufX5kRKsx/MxDE6/9kLwxKvnb
	Ilzr0sdn8Agd4jE2dKyKzg/+5eicddW30BhCs+A=
X-Google-Smtp-Source: AKy350aTyP5fAzkiMii0dvhE5R9YjesmXZ4JNst5wdwDEf1gFXsmRJVJT+WVmn9mvF4gG8/WPkQSNlehAa6xJRYCyls=
X-Received: by 2002:a92:2812:0:b0:315:375c:dc5a with SMTP id
 l18-20020a922812000000b00315375cdc5amr658910ilf.20.1682130199214; Fri, 21 Apr
 2023 19:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAEFUPH3yTE_GgTcgW0xMy2XgNubvLWuTx0wffW5-=wb_5f+4gg@mail.gmail.com>
In-Reply-To: <CAEFUPH3yTE_GgTcgW0xMy2XgNubvLWuTx0wffW5-=wb_5f+4gg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 21 Apr 2023 22:23:19 -0400
Message-ID: <CADkTA4MnCtNgLax4gC3e+KVTPEmER5vb6yKaHiNmuNU-fcMuJw@mail.gmail.com>
Subject: Re: query on docker logs
To: SIMON BABY <simonkbaby@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 22 Apr 2023 02:23:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8010

On Thu, Apr 20, 2023 at 4:58=E2=80=AFPM SIMON BABY <simonkbaby@gmail.com> w=
rote:
>
> Hello Team,
>
> I have builded docker-ce on yocto for adlink-x86-64 (intel). When I start=
ed dockerd on the target, I got the below error. Can I know if I need to en=
able any more kernel flags?
>
> INFO[2023-04-19T15:32:53.553499614Z] ClientConn switching balancer to "pi=
ck_first"  module=3Dgrpc
> INFO[2023-04-19T15:32:53.555200226Z] parsed scheme: "unix"               =
          module=3Dgrpc
> INFO[2023-04-19T15:32:53.555254565Z] scheme "unix" not registered, fallba=
ck to default scheme  module=3Dgrpc
> INFO[2023-04-19T15:32:53.555279407Z] ccResolverWrapper: sending update to=
 cc: {[{unix:///var/run/docker/containerd/containerd.sock  <nil> 0 <nil>}] =
<nil> <nil>}  module=3Dgrpc
> INFO[2023-04-19T15:32:53.555291073Z] ClientConn switching balancer to "pi=
ck_first"  module=3Dgrpc
> INFO[2023-04-19T15:32:53.570545626Z] [graphdriver] using prior storage dr=
iver: overlay2
> WARN[2023-04-19T15:32:53.577105256Z] Your kernel does not support cgroup =
memory limit
> WARN[2023-04-19T15:32:53.577124784Z] Unable to find cpu cgroup in mounts
> WARN[2023-04-19T15:32:53.577133121Z] Unable to find blkio cgroup in mount=
s
> WARN[2023-04-19T15:32:53.577140249Z] Unable to find cpuset cgroup in moun=
ts
> WARN[2023-04-19T15:32:53.577147655Z] Unable to find pids cgroup in mounts
> INFO[2023-04-19T15:32:53.577463438Z] stopping healthcheck following grace=
ful shutdown  module=3Dlibcontainerd
> INFO[2023-04-19T15:32:53.577496369Z] stopping event stream following grac=
eful shutdown  error=3D"context canceled" module=3Dlibcontainerd namespace=
=3Dplugins.moby
>
> WARN[2023-04-19T15:32:54.578519232Z] grpc: addrConn.createTransport faile=
d to connect to {unix:///var/run/docker/containerd/containerd.sock  <nil> 0=
 <nil>}. Err :connection error: desc =3D "transport: Error while dialing di=
al unix:///var/run/docker/containerd/containerd.sock: timeout". Reconnectin=
g...  module=3Dgrpc
> failed to start daemon: Devices cgroup isn't mounted
>
>
> my kernel flags looks below:
>
> Generally Necessary:
>
> - cgroup hierarchy: nonexistent??
>
>     (see https://github.com/tianon/cgroupfs-mount)

What init system are you using in the image ? When you check the
mounts, is cgroups present ?

Bruce

>
> - CONFIG_NAMESPACES: enabled
>
> - CONFIG_NET_NS: enabled
>
> - CONFIG_PID_NS: enabled
>
> - CONFIG_IPC_NS: enabled
>
> - CONFIG_UTS_NS: enabled
>
> - CONFIG_CGROUPS: enabled
>
> - CONFIG_CGROUP_CPUACCT: enabled
>
> - CONFIG_CGROUP_DEVICE: enabled
>
> - CONFIG_CGROUP_FREEZER: enabled
>
> - CONFIG_CGROUP_SCHED: enabled
>
> - CONFIG_CPUSETS: enabled
>
> - CONFIG_MEMCG: enabled
>
> - CONFIG_KEYS: enabled
>
> - CONFIG_VETH: enabled
>
> - CONFIG_BRIDGE: enabled
>
> - CONFIG_BRIDGE_NETFILTER: enabled (as module)
>
> - CONFIG_IP_NF_FILTER: enabled (as module)
>
> - CONFIG_IP_NF_TARGET_MASQUERADE: enabled (as module)
>
> - CONFIG_NETFILTER_XT_MATCH_ADDRTYPE: enabled (as module)
>
> - CONFIG_NETFILTER_XT_MATCH_CONNTRACK: enabled (as module)
>
> - CONFIG_NETFILTER_XT_MATCH_IPVS: enabled (as module)
>
> - CONFIG_NETFILTER_XT_MARK: enabled (as module)
>
> - CONFIG_IP_NF_NAT: enabled
>
> - CONFIG_NF_NAT: enabled
>
> - CONFIG_POSIX_MQUEUE: enabled
>
> - CONFIG_CGROUP_BPF: enabled
>
>
> Optional Features:
>
> - CONFIG_USER_NS: enabled
>
> - CONFIG_SECCOMP: enabled
>
> - CONFIG_SECCOMP_FILTER: enabled
>
> - CONFIG_CGROUP_PIDS: enabled
>
> - CONFIG_MEMCG_SWAP: enabled
>
>     (cgroup swap accounting is currently enabled)
>
> - CONFIG_BLK_CGROUP: enabled
>
> - CONFIG_BLK_DEV_THROTTLING: enabled
>
> - CONFIG_CGROUP_PERF: enabled
>
> - CONFIG_CGROUP_HUGETLB: enabled
>
> - CONFIG_NET_CLS_CGROUP: enabled (as module)
>
> - CONFIG_CGROUP_NET_PRIO: enabled
>
> - CONFIG_CFS_BANDWIDTH: enabled
>
> - CONFIG_FAIR_GROUP_SCHED: enabled
>
> - CONFIG_RT_GROUP_SCHED: enabled
>
> - CONFIG_IP_NF_TARGET_REDIRECT: enabled (as module)
>
> - CONFIG_IP_VS: enabled (as module)
>
> - CONFIG_IP_VS_NFCT: enabled
>
> - CONFIG_IP_VS_PROTO_TCP: enabled
>
> - CONFIG_IP_VS_PROTO_UDP: enabled
>
> - CONFIG_IP_VS_RR: enabled (as module)
>
> - CONFIG_SECURITY_SELINUX: enabled
>
> - CONFIG_SECURITY_APPARMOR: enabled
>
> - CONFIG_EXT4_FS: enabled
>
> - CONFIG_EXT4_FS_POSIX_ACL: enabled
>
> - CONFIG_EXT4_FS_SECURITY: enabled
>
> - Network Drivers:
>
>   - "overlay":
>
>     - CONFIG_VXLAN: enabled (as module)
>
>     - CONFIG_BRIDGE_VLAN_FILTERING: enabled
>
>       Optional (for encrypted networks):
>
>       - CONFIG_CRYPTO: enabled
>
>       - CONFIG_CRYPTO_AEAD: enabled
>
>       - CONFIG_CRYPTO_GCM: enabled
>
>       - CONFIG_CRYPTO_SEQIV: enabled
>
>       - CONFIG_CRYPTO_GHASH: enabled
>
>       - CONFIG_XFRM: enabled
>
>       - CONFIG_XFRM_USER: enabled
>
>       - CONFIG_XFRM_ALGO: enabled
>
>       - CONFIG_INET_ESP: enabled
>
>   - "ipvlan":
>
>     - CONFIG_IPVLAN: enabled (as module)
>
>   - "macvlan":
>
>     - CONFIG_MACVLAN: enabled (as module)
>
>     - CONFIG_DUMMY: enabled (as module)
>
>   - "ftp,tftp client in container":
>
>     - CONFIG_NF_NAT_FTP: enabled (as module)
>
>     - CONFIG_NF_CONNTRACK_FTP: enabled (as module)
>
>     - CONFIG_NF_NAT_TFTP: enabled (as module)
>
>     - CONFIG_NF_CONNTRACK_TFTP: enabled (as module)
>
> - Storage Drivers:
>
>   - "btrfs":
>
>     - CONFIG_BTRFS_FS: enabled
>
>     - CONFIG_BTRFS_FS_POSIX_ACL: enabled
>
>   - "devicemapper":
>
>     - CONFIG_BLK_DEV_DM: enabled
>
>     - CONFIG_DM_THIN_PROVISIONING: enabled (as module)
>
>   - "overlay":
>
>     - CONFIG_OVERLAY_FS: enabled
>
>   - "zfs":
>
>     - /dev/zfs: missing
>
>     - zfs command: missing
>
>     - zpool command: missing
>
>
> Limits:
>
> - /proc/sys/kernel/keys/root_maxkeys: 1000000
>
>
> Regards
> Simon
>
>
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

