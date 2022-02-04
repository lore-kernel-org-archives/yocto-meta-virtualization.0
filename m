Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D122C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 17:22:10 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.12066.1643995329338487366
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 04 Feb 2022 09:22:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ax0FjwIK;
 spf=pass (domain: gmail.com, ip: 209.85.222.172,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id 71so5288807qkf.4
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 04 Feb 2022 09:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iI97xg3U9PoWVRkF+Dc2tXEVuL1HjzDxnClDGc3Cte4=;
        b=ax0FjwIKc9Y2kNcYVR/OFF1spp7JSLzxha6eMkQ59UzqiSJIArzYrOPsdkHY1+xlC1
         aG45z+Bp+n10Dh7GnyWkvSxLiYOZMj8tPyeKwUlXVYgLchNmxJK8br8xjpf0we6wSeRL
         wIBwSQPutgDqGPIweMjbQF8HiCYod4Q8FSKyGPgNjrsUJyyo40foiHQDQTuX4dIQGV3F
         numN61rpRKEoT6lIVpD3FbVzGOXbR9M8QIpF2unj4RSsgqTzuJLbqwJlTicqnfsaBxe8
         IQ2rC6RjqRz1pJ8ZltyfqmiStMIrN9XIvYjTrbG1+1GdPXDPwjDcXULHXqNP+IygT6fp
         VGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iI97xg3U9PoWVRkF+Dc2tXEVuL1HjzDxnClDGc3Cte4=;
        b=jzgUAUAOd6o7irxXAFXYruBkhRk9eDs/0rdNFC2bFwPJaPDBLum7S8gvtbgGgJ0w3h
         NMMDUMpMY7sT89HgZND8dt3j1n2soal8BraamLlB4h9capXfOfH7utevhPWY1zZPGwNV
         UfkhzIiENgBp5oxNQ/XpneJb6TyUzI+2ymy6nZLattVdZ1WjxrANfzOIB/BXFL88U2m1
         COe987ALcA5xtEgGQk8W5m7sm2EcW1KcICoH4mCOCaow3wtNW/hzFQSk9skVpE64TekJ
         vX9c6FyU2Rc+Aeh0Z5/yT3G14x3bnEtnwmcuq9h4QyKExYqG0VcANDqpD6v7j6cocS0/
         8sPQ==
X-Gm-Message-State: AOAM532X7n7LnkIztUJdx3xaMdH3mDTiv9pQdbxGj0D2H2w8KGknWYlM
	2HcwHeBAE50k852lIpqiOYU=
X-Google-Smtp-Source: 
 ABdhPJztmG26g9lSC4KiD2qzIK8abaTZkPWRn/vaDDTOZuDxoPbkjXFu7ISKgnBu9O4nr6h6Iuahlg==
X-Received: by 2002:a05:620a:2413:: with SMTP id
 d19mr84683qkn.320.1643995328260;
        Fri, 04 Feb 2022 09:22:08 -0800 (PST)
Received: from gmail.com
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 a14sm1437575qtb.92.2022.02.04.09.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 09:22:07 -0800 (PST)
Date: Fri, 4 Feb 2022 12:22:06 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH v2] openvswitch: uprev from v2.15.1
 to v2.15.3
Message-ID: <20220204172205.GC451@gmail.com>
References: <20220128111957.17731-1-zhe.he@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220128111957.17731-1-zhe.he@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 04 Feb 2022 17:22:10 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7051

merged to master.

Bruce

In message: [meta-virtualization][PATCH v2] openvswitch: uprev from v2.15.1 to v2.15.3
on 28/01/2022 He Zhe wrote:

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
>  recipes-networking/openvswitch/openvswitch_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> index 0fb7c132..4d413170 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -14,12 +14,12 @@ RDEPENDS:${PN}-ptest += "\
>  	"
>  
>  S = "${WORKDIR}/git"
> -PV = "2.15.1+${SRCPV}"
> -CVE_VERSION = "2.13.0"
> +PV = "2.15.3+${SRCPV}"
> +CVE_VERSION = "2.15.3"
>  
>  FILESEXTRAPATHS:append := "${THISDIR}/${PN}-git:"
>  
> -SRCREV = "f8274b78c3403591e84f3c2bbacf8c86920d68ba"
> +SRCREV = "e4d2df62e65a615e19f62e2fd294709be8d75cdc"
>  SRC_URI += "git://github.com/openvswitch/ovs.git;protocol=https;branch=branch-2.15 \
>              file://openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch \
>              file://run-ptest \
> -- 
> 2.17.1
> 

