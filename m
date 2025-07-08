Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B41C8303C
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 13:23:04 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.18823.1751980979345640474
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 08 Jul 2025 06:22:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A4h36g27;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b390d09e957so2647266a12.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 08 Jul 2025 06:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751980979; x=1752585779; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iEMyw1HJAW/L7Xq/8sDwvGEsQ+crHfo9Ei+zEordrkE=;
        b=A4h36g27HJrw8poYz4B0p4DSonmcRS6fEvZ/0X1fWjK9o+dFbbqxzXowxfDk14mgpF
         TfH3E5XKzZMzmRZV2ok9vjCKqwrwSijTYeK8qp0zJKo6RdSPmFwPW+LQsfDlI9xolZ9s
         0ESRvT6GdU/ZkpIlkoXo8vt/CqkWw4bNRji//K4koK8KsHoxuiRQr2kXVA5dwC6irQXB
         71AlwUlqVALdYVCOSmmkTkgPQkPtuUaI4JygT5DmPQZ3CTPtU7DIxueKOgatlrAch0fm
         xSmG48jrY4ZvvL6LBUEoKozp7055p1KoEWoqeA97nIs2ldaUs+t78CDt0iiFzswog74Y
         d+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751980979; x=1752585779;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iEMyw1HJAW/L7Xq/8sDwvGEsQ+crHfo9Ei+zEordrkE=;
        b=Qz/a447CfH8Y8yuEk4trjdz6xM8KdsS8P/M1Pz4qkvwsReB20nFnKT+zG9/113N5n2
         xBokKCfLN1Qs8hn8Y8k5KP0hBKJSledPbohvS9lI3D3eXD/UgmxRhJFM2T1chh05H3uc
         P6zK7WX/0sX2VPWWWBO5AqAya6EOrQhnnGUCyPpkOLSImW5oBvH07gvKaOLuUh1GpejI
         uiHOj5wz6daoM84e+HkcDjSCNmQUr33KDwA/jJTLIJ13ww8SZsft9YCypwAuj8VT0/EC
         GMlu21Uy16A5k+FMj0NjI3tateoB/LLWVfVBhelnWV9/R+v0RwtrnrCUh1HAiP9MYezo
         Hz6w==
X-Gm-Message-State: AOJu0YxYkkjJMNgn2xkdgRMnJRBvLopUudNMEb1e8Xyj1bGOZA34luC1
	oC/cR8EdnGtITkJKVBMg3lOy9Nizo4HOd1XTegGkW/51HQUGQA7vgkpzGSQHOZv8+lp/Q7+JwYz
	l+8W38yj4XdIzLXjgENboQz7h0kupk8DspEYL
X-Gm-Gg: ASbGncvP/RqQ7RFjj+3VVV2pj/X1shhAeYixpFlCAZFXINoceMGezQE8OCCubyX5spD
	QfjfV9QL2UHnlqjM/xlRHCMD00cf7b5sXCtVlreB4djhq7ZFQlTaLNy7q071qIrRXBWuWLnvBLJ
	ucOV80FpfnmQLlzknPWtqRvHJZCDlxQ+WLXuaWIOWBlqVE
X-Google-Smtp-Source: AGHT+IFO7soHj2CUhhVd9wrLFjFYp0NfAjV5bWK3kbe9bDTO1ZTxOR1JKZ6AL38erUNQ5UMwewWcRO1So21LZvYm/9U=
X-Received: by 2002:a17:90b:51cc:b0:315:6f2b:ce5a with SMTP id
 98e67ed59e1d1-31aadd24076mr26780431a91.11.1751980978464; Tue, 08 Jul 2025
 06:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250708131302.3871609-1-martin.jansa@gmail.com>
In-Reply-To: <20250708131302.3871609-1-martin.jansa@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 8 Jul 2025 09:22:45 -0400
X-Gm-Features: Ac12FXwD6Ktjs3CD7fNiY3tomk6yw7iqkQtoZF3G8ijLVPcU3w1xr5tfCWyJvuM
Message-ID: <CADkTA4MLSZNpyGE0-_U09DPMZUVb=rxxGT6Zdc9mwUmRJPZ6fA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] xvisor: upgrade to 3.0.2
To: martin.jansa@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000dfea0606396adbc7"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 08 Jul 2025 13:23:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9302

--000000000000dfea0606396adbc7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 8, 2025 at 9:13=E2=80=AFAM Martin Jansa via lists.yoctoproject.=
org
<martin.jansa=3Dgmail.com@lists.yoctoproject.org> wrote:

> From: Martin Jansa <martin.jansa@gmail.com>
>
> * the old SRCREV 6b23764a1439f9d08b2ed2f363da522460d8a22b doesn't exist i=
n
> any branch
>   upgrade to latest 3.0.2 release from Jan 1st 2023
>

I was looking at a similar upgrade just a day or so ago.

I can take this patch, but I'll re-work it a bit, as unlike some others, I
really don't
like bouncing recipe names to chase versions.

So I'd keep this with PV in the recipe and _git as the recipe name.

Actually, I'll just fire off my script and do it, and add your name to the
commit log
as prompting me to finish the job.

Bruce



>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  recipes-extended/xvisor/{xvisor_git.bb =3D> xvisor_0.3.2.bb} | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>  rename recipes-extended/xvisor/{xvisor_git.bb =3D> xvisor_0.3.2.bb} (92%=
)
>
> diff --git a/recipes-extended/xvisor/xvisor_git.bb
> b/recipes-extended/xvisor/xvisor_0.3.2.bb
> similarity index 92%
> rename from recipes-extended/xvisor/xvisor_git.bb
> rename to recipes-extended/xvisor/xvisor_0.3.2.bb
> index 1d6e79f9..e33a9533 100644
> --- a/recipes-extended/xvisor/xvisor_git.bb
> +++ b/recipes-extended/xvisor/xvisor_0.3.2.bb
> @@ -8,11 +8,9 @@ require xvisor-configs.inc
>
>  inherit autotools-brokensep
>
> -PV =3D "0.3.0+git"
> -
>  # This version support the RISC-V v0.5.0 Hypervisor extensions
> -SRCREV =3D "6b23764a1439f9d08b2ed2f363da522460d8a22b"
> -SRC_URI =3D "git://
> github.com/avpatel/xvisor-next.git;branch=3Dmaster;protocol=3Dhttps \
> +SRCREV =3D "0ff131498a26bd1c97a867ef3ccfbc23873209f1"
> +SRC_URI =3D "git://
> github.com/xvisor/xvisor.git;branch=3Dmaster;protocol=3Dhttps \
>      file://0001-TESTS-Don-t-specify-mabi-or-march-for-RISC-V.patch \
>      file://0001-build-use-usr-bin-env-for-python-scripts.patch \
>  "
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9301):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9301
> Mute This Topic: https://lists.yoctoproject.org/mt/114045851/1050810
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

--000000000000dfea0606396adbc7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 8, 2025 at 9:13=
=E2=80=AFAM Martin Jansa via <a href=3D"http://lists.yoctoproject.org">list=
s.yoctoproject.org</a> &lt;martin.jansa=3D<a href=3D"mailto:gmail.com@lists=
.yoctoproject.org">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">From: Martin Jansa &lt;<=
a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gma=
il.com</a>&gt;<br>
<br>
* the old SRCREV 6b23764a1439f9d08b2ed2f363da522460d8a22b doesn&#39;t exist=
 in any branch<br>
=C2=A0 upgrade to latest 3.0.2 release from Jan 1st 2023<br></blockquote><d=
iv><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">I =
was looking at a similar upgrade just a day or so ago.</div><div class=3D"g=
mail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">I can take this patch, but I&#39;ll re-work i=
t a bit, as unlike some others, I really don&#39;t</div><div class=3D"gmail=
_default" style=3D"font-size:small">like bouncing recipe names to chase ver=
sions.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">So I&#39;d keep th=
is with PV in the recipe and _git as the recipe name.</div><div class=3D"gm=
ail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">Actually, I&#39;ll just fire off my script and=
 do it, and add your name to the commit log</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">as prompting me to finish the job.</div><div c=
lass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" t=
arget=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/xvisor/{<a href=3D"http://xvisor_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">xvisor_git.bb</a> =3D&gt; <a href=3D"http://xviso=
r_0.3.2.bb" rel=3D"noreferrer" target=3D"_blank">xvisor_0.3.2.bb</a>} | 6 +=
+----<br>
=C2=A01 file changed, 2 insertions(+), 4 deletions(-)<br>
=C2=A0rename recipes-extended/xvisor/{<a href=3D"http://xvisor_git.bb" rel=
=3D"noreferrer" target=3D"_blank">xvisor_git.bb</a> =3D&gt; <a href=3D"http=
://xvisor_0.3.2.bb" rel=3D"noreferrer" target=3D"_blank">xvisor_0.3.2.bb</a=
>} (92%)<br>
<br>
diff --git a/recipes-extended/xvisor/<a href=3D"http://xvisor_git.bb" rel=
=3D"noreferrer" target=3D"_blank">xvisor_git.bb</a> b/recipes-extended/xvis=
or/<a href=3D"http://xvisor_0.3.2.bb" rel=3D"noreferrer" target=3D"_blank">=
xvisor_0.3.2.bb</a><br>
similarity index 92%<br>
rename from recipes-extended/xvisor/<a href=3D"http://xvisor_git.bb" rel=3D=
"noreferrer" target=3D"_blank">xvisor_git.bb</a><br>
rename to recipes-extended/xvisor/<a href=3D"http://xvisor_0.3.2.bb" rel=3D=
"noreferrer" target=3D"_blank">xvisor_0.3.2.bb</a><br>
index 1d6e79f9..e33a9533 100644<br>
--- a/recipes-extended/xvisor/<a href=3D"http://xvisor_git.bb" rel=3D"noref=
errer" target=3D"_blank">xvisor_git.bb</a><br>
+++ b/recipes-extended/xvisor/<a href=3D"http://xvisor_0.3.2.bb" rel=3D"nor=
eferrer" target=3D"_blank">xvisor_0.3.2.bb</a><br>
@@ -8,11 +8,9 @@ require xvisor-configs.inc<br>
<br>
=C2=A0inherit autotools-brokensep<br>
<br>
-PV =3D &quot;0.3.0+git&quot;<br>
-<br>
=C2=A0# This version support the RISC-V v0.5.0 Hypervisor extensions<br>
-SRCREV =3D &quot;6b23764a1439f9d08b2ed2f363da522460d8a22b&quot;<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/avpatel/xvisor-next.g=
it;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">g=
ithub.com/avpatel/xvisor-next.git;branch=3Dmaster;protocol=3Dhttps</a> \<br=
>
+SRCREV =3D &quot;0ff131498a26bd1c97a867ef3ccfbc23873209f1&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/xvisor/xvisor.git;bra=
nch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.=
com/xvisor/xvisor.git;branch=3Dmaster;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-TESTS-Don-t-specify-mabi-or-march-for-RISC-=
V.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-build-use-usr-bin-env-for-python-scripts.pa=
tch \<br>
=C2=A0&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9301): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9301" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9301</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/114045851/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/114045851/1050810</a><br>
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
rek II<br><br></div></div>

--000000000000dfea0606396adbc7--

