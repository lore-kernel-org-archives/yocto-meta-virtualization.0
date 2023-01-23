Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F8D7C05027
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 19:09:21 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web10.51575.1674500954477023505
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 23 Jan 2023 11:09:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ce/7BUf1;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-15fe106c7c7so8992025fac.8
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Jan 2023 11:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DzSaHq/VsDAtxsIUSrm/Kc7D51XDvd6VMJHJYWSJVVY=;
        b=Ce/7BUf1Lip+34Qz1UmiglsTT+jR7TbP6/7KTeWoDTAkCYKmn0qtdmgvpt+u2Izu3+
         jIbW+1aGg4/oj6LzoYiNx50WG9yl8ZYANAmQc5ETdBkkjf9ACvmG/8VZbFavCNcXJTym
         vs08hBkaKhs6DWg6zDUVehMrhbcDqtalBdVN/HBguxJuGBxEJpxm3cdx/VGlG3XrAJuk
         1r/oEM+NkNfS3qEs8LIUgeA/dCEdIlhzMfjP8kra4iBmjRMzG9wZk25PUS7Hc7hSNbug
         DQUn5sAMZElCAFEOrlUL02WBGi02a/TIgV1L307AYlM5qjj8xOjKtNX377JTqHHBfpYN
         GUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DzSaHq/VsDAtxsIUSrm/Kc7D51XDvd6VMJHJYWSJVVY=;
        b=vSXjPQrPP0qc644v+qUb0ScDbfuAridPgjvFtDbvYr4NSzzqUj13IXrVPaNcMI/al+
         7H0wvDt8yV2g/4wk3WtWJGzrYkv59rRKPx404Halo6PU4W7zOjdE+wSysRobJGuHFDZ6
         DCNMdVlqg4hKB/9vzNgdip4ptLMznunW6ARTQ56C7Ep1CPfIRQRccoSGYcJXvmcOcvQ0
         tnJMKbG6vDoyEVpKzmiTDaKBSlEFD39WhbSYSzVLzNaz3vwMkEmyXZKngjdpUvjnKz7P
         Ks+iUv0QXFZkwzUQBIPkChL3cjKX+EZ2Ym5rfVKauWkUnjRkGrmAzVHCbpadJrxUifPV
         Tanw==
X-Gm-Message-State: AFqh2krWlraGMD2jjoJRitxUr7pR772vdb/LcGnmtvxhh/Z6aQtkxs2M
	Kq3+QgcNJAQ+v+HkKET2OdCxpJFNfOhJl5oiOAE=
X-Google-Smtp-Source: AMrXdXsOdRU/AAUGCYMRigQNprRF9FZnGaCxemTG/1yMorxrKUBHcxSC9kJuzpjbm9V+nHZ4g72SvNolkPvQuAMbB2A=
X-Received: by 2002:a05:6870:514a:b0:15e:d5b1:33df with SMTP id
 z10-20020a056870514a00b0015ed5b133dfmr1687458oak.55.1674500953510; Mon, 23
 Jan 2023 11:09:13 -0800 (PST)
MIME-Version: 1.0
References: <20230123154454.1514564-1-jdmason@kudzu.us> <CAMKF1srz31kw5nEaPWSvH6RtdS6A2a9miDurDBszYFSemM=Tzw@mail.gmail.com>
 <CAPoiz9x-mvmUxhfqi4C97tE0YjNWNaxa0oHfESBRh2xUGh4iVw@mail.gmail.com>
In-Reply-To: <CAPoiz9x-mvmUxhfqi4C97tE0YjNWNaxa0oHfESBRh2xUGh4iVw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Jan 2023 11:09:02 -0800
Message-ID: <CAMKF1sprpC-nfZO2JOnjBWfyswuZjjpu037WCZ10xQtd_=t0pw@mail.gmail.com>
Subject: Re: [PATCH] xen: force usage of gcc
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000829b3f05f2f3224c"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Jan 2023 19:09:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7832

--000000000000829b3f05f2f3224c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

configure: line 2898: arm-poky-linux-gnueabi-gcc: command not found

So it seems this components build system does not respect CC and other
bitbake environment variable

On Mon, Jan 23, 2023 at 11:05 AM Jon Mason <jdmason@kudzu.us> wrote:

> I'm attaching the failing logs to this email.  Let me know if it
> doesn't go through.
>
> On Mon, Jan 23, 2023 at 11:30 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> >
> >
> > On Mon, Jan 23, 2023 at 7:44 AM Jon Mason <jdmason@kudzu.us> wrote:
> >>
> >> xen-tools and xen (and possibly others) fail to compile with clang,
> with the following error:
> >>  configure: error: in
> `/builder/meta-arm/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/x=
en-tools/4.17+stableAUTOINC+11560248ff-r0/git/tools':
> >>  configure: error: C compiler cannot create executables
> >>  See `config.log' for more details
> >>  configure: error: ./configure failed for tools
> >
> >
> >
> > And what=E2=80=99s does config.log say ?
> > Can you post this file somewhere
> >
> >>
> >>
> >> Force all of xen to use gcc until this issue can be resolved.
> >>
> >> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> >> ---
> >>  recipes-extended/xen/xen.inc | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.i=
nc
> >> index 5937763a7ddf..dcd281b5a21b 100644
> >> --- a/recipes-extended/xen/xen.inc
> >> +++ b/recipes-extended/xen/xen.inc
> >> @@ -2,6 +2,8 @@ HOMEPAGE =3D "http://xen.org"
> >>  LICENSE =3D "GPL-2.0-only"
> >>  SECTION =3D "console/tools"
> >>
> >> +TOOLCHAIN =3D "gcc"
> >> +
> >>  inherit autotools-brokensep pkgconfig
> >>
> >>  require xen-arch.inc
> >> --
> >> 2.30.2
> >>
>

--000000000000829b3f05f2f3224c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>configure: line 2898: arm-poky-linux-gnueabi-gcc: command not found<br=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">So it seems this compo=
nents build system does not respect CC and other bitbake environment variab=
le=C2=A0</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Mon, Jan 23, 2023 at 11:05 AM Jon Mason &lt;<a href=3D"mail=
to:jdmason@kudzu.us">jdmason@kudzu.us</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">I&#39;m attaching the failing logs to this email.=C2=A0 L=
et me know if it<br>
doesn&#39;t go through.<br>
<br>
On Mon, Jan 23, 2023 at 11:30 AM Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Jan 23, 2023 at 7:44 AM Jon Mason &lt;<a href=3D"mailto:jdmaso=
n@kudzu.us" target=3D"_blank">jdmason@kudzu.us</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; xen-tools and xen (and possibly others) fail to compile with clang=
, with the following error:<br>
&gt;&gt;=C2=A0 configure: error: in `/builder/meta-arm/build/tmp/work/corte=
xa15t2hf-neon-poky-linux-gnueabi/xen-tools/4.17+stableAUTOINC+11560248ff-r0=
/git/tools&#39;:<br>
&gt;&gt;=C2=A0 configure: error: C compiler cannot create executables<br>
&gt;&gt;=C2=A0 See `config.log&#39; for more details<br>
&gt;&gt;=C2=A0 configure: error: ./configure failed for tools<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; And what=E2=80=99s does config.log say ?<br>
&gt; Can you post this file somewhere<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Force all of xen to use gcc until this issue can be resolved.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Jon Mason &lt;<a href=3D"mailto:jdmason@kudzu.us" t=
arget=3D"_blank">jdmason@kudzu.us</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 recipes-extended/xen/xen.inc | 2 ++<br>
&gt;&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/x=
en.inc<br>
&gt;&gt; index 5937763a7ddf..dcd281b5a21b 100644<br>
&gt;&gt; --- a/recipes-extended/xen/xen.inc<br>
&gt;&gt; +++ b/recipes-extended/xen/xen.inc<br>
&gt;&gt; @@ -2,6 +2,8 @@ HOMEPAGE =3D &quot;<a href=3D"http://xen.org" rel=
=3D"noreferrer" target=3D"_blank">http://xen.org</a>&quot;<br>
&gt;&gt;=C2=A0 LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt;&gt;=C2=A0 SECTION =3D &quot;console/tools&quot;<br>
&gt;&gt;<br>
&gt;&gt; +TOOLCHAIN =3D &quot;gcc&quot;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 inherit autotools-brokensep pkgconfig<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 require xen-arch.inc<br>
&gt;&gt; --<br>
&gt;&gt; 2.30.2<br>
&gt;&gt;<br>
</blockquote></div></div>

--000000000000829b3f05f2f3224c--

