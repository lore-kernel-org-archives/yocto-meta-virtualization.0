Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.146.1602194836887658101
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 08 Oct 2020 15:07:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ESOIJRPG;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id h24so10249197ejg.9
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 08 Oct 2020 15:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4SJt3DZXfog+HkOLBYD7TOTI5rAIfq7RmOlsoOCDvUs=;
        b=ESOIJRPGO31c2P5W7PyNlUaLWEKQSN7dlK9FRr8u7kw2bK+pXqp/31W6veBF74g+hq
         IixIQhHIrGDcsLppFUiN8WGbOugBEAC/5M3Na+wrQdH4YSN2R1l2lMyqs5DS2WQobMhS
         ea4oaTJNWlsJ/L+6fUV6cD40LWTvxjurZ6gD6NsVIu2DLcAY2Mmse4qnJ+8JuzMAYEPA
         sSIcqXVjEQcmCvpVmUc6s0gBpimGODt4Izp3f66Mc29e40nnEuW62gm0mIU/E/1Eh7gS
         +gy9rkuYRlVwXieLdWL1vbIMp2T6JY6/rKYhN7tF5Z/JoqJWipR5L0QKPwHWliI+oPwS
         1r7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4SJt3DZXfog+HkOLBYD7TOTI5rAIfq7RmOlsoOCDvUs=;
        b=ZXlDDXYmT5FKUgIIYkhTlo6UXUqCGQNt99e7jZU+uGDtWXR1VSM2YOrvny3qgn5eX0
         FIrzQQAeO23DO6XSvAVvRRYUhr0BAG+eTX0iTbec6kb1naWXPb3WkZt4v1dyie4AqOgP
         zkKmYZ3hBHXIimU3cky9iESx4fTYZqhx56kgDNkDZV/Dnj7BqvHUegOZamoJSDXQxHt4
         /+JvAhaRIwGZ9NWCzi1j+JrkkG1kFLGk3zMApiZDol5hCo1Kw0P2ej0MQgg+UhdRIt5s
         0zbktSIY95l8udY5WgWBUCcGAReGdsrE7NSj1ZdeTVMiQfdptnuzp0t12Ab4AmqR0BVi
         QEIQ==
X-Gm-Message-State: AOAM532jc/J63PpA1iCWBbvHo069IKzVMlxyWko0RYZTG1Mx501zV1U9
	lrMWXDv2wMQq/PWt/GFKzt684sx4fHrmZPnE68Q=
X-Google-Smtp-Source: ABdhPJwSF8I8szze9YXWJGzA5o5M7llbtxy7raFd66AY8ZzrB/HQT1M59g68ALhJDxaaYwhDulLUIbSyPh6Ni3xknoQ=
X-Received: by 2002:a17:907:11d0:: with SMTP id va16mr10564838ejb.22.1602194835176;
 Thu, 08 Oct 2020 15:07:15 -0700 (PDT)
MIME-Version: 1.0
References: <QqEr.1602167734052560613.bjmh@lists.yoctoproject.org>
 <3ec52728-7c70-0e78-c0a5-306a3e2ea0a4@3mdeb.com> <163C0D2B0E77C0DC.4412@lists.yoctoproject.org>
In-Reply-To: <163C0D2B0E77C0DC.4412@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 8 Oct 2020 18:07:03 -0400
Message-ID: <CADkTA4N7n+RiuoGbtqf76i+QbTVOphekhMEG+cjBSE51NQuJEQ@mail.gmail.com>
Subject: Re: [meta-virtualization] dunfell/5.8.x kernel/Docker version 19.03.8-ce
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>, 
	Robert Berger <robert.berger.yocto.user@gmail.com>, 
	meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 8, 2020 at 11:14 AM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>
> On Thu, Oct 8, 2020 at 11:00 AM Maciej Pijanowski
> <maciej.pijanowski@3mdeb.com> wrote:
> >
> >
> > On 08.10.2020 16:35, Robert Berger wrote:
> >
> > Hi,
> >
> > It looks like with a 5.8.x kernel docker is not happy anymore with iptables and kills the socket.
> >
> > https://pastebin.com/U702eC9G
> >
> > Are there any suggested fixes for this?
> >
> > The kernel-module-xt-masquerade is missing.
> > Docker could RRECOMMENDS on it.
>
> Indeed.
>
> And I have some other 5.8 related changes that I'm finishing up now,
> so I'll take care of adjusting to the 5.8+ kernel
>

FYI. If you were using the meta-virt fragments (as I hope you were!
;), then it was something I did to fix the rpi layer that broke things
.. and hence why the required modules weren't around.

I'm doing some final testing now, but will push the fix shortly:

root@qemux86-64:~# docker pull alpine
Using default tag: latest
latest: Pulling from library/alpine
df20fa9351a1: Pull complete
Digest: sha256:185518070891758909c9f839cf4ca393ee977ac378609f700f60a771a2dfe321
Status: Downloaded newer image for alpine:latest
docker.io/library/alpine:latest
root@qemux86-64:~# docker run -it alpine /bin/sh
[  232.159559] docker0: port 1(veth7ec1de8) entered blocking state
[  232.160750] docker0: port 1(veth7ec1de8) entered disabled state
[  232.163205] device veth7ec1de8 entered promiscuous mode
[  233.006297] cgroup: cgroup: disabling cgroup2 socket matching due
to net_prio or net_cls activation
[  233.171969] eth0: renamed from veth7019cad
[  233.173600] IPv6: ADDRCONF(NETDEV_CHANGE): veth7ec1de8: link becomes ready
[  233.174232] docker0: port 1(veth7ec1de8) entered blocking state
[  233.174788] docker0: port 1(veth7ec1de8) entered forwarding state
[  233.175386] IPv6: ADDRCONF(NETDEV_CHANGE): docker0: link becomes ready
/ # [  235.534743] docker0: port 1(veth7ec1de8) entered disabled state
[  235.536828] veth7019cad: renamed from eth0
[  235.621760] docker0: port 1(veth7ec1de8) entered disabled state
[  235.625189] device veth7ec1de8 left promiscuous mode
[  235.625667] docker0: port 1(veth7ec1de8) entered disabled state
root@qemux86-64:~# uname -a
Linux qemux86-64 5.8.13-yocto-standard #1 SMP PREEMPT Tue Oct 6
12:23:29 UTC 2020 x86_64 GNU/Linux

Bruce

> Bruce
>
> >
> >
> > Regards,
> >
> > Robert
> >
> >
> > --
> > Maciej Pijanowski
> > Embedded Systems Engineer
> > GPG: 9963C36AAC3B2B46
> > https://3mdeb.com | @3mdeb_com
> >
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
