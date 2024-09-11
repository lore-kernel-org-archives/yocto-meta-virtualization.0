Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C0EEE0206
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 17:35:45 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.27883.1726076143069578309
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 Sep 2024 10:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eJ97rf6N;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2d86f713557so38115a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Sep 2024 10:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726076142; x=1726680942; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PHwpmKrohNA773boABt1DQN2/D6jlQaQYvKojQNPHJ0=;
        b=eJ97rf6NbMrFYR/cWb7WSC2mDGwuePoahCqL0wJQIwl2Wds0T30IOXq135fTYvtrHa
         hf8g4/uQ4Ul0xRkZEkNVM3R27h1Je7yWMUovtAbV8GGnpKrAnuelgsXIi6Ajx6aXXkXg
         tLAJnXCJDLSMLX2sFd8amCCmjANjd7MnOHYBxLtjXN2513UluM5ZtZU33b47AG99I+2i
         eD2Gd2MA+EOm4r+ZzVNjfB/UgUOM+cdJl0umQH5HnL5l5Q2pTcgemRlezhnJsS8v0WL9
         yjc9w14//KHYtmO8tVykHcPMeQIeNewZp6UK4vVWdKZdFvnxSgCzL9CVEuG1kCZJ7Hnw
         735g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726076142; x=1726680942;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHwpmKrohNA773boABt1DQN2/D6jlQaQYvKojQNPHJ0=;
        b=FfawBlvf1/vMKoLExoB9dVugD7yx4+cDkbuIb/nhUAun5TsslttngfMvArtz06p9Xj
         YsfgU0H4YxEcLcaZDfyxn2kOolKQ2PLcaWStUOG14jK9U0OoBadCdd9s1tlIiaaabLyG
         MirkECBz2oKY1MXF7R2VdQzWgPmq53Yk3843hrkLM/YFjGveamWB4spfw5FStWwNP1Kb
         RzZU+D0QnVP+nr5r1Yocy/9iJ/pwnUEsOtUGGw5Ic85McIi9Y09XzLo4Js35iUpdQ7uM
         TQqyrn/43vL0NojH/UF3ubYhLvTy2I4YRUwaYRXkgGnDMJKN+a3P5yl3EWs/WXLX63gZ
         Ckvg==
X-Gm-Message-State: AOJu0Yw0yqjpgrDASOe34KUjqfDFfceHJS6oN5ey1owF/1jDOu9yaEAP
	sB2SAEVr9n0ODfZG3t9I40e+AR1m5eYdTtYqTFXprmLOLeQlmJOA8BICj1kC2XZOI6ecdZ8Ml/F
	TGTi7mrfr8kPmipucrXiUJSaxsjY=
X-Google-Smtp-Source: AGHT+IHqN1zTTqrDgxkUtpnxUen1Q1/ZvP/99yJHkaF0FLZJuFu/kAgKsaqwO1txkh4rVQ5sOZYNzneVhf6MDaqJ7MA=
X-Received: by 2002:a17:90b:1d92:b0:2d3:c0b9:7c2a with SMTP id
 98e67ed59e1d1-2dad5013d4cmr23219956a91.20.1726076142209; Wed, 11 Sep 2024
 10:35:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240905122652.793160-1-johnvicky.vykuntapu@amd.com>
In-Reply-To: <20240905122652.793160-1-johnvicky.vykuntapu@amd.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 11 Sep 2024 13:35:30 -0400
Message-ID: <CADkTA4N+L=guRkgV+GE5wCj8gXCGYeG9qgusRh+7tLZu9JXAJw@mail.gmail.com>
Subject: Re: [meta-virtualization][2024.2][PATCH v2] u-boot-xlnx-scr.bbappend:
 Enable xen boot script using variable
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: meta-virtualization@lists.yoctoproject.org, mark.hatle@amd.com
Content-Type: multipart/alternative; boundary="0000000000004fd1fb0621db6bf3"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Sep 2024 17:35:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8884

--0000000000004fd1fb0621db6bf3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 1:21=E2=80=AFPM Mark Hatle <mark.hatle@kernel.crash=
ing.org>
wrote:

> From: John Vicky Vykuntapu <johnvicky.vykuntapu@amd.com>
>
> Xen related boot script offset was override from
> meta-virtualization for non xen builds.
>
> ERROR: RD image overlaps OS image (OS=3D0xe00000..0x2610000)
>
> Add to include xen boot script only if ENABLE_XEN_UBOOT_SCR variable
> set from the configuration file and xen enabled in DISTRO_FEATURES to
> avoid override.
>
> Signed-off-by: John Vicky Vykuntapu <johnvicky.vykuntapu@amd.com>
> Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> ---
> (v1 was directly sent to Bruce)
>
> Update in v2: Added "and" condition between xen distro enable and
> the ENABLE_XEN_UBOOT_SCR variable is set from the configuration file
>

Is this for master ? or master + a -stable branch ?

Bruce



> ---
>  .../xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend      | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git
> a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
> b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
> index ae847cb..819a0c6 100644
> --- a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
> +++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
> @@ -1,2 +1,4 @@
> -# Include xen-boot-cmd.inc only if xen distro features is enabled.
> -include ${@bb.utils.contains('DISTRO_FEATURES', 'xen',
> 'xen-boot-cmd.inc', '', d)}
> +# Include xen-boot-cmd.inc only if ENABLE_XEN_UBOOT_SCR is set from
> configuration
> +# file and xen enabled in DISTRO_FEATURES.
> +ENABLE_XEN_UBOOT_SCR ?=3D ""
> +include ${@'xen-boot-cmd.inc' if d.getVar('ENABLE_XEN_UBOOT_SCR') =3D=3D=
 '1'
> and bb.utils.contains('DISTRO_FEATURES', 'xen', true, false, d) else ''}
> --
> 2.44.1
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000004fd1fb0621db6bf3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Wed, Sep 11, 2024 at 1:21=E2=80=AFPM Mark Hatle &lt;<a hre=
f=3D"mailto:mark.hatle@kernel.crashing.org">mark.hatle@kernel.crashing.org<=
/a>&gt; wrote:<br></div></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">From: John Vicky Vykuntapu &lt;<a href=3D"=
mailto:johnvicky.vykuntapu@amd.com" target=3D"_blank">johnvicky.vykuntapu@a=
md.com</a>&gt;<br>
<br>
Xen related boot script offset was override from<br>
meta-virtualization for non xen builds.<br>
<br>
ERROR: RD image overlaps OS image (OS=3D0xe00000..0x2610000)<br>
<br>
Add to include xen boot script only if ENABLE_XEN_UBOOT_SCR variable<br>
set from the configuration file and xen enabled in DISTRO_FEATURES to<br>
avoid override.<br>
<br>
Signed-off-by: John Vicky Vykuntapu &lt;<a href=3D"mailto:johnvicky.vykunta=
pu@amd.com" target=3D"_blank">johnvicky.vykuntapu@amd.com</a>&gt;<br>
Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@amd.com" target=
=3D"_blank">mark.hatle@amd.com</a>&gt;<br>
---<br>
(v1 was directly sent to Bruce)<br>
<br>
Update in v2: Added &quot;and&quot; condition between xen distro enable and=
<br>
the ENABLE_XEN_UBOOT_SCR variable is set from the configuration file<br>
</blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font=
-size:small">Is this for master ? or master=C2=A0+ a -stable branch ?</div>=
<div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">---<br>
=C2=A0.../xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend=C2=A0 =C2=A0 =
=C2=A0 | 6 ++++--<br>
=C2=A01 file changed, 4 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbapp=
end b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend<br>
index ae847cb..819a0c6 100644<br>
--- a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend<br>
+++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend<br>
@@ -1,2 +1,4 @@<br>
-# Include xen-boot-cmd.inc only if xen distro features is enabled.<br>
-include ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;xen&#39;, &#3=
9;xen-boot-cmd.inc&#39;, &#39;&#39;, d)}<br>
+# Include xen-boot-cmd.inc only if ENABLE_XEN_UBOOT_SCR is set from config=
uration<br>
+# file and xen enabled in DISTRO_FEATURES.<br>
+ENABLE_XEN_UBOOT_SCR ?=3D &quot;&quot;<br>
+include ${@&#39;xen-boot-cmd.inc&#39; if d.getVar(&#39;ENABLE_XEN_UBOOT_SC=
R&#39;) =3D=3D &#39;1&#39; and bb.utils.contains(&#39;DISTRO_FEATURES&#39;,=
 &#39;xen&#39;, true, false, d) else &#39;&#39;}<br>
-- <br>
2.44.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--0000000000004fd1fb0621db6bf3--

