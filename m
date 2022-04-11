Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D73D6C636F5
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:00 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web09.29245.1649683951536823769
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Apr 2022 06:32:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DqGU53iM;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id lc2so10333346ejb.12
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Apr 2022 06:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rA0Lua+GF9bm4n6OmLEcrh501SYF45O3PpybkbxWWuU=;
        b=DqGU53iMnb6xsLzCOi86L9MX52cYlzTRsoZQ0OQ4ORO/BK0WNJguGsVtRfpFOoc4DX
         gASckvAMYbWgH8PQWCduHE2vVMTqYdyfKsIGjuc4GkBergdB2asjuGWK7UGFBpLryziQ
         0djIekB4jMZiqeprjgf9kyjHIK9KUTwslEvj1W7LrhIbboetWoDWhIE9O+mF8U71sVUI
         R/NOxNt23iuutaQSSz4j7OqSDY2t5n36cTWO1uGf/uPoZlJNSPlT0GbY3du+hQ4f3hBm
         +UsHvPqkk2xEAL+sYlSSO06cNQmfldvV6NUr7K0DM7e/u3HCC9lmWrV0dEO/IFYx5UT8
         +PMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rA0Lua+GF9bm4n6OmLEcrh501SYF45O3PpybkbxWWuU=;
        b=UilP/VkMQ6p8nLQrnVWFaKglDmqXx357OJbTYxgVYIoXKQGWLVKWHZdYCTX4EoitTL
         FhPDfmQKyL7PTetX0qQTiJZrJhFlqqwpFElDa/Q8HpCNOAd/El3Nh1wnDjM871vEJh0C
         HSbv2zICVEO+eCTbJtnu7a8Wn7Iiaxu9Krsk5rtMZtuEDtF/0uRFvtjarambkIjR4VAp
         nT8eXhDM7P5oAuSNVzpObJbCkC8D0MjjS14dtzmiciYt84w5TW8Fmo5Kp4L/ok8Z1kad
         zyct4ArpS/nRnInzII88Y8rwy4WAAcRL+0JSHmIOmMEAFxWh2hNjC31I6FzWoHb0V8du
         h8Ew==
X-Gm-Message-State: AOAM530P+9ZaI7jpMWW2R62H4HY5EK+I9Frf+uDnzDKPN2V+G8DqqWUZ
	3kQfQUFMmQ+bmgG+LWaRR2Li0rtwJ802EtlfsNqwNQhLtfw=
X-Google-Smtp-Source: 
 ABdhPJwTk5IDOVZ1HsoY/C7PvO3lJg5hRsYiyLpqq+BYiaa2T403ZfqRho/pjbBsQ6VzkjvPG3hcj4dKiRfWhzcmiQY=
X-Received: by 2002:a17:907:3da5:b0:6e8:464a:4cc2 with SMTP id
 he37-20020a1709073da500b006e8464a4cc2mr16031376ejc.532.1649683949820; Mon, 11
 Apr 2022 06:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220411132921.35512-1-Qi.Chen@windriver.com>
In-Reply-To: <20220411132921.35512-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 11 Apr 2022 09:32:18 -0400
Message-ID: 
 <CADkTA4Pd9MJ6XNswssPGcMaqjnXUxu9rm1ZOfXoQhtYke=Yx0w@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] libvirt: package all sysctl conf
 files for libvirtd
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000d2207305dc60f9f6"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Apr 2022 17:18:00 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7157

--000000000000d2207305dc60f9f6
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 11, 2022 at 9:29 AM Chen Qi <Qi.Chen@windriver.com> wrote:

> The libvirtd package has already packaged ${sysconfdir}/sysctl.d,
> and also the /usr/lib/sysctl.d/60-libvirtd.conf, it would be
> reasonable for it to package other sysctl conf files, otherwise
> we will meet the following error in case of multilib.
>
>   QA Issue: libvirt: Files/directories were installed but not shipped in
> any package:
>     /usr/lib/sysctl.d/60-qemu-postcopy-migration.conf
>

See the patch that I sent as well.

There's no reason to have /usr/lib anywhere in the packaging at all. We
should just rely on ${libdir}, if libvirt is installing outside of the
definition of ${libdir}, then we can patch ilbvirt, versus hardcoding
/usr/lib in the FILES variables.

Bruce



>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_8.1.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_8.1.0.bb
> b/recipes-extended/libvirt/libvirt_8.1.0.bb
> index b90fb704..433601c6 100644
> --- a/recipes-extended/libvirt/libvirt_8.1.0.bb
> +++ b/recipes-extended/libvirt/libvirt_8.1.0.bb
> @@ -62,7 +62,7 @@ FILES:${PN}-libvirtd = " \
>         ${sysconfdir}/sysctl.d \
>         ${sysconfdir}/logrotate.d \
>         ${sysconfdir}/libvirt/libvirtd.conf \
> -        /usr/lib/sysctl.d/60-libvirtd.conf \
> +        /usr/lib/sysctl.d/ \
>         ${sbindir}/libvirtd \
>         ${systemd_system_unitdir} \
>         ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '',
> '${libexecdir}/libvirt-guests.sh', d)} \
> --
> 2.33.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7155):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7155
> Mute This Topic: https://lists.yoctoproject.org/mt/90394721/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000d2207305dc60f9f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Apr 11, 2022 at 9:29 AM Chen Qi &lt;<a href=
=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">The libvirtd package=
 has already packaged ${sysconfdir}/sysctl.d,<br>
and also the /usr/lib/sysctl.d/60-libvirtd.conf, it would be<br>
reasonable for it to package other sysctl conf files, otherwise<br>
we will meet the following error in case of multilib.<br>
<br>
=C2=A0 QA Issue: libvirt: Files/directories were installed but not shipped =
in any package:<br>
=C2=A0 =C2=A0 /usr/lib/sysctl.d/60-qemu-postcopy-migration.conf<br></blockq=
uote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:sm=
all">See the patch that I sent as well.</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">There&#39;s no reason to have /usr/lib anywhere in the packa=
ging at all. We should just rely on ${libdir}, if libvirt is installing out=
side of the definition of ${libdir}, then we can patch ilbvirt, versus hard=
coding /usr/lib in the FILES variables.</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/libvirt/<a href=3D"http://libvirt_8.1.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvirt_8.1.0.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-extended/libvirt/<a href=3D"http://libvirt_8.1.0.bb" r=
el=3D"noreferrer" target=3D"_blank">libvirt_8.1.0.bb</a> b/recipes-extended=
/libvirt/<a href=3D"http://libvirt_8.1.0.bb" rel=3D"noreferrer" target=3D"_=
blank">libvirt_8.1.0.bb</a><br>
index b90fb704..433601c6 100644<br>
--- a/recipes-extended/libvirt/<a href=3D"http://libvirt_8.1.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvirt_8.1.0.bb</a><br>
+++ b/recipes-extended/libvirt/<a href=3D"http://libvirt_8.1.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvirt_8.1.0.bb</a><br>
@@ -62,7 +62,7 @@ FILES:${PN}-libvirtd =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sysconfdir}/sysctl.d \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sysconfdir}/logrotate.d \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sysconfdir}/libvirt/libvirtd.conf \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/lib/sysctl.d/60-libvirtd.conf \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/lib/sysctl.d/ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sbindir}/libvirtd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${systemd_system_unitdir} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;,=
 &#39;sysvinit&#39;, &#39;&#39;, &#39;${libexecdir}/libvirt-guests.sh&#39;,=
 d)} \<br>
-- <br>
2.33.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#7155): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/7155" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/7155</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/90394721/1050=
810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/90394721/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000d2207305dc60f9f6--

