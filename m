Return-Path: <simonkbaby@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8210DC7618E
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 20:58:46 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.3044.1682024317105528693
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Apr 2023 13:58:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Ny6PEG0H;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: simonkbaby@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1a677dffb37so14259355ad.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Apr 2023 13:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682024316; x=1684616316;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3XGTxoo1uhAKgjRmyyun9eEmieuB6OQlgoTQvJhnRu4=;
        b=Ny6PEG0HPNTQml2bY00sbT9PL0RwBPKvN5H9xgUqwQFmQmC14WVwg08k19BY6Q4bAm
         z4sHDSmeRx6eMs3JgIdKIIys98HdUEdkvUvGaAIyws0cUcIFu8QTAlcoFiboG8peWFuY
         6lc+li6SXIpf4mnxE7QvfejvwsGPPhUEbQPzxfiB8udFmuXeZFQqg7gDTIWzOcbuF61T
         VIYdDzYIJ+9NXn4igPRrQzdKEDbGONadjT9IWdIi5bpHnAbC15qiDooHozlZtnbXH3z3
         lkfg4Sa+dGpQfAJKp9ZZn4BEYmeqJnrvEAXk3ruf9Yc8Op+yJo6pDFeEHTPfXfxjAOY6
         YA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682024316; x=1684616316;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3XGTxoo1uhAKgjRmyyun9eEmieuB6OQlgoTQvJhnRu4=;
        b=WmCdPq4BSsSjMasSVYQRceSVH7KteHv5V9Q2xvFLzg4h4mPQEBepufzSUy6tSu+BAC
         5BW0If6jSKstu/fSr7lOyxbse//F80o8mukOtHybO0+tdp+PX41lSNV3Tsx6sOvafZ+9
         k9yP0CIEbzXJ2JqsQhYnQaqtlIwQUKkQ8JPcOn8qVk3JYdPdK5yL2+vnIBjzHH/NWc+1
         aY8xB1ke0CNz6yP8QsTyQUS16ZivOaJEd8Yk3ii/1TcRURJFI/bPZ6NbBKLr2X3u9nMT
         wVAv78St6aOZENl+Vj3m95nviESyTaFNVuYYPsAiH9b9/S+ebNPA9rShLkbj6igqV58+
         xMeQ==
X-Gm-Message-State: AAQBX9cGM2WO+Am3sF/BXqm0KrYgLmr+ZAK7GagjyGPXI0IpgyYv2wiw
	do2ps1zVSCks4sdEKchGFJuINS2yH2prRKB3/HcUaRnBhzasJg==
X-Google-Smtp-Source: AKy350Z0ofyNVIcLru9ouupxmm3Vd6MIj0x474hgG+sNm+dSexz1518S/bF7RZdtY6RpMXQ/xPRoIqtTbuJYhZV5iSM=
X-Received: by 2002:a17:902:c643:b0:1a6:bd5c:649d with SMTP id
 s3-20020a170902c64300b001a6bd5c649dmr2601301pls.56.1682024316094; Thu, 20 Apr
 2023 13:58:36 -0700 (PDT)
MIME-Version: 1.0
From: SIMON BABY <simonkbaby@gmail.com>
Date: Thu, 20 Apr 2023 13:58:25 -0700
Message-ID: <CAEFUPH3yTE_GgTcgW0xMy2XgNubvLWuTx0wffW5-=wb_5f+4gg@mail.gmail.com>
Subject: query on docker logs
To: meta-virtualization@lists.yoctoproject.org, 
	Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000dd4cd405f9cacd95"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Apr 2023 20:58:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8003

--000000000000dd4cd405f9cacd95
Content-Type: text/plain; charset="UTF-8"

Hello Team,

I have builded docker-ce on yocto for adlink-x86-64 (intel). When I started
dockerd on the target, I got the below error. Can I know if I need to
enable any more kernel flags?

INFO[2023-04-19T15:32:53.553499614Z] ClientConn switching balancer to
"pick_first"  module=grpc
INFO[2023-04-19T15:32:53.555200226Z] parsed scheme: "unix"
        module=grpc
INFO[2023-04-19T15:32:53.555254565Z] scheme "unix" not registered, fallback
to default scheme  module=grpc
INFO[2023-04-19T15:32:53.555279407Z] ccResolverWrapper: sending update to
cc: {[{unix:///var/run/docker/containerd/containerd.sock  <nil> 0 <nil>}]
<nil> <nil>}  module=grpc
INFO[2023-04-19T15:32:53.555291073Z] ClientConn switching balancer to
"pick_first"  module=grpc
INFO[2023-04-19T15:32:53.570545626Z] [graphdriver] using prior storage
driver: overlay2
WARN[2023-04-19T15:32:53.577105256Z] Your kernel does not support cgroup
memory limit
WARN[2023-04-19T15:32:53.577124784Z] Unable to find cpu cgroup in mounts
WARN[2023-04-19T15:32:53.577133121Z] Unable to find blkio cgroup in mounts
WARN[2023-04-19T15:32:53.577140249Z] Unable to find cpuset cgroup in mounts
WARN[2023-04-19T15:32:53.577147655Z] Unable to find pids cgroup in mounts
INFO[2023-04-19T15:32:53.577463438Z] stopping healthcheck following
graceful shutdown  module=libcontainerd
INFO[2023-04-19T15:32:53.577496369Z] stopping event stream following
graceful shutdown  error="context canceled" module=libcontainerd
namespace=plugins.moby

WARN[2023-04-19T15:32:54.578519232Z] grpc: addrConn.createTransport failed
to connect to {unix:///var/run/docker/containerd/containerd.sock  <nil> 0
<nil>}. Err :connection error: desc = "transport: Error while dialing dial
unix:///var/run/docker/containerd/containerd.sock: timeout".
Reconnecting...  module=grpc
*failed to start daemon: Devices cgroup isn't mounte*d


my kernel flags looks below:

Generally Necessary:

- *cgroup hierarchy*: *nonexistent??*

    (see https://github.com/tianon/cgroupfs-mount)

- CONFIG_NAMESPACES: enabled

- CONFIG_NET_NS: enabled

- CONFIG_PID_NS: enabled

- CONFIG_IPC_NS: enabled

- CONFIG_UTS_NS: enabled

- CONFIG_CGROUPS: enabled

- CONFIG_CGROUP_CPUACCT: enabled

- CONFIG_CGROUP_DEVICE: enabled

- CONFIG_CGROUP_FREEZER: enabled

- CONFIG_CGROUP_SCHED: enabled

- CONFIG_CPUSETS: enabled

- CONFIG_MEMCG: enabled

- CONFIG_KEYS: enabled

- CONFIG_VETH: enabled

- CONFIG_BRIDGE: enabled

- CONFIG_BRIDGE_NETFILTER: enabled (as module)

- CONFIG_IP_NF_FILTER: enabled (as module)

- CONFIG_IP_NF_TARGET_MASQUERADE: enabled (as module)

- CONFIG_NETFILTER_XT_MATCH_ADDRTYPE: enabled (as module)

- CONFIG_NETFILTER_XT_MATCH_CONNTRACK: enabled (as module)

- CONFIG_NETFILTER_XT_MATCH_IPVS: enabled (as module)

- CONFIG_NETFILTER_XT_MARK: enabled (as module)

- CONFIG_IP_NF_NAT: enabled

- CONFIG_NF_NAT: enabled

- CONFIG_POSIX_MQUEUE: enabled

- CONFIG_CGROUP_BPF: enabled


Optional Features:

- CONFIG_USER_NS: enabled

- CONFIG_SECCOMP: enabled

- CONFIG_SECCOMP_FILTER: enabled

- CONFIG_CGROUP_PIDS: enabled

- CONFIG_MEMCG_SWAP: enabled

    *(cgroup swap accounting is currently enabled)*

- CONFIG_BLK_CGROUP: enabled

- CONFIG_BLK_DEV_THROTTLING: enabled

- CONFIG_CGROUP_PERF: enabled

- CONFIG_CGROUP_HUGETLB: enabled

- CONFIG_NET_CLS_CGROUP: enabled (as module)

- CONFIG_CGROUP_NET_PRIO: enabled

- CONFIG_CFS_BANDWIDTH: enabled

- CONFIG_FAIR_GROUP_SCHED: enabled

- CONFIG_RT_GROUP_SCHED: enabled

- CONFIG_IP_NF_TARGET_REDIRECT: enabled (as module)

- CONFIG_IP_VS: enabled (as module)

- CONFIG_IP_VS_NFCT: enabled

- CONFIG_IP_VS_PROTO_TCP: enabled

- CONFIG_IP_VS_PROTO_UDP: enabled

- CONFIG_IP_VS_RR: enabled (as module)

- CONFIG_SECURITY_SELINUX: enabled

- CONFIG_SECURITY_APPARMOR: enabled

- CONFIG_EXT4_FS: enabled

- CONFIG_EXT4_FS_POSIX_ACL: enabled

- CONFIG_EXT4_FS_SECURITY: enabled

- Network Drivers:

  - "overlay":

    - CONFIG_VXLAN: enabled (as module)

    - CONFIG_BRIDGE_VLAN_FILTERING: enabled

      Optional (for encrypted networks):

      - CONFIG_CRYPTO: enabled

      - CONFIG_CRYPTO_AEAD: enabled

      - CONFIG_CRYPTO_GCM: enabled

      - CONFIG_CRYPTO_SEQIV: enabled

      - CONFIG_CRYPTO_GHASH: enabled

      - CONFIG_XFRM: enabled

      - CONFIG_XFRM_USER: enabled

      - CONFIG_XFRM_ALGO: enabled

      - CONFIG_INET_ESP: enabled

  - "ipvlan":

    - CONFIG_IPVLAN: enabled (as module)

  - "macvlan":

    - CONFIG_MACVLAN: enabled (as module)

    - CONFIG_DUMMY: enabled (as module)

  - "ftp,tftp client in container":

    - CONFIG_NF_NAT_FTP: enabled (as module)

    - CONFIG_NF_CONNTRACK_FTP: enabled (as module)

    - CONFIG_NF_NAT_TFTP: enabled (as module)

    - CONFIG_NF_CONNTRACK_TFTP: enabled (as module)

- Storage Drivers:

  - "btrfs":

    - CONFIG_BTRFS_FS: enabled

    - CONFIG_BTRFS_FS_POSIX_ACL: enabled

  - "devicemapper":

    - CONFIG_BLK_DEV_DM: enabled

    - CONFIG_DM_THIN_PROVISIONING: enabled (as module)

  - "overlay":

    - CONFIG_OVERLAY_FS: enabled

  - "zfs":

    - */dev/zfs*: *missing*

    - *zfs command*: *missing*

    - *zpool command*: *missing*


Limits:

- /proc/sys/kernel/keys/root_maxkeys: 1000000

Regards
Simon

--000000000000dd4cd405f9cacd95
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Team,<div><br><div>I have builded docker-ce on yocto=
 for adlink-x86-64 (intel). When I started dockerd on the target, I got the=
 below error. Can I know if I need to enable any more kernel flags?</div><d=
iv><br></div><div>INFO[2023-04-19T15:32:53.553499614Z] ClientConn switching=
 balancer to &quot;pick_first&quot; =C2=A0module=3Dgrpc<br>INFO[2023-04-19T=
15:32:53.555200226Z] parsed scheme: &quot;unix&quot; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 module=3Dgrp=
c<br>INFO[2023-04-19T15:32:53.555254565Z] scheme &quot;unix&quot; not regis=
tered, fallback to default scheme =C2=A0module=3Dgrpc<br>INFO[2023-04-19T15=
:32:53.555279407Z] ccResolverWrapper: sending update to cc: {[{unix:///var/=
run/docker/containerd/containerd.sock =C2=A0&lt;nil&gt; 0 &lt;nil&gt;}] &lt=
;nil&gt; &lt;nil&gt;} =C2=A0module=3Dgrpc<br>INFO[2023-04-19T15:32:53.55529=
1073Z] ClientConn switching balancer to &quot;pick_first&quot; =C2=A0module=
=3Dgrpc<br>INFO[2023-04-19T15:32:53.570545626Z] [graphdriver] using prior s=
torage driver: overlay2<br><font color=3D"#ff0000">WARN[2023-04-19T15:32:53=
.577105256Z] Your kernel does not support cgroup memory limit<br>WARN[2023-=
04-19T15:32:53.577124784Z] Unable to find cpu cgroup in mounts<br>WARN[2023=
-04-19T15:32:53.577133121Z] Unable to find blkio cgroup in mounts<br>WARN[2=
023-04-19T15:32:53.577140249Z] Unable to find cpuset cgroup in mounts<br>WA=
RN[2023-04-19T15:32:53.577147655Z] Unable to find pids cgroup in mounts</fo=
nt><br>INFO[2023-04-19T15:32:53.577463438Z] stopping healthcheck following =
graceful shutdown =C2=A0module=3Dlibcontainerd<br>INFO[2023-04-19T15:32:53.=
577496369Z] stopping event stream following graceful shutdown =C2=A0error=
=3D&quot;context canceled&quot; module=3Dlibcontainerd namespace=3Dplugins.=
moby</div><div><br><font color=3D"#ff0000">WARN[2023-04-19T15:32:54.5785192=
32Z] grpc: addrConn.createTransport failed to connect to {unix:///var/run/d=
ocker/containerd/containerd.sock =C2=A0&lt;nil&gt; 0 &lt;nil&gt;}. Err :con=
nection</font> <font color=3D"#ff0000">error: desc =3D &quot;transport: Err=
or while dialing dial unix:///var/run/docker/containerd/containerd.sock: ti=
meout&quot;. Reconnecting... =C2=A0module=3Dgrpc</font><br><b><font color=
=3D"#ff0000">failed to start daemon: Devices cgroup isn&#39;t mounte</font>=
</b>d<br></div><div><br></div><div><br></div><div>my kernel flags looks bel=
ow:</div><div><br></div><div><span class=3D"gmail-ui-provider gmail-gz gmai=
l-b gmail-c gmail-d gmail-e gmail-f gmail-g gmail-h gmail-i gmail-j gmail-k=
 gmail-l gmail-m gmail-n gmail-o gmail-p gmail-q gmail-r gmail-s gmail-t gm=
ail-u gmail-v gmail-w gmail-x gmail-y gmail-z gmail-ab gmail-ac gmail-ae gm=
ail-af gmail-ag gmail-ah gmail-ai gmail-aj gmail-ak" dir=3D"ltr"><p>General=
ly Necessary:</p><p>- <strong>cgroup hierarchy</strong>: <strong>nonexisten=
t??</strong></p><p>=C2=A0 =C2=A0 (see <a aria-label=3D"Link https://github.=
com/tianon/cgroupfs-mount)" title=3D"https://github.com/tianon/cgroupfs-mou=
nt)" href=3D"https://github.com/tianon/cgroupfs-mount)" rel=3D"noreferrer n=
oopener" target=3D"_blank" class=3D"gmail-fui-Link gmail-___1qmgydl gmail-f=
3rmtva gmail-f1ewtqcl gmail-fyind8e gmail-f1k6fduh gmail-f1w7gpdv gmail-fk6=
fouc gmail-fjoy568 gmail-figsok6 gmail-f1hu3pq6 gmail-f11qmguv gmail-f19f4t=
wv gmail-f1tyq0we gmail-f1g0x7ka gmail-fhxju0i gmail-f1qch9an gmail-f1cnd47=
f gmail-fqv5qza gmail-f1vmzxwi gmail-f1o700av gmail-f13mvf36 gmail-f1cmlufx=
 gmail-f9n3di6 gmail-f1ids18y gmail-f1tx3yz7 gmail-f1deo86v gmail-f1eh06m1 =
gmail-f1iescvh gmail-ftqa4ok gmail-f2hkw1w gmail-fhgqx19 gmail-f1olyrje gma=
il-f1p93eir gmail-f1h8hb77 gmail-f1x7u7e9 gmail-f10aw75t gmail-fsle3fq" sty=
le=3D"overflow-wrap: break-word;">https://github.com/tianon/cgroupfs-mount)=
</a></p><p>- CONFIG_NAMESPACES: enabled</p><p>- CONFIG_NET_NS: enabled</p><=
p>- CONFIG_PID_NS: enabled</p><p>- CONFIG_IPC_NS: enabled</p><p>- CONFIG_UT=
S_NS: enabled</p><p>- CONFIG_CGROUPS: enabled</p><p>- CONFIG_CGROUP_CPUACCT=
: enabled</p><p>- CONFIG_CGROUP_DEVICE: enabled</p><p>- CONFIG_CGROUP_FREEZ=
ER: enabled</p><p>- CONFIG_CGROUP_SCHED: enabled</p><p>- CONFIG_CPUSETS: en=
abled</p><p>- CONFIG_MEMCG: enabled</p><p>- CONFIG_KEYS: enabled</p><p>- CO=
NFIG_VETH: enabled</p><p>- CONFIG_BRIDGE: enabled</p><p>- CONFIG_BRIDGE_NET=
FILTER: enabled (as module)</p><p>- CONFIG_IP_NF_FILTER: enabled (as module=
)</p><p>- CONFIG_IP_NF_TARGET_MASQUERADE: enabled (as module)</p><p>- CONFI=
G_NETFILTER_XT_MATCH_ADDRTYPE: enabled (as module)</p><p>- CONFIG_NETFILTER=
_XT_MATCH_CONNTRACK: enabled (as module)</p><p>- CONFIG_NETFILTER_XT_MATCH_=
IPVS: enabled (as module)</p><p>- CONFIG_NETFILTER_XT_MARK: enabled (as mod=
ule)</p><p>- CONFIG_IP_NF_NAT: enabled</p><p>- CONFIG_NF_NAT: enabled</p><p=
>- CONFIG_POSIX_MQUEUE: enabled</p><p>- CONFIG_CGROUP_BPF: enabled</p><p><b=
r class=3D"empty-paragraph"></p><p>Optional Features:</p><p>- CONFIG_USER_N=
S: enabled</p><p>- CONFIG_SECCOMP: enabled</p><p>- CONFIG_SECCOMP_FILTER: e=
nabled</p><p>- CONFIG_CGROUP_PIDS: enabled</p><p>- CONFIG_MEMCG_SWAP: enabl=
ed</p><p>=C2=A0 =C2=A0=C2=A0<strong>(cgroup swap accounting is currently en=
abled)</strong></p><p>- CONFIG_BLK_CGROUP: enabled</p><p>- CONFIG_BLK_DEV_T=
HROTTLING: enabled</p><p>- CONFIG_CGROUP_PERF: enabled</p><p>- CONFIG_CGROU=
P_HUGETLB: enabled</p><p>- CONFIG_NET_CLS_CGROUP: enabled (as module)</p><p=
>- CONFIG_CGROUP_NET_PRIO: enabled</p><p>- CONFIG_CFS_BANDWIDTH: enabled</p=
><p>- CONFIG_FAIR_GROUP_SCHED: enabled</p><p>- CONFIG_RT_GROUP_SCHED: enabl=
ed</p><p>- CONFIG_IP_NF_TARGET_REDIRECT: enabled (as module)</p><p>- CONFIG=
_IP_VS: enabled (as module)</p><p>- CONFIG_IP_VS_NFCT: enabled</p><p>- CONF=
IG_IP_VS_PROTO_TCP: enabled</p><p>- CONFIG_IP_VS_PROTO_UDP: enabled</p><p>-=
 CONFIG_IP_VS_RR: enabled (as module)</p><p>- CONFIG_SECURITY_SELINUX: enab=
led</p><p>- CONFIG_SECURITY_APPARMOR: enabled</p><p>- CONFIG_EXT4_FS: enabl=
ed</p><p>- CONFIG_EXT4_FS_POSIX_ACL: enabled</p><p>- CONFIG_EXT4_FS_SECURIT=
Y: enabled</p><p>- Network Drivers:</p><p>=C2=A0 - &quot;overlay&quot;:</p>=
<p>=C2=A0 =C2=A0 - CONFIG_VXLAN: enabled (as module)</p><p>=C2=A0 =C2=A0 - =
CONFIG_BRIDGE_VLAN_FILTERING: enabled</p><p>=C2=A0 =C2=A0 =C2=A0 Optional (=
for encrypted networks):</p><p>=C2=A0 =C2=A0 =C2=A0 - CONFIG_CRYPTO: enable=
d</p><p>=C2=A0 =C2=A0 =C2=A0 - CONFIG_CRYPTO_AEAD: enabled</p><p>=C2=A0 =C2=
=A0 =C2=A0 - CONFIG_CRYPTO_GCM: enabled</p><p>=C2=A0 =C2=A0 =C2=A0 - CONFIG=
_CRYPTO_SEQIV: enabled</p><p>=C2=A0 =C2=A0 =C2=A0 - CONFIG_CRYPTO_GHASH: en=
abled</p><p>=C2=A0 =C2=A0 =C2=A0 - CONFIG_XFRM: enabled</p><p>=C2=A0 =C2=A0=
 =C2=A0 - CONFIG_XFRM_USER: enabled</p><p>=C2=A0 =C2=A0 =C2=A0 - CONFIG_XFR=
M_ALGO: enabled</p><p>=C2=A0 =C2=A0 =C2=A0 - CONFIG_INET_ESP: enabled</p><p=
>=C2=A0 - &quot;ipvlan&quot;:</p><p>=C2=A0 =C2=A0 - CONFIG_IPVLAN: enabled =
(as module)</p><p>=C2=A0 - &quot;macvlan&quot;:</p><p>=C2=A0 =C2=A0 - CONFI=
G_MACVLAN: enabled (as module)</p><p>=C2=A0 =C2=A0 - CONFIG_DUMMY: enabled =
(as module)</p><p>=C2=A0 - &quot;ftp,tftp client in container&quot;:</p><p>=
=C2=A0 =C2=A0 - CONFIG_NF_NAT_FTP: enabled (as module)</p><p>=C2=A0 =C2=A0 =
- CONFIG_NF_CONNTRACK_FTP: enabled (as module)</p><p>=C2=A0 =C2=A0 - CONFIG=
_NF_NAT_TFTP: enabled (as module)</p><p>=C2=A0 =C2=A0 - CONFIG_NF_CONNTRACK=
_TFTP: enabled (as module)</p><p>- Storage Drivers:</p><p>=C2=A0 - &quot;bt=
rfs&quot;:</p><p>=C2=A0 =C2=A0 - CONFIG_BTRFS_FS: enabled</p><p>=C2=A0 =C2=
=A0 - CONFIG_BTRFS_FS_POSIX_ACL: enabled</p><p>=C2=A0 - &quot;devicemapper&=
quot;:</p><p>=C2=A0 =C2=A0 - CONFIG_BLK_DEV_DM: enabled</p><p>=C2=A0 =C2=A0=
 - CONFIG_DM_THIN_PROVISIONING: enabled (as module)</p><p>=C2=A0 - &quot;ov=
erlay&quot;:</p><p>=C2=A0 =C2=A0 - CONFIG_OVERLAY_FS: enabled</p><p>=C2=A0 =
- &quot;zfs&quot;:</p><p>=C2=A0 =C2=A0 - <strong>/dev/zfs</strong>: <strong=
>missing</strong></p><p>=C2=A0 =C2=A0 - <strong>zfs command</strong>: <stro=
ng>missing</strong></p><p>=C2=A0 =C2=A0 - <strong>zpool command</strong>: <=
strong>missing</strong></p><p><br class=3D"empty-paragraph"></p><p>Limits:<=
/p><p>- /proc/sys/kernel/keys/root_maxkeys: 1000000</p></span></div><div><b=
r></div><div>Regards</div><div>Simon</div><div><br></div><div><br></div><di=
v><br></div></div></div>

--000000000000dd4cd405f9cacd95--

