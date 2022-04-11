Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74435C3A5A7
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:59 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.24768.1649646418760381925
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 10 Apr 2022 20:06:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O+hwn0wD;
 spf=pass (domain: gmail.com, ip: 209.85.208.42,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id c64so4507235edf.11
        for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 10 Apr 2022 20:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jxaHg+fZOa6mbcXGeW8gNBg2/PpCbtzuL+OPb/YRcCk=;
        b=O+hwn0wDllg3yo8SWYJ33ke3PAjjhqR+I1SQ9ijfqb5xPKr1CfRjW7x+BLatP1SK9Q
         Tu0V+gtxx2p848uPFdRJakj50e0IRyTImrjMzpkDfyJ5VEiucbmWLoQIHh2NMUmFu1UB
         2caRVAaIm4ITeQ9iixL/TXpjt0KQYo8Vv1jwalmxW48+IgjWImo2JBkMYyPZxUr0WwtM
         /pFUlgGsW8OQ6FTHHziijpLaT9oYqAXnKtmXRfSc7ofQJ/A809fXUe5CsuJG5cI9eIYf
         15mo+VsxJmwxG1fuenjCfMma9IxTgknmFrQKVJin5X16WmgofKh+hGNFKY0LjD6lvYv8
         E0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jxaHg+fZOa6mbcXGeW8gNBg2/PpCbtzuL+OPb/YRcCk=;
        b=12IUrzBEVnQL2JRtlRPs21aDBif7wbEO59huwHBSK0GrhY16Rn2UStvNR7t4KozSgM
         c/0VokH8Wj6OI8PJbdueuhO6nJwUWrWYz0JVLB0yw1Wheci0RQWrKNsjOiZzVvrCw/Iy
         XUQOL+h17hD481jKoKfloFvTokN0HRlZjLl69ekCIQ9V0Te4aohqCKV1zU6Z1ZM+hNY3
         JRG8a4HwrwbiGdjd0f4oVAMdbieJvP9yH5ygElNex6rNlBirnpdqGmoWjw1V2lGEHs7U
         MG7TpKFDnN3rEYDokTlh+cb1DKd/DzbIW07jvJ0nGZaE1qLG/GTnYDBA6EBYnQ5Sh4v3
         94/g==
X-Gm-Message-State: AOAM532jxc1B7VZuDet7mM9IN42DFSr8RQbEu1vaefg7ZLFLoIko8CMl
	i27ry+JjX+t8Gu0IezFTC6qs5f7IdGSUBdpjEbQ=
X-Google-Smtp-Source: 
 ABdhPJzQIJHFWfklMD083zPK1sLduCVmNKeIW3Ieiq48QQZLP47Cb4stUHVytxupCEE5iSpb7dDUVWjumLcdm71aDRw=
X-Received: by 2002:a05:6402:d4c:b0:410:a415:fd95 with SMTP id
 ec12-20020a0564020d4c00b00410a415fd95mr31304217edb.288.1649646416725; Sun, 10
 Apr 2022 20:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220411003834.1547923-1-preeti.sachan@intel.com>
In-Reply-To: <20220411003834.1547923-1-preeti.sachan@intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 10 Apr 2022 23:06:45 -0400
Message-ID: 
 <CADkTA4MBM_yP+DyR4=mS0K06JzACmJZP5v0E_hG0c+9e=ypikw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] libvirt: fix do_package issue
To: preeti.sachan@intel.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000ac893405dc583c82"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Apr 2022 17:17:59 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7145

--000000000000ac893405dc583c82
Content-Type: text/plain; charset="UTF-8"

I'm not seeing any packaging issues here.

Can you elaborate on what warning/QA/other issue you are seeing ?

Bruce

On Sun, Apr 10, 2022 at 8:38 PM <preeti.sachan@intel.com> wrote:

> From: Preeti Sachan <preeti.sachan@intel.com>
>
> Signed-off-by: Preeti Sachan <preeti.sachan@intel.com>
> ---
>  recipes-extended/libvirt/libvirt_8.1.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-extended/libvirt/libvirt_8.1.0.bb
> b/recipes-extended/libvirt/libvirt_8.1.0.bb
> index b90fb70..712cea8 100644
> --- a/recipes-extended/libvirt/libvirt_8.1.0.bb
> +++ b/recipes-extended/libvirt/libvirt_8.1.0.bb
> @@ -63,6 +63,7 @@ FILES:${PN}-libvirtd = " \
>         ${sysconfdir}/logrotate.d \
>         ${sysconfdir}/libvirt/libvirtd.conf \
>          /usr/lib/sysctl.d/60-libvirtd.conf \
> +        /usr/lib/sysctl.d/60-qemu-postcopy-migration.conf \
>         ${sbindir}/libvirtd \
>         ${systemd_system_unitdir} \
>         ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '',
> '${libexecdir}/libvirt-guests.sh', d)} \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7144):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7144
> Mute This Topic: https://lists.yoctoproject.org/mt/90385357/1050810
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

--000000000000ac893405dc583c82
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">I&#39;m not seeing any packaging issues here.</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">Can you elaborate on what warning/QA/oth=
er issue you are seeing ?</div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small"=
>Bruce</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Sun, Apr 10, 2022 at 8:38 PM &lt;<a href=3D"mailto:preeti.sa=
chan@intel.com">preeti.sachan@intel.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">From: Preeti Sachan &lt;<a href=3D"m=
ailto:preeti.sachan@intel.com" target=3D"_blank">preeti.sachan@intel.com</a=
>&gt;<br>
<br>
Signed-off-by: Preeti Sachan &lt;<a href=3D"mailto:preeti.sachan@intel.com"=
 target=3D"_blank">preeti.sachan@intel.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/libvirt/<a href=3D"http://libvirt_8.1.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvirt_8.1.0.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/recipes-extended/libvirt/<a href=3D"http://libvirt_8.1.0.bb" r=
el=3D"noreferrer" target=3D"_blank">libvirt_8.1.0.bb</a> b/recipes-extended=
/libvirt/<a href=3D"http://libvirt_8.1.0.bb" rel=3D"noreferrer" target=3D"_=
blank">libvirt_8.1.0.bb</a><br>
index b90fb70..712cea8 100644<br>
--- a/recipes-extended/libvirt/<a href=3D"http://libvirt_8.1.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvirt_8.1.0.bb</a><br>
+++ b/recipes-extended/libvirt/<a href=3D"http://libvirt_8.1.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvirt_8.1.0.bb</a><br>
@@ -63,6 +63,7 @@ FILES:${PN}-libvirtd =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sysconfdir}/logrotate.d \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sysconfdir}/libvirt/libvirtd.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/lib/sysctl.d/60-libvirtd.conf \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/lib/sysctl.d/60-qemu-postcopy-migration.c=
onf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sbindir}/libvirtd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${systemd_system_unitdir} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;,=
 &#39;sysvinit&#39;, &#39;&#39;, &#39;${libexecdir}/libvirt-guests.sh&#39;,=
 d)} \<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#7144): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/7144" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/7144</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/90385357/1050=
810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/90385357/1050810</a><br>
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

--000000000000ac893405dc583c82--

