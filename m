Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web12.604.1602686058954631406
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 14 Oct 2020 07:34:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ARvb+rYH;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id p15so5146045ejm.7
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 14 Oct 2020 07:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tqQYIlitx4UFMvUHpDeZv/4GQHacqul29LxljqlTAb0=;
        b=ARvb+rYHZKNyKDhkG9KIyuNxQw3JnGmJCQTvBcbP4ancSnpiVXR3jllUDpzmrGeCf3
         Suk+sBK530VIgFRWuQ8R9VTJOonqR994k1RZmlVfFEcVh77pmtY4WFV8kFeHHBAiymBl
         fAWWMUP90vQHsBVgS/FakBDRjAWU/Ct5Q9WedMIHfyBQspSpoRxyH6+OaGI3sg5/00Mk
         IotNYdxzhNzxVwcJyu/fGXHllntzR/pEOEOof/L0sQO3eRJ6zNI6+gqXhSH74uDfGXR6
         TsofZfF17ypy4PA15jChKxV/sK+xdHvD+oE6t/T9h6O7TyWWsGjU7EyqI1VyYhrJyau2
         WXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tqQYIlitx4UFMvUHpDeZv/4GQHacqul29LxljqlTAb0=;
        b=KKA1m5C2afhEYyH4iZbYxkLIiYao1m+7tYNlxpYHtfVmMc1Q8dJvfm4iGHvzkURwMU
         vemrCCHLBbC3N9M4+KP1db7noYsP+A9GJzMXlpXG97ODkBTBONosqwpXPX1HaaGOYgP4
         iSlgDC/DuTIeNgNYVDbXdmUbmr+0b/JjyuaKEGQF6MQJfK6CvTFIsjeMPfK6OZFc9niq
         KFA79HwyzQhXmds/F4hT5csvkgd7ly8OTsfoS8NCG+iadqjx1kYNfdoFQR5aOmDNfgex
         VNPLaXSm9igeF4uNtRUqDOmAAmUb8c/XUuyKaXcFbIpT+k5gMVPAzOptBctr0mgAFdc2
         3ikw==
X-Gm-Message-State: AOAM530uR1cAQMY9PvVEiats8+QxR0fa/tNW2Q9Tg+BRR3aHrnHEXqEh
	jtpiDlirPoHpa4KwzoUl6/6Ac1FhcfPlmB9+zhg=
X-Google-Smtp-Source: ABdhPJx9TNkcXAik7pyHZgwaCkkLfmQJt4aKOuu7n/MmWCH93wGYaR7Ekm6D9y43zqXNGuCOjGOZ3wOEekwpdzGJ9OI=
X-Received: by 2002:a17:906:a454:: with SMTP id cb20mr5795911ejb.137.1602686057375;
 Wed, 14 Oct 2020 07:34:17 -0700 (PDT)
MIME-Version: 1.0
References: <163DE253A3FB9155.26394@lists.yoctoproject.org>
In-Reply-To: <163DE253A3FB9155.26394@lists.yoctoproject.org>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 14 Oct 2020 16:34:06 +0200
Message-ID: <CA+chaQc7O_M-r3m4X8g2h+e9WRoVHt+oQSpDpc3k-Nf3JPELMw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] layer.conf: add security to LAYERDEPENDS
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000022ec4105b1a26d9c"

--00000000000022ec4105b1a26d9c
Content-Type: text/plain; charset="UTF-8"

There is also

ERROR: Nothing RPROVIDES 'apache2' (but
/OE/meta-virtualization/recipes-extended/nagios/nagios-core_4.4.3.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'apache2' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['apache2']
ERROR: Required build target 'meta-world-pkgdata' has no buildable
providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
'nagios-core', 'apache2']

which requires webserver layer listed
in LAYERRECOMMENDS_virtualization-layer

I guess I should stop trying to get yocto-check-layer to work :).

On Wed, Oct 14, 2020 at 4:31 PM Martin Jansa via lists.yoctoproject.org
<Martin.Jansa=gmail.com@lists.yoctoproject.org> wrote:

> * fixes:
>   NOTE: Resolving any missing task queue dependencies
>   ERROR: Nothing PROVIDES 'libseccomp' (but
> /OE/meta-virtualization/recipes-networking/slirp4netns/
> slirp4netns_0.4.1.bb, /OE/meta-virtualization/recipes-containers/crun/
> crun_git.bb DEPENDS on or otherwise requires it). Close matches:
>     libcomps
>   ERROR: Required build target 'meta-world-pkgdata' has no buildable
> providers.
>   Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
> 'slirp4netns', 'libseccomp']
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  conf/layer.conf | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 16d071b..e2cdf23 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -38,6 +38,7 @@ LAYERDEPENDS_virtualization-layer = " \
>      networking-layer \
>      filesystems-layer \
>      meta-python \
> +    security \
>  "
>
>  # webserver: naigos requires apache2
> --
> 2.25.1
>
>
> 
>
>

--00000000000022ec4105b1a26d9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There is also<div><br></div><div>ERROR: Nothing RPROVIDES =
&#39;apache2&#39; (but /OE/meta-virtualization/recipes-extended/nagios/<a h=
ref=3D"http://nagios-core_4.4.3.bb">nagios-core_4.4.3.bb</a> RDEPENDS on or=
 otherwise requires it)<br>NOTE: Runtime target &#39;apache2&#39; is unbuil=
dable, removing...<br>Missing or unbuildable dependency chain was: [&#39;ap=
ache2&#39;]<br>ERROR: Required build target &#39;meta-world-pkgdata&#39; ha=
s no buildable providers.<br>Missing or unbuildable dependency chain was: [=
&#39;meta-world-pkgdata&#39;, &#39;nagios-core&#39;, &#39;apache2&#39;]<br>=
</div><div><br></div><div>which requires webserver=C2=A0layer listed in=C2=
=A0LAYERRECOMMENDS_virtualization-layer</div><div><br></div><div>I guess I=
 should stop trying to get yocto-check-layer to work :).</div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 1=
4, 2020 at 4:31 PM Martin Jansa via <a href=3D"http://lists.yoctoproject.or=
g">lists.yoctoproject.org</a> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.co=
m@lists.yoctoproject.org">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">* fixes:<br>
=C2=A0 NOTE: Resolving any missing task queue dependencies<br>
=C2=A0 ERROR: Nothing PROVIDES &#39;libseccomp&#39; (but /OE/meta-virtuali=
zation/recipes-networking/slirp4netns/<a href=3D"http://slirp4netns_0.4.1.b=
b" rel=3D"noreferrer" target=3D"_blank">slirp4netns_0.4.1.bb</a>, /OE/meta-=
virtualization/recipes-containers/crun/<a href=3D"http://crun_git.bb" rel=
=3D"noreferrer" target=3D"_blank">crun_git.bb</a> DEPENDS on or otherwise =
requires it). Close matches:<br>
=C2=A0 =C2=A0 libcomps<br>
=C2=A0 ERROR: Required build target &#39;meta-world-pkgdata&#39; has no bu=
ildable providers.<br>
=C2=A0 Missing or unbuildable dependency chain was: [&#39;meta-world-pkgda=
ta&#39;, &#39;slirp4netns&#39;, &#39;libseccomp&#39;]<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0conf/layer.conf | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/conf/layer.conf b/conf/layer.conf<br>
index 16d071b..e2cdf23 100644<br>
--- a/conf/layer.conf<br>
+++ b/conf/layer.conf<br>
@@ -38,6 +38,7 @@ LAYERDEPENDS_virtualization-layer =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0networking-layer \<br>
=C2=A0 =C2=A0 =C2=A0filesystems-layer \<br>
=C2=A0 =C2=A0 =C2=A0meta-python \<br>
+=C2=A0 =C2=A0 security \<br>
=C2=A0&quot;<br>
<br>
=C2=A0# webserver: naigos requires apache2<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000022ec4105b1a26d9c--
