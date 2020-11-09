Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.8420.1604908134470962185
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 08 Nov 2020 23:48:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=bLszxW0v;
 spf=fail (domain: axis.com, ip: 198.145.29.25, mailfrom: joakim.roubert@axis.com)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.yoctoproject.org (Postfix) with ESMTPS id E342F38C02B9
	for <meta-virtualization@yoctoproject.org>; Sun,  8 Nov 2020 23:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=5349; q=dns/txt; s=axis-central1;
  t=1604908133; x=1636444133;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Uel3xXI5sJZ9iDAZq6D2RRhtKevkbfSMxJq3U/k5BQ4=;
  b=bLszxW0vWSqkqMnnb1IjqgRdYYz02KzbN0Y4hJGS3n9Hvj7nkJTCyyju
   UpZkjKEy95snJoqK8HQJPE8ZMDfChACc0UB8bIC3DctOzEPiyiBYUuQil
   4Zffcn9HbQcod/Td45YQLf9e7VfxF2FvKKw94b0gWfi5ht9//F/mhEY4y
   /AMGBQleIqrqBZsMh0NsN4+Sg7+GI6+3Km62KEmekP1WVrHoKDPZnmPtm
   7uniMheEhBmwFFUl3tzFfUqyzy0FTHKImSVeX2miwimaeo8lHEpGKV3GT
   ygUiGG+pBqLEplWC8S/9lJVs5F1fVv5rrnbMGVgKqxiny1n8tE1B4JaUl
   w==;
IronPort-SDR: x72Zddt3Dlg954smp0BikVyZ0rAVmOn9heziTxgiPuPG4i8uGmdljJhCNWPMckknGIebudVdHL
 WsKqrPlJ5BDYr2E+kjkLGNpkJqia/zcr56UBtdt/3Z0SpSsCtHqrS2oRir/APxmrGAbnoy1jhb
 Zm26JuNSA+6KUHSldnxl2DYN8EDwTb2ocYkBCGqWYxm5CF2zuLRJ7SjvxUxkpwUSmTYNHUJjhp
 9N62WJDC6ZIN9hKUSIlSvv+Nz0kVBREkpkZh/9JxZR6cHThzLI1xkglXa3PyLgBnbdhJ/nzjZS
 eEU=
X-IronPort-AV: E=Sophos;i="5.77,463,1596492000"; 
   d="scan'208";a="14853057"
Subject: Re: [meta-virtualization][PATCH v5] Adding k3s recipe
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
References: <CADkTA4NUDHVRiSRHoUU=Ci8of0_J5C+pM7MVwOSopQ9F_yBTBw@mail.gmail.com>
 <20201020111434.17993-1-joakimr@axis.com> <20201021031033.GA20764@gmail.com>
 <e18fb481-4206-2b32-3f31-1e0aace470dc@axis.com>
 <CADkTA4M3HT9HuENi9m2x4v9SXa=28a75BYqhbRhFGDoPSeoTVg@mail.gmail.com>
 <af00b32f-7619-a755-13b1-714675419946@axis.com>
 <CADkTA4P6UmsrfZ_Lz=8=0hiNKD9ji1o5nHNy6ouJMK3spAP1NA@mail.gmail.com>
From: "Joakim Roubert" <joakim.roubert@axis.com>
Message-ID: <46f448dd-5f62-0058-dd34-c826df195c54@axis.com>
Date: Mon, 9 Nov 2020 08:48:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4P6UmsrfZ_Lz=8=0hiNKD9ji1o5nHNy6ouJMK3spAP1NA@mail.gmail.com>
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX02.axis.com (10.0.5.16) To XBOX03.axis.com (10.0.5.17)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 2020-11-06 22:20, Bruce Ashfield wrote:
>=20
> I now have another 6 or 7 WIP patches on top of this to try and get a
> single node "cluster" working with k3s. I'll clean them up and get
> them into the k3s WIP branch shortly.

Awesome!

> In your working references, which iptables do you have installed ?
> (legacy ? nftables?)

# iptables --version
iptables v1.8.4 (legacy)

> I'm failing to get flannel to start, with a series of errors like this:
>=20
> -----------
> I1106 21:19:00.985656=C2=A0=C2=A0 10641 eviction_manager.go:351] evicti=
on
> manager: able to reduce ephemeral-storage pressure without evicting
> pods.
> E1106 21:19:10.636899=C2=A0=C2=A0 10641 proxier.go:841] Failed to ensur=
e that
> filter chain INPUT jumps to KUBE-EXTERNAL-SERVICES: error checking
> rule: exit status 2: iptables v1.8.6 (legacy): Couldn't load match
> `comment':No such y
> Try `iptables -h' or 'iptables --help' for more information.
> I1106 21:19:10.641647=C2=A0=C2=A0 10641 proxier.go:825] Sync failed; re=
trying in 30s
> ------------

This is a bit strange, as it seems you are running in legacy mode too,=20
although a somewhat newer version than I have, and the only thing I know=20
is that Rancher recommends 1.6.1 or newer (which it is).

https://rancher.com/docs/k3s/latest/en/known-issues/

Might there be something missing in the kernel?

I have these RPMs installed in my image:

iptables
iptables-module-ip6t-ah
iptables-module-ip6t-dnat
iptables-module-ip6t-dnpt
iptables-module-ip6t-dst
iptables-module-ip6t-eui64
iptables-module-ip6t-frag
iptables-module-ip6t-hbh
iptables-module-ip6t-hl
iptables-module-ip6t-icmp6
iptables-module-ip6t-ipv6header
iptables-module-ip6t-log
iptables-module-ip6t-masquerade
iptables-module-ip6t-mh
iptables-module-ip6t-netmap
iptables-module-ip6t-redirect
iptables-module-ip6t-reject
iptables-module-ip6t-rt
iptables-module-ip6t-snat
iptables-module-ip6t-snpt
iptables-module-ip6t-srh
iptables-module-ipt-ah
iptables-module-ipt-clusterip
iptables-module-ipt-dnat
iptables-module-ipt-ecn
iptables-module-ipt-icmp
iptables-module-ipt-log
iptables-module-ipt-masquerade
iptables-module-ipt-netmap
iptables-module-ipt-realm
iptables-module-ipt-redirect
iptables-module-ipt-reject
iptables-module-ipt-snat
iptables-module-ipt-ttl
iptables-module-ipt-ulog
iptables-modules
iptables-module-xt-addrtype
iptables-module-xt-audit
iptables-module-xt-bpf
iptables-module-xt-cgroup
iptables-module-xt-checksum
iptables-module-xt-classify
iptables-module-xt-cluster
iptables-module-xt-comment
iptables-module-xt-connbytes
iptables-module-xt-connlimit
iptables-module-xt-connmark
iptables-module-xt-connsecmark
iptables-module-xt-conntrack
iptables-module-xt-cpu
iptables-module-xt-ct
iptables-module-xt-dccp
iptables-module-xt-devgroup
iptables-module-xt-dscp
iptables-module-xt-ecn
iptables-module-xt-esp
iptables-module-xt-hashlimit
iptables-module-xt-helper
iptables-module-xt-hmark
iptables-module-xt-idletimer
iptables-module-xt-ipcomp
iptables-module-xt-iprange
iptables-module-xt-ipvs
iptables-module-xt-led
iptables-module-xt-length
iptables-module-xt-limit
iptables-module-xt-mac
iptables-module-xt-mark
iptables-module-xt-multiport
iptables-module-xt-nfacct
iptables-module-xt-nflog
iptables-module-xt-nfqueue
iptables-module-xt-osf
iptables-module-xt-owner
iptables-module-xt-physdev
iptables-module-xt-pkttype
iptables-module-xt-policy
iptables-module-xt-quota
iptables-module-xt-rateest
iptables-module-xt-recent
iptables-module-xt-rpfilter
iptables-module-xt-sctp
iptables-module-xt-secmark
iptables-module-xt-set
iptables-module-xt-socket
iptables-module-xt-standard
iptables-module-xt-statistic
iptables-module-xt-string
iptables-module-xt-synproxy
iptables-module-xt-tcp
iptables-module-xt-tcpmss
iptables-module-xt-tcpoptstrip
iptables-module-xt-tee
iptables-module-xt-time
iptables-module-xt-tos
iptables-module-xt-tproxy
iptables-module-xt-trace
iptables-module-xt-u32
iptables-module-xt-udp

and in my kernel config, I have (apart from what is needed for running=20
containers with containerd):

CONFIG_NETFILTER_NETLINK=3Dm
CONFIG_NETFILTER_XT_MATCH_OWNER=3Dm
CONFIG_NET_UDP_TUNNEL=3Dm
CONFIG_NF_DUP_NETDEV=3Dm
CONFIG_NF_LOG_BRIDGE=3Dm
CONFIG_NF_TABLES_ARP=3Dy
CONFIG_NF_TABLES_BRIDGE=3Dy
CONFIG_NF_TABLES_INET=3Dy
CONFIG_NF_TABLES_IPV4=3Dy
CONFIG_NF_TABLES_IPV6=3Dy
CONFIG_NF_TABLES=3Dm
CONFIG_NF_TABLES_NETDEV=3Dy
CONFIG_NFT_BRIDGE_REJECT=3Dm
CONFIG_NFT_CHAIN_NAT_IPV4=3Dm
CONFIG_NFT_CHAIN_ROUTE_IPV4=3Dm
CONFIG_NFT_CHAIN_ROUTE_IPV6=3Dm
CONFIG_NFT_COMPAT=3Dm
CONFIG_NFT_COUNTER=3Dm
CONFIG_NFT_CT=3Dm
CONFIG_NFT_DUP_IPV4=3Dm
CONFIG_NFT_DUP_IPV6=3Dm
CONFIG_NFT_DUP_NETDEV=3Dm
# CONFIG_NFT_EXTHDR is not set
CONFIG_NFT_FIB_INET=3Dm
CONFIG_NFT_FIB_IPV4=3Dm
CONFIG_NFT_FIB_IPV6=3Dm
CONFIG_NFT_FIB_NETDEV=3Dm
CONFIG_NFT_FWD_NETDEV=3Dm
CONFIG_NFT_HASH=3Dm
CONFIG_NFT_LIMIT=3Dm
CONFIG_NFT_LOG=3Dm
CONFIG_NFT_MASQ_IPV4=3Dm
CONFIG_NFT_MASQ=3Dm
# CONFIG_NFT_META is not set
CONFIG_NFT_NAT=3Dm
CONFIG_NFT_NUMGEN=3Dm
# CONFIG_NFT_OBJREF is not set
CONFIG_NFT_QUEUE=3Dm
CONFIG_NFT_QUOTA=3Dm
CONFIG_NFT_REDIR_IPV4=3Dm
CONFIG_NFT_REDIR=3Dm
CONFIG_NFT_REJECT=3Dm
# CONFIG_NFT_RT is not set
# CONFIG_NFT_SET_BITMAP is not set
# CONFIG_NFT_SET_HASH is not set
# CONFIG_NFT_SET_RBTREE is not set
CONFIG_OVERLAY_FS=3Dm
CONFIG_STP=3Dm

BR,

/Joakim
