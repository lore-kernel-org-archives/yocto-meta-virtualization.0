Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE86FC5475B
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 12:35:40 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.61705.1710160533615373247
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Mar 2024 05:35:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lwVCRYzo;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-29a5f100c1aso2282370a91.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Mar 2024 05:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710160533; x=1710765333; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4boYF2XpGGa+AcHP1TlcJR+fRFrzPLsq/D6SrOIAbk=;
        b=lwVCRYzoz8PmNzwS5kDY7g2/7AfLOL5LvA7rjaZlp6j+qDW2MhjR3CVOuKBGtxqxvT
         /4S67tM8KfJQ9D2WyWAMMi4ZepTpP8j3dq+toJoSTkj5v5DHBWBFNPXvVVVKVaOuoTVM
         VLEoq/2dmfztRva0QdjiNvlS10T1/81Da7byxSxb8qM4SdZhAm1jL+tmxtF7gZ4LT/OG
         W5m3kMk0NNPucogvl7Vs5mv0CNTykovqm2BMW0PZlYBxILD3f/I86UIQ1HwuxIw2U3Ge
         OhOjjDBj+YqW/RLQPIvWwhtUzfowFCPBO/eea+SDCJBwDux330yEXl4GPLB75JYhfdIs
         2FKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710160533; x=1710765333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u4boYF2XpGGa+AcHP1TlcJR+fRFrzPLsq/D6SrOIAbk=;
        b=YssTt5nAF9j5/KvqqHDUdpKS2ii/dOZwcy8H+NHtUR4pbsJby29uwR1f2diNg70amH
         dYJTQP75FhYBeNNEA8kU2E8ftQzlwJ/2YhPE+rVWyT0OLFwS0luo4P4c/tj+YJpRMDbd
         GB2+pVoBaFVBq/p8fwrl508DAA3RlB20tQFinqEYP+7gD2u8tpxOYz1Dxaop1xxtbEGn
         5Gn4uI9pv1tFPkJCEyYpHgvXGZ2dw146gJjqF9SX1tHmBlJvEylalP/7aBAF+qBmshep
         K7lAfOJyc3+8Gbts8RTftRrLmsGhyfNGjca+CUC9CwVL0rWi4oM5YB1F0pyM8d5pqyRz
         YAzQ==
X-Gm-Message-State: AOJu0YxpVxt/ZGwZjEBr8vmfHD5OBY91cp9EkOwwLpzvlt9dJBf2o2Pd
	YDXAuz9vfUP9n7Ny0PuXTJJ05H6KiU+6lJB9P8RO9nN9MHAavqyPxbDxhIAy7lvB4MoHms4pQzv
	G8d3QqF1bn9HqiujmPeCw4o3Paqg=
X-Google-Smtp-Source: AGHT+IGfutoZRdXzy9KO4YIOIr/4h2ag+pIjUXYs7j4KVpJxX7fQ2Zlkv7Jyn1yHug7XnlHyhUx/02cxUGROPtNOyLY=
X-Received: by 2002:a17:90a:d610:b0:29b:c4b7:34fd with SMTP id
 w16-20020a17090ad61000b0029bc4b734fdmr350671pju.41.1710160532606; Mon, 11 Mar
 2024 05:35:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240311105352.112166-1-yogita.urade@windriver.com>
In-Reply-To: <20240311105352.112166-1-yogita.urade@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 11 Mar 2024 08:35:20 -0400
Message-ID: <CADkTA4M8=Vj7i-5fccwgsbJJjM5DwLj2_4_D_LUgJViCcgDphg@mail.gmail.com>
Subject: Re: [meta-virtualization][kirkstone][PATCH 1/1] openvswitch: Upgrade
 2.17.6 -> 2.17.9
To: Yogita.Urade@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Mar 2024 12:35:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8620

I'm not taking anymore upgrades at this time.

Post release, I'll start another round of bumps.

Cheers,

Bruce

On Mon, Mar 11, 2024 at 6:54=E2=80=AFAM Urade, Yogita via
lists.yoctoproject.org
<Yogita.Urade=3Dwindriver.com@lists.yoctoproject.org> wrote:
>
> From: Yogita Urade <yogita.urade@windriver.com>
>
> Includes security fixes for - CVE-2023-3966 and CVE-2023-5366
>
> commits short logs:
> 0bea06d99 (tag: v2.17.9) Set release date for 2.17.9.
> b8657dada netdev-offload-tc: Check geneve metadata length.
> e235a421f odp: ND: Follow Open Flow spec converting from OF to DP.
> 002cba9f1 dpdk: Use DPDK 21.11.6 release for OVS 2.17.
> ee889659d github: Update versions of action dependencies (Node.js 20).
> bf717d0f3 ovs-atomic: Fix inclusion of Clang header by GCC 14.
> 9bbc2cf8a ovsdb-idl.at: Test IDL behavior during database conversion.
> 049189584 tests: Use _DAEMONIZE macro's to start tcpdump.
> 30099c5d9 tests-ovsdb: Switch OVSDB_START_IDLTEST to macro.
> f4b4d650a python: idl: Handle monitor_canceled.
> d6caa6ed0 vconn: Count vconn_sent regardless of log level.
> b0eb66a69 backtrace: Fix error in log_backtrace() documentation.
> bb89735b2 ovsdb: trigger: Do not allow conversion in read-only mode.
> a79ee883a ovsdb: jsonrpc-server: Fix the DSCP value in default options.
> 4f01f2f7d jsonrpc: Sort JSON objects while printing debug messages.
> 3cae42bc5 tests: ovsdb: Use diff -up format for replay test.
> a7036f6a1 ovsdb-server.at: Enbale debug logs in active-backup tests.
> c944a30fe ovsdb: transaction: Don't try to diff unchanged columns.
> 5c0dc9602 ovsdb: transaction: Avoid diffs for different type references.
> eabd4cb2f ci: Update the GitHub Ubuntu runner image to Ubuntu 22.04.
> c462aabb3 netdev-afxdp: Disable -Wfree-nonheap-object on receive.
> b3f8c32ed ovsdb-idl: Preserve change_seqno when deleting rows.
> d254aedad tunnel: Do not carry source port from a previous tunnel.
> 1857c569e netdev-offload-tc: Fix offload of tunnel key tp_src.
> 0a0c500d7 cirrus: Update from FreeBSD 12 to 14.
> 74633888d dpdk: Use DPDK 21.11.5 release for OVS 2.17.
> b5e54aa16 ovs-ofctl: Correctly mark the CT flush commands.
> 1d3609a48 mcast-snooping: Flush flood and report ports when deleting inte=
rfaces.
> df101fe1e mcast-snooping: Test per port explicit flooding.
> 8313ebbb3 flake8: Fix E721 check failures.
> f73208151 build-aux: Enable flake8 checks for python extraction scripts.
> 8b6a8fcb0 build-aux/extract-ofp-msgs: Fix flake8 and syntax errors.
> 80e922644 build-aux/extract-ofp-fields: Fix flake8 and syntax errors.
> 1508e7abc build-aux/extract-ofp-errors: Fix flake8 and syntax errors.
> 98fc48e4d build-aux/extract-ofp-actions: Fix flake8 and syntax errors.
> d52231171 automake: Move build-aux EXTRA_DIST updates to their own file.
> 8868756b8 netdev-offload: Fix Clang's static analyzer 'Division by zero' =
warnings.
> 46e9cacaa ofp-table: Fix count_common_prefix_run() function.
> 8e6d1cd04 vswitch.xml: Add entry for dpdkvhostuser userspace-tso.
> 7838778ad vswitch.xml: Add dpdkvhostuser group status.
> a3a039507 tests: Use ping timeout instead of deadline.
> 3351b149c tests/system-traffic: Ensure no name resolution for tcpdump.
> bce17b0bb tc: Improve logging of mismatched actions.
> af934924f ofproto-dpif-upcall: Pause revalidators when purging.
> 48fa54747 db-ctl-base: Fix memory leak of db commands.
> 7fb2197e1 Prepare for 2.17.9.
> 275be1eb9 (tag: v2.17.8) Set release date for 2.17.8.
> be1a8f7ec conntrack: Remove nat_conn introducing key directionality.
> f179c7c07 conntrack: simplify cleanup path
> fac770a0a netdev-dpdk: Document status options for VF MAC address.
> 79ab2eeb1 netdev-offload-dpdk: Fix flushing of a physdev.
> 4ced485f8 connmgr: Fix ofconn configuration on vswitchd startup.
> 3c39cfe03 python: idl: Fix last-id update from a monitor reply.
> a6207b2bc ofproto-dpif-xlate: Fix recirculation with patch port and contr=
oller.
> a141b62c2 ofproto-dpif-xlate: Don't reinstall removed XC_LEARN rule.
> 586e73dac configure: Avoid deprecated AC_PROG_CC_C99 if possible.
> bd95fe3d7 tests: Fix time dependency in overlapping flows modification te=
st.
> 123b7aaa7 python: Use build to generate PEP517 compatible archives.
> 41d2e7e9a python: Use twine to upload sdist package to pypi.org.
> 66d5562e3 python: Rename build related code to ovs_build_helpers.
> c880faea8 dpif-netdev: Fix length calculation of netdet_flow_key.
> 8c7aa5f58 doc: Fix description of max_len for controller action.
> 34ff03c3c docs: Fix rendering of VLAN Comparison Chart.
> 93412e00e docs: Run tbl preprocessor in manpage-check rule.
> 6929485d3 docs: Add `nowarn` region option to tables.
> 08b6b83a3 tests: Add clang-analyzer-results to gitignore.
> c252b1f8a ci: Add jobs to test -std=3Dc99 builds.
> 242bb2624 tests: Fix order of includes in barrier/id-fpool/mpsc-queue tes=
ts.
> 292eca58c sflow: Always enable _BSD_SOURCE.
> 82aa3fb01 compiler.h: Don't use asm and typeof with non-GNU compilers.
> a45b3afbf ovs.tmac: Fix troff warning in versions above groff-1.23.
> a336ef712 connmgr: Count unsent async messages.
> a74b7dfb9 dpif-netdev: Fix dpif_netdev_flow_put.
> f04bfd5e4 ofproto-dpif-xlate: Reduce stack usage in recursive xlate funct=
ions.
> 29990edbc cirrus: Update to FreeBSD 13.2.
> 65bb82369 ci: Fix OPTS not being passed to OSX builds.
> fe98b0c1f ovsdb-tool: Fix json leak while showing clustered log.
> 44722bbda ovsdb-server: Fix excessive memory usage on DB open.
> 9db221fcd tests: Add ovsdb execution cases for set size constraints.
> 3cfe388cb ovsdb: relay: Fix handling of XOR updates with size constraints=
.
> f4d15497f ovsdb: file: Fix diff application to a default column value.
> 7864ed557 ovsdb: file: Fix inability to read diffs that violate type size=
.
> 97d91ad2d ovs-tcpdump: Clear auto-assigned ipv6 address of mirror port.
> dba7482e0 ofproto-dpif: Fix removal of renamed datapath ports.
> a1ca9e589 ofproto-dpif-upcall: Mirror packets that are modified.
> 5d976536b vswitchd: Wait for a bridge exit before replying to exit unixct=
l.
> e206df08d Prepare for 2.17.8.
> f15de6508 (tag: v2.17.7) Set release date for 2.17.7.
> 4b10b0b87 fatal-signal: Don't share signal fds/handles with forked proces=
s.
> e01ea8e7e cpu: Fix cpuid check for some AMD processors.
> 111c7be31 tc: Fix crash on malformed reply from kernel.
> 75152d3d6 netdev-dpdk: Fix warning with gcc 13.
> 5285dad18 utilities/bashcomp: Fix PS1 generation on new bash.
> ebe7bd7b6 netdev-offload-dpdk: Fix crash in debug log.
> 4937a5341 stream-ssl: Disable alerts on unexpected EOF.
> fe99e6b97 tests: layer3-tunnels: Skip bareudp tests if not supported by k=
ernel.
> a375055f2 ovs-fields: Modify the width of tpa and spa.
> 749769be3 netdev-vport: RCU-fy tunnel config.
> c423fa5f6 smap: Make argument of smap_add_ipv6 constant.
> 2db06ee6f netdev-vport: Fix unsafe handling of GRE sequence number.
> 51d804aa4 dpctl: Fix dereferencing null pointer in parse_ct_limit_zones()=
.
> 80b15d142 netdev-offload: Fix deadlock/recursive use of the netdev_hmap_r=
wlock rwlock.
> 0d3c27e90 ofproto-dpif-xlate: Fix use-after-free when xlate_actions().
> 8eb24943c tc: Fix cleaning chains.
> cbe5852d7 python-stream: Handle SSL error in do_handshake.
> be3caf455 dpif-netlink: Fix memory leak dpif_netlink_open().
> b7e1593f4 ofp-parse: Check ranges on string to uint32_t conversion.
> 70cb45c66 learning-switch: Fix coredump of OpenFlow15 learning-switch.
> b08224194 ovsdb: Allow conversion records with no data in a clustered sto=
rage.
> efcdf6c0d ovsdb: Check for ephemeral columns before writing a new schema.
> bf39ea3c7 ovsdb-tool: Fix cluster-to-standalone for DB conversion records=
.
> 4f82f8903 ovs-tcpdump: Stdout is shutdown before ovs-tcpdump exit.
> 77116d990 Prepare for 2.17.7.
>
> Reference:
> https://www.openvswitch.org/releases/NEWS-2.17.9.txt
>
> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> ---
>  recipes-networking/openvswitch/openvswitch_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-=
networking/openvswitch/openvswitch_git.bb
> index a629f9ba..08a34440 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -14,12 +14,12 @@ RDEPENDS:${PN}-ptest +=3D "\
>         "
>
>  S =3D "${WORKDIR}/git"
> -PV =3D "2.17.6+${SRCPV}"
> -CVE_VERSION =3D "2.17.6"
> +PV =3D "2.17.9+${SRCPV}"
> +CVE_VERSION =3D "2.17.9"
>
>  FILESEXTRAPATHS:append :=3D "${THISDIR}/${PN}-git:"
>
> -SRCREV =3D "a08bb41e3c381f695b5ab62b0ab49b39c2b98727"
> +SRCREV =3D "0bea06d9957e3966d94c48873cd9afefba1c2677"
>  SRC_URI +=3D "git://github.com/openvswitch/ovs.git;protocol=3Dhttps;bran=
ch=3Dbranch-2.17 \
>              file://openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2=
ae34de2f3.patch \
>              file://run-ptest \
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8618): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8618
> Mute This Topic: https://lists.yoctoproject.org/mt/104860555/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

