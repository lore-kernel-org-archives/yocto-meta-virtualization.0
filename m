Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.7473.1633092591297422156
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 01 Oct 2021 05:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Dma2xVWP;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id v18so33662161edc.11
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 01 Oct 2021 05:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2BQ5raJdi+awKA7wnr1lGbR/akjJurXI1o2UJU6Dops=;
        b=Dma2xVWPjDI8ebUsb4Qln1jN3FG8yp05AAWvn6x1CgToSoOlnAZqiucNfRXQqYRU5v
         QGIS4lQ5muN3UOF6iXJtmLpCoRpvMOoWi9eO3gV8l54SRMxa6DqCFB0eRgrE5KYa3trz
         FcZS9swzFcT0dNEFDPs4+6J3be6OYZ091N40KyOO3ChvS4aP8269VrUV/dJ9AD2heb5j
         /eFButHu9jMDz8BUBFmnzMOt8wzkyvIlB9mD3c90kLYAOWDukrqwO3CMcPhwN/tPqo52
         1OGJ4CIUOtVR3iTZmLQcPtr2dmEb4ZH2DfyWJMFSvempZpKkmKyYcRbTD/HusD3jXLZs
         kr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2BQ5raJdi+awKA7wnr1lGbR/akjJurXI1o2UJU6Dops=;
        b=y4ALg2CFrr8vx6vSky1TCyyt7TzywyHaOGYMQa/XuvCR3fnr6d8x20Z6xuFiU532/X
         J2TwALaSoaY4GamRiELoqlChJDHMU5VQFU6dlpN3tzvA9tkAyi5pDrQlFg8IkPH4568b
         E65rM843/8H1As+gUCdWc0Ot6hBtVPNnndUuvJKIT1mGkCc9/uASPwq3jH3Jy90i6nXq
         DhJ9yUrCwVi7nls8KeH6PqnQCdyCRPnXUmLeb1ZfRu95OdB+9XDkE946Qdr87PNOM9SW
         8GIqTtfNuZvmzT7xP4GtMUKoZxeCwuWi6fTwUbyU7OJHswCuKNoOuKgV8bGXl9hH6IUo
         jMTg==
X-Gm-Message-State: AOAM530BG3TxnYWMMeQVubdMrmwrpmoV+/KHiI/7YUN0zrGqARKlsMGk
	JCz7j0Ty4F2rsI/uwXHiYXW4O/X2DgOfFbriEhQ=
X-Google-Smtp-Source: ABdhPJxgO+5hJh3qDfreOBHppnUK8o6eghzkaVvZ5gwYyLpswg/r1jTSyuvT7VqPIXONowB8TIrs2C0fsRAxtl5fjxQ=
X-Received: by 2002:a17:907:1df1:: with SMTP id og49mr6027866ejc.35.1633092584946;
 Fri, 01 Oct 2021 05:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <sR4y.1633012897405396850.uLez@lists.yoctoproject.org>
 <CADkTA4PEGOtu8EnSjfVCv=EJynX2hHo7t40=htGdrfchNL3gcg@mail.gmail.com>
 <EEB11201-E4B0-4045-8C31-026DBF2AB43F@amazon.com> <CADkTA4OhF2HShNVKw5Sk7jAXPAmuqHxwSjMue+tcw_E0+NCwsQ@mail.gmail.com>
 <C5B1B9DC-453E-434D-804D-0655FFCDE5BF@amazon.com>
In-Reply-To: <C5B1B9DC-453E-434D-804D-0655FFCDE5BF@amazon.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 1 Oct 2021 08:49:33 -0400
Message-ID: <CADkTA4NgLC0SaB_bb6FCzwvZ_VcF4+7t9E-m94Bqrue3wQ5f8w@mail.gmail.com>
Subject: Re: [meta-virtualization] Docker 20.10.3 breaks due to iptables v1.8.7 (legacy) incompatibility #meta-virtualization
To: "Hibbert, Stephen" <stephibb@amazon.co.uk>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 1, 2021 at 4:35 AM Hibbert, Stephen <stephibb@amazon.co.uk> wro=
te:
>
> Yes, you're spot on!
>
> Running the script reviled the following. The issue I'm having now is fin=
ding the correct way of including the configs, I tried setting them in my m=
yKernelConfigs.cfg and IMAGE_INSTALL_append =3D "docker-moby-contrib kernel=
-module-nf-nat kernel-module-xt-conntrack kernel-module-xt-addrtype"
>

In the K3S recipe, we actually have finer grained RRECOMMENDS than the
docker recipes (due to the way k3s was developed and integrated).

In K3S, I'm currently tracking:

RRECOMMENDS:${PN} =3D "\
                     kernel-module-xt-addrtype \
                     kernel-module-xt-nat \
                     kernel-module-xt-multiport \
                     kernel-module-xt-conntrack \
                     kernel-module-xt-comment \
                     kernel-module-xt-mark \
                     kernel-module-xt-connmark \
                     kernel-module-vxlan \
                     kernel-module-xt-masquerade \
                     "

So you could try that list, or do what I normally recommend .. use the
meta package "kernel-modules" and get everything that was built. Since
if you are using a linux-yocto variant, you'll already be getting
fragments to build the right modules as part of the kernel build.

I do have a new set of tested planned for the fall that do barebones
testing to ensure that we've fully listed the rdepends/rrcommends for
many of the recipes in meta-virt.

But for now, I'd recommend that larger package, or you can do what I
did for k3s. Build a package-feed enabled image, start docker, look at
the error messages, install the required module, and then repeat to
get the minimum list (if a kernel module wasn't being built at all,
you may need to do some rebuilding in the middle).

Bruce


> But running the config script still shows the output below:
>
> root@generic-arm64:/usr/share/docker# ./check-config.sh
> info: reading kernel config from /proc/config.gz ...
> Generally Necessary:
> - cgroup hierarchy: properly mounted [/sys/fs/cgroup]
> - CONFIG_NAMESPACES: enabled
> - CONFIG_NET_NS: enabled
> - CONFIG_PID_NS: enabled
> - CONFIG_IPC_NS: enabled
> - CONFIG_UTS_NS: enabled
> - CONFIG_CGROUPS: enabled
> - CONFIG_CGROUP_CPUACCT: enabled
> - CONFIG_CGROUP_DEVICE: enabled
> - CONFIG_CGROUP_FREEZER: missing
> - CONFIG_CGROUP_SCHED: enabled
> - CONFIG_CPUSETS: enabled
> - CONFIG_MEMCG: enabled
> - CONFIG_KEYS: enabled
> - CONFIG_VETH: enabled
> - CONFIG_BRIDGE: enabled (as module)
> - CONFIG_BRIDGE_NETFILTER: missing
> - CONFIG_NF_NAT_IPV4: missing
> - CONFIG_IP_NF_FILTER: enabled (as module)
> - CONFIG_IP_NF_TARGET_MASQUERADE: enabled (as module)
> - CONFIG_NETFILTER_XT_MATCH_ADDRTYPE: enabled (as module)
> - CONFIG_NETFILTER_XT_MATCH_CONNTRACK: enabled (as module)
> - CONFIG_NETFILTER_XT_MATCH_IPVS: missing
> - CONFIG_IP_NF_NAT: enabled (as module)
> - CONFIG_NF_NAT: enabled (as module)
> - CONFIG_NF_NAT_NEEDED: missing
> - CONFIG_POSIX_MQUEUE: enabled
>
> =EF=BB=BFOn 30/09/2021, 17:48, "Bruce Ashfield" <bruce.ashfield@gmail.com=
> wrote:
>
>     CAUTION: This email originated from outside of the organization. Do n=
ot click links or open attachments unless you can confirm the sender and kn=
ow the content is safe.
>
>
>
>     On Thu, Sep 30, 2021 at 11:40 AM Hibbert, Stephen <stephibb@amazon.co=
.uk> wrote:
>     >
>     > Thanks for the reply Bruce __ Let me know if these details help?
>     >
>     > root@generic-arm64:~# uname -r
>     > 5.10.46-yocto-standard
>     >
>     > Only setting these two kernel configs at the moment:
>     > CONFIG_ENA_ETHERNET=3Dy
>     > CONFIG_BLK_DEV_NVME=3Dy
>
>     It'll be the iptables and cgroups options that are causing issues.
>
>     The standard layers and kernel are extensively tested with meta-virt,
>     so there really shouldn't be something missing.
>
>     You can also install the docker-contrib package to your image, and ru=
n
>     the check-config.sh script to see if it reports any issues.
>
>     Bruce
>
>     >
>     > And these are the layers, running harknott...
>     > drwxrwxr-x 12 ubuntu ubuntu 4096 Sep 29 14:02 meta-arm/
>     > drwxrwxr-x  8 ubuntu ubuntu 4096 Sep 29 14:00 meta-ewaol/
>     > drwxrwxr-x 11 ubuntu ubuntu 4096 Sep 29 15:09 meta-openembedded/
>     > drwxrwxr-x 24 ubuntu ubuntu 4096 Sep 29 14:02 meta-security/
>     > drwxrwxr-x 17 ubuntu ubuntu 4096 Sep 29 14:02 meta-virtualization/
>     >
>     >
>     > On 30/09/2021, 16:32, "Bruce Ashfield" <bruce.ashfield@gmail.com> w=
rote:
>     >
>     >     CAUTION: This email originated from outside of the organization=
. Do not click links or open attachments unless you can confirm the sender =
and know the content is safe.
>     >
>     >
>     >
>     >     On Thu, Sep 30, 2021 at 10:41 AM Stephen via lists.yoctoproject=
.org
>     >     <stephibb=3Damazon.co.uk@lists.yoctoproject.org> wrote:
>     >     >
>     >     > Hello all!
>     >     >
>     >     > The current meta-virtualisation docker is incompatible with t=
he legacy v1.8.7 iptables.
>     >     >
>     >     > Docker version 20.10.3, build 41b3ea7e47 http://layers.openem=
bedded.org/layerindex/recipe/176817/
>     >     >
>     >     > iptables v1.8.7 (legacy) https://git.yoctoproject.org/cgit.cg=
i/poky/plain/meta/recipes-extended/iptables/
>     >     >
>     >     > level=3Dinfo time=3D2021-09-30T08:58:56Z msg=3D"TaskHandler: =
Sending task change: TaskChange: [arn:aws:ecs:eu-west-1:116589935960:task/G=
ravitonID-ecs-ECSGra viton2DA545608-tzdG3bupgLcn/ef8d9ea15a434c298a9623551d=
39c6ab -> STOPPED, Known Sent: NONE, PullStartedAt: 2021-09-30 08:58:55.809=
460935 +0000 UTC m=3D+5 2315.765706001, PullStoppedAt: 2021-09-30 08:58:55.=
919351717 +0000 UTC m=3D+52315.875596782, ExecutionStoppedAt: 2021-09-30 08=
:58:56.159356552 +0000 UTC m=3D+52316.115601617, container change: arn:aws:=
ecs:eu-west-1:116589935960:task/GravitonID-ecs-ECSGraviton2DA545608-tzdG3bu=
pgLcn/ef8d9ea15a434c298a9623 551d39c6ab web -> STOPPED, Reason CannotStartC=
ontainerError: Error response from daemon: driver failed programming extern=
al connectivity on endpoint e cs-GravitonIDecsTaskDefA2CA7A76-4-web-9eb9aba=
094eccadb1300 (db13dc1931d5be70284cac4de6899246035db8e5f9e0cf9ee3773000801a=
70b0): (iptables failed: ipta bles --wait -t nat -A DOCKER -p tcp -d 0/0 --=
dport 8080 -j DNAT --to-destination 172.17.0.2:3000 ! -i docker0: iptables =
v1.8.7 (legacy): unknown optio n \"--to-destination\"\nTry `iptables -h' or=
 'iptables --help' for more information.\n (exit status 2)), Known Sent: NO=
NE] sent: false" module=3Dtask_ha ndler_types.go
>     >     >
>     >     > Possibly linked to this issue and nftables support? https://g=
ithub.com/moby/moby/issues/38099
>     >     >
>     >     > Any ideas for workarounds would be very much appreciated!
>     >
>     >     It's your kernel configuration, coupled with the iptables modul=
es
>     >     available .. but most often, it is a missing kernel module.
>     >
>     >     So without knowing exactly what kernel and hardware you are run=
ning,
>     >     it is hard to say more.
>     >
>     >     Bruce
>     >
>     >     >
>     >     >
>     >     >=20
>     >     >
>     >
>     >
>     >     --
>     >     - Thou shalt not follow the NULL pointer, for chaos and madness=
 await
>     >     thee at its end
>     >     - "Use the force Harry" - Gandalf, Star Trek II
>     >
>     >
>     >
>     >
>     > Amazon Web Services EMEA SARL, 38 avenue John F. Kennedy, L-1855 Lu=
xembourg, R.C.S. Luxembourg B186284
>     >
>     > Amazon Web Services EMEA Sarl, UK Branch, 1 Principal Place, Worshi=
p Street, London, EC2A 2FA, United Kingdom, registered in England and Wales=
, UK Establishment No. BR019315
>     >
>     >
>
>
>     --
>     - Thou shalt not follow the NULL pointer, for chaos and madness await
>     thee at its end
>     - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
>
> Amazon Web Services EMEA SARL, 38 avenue John F. Kennedy, L-1855 Luxembou=
rg, R.C.S. Luxembourg B186284
>
> Amazon Web Services EMEA Sarl, UK Branch, 1 Principal Place, Worship Stre=
et, London, EC2A 2FA, United Kingdom, registered in England and Wales, UK E=
stablishment No. BR019315
>
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
