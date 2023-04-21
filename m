Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDAD4C7618E
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 15:33:32 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web11.15711.1682091211385613885
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 21 Apr 2023 08:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=aPAnA1o+;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-7606d6bb669so62779539f.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 21 Apr 2023 08:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682091210; x=1684683210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4VhIdvDzCWKzOSvhoJIC2ez4SAl4mY15Qf0NaziG+pA=;
        b=aPAnA1o+osqtU0jFl1gtlxfXOt0MeZN7F+oOnLVkTtJ3txaIqLOnMwVNuuOg7zRguC
         zlOlOPILcSUckzto3S/WQanxIn/a3LQmDwlhuWd7MMTnm+C5H2Ziu7pnUl9j1MQhVCaK
         8Lro6DDYrz933aNgidhbTLdKFxRFgswLby+30kRm49Jh/o9e1xM6OPrOC4Qe3LNoG04p
         idH/nLz4aZ/A41qHQqj6oDhyhzaHZhHD5UVVIPiuph/r7cNUpAw2Zi1wLAJgHMixPrge
         IEBUIxTmAXbR40Xe5gnrn0l+MO7bD3dRAJv/F6QYzT6Mh71kVwuT9oO2enXu/DFfJTEf
         D+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682091210; x=1684683210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4VhIdvDzCWKzOSvhoJIC2ez4SAl4mY15Qf0NaziG+pA=;
        b=Yj5sGyAsPDcJ+hpYbyJ2S744282QArPD156ZyalKLGSunpBwUHRep7Ut5PwALV1z6d
         eBlMNHCvtv62VmNxMfK7iWswhXCdnd8qdUUpQ2tEJVe/7M+EkEjGLoptmjZ5SQJmnwJA
         XPWtq3vCPJxf/uq6Wp+64u+VH/L3QHyKR3L5Ef6DWBcniFdhHsQs6k9Ayut3NG6PPCGb
         gKdifSuQmQXoVk4zKi1xqgomErUFDS4KUFeVPvI6TqL4NrRTDFLZCjgKJE3C+kDrl6/O
         0rzXjPHSAcbZzFP8JoV0TmpAQB1AwUbmkDP1ca4prGAtQpVnESiSKztRemR/XC/viyU9
         pzwA==
X-Gm-Message-State: AAQBX9eWzYzCsmE9Y2TelfGXz2TVN9gbYvZr/+C3fvg0N6tWUWs73iNG
	qQkTikuV/vWSqfHaFYdnnWO1MA5NFfYfGSeLqBL1RTGE7Gg=
X-Google-Smtp-Source: AKy350YduMUN0n9NuXuvNAvXhEkygoVvqs7Ei7Iy791rFBJWRxKzba5nUGyRdDkANJvdSyTsxQO4W6g3lWNYsH7dRNs=
X-Received: by 2002:a6b:610a:0:b0:763:64c9:7b68 with SMTP id
 v10-20020a6b610a000000b0076364c97b68mr4158592iob.13.1682091210151; Fri, 21
 Apr 2023 08:33:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230417043538.170500-1-xiangyu.chen@eng.windriver.com>
In-Reply-To: <20230417043538.170500-1-xiangyu.chen@eng.windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 21 Apr 2023 11:33:29 -0400
Message-ID: <CADkTA4PS26EPNjz-+im5m-U5GJJA9wR+64U4Ogje7Cwv0zudYQ@mail.gmail.com>
Subject: Re: [meta-virtualization][kirkstone][PATCH] ovs: update to 2.17.6
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 21 Apr 2023 15:33:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8009

merged to kirstone.

Other OVS changes are staged on master-next.

Bruce

On Mon, Apr 17, 2023 at 12:36=E2=80=AFAM Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:
>
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> Updating openvswitch from 2.17.1 to 2.17.6, pickup the latest security an=
d bug fixes.
>
> Changes:
> 1. Removed the patch 0001-lldp-Fix-bugs-when-parsing-malformed-AutoAttach=
.patch.
> 2. Update SRCREV PV-version and CVE_VERSION
>
> Commit short log:
> a08bb41e3 Set release date for 2.17.6.
> 27fb5db7f ofproto-dpif-xlate: Always mask ip proto field.
> c3684a060 conntrack-tp: Fix clang warning.
> be19308aa netdev-offload-tc: Del ufid mapping if device not exist.
> 4f41e58bc netdev-tc-offloads: Fix misaligned 8 byte read.
> d6d1cad6a dpif-netlink: Always create at least 1 handler.
> 09e6e1de7 ofproto-dpif-upcall: Wait for valid hw flow stats before applyi=
ng min-revalidate-pps.
> 691b9e514 system-traffic: Fix conntrack test cases which are failing with=
 af_xdp.
> 7aa314c9c netdev-windows: Add checking when creating netdev with system t=
ype on Windows
> 215278bde ofproto-dpif-upcall: Include hardware offloaded flows in total =
flows.
> 4a3f8845e ofproto-dpif-upcall: Reset ukey's last stats value if the datap=
ath changed.
> 132fa24b6 classifier: Fix missing masks on a final stage with ports trie.
> 8661abd4c ofproto: Fix re-creation of tunnel backing interfaces on restar=
t.
> 638441e98 ovs-actions: Correct typo in ovs-actions man page.
> 3c4bd63bc ofproto-ipfix: Use per-domain template timeouts.
> d2583ccb7 ofproto-dpif-upcall: Use last known stats ukey stats on revalid=
ate missed dp flows.
> 705190d88 conntrack: Properly unNAT inner header of related traffic.
> d87b6180e dpctl: Fix memory leak in flush conntrack.
> 6626562c5 sparse: Fix build with DPDK and GCC 12.
> 82dc71f80 ovsdb-server: Fix handling of DNS name for listener configurati=
on.
> 9b341844e netdev-offload-tc: If the flow has not been used, report it as =
such.
> adac28dcd netdev-offload-tc: Conntrack ALGs are not supported with tc.
> a1c2abba7 netdev-offload-tc: Fix tc conntrack force commit support.
> 68a2818b0 ofproto-dpif-upcall: New ukey needs to take the old ukey's dump=
 seq.
> 2eb7a6066 netdev-offload-tc: Preserve tc statistics when flow gets modifi=
ed.
> 4f5140769 sparse: Fix numa.h for libnuma >=3D 2.0.13.
> 32853c084 tc: Add TCA_KIND flower to delete and get operation to avoid rt=
nl_lock().
> 037131229 netdev-offload-tc: Fix misaligned access to ct label.
> 206409bb7 ovsdb: Fix database statistics during the database replacement.
> 0f55eced1 cirrus: Update to use FreeBSD 12.4.
> e9336a91f tc: Add support for TCA_STATS_PKT64.
> ba62a1eae Documentation: Fix links in maintainers.rst.
> 1b76faf8d Documentation: Fix links in the DPDK guide on physical ports.
> e1ee9c32a treewide: Don't use non-portable '=3D=3D' with test command.
> a7d7c30c4 dpif: Fix tunnel key set for IPv6 tunnels with SLOW_ACTION.
> 8d055809b ci: Fix overriding OPTS provided from the yml.
> 0eb2aa46b Prepare for 2.17.6.
> 08971e4b9 Set release date for 2.17.5.
> ecaacb01a lldp: Fix bugs when parsing malformed AutoAttach.
> ee002b351 dpif-netdev: Use unmasked key when adding datapath flows.
> 18dcfda67 ovsdb-cs: Consider default conditions implicitly acked.
> 793709a85 rculist: Use rculist_back_protected to access prev.
> abb9d3482 Prepare for 2.17.5.
> b6c3788fe Set release date for 2.17.4.
> b50f4e3d2 odp-util: Fix reporting unknown keys as keys with bad length.
> 44012fccd ovs-dpctl-top: Fix ovs-dpctl-top via pipe.
> 118e4349d rculist: Fix iteration macros.
> c9f10ae33 vswitchd: Publish per iface received multicast packets.
> 4e3f9951f learn: Fix parsing immediate value for a field match.
> 282ba24d9 datapath-windows: Check the condition to reset pseudo header ch=
ecksum on Rx side
> ee0e1d0a5 netdev-offload-dpdk: Enhance the support of tunnel pop action
> 4e3d762f0 ci: Update meson requirement for DPDK.
> 0d1e425c7 ovsdb: transaction: Fix weak reference leak.
> ceab1ca1e ovsdb: transaction: Refactor assess_weak_refs.
> fa95bf962 ovs-tcpdump: Cleanup mirror port on SIGHUP/SIGTERM.
> 7ebef81f9 netdev-linux: Fix inability to apply QoS on ports with custom q=
discs.
> 037ef6301 tc: Fix misaligned writes while parsing pedit.
> 869e2e1ba odp-util: Add missing separator in format_odp_conntrack_action(=
).
> 0aa55709f vswitch.xml: Fix the name of rstp-path-cost option.
> af459fa37 mac-learning: Fix learned fdb entries not age out issue.
> c4336a1f1 ofproto-dpif-xlate: Update tunnel neighbor when receive gratuit=
ous ARP.
> 683508cd4 bond: Fix crash while logging not yet enabled member.
> 41b178d52 netdev-dpdk: Fix tx_dropped counters value.
> d0276481a unaligned: Correct the stats of packet_count and byte_count on =
Windows.
> 71401199f tests: Fix filtering of whole-second durations.
> 3c1c034e5 netdev-offload: Set 'miss_api_supported' to be under netdev.
> 35615cd37 cmap: Add thread fence for slot update.
> 5f8ba216a ofproto-dpif-xlate: Do not use zero-weight buckets in select gr=
oups.
> 5e26f88b4 github: Update versions of action dependencies.
> afce3662f ovs-tcpdump: Fix bond port unable to capture jumbo frames.
> 602a41bb3 json: Fix deep copy of objects and arrays.
> 5dde4d748 Prepare for 2.17.4.
> 2b4b4b868 Set release date for 2.17.3.
> fbc3b10e9 Add support for OpenSSL 3.0 functions.
> 5a77d53b8 dhparams: Fix .c file generation with OpenSSL >=3D 3.0.
> 09e22fec4 daemon-unix: Fix file descriptor leak when monitor restarts chi=
ld.
> 53df50db2 vconn: Allow ECONNREFUSED in refuse connection test.
> 26a11ca61 dpdk: Use DPDK 21.11.2 release.
> edf699ec6 m4: Test avx512 for x86 only.
> 1989caf9e ovsdb-idl: Preserve references for rows deleted in same IDL run=
 as their insertion.
> db6a612cd python: idl: Fix idl.Row.__str__ method.
> 73d7bf64a bond: Avoid deadlock while updating post recirculation rules.
> 70a63391c ofproto-dpif-upcall: Add debug commands to pause/resume revalid=
ators.
> cf0e12f8a test-list: Fix false-positive build failure with GCC 12.
> 5cbed27c8 tests: Fix tests with GNU grep 3.8.
> a5cd60db0 cirrus: Upgrade to FreeBSD 13.1 image.
> 43ece36f3 netdev-linux: Skip some internal kernel stats gathering.
> 846d6a0c5 ofproto-dpif-xlate: Fix error messages for nonexistent ports/re=
circ_ids.
> e8814c9b8 ofproto-dpif-xlate: Clear tunnel wc bits if original packet is =
non-tunnel.
> dfc3e65c8 raft: Fix unnecessary periodic compactions.
> 6f322ccf8 netdev-offload-tc: Parse tunnel options only for geneve ports.
> a9f10a2bd netdev-offload-tc: Add missing handling of the tunnel source po=
rt.
> ec2e967c1 netdev-offload-tc: Fix ignoring unknown tunnel keys.
> 686984d9a netdev-offload-tc: Use masks instead of keys while parsing tunn=
el attributes.
> 92c072d94 netdev-offload-tc: Explicitly handle mask for the tunnel destin=
ation port.
> 87f191a3a netdev-offload-tc: Fix the mask for tunnel metadata length.
> cadcea6fe releases: Mark 2.17 as a new LTS release.
> 8a1b73448 handlers: Fix handlers mapping.
> 713072fda handlers: Create additional handler threads when using CPU isol=
ation.
> 84a8910ff packets: Fix misaligned access to ip6_hdr.
> fe27e0c88 python: Do not send non-zero flag for a SSL socket.
> 729a872f1 dpif-netdev: Simplify AVX512 build time checks to enhance reada=
bility.
> 1b566f8b8 github: Move CI to ubuntu 20.04 base image.
> 86725abe1 netdev-offload-tc: Disable offload of IPv6 fragments.
> 2276daf88 ovs-save: Use right OpenFlow version for add-tlv-map.
> c353e757d system-traffic: Fix IPv4 fragmentation test sequence for check-=
kernel.
> 6f54dc134 system-traffic: Fix incorrect neigh entry in ipv6 header modifi=
cation test.
> 7848ae6ff system-traffic: Don't run IPv6 header modification test on kern=
els < 5.19.
> 399185865 netdev-linux: set correct action for packets that passed police=
r
> cda60c855 python: Fix E275 missing whitespace after keyword.
> 3678fb544 tc: Use sparse hex dump while printing inconsistencies.
> 03a0ec82b netdev-offload-tc: Print unused mask bits on failure.
> 5b8453a44 dynamic-string: Add function for a sparse hex dump.
> 8d7cb1daf dpif-netlink: Fix incorrect bit shift in compat mode.
> d1cec2686 python: Use setuptools instead of distutils.
> 8d6ecb259 packets: Re-calculate IPv6 checksum only for first frag upon mo=
dify.
> 26dbc822d test-ovsdb: Fix false-positive leaks from LeakSanitizer.
> 6eab10cf2 m4: Update ax_func_posix_memalign to the latest version.
> 2f51bfd23 m4: Replace obsolete AC_HELP_STRING with AS_HELP_STRING.
> 8ad325aab libopenvswitch.pc: Add missing libs for a static build.
> b64ff3f48 rhel: Stop installing internal headers.
> b63bbf2db python-c-ext: Handle initialization failures.
> 4ad02ad04 netdev-linux: Do not touch LAG members if master is not attache=
d to OVS.
> e6dcd07bc netdev: Clear auto_classified if netdev reopened with the type =
specified.
> 1eedf45e8 system-traffic: Properly stop dangling ping after geneve test.
> fb8e34bdb conntrack: Fix conntrack multiple new state.
> af37f4118 python-c-ext: Fix a couple of build warnings.
> b7d9f7610 python-c-ext: Remove Python 2 support.
> 02fb4bfb8 netdev-offload-dpdk: Setting RSS hash types in RSS action.
> 8e8fcf7bd lib: Print nw_frag in flow key.
> 29d8ce1ad ovsdb: Remove extra make target dependency for local-config.5.
> 13ac0bc7c tc: Fix misaligned access while creating pedit actions.
> 2c85d737a utilities/bashcomp: Fix incorrect file mode.
> 05e9d2b7a Pmd.at: fix dpcls and dpif configuration test cases.
> 45ecaa9e5 ovsdb: Add Local_Config schema.
> 61d64d389 dpif-netdev: Fix leak of AVX512 DPIF scratch pad.
> a77ad9693 dpif-netdev: Refactor AVX512 runtime checks.
> ccea7df57 dpif-netdev-extract-avx512: Protect GCC builtin usage.
> 807f7f994 ovs-tcpdump: Default to OVS_RUNDIR if present.
> ec13b03ca ovsdb: Fix memory leak on error path in ovsdb_file_read__().
> 8b2dff2e3 odp-util: Ignore unknown attributes in parse_key_and_mask_to_ma=
tch().
> 13d97f663 ofproto-dpif: Avoid unneccesary backer revalidation.
> 9b4035d69 lldp: Fix lldp memory leak.
> d9351febc ipfix: Trigger revalidation if ipfix options changes.
> 5419b1de9 conntrack: Fix incorrect bit shift while hashing nat range.
> 1ab5f94a1 packets: Fix misaligned write to MPLS lse.
> 8e00be03c tc: Fix misaligned access to stats and time values.
> 3a1f5341c odp-util: Fix unaligned access to tunnel id.
> 0c54c43b8 ofpbuf: Fix offsetting a NULL pointer in ofpbuf_reserve.
> 98edacb40 drop-stats.at: Fix frequent failures of the recursion too deep =
test.
> cbc13ce4f odp_util: Fix parse_key_and_mask_to_match() vlan parsing.
> 73e6ce492 Prepare for 2.17.3.
> 95979b0f0 Set release date for 2.17.2.
> 250e1a6dd ofproto-dpif-xlate: Fix internal CT state for non-recirc traffi=
c.
> fe870ee07 classifier: Adjust segment boundary to execute prerequisite pro=
cessing.
> ec0ec464b ovs-tcpdump: Fix error when stopping ovs-tcpdump.
> 420823e2a ofproto-dpif: Fix meter use-after-free.
> c762da262 ovs-rcu: Add ovsrcu_barrier.
> cd9b6b64f dpif-netdev: Fix ALB 'rebalance_intvl' max hard limit.
> 64f6c49d2 dpif-netdev: Fix ALB parameters type mismatch.
> b11b84ea7 dpdk: Use DPDK 21.11.1 release.
> d3bf48e9a raft: Don't use HMAP_FOR_EACH_SAFE when logging commands.
> e07377bb4 ovsdb: raft: Fix transaction double commit due to lost leadersh=
ip.
> 5da86cb36 dynamic-string: Fix undefined behavior due to offsetting null p=
ointer.
> 369e68890 Revert "odp-util: Always report ODP_FIT_TOO_LITTLE for IGMP."
> 18341166e ofproto-dpif-xlate: Fix netdev native tunnel neigh discovery sp=
a.
> 748e4b2b5 ovs-router: Expose the ovs_router_get_netdev_source_address fun=
ction.
> 34390bb35 ofproto-dpif: Trigger revalidation if ct tp changes.
> 1adb07e20 Carefully release NBL in Windows
> 1ccaba448 tests: Properly kill ovsdb test processes.
> 260b091c2 ovs-save: Get highest ofp version error.
> 7606bb121 netdev-linux: Properly access 32-bit aligned rtnl_link_stats64 =
structs.
> 0688b9f27 treewide: Avoid offsetting NULL pointers.
> 92bcf0a82 treewide: Fix invalid bit shift operations.
> 7fa76371d utilities: Handle dumping packets in GDB TUI.
> 8cac8baa8 ofproto-dpif-xlate: Remove mirror assert.
> e0e8f0c54 netdev-dpdk: Fix tx drops statistic for a down netdev.
> f9b5f8a78 netdev-dpdk: Remove a leftover lock annotation.
> 4c3976ff2 netdev-dpdk: Refactor the DPDK transmit path.
> 410b97c83 netdev-offload-dpdk: Fix ethernet type for VLANs.
> 7948312fe netdev-offload-dpdk: Use has_vlan match attribute.
> 522c46884 python: idl: Raise AttributeError from uuid_to_row.
> cb24c524e ofproto-dpif-xlate: Clear out vlan flow fields while processing=
 native tunnel.
> a665b75de dpif-netdev-avx512: Fix overflow of UINT32_C(1).
> 60e7badd6 dpif-netdev-avx512: Fix ubsan shift error in bitmasks.
> 9cc329ec5 python: Politely handle misuse of table.condition.
> 0631be2b5 ofproto-xlate: Fix crash when forwarding packet between legacy_=
l3 tunnels.
> df9790309 system-traffic: Fix fragment reassembly with L3 L4 protocol inf=
ormation.
> ba159ee0f cirrus: Update FreeBSD versions.
> bd1a3b6b4 Prepare for 2.17.2.
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  ...gs-when-parsing-malformed-AutoAttach.patch | 86 -------------------
>  .../openvswitch/openvswitch_git.bb            |  7 +-
>  2 files changed, 3 insertions(+), 90 deletions(-)
>  delete mode 100644 recipes-networking/openvswitch/files/0001-lldp-Fix-bu=
gs-when-parsing-malformed-AutoAttach.patch
>
> diff --git a/recipes-networking/openvswitch/files/0001-lldp-Fix-bugs-when=
-parsing-malformed-AutoAttach.patch b/recipes-networking/openvswitch/files/=
0001-lldp-Fix-bugs-when-parsing-malformed-AutoAttach.patch
> deleted file mode 100644
> index ec40106..0000000
> --- a/recipes-networking/openvswitch/files/0001-lldp-Fix-bugs-when-parsin=
g-malformed-AutoAttach.patch
> +++ /dev/null
> @@ -1,86 +0,0 @@
> -From 7490f281f09a8455c48e19b0cf1b99ab758ee4f4 Mon Sep 17 00:00:00 2001
> -From: Qian Chen <cq674350529@163.com>
> -Date: Tue, 20 Dec 2022 09:36:08 -0500
> -Subject: [PATCH] lldp: Fix bugs when parsing malformed AutoAttach.
> -
> -The OVS LLDP implementation includes support for AutoAttach standard, wh=
ich
> -the 'upstream' lldpd project does not include.  As part of adding this
> -support, the message parsing for these TLVs did not include proper lengt=
h
> -checks for the LLDP_TLV_AA_ELEMENT_SUBTYPE and the
> -LLDP_TLV_AA_ISID_VLAN_ASGNS_SUBTYPE elements.  The result is that a mess=
age
> -without a proper boundary will cause an overread of memory, and lead to
> -undefined results, including crashes or other unidentified behavior.
> -
> -The fix is to introduce proper bounds checking for these elements.  Intr=
oduce
> -a unit test to ensure that we have some proper rejection in this code
> -base in the future.
> -
> -Fixes: be53a5c447c3 ("auto-attach: Initial support for Auto-Attach stand=
ard")
> -
> -Upstream-Status: Backport from upstream [https://github.com/openvswitch/=
ovs/commit/7490f281f09a8455c48e19b0cf1b99ab758ee4f4]
> -CVE: CVE-2022-4337 - openvswitch: Out-of-Bounds Read in Organization Spe=
cific TLV
> -CVE: CVE-2022-4338 - openvswitch: Integer Underflow in Organization Spec=
ific TLV
> -
> -Signed-off-by: Qian Chen <cq674350529@163.com>
> -Co-authored-by: Aaron Conole <aconole@redhat.com>
> -Signed-off-by: Aaron Conole <aconole@redhat.com>
> -Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
> -Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ----
> - lib/lldp/lldp.c       |  2 ++
> - tests/ofproto-dpif.at | 19 +++++++++++++++++++
> - 2 files changed, 21 insertions(+)
> -
> -diff --git a/lib/lldp/lldp.c b/lib/lldp/lldp.c
> -index dfeb2a800..6fdcfef56 100644
> ---- a/lib/lldp/lldp.c
> -+++ b/lib/lldp/lldp.c
> -@@ -583,6 +583,7 @@ lldp_decode(struct lldpd *cfg OVS_UNUSED, char *fram=
e, int s,
> -
> -                 switch(tlv_subtype) {
> -                 case LLDP_TLV_AA_ELEMENT_SUBTYPE:
> -+                    CHECK_TLV_SIZE(50, "ELEMENT");
> -                     PEEK_BYTES(&msg_auth_digest, sizeof msg_auth_digest=
);
> -
> -                     aa_element_dword =3D PEEK_UINT32;
> -@@ -629,6 +630,7 @@ lldp_decode(struct lldpd *cfg OVS_UNUSED, char *fram=
e, int s,
> -                     break;
> -
> -                 case LLDP_TLV_AA_ISID_VLAN_ASGNS_SUBTYPE:
> -+                    CHECK_TLV_SIZE(36, "ISID_VLAN_ASGNS");
> -                     PEEK_BYTES(&msg_auth_digest, sizeof msg_auth_digest=
);
> -
> -                     /* Subtract off tlv type and length (2Bytes) + OUI =
(3B) +
> -diff --git a/tests/ofproto-dpif.at b/tests/ofproto-dpif.at
> -index eb4cd1896..fa6111c1e 100644
> ---- a/tests/ofproto-dpif.at
> -+++ b/tests/ofproto-dpif.at
> -@@ -62,6 +62,25 @@ AT_CHECK([ovs-appctl coverage/read-counter rev_reconf=
igure], [0], [dnl
> - OVS_VSWITCHD_STOP
> - AT_CLEANUP
> -
> -+AT_SETUP([ofproto-dpif - malformed lldp autoattach tlv])
> -+OVS_VSWITCHD_START()
> -+add_of_ports br0 1
> -+
> -+dnl Enable lldp
> -+AT_CHECK([ovs-vsctl set interface p1 lldp:enable=3Dtrue])
> -+
> -+dnl Send a malformed lldp packet
> -+packet=3D"0180c200000ef6b426aa5f0088cc020704f6b426aa5f00040305763206020=
0780c"dnl
> -+"5044454144424545464445414442454546444541444245454644454144424545464445=
414"dnl
> -+"4424545464445414442454546444541444245454644454144424545464445414442454=
546"dnl
> -+"4445414442454546fe0500040d0c010000"
> -+AT_CHECK([ovs-appctl netdev-dummy/receive p1 "$packet"], [0], [stdout])
> -+
> -+OVS_WAIT_UNTIL([grep -q "ISID_VLAN_ASGNS TLV too short" ovs-vswitchd.lo=
g])
> -+
> -+OVS_VSWITCHD_STOP(["/|WARN|ISID_VLAN_ASGNS TLV too short received on/d"=
])
> -+AT_CLEANUP
> -+
> - AT_SETUP([ofproto-dpif - active-backup bonding (with primary)])
> -
> - dnl Create br0 with members p1, p2 and p7, creating bond0 with p1 and
> ---
> -2.34.1
> -
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-=
networking/openvswitch/openvswitch_git.bb
> index ac42026..a629f9b 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -14,12 +14,12 @@ RDEPENDS:${PN}-ptest +=3D "\
>         "
>
>  S =3D "${WORKDIR}/git"
> -PV =3D "2.17.1+${SRCPV}"
> -CVE_VERSION =3D "2.17.1"
> +PV =3D "2.17.6+${SRCPV}"
> +CVE_VERSION =3D "2.17.6"
>
>  FILESEXTRAPATHS:append :=3D "${THISDIR}/${PN}-git:"
>
> -SRCREV =3D "41bb202fb37f184b0a8820a029c62d03c118614e"
> +SRCREV =3D "a08bb41e3c381f695b5ab62b0ab49b39c2b98727"
>  SRC_URI +=3D "git://github.com/openvswitch/ovs.git;protocol=3Dhttps;bran=
ch=3Dbranch-2.17 \
>              file://openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2=
ae34de2f3.patch \
>              file://run-ptest \
> @@ -27,7 +27,6 @@ SRC_URI +=3D "git://github.com/openvswitch/ovs.git;prot=
ocol=3Dhttps;branch=3Dbranch-2.
>              file://kernel_module.patch \
>              file://systemd-update-tool-paths.patch \
>              file://systemd-create-runtime-dirs.patch \
> -            file://0001-lldp-Fix-bugs-when-parsing-malformed-AutoAttach.=
patch \
>             "
>
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1ce5d23a6429dff345518758f13aa=
eab"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7995): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7995
> Mute This Topic: https://lists.yoctoproject.org/mt/98312725/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

