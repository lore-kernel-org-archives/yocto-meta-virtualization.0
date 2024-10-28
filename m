Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5680D10C12
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 12:48:30 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.50820.1730119701319548669
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Oct 2024 05:48:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N5iHsQEX;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2e2b549799eso3128980a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Oct 2024 05:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730119701; x=1730724501; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V0Ok56hfzdAntqJtDDSlvW9Tj0dDELlo6J/x7w8XTsI=;
        b=N5iHsQEXEL6Gy7eNoFoLmwSpJY89c1zlmKQeeLlutu58GazCkhfWW323lVn9AOnvrM
         7Z9jUUzYYYm2N/qITb3CnNmi3wQZ1PqRj52Na12SI05OFVfcF8D4w+9bJ2SnaSsvwU9T
         1wugHgujCxJ1CW8fgcqCqKkh18s3Jxstt9N5APYg+5JNEz9/Wiqw7zJVWcRAvrQ11U/T
         IUQu7Nxida1DisV+DxpccG9etZn8oLZExk62iYwkwl7jNgp9UyjTMt4o0WzsH4nExgsK
         Kd4jHZCvA/5uDaN9pZ1RY80sbZDGrR/aUUlkPB51CfLIqewmwsVO5drHhqOc/AOl8xp0
         me+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730119701; x=1730724501;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V0Ok56hfzdAntqJtDDSlvW9Tj0dDELlo6J/x7w8XTsI=;
        b=bAUilR36VMtqD3f/j5y3D/JT5bFyXP/bmV3v6OPSaynEnGn3qu6u9clPpQ5pioRyB/
         6MLoF0dGGeCx9Pab/q3jospQHCmmje+Bl+QX0rnoJCMOiAJEz5+gc9T8AUZqvN33XC92
         Cy7Rzt/v4ak3NpJgVihAW9cqAPEDFZjxAThiLNd2U9bLuICrppJQyIjZ/tImk01c17Pe
         0xAvrSxPoA+yvpLB0GKS9doyPOObUp4FLUPkP4A4/m8lniUZJZnaatEdV/Wn6jFyvYqL
         enAW2zOBpFx2XxItCJ2jpe7VphwYRGqkoBbSc4pMYOyhj5SmRUFIotdCxoC9+yYir//M
         Xf/g==
X-Gm-Message-State: AOJu0YzCrLv1crfDUKHZIltNwOuU92vJkhbiT64jZHAs9V43uhBSmTbD
	lCS2dU/BNTKR/4dGmYK5nKJPnbuCl7oYK1ahdOmjCptMGeC1vnizrJCusf/V3ooKXlBCWh2/+zP
	3g/U5NMrV1htCsy88izkC8SuZzLs=
X-Google-Smtp-Source: AGHT+IGdg/CULrnJYnn6p7wN3+tFx027ChXJ0CFsVo6J1qz9ySW2rphHt0Vt5rfJtjraqiKJGDHybIG4emLhVekxXTo=
X-Received: by 2002:a17:90b:378c:b0:2e3:b168:70f5 with SMTP id
 98e67ed59e1d1-2e8f1080170mr8894786a91.21.1730119700409; Mon, 28 Oct 2024
 05:48:20 -0700 (PDT)
MIME-Version: 1.0
References: <20241028073846.1087759-1-xiangyu.chen@eng.windriver.com>
In-Reply-To: <20241028073846.1087759-1-xiangyu.chen@eng.windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 28 Oct 2024 08:48:06 -0400
Message-ID: <CADkTA4OrDxhzeiGb4m6ObKYt2Un6dpakkK2cC-2ouHT6Lz8k8Q@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] openvswitch: 3.3.2
To: xiangyu.chen@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000002974bc062588e286"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Oct 2024 12:48:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8940

--0000000000002974bc062588e286
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xiangyu,

I'm not currently merging updates to packages, as I'm still completing work
to release meta-virtualization.

In about a month, I'll start my round of package updates and will look at
this then!

Bruce

On Mon, Oct 28, 2024 at 3:36=E2=80=AFAM Xiangyu Chen via lists.yoctoproject=
.org
<xiangyu.chen=3Deng.windriver.com@lists.yoctoproject.org> wrote:

> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> Bumping ovs to version v3.3.2, which comprises the following commits:
> dfe601bbc (tag: v3.3.2) Set release date for 3.3.2.
> a097f4a39 docs: Fix argument formatting in ovs-appctl(8) man page.
> 1e6c69169 dp-packet: Correct IPv4 checksum calculation.
> c1c70e083 netdev-linux: Fix unaligned access to rpl_rtnl_link_stats64.
> b176cea4f route-table: Fix another UBsan warning about pointer type.
> 9fac5b970 netdev-linux: Do not offload IP checksum.
> 73c563efc tunnel, tests: Add test for mirroring over tunnels.
> 81e64f47d ofproto-dpif-xlate: Add a recursion limit to tunnel address
> lookup.
> 742812517 netdev-dpdk: Fix race condition in mempool information dump.
> e0c0302d7 ovsdb: transaction: Remove incorrect transaction abort in
> pre-commit.
> 59d80787a netlink-notifier: Silence the UBsan's function pointer mismatch
> error.
> bd133fcf6 Documentation: Update QEMU documentation URLs.
> 6738b680e match: Fix false-positive snprintf size warning.
> 5bf4c0f09 util: Add non-NULL format assertion to xvasprintf.
> 9cbd8804d docs: Define Read the Docs configuration for Sphinx HTML
> parameters.
> 6eca4d13c flow: Fix unaligned access to the ND target in miniflow_extract=
.
> d2119feb0 dpif-netlink-rtnl: Fix netdev leak in out-of-tree tunnels probe=
.
> 9c439c23e dpctl: Fix netdev reference leak in "show" command.
> 15cbfb19f cirrus: Update to FreeBSD 14.1.
> a3722ab1f ovs-monitor-ipsec: LibreSwan v5 support.
> bd18a1373 ovs-monitor-ipsec: LibreSwan autodetect version.
> 504efbe92 netdev-dpdk: Check pending reset when adding device.
> 2393305d9 odp-execute: Check IPv4 checksum offload flag in AVX.
> 0aec0c2cc odp-execute: Set IPv6 traffic class in AVX implementation.
> dd1aea7f8 ofp-prop: Fix unaligned 128 bit access.
> 830fd4823 dpdk: Check other_config:dpdk-extra for '--lcores'.
> 8499e9027 Prepare for 3.3.2.
> 2b87b844d (tag: v3.3.1) Set release date for 3.3.1.
> 81d2804fc python: ovs: flow: Fix nested check_pkt_len acts.
> 8c15b5c0f python: idl: Fix index not being updated on row modification.
> 80c935dba python: ovsdb-idl: Convert new_uuid insert() arg to UUID.
> 6b6d7f05d python: ovsdb-idl: Make IndexedRows mirror hmap.
> 479dd96e1 ci: Restore vhost-user unit tests in check-dpdk.
> cc9962248 system-dpdk: Fix socket conflict when starting testpmd.
> 5bb95ad08 netdev-dpdk: Refactor tunnel checksum offloading.
> a9248871a netdev-dpdk: Use guest TSO segmentation size hint.
> 55d2e6d3d netdev-dpdk: Refactor TSO request code.
> 2fe3ab83a netdev-dpdk: Fix inner checksum when outer is not supported.
> 537a6bcda netdev-dpdk: Disable outer UDP checksum for net/iavf.
> 2e03f5567 netdev-dpdk: Fallback to non tunnel checksum offloading.
> 7916a2417 nsh: Add support to compose-packet and use it in system tests.
> 310cf419e tests: Convert ND, MPLS and CT sendpkt tests to compose-packet.
> 96efed349 tests: sendpkt: Allow different input formats.
> 2e89ed994 ipf: Handle common case of ipf defragmentation.
> 69424e53b ipf: Only add fragments to batch of same dl_type.
> 5cfbc915d python: ovsdb-idl: Use monitor_cond for _Server DB.
> 84c83589b ovsdb-idl: Add C IDL test for "monitor" fallback.
> 79608c4fd tests: Fix non-portable plus match in python vlog test.
> 6688bff49 odp-execute: Fix AVX checksum calculation.
> 0ec55bbe9 dpdk: Use DPDK 23.11.1 release for OVS 3.3.
> a3022b08a netdev-linux: Initialize link speed in error conditions.
> 216c2c1ff netdev-linux: Return an error if device feature names are empty=
.
> 1b78323a2 socket: Fix uninitialized values in inet_parse_ functions.
> 4ece94d2a dpctl: Fix uninitialized value when deleting flows.
> 7ee12c5ae netdev-native-tnl: Fix use of uninitialized offset on SRv6
> header pop.
> 258bc1e0c netdev-linux: Fix ethtool_cmd is partly outside array bounds.
> ffbce0c42 atlocal: Replace deprecated pkg_resources.
> 1f0423a4e atlocal: Fix setting HAVE_PYTEST on unexpected errors.
> 95baf295a srv6: Fix misaligned writes to segment list.
> 8d4ba3b5a compiler: Fix errors in Clang 17 ubsan checks.
> d153eff60 table: Fix freeing global variable.
> f02dc3cfe vlog: Destroy async_append first then close log_fd.
> bf1b16364 conntrack: Fully initialize conn struct before insertion.
> cf461fe28 conntrack: Do not use {0} to initialize unions.
> 20ed5491c ovsdb-client: Add missing arg to help for 'dump'.
> 4756bf4ba ofproto-dpif-trace: Fix access to an out-of-scope stack memory.
> 01eca18be hash, jhash: Fix unaligned access to the hash remainder.
> 4f61523c0 sparse: Add additional define for sparse on GCC >=3D 14.
> 9a5c24d70 sparse: Add immintrin.h header.
> 3528cc6f4 tc: Fix -Wgnu-variable-sized-type-not-at-end warning with Clang
> 18.
> 5814de568 tests: Fix build failure with Clang 18 due to
> -Wformat-truncation.
> a6c3b5202 netdev-dpdk: Fix possible memory leak configuring VF MAC addres=
s.
> 42e685916 ovsdb: raft: Fix probe intervals after install snapshot request=
.
> 1c44cb596 ovsdb: raft: Fix inability to join a cluster with a large
> database.
> 5966c22b8 rhel/systemd: Set ovsdb-server timeout to 5 minutes.
> f19448b86 github: Update python to 3.12.
> b705fb8dd ovsdb-dot: Fix flake8 issues.
> 1ac823cb0 ovsdb-doc: Fix syntax warning with Python 3.12 and flake8 issue=
s.
> 7e99dbd8a python: Remove hacking dependency and use recent flake8.
> 41055da76 cirrus: Update to FreeBSD 13.3.
> 6448c1b69 vlog: Log stack trace on vlog_abort.
> a6852319b tests: Fix compatibility issue with Python 3.13 in vlog.at.
> 775507fe9 ofproto-dpif-upcall: Fix ukey installation failure logs and
> counters.
> b26baf873 conntrack: Do not use icmp reverse helper for icmpv6.
> b9f28c586 conntrack: Fix SNAT with exhaustion system test.
> 43db93787 ovsdb: raft: Fix inability to join after leadership change roun=
d
> trip.
> 2a2f162b5 ovsdb: raft: Fix assertion when 1-node cluster looses leadershi=
p.
> a174a5ab8 ovsdb: raft: Fix permanent joining state on a cluster member.
> 5eac230f2 ovsdb: raft: Fix time intervals for multitasking while joining.
> 99fe661f0 ovsdb: raft: Avoid transferring leadership to unavailable
> servers.
> c560f6ca3 ofproto-dpif-xlate: Fix continuations with associated metering.
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  recipes-networking/openvswitch/openvswitch_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb
> b/recipes-networking/openvswitch/openvswitch_git.bb
> index b7d9b8dd..46b1e773 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -14,12 +14,12 @@ RDEPENDS:${PN}-ptest +=3D "\
>         "
>
>  S =3D "${WORKDIR}/git"
> -PV =3D "3.3.0"
> -CVE_VERSION =3D "3.3.0"
> +PV =3D "3.3.2"
> +CVE_VERSION =3D "3.3.2"
>
>  FILESEXTRAPATHS:append :=3D "${THISDIR}/${PN}-git:"
>
> -SRCREV =3D "1c1f173ce8a8534e262083bc4db3ee15f05231c0"
> +SRCREV =3D "dfe601bbc154c836e6ec3526a1eb331c1c09a06e"
>  SRC_URI +=3D "git://
> github.com/openvswitch/ovs.git;protocol=3Dhttps;branch=3Dbranch-3.3 \
>
>  file://openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.pa=
tch
> \
>              file://run-ptest \
> --
> 2.35.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8937):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8937
> Mute This Topic: https://lists.yoctoproject.org/mt/109253027/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000002974bc062588e286
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Hi =
Xiangyu,</div><div class=3D"gmail_default" style=3D"font-size:small"><br></=
div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;m not curr=
ently merging updates to packages, as I&#39;m still completing work to rele=
ase meta-virtualization.</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
In about a month, I&#39;ll start my round of package updates and will look =
at this then!</div><div class=3D"gmail_default" style=3D"font-size:small"><=
br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Mon, Oct 28, 2024 at 3:36=E2=80=AFAM Xiangyu Chen via <a href=3D"http://=
lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;xiangyu.chen=3D<a hr=
ef=3D"mailto:eng.windriver.com@lists.yoctoproject.org">eng.windriver.com@li=
sts.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">From: Xiangyu Chen &lt;<a href=3D"mailto:xiangyu.chen@w=
indriver.com" target=3D"_blank">xiangyu.chen@windriver.com</a>&gt;<br>
<br>
Bumping ovs to version v3.3.2, which comprises the following commits:<br>
dfe601bbc (tag: v3.3.2) Set release date for 3.3.2.<br>
a097f4a39 docs: Fix argument formatting in ovs-appctl(8) man page.<br>
1e6c69169 dp-packet: Correct IPv4 checksum calculation.<br>
c1c70e083 netdev-linux: Fix unaligned access to rpl_rtnl_link_stats64.<br>
b176cea4f route-table: Fix another UBsan warning about pointer type.<br>
9fac5b970 netdev-linux: Do not offload IP checksum.<br>
73c563efc tunnel, tests: Add test for mirroring over tunnels.<br>
81e64f47d ofproto-dpif-xlate: Add a recursion limit to tunnel address looku=
p.<br>
742812517 netdev-dpdk: Fix race condition in mempool information dump.<br>
e0c0302d7 ovsdb: transaction: Remove incorrect transaction abort in pre-com=
mit.<br>
59d80787a netlink-notifier: Silence the UBsan&#39;s function pointer mismat=
ch error.<br>
bd133fcf6 Documentation: Update QEMU documentation URLs.<br>
6738b680e match: Fix false-positive snprintf size warning.<br>
5bf4c0f09 util: Add non-NULL format assertion to xvasprintf.<br>
9cbd8804d docs: Define Read the Docs configuration for Sphinx HTML paramete=
rs.<br>
6eca4d13c flow: Fix unaligned access to the ND target in miniflow_extract.<=
br>
d2119feb0 dpif-netlink-rtnl: Fix netdev leak in out-of-tree tunnels probe.<=
br>
9c439c23e dpctl: Fix netdev reference leak in &quot;show&quot; command.<br>
15cbfb19f cirrus: Update to FreeBSD 14.1.<br>
a3722ab1f ovs-monitor-ipsec: LibreSwan v5 support.<br>
bd18a1373 ovs-monitor-ipsec: LibreSwan autodetect version.<br>
504efbe92 netdev-dpdk: Check pending reset when adding device.<br>
2393305d9 odp-execute: Check IPv4 checksum offload flag in AVX.<br>
0aec0c2cc odp-execute: Set IPv6 traffic class in AVX implementation.<br>
dd1aea7f8 ofp-prop: Fix unaligned 128 bit access.<br>
830fd4823 dpdk: Check other_config:dpdk-extra for &#39;--lcores&#39;.<br>
8499e9027 Prepare for 3.3.2.<br>
2b87b844d (tag: v3.3.1) Set release date for 3.3.1.<br>
81d2804fc python: ovs: flow: Fix nested check_pkt_len acts.<br>
8c15b5c0f python: idl: Fix index not being updated on row modification.<br>
80c935dba python: ovsdb-idl: Convert new_uuid insert() arg to UUID.<br>
6b6d7f05d python: ovsdb-idl: Make IndexedRows mirror hmap.<br>
479dd96e1 ci: Restore vhost-user unit tests in check-dpdk.<br>
cc9962248 system-dpdk: Fix socket conflict when starting testpmd.<br>
5bb95ad08 netdev-dpdk: Refactor tunnel checksum offloading.<br>
a9248871a netdev-dpdk: Use guest TSO segmentation size hint.<br>
55d2e6d3d netdev-dpdk: Refactor TSO request code.<br>
2fe3ab83a netdev-dpdk: Fix inner checksum when outer is not supported.<br>
537a6bcda netdev-dpdk: Disable outer UDP checksum for net/iavf.<br>
2e03f5567 netdev-dpdk: Fallback to non tunnel checksum offloading.<br>
7916a2417 nsh: Add support to compose-packet and use it in system tests.<br=
>
310cf419e tests: Convert ND, MPLS and CT sendpkt tests to compose-packet.<b=
r>
96efed349 tests: sendpkt: Allow different input formats.<br>
2e89ed994 ipf: Handle common case of ipf defragmentation.<br>
69424e53b ipf: Only add fragments to batch of same dl_type.<br>
5cfbc915d python: ovsdb-idl: Use monitor_cond for _Server DB.<br>
84c83589b ovsdb-idl: Add C IDL test for &quot;monitor&quot; fallback.<br>
79608c4fd tests: Fix non-portable plus match in python vlog test.<br>
6688bff49 odp-execute: Fix AVX checksum calculation.<br>
0ec55bbe9 dpdk: Use DPDK 23.11.1 release for OVS 3.3.<br>
a3022b08a netdev-linux: Initialize link speed in error conditions.<br>
216c2c1ff netdev-linux: Return an error if device feature names are empty.<=
br>
1b78323a2 socket: Fix uninitialized values in inet_parse_ functions.<br>
4ece94d2a dpctl: Fix uninitialized value when deleting flows.<br>
7ee12c5ae netdev-native-tnl: Fix use of uninitialized offset on SRv6 header=
 pop.<br>
258bc1e0c netdev-linux: Fix ethtool_cmd is partly outside array bounds.<br>
ffbce0c42 atlocal: Replace deprecated pkg_resources.<br>
1f0423a4e atlocal: Fix setting HAVE_PYTEST on unexpected errors.<br>
95baf295a srv6: Fix misaligned writes to segment list.<br>
8d4ba3b5a compiler: Fix errors in Clang 17 ubsan checks.<br>
d153eff60 table: Fix freeing global variable.<br>
f02dc3cfe vlog: Destroy async_append first then close log_fd.<br>
bf1b16364 conntrack: Fully initialize conn struct before insertion.<br>
cf461fe28 conntrack: Do not use {0} to initialize unions.<br>
20ed5491c ovsdb-client: Add missing arg to help for &#39;dump&#39;.<br>
4756bf4ba ofproto-dpif-trace: Fix access to an out-of-scope stack memory.<b=
r>
01eca18be hash, jhash: Fix unaligned access to the hash remainder.<br>
4f61523c0 sparse: Add additional define for sparse on GCC &gt;=3D 14.<br>
9a5c24d70 sparse: Add immintrin.h header.<br>
3528cc6f4 tc: Fix -Wgnu-variable-sized-type-not-at-end warning with Clang 1=
8.<br>
5814de568 tests: Fix build failure with Clang 18 due to -Wformat-truncation=
.<br>
a6c3b5202 netdev-dpdk: Fix possible memory leak configuring VF MAC address.=
<br>
42e685916 ovsdb: raft: Fix probe intervals after install snapshot request.<=
br>
1c44cb596 ovsdb: raft: Fix inability to join a cluster with a large databas=
e.<br>
5966c22b8 rhel/systemd: Set ovsdb-server timeout to 5 minutes.<br>
f19448b86 github: Update python to 3.12.<br>
b705fb8dd ovsdb-dot: Fix flake8 issues.<br>
1ac823cb0 ovsdb-doc: Fix syntax warning with Python 3.12 and flake8 issues.=
<br>
7e99dbd8a python: Remove hacking dependency and use recent flake8.<br>
41055da76 cirrus: Update to FreeBSD 13.3.<br>
6448c1b69 vlog: Log stack trace on vlog_abort.<br>
a6852319b tests: Fix compatibility issue with Python 3.13 in <a href=3D"htt=
p://vlog.at" rel=3D"noreferrer" target=3D"_blank">vlog.at</a>.<br>
775507fe9 ofproto-dpif-upcall: Fix ukey installation failure logs and count=
ers.<br>
b26baf873 conntrack: Do not use icmp reverse helper for icmpv6.<br>
b9f28c586 conntrack: Fix SNAT with exhaustion system test.<br>
43db93787 ovsdb: raft: Fix inability to join after leadership change round =
trip.<br>
2a2f162b5 ovsdb: raft: Fix assertion when 1-node cluster looses leadership.=
<br>
a174a5ab8 ovsdb: raft: Fix permanent joining state on a cluster member.<br>
5eac230f2 ovsdb: raft: Fix time intervals for multitasking while joining.<b=
r>
99fe661f0 ovsdb: raft: Avoid transferring leadership to unavailable servers=
.<br>
c560f6ca3 ofproto-dpif-xlate: Fix continuations with associated metering.<b=
r>
<br>
Signed-off-by: Xiangyu Chen &lt;<a href=3D"mailto:xiangyu.chen@windriver.co=
m" target=3D"_blank">xiangyu.chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-networking/openvswitch/<a href=3D"http://openvswitch_git.bb" =
rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a> | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/recipes-networking/openvswitch/<a href=3D"http://openvswitch_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a> b/recipe=
s-networking/openvswitch/<a href=3D"http://openvswitch_git.bb" rel=3D"noref=
errer" target=3D"_blank">openvswitch_git.bb</a><br>
index b7d9b8dd..46b1e773 100644<br>
--- a/recipes-networking/openvswitch/<a href=3D"http://openvswitch_git.bb" =
rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
+++ b/recipes-networking/openvswitch/<a href=3D"http://openvswitch_git.bb" =
rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
@@ -14,12 +14,12 @@ RDEPENDS:${PN}-ptest +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
-PV =3D &quot;3.3.0&quot;<br>
-CVE_VERSION =3D &quot;3.3.0&quot;<br>
+PV =3D &quot;3.3.2&quot;<br>
+CVE_VERSION =3D &quot;3.3.2&quot;<br>
<br>
=C2=A0FILESEXTRAPATHS:append :=3D &quot;${THISDIR}/${PN}-git:&quot;<br>
<br>
-SRCREV =3D &quot;1c1f173ce8a8534e262083bc4db3ee15f05231c0&quot;<br>
+SRCREV =3D &quot;dfe601bbc154c836e6ec3526a1eb331c1c09a06e&quot;<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/openvswitch/ovs=
.git;protocol=3Dhttps;branch=3Dbranch-3.3" rel=3D"noreferrer" target=3D"_bl=
ank">github.com/openvswitch/ovs.git;protocol=3Dhttps;branch=3Dbranch-3.3</a=
> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://openvswitch-add-ptes=
t-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
-- <br>
2.35.5<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8937): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8937" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8937</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/109253027/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/109253027/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div>

--0000000000002974bc062588e286--

