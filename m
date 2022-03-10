Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 114A5C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 15:19:59 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web12.10710.1646925598251066419
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Mar 2022 07:19:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X0erAxWs;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id y22so7425600eds.2
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Mar 2022 07:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0PZE8v9hVWHnSWpkrt83TYJksXW+5pvjnIDti6aF4hM=;
        b=X0erAxWsDGMCsEp0RFUAPdZYuHTTGHw41Qpu78wu5CxAB01sM1rq7PBQURg1cfFMMj
         r52Lh3ZIJ5Cg+jejBorkAcsGiMoIHJnOBol6vPknSwSuXB0QTwZhRicNHTlVAt5NqqSQ
         sAwsPsI4LpMUKGcWtWKCN/H1W5X+KMywL5g0qZR3sVZH5Y2frrVA60use4iu8AxpI2rx
         yERv+GtFLT7rK9bAH0G01SDZpugFkYBxm1q9J73D16tca27DwBa2futs9q6h2s/L0i1i
         1B5FVqeT+5Zd13HYE/PSRo/wyC4zsNDKap3if2boESdY2ggeFa4xoAilydVSK7ncq3CC
         GFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0PZE8v9hVWHnSWpkrt83TYJksXW+5pvjnIDti6aF4hM=;
        b=Nkh7Wl65vF8igVM4+1XoJ3tBRcc3whOhkWft5VfD4EuFvYsiU5V0LFBkcc53bC46Iz
         APggcWHcV5Sqv8KhKfWflsIDVAdS9BbZxTOoGSgnZtx2EnPkq24VDGbSzjBsP2Q3M3LJ
         4wUdBLr022Obxgi8+DjtZHD9v9dONaawKTYwSL4zKl3UfgKa9tOm+Qt+2KbFCvas4kx2
         LovhgIpY7M6bNncYM8xYvLsp0BjK7iPUXPjWroZNrSvRxa2cBsc8ParH4ZY4hTgCyDPb
         CmeCwofn0/mk18HRa7w4U2PsDJWtBlFSTRwcYebgWPuoOHQQ3EKvdkItGv39VYGAetsi
         20LQ==
X-Gm-Message-State: AOAM533VvrchJb3ZWa1uDEVZI8sm8qZBfljQOb6Nyr2Fj/g2wH/jLRQb
	a0t7FoHKkySPCqjwmFpP6cJi3uiPE3hqFwEtMqM=
X-Google-Smtp-Source: 
 ABdhPJwzum6VRCcXUjvXgfksvFceWTwnUkddTLpD56bltLsRSF+H8heEKVXSkqRI7qXObIVeBDewJsPgF92wN80NqbI=
X-Received: by 2002:a05:6402:3715:b0:410:a415:fd95 with SMTP id
 ek21-20020a056402371500b00410a415fd95mr4858975edb.288.1646925596240; Thu, 10
 Mar 2022 07:19:56 -0800 (PST)
MIME-Version: 1.0
References: <ce2da674-576d-a0b1-d2ab-cd872b7b17aa@berginkonsult.se>
 <CADkTA4NgQ2nUGGs9CW2va8ehWseaRTo-Dz0WFH2_f=1xdDQcug@mail.gmail.com>
 <bd0d0800-5b4c-3ac6-471e-24dd155cebfd@berginkonsult.se>
In-Reply-To: <bd0d0800-5b4c-3ac6-471e-24dd155cebfd@berginkonsult.se>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 10 Mar 2022 10:19:45 -0500
Message-ID: 
 <CADkTA4OY1SUnBVdDBX5Xm+bxsKXK3EhsZuzA64py6EUV-W_rTg@mail.gmail.com>
Subject: Re: [meta-virtualization] OCI images in yocto image
To: Peter Bergin <peter@berginkonsult.se>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 10 Mar 2022 15:19:59 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7083

On Thu, Mar 10, 2022 at 9:51 AM Peter Bergin <peter@berginkonsult.se> wrote=
:
>
> Hi Bruce,
>
> following up an old thread with some more toughts...
>
> On 2022-02-09 19:51, Bruce Ashfield wrote:
> > On Wed, Feb 9, 2022 at 1:29 PM Peter Bergin <peter@berginkonsult.se> wr=
ote:
> >> Hi,
> >>
> >> I'm exploring the world of containers combined with Yocto. I can build=
 a
> >> container image and bundle that one with my rootfs image. The containe=
r
> >> image is stored in the rootfs as a tar-file of a OCI image spec with t=
he
> >> content blobs, index.json and oci-layout. As per the description in
> >> classes/image-oci.bbclass the way to run the container is to unpack th=
e
> >> file and the create the OCI runtime bundle and start it with runc.
> >>
> >> I have played around with docker and tried to import OCI image directl=
y
> >> in to docker store but have not succeeded. Anyone that knows if it is
> >> possible? 'docker image import <oci-image>.tar does not give any error=
s
> >> and the image shows up in 'docker images' but does not import the
> >> correct rootfs.
> > There's no viable way to do this on the build side, and then have it ap=
pear
> > in the image. I've experimented several times with this, and haven't fo=
und
> > a decent solution. Running docker on the build host is a non-starter, w=
hich
> > rules out many options.
> >
> > There's more options if you use podman versus docker for the container
> > runtime, but I also haven't had time to finish anything there yet.
> >
> > To get the OCI images into docker, I bounce them through a registry and
> > use docker pull. You can see the logs of that process in several of my
> > yocto summit presentations.
> >
> I have found another solution that I would like to have your input on.
> I'm installing the OCI-image output from Yocto in my image for the host.
> Then running `docker import` on it the first boot, then it is possible
> to start. I don't know what I tried the last time but this seems to work
> now:
>
> root@qemuarm64:~# ls -la
> /var/lib/machines/container-hello-image-qemuarm64.rootfs.tar.bz2
> -rw-r--r--    1 root     root       1981366 Mar  9  2018
> /var/lib/machines/container-hello-image-qemuarm64.rootfs.tar.bz2
> root@qemuarm64:~# docker import
> /var/lib/machines/container-hello-image-qemuarm64.rootfs.tar.bz2 hello
> [   35.155151] Initializing XFRM netlink socket
> sha256:9db6cb5ce8f772caebf6ca430dd8de452e36320af861635f81f75cd4b9089f33
> root@qemuarm64:~# docker run -it --rm hello /bin/sh
> [   54.109667] docker0: port 1(vethe5c8c2b) entered blocking state
> [   54.110127] docker0: port 1(vethe5c8c2b) entered disabled state
> [   54.112606] device vethe5c8c2b entered promiscuous mode
> [   54.218708] IPv6: ADDRCONF(NETDEV_CHANGE): vethd1bfa4c: link becomes
> ready
> [   54.219547] IPv6: ADDRCONF(NETDEV_CHANGE): vethe5c8c2b: link becomes
> ready
> [   54.220098] docker0: port 1(vethe5c8c2b) entered blocking state
> [   54.220464] docker0: port 1(vethe5c8c2b) entered forwarding state
> [   54.221866] IPv6: ADDRCONF(NETDEV_CHANGE): docker0: link becomes ready
> [   54.349014] device vethe5c8c2b left promiscuous mode
> [   54.349629] docker0: port 1(vethe5c8c2b) entered disabled state
> [   56.939373] eth0: renamed from vethd1bfa4c
> / #
>
> I see it could be hard to have =C2=B4docker import` in the Yocto build fl=
ow
> but I think it is okay to have one step on first boot to import the
> image to docker on target. With this it doesn't seems necessary to
> push/pull through a registry. What do you think about this process? Any
> drawback to have in mind?

It is something I've used in the past as well (import on first boot),
but due to the nature of how the docker daemon, and tools run, it
isn't feasible to do on the build side (which is what you mention as
well).

I've also arranged to have a local registry (docker-distribution)
available, and the containers can be pulled from that on first boot,
so no network access isn't required, but the registry is there, so it
enables updates, etc, that are perhaps harder to do with just a docker
import.

No real downsides of that first boot import, outside of not having
logs on the build side of the image construction, and you may have to
go out of your way a bit to get licensing, sbom information for the
containers (depending on how you are getting them into the image for
first boot import).

And to ramble on the docker import on the build side: I've spent some
time trying to figure out how to easily drop permissions on docker,
redirect where it stores the containers, and also reverse engineering
the storage format so that we could manipulate it directly. None of
the above proved to be viable about a year ago, but I tend to revisit
it on a yearly cadence. podman is easier to use in this sort of mode
(build side, with the storage redirected, etc), and is more viable ..
but to keep all of the runtimes on a relatively even footing, I'd like
to figure it out for them all at the same time. (sort of how we don't
really want package manager specific features in OEcore). There have
been presentations in conferences, and other folks doing docker
imports on the build side of things, so it is doable. But it opens the
door to licensing, sbom, reproducibility and other issues (since
there's no guarantee that the containers are yocto built, hence could
be from anywhere). As such, it wouldn't be an approach to
bless/support in meta-virt itself (at least not until the above issues
I mention have been sorted out), but it is feasible for people to do
in their own layers.

Cheers,

Bruce


>
> Thanks,
> /Peter
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

