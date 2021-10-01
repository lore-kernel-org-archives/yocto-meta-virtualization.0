Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.5432.1633078904333529963
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 01 Oct 2021 02:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j4ksiUdF;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: martin.jansa@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id b22so5890819pls.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 01 Oct 2021 02:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uKcnRDYlROaEcz74g4xNNHmVsPOvXveZ++VfsAiZJFw=;
        b=j4ksiUdFdkANjvif/W6stPTWSrbBZjLXrhkunzQRV4SVWQhicDcrwy+3LXTnIbMf8J
         TiWmFLihJgnHQk70v0TAYaklbHodAZQVsm675V45M8fF3FDeZziVeYoddKqrzlur3swW
         l5/l+KlM5vGH4/FW/wtj0ThDs1lQUTKw20p6qH+UfRagNkqgCEehluRyMQnx3Uc1oruP
         1dfHYoS/EPkc5sNhpE4UhybmfWZwZCudggmdcLT1zg2OjtQ/+ZBKZJEiLjgxdXVctsNL
         WxYCr354R34V9M96pqWcd3v75DOX6NvKF1prZV15CfVhbFZAFx7jOp0JslwzWRFYo6pV
         PQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uKcnRDYlROaEcz74g4xNNHmVsPOvXveZ++VfsAiZJFw=;
        b=Rjhq4QGWkjKGMJio+Arh2jho4wfV+ha78Omw0IPin0Rjf40g/C6xbEwvQbYMWKgkwG
         IqutzICuoWTjvItQVl6bUyzZsbCFZsTPwdZV2AW5fffRVbjNTZ7fThjCYNQPaLgi2cnr
         Y9NvP0dv0T27v0CupbK+sN2oT1vlMMuCSDq0sLRXDLVWkCgmorgeJ7OQ5Q0En8dEypbL
         n2p2QJRe/7MYVBdx5cbodc1xN+evCg6sQrN7fifCbgoI+MhNj5wUBGwVcFFBLBTVez8z
         8F6AIypCVi3njCQm0qXnCf2GHt6KFTGbBqblhRJGDe2+gmYxM7EtOHueU7xsunEDD7uv
         7Ufg==
X-Gm-Message-State: AOAM531i5FaxM3jnSvh19f8gx3jwj2ucW5h89rSYxrLW4Iflm5iEg4dy
	1wTEpGy1G72L/brUt+k7Stbh9IlHmrgZtjqBfHM=
X-Google-Smtp-Source: ABdhPJxQ8/ow5H2pLzpB9xfrB6Y488Pl64oOoIM44PEJcXbNrUWwD9BZUnIdvPiLcYmpF6jfaURRwDUgn37HfPl51KE=
X-Received: by 2002:a17:902:e78f:b0:13d:f99f:34bb with SMTP id
 cp15-20020a170902e78f00b0013df99f34bbmr8646282plb.48.1633078903807; Fri, 01
 Oct 2021 02:01:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210930084950.41628-1-Martin.Jansa@gmail.com> <20211001023629.GB11771@gmail.com>
In-Reply-To: <20211001023629.GB11771@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 1 Oct 2021 11:01:32 +0200
Message-ID: <CA+chaQcZN3ngXVsKDuMu8d+ebPKc2LJj0Hm9RRYCWOVy8Hf80g@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] oath: inherit pkgconfig
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000f3a2db05cd46cf69"

--000000000000f3a2db05cd46cf69
Content-Type: text/plain; charset="UTF-8"

I did "bitbake world" build with webOS OSE
https://github.com/shr-project/build-webos/tree/honister with it's default
DISTRO_FEATUREs and PNBLACKLIST, so not all of meta-virtualization was
built, but most of it and this was the only failed task from there
(surprisingly).

But be aware that yesterday I also notice once strange issue, that a recipe
"collada-dom" started to shows textrel QA issue and it was actually caused
by pkgconfig not being available where do_configure "silently" failed to
find system bzip2 and minizip due to missing pkgconfig and built own
version instead which lead to this textrel QA issue.

There might be many more recipes like this, which build something
differently without pkgconfig evailable, without triggering any QA check
like in this case. It might be useful to compare at least buildhistory
results with and without the layer.conf change to see what else was changed
unexpectedly.

+ RP and Khem (maybe I should report this on the layer.conf change review
instead..)

On Fri, Oct 1, 2021 at 4:36 AM Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> I've been watching for these as well, but haven't gotten to doing
> my 'all' builds to trigger them.
>
> Out of curiosity, what level of coverage do you end up with on
> the meta-virt layers ? I'm just trying to scope out how many more
> of these may be lurking :D
>
> I've grabbed this, and will push it shortly.
>
> Bruce
>
> In message: [meta-virtualization][PATCH] oath: inherit pkgconfig
> on 30/09/2021 Martin Jansa wrote:
>
> > * Newer oe-core doesn't pull many default dependencies anymore:
> >   https://lists.openembedded.org/g/openembedded-core/message/156185
> >   add explicit dependency on pkgconfig through pkgconfig.bbclass as
> >   we're using it here.
> >
> > * fixes:
> >   ../../oath-toolkit-2.6.2/liboath/configure: line 30585:
> PKG_PROG_PKG_CONFIG: command not found
> >   checking for gtk-doc... ../../oath-toolkit-2.6.2/liboath/configure:
> line 30595: syntax error near unexpected token
> `$gtk_doc_requires,have_gtk_doc=yes,have_gtk_doc=no'
> >   ../../oath-toolkit-2.6.2/liboath/configure: line 30595: `
> PKG_CHECK_EXISTS($gtk_doc_requires,have_gtk_doc=yes,have_gtk_doc=no)'
> >   configure: error: ../../oath-toolkit-2.6.2/liboath/configure failed
> for liboath
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  recipes-extended/oath/oath_2.6.2.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/recipes-extended/oath/oath_2.6.2.bb
> b/recipes-extended/oath/oath_2.6.2.bb
> > index f423044..d568ec0 100644
> > --- a/recipes-extended/oath/oath_2.6.2.bb
> > +++ b/recipes-extended/oath/oath_2.6.2.bb
> > @@ -12,7 +12,7 @@ S = "${WORKDIR}/${BPN}-toolkit-${PV}"
> >  SRC_URI[md5sum] = "4a05cd4768764843bd5493609a6bdb17"
> >  SRC_URI[sha256sum] =
> "b03446fa4b549af5ebe4d35d7aba51163442d255660558cd861ebce536824aa0"
> >
> > -inherit autotools
> > +inherit autotools pkgconfig
> >
> >  # Specify any options you want to pass to the configure script using
> EXTRA_OECONF:
> >  EXTRA_OECONF = ""
> > --
> > 2.32.0
> >
>
> >
> > 
> >
>
>

--000000000000f3a2db05cd46cf69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I did &quot;bitbake world&quot; build with webOS OSE=C2=A0=
<a href=3D"https://github.com/shr-project/build-webos/tree/honister">https:=
//github.com/shr-project/build-webos/tree/honister</a> with it&#39;s defaul=
t DISTRO_FEATUREs and PNBLACKLIST, so not all of meta-virtualization was bu=
ilt, but most of it and this was the only failed task from there (surprisin=
gly).<div><br></div><div>But be aware that yesterday I also notice once str=
ange issue, that a recipe &quot;collada-dom&quot; started to shows textrel =
QA issue and it was actually caused by pkgconfig not being available where =
do_configure &quot;silently&quot; failed to find system bzip2 and minizip d=
ue to missing pkgconfig and built own version instead which lead to this te=
xtrel QA issue.</div><div><br></div><div>There might be many more recipes l=
ike this, which build something differently without pkgconfig evailable, wi=
thout triggering any QA check like in this case. It might be useful to comp=
are at least buildhistory results with and without the layer.conf change to=
 see what else was changed unexpectedly.</div><div><br></div><div>+ RP and =
Khem (maybe I should report this on the layer.conf change review instead..)=
<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Fri, Oct 1, 2021 at 4:36 AM Bruce Ashfield &lt;<a href=3D"mail=
to:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">I&#39;ve been watching=
 for these as well, but haven&#39;t gotten to doing<br>
my &#39;all&#39; builds to trigger them.<br>
<br>
Out of curiosity, what level of coverage do you end up with on<br>
the meta-virt layers ? I&#39;m just trying to scope out how many more<br>
of these may be lurking :D<br>
<br>
I&#39;ve grabbed this, and will push it shortly.<br>
<br>
Bruce<br>
<br>
In message: [meta-virtualization][PATCH] oath: inherit pkgconfig<br>
on 30/09/2021 Martin Jansa wrote:<br>
<br>
&gt; * Newer oe-core doesn&#39;t pull many default dependencies anymore:<br=
>
&gt;=C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/openembedded-c=
ore/message/156185" rel=3D"noreferrer" target=3D"_blank">https://lists.open=
embedded.org/g/openembedded-core/message/156185</a><br>
&gt;=C2=A0 =C2=A0add explicit dependency on pkgconfig through pkgconfig.bbc=
lass as<br>
&gt;=C2=A0 =C2=A0we&#39;re using it here.<br>
&gt; <br>
&gt; * fixes:<br>
&gt;=C2=A0 =C2=A0../../oath-toolkit-2.6.2/liboath/configure: line 30585: PK=
G_PROG_PKG_CONFIG: command not found<br>
&gt;=C2=A0 =C2=A0checking for gtk-doc... ../../oath-toolkit-2.6.2/liboath/c=
onfigure: line 30595: syntax error near unexpected token `$gtk_doc_requires=
,have_gtk_doc=3Dyes,have_gtk_doc=3Dno&#39;<br>
&gt;=C2=A0 =C2=A0../../oath-toolkit-2.6.2/liboath/configure: line 30595: `=
=C2=A0 PKG_CHECK_EXISTS($gtk_doc_requires,have_gtk_doc=3Dyes,have_gtk_doc=
=3Dno)&#39;<br>
&gt;=C2=A0 =C2=A0configure: error: ../../oath-toolkit-2.6.2/liboath/configu=
re failed for liboath<br>
&gt; <br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 recipes-extended/oath/<a href=3D"http://oath_2.6.2.bb" rel=3D"no=
referrer" target=3D"_blank">oath_2.6.2.bb</a> | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/recipes-extended/oath/<a href=3D"http://oath_2.6.2.bb" re=
l=3D"noreferrer" target=3D"_blank">oath_2.6.2.bb</a> b/recipes-extended/oat=
h/<a href=3D"http://oath_2.6.2.bb" rel=3D"noreferrer" target=3D"_blank">oat=
h_2.6.2.bb</a><br>
&gt; index f423044..d568ec0 100644<br>
&gt; --- a/recipes-extended/oath/<a href=3D"http://oath_2.6.2.bb" rel=3D"no=
referrer" target=3D"_blank">oath_2.6.2.bb</a><br>
&gt; +++ b/recipes-extended/oath/<a href=3D"http://oath_2.6.2.bb" rel=3D"no=
referrer" target=3D"_blank">oath_2.6.2.bb</a><br>
&gt; @@ -12,7 +12,7 @@ S =3D &quot;${WORKDIR}/${BPN}-toolkit-${PV}&quot;<br=
>
&gt;=C2=A0 SRC_URI[md5sum] =3D &quot;4a05cd4768764843bd5493609a6bdb17&quot;=
<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;b03446fa4b549af5ebe4d35d7aba5116344=
2d255660558cd861ebce536824aa0&quot;<br>
&gt;=C2=A0 <br>
&gt; -inherit autotools<br>
&gt; +inherit autotools pkgconfig<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Specify any options you want to pass to the configure script u=
sing EXTRA_OECONF:<br>
&gt;=C2=A0 EXTRA_OECONF =3D &quot;&quot;<br>
&gt; -- <br>
&gt; 2.32.0<br>
&gt; <br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
</blockquote></div>

--000000000000f3a2db05cd46cf69--
