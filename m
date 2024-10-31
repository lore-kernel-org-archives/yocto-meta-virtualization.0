Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABAFEE6894F
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 03:55:54 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.5076.1730346953307076028
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 30 Oct 2024 20:55:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UVBTT3kj;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-71e5a1c9071so405808b3a.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Oct 2024 20:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730346953; x=1730951753; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3vzdXCmkLIZvUhjh5BTcSVRpT8yXJC+v6IYBgB8Sthw=;
        b=UVBTT3kjN0ajT+x+E0kM6kjKID4UGK8z3r0zvRen7klzexp36WDVmEVT1Ks6fPMKyt
         uwsqGjHWIYkE6gV2b0wjrig2bNqn8XtEB5zWCP7nRiaIBVIPgQveTGgkPlvLoTjCj409
         Fur0C1Iv/N6uTXYgNQUAaQu5Xt3LBYw/Qi3ShuJnvxAxhelvYBWaoVg/M3EBwnjCh20G
         e1lu49Iy95WAA6LTGgHGxovAGwbt80SrmHcKtUsFHvchLHGs3XK102/RDApVHA7nStxr
         zsGuiEC2G5uDckPueRf5fIt3I8B8UyTWUR0/PfglFIrJX+jJYsw9HsddK6N4IvRA8NkM
         p8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730346953; x=1730951753;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3vzdXCmkLIZvUhjh5BTcSVRpT8yXJC+v6IYBgB8Sthw=;
        b=eUCSa50X4wOjwd9fQXcOeuSV/68+V+FvJUepK+6NyJpxe/cW/Ah+isDVl1uN9G84WF
         i0Mgq6IlKhvXCwhT3kTnVJUfhr4C3apJ9CX0ZUOK6BxC16JNP6E0+BYod4Bq5hozfvT7
         Kj2GXAM5Ok8ddhTt1xsVp5Ved4G7jFQUEGxrcFGwFRUwrCwYspMy6ccDQpaX0bsBcBNl
         nmDoEgAowU6EQg/vpK+1JtMRedJt9yy0+32bUSoB7Pb4N5GfGAVKYsHGwGmaHhBZ+NzN
         /L8KtXwLqTX106t2VDuqCkkljmX7cSOIsJhsMluZVS1dGDDpr2Aiot+yQK9EY0/kqJ9Y
         EVKw==
X-Gm-Message-State: AOJu0YyMzGVBOY/gSOtIyR/aBIhjH1zoSngJrgyQPN9+A/GTsRydoU4h
	YXXhBJYvKEjJrxTvHDto68FyVCsNoxafov/ckGahsOLy3OLQ6Nr2EGwv5NxbRrTfbROCulFxtxZ
	uFDnRZup/yW6pv0v6d9ErTjBJLQg=
X-Google-Smtp-Source: AGHT+IGahfPuOsfba5fAsbXo08I/E1G5e7Uj91WaIa0qaheN3gdCGIYOcUaZKZOAGV9vJIn2FqrGnRAKYv+0nz9wDQk=
X-Received: by 2002:a05:6a20:9c97:b0:1d9:a94:8d90 with SMTP id
 adf61e73a8af0-1d9eece4dd6mr7647859637.27.1730346952445; Wed, 30 Oct 2024
 20:55:52 -0700 (PDT)
MIME-Version: 1.0
References: <20241021150231.1221025-1-lukasz.czechowski@thaumatec.com>
In-Reply-To: <20241021150231.1221025-1-lukasz.czechowski@thaumatec.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 30 Oct 2024 23:55:41 -0400
Message-ID: <CADkTA4OrDZ1KO3TtysNT9EopK3gDagh5h3b1F3PPWOsdFksgrg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] container-host-config: Remove centos registry
To: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000007059010625bdcb7c"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 31 Oct 2024 03:55:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8943

--0000000000007059010625bdcb7c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the patch.

I injured my hand (so I couldn't type) and then had to do some release
preparation, but will get to merging his shortly.

Bruce

On Mon, Oct 21, 2024 at 11:02=E2=80=AFAM Lukasz Czechowski <
lukasz.czechowski@thaumatec.com> wrote:

> Update registry list by removing 'registry.centos.org' entry.
> This registry is no longer available.
> Decommissioning of the registry was announced in the thread:
>
> https://lists.centos.org/hyperkitty/list/devel@lists.centos.org/thread/EH=
GCQUHLDQ6LI474ZAB7MPRZFJD77P3S/
>
> Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
> ---
>  .../container-host-config/container-host-config/registries.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git
> a/recipes-containers/container-host-config/container-host-config/registri=
es.conf
> b/recipes-containers/container-host-config/container-host-config/registri=
es.conf
> index ba6c3f6e..926d8c36 100644
> ---
> a/recipes-containers/container-host-config/container-host-config/registri=
es.conf
> +++
> b/recipes-containers/container-host-config/container-host-config/registri=
es.conf
> @@ -9,7 +9,7 @@
>  # and 'registries.block'.
>
>  [registries.search]
> -registries =3D ['docker.io', 'registry.fedoraproject.org', 'quay.io', '
> registry.access.redhat.com', 'registry.centos.org']
> +registries =3D ['docker.io', 'registry.fedoraproject.org', 'quay.io', '
> registry.access.redhat.com']
>
>  # If you need to access insecure registries, add the registry's
> fully-qualified name.
>  # An insecure registry is one that does not have a valid SSL certificate
> or only does HTTP.
> --
> 2.43.0
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000007059010625bdcb7c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Tha=
nks for the patch.</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-size:small">I inju=
red my hand (so I couldn&#39;t type) and then had to do some release prepar=
ation, but will get to merging=C2=A0his shortly.</div><div class=3D"gmail_d=
efault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" st=
yle=3D"font-size:small">Bruce</div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 21, 2024 at 11:02=E2=80=AFAM=
 Lukasz Czechowski &lt;<a href=3D"mailto:lukasz.czechowski@thaumatec.com">l=
ukasz.czechowski@thaumatec.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Update registry list by removing &#39;<a href=
=3D"http://registry.centos.org" rel=3D"noreferrer" target=3D"_blank">regist=
ry.centos.org</a>&#39; entry.<br>
This registry is no longer available.<br>
Decommissioning of the registry was announced in the thread:<br>
<a href=3D"https://lists.centos.org/hyperkitty/list/devel@lists.centos.org/=
thread/EHGCQUHLDQ6LI474ZAB7MPRZFJD77P3S/" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.centos.org/hyperkitty/list/devel@lists.centos.org/thread/=
EHGCQUHLDQ6LI474ZAB7MPRZFJD77P3S/</a><br>
<br>
Signed-off-by: Lukasz Czechowski &lt;<a href=3D"mailto:lukasz.czechowski@th=
aumatec.com" target=3D"_blank">lukasz.czechowski@thaumatec.com</a>&gt;<br>
---<br>
=C2=A0.../container-host-config/container-host-config/registries.conf | 2 +=
-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-containers/container-host-config/container-host-config=
/registries.conf b/recipes-containers/container-host-config/container-host-=
config/registries.conf<br>
index ba6c3f6e..926d8c36 100644<br>
--- a/recipes-containers/container-host-config/container-host-config/regist=
ries.conf<br>
+++ b/recipes-containers/container-host-config/container-host-config/regist=
ries.conf<br>
@@ -9,7 +9,7 @@<br>
=C2=A0# and &#39;registries.block&#39;.<br>
<br>
=C2=A0[registries.search]<br>
-registries =3D [&#39;<a href=3D"http://docker.io" rel=3D"noreferrer" targe=
t=3D"_blank">docker.io</a>&#39;, &#39;<a href=3D"http://registry.fedoraproj=
ect.org" rel=3D"noreferrer" target=3D"_blank">registry.fedoraproject.org</a=
>&#39;, &#39;<a href=3D"http://quay.io" rel=3D"noreferrer" target=3D"_blank=
">quay.io</a>&#39;, &#39;<a href=3D"http://registry.access.redhat.com" rel=
=3D"noreferrer" target=3D"_blank">registry.access.redhat.com</a>&#39;, &#39=
;<a href=3D"http://registry.centos.org" rel=3D"noreferrer" target=3D"_blank=
">registry.centos.org</a>&#39;]<br>
+registries =3D [&#39;<a href=3D"http://docker.io" rel=3D"noreferrer" targe=
t=3D"_blank">docker.io</a>&#39;, &#39;<a href=3D"http://registry.fedoraproj=
ect.org" rel=3D"noreferrer" target=3D"_blank">registry.fedoraproject.org</a=
>&#39;, &#39;<a href=3D"http://quay.io" rel=3D"noreferrer" target=3D"_blank=
">quay.io</a>&#39;, &#39;<a href=3D"http://registry.access.redhat.com" rel=
=3D"noreferrer" target=3D"_blank">registry.access.redhat.com</a>&#39;]<br>
<br>
=C2=A0# If you need to access insecure registries, add the registry&#39;s f=
ully-qualified name.<br>
=C2=A0# An insecure registry is one that does not have a valid SSL certific=
ate or only does HTTP.<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div>

--0000000000007059010625bdcb7c--

