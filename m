Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.9214.1634304784078441491
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 15 Oct 2021 06:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BuOu5utF;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id d9so37933419edh.5
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 15 Oct 2021 06:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MSJ5eoOnO18+Q3Zz7iIupWGji25HnA/kKODZLgRGkPs=;
        b=BuOu5utFzGbKVs0aSQZX9EegERDzl4brn0myQ1PfIr2u+OPUXSuDJXQb6+z8JKrVRP
         ipnrwLwTRf7Rdj6KH66zHLRslMknioY3YJJLJArwi55qRw1Ge78FjhbpDqNIMgIs5rxE
         wV3Lhnj5EMTlyHNAipD04IAR07TxS/u/xwNR4YdE0lXzglIIXy8ix5/VdJyshCE/xn1i
         YfsrfErs5nXp+uQj36VqXSuFaxMdJY099RLSB0GMD8M1SKLLfqOcbgg5jUkxcboVowhB
         MZspdNhpJaMCImpjZm8f2xa+43/HqHValpDfAuE8wEtgftDYgCjPHMn0C6OqTgzg5IP7
         oX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MSJ5eoOnO18+Q3Zz7iIupWGji25HnA/kKODZLgRGkPs=;
        b=2TfG57yZfNw4beZ7/ABZG9FdeRnxMteoYhjHMFglLhqM5vJ2XjmsH79wBkHb2z5JXZ
         yHtPre3eEeCgI32w4HEmxXQFIgKr35WAI9CNOXjCkyFvfSAqvlojtXVPbbayBFwACLHb
         mgLGJuP8pxUh/WuSbvphO70JNIEE8z/mfBVr83r88nUWA3u5Pzk4vBqKPoQqtHudD8G6
         I/5cK44t9bPPOaFZWCGISsX9BgUpr2RpSqAzzj6Z0957JsD5R/CAQidBPFFWvWEgTgA1
         3sAGe2xw9H3WAqdE7FJ3zndiokiXTq4iUjDuBgsvLXkJa11LTy/uq3vgMTBDpPvHzarw
         SgZA==
X-Gm-Message-State: AOAM533CJA96DGBtMrxSZOHACv+UZhJL3XPrbBJ2UJNt88nm0oQmG2OS
	RooO5pt+omKW5ycn0WPqfQjADl6CSj9WxLCYJi8=
X-Google-Smtp-Source: ABdhPJwOJwRzd3tEP1cr4PjI/kci57GDDhVO+JRTIb8hMK75E8cPOtw7ypMYGOnyQiG32AfObOb5g8A0DHLK3zfwzHk=
X-Received: by 2002:a17:907:3e8e:: with SMTP id hs14mr6906139ejc.35.1634304776913;
 Fri, 15 Oct 2021 06:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <ad014c7cc4e8d1bcd4f499229d09e013@denx.de> <8227d089c2ea3916874c0818ef882fa1@denx.de>
 <496ab2cdd27129263ca02aa72cfb4801@denx.de>
In-Reply-To: <496ab2cdd27129263ca02aa72cfb4801@denx.de>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 15 Oct 2021 09:32:45 -0400
Message-ID: <CADkTA4N0J6SZVjP3GCtLLDh9i8sVNnSdC+TRMgTFd-=_XecXUQ@mail.gmail.com>
Subject: Re: ip6tables executable not getting installed in dunfell
To: Fabio Estevam <festevam@denx.de>
Cc: Nathan Dunne <Nathan.Dunne@arm.com>, meta-virtualization@lists.yoctoproject.org, 
	Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 15, 2021 at 9:00 AM Fabio Estevam <festevam@denx.de> wrote:
>
> On 15/10/2021 09:49, Fabio Estevam wrote:
> > On 15/10/2021 01:40, Fabio Estevam wrote:
> >> Hi,
> >>
> >> I am running the dunfell branch and I notice
> >> that ip6tables is not getting installed:
> >
> > After passing 'ipv6' into DISTRO_FEATURES, ip6tables gets installed.
> >
> > ~# podman run hello-world
> > ....
> > [  207.201607] cni-podman0: port 1(veth6b661354) entered disabled state
> > Error: systemd cgroup flag passed, but systemd support for managing
> > cgroups is not available: OCI runtime error
> >
> > Does anyone know how to add systemd support for managing cgroups?
>
> I had to add a /etc/containers/libpod.conf file with the following
> content:

There's definitely something different in your image composition than
the core-image* (poky based) that are used in much of the (my) regular
testing.

In a systemd based image, you shouldn't need to specify the
cgroup_manager ... crun yes, but that isn't all that common a
configuration.

From my build this morning:

root@qemux86-64:~# podman run hello-world
Trying to pull docker.io/library/hello-world:latest...
Getting image source signatures
Copying blob 2db29710123e done
Copying config feb5d9fea6 done
Writing manifest to image destination
Storing signatures
[  170.623873] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[  170.629244] cni-podman0: port 1(vetha3693c5d) entered blocking state
[  170.632659] cni-podman0: port 1(vetha3693c5d) entered disabled state
[  170.633441] device vetha3693c5d entered promiscuous mode
[  170.634203] cni-podman0: port 1(vetha3693c5d) entered blocking state
[  170.634938] cni-podman0: port 1(vetha3693c5d) entered forwarding state
[  170.635725] IPv6: ADDRCONF(NETDEV_CHANGE): cni-podman0: link becomes ready
[  170.783982] cgroup: cgroup: disabling cgroup2 socket matching due
to net_prio or net_cls activation

Hello from Docker!
This message shows that your installation appears to be working correctly.

<snip>

root@qemux86-64:~# uname -a
Linux qemux86-64 5.14.9-yocto-standard #1 SMP PREEMPT Wed Oct 6
11:28:32 UTC 2021 x86_64 GNU/Linux

----------------

If what you are seeing can be reproduced on master, and your image
definitions are public, I'd be interested in seeing them, so I can
expand the rdepends/requires of podman to make sure it pull in what it
needs.

Bruce

>
> cgroup_manager = "cgroupfs"
> runtime = "/usr/bin/crun"
>
> And now podman can run:
>
> @iotgate:~# podman run hello-world
> ....
>
> Hello from Docker!
> This message shows that your installation appears to be working
> correctly.
> ...
>
> Thanks
>
> --
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-60 Fax: (+49)-8142-66989-80 Email:
> festevam@denx.de



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
