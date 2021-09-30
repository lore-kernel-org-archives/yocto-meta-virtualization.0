Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web09.14267.1633015872572043935
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 Sep 2021 08:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hcwSvAiF;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id l8so23889948edw.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Sep 2021 08:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lrYyRfw7O3DvC/7ttQCo9x8jYwClvWQJq8f+Y0CRj9s=;
        b=hcwSvAiFaGGHRjkCy7wpQWyRgi+NaWmtPtyWoqk5CdewcZraV4s80vr8/rA/fGPDYp
         Qd2XmJrBiv/3oeE2e9k+nFMn2LFOy8kzZ/RokLR3OPOiVyM+O6piigXGVoh2ZPsAGYzv
         maz+CHDtbc7jgLeaxVwY4u7DqcY48V7JI7lUnAnfGdE7qbtlVk7gfA9EgAgy+DY9bHgZ
         mTSHOr2sNVdzun3B65fxOfv9a5oWBs3imn4urXoPeynAQ3/Ss4q4oXQKNPFCwLQeWZYB
         cVC73CAt+kJg7VtHUUgV1Q2d5bryFWXDf9HawWqBw80WDn9ZXJ98IDu2HQEfwl38c7Wc
         XFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lrYyRfw7O3DvC/7ttQCo9x8jYwClvWQJq8f+Y0CRj9s=;
        b=cVBMCK4cSWDUu06/D+0vFUlmRMARsDhjZUzdNWX3BA3dMJ5BuhUoA1A+9jPkGUMKNi
         ApgYkfsQcctEuJdAped9wczWoEkrNO7fgfRNkAXsgKLm7mIB55NSv1UNneBpMg1iMpL4
         KaUhYKc2EkGQpA9GBHIPLXCACkPkb7+C7WCnklnU6xP3ITuRVbdNLPPnn1lH9klYGncO
         YK8gCCaHwtlSC9QHNxFMaF/A2qzWL0UkPvwKqLLSYA7pHzx3x78UBergISShAdjWaOM4
         zHOFXzKIhKP2UGhamUyq7AVbIEhaXSMxb4Hm+gPTU9a9Dgv7ZkxRk395Hv1TzKD20sFn
         7slw==
X-Gm-Message-State: AOAM530wvWmSwVkqE6teZEGAk0QNLuEttiwAp4Rn7MHoiQHJNEEq4KaZ
	ywdj3WvelijyHKcw2nhgWmsKvo3Rc5XVaxdfU5g=
X-Google-Smtp-Source: ABdhPJynXjMZIUeK6/V/4WR5LJ0VPLxHFqa9hcuIm8I/DS7s7l4XVk8r3GSojGEzDnZfMpNrdjTFUoQGdl4K1CsYwck=
X-Received: by 2002:a17:906:d541:: with SMTP id cr1mr7771556ejc.81.1633015766078;
 Thu, 30 Sep 2021 08:29:26 -0700 (PDT)
MIME-Version: 1.0
References: <sR4y.1633012897405396850.uLez@lists.yoctoproject.org>
In-Reply-To: <sR4y.1633012897405396850.uLez@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 30 Sep 2021 11:29:13 -0400
Message-ID: <CADkTA4PEGOtu8EnSjfVCv=EJynX2hHo7t40=htGdrfchNL3gcg@mail.gmail.com>
Subject: Re: [meta-virtualization] Docker 20.10.3 breaks due to iptables v1.8.7 (legacy) incompatibility #meta-virtualization
To: stephibb@amazon.co.uk
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2021 at 10:41 AM Stephen via lists.yoctoproject.org
<stephibb=3Damazon.co.uk@lists.yoctoproject.org> wrote:
>
> Hello all!
>
> The current meta-virtualisation docker is incompatible with the legacy v1=
.8.7 iptables.
>
> Docker version 20.10.3, build 41b3ea7e47 http://layers.openembedded.org/l=
ayerindex/recipe/176817/
>
> iptables v1.8.7 (legacy) https://git.yoctoproject.org/cgit.cgi/poky/plain=
/meta/recipes-extended/iptables/
>
> level=3Dinfo time=3D2021-09-30T08:58:56Z msg=3D"TaskHandler: Sending task=
 change: TaskChange: [arn:aws:ecs:eu-west-1:116589935960:task/GravitonID-ec=
s-ECSGra viton2DA545608-tzdG3bupgLcn/ef8d9ea15a434c298a9623551d39c6ab -> ST=
OPPED, Known Sent: NONE, PullStartedAt: 2021-09-30 08:58:55.809460935 +0000=
 UTC m=3D+5 2315.765706001, PullStoppedAt: 2021-09-30 08:58:55.919351717 +0=
000 UTC m=3D+52315.875596782, ExecutionStoppedAt: 2021-09-30 08:58:56.15935=
6552 +0000 UTC m=3D+52316.115601617, container change: arn:aws:ecs:eu-west-=
1:116589935960:task/GravitonID-ecs-ECSGraviton2DA545608-tzdG3bupgLcn/ef8d9e=
a15a434c298a9623 551d39c6ab web -> STOPPED, Reason CannotStartContainerErro=
r: Error response from daemon: driver failed programming external connectiv=
ity on endpoint e cs-GravitonIDecsTaskDefA2CA7A76-4-web-9eb9aba094eccadb130=
0 (db13dc1931d5be70284cac4de6899246035db8e5f9e0cf9ee3773000801a70b0): (ipta=
bles failed: ipta bles --wait -t nat -A DOCKER -p tcp -d 0/0 --dport 8080 -=
j DNAT --to-destination 172.17.0.2:3000 ! -i docker0: iptables v1.8.7 (lega=
cy): unknown optio n \"--to-destination\"\nTry `iptables -h' or 'iptables -=
-help' for more information.\n (exit status 2)), Known Sent: NONE] sent: fa=
lse" module=3Dtask_ha ndler_types.go
>
> Possibly linked to this issue and nftables support? https://github.com/mo=
by/moby/issues/38099
>
> Any ideas for workarounds would be very much appreciated!

It's your kernel configuration, coupled with the iptables modules
available .. but most often, it is a missing kernel module.

So without knowing exactly what kernel and hardware you are running,
it is hard to say more.

Bruce

>
>
>=20
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
