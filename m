Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB0AC19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 13:43:48 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.12032.1660052618316155392
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 06:43:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LwdN9L1Z;
 spf=pass (domain: gmail.com, ip: 209.85.167.179,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id j5so8142062oih.6
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 06:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=6drHQAl9dPiRIxVeroEJd4CJtFlRLoOGuZspt+fQSKA=;
        b=LwdN9L1ZhpHaK14ISeag+30lOd9hEIiKAiklN5oHxyOou4gjZlb5Fgv8mNuwFkpJnO
         hgHcRObqjwPE8Zk6CuPq9ZXoXtsq/wm+w3ZZl19qvoqB67gbcqbdbUtFiZQl/4af9dyI
         /G9pLJtIEnHy0AKzOHLgBtOK9jmP/pkvX/QdQWqRc4xoFRt6QqUafxVokhjYzyhCbksQ
         9bMPML4uJKp4eZ7qIid0hIhXjMpctRWDDTEt8LJ1TXtLwt5qRAphNKTMLZ+TOYsIBQsU
         3Cs22taScl4vR1BzfQfoz4wl1/BMgCQlaqXFr0ljX0hYGm4uK/dzINArwOP7IKXo1mIZ
         jZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=6drHQAl9dPiRIxVeroEJd4CJtFlRLoOGuZspt+fQSKA=;
        b=oPzDyhF0SBBCPPi8XLQMfz96WH5HVgZnmZ+wx9TWTV89BXcrqjBA6uNIE8kIF4YyD8
         MMM+2DFhCpU8NKYT+/AyxQETtufLWv7Caug4LIzuf/3O5pywfKNAd3J3AXv+hAX29ejI
         jAK9txJltbW+Kq6eioOs9g6N4s0QwKHd8zx6MFK+UgOJut31nveyBNqAMAPuzHAYMd26
         +WzgYP5OhYYrv7txTBrZOXaMnmGez43pkFoUuIm2t1V/uzIg0knkVRtHowbAP6HkSt8a
         71vPf8yuihKrjWiaFQDfI/v/5TkT/ADRUlgDilsNpzGBFlcKVc2+1bUR0NMfp+oYdsKx
         KJwQ==
X-Gm-Message-State: ACgBeo3KfBgNzCtLnLe5c7HJQ/cUxP4phKBPGu44unMqgGAJbRnjzibA
	DJbE0Yj65iNl6haAFu433AN/cPvJIudcfizr0hU=
X-Google-Smtp-Source: 
 AA6agR7ptuBp4NEDz6xFtN6G3UbaM3KI8ofCVWVwwKaHh0zoP4RjRmEQc9Pe80KpICglIFTkeNRqP14GDvn5H23h38Y=
X-Received: by 2002:a05:6808:1312:b0:341:cbcd:5387 with SMTP id
 y18-20020a056808131200b00341cbcd5387mr12323112oiv.175.1660052617409; Tue, 09
 Aug 2022 06:43:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220809121619.32258-1-jose.quaresma@foundries.io>
 <20220809121619.32258-2-jose.quaresma@foundries.io>
 <CADkTA4OGLGXrRWaEVJMpUKs_X3F3nJf1Y7LUQP4SziXXPaBJ2g@mail.gmail.com>
 <CANPvuRkiHG6_Rbw_oh_JaJYzbs+YkbhSSbQfsXaURRVfcPD4hg@mail.gmail.com>
In-Reply-To: 
 <CANPvuRkiHG6_Rbw_oh_JaJYzbs+YkbhSSbQfsXaURRVfcPD4hg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 9 Aug 2022 09:43:25 -0400
Message-ID: 
 <CADkTA4PCWwSU2zGud1PABZbqFrrwwG-0dzmUock_9qfonzy_Kg@mail.gmail.com>
Subject: Re: [meta-virtualization][kirkstone][master][PATCH 2/4] kubernetes:
 install the binaries in OE standard places
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Aug 2022 13:43:48 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7502

On Tue, Aug 9, 2022 at 9:34 AM Jose Quaresma <quaresma.jose@gmail.com> wrot=
e:
>
> Hi Bruce,
>
> Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=A7a, 9/0=
8/2022 =C3=A0(s) 14:19:
>>
>> You must have something different in your environment, I'm not seeing
>> any of these same issues.
>
>
> Maybe because you have the BIN_PREFIX defined somewhere in your distro or=
 local.conf
> BIN_PREFIX is defined only in k3s recipe BIN_PREFIX ?=3D "${exec_prefix}/=
local"
>

I'm building a plain OE + meta-virt. BIN_PREFIX isn't in the
environment anywhere (which is admittedly strange .. but that's
consistent with how it has been).

Also, there's no other reports of this ever on the mailing list,
including demos for conferences, etc. ... that fails the "how can this
be working for everyone else ?" test.

So there's definitely something different that I'm not seeing. I use
OE nodistro or poky, others are using some other distros .. so I need
to figure out what is the difference.

That being said, even if we tweaked the binaries install, we don't
want them changing where they've been installed previously, there
could be any number of scripts expecting those locations in layers
that I don't maintain.

i.e. there's no way we should be patching the .service file, since
that indicates the binaries have moved from where they were before.

Bruce



> Jose
>
>>
>>
>> Cheers,
>>
>> Bruce
>>
>> On Tue, Aug 9, 2022 at 8:16 AM Jose Quaresma <quaresma.jose@gmail.com> w=
rote:
>> >
>> > - The env BIN_PREFIX is there from the beginning but there are no refe=
rences to it,
>> > also fix a fatal QA errors installed-vs-shipped.
>> >
>> > ERROR: kubernetes-1_v1.23.6+gitfbcfa33018159c033aee77b0d5456df6771aa9b=
5-r0 do_package: QA Issue: kubernetes: Files/directories were installed but=
 not shipped in any package:
>> >   /bin
>> >   /bin/k8s-init
>> > Please set FILES such that these items are packaged. Alternatively if =
they are unneeded, avoid installing them or delete them within do_install.
>> > kubernetes: 2 installed and not shipped files. [installed-vs-shipped]
>> > ERROR: kubernetes-1_v1.23.6+gitfbcfa33018159c033aee77b0d5456df6771aa9b=
5-r0 do_package: Fatal QA errors were found, failing task.
>> >
>> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>> > ---
>> >  recipes-containers/kubernetes/kubernetes_git.bb | 6 +++---
>> >  1 file changed, 3 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes=
-containers/kubernetes/kubernetes_git.bb
>> > index e9460d4..82b75b1 100644
>> > --- a/recipes-containers/kubernetes/kubernetes_git.bb
>> > +++ b/recipes-containers/kubernetes/kubernetes_git.bb
>> > @@ -103,8 +103,8 @@ do_install() {
>> >      install -m 0644 ${WORKDIR}/git/release/cmd/kubepkg/templates/late=
st/deb/kubeadm/10-kubeadm.conf  ${D}${systemd_unitdir}/system/kubelet.servi=
ce.d/
>> >
>> >      if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false=
',d)}; then
>> > -       install -d "${D}${BIN_PREFIX}/bin"
>> > -       install -m 755 "${WORKDIR}/k8s-init" "${D}${BIN_PREFIX}/bin"
>> > +       install -d ${D}${bindir}
>> > +       install -m 755 ${WORKDIR}/k8s-init ${D}${bindir}
>> >
>> >         install -d ${D}${sysconfdir}/sysctl.d
>> >         install -m 0644 "${WORKDIR}/99-kubernetes.conf" "${D}${sysconf=
dir}/sysctl.d"
>> > @@ -141,7 +141,7 @@ FILES:kube-proxy =3D "${bindir}/kube-proxy"
>> >  FILES:${PN}-misc =3D "${bindir} ${sysconfdir}/sysctl.d"
>> >
>> >  ALLOW_EMPTY:${PN}-host =3D "1"
>> > -FILE:${PN}-host =3D "${BIN_PREFIX}/bin/k8s-init"
>> > +FILE:${PN}-host =3D "${bindir}/k8s-init"
>> >  RDEPENDS:${PN}-host =3D "${PN}"
>> >
>> >  RRECOMMENDS:${PN} =3D "\
>> > --
>> > 2.37.1
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#7496): https://lists.yoctoproject.org/g/meta-virtu=
alization/message/7496
>> > Mute This Topic: https://lists.yoctoproject.org/mt/92913426/1050810
>> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsu=
b [bruce.ashfield@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

