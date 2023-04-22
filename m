Return-Path: <simonkbaby@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E095C7618E
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 03:19:26 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.1271.1682133555877684832
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 21 Apr 2023 20:19:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=BZVPiyU5;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: simonkbaby@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-552a6357d02so27791797b3.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 21 Apr 2023 20:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682133555; x=1684725555;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0zlZIV9PIoSEQtqrA6B6Ut79Whw2D1j7LCXqECpmXHQ=;
        b=BZVPiyU58X9+CHmgxQd2LJ/t1Cg3YfMZ/LaeVlTtIV/qYOSGBldLGiyZ0Lo1AXNdCy
         4n5tFONWShlv+DzuBniG1rPHAvFFgzC1hf40uX/GmnrP7WctpvOpNzJW8z9VrV0zOfBj
         Quzb72wwpE7843i9OboYjr1VAhj9ftAmk7CqBhyYapdoSQpv3eU7f6SOgZ3sMPIryDeO
         rmp6QpJCuYXcuWKj4KZACFwBpiwgL8gyrSO4eSrqpnmcUpF3An3/miiGdUGNiiW6PmcG
         cFC/hRTcwD6JHHOqoeRmlnLABLgeLd7liHpygfZz5CQ0zE3io9dLhhOrX/K4EChPkwSw
         lO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682133555; x=1684725555;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0zlZIV9PIoSEQtqrA6B6Ut79Whw2D1j7LCXqECpmXHQ=;
        b=InkC0dv4RfH59PDC7bIXy7cu5QhsW3rJzLMxwCM0lj0yDGAnooxBXChiRrA5bP4bCc
         JNMGraN/QHqrVGLSzJqI4ClVAz4g6/o6jz8CN21W4N+EcGOaBApZw/gpYBp24lfF+6um
         +UxymTzVfZf9QpgcBF6cFLNQ0CWTT9NbKaoK1yq+UAe4Rn4J+1L2QnvrWphUVANX82Gi
         sSEJ9PHVPIL9OZcEu2iP22lQFlQ/NZJkop4FCn3QCW9ImrbeMJFV4Mm+jQGmSG2wOWsw
         Au9DhrGeLM58dmMqFf4ybtGGoD/oBpZfaf4t6JdTb7ws3uhSzVwiWsKAIA2sSCCMMOXX
         KYNg==
X-Gm-Message-State: AAQBX9fxg2U1GZE5aupAjtZHuFsOseorIQRH5y7NtntONmmQzc2vqeQK
	NINE10RIHgt3s6DItnfw/jOMYKczPcuFx6OYF6A=
X-Google-Smtp-Source: AKy350Ygald1vpvHQq17Z/1EXgDQjJrMducXTGvt/tBW6gxRIjiVrDAwsYI0NYl5slfWM2EtkmvAzgxASh119N7imVI=
X-Received: by 2002:a0d:ed07:0:b0:54e:b6b2:1bba with SMTP id
 w7-20020a0ded07000000b0054eb6b21bbamr3380831ywe.0.1682133554923; Fri, 21 Apr
 2023 20:19:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAEFUPH3yTE_GgTcgW0xMy2XgNubvLWuTx0wffW5-=wb_5f+4gg@mail.gmail.com>
 <CADkTA4MnCtNgLax4gC3e+KVTPEmER5vb6yKaHiNmuNU-fcMuJw@mail.gmail.com>
In-Reply-To: <CADkTA4MnCtNgLax4gC3e+KVTPEmER5vb6yKaHiNmuNU-fcMuJw@mail.gmail.com>
From: SIMON BABY <simonkbaby@gmail.com>
Date: Fri, 21 Apr 2023 20:19:03 -0700
Message-ID: <CAEFUPH2dXO_4ctm41BgXfUZO9=QpLBC20DAMvho9nTHkgNfyUw@mail.gmail.com>
Subject: Re: query on docker logs
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000018f8505f9e43d01"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 22 Apr 2023 03:19:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8011

--000000000000018f8505f9e43d01
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Bruce.

I am using systemd for init.
I will check mount and let you know if cgroup is present .

Any specific flag in the local.conf help?  *IMAGE_INSTALL=3Dappend =3D "
cgroup-lite" *  ?? I am using ubuntu 18.04 LTS for my target.

Regards
Simon


On Fri, Apr 21, 2023 at 7:23=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmai=
l.com>
wrote:

> On Thu, Apr 20, 2023 at 4:58=E2=80=AFPM SIMON BABY <simonkbaby@gmail.com>=
 wrote:
> >
> > Hello Team,
> >
> > I have builded docker-ce on yocto for adlink-x86-64 (intel). When I
> started dockerd on the target, I got the below error. Can I know if I nee=
d
> to enable any more kernel flags?
> >
> > INFO[2023-04-19T15:32:53.553499614Z] ClientConn switching balancer to
> "pick_first"  module=3Dgrpc
> > INFO[2023-04-19T15:32:53.555200226Z] parsed scheme: "unix"
>            module=3Dgrpc
> > INFO[2023-04-19T15:32:53.555254565Z] scheme "unix" not registered,
> fallback to default scheme  module=3Dgrpc
> > INFO[2023-04-19T15:32:53.555279407Z] ccResolverWrapper: sending update
> to cc: {[{unix:///var/run/docker/containerd/containerd.sock  <nil> 0
> <nil>}] <nil> <nil>}  module=3Dgrpc
> > INFO[2023-04-19T15:32:53.555291073Z] ClientConn switching balancer to
> "pick_first"  module=3Dgrpc
> > INFO[2023-04-19T15:32:53.570545626Z] [graphdriver] using prior storage
> driver: overlay2
> > WARN[2023-04-19T15:32:53.577105256Z] Your kernel does not support cgrou=
p
> memory limit
> > WARN[2023-04-19T15:32:53.577124784Z] Unable to find cpu cgroup in mount=
s
> > WARN[2023-04-19T15:32:53.577133121Z] Unable to find blkio cgroup in
> mounts
> > WARN[2023-04-19T15:32:53.577140249Z] Unable to find cpuset cgroup in
> mounts
> > WARN[2023-04-19T15:32:53.577147655Z] Unable to find pids cgroup in moun=
ts
> > INFO[2023-04-19T15:32:53.577463438Z] stopping healthcheck following
> graceful shutdown  module=3Dlibcontainerd
> > INFO[2023-04-19T15:32:53.577496369Z] stopping event stream following
> graceful shutdown  error=3D"context canceled" module=3Dlibcontainerd
> namespace=3Dplugins.moby
> >
> > WARN[2023-04-19T15:32:54.578519232Z] grpc: addrConn.createTransport
> failed to connect to {unix:///var/run/docker/containerd/containerd.sock
> <nil> 0 <nil>}. Err :connection error: desc =3D "transport: Error while
> dialing dial unix:///var/run/docker/containerd/containerd.sock: timeout".
> Reconnecting...  module=3Dgrpc
> > failed to start daemon: Devices cgroup isn't mounted
> >
> >
> > my kernel flags looks below:
> >
> > Generally Necessary:
> >
> > - cgroup hierarchy: nonexistent??
> >
> >     (see https://github.com/tianon/cgroupfs-mount)
>
> What init system are you using in the image ? When you check the
> mounts, is cgroups present ?
>
> Bruce
>
> >
> > - CONFIG_NAMESPACES: enabled
> >
> > - CONFIG_NET_NS: enabled
> >
> > - CONFIG_PID_NS: enabled
> >
> > - CONFIG_IPC_NS: enabled
> >
> > - CONFIG_UTS_NS: enabled
> >
> > - CONFIG_CGROUPS: enabled
> >
> > - CONFIG_CGROUP_CPUACCT: enabled
> >
> > - CONFIG_CGROUP_DEVICE: enabled
> >
> > - CONFIG_CGROUP_FREEZER: enabled
> >
> > - CONFIG_CGROUP_SCHED: enabled
> >
> > - CONFIG_CPUSETS: enabled
> >
> > - CONFIG_MEMCG: enabled
> >
> > - CONFIG_KEYS: enabled
> >
> > - CONFIG_VETH: enabled
> >
> > - CONFIG_BRIDGE: enabled
> >
> > - CONFIG_BRIDGE_NETFILTER: enabled (as module)
> >
> > - CONFIG_IP_NF_FILTER: enabled (as module)
> >
> > - CONFIG_IP_NF_TARGET_MASQUERADE: enabled (as module)
> >
> > - CONFIG_NETFILTER_XT_MATCH_ADDRTYPE: enabled (as module)
> >
> > - CONFIG_NETFILTER_XT_MATCH_CONNTRACK: enabled (as module)
> >
> > - CONFIG_NETFILTER_XT_MATCH_IPVS: enabled (as module)
> >
> > - CONFIG_NETFILTER_XT_MARK: enabled (as module)
> >
> > - CONFIG_IP_NF_NAT: enabled
> >
> > - CONFIG_NF_NAT: enabled
> >
> > - CONFIG_POSIX_MQUEUE: enabled
> >
> > - CONFIG_CGROUP_BPF: enabled
> >
> >
> > Optional Features:
> >
> > - CONFIG_USER_NS: enabled
> >
> > - CONFIG_SECCOMP: enabled
> >
> > - CONFIG_SECCOMP_FILTER: enabled
> >
> > - CONFIG_CGROUP_PIDS: enabled
> >
> > - CONFIG_MEMCG_SWAP: enabled
> >
> >     (cgroup swap accounting is currently enabled)
> >
> > - CONFIG_BLK_CGROUP: enabled
> >
> > - CONFIG_BLK_DEV_THROTTLING: enabled
> >
> > - CONFIG_CGROUP_PERF: enabled
> >
> > - CONFIG_CGROUP_HUGETLB: enabled
> >
> > - CONFIG_NET_CLS_CGROUP: enabled (as module)
> >
> > - CONFIG_CGROUP_NET_PRIO: enabled
> >
> > - CONFIG_CFS_BANDWIDTH: enabled
> >
> > - CONFIG_FAIR_GROUP_SCHED: enabled
> >
> > - CONFIG_RT_GROUP_SCHED: enabled
> >
> > - CONFIG_IP_NF_TARGET_REDIRECT: enabled (as module)
> >
> > - CONFIG_IP_VS: enabled (as module)
> >
> > - CONFIG_IP_VS_NFCT: enabled
> >
> > - CONFIG_IP_VS_PROTO_TCP: enabled
> >
> > - CONFIG_IP_VS_PROTO_UDP: enabled
> >
> > - CONFIG_IP_VS_RR: enabled (as module)
> >
> > - CONFIG_SECURITY_SELINUX: enabled
> >
> > - CONFIG_SECURITY_APPARMOR: enabled
> >
> > - CONFIG_EXT4_FS: enabled
> >
> > - CONFIG_EXT4_FS_POSIX_ACL: enabled
> >
> > - CONFIG_EXT4_FS_SECURITY: enabled
> >
> > - Network Drivers:
> >
> >   - "overlay":
> >
> >     - CONFIG_VXLAN: enabled (as module)
> >
> >     - CONFIG_BRIDGE_VLAN_FILTERING: enabled
> >
> >       Optional (for encrypted networks):
> >
> >       - CONFIG_CRYPTO: enabled
> >
> >       - CONFIG_CRYPTO_AEAD: enabled
> >
> >       - CONFIG_CRYPTO_GCM: enabled
> >
> >       - CONFIG_CRYPTO_SEQIV: enabled
> >
> >       - CONFIG_CRYPTO_GHASH: enabled
> >
> >       - CONFIG_XFRM: enabled
> >
> >       - CONFIG_XFRM_USER: enabled
> >
> >       - CONFIG_XFRM_ALGO: enabled
> >
> >       - CONFIG_INET_ESP: enabled
> >
> >   - "ipvlan":
> >
> >     - CONFIG_IPVLAN: enabled (as module)
> >
> >   - "macvlan":
> >
> >     - CONFIG_MACVLAN: enabled (as module)
> >
> >     - CONFIG_DUMMY: enabled (as module)
> >
> >   - "ftp,tftp client in container":
> >
> >     - CONFIG_NF_NAT_FTP: enabled (as module)
> >
> >     - CONFIG_NF_CONNTRACK_FTP: enabled (as module)
> >
> >     - CONFIG_NF_NAT_TFTP: enabled (as module)
> >
> >     - CONFIG_NF_CONNTRACK_TFTP: enabled (as module)
> >
> > - Storage Drivers:
> >
> >   - "btrfs":
> >
> >     - CONFIG_BTRFS_FS: enabled
> >
> >     - CONFIG_BTRFS_FS_POSIX_ACL: enabled
> >
> >   - "devicemapper":
> >
> >     - CONFIG_BLK_DEV_DM: enabled
> >
> >     - CONFIG_DM_THIN_PROVISIONING: enabled (as module)
> >
> >   - "overlay":
> >
> >     - CONFIG_OVERLAY_FS: enabled
> >
> >   - "zfs":
> >
> >     - /dev/zfs: missing
> >
> >     - zfs command: missing
> >
> >     - zpool command: missing
> >
> >
> > Limits:
> >
> > - /proc/sys/kernel/keys/root_maxkeys: 1000000
> >
> >
> > Regards
> > Simon
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--000000000000018f8505f9e43d01
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Bruce.<div><br></div><div>I am using systemd for ini=
t.</div><div>I will check mount and=C2=A0let you know if cgroup is present =
.</div><div><br></div><div>Any specific flag in the local.conf help?=C2=A0=
=C2=A0<b>IMAGE_INSTALL=3Dappend =3D &quot; cgroup-lite&quot;=C2=A0</b> =C2=
=A0?? I am using ubuntu 18.04 LTS for my target.</div><div><br></div><div>R=
egards</div><div>Simon</div><div><br></div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 21, 2023 at 7:23=E2=
=80=AFPM Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bru=
ce.ashfield@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On Thu, Apr 20, 2023 at 4:58=E2=80=AFPM SIMON BABY &lt=
;<a href=3D"mailto:simonkbaby@gmail.com" target=3D"_blank">simonkbaby@gmail=
.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello Team,<br>
&gt;<br>
&gt; I have builded docker-ce on yocto for adlink-x86-64 (intel). When I st=
arted dockerd on the target, I got the below error. Can I know if I need to=
 enable any more kernel flags?<br>
&gt;<br>
&gt; INFO[2023-04-19T15:32:53.553499614Z] ClientConn switching balancer to =
&quot;pick_first&quot;=C2=A0 module=3Dgrpc<br>
&gt; INFO[2023-04-19T15:32:53.555200226Z] parsed scheme: &quot;unix&quot;=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0module=3Dgrpc<br>
&gt; INFO[2023-04-19T15:32:53.555254565Z] scheme &quot;unix&quot; not regis=
tered, fallback to default scheme=C2=A0 module=3Dgrpc<br>
&gt; INFO[2023-04-19T15:32:53.555279407Z] ccResolverWrapper: sending update=
 to cc: {[{unix:///var/run/docker/containerd/containerd.sock=C2=A0 &lt;nil&=
gt; 0 &lt;nil&gt;}] &lt;nil&gt; &lt;nil&gt;}=C2=A0 module=3Dgrpc<br>
&gt; INFO[2023-04-19T15:32:53.555291073Z] ClientConn switching balancer to =
&quot;pick_first&quot;=C2=A0 module=3Dgrpc<br>
&gt; INFO[2023-04-19T15:32:53.570545626Z] [graphdriver] using prior storage=
 driver: overlay2<br>
&gt; WARN[2023-04-19T15:32:53.577105256Z] Your kernel does not support cgro=
up memory limit<br>
&gt; WARN[2023-04-19T15:32:53.577124784Z] Unable to find cpu cgroup in moun=
ts<br>
&gt; WARN[2023-04-19T15:32:53.577133121Z] Unable to find blkio cgroup in mo=
unts<br>
&gt; WARN[2023-04-19T15:32:53.577140249Z] Unable to find cpuset cgroup in m=
ounts<br>
&gt; WARN[2023-04-19T15:32:53.577147655Z] Unable to find pids cgroup in mou=
nts<br>
&gt; INFO[2023-04-19T15:32:53.577463438Z] stopping healthcheck following gr=
aceful shutdown=C2=A0 module=3Dlibcontainerd<br>
&gt; INFO[2023-04-19T15:32:53.577496369Z] stopping event stream following g=
raceful shutdown=C2=A0 error=3D&quot;context canceled&quot; module=3Dlibcon=
tainerd namespace=3Dplugins.moby<br>
&gt;<br>
&gt; WARN[2023-04-19T15:32:54.578519232Z] grpc: addrConn.createTransport fa=
iled to connect to {unix:///var/run/docker/containerd/containerd.sock=C2=A0=
 &lt;nil&gt; 0 &lt;nil&gt;}. Err :connection error: desc =3D &quot;transpor=
t: Error while dialing dial unix:///var/run/docker/containerd/containerd.so=
ck: timeout&quot;. Reconnecting...=C2=A0 module=3Dgrpc<br>
&gt; failed to start daemon: Devices cgroup isn&#39;t mounted<br>
&gt;<br>
&gt;<br>
&gt; my kernel flags looks below:<br>
&gt;<br>
&gt; Generally Necessary:<br>
&gt;<br>
&gt; - cgroup hierarchy: nonexistent??<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0(see <a href=3D"https://github.com/tianon/cgroupfs-=
mount" rel=3D"noreferrer" target=3D"_blank">https://github.com/tianon/cgrou=
pfs-mount</a>)<br>
<br>
What init system are you using in the image ? When you check the<br>
mounts, is cgroups present ?<br>
<br>
Bruce<br>
<br>
&gt;<br>
&gt; - CONFIG_NAMESPACES: enabled<br>
&gt;<br>
&gt; - CONFIG_NET_NS: enabled<br>
&gt;<br>
&gt; - CONFIG_PID_NS: enabled<br>
&gt;<br>
&gt; - CONFIG_IPC_NS: enabled<br>
&gt;<br>
&gt; - CONFIG_UTS_NS: enabled<br>
&gt;<br>
&gt; - CONFIG_CGROUPS: enabled<br>
&gt;<br>
&gt; - CONFIG_CGROUP_CPUACCT: enabled<br>
&gt;<br>
&gt; - CONFIG_CGROUP_DEVICE: enabled<br>
&gt;<br>
&gt; - CONFIG_CGROUP_FREEZER: enabled<br>
&gt;<br>
&gt; - CONFIG_CGROUP_SCHED: enabled<br>
&gt;<br>
&gt; - CONFIG_CPUSETS: enabled<br>
&gt;<br>
&gt; - CONFIG_MEMCG: enabled<br>
&gt;<br>
&gt; - CONFIG_KEYS: enabled<br>
&gt;<br>
&gt; - CONFIG_VETH: enabled<br>
&gt;<br>
&gt; - CONFIG_BRIDGE: enabled<br>
&gt;<br>
&gt; - CONFIG_BRIDGE_NETFILTER: enabled (as module)<br>
&gt;<br>
&gt; - CONFIG_IP_NF_FILTER: enabled (as module)<br>
&gt;<br>
&gt; - CONFIG_IP_NF_TARGET_MASQUERADE: enabled (as module)<br>
&gt;<br>
&gt; - CONFIG_NETFILTER_XT_MATCH_ADDRTYPE: enabled (as module)<br>
&gt;<br>
&gt; - CONFIG_NETFILTER_XT_MATCH_CONNTRACK: enabled (as module)<br>
&gt;<br>
&gt; - CONFIG_NETFILTER_XT_MATCH_IPVS: enabled (as module)<br>
&gt;<br>
&gt; - CONFIG_NETFILTER_XT_MARK: enabled (as module)<br>
&gt;<br>
&gt; - CONFIG_IP_NF_NAT: enabled<br>
&gt;<br>
&gt; - CONFIG_NF_NAT: enabled<br>
&gt;<br>
&gt; - CONFIG_POSIX_MQUEUE: enabled<br>
&gt;<br>
&gt; - CONFIG_CGROUP_BPF: enabled<br>
&gt;<br>
&gt;<br>
&gt; Optional Features:<br>
&gt;<br>
&gt; - CONFIG_USER_NS: enabled<br>
&gt;<br>
&gt; - CONFIG_SECCOMP: enabled<br>
&gt;<br>
&gt; - CONFIG_SECCOMP_FILTER: enabled<br>
&gt;<br>
&gt; - CONFIG_CGROUP_PIDS: enabled<br>
&gt;<br>
&gt; - CONFIG_MEMCG_SWAP: enabled<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0(cgroup swap accounting is currently enabled)<br>
&gt;<br>
&gt; - CONFIG_BLK_CGROUP: enabled<br>
&gt;<br>
&gt; - CONFIG_BLK_DEV_THROTTLING: enabled<br>
&gt;<br>
&gt; - CONFIG_CGROUP_PERF: enabled<br>
&gt;<br>
&gt; - CONFIG_CGROUP_HUGETLB: enabled<br>
&gt;<br>
&gt; - CONFIG_NET_CLS_CGROUP: enabled (as module)<br>
&gt;<br>
&gt; - CONFIG_CGROUP_NET_PRIO: enabled<br>
&gt;<br>
&gt; - CONFIG_CFS_BANDWIDTH: enabled<br>
&gt;<br>
&gt; - CONFIG_FAIR_GROUP_SCHED: enabled<br>
&gt;<br>
&gt; - CONFIG_RT_GROUP_SCHED: enabled<br>
&gt;<br>
&gt; - CONFIG_IP_NF_TARGET_REDIRECT: enabled (as module)<br>
&gt;<br>
&gt; - CONFIG_IP_VS: enabled (as module)<br>
&gt;<br>
&gt; - CONFIG_IP_VS_NFCT: enabled<br>
&gt;<br>
&gt; - CONFIG_IP_VS_PROTO_TCP: enabled<br>
&gt;<br>
&gt; - CONFIG_IP_VS_PROTO_UDP: enabled<br>
&gt;<br>
&gt; - CONFIG_IP_VS_RR: enabled (as module)<br>
&gt;<br>
&gt; - CONFIG_SECURITY_SELINUX: enabled<br>
&gt;<br>
&gt; - CONFIG_SECURITY_APPARMOR: enabled<br>
&gt;<br>
&gt; - CONFIG_EXT4_FS: enabled<br>
&gt;<br>
&gt; - CONFIG_EXT4_FS_POSIX_ACL: enabled<br>
&gt;<br>
&gt; - CONFIG_EXT4_FS_SECURITY: enabled<br>
&gt;<br>
&gt; - Network Drivers:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0- &quot;overlay&quot;:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0- CONFIG_VXLAN: enabled (as module)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0- CONFIG_BRIDGE_VLAN_FILTERING: enabled<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Optional (for encrypted networks):<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- CONFIG_CRYPTO: enabled<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- CONFIG_CRYPTO_AEAD: enabled<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- CONFIG_CRYPTO_GCM: enabled<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- CONFIG_CRYPTO_SEQIV: enabled<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- CONFIG_CRYPTO_GHASH: enabled<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- CONFIG_XFRM: enabled<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- CONFIG_XFRM_USER: enabled<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- CONFIG_XFRM_ALGO: enabled<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- CONFIG_INET_ESP: enabled<br>
&gt;<br>
&gt;=C2=A0 =C2=A0- &quot;ipvlan&quot;:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0- CONFIG_IPVLAN: enabled (as module)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0- &quot;macvlan&quot;:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0- CONFIG_MACVLAN: enabled (as module)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0- CONFIG_DUMMY: enabled (as module)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0- &quot;ftp,tftp client in container&quot;:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0- CONFIG_NF_NAT_FTP: enabled (as module)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0- CONFIG_NF_CONNTRACK_FTP: enabled (as module)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0- CONFIG_NF_NAT_TFTP: enabled (as module)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0- CONFIG_NF_CONNTRACK_TFTP: enabled (as module)<br>
&gt;<br>
&gt; - Storage Drivers:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0- &quot;btrfs&quot;:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0- CONFIG_BTRFS_FS: enabled<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0- CONFIG_BTRFS_FS_POSIX_ACL: enabled<br>
&gt;<br>
&gt;=C2=A0 =C2=A0- &quot;devicemapper&quot;:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0- CONFIG_BLK_DEV_DM: enabled<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0- CONFIG_DM_THIN_PROVISIONING: enabled (as module)<=
br>
&gt;<br>
&gt;=C2=A0 =C2=A0- &quot;overlay&quot;:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0- CONFIG_OVERLAY_FS: enabled<br>
&gt;<br>
&gt;=C2=A0 =C2=A0- &quot;zfs&quot;:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0- /dev/zfs: missing<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0- zfs command: missing<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0- zpool command: missing<br>
&gt;<br>
&gt;<br>
&gt; Limits:<br>
&gt;<br>
&gt; - /proc/sys/kernel/keys/root_maxkeys: 1000000<br>
&gt;<br>
&gt;<br>
&gt; Regards<br>
&gt; Simon<br>
&gt;<br>
&gt;<br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div>

--000000000000018f8505f9e43d01--

