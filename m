Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web09.15397.1633020235603248625
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 30 Sep 2021 09:43:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nYGcu84W;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id g7so24033305edv.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 30 Sep 2021 09:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=d9i5jiAJUDrXkeQ6bmctAvoOtDTK2phHFTuT353/ppc=;
        b=nYGcu84WIWZ0wDlgCjgSdwhoX5/RASaSqPHsKf9g3lBrI4ZN48nIVfjCUGiaukD5Gg
         2Fg0dCUbNBwzocIiU6AjB75X+VEHbnVgo6ssWjIhB5Y2YRNbUVF2qqUEEbu5gbS5RLxs
         Bo0Cm8JwlOKjlV0bSwQiFYA1YGn+mYqqBqAZ+G2bZIRK/Yusr+as7Q1hlUmTwnHgLPBh
         7OkGM3mc8QUf/c0is9cA6FxgzBmMFTTYE42JcKAPkJ4FUrTaMWSNwyb93RSKjrT8QJuW
         KKYrnjBi7IeD9eIt4aHkD/UA0fR6MM6NmD5Ox0/y4L4O82AsVHPIv89yIa3zQwyPwUJv
         cjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=d9i5jiAJUDrXkeQ6bmctAvoOtDTK2phHFTuT353/ppc=;
        b=ZqgDp6SL5mnuTHReUr/sa4eU5Gfp7Xm/I/JZ3C2mIdbuy02FZXC9EpTJ5lWtuyas8V
         ijJpqpmrzx+5jHBYItaC9lfDTahuisZLzP6ZTWdyVSxosKv/lG9CSi92qWZnzcTCJZau
         kCdRMjl8C2MIiDAwyvmwZMbfvevWL2Lsl+Yb/r6b5ZQkvNQK6Zc+GQDk3GAloP7LSp98
         HnIfIgKdnspjrANd6oTM++rX66FK3+4MENtilXp/XM5f75ejXtaMVQ/SNeEzsqavTH0A
         epiHuAjmUeQCO4pabTppl22zHFiUahdLQDnPeWI575xfN6LVx028ua3cdBDREdJUZcof
         CdYg==
X-Gm-Message-State: AOAM531dhhMYg3bXJ3IZttDJQu9ZyJX5NZR6vSqv0KGjT1K+Oid2iMAu
	CU6txmdsgil4nv6Hz7EgkzreTsZz8SWvmvxF0Ew=
X-Google-Smtp-Source: ABdhPJylMZ8I49V1HV9n8V8OtMmOUjFVI4tE7gR9nPRJFof3Sq4vCMYp2FM2c8N2yNQPGmTRP+9OEN3vequz71//5Hk=
X-Received: by 2002:a17:906:3542:: with SMTP id s2mr206864eja.379.1633020228105;
 Thu, 30 Sep 2021 09:43:48 -0700 (PDT)
MIME-Version: 1.0
References: <sR4y.1633012897405396850.uLez@lists.yoctoproject.org>
 <CADkTA4PEGOtu8EnSjfVCv=EJynX2hHo7t40=htGdrfchNL3gcg@mail.gmail.com> <EEB11201-E4B0-4045-8C31-026DBF2AB43F@amazon.com>
In-Reply-To: <EEB11201-E4B0-4045-8C31-026DBF2AB43F@amazon.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 30 Sep 2021 12:43:37 -0400
Message-ID: <CADkTA4OhF2HShNVKw5Sk7jAXPAmuqHxwSjMue+tcw_E0+NCwsQ@mail.gmail.com>
Subject: Re: [meta-virtualization] Docker 20.10.3 breaks due to iptables v1.8.7 (legacy) incompatibility #meta-virtualization
To: "Hibbert, Stephen" <stephibb@amazon.co.uk>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2021 at 11:40 AM Hibbert, Stephen <stephibb@amazon.co.uk> w=
rote:
>
> Thanks for the reply Bruce __ Let me know if these details help?
>
> root@generic-arm64:~# uname -r
> 5.10.46-yocto-standard
>
> Only setting these two kernel configs at the moment:
> CONFIG_ENA_ETHERNET=3Dy
> CONFIG_BLK_DEV_NVME=3Dy

It'll be the iptables and cgroups options that are causing issues.

The standard layers and kernel are extensively tested with meta-virt,
so there really shouldn't be something missing.

You can also install the docker-contrib package to your image, and run
the check-config.sh script to see if it reports any issues.

Bruce

>
> And these are the layers, running harknott...
> drwxrwxr-x 12 ubuntu ubuntu 4096 Sep 29 14:02 meta-arm/
> drwxrwxr-x  8 ubuntu ubuntu 4096 Sep 29 14:00 meta-ewaol/
> drwxrwxr-x 11 ubuntu ubuntu 4096 Sep 29 15:09 meta-openembedded/
> drwxrwxr-x 24 ubuntu ubuntu 4096 Sep 29 14:02 meta-security/
> drwxrwxr-x 17 ubuntu ubuntu 4096 Sep 29 14:02 meta-virtualization/
>
>
> =EF=BB=BFOn 30/09/2021, 16:32, "Bruce Ashfield" <bruce.ashfield@gmail.com=
> wrote:
>
>     CAUTION: This email originated from outside of the organization. Do n=
ot click links or open attachments unless you can confirm the sender and kn=
ow the content is safe.
>
>
>
>     On Thu, Sep 30, 2021 at 10:41 AM Stephen via lists.yoctoproject.org
>     <stephibb=3Damazon.co.uk@lists.yoctoproject.org> wrote:
>     >
>     > Hello all!
>     >
>     > The current meta-virtualisation docker is incompatible with the leg=
acy v1.8.7 iptables.
>     >
>     > Docker version 20.10.3, build 41b3ea7e47 http://layers.openembedded=
.org/layerindex/recipe/176817/
>     >
>     > iptables v1.8.7 (legacy) https://git.yoctoproject.org/cgit.cgi/poky=
/plain/meta/recipes-extended/iptables/
>     >
>     > level=3Dinfo time=3D2021-09-30T08:58:56Z msg=3D"TaskHandler: Sendin=
g task change: TaskChange: [arn:aws:ecs:eu-west-1:116589935960:task/Gravito=
nID-ecs-ECSGra viton2DA545608-tzdG3bupgLcn/ef8d9ea15a434c298a9623551d39c6ab=
 -> STOPPED, Known Sent: NONE, PullStartedAt: 2021-09-30 08:58:55.809460935=
 +0000 UTC m=3D+5 2315.765706001, PullStoppedAt: 2021-09-30 08:58:55.919351=
717 +0000 UTC m=3D+52315.875596782, ExecutionStoppedAt: 2021-09-30 08:58:56=
.159356552 +0000 UTC m=3D+52316.115601617, container change: arn:aws:ecs:eu=
-west-1:116589935960:task/GravitonID-ecs-ECSGraviton2DA545608-tzdG3bupgLcn/=
ef8d9ea15a434c298a9623 551d39c6ab web -> STOPPED, Reason CannotStartContain=
erError: Error response from daemon: driver failed programming external con=
nectivity on endpoint e cs-GravitonIDecsTaskDefA2CA7A76-4-web-9eb9aba094ecc=
adb1300 (db13dc1931d5be70284cac4de6899246035db8e5f9e0cf9ee3773000801a70b0):=
 (iptables failed: ipta bles --wait -t nat -A DOCKER -p tcp -d 0/0 --dport =
8080 -j DNAT --to-destination 172.17.0.2:3000 ! -i docker0: iptables v1.8.7=
 (legacy): unknown optio n \"--to-destination\"\nTry `iptables -h' or 'ipta=
bles --help' for more information.\n (exit status 2)), Known Sent: NONE] se=
nt: false" module=3Dtask_ha ndler_types.go
>     >
>     > Possibly linked to this issue and nftables support? https://github.=
com/moby/moby/issues/38099
>     >
>     > Any ideas for workarounds would be very much appreciated!
>
>     It's your kernel configuration, coupled with the iptables modules
>     available .. but most often, it is a missing kernel module.
>
>     So without knowing exactly what kernel and hardware you are running,
>     it is hard to say more.
>
>     Bruce
>
>     >
>     >
>     >=20
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
