Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A961FCF6D24
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 13:15:44 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web11.7019.1727874941838148673
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 02 Oct 2024 06:15:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SKcRyEg1;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e25d57072dcso5789222276.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Oct 2024 06:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727874941; x=1728479741; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6xsiOgtIl6xWD0T02Ym3s88g/Gi2ZKcxCROdluCK9s=;
        b=SKcRyEg1v7O7e0gTeIY9tNO92lQPOQOtQ5TbAfvh/hLSXEz1IvgWXK4yh8MMymgsvK
         E64WOlMfYRqzPCvFcEYyvy1gDT/2QKMYKCfPcamhRgoG+VmUVqHDHCf+ivLniVGU0exM
         4HG8ePyn71q9GYk9sJDPErHvHnOnzSuGpspsN0XhqY8JUyLAN/1HKDaRFSfSRE71dJz3
         Ac98FYNUSkvZ9HtrV0wga3eVlYtSUJlXZP7qIRPvSrJ6z8kHEnpsvvRDF9V0d747VPq+
         gVnAUSW3A2uh8Ua5dA13TpHyWCObTkhZ5hxUp3mayPq8VqoYsLwf/W/Vnwrt8zPvpcSs
         zB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727874941; x=1728479741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/6xsiOgtIl6xWD0T02Ym3s88g/Gi2ZKcxCROdluCK9s=;
        b=j/x/Ylj140LctLHsgThrdkIsXw0uSofdnvwx9mWD8RrWJ8nlBmG4AsbOvTk0fL+jEf
         eZFZkWZUBz1aOQ7OynV5Mh9TtiqJY6twFMuWAE3AYpPZb1ah6yLsGw6I3mJ1tyAZLthU
         Pa3YIDwiBqbu0EMeSwIf4zu1xbKZx2WRF/8X5aa5YrsyqEkMLZD8LjRs1tlmXxDvhQPK
         dCPoevEt8juocM5XSHi92ELwXkIEbJq13qs+pqjGYQHYxritS8mtaCIyFglWY8kArf5s
         h3ENImqI7Ep/L0J/vWavRkczF1unFOMRri9fzkmZloLu1Brsb+0n0Ci6vWZfZf8XdEOA
         JzIg==
X-Gm-Message-State: AOJu0YzUrpLqamkuVCYAcRawMiEL2jRraj51HEJCp00S/shPOGaOcJs7
	u1mpJJEY3lh32ydWssd5FFbB6G9F957OqUcgm7WKiOdSEYsoUiJGNnvc2xhBy0212mD6s/56/Q1
	zbopnbSKz+bbnNZVdLj7mPSRTXtHQbqpZ
X-Google-Smtp-Source: AGHT+IHPnWPON+K6EvTk+/X4aU/c+v8x2GwH2VG5C0liOV/AzFX6PvTFeNSpE1qpL8huCAADD8kwhc6GrImfb0eMY98=
X-Received: by 2002:a05:690c:385:b0:6c7:a120:e10f with SMTP id
 00721157ae682-6e2a2e4b34amr29969157b3.29.1727874940829; Wed, 02 Oct 2024
 06:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <ZvsHJZqFe38Cpq6T@gmail.com> <6732.1727859017264507661@lists.yoctoproject.org>
In-Reply-To: <6732.1727859017264507661@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 2 Oct 2024 09:15:27 -0400
Message-ID: <CADkTA4PYTZHTWv=1P_Lm5vy-DSCH0AogBvj2zHnnP9fKP4GpEg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] libvirt: ensure sysusers.d path for libvirt-qemu
To: matthis.hauschild@airbus.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Oct 2024 13:15:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8909

On Wed, Oct 2, 2024 at 4:50=E2=80=AFAM Matthis Hauschild via
lists.yoctoproject.org
<matthis.hauschild=3Dairbus.com@lists.yoctoproject.org> wrote:
>
> Hi,
>
> does that really solve your issue? With this patch applied, I run into th=
e following build error because with the `-d` option, all arguments are tre=
ated as directories. So we should either use `-D` or create the directory a=
ccoring to the other created dirs in do_install
>
>
> install: cannot create directory =E2=80=98/workdir/build/tmp/work/core2-6=
4-wlanvm-linux/libvirt/v10.5.0+git/sources-unpack/libvirt-qemu.conf=E2=80=
=99: File exists
> install: cannot create directory =E2=80=98/workdir/build/tmp/work/core2-6=
4-wlanvm-linux/libvirt/v10.5.0+git/image/usr/lib/sysusers.d/libvirt-qemu.co=
nf=E2=80=99: File exists
>
> So I propose the following patch. Please let me know what you think.
> Side note: This is my first contribution, I hope the format is correct, o=
therwise please let me know. I cannot use `git send-email`, so this is writ=
ten from the webinterface.
> Best regards,
> Matthis

This was my mistake, I had meant t push this to master-next, not master so
my test loop didn't trigger!

This should indeed match the format of the other directory installs, since =
the
combined command line is not universally supported.

The patch won't apply as it is in this email, but I'll make the change by h=
and
and add your information to the commit log.

Bruce

>
> Patch:
>
> 3902ac8844a9868ab14fa38b663d3832daa4b9de leads to the following build
> errors:
> install: cannot create directory =E2=80=98{UNPACKDIR}/libvirt-qemu.conf=
=E2=80=99: File exists
> install: cannot create directory =E2=80=98{D}/usr/lib/sysusers.d/libvirt-=
qemu.conf=E2=80=99: File exists
> because `-d` treats all arguments as directories. Create the required
> directory the same way as the other directories.
> Signed-off-by: Matthis Hauschild <matthis.hauschild@airbus.com>
> ---
>  recipes-extended/libvirt/libvirt_git.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/l=
ibvirt/libvirt_git.bb
> index bef98b69..5c5a9b3f 100644
> --- a/recipes-extended/libvirt/libvirt_git.bb
> +++ b/recipes-extended/libvirt/libvirt_git.bb
> @@ -205,10 +205,11 @@ do_install:append() {
>      install -d ${D}/etc/init.d
>      install -d ${D}/etc/libvirt
>      install -d ${D}/etc/dnsmasq.d
> +    install -d ${D}${nonarch_base_libdir}/sysusers.d
>
>      install -m 0755 ${UNPACKDIR}/libvirtd.sh ${D}/etc/init.d/libvirtd
>      install -m 0644 ${UNPACKDIR}/libvirtd.conf ${D}/etc/libvirt/libvirtd=
.conf
> -    install -d -m 0644 ${UNPACKDIR}/libvirt-qemu.conf ${D}${nonarch_base=
_libdir}/sysusers.d/libvirt-qemu.conf
> +    install -m 0644 ${UNPACKDIR}/libvirt-qemu.conf ${D}${nonarch_base_li=
bdir}/sysusers.d/libvirt-qemu.conf
>
>      if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',=
d)}; then
>          # This will wind up in the libvirtd package, but will NOT be inv=
oked by default.
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8908): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8908
> Mute This Topic: https://lists.yoctoproject.org/mt/108714337/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

