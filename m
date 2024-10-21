Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C4A6D3C93C
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 03:20:35 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.37987.1729480831398581074
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 20 Oct 2024 20:20:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TaxXfaAC;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-656d8b346d2so2550730a12.2
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 20 Oct 2024 20:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729480831; x=1730085631; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2CRbQRChEcCTJjS3HdjVR4yTMVRjivHOQ2PiBx48n0o=;
        b=TaxXfaACJqWwv8/LxAEjtiow2WpguaxLzxAZoZGd1Zg4nNyhcc+6JYko7PCL1Gwr50
         5hS4w/OzggnpbwZQvfmiAfnx7j+Wfm6Y8J1g5Dzop8dMooYb0+YJ7zO4JK2m5KTRwbPe
         nBDu+QIxVzJp6X9fbJg0VWgWmtig5d7FhduN21HcIBfwfeKaNSom0rUKz6uPXX+kT0RI
         BX15/QbLA2bwJwCvhHT1gmfVcXrc7A0BDnT0VDj7mkMcvgx0T1SNwhKHbM9o/bw3Wfi/
         9RqGW81RtIfC75Bx+lgXcuptQZZbSULY6qwAQOu1cTXtg70dOEhCORStRUQAkKkHQsVD
         Atcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729480831; x=1730085631;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2CRbQRChEcCTJjS3HdjVR4yTMVRjivHOQ2PiBx48n0o=;
        b=MMFoM+R5Ii8TEtcsawIE6whFe5ndU6LkmqFCt1pnm1TpyVi6vuufPazbpIitVWRcv+
         ptM2bcItVNZoxd6iiTMH0vTYxp55YAb1TJQWA0e7zm5o2oNjpIMkkP6HiKeYYSAW2aga
         l9AjGSdOldiALGalMy7gTFqVmQjeogOvyllAlWqmCAbuWEMq/jTqu7CuRr8DOjxk/QPG
         s/YxVxXxXDpGFKiJmHFS40UFXHknBzcONTAdmNhQONrmFIjJWf/DAVtFXKDEy1bGtOjx
         UBPT1R/Dp48dAraCclLfe5sFj3fn2EusANNJko8NNaKqtV5Es/jrouDSZlSqZ8PFj121
         Lgrg==
X-Gm-Message-State: AOJu0YxQJn9u8t2tM5fxHTAEUT4bjZk5Y09FoX52KNdv4fO4BDJKc5Xt
	psTdAk8IyZvPRxCfXy53z+0f5j37mkWRmRjQjjuio7tpFNydj3irJfYgFWM4eJHZL4gd6kxvJDq
	WyxqY25RiZ00qwO47skEfRHy/1OA=
X-Google-Smtp-Source: AGHT+IH4a5nnC9N+7TINFW3z3ivrnLSwflNrFWNgS/MI6TZjbO06XIbjwPYx6PlrXNUqYRWEcZ+5LI90PS6tOb2kJsM=
X-Received: by 2002:a05:6a20:cd0e:b0:1d9:a80:bcfe with SMTP id
 adf61e73a8af0-1d92c57df12mr12899509637.41.1729480830719; Sun, 20 Oct 2024
 20:20:30 -0700 (PDT)
MIME-Version: 1.0
References: <20241021022356.3836822-1-sandeep.gundlupet-raju@amd.com>
In-Reply-To: <20241021022356.3836822-1-sandeep.gundlupet-raju@amd.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 20 Oct 2024 23:20:18 -0400
Message-ID: <CADkTA4OpF4tvVi+EDNjUZa1=xpD-y_KVk16axpai9otwr_inYg@mail.gmail.com>
Subject: Re: [meta-virtualization][scarthgap][PATCH] xen-tools.inc: Make
 qemu-system* as configurable
To: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
Cc: meta-virtualization@lists.yoctoproject.org, edgar.iglesias@amd.com, 
	stefano.stabellini@amd.com, mark.hatle@kernel.crashing.org
Content-Type: multipart/alternative; boundary="0000000000008fa1ca0624f4229e"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 21 Oct 2024 03:20:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8932

--0000000000008fa1ca0624f4229e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 20, 2024 at 10:24=E2=80=AFPM Sandeep Gundlupet Raju <
sandeep.gundlupet-raju@amd.com> wrote:

> Make qemu-system* as configurable in xen-tools so that it allows
> user to switch to qemu-system-aarch64 or other if it is supported by
> qemu.
>
>
This is a new feature, and not something that is tested with meta-virt on
scarthgap, so it won't merge. You'll need to carry it locally.

My patch in master-next is more complete, and once it does land in master
I'll consider it for backporting.

Bruce



> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
> ---
>  recipes-extended/xen/xen-tools.inc | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-extended/xen/xen-tools.inc
> b/recipes-extended/xen/xen-tools.inc
> index 72d0b37..7099289 100644
> --- a/recipes-extended/xen/xen-tools.inc
> +++ b/recipes-extended/xen/xen-tools.inc
> @@ -748,11 +748,13 @@ SYSTEMD_SERVICE:${PN}-xencommons =3D " \
>      "
>  SYSTEMD_SERVICE:${PN}-xendomains =3D "xendomains.service"
>
> +QEMU_SYSTEM ?=3D "qemu-system-i386"
> +
>  EXTRA_OECONF +=3D " \
>      --with-systemd=3D${systemd_unitdir}/system \
>      --with-initddir=3D${INIT_D_DIR} \
>      --with-sysconfig-leaf-dir=3Ddefault \
> -    --with-system-qemu=3D${bindir}/qemu-system-i386 \
> +    --with-system-qemu=3D${bindir}/${QEMU_SYSTEM} \
>      "
>
>  do_configure() {
> --
> 2.34.1
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000008fa1ca0624f4229e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Sun, Oct 20, 2024 at 10:24=E2=80=AFPM Sandeep Gundlupet Ra=
ju &lt;<a href=3D"mailto:sandeep.gundlupet-raju@amd.com">sandeep.gundlupet-=
raju@amd.com</a>&gt; wrote:<br></div></div><div class=3D"gmail_quote"><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Make qemu-system* as configura=
ble in xen-tools so that it allows<br>
user to switch to qemu-system-aarch64 or other if it is supported by<br>
qemu.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">This is a new feature, and not something that is tested wi=
th meta-virt on</div><div class=3D"gmail_default" style=3D"font-size:small"=
>scarthgap, so it won&#39;t merge. You&#39;ll need to carry it locally.</di=
v><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">My patch in master-next is m=
ore complete, and once it does land in master</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">I&#39;ll consider it for backporting.=C2=A0<=
/div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div =
class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Sandeep Gundlupet Raju &lt;<a href=3D"mailto:sandeep.gundlup=
et-raju@amd.com" target=3D"_blank">sandeep.gundlupet-raju@amd.com</a>&gt;<b=
r>
---<br>
=C2=A0recipes-extended/xen/xen-tools.inc | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-=
tools.inc<br>
index 72d0b37..7099289 100644<br>
--- a/recipes-extended/xen/xen-tools.inc<br>
+++ b/recipes-extended/xen/xen-tools.inc<br>
@@ -748,11 +748,13 @@ SYSTEMD_SERVICE:${PN}-xencommons =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0SYSTEMD_SERVICE:${PN}-xendomains =3D &quot;xendomains.service&quot;<b=
r>
<br>
+QEMU_SYSTEM ?=3D &quot;qemu-system-i386&quot;<br>
+<br>
=C2=A0EXTRA_OECONF +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0--with-systemd=3D${systemd_unitdir}/system \<br>
=C2=A0 =C2=A0 =C2=A0--with-initddir=3D${INIT_D_DIR} \<br>
=C2=A0 =C2=A0 =C2=A0--with-sysconfig-leaf-dir=3Ddefault \<br>
-=C2=A0 =C2=A0 --with-system-qemu=3D${bindir}/qemu-system-i386 \<br>
+=C2=A0 =C2=A0 --with-system-qemu=3D${bindir}/${QEMU_SYSTEM} \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0do_configure() {<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--0000000000008fa1ca0624f4229e--

