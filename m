Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF14EEA7952
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 01:40:26 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11293.1770255616788697285
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Feb 2026 17:40:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EeZ109iR;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c0c24d0f4ceso117400a12.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 04 Feb 2026 17:40:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770255616; cv=none;
        d=google.com; s=arc-20240605;
        b=Bqjip59sdNdtxyuzZzoy70mko7iN79zY8+VVW3SE69t8DmWVjuYinbVGxoaJXsJGjI
         H72QatOj5a8MKPk3w7zAjBYB95RGdGFnLpqu1q6cw5mQV6vJdDFy7aFHAtHScP7J9MHH
         Px99OEzU/EwQfh3AtB0vpsp1dkqwHNxKIQGEyOL9Dmy5afOoLACgXoM4yTCoBI8Bd4iP
         5jS/u1H4W0lLXlXoxOH7fUG35COW/zHcuomJbY+wjGcFtN8/LA97bUy6xe4ly1PxfhEp
         7NUK1xVPEC/qPkbJq9pA7nTLP7OJ3HMes/z9gSysUQASJoU+Kdd+GbKeT+M4AQNnS4IB
         Q1Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HGohw8OD4o2zSxmqes98hR6gEUSOJsprXnLxDsk+VE0=;
        fh=8OzFwe3BoLAFjF3lwoA+JeAXcwYo7vt2T40Sp9HkQxI=;
        b=Q3aYBNTRE4/V5DGf+wiQCVWq4D33VxfphTA7TPiMfJ13virZee83TZ7xb/21/fnsdw
         sujW6qWtSTC9Of4QguGnO21BSZymYblHDSXU/RgEHp0xR+jIwXGS7RqlkjKPLqfw9v06
         pwnoeeOWbx+RL3Lf4Ypk1cgrlDtissRFzn927dDnkgCYINZiz/EIg9s138RujIZyCfU8
         mPDtloTHVIstMxmvvyh/x/EWXW5/BvtplcQTg6Q17FgZg0xBZL86s6uB9BSsAMsL2kmO
         MoozZjoslnXXt/3ri0pCK7FU/rjKYLaP+ltzS2gV8cZU2HwkIsPZvCpHxdbf9ZtLdyXj
         mf8Q==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770255616; x=1770860416; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HGohw8OD4o2zSxmqes98hR6gEUSOJsprXnLxDsk+VE0=;
        b=EeZ109iRNz7wGA/INXlVF8BjcP8JaKGw3y+r73njqISwltfi6pEHTcqj1Ntu45x6G/
         LNC2JlKiJd3swy3YNxlPJ4toWdUP5tOs3eY8igM5t9UojiuCuog4QgxRH4HGqXiD4L5W
         acf5qrGu7cRaWEy9L56EBpwG/OB4RdLVVw+gzFqu7KQ5gwRr5po37uJKvS82Nax+jfui
         NGoP7j8yBpR+BlkCM0bscQwyWg7Ljjp0t+Zxvh1W4QoLWXIXclp6btJDB32M2MJmUs/l
         0djnOBPsUPkc7ssWJnM+16GxQIIVqTHU9XF4kVRAWkA7pOri9tE/dphiMBI2nt69qOvq
         AGWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770255616; x=1770860416;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGohw8OD4o2zSxmqes98hR6gEUSOJsprXnLxDsk+VE0=;
        b=NvH1DMX/awL5Ffot4qIGcTh2GC2/Q3uFXbn6w9+N+1tnYVKJ3n3jrId5B+P1fvwnjP
         cHOHlaY/p0IX5fOOY0pd+1bg/p+TmPIzxbDCo7h5cQjuPAGeu6pqeDndAbSbulJRkp7n
         TWRCxR//GAesjWpmHJ0afxQGukD4ifePjC+qtn1iNn7Mp2as4hXpYRfyFE5vSI0anLta
         L+gaBtM4pXl2LuNLm6RluqVcDl/Kfr1XOL2ERoc5245M7DS+c1RgBCw5gy3zv6dA/6ld
         4yVN2YwUZmxnoGMdpRy3qZjdcxaSJjY+uhEDpd2j8+T4E2GCR84IjnoILeqvpAFUTGg8
         fZHA==
X-Gm-Message-State: AOJu0YwnFrkdXVmKZMsk3AUuoP3mdfnudnQ3dy0HaYTh60zGGQQ6EA/j
	jE9/hEneTKJCOn4suf3UNXKdz1G4iwtA6bVd8+vvDPucsfBYp8SKEifdjkA5aGCcHmnRzLppt/3
	kZpCnVKtsy40jjDzfAIt+6VIfg44zJQH0qK5d
X-Gm-Gg: AZuq6aIv+jkUYYRYua4UuKz8gwnMYRkBoGW3FhoMmXjoIm8guhnnKGNy4ou3vqHxkaG
	QoNdcCy+1SRzXvlN3YyejFAKS49hnnUzZczHaeMm2I4aGqkpgTd874iY8uARvghvWjG2vWidmMc
	Adte3PgV6raZ3UVCZGMbPEJvNQBX+e383YSt9uCCdM/Qw4IEE2rUX5XwGVYrBkQ0Iuf9MXbRiOt
	TTD5ycMsZy56KrJbCcN3vkQEVG+zkD5KNtmg7S5lGaqRMaW00NKugJ4riZBxM6UMMJ7NfcwGoul
	M6yJU87tJcGAkP2rBONUZH1iSjtt
X-Received: by 2002:a05:6a21:4c0e:b0:38b:e7a3:9d17 with SMTP id
 adf61e73a8af0-3937241c666mr5119394637.49.1770255615925; Wed, 04 Feb 2026
 17:40:15 -0800 (PST)
MIME-Version: 1.0
References: <20260129224041.2242384-1-ricardo.salveti@oss.qualcomm.com>
In-Reply-To: <20260129224041.2242384-1-ricardo.salveti@oss.qualcomm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 4 Feb 2026 20:40:04 -0500
X-Gm-Features: AZwV_QgGY2087olL8DKE2jgdlED5bWc2LV88Mg5yIfmvgWEy8vEyqKWFBrjQ2tw
Message-ID: <CADkTA4POuLMALaV3RTVY0snGYqRMMGcxBxL0qndDvMbTHLL6pQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] lxc: restore DEBUG_PREFIX_MAP in
 TARGET_LDFLAGS for LTO reproducibility
To: ricardo.salveti@oss.qualcomm.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000002621f4064a09c14b"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Feb 2026 01:40:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9558

--0000000000002621f4064a09c14b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Ricardo,

I've been following the OECore discussions on LTO and the prefix maps.

If I'm following correctly, we still need this.

I'm just about to push my container-cross-install baseline, but will get to
this
in the next few days.

Bruce

On Thu, Jan 29, 2026 at 5:40=E2=80=AFPM Ricardo Salveti via lists.yoctoproj=
ect.org
<ricardo.salveti=3Doss.qualcomm.com@lists.yoctoproject.org> wrote:

> oe-core [1] removed DEBUG_PREFIX_MAP from TARGET_LDFLAGS to avoid passing
> prefix-map options via the linker flags. This is fine for most projects
> since DEBUG_PREFIX_MAP is also provided via CFLAGS at configure time.
>
> However, lxc enables LTO by default, which causes link-time code generati=
on
> to (re)emit debug information during the link step. Without
> DEBUG_PREFIX_MAP
> on the link command line, TMPDIR/WORKDIR paths can leak into DWARF,
> triggering the buildpaths QA check and breaking reproducibility.
>
> Append DEBUG_PREFIX_MAP back to TARGET_LDFLAGS for lxc to ensure prefix-m=
ap
> options are visible during LTO link-time compilation.
>
> [1]
>
> https://git.openembedded.org/openembedded-core/commit/?id=3D1797741aad02b=
8bf429fac4b81e30cdda64b5448
>
> Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
> ---
>  recipes-containers/lxc/lxc_git.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/
> lxc_git.bb
> index 542134db..04db2ac0 100644
> --- a/recipes-containers/lxc/lxc_git.bb
> +++ b/recipes-containers/lxc/lxc_git.bb
> @@ -63,6 +63,9 @@ EXTRA_OEMESON +=3D "${PTEST_CONF}
> -Ddistrosysconfdir=3D${sysconfdir}/default"
>  # No meson equivalent for these yet
>  # EXTRA_OECONF +=3D "--enable-log-src-basename --disable-werror"
>
> +# LTO is enabled by default, expose prefix-map options to the linker for
> reproducibility
> +TARGET_LDFLAGS:append =3D " ${DEBUG_PREFIX_MAP}"
> +
>  PACKAGECONFIG ??=3D "templates \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)=
}
> \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)=
}
> \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9553):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9553
> Mute This Topic: https://lists.yoctoproject.org/mt/117535700/1050810
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

--0000000000002621f4064a09c14b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Tha=
nks Ricardo,</div><div class=3D"gmail_default" style=3D"font-size:small"><b=
r></div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;ve bee=
n following the OECore discussions on LTO and the prefix maps.</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gma=
il_default" style=3D"font-size:small">If I&#39;m following correctly, we st=
ill need this.</div><div class=3D"gmail_default" style=3D"font-size:small">=
<br></div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;m ju=
st about to push my container-cross-install baseline, but will get to this<=
/div><div class=3D"gmail_default" style=3D"font-size:small">in the next few=
 days.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><=
br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Jan 29, 2026 at 5:40=E2=80=AFPM Ricardo Salveti via=
 <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;r=
icardo.salveti=3D<a href=3D"mailto:oss.qualcomm.com@lists.yoctoproject.org"=
>oss.qualcomm.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">oe-core [1] removed DEBUG_PREFIX_MA=
P from TARGET_LDFLAGS to avoid passing<br>
prefix-map options via the linker flags. This is fine for most projects<br>
since DEBUG_PREFIX_MAP is also provided via CFLAGS at configure time.<br>
<br>
However, lxc enables LTO by default, which causes link-time code generation=
<br>
to (re)emit debug information during the link step. Without DEBUG_PREFIX_MA=
P<br>
on the link command line, TMPDIR/WORKDIR paths can leak into DWARF,<br>
triggering the buildpaths QA check and breaking reproducibility.<br>
<br>
Append DEBUG_PREFIX_MAP back to TARGET_LDFLAGS for lxc to ensure prefix-map=
<br>
options are visible during LTO link-time compilation.<br>
<br>
[1]<br>
<a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3D1797=
741aad02b8bf429fac4b81e30cdda64b5448" rel=3D"noreferrer" target=3D"_blank">=
https://git.openembedded.org/openembedded-core/commit/?id=3D1797741aad02b8b=
f429fac4b81e30cdda64b5448</a><br>
<br>
Signed-off-by: Ricardo Salveti &lt;<a href=3D"mailto:ricardo.salveti@oss.qu=
alcomm.com" target=3D"_blank">ricardo.salveti@oss.qualcomm.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"noreferre=
r" target=3D"_blank">lxc_git.bb</a> | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"no=
referrer" target=3D"_blank">lxc_git.bb</a> b/recipes-containers/lxc/<a href=
=3D"http://lxc_git.bb" rel=3D"noreferrer" target=3D"_blank">lxc_git.bb</a><=
br>
index 542134db..04db2ac0 100644<br>
--- a/recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"noreferre=
r" target=3D"_blank">lxc_git.bb</a><br>
+++ b/recipes-containers/lxc/<a href=3D"http://lxc_git.bb" rel=3D"noreferre=
r" target=3D"_blank">lxc_git.bb</a><br>
@@ -63,6 +63,9 @@ EXTRA_OEMESON +=3D &quot;${PTEST_CONF} -Ddistrosysconfdir=
=3D${sysconfdir}/default&quot;<br>
=C2=A0# No meson equivalent for these yet<br>
=C2=A0# EXTRA_OECONF +=3D &quot;--enable-log-src-basename --disable-werror&=
quot;<br>
<br>
+# LTO is enabled by default, expose prefix-map options to the linker for r=
eproducibility<br>
+TARGET_LDFLAGS:append =3D &quot; ${DEBUG_PREFIX_MAP}&quot;<br>
+<br>
=C2=A0PACKAGECONFIG ??=3D &quot;templates \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;sy=
stemd&#39;, &#39;systemd&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;se=
linux&#39;, &#39;selinux&#39;, &#39;&#39;, d)} \<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9553): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9553" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9553</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/117535700/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/117535700/1050810</a><br>
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

--0000000000002621f4064a09c14b--

