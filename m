Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.11574.1604929559400656779
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 09 Nov 2020 05:45:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D2Mqj6zi;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	by mail.yoctoproject.org (Postfix) with ESMTPS id CBA7D38C08BD
	for <meta-virtualization@yoctoproject.org>; Mon,  9 Nov 2020 05:45:58 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id o9so12344851ejg.1
        for <meta-virtualization@yoctoproject.org>; Mon, 09 Nov 2020 05:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PosHuDVuE6SblGMIaV3BZtPEVf++I6aTVx+dsHzPm88=;
        b=D2Mqj6zi9JhInQ6eK7V80Dhdyx6wNOIPVZqoYU9x/Sr1K1VTIvuOfW0FxOGu3favph
         5EwNBNF9qfCsetAjN+LHmNn/sDSoe849/vHEUqtDKof7Ex9H8aORCfxwlFIRKMtLzRah
         mHFtvIw50xhq7Qv6FZgImMFWR7jcCwouyJydB4ATC9VvQmhNOB8gm5fwcgVEhd37toFt
         iQYZ2KcJlOe7vpd+U2XBO49NZ4GexPoEkVC2KFW4FaLTjAqlXtsbhwniAUPQoG7IH4qG
         +hZA5g+m0KvNWSiqZ6nnKqNJO4HObSqBeZg6EVUfgqNmNh1KyrEdXZ0V0rChSTtyoO2F
         LGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PosHuDVuE6SblGMIaV3BZtPEVf++I6aTVx+dsHzPm88=;
        b=fJsyNXN7EU98oYqvALyffpBI/LutfjoJwB19HyQ/ksyL7GtWTcU6+4aQTh4nX+me4q
         lhhaWrrtmkDG1cyYas+HqiQRYyJDaF8YGxdkJUa5QY5bZUywZFENJTHxE5X5OMIAQBDx
         udaaQRJqJQHwJ3i8/NCc6UQRNuxAg6fJD2Agu6/nEx80in1/qY+zO0sdb0hhcC/9bii2
         1t14QN308YecBX/wO3l6/aoituZmnMa3v0uIVVpfHgItGS+PLmmWeK/r6phMSBDjc3xc
         l6RWAHl071RyrZJNF5MgSGO1ocXBH2uyBntq3wASHbNwlGw0FY5JnMl+7kRBbn6ePEi4
         o09A==
X-Gm-Message-State: AOAM533dD7JKle4mo7FRzoENLiGNWoVqB8Av2rgmBUxtm+YZm5imORfN
	xvlfsXg2M5hC4r5wj4Rw4+KlRQ8r8yQbx3IYZL0=
X-Google-Smtp-Source: ABdhPJwh34fp0TVaX9pcpruTqGt6Ub1cD1SiY3mVuugdwqqYD3z5bP/RlXrJEM0ft5lVOrIw5SMdrmgpC8Tp1cnw/E4=
X-Received: by 2002:a17:906:8496:: with SMTP id m22mr14289717ejx.298.1604929557363;
 Mon, 09 Nov 2020 05:45:57 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4NUDHVRiSRHoUU=Ci8of0_J5C+pM7MVwOSopQ9F_yBTBw@mail.gmail.com>
 <20201020111434.17993-1-joakimr@axis.com> <20201021031033.GA20764@gmail.com>
 <e18fb481-4206-2b32-3f31-1e0aace470dc@axis.com> <CADkTA4M3HT9HuENi9m2x4v9SXa=28a75BYqhbRhFGDoPSeoTVg@mail.gmail.com>
 <af00b32f-7619-a755-13b1-714675419946@axis.com> <CADkTA4P6UmsrfZ_Lz=8=0hiNKD9ji1o5nHNy6ouJMK3spAP1NA@mail.gmail.com>
 <46f448dd-5f62-0058-dd34-c826df195c54@axis.com> <DBBPR08MB4725EE645E4C4D4CC7844E5C91EA0@DBBPR08MB4725.eurprd08.prod.outlook.com>
In-Reply-To: <DBBPR08MB4725EE645E4C4D4CC7844E5C91EA0@DBBPR08MB4725.eurprd08.prod.outlook.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 9 Nov 2020 08:45:46 -0500
Message-ID: <CADkTA4P3nL2CL4tW7-y1gStg9_HyCuFFV6XUbYct_eTF8CYBYg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v5] Adding k3s recipe
To: Lance Yang <Lance.Yang@arm.com>
Cc: "meta-virtualization@yoctoproject.org" <meta-virtualization@yoctoproject.org>, 
	"joakim.roubert@axis.com" <joakim.roubert@axis.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2020 at 4:26 AM Lance Yang <Lance.Yang@arm.com> wrote:
>
> Hi Bruce,
>
> For the iptables issue, I tested iptables.
>
> As iptables comment module belonging to iptables extension, I checked my =
kernel config and set the parameter: CONFIG_NETFILTER_XT_MATCH_COMMENT=3Dm.
>
> iptables -V
> iptables v1.8.5 (legacy)
>
> I used this iptables command to check
>
> iptables -A INPUT -p tcp --dport 22 -m comment --comment "SSH" -j ACCEPT
>
> It works fine from my side.

Yah, that's what I assumed it was as well, but yet, when I added it in
.. I didn't see a change.

That being said, this is helpful, so I started a clean build to see if
I had picked up something stale that was masking my fix.

Bruce

>
> Best Regards,
> Lance
>
> > -----Original Message-----
> > From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@l=
ists.yoctoproject.org>
> > On Behalf Of Joakim Roubert via lists.yoctoproject.org
> > Sent: Monday, November 9, 2020 3:49 PM
> > To: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Cc: meta-virtualization@yoctoproject.org
> > Subject: Re: [meta-virtualization][PATCH v5] Adding k3s recipe
> >
> > On 2020-11-06 22:20, Bruce Ashfield wrote:
> > >
> > > I now have another 6 or 7 WIP patches on top of this to try and get a
> > > single node "cluster" working with k3s. I'll clean them up and get
> > > them into the k3s WIP branch shortly.
> >
> > Awesome!
> >
> > > In your working references, which iptables do you have installed ?
> > > (legacy ? nftables?)
> >
> > # iptables --version
> > iptables v1.8.4 (legacy)
> >
> > > I'm failing to get flannel to start, with a series of errors like thi=
s:
> > >
> > > -----------
> > > I1106 21:19:00.985656   10641 eviction_manager.go:351] eviction
> > > manager: able to reduce ephemeral-storage pressure without evicting
> > > pods.
> > > E1106 21:19:10.636899   10641 proxier.go:841] Failed to ensure that
> > > filter chain INPUT jumps to KUBE-EXTERNAL-SERVICES: error checking
> > > rule: exit status 2: iptables v1.8.6 (legacy): Couldn't load match
> > > `comment':No such y Try `iptables -h' or 'iptables --help' for more
> > > information.
> > > I1106 21:19:10.641647   10641 proxier.go:825] Sync failed; retrying i=
n
> > > 30s
> > > ------------
> >
> > This is a bit strange, as it seems you are running in legacy mode too, =
although a somewhat
> > newer version than I have, and the only thing I know is that Rancher re=
commends 1.6.1 or newer
> > (which it is).
> >
> > https://rancher.com/docs/k3s/latest/en/known-issues/
> >
> > Might there be something missing in the kernel?
> >
> > I have these RPMs installed in my image:
> >
> > iptables
> > iptables-module-ip6t-ah
> > iptables-module-ip6t-dnat
> > iptables-module-ip6t-dnpt
> > iptables-module-ip6t-dst
> > iptables-module-ip6t-eui64
> > iptables-module-ip6t-frag
> > iptables-module-ip6t-hbh
> > iptables-module-ip6t-hl
> > iptables-module-ip6t-icmp6
> > iptables-module-ip6t-ipv6header
> > iptables-module-ip6t-log
> > iptables-module-ip6t-masquerade
> > iptables-module-ip6t-mh
> > iptables-module-ip6t-netmap
> > iptables-module-ip6t-redirect
> > iptables-module-ip6t-reject
> > iptables-module-ip6t-rt
> > iptables-module-ip6t-snat
> > iptables-module-ip6t-snpt
> > iptables-module-ip6t-srh
> > iptables-module-ipt-ah
> > iptables-module-ipt-clusterip
> > iptables-module-ipt-dnat
> > iptables-module-ipt-ecn
> > iptables-module-ipt-icmp
> > iptables-module-ipt-log
> > iptables-module-ipt-masquerade
> > iptables-module-ipt-netmap
> > iptables-module-ipt-realm
> > iptables-module-ipt-redirect
> > iptables-module-ipt-reject
> > iptables-module-ipt-snat
> > iptables-module-ipt-ttl
> > iptables-module-ipt-ulog
> > iptables-modules
> > iptables-module-xt-addrtype
> > iptables-module-xt-audit
> > iptables-module-xt-bpf
> > iptables-module-xt-cgroup
> > iptables-module-xt-checksum
> > iptables-module-xt-classify
> > iptables-module-xt-cluster
> > iptables-module-xt-comment
> > iptables-module-xt-connbytes
> > iptables-module-xt-connlimit
> > iptables-module-xt-connmark
> > iptables-module-xt-connsecmark
> > iptables-module-xt-conntrack
> > iptables-module-xt-cpu
> > iptables-module-xt-ct
> > iptables-module-xt-dccp
> > iptables-module-xt-devgroup
> > iptables-module-xt-dscp
> > iptables-module-xt-ecn
> > iptables-module-xt-esp
> > iptables-module-xt-hashlimit
> > iptables-module-xt-helper
> > iptables-module-xt-hmark
> > iptables-module-xt-idletimer
> > iptables-module-xt-ipcomp
> > iptables-module-xt-iprange
> > iptables-module-xt-ipvs
> > iptables-module-xt-led
> > iptables-module-xt-length
> > iptables-module-xt-limit
> > iptables-module-xt-mac
> > iptables-module-xt-mark
> > iptables-module-xt-multiport
> > iptables-module-xt-nfacct
> > iptables-module-xt-nflog
> > iptables-module-xt-nfqueue
> > iptables-module-xt-osf
> > iptables-module-xt-owner
> > iptables-module-xt-physdev
> > iptables-module-xt-pkttype
> > iptables-module-xt-policy
> > iptables-module-xt-quota
> > iptables-module-xt-rateest
> > iptables-module-xt-recent
> > iptables-module-xt-rpfilter
> > iptables-module-xt-sctp
> > iptables-module-xt-secmark
> > iptables-module-xt-set
> > iptables-module-xt-socket
> > iptables-module-xt-standard
> > iptables-module-xt-statistic
> > iptables-module-xt-string
> > iptables-module-xt-synproxy
> > iptables-module-xt-tcp
> > iptables-module-xt-tcpmss
> > iptables-module-xt-tcpoptstrip
> > iptables-module-xt-tee
> > iptables-module-xt-time
> > iptables-module-xt-tos
> > iptables-module-xt-tproxy
> > iptables-module-xt-trace
> > iptables-module-xt-u32
> > iptables-module-xt-udp
> >
> > and in my kernel config, I have (apart from what is needed for running =
containers with
> > containerd):
> >
> > CONFIG_NETFILTER_NETLINK=3Dm
> > CONFIG_NETFILTER_XT_MATCH_OWNER=3Dm
> > CONFIG_NET_UDP_TUNNEL=3Dm
> > CONFIG_NF_DUP_NETDEV=3Dm
> > CONFIG_NF_LOG_BRIDGE=3Dm
> > CONFIG_NF_TABLES_ARP=3Dy
> > CONFIG_NF_TABLES_BRIDGE=3Dy
> > CONFIG_NF_TABLES_INET=3Dy
> > CONFIG_NF_TABLES_IPV4=3Dy
> > CONFIG_NF_TABLES_IPV6=3Dy
> > CONFIG_NF_TABLES=3Dm
> > CONFIG_NF_TABLES_NETDEV=3Dy
> > CONFIG_NFT_BRIDGE_REJECT=3Dm
> > CONFIG_NFT_CHAIN_NAT_IPV4=3Dm
> > CONFIG_NFT_CHAIN_ROUTE_IPV4=3Dm
> > CONFIG_NFT_CHAIN_ROUTE_IPV6=3Dm
> > CONFIG_NFT_COMPAT=3Dm
> > CONFIG_NFT_COUNTER=3Dm
> > CONFIG_NFT_CT=3Dm
> > CONFIG_NFT_DUP_IPV4=3Dm
> > CONFIG_NFT_DUP_IPV6=3Dm
> > CONFIG_NFT_DUP_NETDEV=3Dm
> > # CONFIG_NFT_EXTHDR is not set
> > CONFIG_NFT_FIB_INET=3Dm
> > CONFIG_NFT_FIB_IPV4=3Dm
> > CONFIG_NFT_FIB_IPV6=3Dm
> > CONFIG_NFT_FIB_NETDEV=3Dm
> > CONFIG_NFT_FWD_NETDEV=3Dm
> > CONFIG_NFT_HASH=3Dm
> > CONFIG_NFT_LIMIT=3Dm
> > CONFIG_NFT_LOG=3Dm
> > CONFIG_NFT_MASQ_IPV4=3Dm
> > CONFIG_NFT_MASQ=3Dm
> > # CONFIG_NFT_META is not set
> > CONFIG_NFT_NAT=3Dm
> > CONFIG_NFT_NUMGEN=3Dm
> > # CONFIG_NFT_OBJREF is not set
> > CONFIG_NFT_QUEUE=3Dm
> > CONFIG_NFT_QUOTA=3Dm
> > CONFIG_NFT_REDIR_IPV4=3Dm
> > CONFIG_NFT_REDIR=3Dm
> > CONFIG_NFT_REJECT=3Dm
> > # CONFIG_NFT_RT is not set
> > # CONFIG_NFT_SET_BITMAP is not set
> > # CONFIG_NFT_SET_HASH is not set
> > # CONFIG_NFT_SET_RBTREE is not set
> > CONFIG_OVERLAY_FS=3Dm
> > CONFIG_STP=3Dm
> >
> > BR,
> >
> > /Joakim
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
