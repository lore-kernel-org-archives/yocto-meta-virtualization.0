Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80698C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 17:18:00 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web09.11843.1643995079751705745
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 04 Feb 2022 09:18:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LkjmUBXv;
 spf=pass (domain: gmail.com, ip: 209.85.222.46,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id r8so12128845uaj.0
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 04 Feb 2022 09:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=G8WUL44Hfgsl00nNYtCZdJCH/zhsPiD+hbw5EDAG8lI=;
        b=LkjmUBXvTUV6FyLz4UPybymc4qLKZu0in76GI3hl6WSZQf7VCa903LdJgbJrM2+0Hu
         jlkYb/ktULVRO2Eu6JkS03AP+2Vl6N1YE+J8z/JeU9PKevJ5dDQaIfUojPX6S1Hm5LkL
         xvYBBV1B7SrtQOtiWAIPy7d4mEBYTiwRwKvqPi5gG0I3pDAcvCol10oNY5SdKLTaL4fW
         TTG9dCNn68oGrp5cIz9t11c8BpkP0T5yH1vmJbtW/D7gcU5faqYE/7pfIxx9relzhrOY
         xq9uwSo1qWwMG1hzpM7tgTUSzNZkMOWOzCnvlSEP+o11UBEBk1YzCmMjFgJvjCplzUWq
         F34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=G8WUL44Hfgsl00nNYtCZdJCH/zhsPiD+hbw5EDAG8lI=;
        b=dlR4Bh/QL47VTAoZofeO0rQCGU40d3FdnM26+riBrXf30kcqk1M5nZTbLkgd1X8O+b
         vo8BImEKvfngHX8jdEWxX2RAYaG8DCtob+xB36tvPE39usHRra6Rwx/SD6lhdKaVbGVf
         HUAPLUfzMjJdcFotbRJCfsv428OhB7FZQlN+s5r0+VjCOWVD/os75+LB1nhilb/8HuMm
         9VbSLYXZ2u9v1R50em+u7l0Gi/E0oHll9nki4jMOzaUZqYz51tYr1koCqausjHQCAMIk
         G+UNh1c0VETjWNd/oto9MCAh4xtcv8j8MPLK2+gXMIlQ6dM9vPLwjrHFZD7w+C2+XjU2
         Wieg==
X-Gm-Message-State: AOAM532K0EBHvN4HoQB/Xu+YhQk+CI+MEZiDkx8ZLKdsa0GjxmJ8Bt8N
	axl0hRPLmwCYGnB1qEZj/dE=
X-Google-Smtp-Source: 
 ABdhPJyUl0C2a8BJ4ish9SPP9CsvbEET05PaiePZhAMsbstoWKAJdhVX4K9LpVVO1zCedNzvqkvXLQ==
X-Received: by 2002:a9f:37ea:: with SMTP id q97mr1249248uaq.82.1643995078591;
        Fri, 04 Feb 2022 09:17:58 -0800 (PST)
Received: from gmail.com
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 n77sm739532vkn.29.2022.02.04.09.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 09:17:58 -0800 (PST)
Date: Fri, 4 Feb 2022 12:17:56 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][hardknott][PATCH v2] openvswitch: uprev
 from v2.15.0 to v2.15.3
Message-ID: <20220204171753.GA451@gmail.com>
References: <20220128110927.13468-1-zhe.he@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220128110927.13468-1-zhe.he@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 04 Feb 2022 17:18:00 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7049

merged to hardknott.

Bruce

In message: [meta-virtualization][hardknott][PATCH v2] openvswitch: uprev from v2.15.0 to v2.15.3
on 28/01/2022 He Zhe wrote:

> Drop the following backported patch.
> 0001-ofp-actions-Fix-use-after-free-while-decoding-RAW_EN.patch
> 
> commits short logs:
> e4d2df62e (tag: v2.15.3) Set release date for 2.15.3.
> b8baa1141 python: Add cooperative_yield() API method to Idl.
> 7834abc66 ofproto-dpif-xlate: Snoop ingress packets and update neigh cache if needed.
> 833c02daa tnl-neigh-cache: Do not refresh the entry while revalidating.
> e2182eca8 tnl-neigh-cache: Include expected array sizes in prototypes.
> 566fe4372 tnl-neigh-cache: Read/write expires atomically.
> d477f6000 compat: handle NF_REPEAT error on nf_conntrack_in.
> 0590e8838 flow: Consider dataofs when parsing TCP packets.
> 7266042d8 tests/flowgen: Fix packet data endianness.
> d2e0632db ofproto: Fix resource usage explosion due to removal of large number of flows.
> 0a7e66e37 ofproto: Fix resource usage explosion while processing bundled FLOW_MOD.
> 68466efed tests/flowgen: Fix length field of 802.2 data link header.
> 2a2185f9e ovs-lib: Backup and remove existing DB when joining cluster.
> fcbc29c6f docs/dpdk: Fix install doc.
> a5d97d420 ovs-save: Save igmp flows in ofp_parse syntax.
> 1cbd1f0f5 faq: Update OVS/DPDK version table for OVS 2.13/2.14.
> 01bc910e5 ofproto-dpif-xlate: Fix check_pkt_larger incomplete translation.
> 08a270dda datapath-windows: Reset flow key after Ipv4 fragments are reassembled
> eca2d50d4 datapath-windows:Reset PseudoChecksum value only for TX direction offload case
> 031cf67e0 netdev-offload-tc: Verify the flower rule installed.
> 952e85150 ci: Make linux-prepare trust system installs.
> 2cf63851a Prepare for 2.15.3.
> 63f9a7c5d (tag: v2.15.2) Set release date for 2.15.2.
> b7d9c491e datapath-windows: add layers when adding the deferred actions
> 3f718857e ofproto-dpif-xlate: Fix zone set from non-frozen-metadata fields.
> ea2ca0af1 dpif-netdev: Fix use-after-free on PACKET_OUT of IP fragments.
> 9f964354e tunnel-push-pop.at: Mask source port in tunnel header.
> 58397f222 dpdk-stub: Change the ERR log to DBG.
> 2a963fc31 python: idl: Avoid sending transactions when the DB is not synced up.
> 9efa2ea61 ipf: release unhandled packets from the batch
> f8274b78c datapath-windows:adjust Offset when processing packet in POP_VLAN action
> a2f860aa2 cirrus: Reduce memory requirements for FreeBSD VMs.
> 7788f1579 netdev-linux: Fix a null pointer dereference in netdev_linux_notify_sock().
> dd32deba6 pcap-file: Fix memory leak in ovs_pcap_open().
> 9f2f66c8e odp-util: Fix a null pointer dereference in odp_flow_format().
> 02b0c265c odp-util: Fix a null pointer dereference in odp_nsh_key_from_attr__().
> 031eff456 netdev-dpdk: Fix RSS configuration for virtio.
> 09cd9570d ipf: Fix only nat the first fragment in the reass process.
> ef8ca3e19 dpif-netdev: Fix crash when PACKET_OUT is metered.
> d3ff41d60 tc: Set action flags for tunnel_key release.
> 079a4de72 netlink-socket: Replace error with txn->error when logging nacked transactions.
> f8cc5aa35 dynamic-string: Fix a crash in ds_clone().
> 64d1bba91 dpif-netdev: fix memory leak in dpcls subtable set command
> 90b219275 dpif-netdev: Do not flush PMD offloads on reload.
> b29b04f85 dpif-netdev: Fix offloads of modified flows.
> 1d0b89ea7 dpif-netdev: Fix flow modification after failure.
> 8d84a4b16 netdev-offload-dpdk: Fix IPv6 rewrite cast-align warning.
> f3f7849cb daemon-unix: Fix leak of a fork error message.
> 8aa0f0374 ovsdb-cs: Perform forced reconnects without a backoff.
> ee4e034dc datapath-windows:Correct checksum for DNAT action
> 72132a940 bond: Fix broken rebalancing after link state changes.
> aa84cfe25 dpif-netlink: Fix report_loss() message.
> aec05f7cd ovsdb-server: Fix memleak when failing to read storage.
> 05bdf11fc conntrack: Init hash basis first at creation.
> 94e3b9d9c netdev-linux: Ignore TSO packets when TSO is not enabled for userspace.
> 842bfb899 conntrack: Handle already natted packets.
> ab873c1af conntrack: Document all-zero IP SNAT behavior and add a test case.
> 86d6a9ee1 python: Fix Idl.run change_seqno update.
> 1ba0c8365 bridge: Use correct (legacy) role names in database.
> 7e5293ea5 Prepare for 2.15.2.
> b855bbc32 (tag: v2.15.1) Set release date for 2.15.1.
> 007a4f48f dpif-netdev: Apply subtable-lookup-prio-set on any datapath.
> c93358a56 netlink: removed incorrect optimization
> 31626579f ovs-actions.xml: Add missing bracket.
> 30596ec27 netdev-offload-tc: Use nl_msg_put_flag for OVS_TUNNEL_KEY_ATTR_CSUM.
> 728980291 conntrack: Increment coverage counter for all bad checksum cases.
> 881d71ea2 datapath-windows: Specify external include paths
> 934668c29 Remove Python 2 leftovers.
> aaa596705 ipf: Fix a use-after-free error, and remove the 'do_not_steal' flag.
> bc0aa785a ovsdb-idl: Fix the database update signaling if it has never been connected.
> 559426d2b ofproto: Fix potential NULL dereference in ofproto_ct_*_zone_timeout_policy().
> f31070e27 ofproto: Fix potential NULL dereference in ofproto_get_datapath_cap().
> 8995d5311 dpif-netlink: Fix send of uninitialized memory in ct limit requests.
> 0c056891c ofproto-dpif: Fix use of uninitialized attributes of timeout policy.
> 121a67cad netdev-linux: Fix use of uninitialized LAG master name.
> 5f27ff1cf ofp_actions: Fix set_mpls_tc formatting.
> e87adce83 dpif-netdev: Remove meter rate from the bucket size calculation.
> a3ee3258e ovs-ofctl: Fix coredump when using "add-groups" command.
> c5d2a6275 raft: Transfer leadership before creating snapshots.
> 553d52392 ovsdb-cs: Consider all tables when computing expected cond seqno.
> 8d0aebcc4 dpdk: Use DPDK 20.11.1 release.
> 21452722b github: Fix up malformed /etc/hosts.
> 90d1984b9 doc: automake: Add support for sphinx 4.0.
> 38a8bed70 cirrus: Look up existing versions of python dependencies.
> 255c38c74 ofp-group: Use big-enough buffer in ofputil_format_group().
> f2c0744d2 ofproto/ofproto-dpif-sflow: Check sflow agent in case of race
> ab157ef34 dpif: Fix use of uninitialized execute hash.
> b1fded020 odp-util: Fix use of uninitialized erspan metadata.
> f473ee568 dpif-netlink: Fix using uninitialized info.tc_modify_flow_deleted in out label.
> 2721606bd netdev-offload-tc: Probe for support for any of the ct_state flags.
> 091bc48d9 compat: Add ct_state flags definitions.
> 1307e90e3 Add test cases for ingress_policing parameters
> d184c6ce6 netdev-linux: correct unit of burst parameter
> cab998e50 ipsec: Fix IPv6 default route support for Libreswan.
> b9ab7827e ovsdb-idl: Mark arc sources as updated when destination is deleted.
> c82d2e3fb ovsdb-idl: Preserve references for deleted rows.
> 9a24ecbc2 ovsdb-idl.at: Make test outputs more predictable.
> 8d71feb1b ovs-ofctl: Fix segfault due to bad meter n_bands.
> 3a716b1d9 dpif-netdev: Refactor and fix the buckets calculation.
> 73ece9c87 dpif-netdev: Fix the meter buckets overflow.
> d5dc16670 python: Send notifications after the transaction ends.
> 556e65e17 ovs-ctl: Allow recording hostname separately.
> 3982aee45 dpif-netdev: Fix crash when add dp flow without in_port field.
> 02096f1b3 Documentation: Fix DPDK qos example.
> 8f1dda316 raft: Report disconnected in cluster/status if candidate retries election.
> 79e9749da raft: Reintroduce jsonrpc inactivity probes.
> 2e84a4adb ovsdb-cs: Fix use-after-free for the request id.
> d2c311dce connmgr: Check nullptr inside ofmonitor_report().
> 7307af690 ovsdb-client: Fix needs-conversion when SERVER is explicitly specified.
> 2a7a63571 windows, tests: Modify service test.
> 9b48549c6 netdev-linux: Fix indentation.
> 861a9f3b4 ofproto-dpif-upcall: Fix ukey leak on udpif destroy.
> 339044c3c ci: Use parallel build for distcheck.
> 38744b1bc ofp-actions: Fix use-after-free while decoding RAW_ENCAP.
> 33abe6c05 Prepare for 2.15.1.
> 
> The ptest results BEFORE uprev:
> ERROR: 2231 tests were run,
> 27 failed unexpectedly.
> 62 tests were skipped.
> 
> Failed tests:
> checkpatch - sign-offs
> checkpatch - parenthesized constructs
> checkpatch - parenthesized constructs - for
> checkpatch - comments
> checkpatch - whitespace around operator
> checkpatch - whitespace around cast
> ovs-ofctl snoop
> tunnel - table version
> tunnel_push_pop - erspan
> tunnel_push_pop - action
> tunnel_push_pop - packet_out
> tunnel_push_pop_ipv6 - ip6gre
> tunnel_push_pop_ipv6 - ip6erspan
> tunnel_push_pop_ipv6 - action
> PMD - non pmd device
> ofproto-dpif - recirculation after resubmit
> ofproto-dpif - sFlow packet sampling - IPv4 collector
> ofproto-dpif - sFlow packet sampling - IPv6 collector
> ofproto-dpif - sFlow packet sampling - LACP structures
> ofproto-dpif - sFlow packet sampling - tunnel set
> ofproto-dpif - sFlow packet sampling - tunnel push
> ofproto-dpif - sFlow packet sampling - MPLS
> bridge - multiple bridges share a controller
> bridge - add port after stopping controller
> mcast - check multicasts to trunk ports are not duplicated
> ptap - triangle bridge setup with L2 and L3 GRE tunnels
> ptap - L3 over patch port
> 
> The ptest results AFTER uprev:
> ERROR: 2266 tests were run,
> 27 failed unexpectedly.
> 65 tests were skipped.
> 
> Failed tests:
> checkpatch - sign-offs
> checkpatch - parenthesized constructs
> checkpatch - parenthesized constructs - for
> checkpatch - comments
> checkpatch - whitespace around operator
> checkpatch - whitespace around cast
> ovs-ofctl snoop
> tunnel - table version
> tunnel_push_pop - erspan
> tunnel_push_pop - action
> tunnel_push_pop - packet_out
> tunnel_push_pop - packet_out debug_slow
> tunnel_push_pop_ipv6 - ip6gre
> tunnel_push_pop_ipv6 - ip6erspan
> tunnel_push_pop_ipv6 - action
> PMD - non pmd device
> ofproto-dpif - sFlow packet sampling - IPv4 collector
> ofproto-dpif - sFlow packet sampling - IPv6 collector
> ofproto-dpif - sFlow packet sampling - LACP structures
> ofproto-dpif - sFlow packet sampling - tunnel set
> ofproto-dpif - sFlow packet sampling - tunnel push
> ofproto-dpif - sFlow packet sampling - MPLS
> bridge - multiple bridges share a controller
> bridge - add port after stopping controller
> mcast - check multicasts to trunk ports are not duplicated
> ptap - triangle bridge setup with L2 and L3 GRE tunnels
> ptap - L3 over patch port
> 
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  recipes-networking/openvswitch/openvswitch_git.bb | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> index d7f8e4b0..a66c9677 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -14,12 +14,12 @@ RDEPENDS_${PN}-ptest += "\
>  	"
>  
>  S = "${WORKDIR}/git"
> -PV = "2.15+${SRCPV}"
> -CVE_VERSION = "2.13.0"
> +PV = "2.15.3+${SRCPV}"
> +CVE_VERSION = "2.15.3"
>  
>  FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
>  
> -SRCREV = "8dc1733eaea866dce033b3c44853e1b09bf59fc7"
> +SRCREV = "e4d2df62e65a615e19f62e2fd294709be8d75cdc"
>  SRC_URI += "git://github.com/openvswitch/ovs.git;protocol=git;branch=branch-2.15 \
>              file://openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch \
>              file://run-ptest \
> @@ -28,7 +28,6 @@ SRC_URI += "git://github.com/openvswitch/ovs.git;protocol=git;branch=branch-2.15
>              file://systemd-update-tool-paths.patch \
>              file://systemd-create-runtime-dirs.patch \
>              file://0001-ovs-use-run-instead-of-var-run-for-in-systemd-units.patch \
> -            file://0001-ofp-actions-Fix-use-after-free-while-decoding-RAW_EN.patch \
>             "
>  
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=1ce5d23a6429dff345518758f13aaeab"
> -- 
> 2.17.1
> 

