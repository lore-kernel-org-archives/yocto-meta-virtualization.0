Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D913DFED3D9
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 14:56:49 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24266.1777042601986000271
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 07:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Xg2H6LrV;
 spf=pass (domain: konsulko.com, ip: 209.85.128.178, mailfrom: tim.orling@konsulko.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79a46260385so85361697b3.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Apr 2026 07:56:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777042601; cv=none;
        d=google.com; s=arc-20240605;
        b=gqAt6lfClMGTaXmXueIwsp4bU9HGOkWvsb4y+06vDcr/YpSfhryp7J2upVNFjhEzWo
         6aTH626vDf5fXTQBn2/+YRSI1pxXtLyKZFnhIkrwvfcu8D6Iwu4ROSLTk15GJQvNNfoI
         D7Vh5zYaXwC9yGXBm6fcttJpeH+5uosa4rxxJhkDqcMscjuxFsJmW/zeAf8xe7qVyDWO
         GoOsvgd9ManI/kPnvnV31ygb1TyhGpHCjKkDh6TP6Ngcu8Nd/BR9YHI/VMEKqbdCO1+U
         DV6JQxNSBk02MPcdJ++3oaMXJKj/FssWc1b+tK0/+gyE5WOdUKgDqfUeYVVizZCNNm4j
         88Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oxN70s2RQFgWcxwfrE4Hrq20Hz3/QsQxBcmzRr4uFLo=;
        fh=KJUiJcnVPY51rdfk7aRC4SbbCBund0uO5qhAiJXsD6Y=;
        b=Xa1iCFx0JxjqUnqw/ynhnG5PTB2G78B2NN5O5EHD29SCMC7D5GcjXvRaUS7wwh8Cht
         q68VzyUdE1V2hEYgUgI8YI2yhXDmP+MIhruQs5i7ATHZBzNkxx8DjQ6HuqiQiEJZDhKA
         vZQ+5dcezSbo1Ppr4Q4JwM0EVO9sYLHv1lI785eL8QIUSU1LsnI430+FLwbvdOopfapK
         0Hk72A6fE/wsM5wTIRVBL3CUKpzHzep0H7MtnHn9AgSARosSwVYm6OYoXgKLy3Zfw8SR
         ozNjBo5m6uD+prIdqMAZ7fHQYyn6dtV2Cvju/sZZyGE2QmA8Jy5LsXgwZJzAVSQmsFQZ
         1K9A==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1777042601; x=1777647401; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oxN70s2RQFgWcxwfrE4Hrq20Hz3/QsQxBcmzRr4uFLo=;
        b=Xg2H6LrVYw7fcR3B5+iQTMd9YJBxPuKYN9wd9yweWLPTgQ3BiCUNd6QgIUHZO3+khF
         1J7ZZVAmjpqRTVvUcuLviD1spysr2gNgzvu9vxgdF8MrPUAt6faNdJwGdRbuT7bSEcLj
         x7bYk/fiNh7z3J3ACsWqiXqKOr5e117cP0f58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777042601; x=1777647401;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxN70s2RQFgWcxwfrE4Hrq20Hz3/QsQxBcmzRr4uFLo=;
        b=DxtxPGJd1jT5y7S7S9nhyy0nCrtUmM+g0XKPiMSgsMqIRvcAf/N5QDuIzmObgdYdEL
         KHVaTOthm06O2m3zioiTDRIYrusLZXfCSBTfKgq1rz/g8OrmuMS67QcWhPnRfxtepSka
         Ukr4bJFb3C5OTeCMuaxJxvyvxIohFejHTl+y6S69Y9pOgng7Qn1lQVDMnMRdzRKqTEU9
         XpCm8US2PMGDUJwITftlZZSN5MNGJoSr/4dVmzHPavyfMw9epCxG3Gnyl5fWuhnEV1Cv
         YoyC8NwDSXOZn87/1q3vft5mXe5+TSuOJjwPoR9g18yw6yD88VoE8epkUD9bQbSuhdBd
         naWg==
X-Forwarded-Encrypted: i=1; AFNElJ+SLTzlBLimOafLIsDGLVMrfOzuOSBQ5OX+Z/BaUFX4WNFu2WbxD9Ge2e+X9482tDCxrXDz8IcRF0QC3RkkgzADHi3K@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxtqVE/VspZH988s217bhcJVTJWeX74pm3cYm19iBdG3wwtdjkh
	23dEMYWtHMw7TYlYniCSmiRaBMNWRO4YEBvBUvn/DjIFGZH+KQ/5J+dV+sj5aZcCduQfpr3vhaA
	KlXkc2cj3d0tcPgnjn5CtQ+n/wUo60BPt0MMym9O8fw==
X-Gm-Gg: AeBDietZxK5umS5aVQeixKz0AqotKu+Rp29PKBtEfcMc1tOOhnkWZ55qCV8FMaeEBIh
	yJjLgWxnO31im9qOAPi6mncuv7KMW2XJ+ZTGtHGF5LLvdJOg/iCxKPA4Sh7NllViiuhYqek5wX7
	UbAlW32AVSNkUDM/iYz9StwfIH1MootbqpODx3kHK7vZhImoMy7TtmktiLG2kI2OJkWS+WfilGO
	6AM/gyn2Iud/hsZjpbxxPZWe14njDLUs7Ms6X3Hfm9J34UX8CsQnGibM4Y90qVYkpChQ8hQe+f4
	LBs+xS8uLZibnOBuvw==
X-Received: by 2002:a05:690c:6e83:b0:7a2:ce0e:864a with SMTP id
 00721157ae682-7b9ecece098mr310272867b3.17.1777042601046; Fri, 24 Apr 2026
 07:56:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260424042727.75417-1-tim.orling@konsulko.com> <db641b6a21142d5ca3960265be985239aa17ec3b.camel@pbarker.dev>
In-Reply-To: <db641b6a21142d5ca3960265be985239aa17ec3b.camel@pbarker.dev>
From: Tim Orling <tim.orling@konsulko.com>
Date: Fri, 24 Apr 2026 07:56:28 -0700
X-Gm-Features: AQROBzAEXCE7w3REbNTgsVvsiKWlw3TqNlB_p62OAnzd-SLG9pPqs0nmvDOZHDY
Message-ID: <CAOyo-870B+Tcqrr7Ds2eHQYgybkr5vnX3ygmnu3MW_pthGU0gg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] distro/vruntime: DISTRO_FEATURES_DEFAULT
 is obsolete
To: Paul Barker <paul@pbarker.dev>
Cc: ticotimo@gmail.com, meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000fc8274065035f88a"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Apr 2026 14:56:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9744

--000000000000fc8274065035f88a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 1:57=E2=80=AFAM Paul Barker <paul@pbarker.dev> wrot=
e:

> On Thu, 2026-04-23 at 21:26 -0700, Tim Orling via lists.yoctoproject.org
> wrote:
> > Replace with DISTRO_FEATURES_DEFAULTS
> >
> >
> https://git.openembedded.org/openembedded-core/commit/meta/conf?id=3D0548=
ea447445834647be7ef35ed0ae8d1d3387b3
> >
> > Fixes:
> > ERROR: Nothing PROVIDES 'nativesdk-libseccomp' ...
> >
> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > ---
> >  conf/distro/vruntime.conf | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/conf/distro/vruntime.conf b/conf/distro/vruntime.conf
> > index 0ea43e62..56c5ad6a 100644
> > --- a/conf/distro/vruntime.conf
> > +++ b/conf/distro/vruntime.conf
> > @@ -46,8 +46,8 @@ DISTRO_FEATURES =3D "acl ext2 ipv4 ipv6 seccomp vfat =
pci
> vcontainer vxn"
> >  DISTRO_FEATURES_OPTED_OUT =3D "pulseaudio gobject-introspection-data
> opengl ptest multiarch wayland vulkan"
> >
> >  # Native and nativesdk classes need full features for build tools
> > -DISTRO_FEATURES:class-native =3D "${DISTRO_FEATURES_DEFAULT}
> ${POKY_DEFAULT_DISTRO_FEATURES}"
> > -DISTRO_FEATURES:class-nativesdk =3D "${DISTRO_FEATURES_DEFAULT}
> ${POKY_DEFAULT_DISTRO_FEATURES}"
> > +DISTRO_FEATURES:class-native =3D "${DISTRO_FEATURES_DEFAULTS}
> ${POKY_DEFAULT_DISTRO_FEATURES}"
> > +DISTRO_FEATURES:class-nativesdk =3D "${DISTRO_FEATURES_DEFAULTS}
> ${POKY_DEFAULT_DISTRO_FEATURES}"
> >
> >  # Default to ext4, but image recipes may override to squashfs
> >  IMAGE_FSTYPES =3D "ext4"
>
> Hi Tim,
>
> This is the wrong approach as it bypasses the default feature filtering.
> Instead, just drop DISTRO_FEATURES_DEFAULT, the defaults are appended
> automatically after filtering for opt-outs.
>
> See the corresponding change in poky [1] for an example.
>
> [1]:
> https://git.yoctoproject.org/meta-yocto/commit/?id=3D96085aaec5bfb33c4e43=
22465eaf0af370db6fc0
>
>
Thank you, Paul. Updated version sent.
https://lists.yoctoproject.org/g/meta-virtualization/message/9743

--Tim


> Best regards,
>
> --
> Paul Barker
>
>

--000000000000fc8274065035f88a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 24,=
 2026 at 1:57=E2=80=AFAM Paul Barker &lt;<a href=3D"mailto:paul@pbarker.dev=
">paul@pbarker.dev</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Thu, 2026-04-23 at 21:26 -0700, Tim Orling via <a href=
=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lis=
ts.yoctoproject.org</a><br>
wrote:<br>
&gt; Replace with DISTRO_FEATURES_DEFAULTS<br>
&gt; <br>
&gt; <a href=3D"https://git.openembedded.org/openembedded-core/commit/meta/=
conf?id=3D0548ea447445834647be7ef35ed0ae8d1d3387b3" rel=3D"noreferrer" targ=
et=3D"_blank">https://git.openembedded.org/openembedded-core/commit/meta/co=
nf?id=3D0548ea447445834647be7ef35ed0ae8d1d3387b3</a><br>
&gt; <br>
&gt; Fixes:<br>
&gt; ERROR: Nothing PROVIDES &#39;nativesdk-libseccomp&#39; ...<br>
&gt; <br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.co=
m" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 conf/distro/vruntime.conf | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/conf/distro/vruntime.conf b/conf/distro/vruntime.conf<br>
&gt; index 0ea43e62..56c5ad6a 100644<br>
&gt; --- a/conf/distro/vruntime.conf<br>
&gt; +++ b/conf/distro/vruntime.conf<br>
&gt; @@ -46,8 +46,8 @@ DISTRO_FEATURES =3D &quot;acl ext2 ipv4 ipv6 seccomp=
 vfat pci vcontainer vxn&quot;<br>
&gt;=C2=A0 DISTRO_FEATURES_OPTED_OUT =3D &quot;pulseaudio gobject-introspec=
tion-data opengl ptest multiarch wayland vulkan&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Native and nativesdk classes need full features for build tool=
s<br>
&gt; -DISTRO_FEATURES:class-native =3D &quot;${DISTRO_FEATURES_DEFAULT} ${P=
OKY_DEFAULT_DISTRO_FEATURES}&quot;<br>
&gt; -DISTRO_FEATURES:class-nativesdk =3D &quot;${DISTRO_FEATURES_DEFAULT} =
${POKY_DEFAULT_DISTRO_FEATURES}&quot;<br>
&gt; +DISTRO_FEATURES:class-native =3D &quot;${DISTRO_FEATURES_DEFAULTS} ${=
POKY_DEFAULT_DISTRO_FEATURES}&quot;<br>
&gt; +DISTRO_FEATURES:class-nativesdk =3D &quot;${DISTRO_FEATURES_DEFAULTS}=
 ${POKY_DEFAULT_DISTRO_FEATURES}&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Default to ext4, but image recipes may override to squashfs<br=
>
&gt;=C2=A0 IMAGE_FSTYPES =3D &quot;ext4&quot;<br>
<br>
Hi Tim,<br>
<br>
This is the wrong approach as it bypasses the default feature filtering.<br=
>
Instead, just drop DISTRO_FEATURES_DEFAULT, the defaults are appended<br>
automatically after filtering for opt-outs.<br>
<br>
See the corresponding change in poky [1] for an example.<br>
<br>
[1]: <a href=3D"https://git.yoctoproject.org/meta-yocto/commit/?id=3D96085a=
aec5bfb33c4e4322465eaf0af370db6fc0" rel=3D"noreferrer" target=3D"_blank">ht=
tps://git.yoctoproject.org/meta-yocto/commit/?id=3D96085aaec5bfb33c4e432246=
5eaf0af370db6fc0</a><br>
<br></blockquote><div><br></div><div>Thank you, Paul. Updated version sent.=
</div><div><a href=3D"https://lists.yoctoproject.org/g/meta-virtualization/=
message/9743">https://lists.yoctoproject.org/g/meta-virtualization/message/=
9743</a></div><div><br></div><div>--Tim</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
Best regards,<br>
<br>
-- <br>
Paul Barker<br>
<br>
</blockquote></div></div>

--000000000000fc8274065035f88a--

