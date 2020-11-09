Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.11465.1604929475798222468
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 05:44:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aaJHOB0Y;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	by mail.yoctoproject.org (Postfix) with ESMTPS id A77C038C08BD
	for <meta-virtualization@yoctoproject.org>; Mon,  9 Nov 2020 05:44:35 -0800 (PST)
Received: by mail-ej1-f65.google.com with SMTP id o23so12307945ejn.11
        for <meta-virtualization@yoctoproject.org>; Mon, 09 Nov 2020 05:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pN34G63dtoklc2BYurvP6Udvk75HZY/W4wpTv2ccoiU=;
        b=aaJHOB0Yjc9CYZjHYfeT8uO8LiNkRTTU0E5RELTZqSKfum17Ef0qQIpybis5wd0IDk
         DdDw3DCbUAZSibtPwKNIXKb1e9yCv272Oq7QoKtiTixcdjCym3uT1ppIISnphF36tA0c
         QKJZ3fnlz73V2U42tLpNoCvBrj1YQ58uuLleXmIXmt/AjMd0jIbIFwr9uVSXW1SgDKWD
         COLaXnocNoe+QPAzw8GFAYuLOzpMmL+RilHUIFWM33GdkbA5WXMmqZoTbaIL7AgGAow2
         um1eAvkT3juURXFJp0flRpW1keugK5fUZG+XYkd86JqklOiqXM5u79gW4duDKhDYOMCn
         j/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pN34G63dtoklc2BYurvP6Udvk75HZY/W4wpTv2ccoiU=;
        b=Wbc5rOY5L8NALqxb9UX4LAngSG9U/PSk2zsrJzUney3vsLdRgXtZYnn5LmiM6MsESR
         RWydd2c0HkcBkqbMvYmu2MAljIq2jVbWnMHwlgZvpQMyS8cW7CdhGxtc+10o8Ivpypfe
         Gb0wdGVJcApTuaUYRoQ8xnpWZyA5ULrZxeFAt/6WvCtP+uoA90RbiIUXU1Nwwlledr3/
         tEHmn3+FgP1TdE8HUlKU1iHwyLEPlGvC273Iu809Ct0vdVl8+niFxRS1FSn8YpUAOFsi
         Szb1JKon6bVmhRkyodsxSMfshW4pxsgRsjCOeKd8mrgeuHbQyJAuLRre15fbFGOAyVSN
         DzSQ==
X-Gm-Message-State: AOAM5306mDBOt4Ugvu53LBa1e+EzOWCidnLjdKA8klhpHHSEpypl63+X
	7KP0NCxW0YVJwy+CQIjAepB76BmvBrH4dn839nQ=
X-Google-Smtp-Source: ABdhPJw3VnqCztQ5U+BGEzVANESFU0LXyzW+AQXbsRvOmRwESy1yRINqT5+f8z1tiJtYlCHs2vut2/ZfvWeahmDR/Dc=
X-Received: by 2002:a17:906:4742:: with SMTP id j2mr14704886ejs.247.1604929474096;
 Mon, 09 Nov 2020 05:44:34 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4NUDHVRiSRHoUU=Ci8of0_J5C+pM7MVwOSopQ9F_yBTBw@mail.gmail.com>
 <20201020111434.17993-1-joakimr@axis.com> <20201021031033.GA20764@gmail.com>
 <e18fb481-4206-2b32-3f31-1e0aace470dc@axis.com> <CADkTA4M3HT9HuENi9m2x4v9SXa=28a75BYqhbRhFGDoPSeoTVg@mail.gmail.com>
 <af00b32f-7619-a755-13b1-714675419946@axis.com> <CADkTA4P6UmsrfZ_Lz=8=0hiNKD9ji1o5nHNy6ouJMK3spAP1NA@mail.gmail.com>
 <46f448dd-5f62-0058-dd34-c826df195c54@axis.com>
In-Reply-To: <46f448dd-5f62-0058-dd34-c826df195c54@axis.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 9 Nov 2020 08:44:22 -0500
Message-ID: <CADkTA4M2XhwwrjSE4mRZWRgya=xY44Y=+1MoZdLYYzWMi0R=wQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v5] Adding k3s recipe
To: Joakim Roubert <joakim.roubert@axis.com>
Cc: "meta-virtualization@yoctoproject.org" <meta-virtualization@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 9, 2020 at 2:48 AM Joakim Roubert <joakim.roubert@axis.com> wrote:
>
> On 2020-11-06 22:20, Bruce Ashfield wrote:
> >
> > I now have another 6 or 7 WIP patches on top of this to try and get a
> > single node "cluster" working with k3s. I'll clean them up and get
> > them into the k3s WIP branch shortly.
>
> Awesome!
>
> > In your working references, which iptables do you have installed ?
> > (legacy ? nftables?)
>
> # iptables --version
> iptables v1.8.4 (legacy)
>
> > I'm failing to get flannel to start, with a series of errors like this:
> >
> > -----------
> > I1106 21:19:00.985656   10641 eviction_manager.go:351] eviction
> > manager: able to reduce ephemeral-storage pressure without evicting
> > pods.
> > E1106 21:19:10.636899   10641 proxier.go:841] Failed to ensure that
> > filter chain INPUT jumps to KUBE-EXTERNAL-SERVICES: error checking
> > rule: exit status 2: iptables v1.8.6 (legacy): Couldn't load match
> > `comment':No such y
> > Try `iptables -h' or 'iptables --help' for more information.
> > I1106 21:19:10.641647   10641 proxier.go:825] Sync failed; retrying in 30s
> > ------------
>
> This is a bit strange, as it seems you are running in legacy mode too,
> although a somewhat newer version than I have, and the only thing I know
> is that Rancher recommends 1.6.1 or newer (which it is).
>
> https://rancher.com/docs/k3s/latest/en/known-issues/
>
> Might there be something missing in the kernel?
>
> I have these RPMs installed in my image:
>
> iptables
> iptables-module-ip6t-ah
> iptables-module-ip6t-dnat
> iptables-module-ip6t-dnpt
> iptables-module-ip6t-dst
> iptables-module-ip6t-eui64
> iptables-module-ip6t-frag
> iptables-module-ip6t-hbh
> iptables-module-ip6t-hl
> iptables-module-ip6t-icmp6
> iptables-module-ip6t-ipv6header
> iptables-module-ip6t-log
> iptables-module-ip6t-masquerade
> iptables-module-ip6t-mh
> iptables-module-ip6t-netmap
> iptables-module-ip6t-redirect
> iptables-module-ip6t-reject
> iptables-module-ip6t-rt
> iptables-module-ip6t-snat
> iptables-module-ip6t-snpt
> iptables-module-ip6t-srh
> iptables-module-ipt-ah
> iptables-module-ipt-clusterip
> iptables-module-ipt-dnat
> iptables-module-ipt-ecn
> iptables-module-ipt-icmp
> iptables-module-ipt-log
> iptables-module-ipt-masquerade
> iptables-module-ipt-netmap
> iptables-module-ipt-realm
> iptables-module-ipt-redirect
> iptables-module-ipt-reject
> iptables-module-ipt-snat
> iptables-module-ipt-ttl
> iptables-module-ipt-ulog
> iptables-modules
> iptables-module-xt-addrtype
> iptables-module-xt-audit
> iptables-module-xt-bpf
> iptables-module-xt-cgroup
> iptables-module-xt-checksum
> iptables-module-xt-classify
> iptables-module-xt-cluster
> iptables-module-xt-comment
> iptables-module-xt-connbytes
> iptables-module-xt-connlimit
> iptables-module-xt-connmark
> iptables-module-xt-connsecmark
> iptables-module-xt-conntrack
> iptables-module-xt-cpu
> iptables-module-xt-ct
> iptables-module-xt-dccp
> iptables-module-xt-devgroup
> iptables-module-xt-dscp
> iptables-module-xt-ecn
> iptables-module-xt-esp
> iptables-module-xt-hashlimit
> iptables-module-xt-helper
> iptables-module-xt-hmark
> iptables-module-xt-idletimer
> iptables-module-xt-ipcomp
> iptables-module-xt-iprange
> iptables-module-xt-ipvs
> iptables-module-xt-led
> iptables-module-xt-length
> iptables-module-xt-limit
> iptables-module-xt-mac
> iptables-module-xt-mark
> iptables-module-xt-multiport
> iptables-module-xt-nfacct
> iptables-module-xt-nflog
> iptables-module-xt-nfqueue
> iptables-module-xt-osf
> iptables-module-xt-owner
> iptables-module-xt-physdev
> iptables-module-xt-pkttype
> iptables-module-xt-policy
> iptables-module-xt-quota
> iptables-module-xt-rateest
> iptables-module-xt-recent
> iptables-module-xt-rpfilter
> iptables-module-xt-sctp
> iptables-module-xt-secmark
> iptables-module-xt-set
> iptables-module-xt-socket
> iptables-module-xt-standard
> iptables-module-xt-statistic
> iptables-module-xt-string
> iptables-module-xt-synproxy
> iptables-module-xt-tcp
> iptables-module-xt-tcpmss
> iptables-module-xt-tcpoptstrip
> iptables-module-xt-tee
> iptables-module-xt-time
> iptables-module-xt-tos
> iptables-module-xt-tproxy
> iptables-module-xt-trace
> iptables-module-xt-u32
> iptables-module-xt-udp
>
> and in my kernel config, I have (apart from what is needed for running
> containers with containerd):
>
> CONFIG_NETFILTER_NETLINK=m
> CONFIG_NETFILTER_XT_MATCH_OWNER=m
> CONFIG_NET_UDP_TUNNEL=m
> CONFIG_NF_DUP_NETDEV=m
> CONFIG_NF_LOG_BRIDGE=m
> CONFIG_NF_TABLES_ARP=y
> CONFIG_NF_TABLES_BRIDGE=y
> CONFIG_NF_TABLES_INET=y
> CONFIG_NF_TABLES_IPV4=y
> CONFIG_NF_TABLES_IPV6=y
> CONFIG_NF_TABLES=m
> CONFIG_NF_TABLES_NETDEV=y
> CONFIG_NFT_BRIDGE_REJECT=m
> CONFIG_NFT_CHAIN_NAT_IPV4=m
> CONFIG_NFT_CHAIN_ROUTE_IPV4=m
> CONFIG_NFT_CHAIN_ROUTE_IPV6=m
> CONFIG_NFT_COMPAT=m
> CONFIG_NFT_COUNTER=m
> CONFIG_NFT_CT=m
> CONFIG_NFT_DUP_IPV4=m
> CONFIG_NFT_DUP_IPV6=m
> CONFIG_NFT_DUP_NETDEV=m
> # CONFIG_NFT_EXTHDR is not set
> CONFIG_NFT_FIB_INET=m
> CONFIG_NFT_FIB_IPV4=m
> CONFIG_NFT_FIB_IPV6=m
> CONFIG_NFT_FIB_NETDEV=m
> CONFIG_NFT_FWD_NETDEV=m
> CONFIG_NFT_HASH=m
> CONFIG_NFT_LIMIT=m
> CONFIG_NFT_LOG=m
> CONFIG_NFT_MASQ_IPV4=m
> CONFIG_NFT_MASQ=m
> # CONFIG_NFT_META is not set
> CONFIG_NFT_NAT=m
> CONFIG_NFT_NUMGEN=m
> # CONFIG_NFT_OBJREF is not set
> CONFIG_NFT_QUEUE=m
> CONFIG_NFT_QUOTA=m
> CONFIG_NFT_REDIR_IPV4=m
> CONFIG_NFT_REDIR=m
> CONFIG_NFT_REJECT=m
> # CONFIG_NFT_RT is not set
> # CONFIG_NFT_SET_BITMAP is not set
> # CONFIG_NFT_SET_HASH is not set
> # CONFIG_NFT_SET_RBTREE is not set
> CONFIG_OVERLAY_FS=m
> CONFIG_STP=m

Cool, the above helps.

I have some new fragments, etc, developed for both k8s and k3s, so
I'll double check that I didn't fat finger something.

Bruce

>
> BR,
>
> /Joakim



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
