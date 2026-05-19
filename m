Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B7E7CD4F54
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 21:52:13 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1763.1779227527750819361
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 May 2026 14:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GmCiDjK3;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c82471904fcso1796879a12.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 19 May 2026 14:52:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779227527; cv=none;
        d=google.com; s=arc-20240605;
        b=YRQXWYbHZfLYdUhn+peD1s3HWL+nee6V5jmUY7Ku/FzSor+ac7xTduvusugD1PJePu
         2rR3+zSqUKVBKkqjPGBX+CTqncoFz9x/PT0g4zvNzVgWO6U34gIlCD2JWOSnP/mA40UL
         iVA73CowE4iq1PAfYeqFgAQ+2XPLrj+1bK2jvCOWC+vijeWS6I0rJIdeYt21xlAJSmGZ
         x8sVH7uYALRcdQQkN7A8GxIEo+YNBWqMPdqr5mwGscCxBD5J5NulIuhPCHckugtEd9fq
         +Y1XA2oSES31lDyzQX1Rd7x1+GRLjFf56MdVw1m8YrZ4V7w/nE0PH/EpRG6K8nhVwYmY
         AcEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EdU0ECPo2PoY/H4QNNtkQl1LtMTuIoanaRfTqRuiPEs=;
        fh=doUVKuyLOUWHmAhjAUCvoXzcRDDkJfgaeqDNgxrUivU=;
        b=Ft7+EQICdyC3OABQ+u6omxdNROM0AO7dINqhCyNmWsZE4EuMatFdBhOcBVScdeVC0y
         JbN7JbmWyXvfX6BJLU6xT5N566MmHK4SmfC+IHueNXgc/UNQJOes/m258DS3eBPuDSoK
         7wjcTqliOFHulz6Z1V0TUF5fCl+YXEEZoZxHtj9qA6FdS0HkkxKu5oddv+yo2pSpS5/P
         eAn1OQXy2fTLupPsLw7nvQVfPn9XT+0SX91/lInsYWh1qr2vqt7gFgObE5PoYtF+yaaQ
         GiIhqnjYrwbp7lsU5z97Pdj/ETram4NFDllQQEL7l/wQv8fGpDZtS7E9URTT2Z958pj4
         oDwA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779227527; x=1779832327; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EdU0ECPo2PoY/H4QNNtkQl1LtMTuIoanaRfTqRuiPEs=;
        b=GmCiDjK3Nj8dXIneQIi3+aEyHiRN+cXjaY+jTkI+tYBTOCZMMiXrJsXaycGnd155tA
         VEatUxJDvWvhil/dn/uKXiVWUdC8mAo9lbI188x9ss1B4GKQ2IXdh0rPjGbc4e4LbJ8h
         lYmGmkg/f7czNqSMkAb4Z4O04smLDMF54FsyL3lzDFW3l09Muft/uzG24SdE6jY01M/q
         7GeGp3OW2zlpDeidMTGKM5o9epRLOF28M86oXHJThSJhENFUfCVXf+qa6ghkv+KKltOu
         c8MO4VUcZ7qvE/p4q2E0017fHC0e79xXWUBmGl8U1rC5cJ79/sShlcBA4uCYhR4o5zcR
         Jtrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779227527; x=1779832327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EdU0ECPo2PoY/H4QNNtkQl1LtMTuIoanaRfTqRuiPEs=;
        b=rhnk8fcUnQXHqzKXNHcRSUkOwA2iVg7tS+kA5al2TEpRvAq/vVhK/fSGAGWKudV3lJ
         xN2wMCvUPH0uo/bj2qRtnEb8MQKP0SHgDRvfz6UGeegeU9sF20NPwH8ig147FLuyEnVc
         8Ap8jYnqmcqe8963OLFpQ6P6ye74UjqjFtF6JXHmvBAfZiUuajITZGhseq9oqPk7Dm8I
         uMfJW7eAZFlLThZ3n8BN22lBoyPzAZ4pGATFIWWDw2WjqxE5UnSPCOc+8PYsaNNBOpQn
         4Q6dA6NEuWN8saDW0RY656UaFxtzltdG6G4L7mGJjAzQ+tjF6L8TVaZzkXkAk0KmJ45j
         LtSg==
X-Gm-Message-State: AOJu0Yx7/5R3w6oOP4hABaT6ucgEl5bnXWpMnDV1Lsww7TH/J1k6Lki8
	JcaKwg/6tmwAaWW6C+BQXXEB84XLnLVsrVn9G1gUKFON0+SmssL0c2jb7ZUKnvQfv0hemwo5+5E
	leG3r67TGc5Cw9gI7zbbd/4EF0LGCJgw=
X-Gm-Gg: Acq92OG/Uw+NThNZbB0AGfLB3y32HwQF+uvDlveQdIO6hVWiavwhGegZpxAagWaJGG4
	DoyXkKnsqWb3yT8f2a83XKv5C6VZf2izGLf0G6A99/uwnpmW742thG9aGFuPx/Kc/2I1jJhkdyz
	+szun0vY5glivl+mEWsGhuCvS4w7A/ixj9TrO9TX1RqzYM5X1ak3vG5Q7PrEcp0OKTsK7ZPVZU8
	nDaKUMW5a4qkCxDl3z0IhljE/GT/Jg3UelBwtfvk9+3AlTyTWKHSB3V68f5oGWxvdbsXCgNAn4d
	ZWGSS3j53m9UBBFBMXCFaOHGRuuhedMaChVTkFdV
X-Received: by 2002:a17:90b:4d0e:b0:368:6a6e:94dd with SMTP id
 98e67ed59e1d1-36951ca31d6mr21221001a91.24.1779227526898; Tue, 19 May 2026
 14:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260519074144.602860-1-jiaying.song.cn@windriver.com>
In-Reply-To: <20260519074144.602860-1-jiaying.song.cn@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 19 May 2026 15:51:56 -0600
X-Gm-Features: AVHnY4KJ9VP8HkJr_nH_3jY6-nJTTR4ZLXodXDZPHPew4Iw5Lk6UEMeDh3cWq1Q
Message-ID: <CADkTA4PfOgbK2RdRUhYO7Z1YGUkekcjs4iSAoLO710YVATRhpQ@mail.gmail.com>
Subject: Re: [meta-virtualization][meta-cloud-services][PATCH] layer: update
 LAYERSERIES_COMPAT to wrynose
To: jiaying.song.cn@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000b72680065232b056"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 May 2026 21:52:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9798

--000000000000b72680065232b056
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 1:41=E2=80=AFAM <jiaying.song.cn@windriver.com> wro=
te:

> From: Jiaying Song <jiaying.song.cn@windriver.com>
>
> Update LAYERSERIES_COMPAT from 'thud warrior' to 'wrynose' in 7
> sub-layers to match the main layer and fix compatibility errors
> with the current core layer.
>

I've moved everything from those layers into the main meta-cloud-services
layer and left those without compatibility to show that they are out of
date and don't provide a working openstack environment.

Is there something in those layers you want ? If so, it's better to move it
rather than to add compatibility.

Bruyce



>
> Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> ---
>  meta-openstack-aio-deploy/conf/layer.conf             | 2 +-
>  meta-openstack-compute-deploy/conf/layer.conf         | 2 +-
>  meta-openstack-compute-test-config/conf/layer.conf    | 2 +-
>  meta-openstack-controller-deploy/conf/layer.conf      | 2 +-
>  meta-openstack-controller-test-config/conf/layer.conf | 2 +-
>  meta-openstack-qemu/conf/layer.conf                   | 2 +-
>  meta-openstack-swift-deploy/conf/layer.conf           | 2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/meta-openstack-aio-deploy/conf/layer.conf
> b/meta-openstack-aio-deploy/conf/layer.conf
> index 67a1ef01..fde31817 100644
> --- a/meta-openstack-aio-deploy/conf/layer.conf
> +++ b/meta-openstack-aio-deploy/conf/layer.conf
> @@ -7,7 +7,7 @@ BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb
> ${LAYERDIR}/recipes*/*/*.bbappend"
>  BBFILE_COLLECTIONS +=3D "openstack-aio-deploy-layer"
>  BBFILE_PATTERN_openstack-aio-deploy-layer :=3D "^${LAYERDIR}/"
>  BBFILE_PRIORITY_openstack-aio-deploy-layer =3D "6"
> -LAYERSERIES_COMPAT_openstack-aio-deploy-layer =3D "thud warrior"
> +LAYERSERIES_COMPAT_openstack-aio-deploy-layer =3D "wrynose"
>
>  LAYERDEPENDS_openstack-aio-deploy-layer =3D " \
>         core \
> diff --git a/meta-openstack-compute-deploy/conf/layer.conf
> b/meta-openstack-compute-deploy/conf/layer.conf
> index 047d006e..4af5ef96 100644
> --- a/meta-openstack-compute-deploy/conf/layer.conf
> +++ b/meta-openstack-compute-deploy/conf/layer.conf
> @@ -7,7 +7,7 @@ BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb
> ${LAYERDIR}/recipes*/*/*.bbappend"
>  BBFILE_COLLECTIONS +=3D "openstack-compute-deploy-layer"
>  BBFILE_PATTERN_openstack-compute-deploy-layer :=3D "^${LAYERDIR}/"
>  BBFILE_PRIORITY_openstack-compute-deploy-layer =3D "6"
> -LAYERSERIES_COMPAT_openstack-compute-deploy-layer =3D "thud warrior"
> +LAYERSERIES_COMPAT_openstack-compute-deploy-layer =3D "wrynose"
>
>  LAYERDEPENDS_openstack-compute-deploy-layer =3D " \
>         core \
> diff --git a/meta-openstack-compute-test-config/conf/layer.conf
> b/meta-openstack-compute-test-config/conf/layer.conf
> index 9525e202..90ed8dcb 100644
> --- a/meta-openstack-compute-test-config/conf/layer.conf
> +++ b/meta-openstack-compute-test-config/conf/layer.conf
> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS +=3D "openstack-compute-test-config-la=
yer"
>  BBFILE_PATTERN_openstack-compute-test-config-layer :=3D "^${LAYERDIR}/"
>  # We want this layer to have higher priority than any other
> meta-openstack layers
>  BBFILE_PRIORITY_openstack-compute-test-config-layer =3D "100"
> -LAYERSERIES_COMPAT_openstack-compute-test-config-layer =3D "thud warrior=
"
> +LAYERSERIES_COMPAT_openstack-compute-test-config-layer =3D "wrynose"
>
>  LAYERDEPENDS_openstack-compute-test-config-layer =3D " \
>         openstack-compute-deploy-layer \
> diff --git a/meta-openstack-controller-deploy/conf/layer.conf
> b/meta-openstack-controller-deploy/conf/layer.conf
> index d1512b8e..a50e400d 100644
> --- a/meta-openstack-controller-deploy/conf/layer.conf
> +++ b/meta-openstack-controller-deploy/conf/layer.conf
> @@ -7,7 +7,7 @@ BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb
> ${LAYERDIR}/recipes*/*/*.bbappend"
>  BBFILE_COLLECTIONS +=3D "openstack-controller-deploy-layer"
>  BBFILE_PATTERN_openstack-controller-deploy-layer :=3D "^${LAYERDIR}/"
>  BBFILE_PRIORITY_openstack-controller-deploy-layer =3D "6"
> -LAYERSERIES_COMPAT_openstack-controller-deploy-layer =3D "thud warrior"
> +LAYERSERIES_COMPAT_openstack-controller-deploy-layer =3D "wrynose"
>
>  LAYERDEPENDS_openstack-controller-deploy-layer =3D " \
>         core \
> diff --git a/meta-openstack-controller-test-config/conf/layer.conf
> b/meta-openstack-controller-test-config/conf/layer.conf
> index aa8a0ee3..71a9d014 100644
> --- a/meta-openstack-controller-test-config/conf/layer.conf
> +++ b/meta-openstack-controller-test-config/conf/layer.conf
> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS +=3D
> "openstack-controller-test-config-layer"
>  BBFILE_PATTERN_openstack-controller-test-config-layer :=3D "^${LAYERDIR}=
/"
>  # We want this layer to have higher priority than any other
> meta-openstack layers
>  BBFILE_PRIORITY_openstack-controller-test-config-layer =3D "100"
> -LAYERSERIES_COMPAT_openstack-controller-test-config-layer =3D "thud warr=
ior"
> +LAYERSERIES_COMPAT_openstack-controller-test-config-layer =3D "wrynose"
>
>  LAYERDEPENDS_openstack-controller-test-config-layer =3D " \
>         openstack-controller-deploy-layer \
> diff --git a/meta-openstack-qemu/conf/layer.conf
> b/meta-openstack-qemu/conf/layer.conf
> index bf629d0b..1fbee947 100644
> --- a/meta-openstack-qemu/conf/layer.conf
> +++ b/meta-openstack-qemu/conf/layer.conf
> @@ -7,7 +7,7 @@ BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb
> ${LAYERDIR}/recipes*/*/*.bbappend"
>  BBFILE_COLLECTIONS +=3D "openstack-qemu-layer"
>  BBFILE_PATTERN_openstack-qemu-layer :=3D "^${LAYERDIR}/"
>  BBFILE_PRIORITY_openstack-qemu-layer =3D "6"
> -LAYERSERIES_COMPAT_openstack-qemu-layer =3D "thud warrior"
> +LAYERSERIES_COMPAT_openstack-qemu-layer =3D "wrynose"
>
>  LAYERDEPENDS_openstack-qemu-layer =3D " \
>         core \
> diff --git a/meta-openstack-swift-deploy/conf/layer.conf
> b/meta-openstack-swift-deploy/conf/layer.conf
> index 5f7a7fa0..14e82fad 100644
> --- a/meta-openstack-swift-deploy/conf/layer.conf
> +++ b/meta-openstack-swift-deploy/conf/layer.conf
> @@ -7,7 +7,7 @@ BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb
> ${LAYERDIR}/recipes*/*/*.bbappend"
>  BBFILE_COLLECTIONS +=3D "openstack-swift-deploy-layer"
>  BBFILE_PATTERN_openstack-swift-deploy-layer :=3D "^${LAYERDIR}/"
>  BBFILE_PRIORITY_openstack-swift-deploy-layer =3D "6"
> -LAYERSERIES_COMPAT_openstack-swift-deploy-layer =3D "thud warrior"
> +LAYERSERIES_COMPAT_openstack-swift-deploy-layer =3D "wrynose"
>
>  LAYERDEPENDS_openstack-swift-deploy-layer =3D " \
>         core \
> --
> 2.34.1
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000b72680065232b056
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 19, 2026 at 1:41=
=E2=80=AFAM &lt;<a href=3D"mailto:jiaying.song.cn@windriver.com">jiaying.so=
ng.cn@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">From: Jiaying Song &lt;<a href=3D"mailto:jiaying.song.cn=
@windriver.com" target=3D"_blank">jiaying.song.cn@windriver.com</a>&gt;<br>
<br>
Update LAYERSERIES_COMPAT from &#39;thud warrior&#39; to &#39;wrynose&#39; =
in 7<br>
sub-layers to match the main layer and fix compatibility errors<br>
with the current core layer.<br></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">I&#39;ve moved everything from=
 those layers into the main meta-cloud-services layer and left those withou=
t compatibility=C2=A0to show that they are out of date and don&#39;t provid=
e a working openstack environment.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Is there something in those layers you want ? If so, it&#39;s be=
tter to move it rather than to add compatibility.</div><div class=3D"gmail_=
default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">Bruyce</div><br></div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Jiaying Song &lt;<a href=3D"mailto:jiaying.song.cn@windriver=
.com" target=3D"_blank">jiaying.song.cn@windriver.com</a>&gt;<span class=3D=
"gmail_default" style=3D"font-size:small"></span><br>
---<br>
=C2=A0meta-openstack-aio-deploy/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta-openstack-compute-deploy/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 2 +-<br>
=C2=A0meta-openstack-compute-test-config/conf/layer.conf=C2=A0 =C2=A0 | 2 +=
-<br>
=C2=A0meta-openstack-controller-deploy/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =
| 2 +-<br>
=C2=A0meta-openstack-controller-test-config/conf/layer.conf | 2 +-<br>
=C2=A0meta-openstack-qemu/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta-openstack-swift-deploy/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A07 files changed, 7 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/meta-openstack-aio-deploy/conf/layer.conf b/meta-openstack-aio=
-deploy/conf/layer.conf<br>
index 67a1ef01..fde31817 100644<br>
--- a/meta-openstack-aio-deploy/conf/layer.conf<br>
+++ b/meta-openstack-aio-deploy/conf/layer.conf<br>
@@ -7,7 +7,7 @@ BBFILES +=3D &quot;${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/=
recipes*/*/*.bbappend&quot;<br>
=C2=A0BBFILE_COLLECTIONS +=3D &quot;openstack-aio-deploy-layer&quot;<br>
=C2=A0BBFILE_PATTERN_openstack-aio-deploy-layer :=3D &quot;^${LAYERDIR}/&qu=
ot;<br>
=C2=A0BBFILE_PRIORITY_openstack-aio-deploy-layer =3D &quot;6&quot;<br>
-LAYERSERIES_COMPAT_openstack-aio-deploy-layer =3D &quot;thud warrior&quot;=
<br>
+LAYERSERIES_COMPAT_openstack-aio-deploy-layer =3D &quot;wrynose&quot;<br>
<br>
=C2=A0LAYERDEPENDS_openstack-aio-deploy-layer =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 core \<br>
diff --git a/meta-openstack-compute-deploy/conf/layer.conf b/meta-openstack=
-compute-deploy/conf/layer.conf<br>
index 047d006e..4af5ef96 100644<br>
--- a/meta-openstack-compute-deploy/conf/layer.conf<br>
+++ b/meta-openstack-compute-deploy/conf/layer.conf<br>
@@ -7,7 +7,7 @@ BBFILES +=3D &quot;${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/=
recipes*/*/*.bbappend&quot;<br>
=C2=A0BBFILE_COLLECTIONS +=3D &quot;openstack-compute-deploy-layer&quot;<br=
>
=C2=A0BBFILE_PATTERN_openstack-compute-deploy-layer :=3D &quot;^${LAYERDIR}=
/&quot;<br>
=C2=A0BBFILE_PRIORITY_openstack-compute-deploy-layer =3D &quot;6&quot;<br>
-LAYERSERIES_COMPAT_openstack-compute-deploy-layer =3D &quot;thud warrior&q=
uot;<br>
+LAYERSERIES_COMPAT_openstack-compute-deploy-layer =3D &quot;wrynose&quot;<=
br>
<br>
=C2=A0LAYERDEPENDS_openstack-compute-deploy-layer =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 core \<br>
diff --git a/meta-openstack-compute-test-config/conf/layer.conf b/meta-open=
stack-compute-test-config/conf/layer.conf<br>
index 9525e202..90ed8dcb 100644<br>
--- a/meta-openstack-compute-test-config/conf/layer.conf<br>
+++ b/meta-openstack-compute-test-config/conf/layer.conf<br>
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS +=3D &quot;openstack-compute-test-config=
-layer&quot;<br>
=C2=A0BBFILE_PATTERN_openstack-compute-test-config-layer :=3D &quot;^${LAYE=
RDIR}/&quot;<br>
=C2=A0# We want this layer to have higher priority than any other meta-open=
stack layers<br>
=C2=A0BBFILE_PRIORITY_openstack-compute-test-config-layer =3D &quot;100&quo=
t;<br>
-LAYERSERIES_COMPAT_openstack-compute-test-config-layer =3D &quot;thud warr=
ior&quot;<br>
+LAYERSERIES_COMPAT_openstack-compute-test-config-layer =3D &quot;wrynose&q=
uot;<br>
<br>
=C2=A0LAYERDEPENDS_openstack-compute-test-config-layer =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 openstack-compute-deploy-layer \<br>
diff --git a/meta-openstack-controller-deploy/conf/layer.conf b/meta-openst=
ack-controller-deploy/conf/layer.conf<br>
index d1512b8e..a50e400d 100644<br>
--- a/meta-openstack-controller-deploy/conf/layer.conf<br>
+++ b/meta-openstack-controller-deploy/conf/layer.conf<br>
@@ -7,7 +7,7 @@ BBFILES +=3D &quot;${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/=
recipes*/*/*.bbappend&quot;<br>
=C2=A0BBFILE_COLLECTIONS +=3D &quot;openstack-controller-deploy-layer&quot;=
<br>
=C2=A0BBFILE_PATTERN_openstack-controller-deploy-layer :=3D &quot;^${LAYERD=
IR}/&quot;<br>
=C2=A0BBFILE_PRIORITY_openstack-controller-deploy-layer =3D &quot;6&quot;<b=
r>
-LAYERSERIES_COMPAT_openstack-controller-deploy-layer =3D &quot;thud warrio=
r&quot;<br>
+LAYERSERIES_COMPAT_openstack-controller-deploy-layer =3D &quot;wrynose&quo=
t;<br>
<br>
=C2=A0LAYERDEPENDS_openstack-controller-deploy-layer =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 core \<br>
diff --git a/meta-openstack-controller-test-config/conf/layer.conf b/meta-o=
penstack-controller-test-config/conf/layer.conf<br>
index aa8a0ee3..71a9d014 100644<br>
--- a/meta-openstack-controller-test-config/conf/layer.conf<br>
+++ b/meta-openstack-controller-test-config/conf/layer.conf<br>
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS +=3D &quot;openstack-controller-test-con=
fig-layer&quot;<br>
=C2=A0BBFILE_PATTERN_openstack-controller-test-config-layer :=3D &quot;^${L=
AYERDIR}/&quot;<br>
=C2=A0# We want this layer to have higher priority than any other meta-open=
stack layers<br>
=C2=A0BBFILE_PRIORITY_openstack-controller-test-config-layer =3D &quot;100&=
quot;<br>
-LAYERSERIES_COMPAT_openstack-controller-test-config-layer =3D &quot;thud w=
arrior&quot;<br>
+LAYERSERIES_COMPAT_openstack-controller-test-config-layer =3D &quot;wrynos=
e&quot;<br>
<br>
=C2=A0LAYERDEPENDS_openstack-controller-test-config-layer =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 openstack-controller-deploy-layer \<br>
diff --git a/meta-openstack-qemu/conf/layer.conf b/meta-openstack-qemu/conf=
/layer.conf<br>
index bf629d0b..1fbee947 100644<br>
--- a/meta-openstack-qemu/conf/layer.conf<br>
+++ b/meta-openstack-qemu/conf/layer.conf<br>
@@ -7,7 +7,7 @@ BBFILES +=3D &quot;${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/=
recipes*/*/*.bbappend&quot;<br>
=C2=A0BBFILE_COLLECTIONS +=3D &quot;openstack-qemu-layer&quot;<br>
=C2=A0BBFILE_PATTERN_openstack-qemu-layer :=3D &quot;^${LAYERDIR}/&quot;<br=
>
=C2=A0BBFILE_PRIORITY_openstack-qemu-layer =3D &quot;6&quot;<br>
-LAYERSERIES_COMPAT_openstack-qemu-layer =3D &quot;thud warrior&quot;<br>
+LAYERSERIES_COMPAT_openstack-qemu-layer =3D &quot;wrynose&quot;<br>
<br>
=C2=A0LAYERDEPENDS_openstack-qemu-layer =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 core \<br>
diff --git a/meta-openstack-swift-deploy/conf/layer.conf b/meta-openstack-s=
wift-deploy/conf/layer.conf<br>
index 5f7a7fa0..14e82fad 100644<br>
--- a/meta-openstack-swift-deploy/conf/layer.conf<br>
+++ b/meta-openstack-swift-deploy/conf/layer.conf<br>
@@ -7,7 +7,7 @@ BBFILES +=3D &quot;${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/=
recipes*/*/*.bbappend&quot;<br>
=C2=A0BBFILE_COLLECTIONS +=3D &quot;openstack-swift-deploy-layer&quot;<br>
=C2=A0BBFILE_PATTERN_openstack-swift-deploy-layer :=3D &quot;^${LAYERDIR}/&=
quot;<br>
=C2=A0BBFILE_PRIORITY_openstack-swift-deploy-layer =3D &quot;6&quot;<br>
-LAYERSERIES_COMPAT_openstack-swift-deploy-layer =3D &quot;thud warrior&quo=
t;<br>
+LAYERSERIES_COMPAT_openstack-swift-deploy-layer =3D &quot;wrynose&quot;<br=
>
<br>
=C2=A0LAYERDEPENDS_openstack-swift-deploy-layer =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 core \<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000b72680065232b056--

