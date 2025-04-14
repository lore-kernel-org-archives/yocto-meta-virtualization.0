Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C4CCC369A2
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 14:11:53 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.50452.1744639911023134206
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Apr 2025 07:11:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mnK6Wh/B;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b00e3c87713so3624367a12.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Apr 2025 07:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744639910; x=1745244710; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VmMjmBPXEg7VhmbhEF5l9yxmtiNGQ6vVMVeYJQPysJ8=;
        b=mnK6Wh/BtToNZDHk9mXjrjcOzFiXZrAOFg+T4wIw9tc9aXNItWnwGtPTY12HjOpn+9
         KpJasTvEMuDHgBv9sbbOGonTwFFRiETJeROjyba73X5EE0YCbkikGmop9tXTg6JM7bVk
         l51A8obyxgVBrjlFxa6fNlJqC9Y3KorLKmiTqL9baVvRd31Nd7Tpxm59xtHSV5eLubnu
         vw0UxThCqH/4A2jOIsVdGt2fCl/s2clbnLRRE0R1VL3MxeQXXsXS6329ni8QbrAqam/J
         xlEtVycCmOYX1eHIZwo03LR4FcSs1EvyuMos5TTHr2WgPPYITjJk6XtGS152xLN04Dzq
         23Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744639910; x=1745244710;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VmMjmBPXEg7VhmbhEF5l9yxmtiNGQ6vVMVeYJQPysJ8=;
        b=Pco/oT/PjOizIr1SPU2DgPu3veEPXR+i2A6+sH/zdX8+3FKMRrUXONNLi21TaoRr7y
         4rf3eBk8xHg5eIQlzmBUToRqcSvLIWeLCjZNY+x8sVGXOrZ/51zZWoSPqVZmMqwVmay8
         ziJpG6x5gCjujox1T88hkEHh/tvNIyYbez6IA40wSsE9Itpf4cgXhV/vd5j46H0LcXdu
         aZ5YZv0rfZIQhOb03rrvxvblJwYXTW9s2qJ9mwGTGosUSOWc6oLWUcH9FlgF9l0d4rFZ
         GgDCY9rb1XhS/aNu+RYrWaeIUeU++sKRy089UqfGc3DsNObBRr2WaVtfagyh4Mw/C/zA
         fGfw==
X-Gm-Message-State: AOJu0Yy03Z57AosIt0LIcxhDPAm0+BNdVe/vAnUw2MIB0hBBOpqy4q99
	zN8fMM8NoH2CF6f33hhQcriGRxmvpIHu9FvsdJW0qreIK+f4Lan0BdfIGLmXQG611ihbc1n4n8S
	tuObE+Qs3WbMysBY3fsgDBNtef74=
X-Gm-Gg: ASbGncuL0aEsLF4oOORwE0Z7uojxdIMGyQXk1pZu5+OZ3TqNXJppjDhROeIiq6WAmiw
	7bUFBM7Ln83+ke6QEFliHSvD5+mYuXyd116tCTw4rZxoTeJSo5+GAaBmonYO6CGzyUS2Hizq18Q
	s6BsueigKUCjkfs08glfc1
X-Google-Smtp-Source: AGHT+IHw9KuYvt0wOIRpB1gxdAJ7JQ/k+pFEl8ZHdlo43XCJ0vldDzdeaZw2clF5Kf1UX0VAvIt1hHm1L34/o4bO9Fg=
X-Received: by 2002:a17:90b:5643:b0:2f2:a664:df1a with SMTP id
 98e67ed59e1d1-3082362897dmr18322301a91.2.1744639909991; Mon, 14 Apr 2025
 07:11:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250414100358.2940529-1-Qi.Chen@windriver.com>
In-Reply-To: <20250414100358.2940529-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 14 Apr 2025 10:11:43 -0400
X-Gm-Features: ATxdqUEEpmG4uBv2PiqglyFXuf95lrXrj7TVYp2q4P6YM7Kd8t39aTVJkzHUoA8
Message-ID: <CADkTA4O=qumMgBDckujDy5QfZit3j==Mxnn4ngYn15u1o7rBpQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/3] podman: update to 5.4.2
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000189b0d0632bda2af"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Apr 2025 14:11:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9222

--000000000000189b0d0632bda2af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm not taking any package upgrades now.

When I do my package update cycle around M1.5 of the next release,
everything will be bumped then.

Bruce

On Mon, Apr 14, 2025 at 6:04=E2=80=AFAM Chen Qi via lists.yoctoproject.org =
<Qi.Chen=3D
windriver.com@lists.yoctoproject.org> wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
>
> Upgrade podman from 5.4.1+ to 5.4.2.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/podman/podman_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/podman/podman_git.bb
> b/recipes-containers/podman/podman_git.bb
> index 46c6c969..764c0af8 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -16,7 +16,7 @@ DEPENDS =3D " \
>      gettext-native \
>  "
>
> -SRCREV =3D "227df90eb7c021097c9ba5f8000c83648a598028"
> +SRCREV =3D "be85287fcf4590961614ee37be65eeb315e5d9ff"
>  SRC_URI =3D " \
>      git://
> github.com/containers/libpod.git;branch=3Dv5.4;protocol=3Dhttps;destsuffi=
x=3D${GO_SRCURI_DESTSUFFIX}
> <http://github.com/containers/libpod.git;branch=3Dv5.4;protocol=3Dhttps;d=
estsuffix=3D$%7BGO_SRCURI_DESTSUFFIX%7D>
> \
>      ${@bb.utils.contains('PACKAGECONFIG', 'rootless',
> 'file://50-podman-rootless.conf', '', d)} \
> @@ -30,7 +30,7 @@ GO_IMPORT =3D "import"
>
>  S =3D "${WORKDIR}/git"
>
> -PV =3D "v5.4.1"
> +PV =3D "v5.4.2"
>
>  CVE_STATUS[CVE-2022-2989] =3D "fixed-version: fixed since v4.3.0"
>  CVE_STATUS[CVE-2023-0778] =3D "fixed-version: fixed since v4.5.0"
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9219):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9219
> Mute This Topic: https://lists.yoctoproject.org/mt/112254335/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000189b0d0632bda2af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">I&#=
39;m not taking any package upgrades now.</div><div class=3D"gmail_default"=
 style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"=
font-size:small">When I do my package update cycle around M1.5 of the next =
release, everything will be bumped then.</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small">Bruce</div></div><br><div class=3D"gmail_quote gmail_quote_=
container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 14, 2025 at 6:=
04=E2=80=AFAM Chen Qi via <a href=3D"http://lists.yoctoproject.org">lists.y=
octoproject.org</a> &lt;Qi.Chen=3D<a href=3D"mailto:windriver.com@lists.yoc=
toproject.org">windriver.com@lists.yoctoproject.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">From: Chen Qi &lt;<a hre=
f=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com<=
/a>&gt;<br>
<br>
Upgrade podman from 5.4.1+ to 5.4.2.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">podman_git.bb</a> | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=
=3D"noreferrer" target=3D"_blank">podman_git.bb</a> b/recipes-containers/po=
dman/<a href=3D"http://podman_git.bb" rel=3D"noreferrer" target=3D"_blank">=
podman_git.bb</a><br>
index 46c6c969..764c0af8 100644<br>
--- a/recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">podman_git.bb</a><br>
+++ b/recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">podman_git.bb</a><br>
@@ -16,7 +16,7 @@ DEPENDS =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0gettext-native \<br>
=C2=A0&quot;<br>
<br>
-SRCREV =3D &quot;227df90eb7c021097c9ba5f8000c83648a598028&quot;<br>
+SRCREV =3D &quot;be85287fcf4590961614ee37be65eeb315e5d9ff&quot;<br>
=C2=A0SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/containers/libpod.gi=
t;branch=3Dv5.4;protocol=3Dhttps;destsuffix=3D$%7BGO_SRCURI_DESTSUFFIX%7D" =
rel=3D"noreferrer" target=3D"_blank">github.com/containers/libpod.git;branc=
h=3Dv5.4;protocol=3Dhttps;destsuffix=3D${GO_SRCURI_DESTSUFFIX}</a> \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;root=
less&#39;, &#39;file://50-podman-rootless.conf&#39;, &#39;&#39;, d)} \<br>
@@ -30,7 +30,7 @@ GO_IMPORT =3D &quot;import&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-PV =3D &quot;v5.4.1&quot;<br>
+PV =3D &quot;v5.4.2&quot;<br>
<br>
=C2=A0CVE_STATUS[CVE-2022-2989] =3D &quot;fixed-version: fixed since v4.3.0=
&quot;<br>
=C2=A0CVE_STATUS[CVE-2023-0778] =3D &quot;fixed-version: fixed since v4.5.0=
&quot;<br>
-- <br>
2.49.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9219): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9219" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9219</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/112254335/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/112254335/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div>

--000000000000189b0d0632bda2af--

