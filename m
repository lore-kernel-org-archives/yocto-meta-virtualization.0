Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7576C433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 11:03:36 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.4099.1646996615309319309
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 03:03:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lLQy3zn6;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id g3so10495310edu.1
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 11 Mar 2022 03:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w+7X3CfX1FRWmi2Fem8aLWLdzycjgRPNwRTlG6s+Ink=;
        b=lLQy3zn6ieVnlrGHJQqpjSEe4yFkoX8bD61r4Dk4eTvaDsB6fQwb2Tfdd95PuD+Zpb
         2lk0zhGRlJXT3egjYF5N9vpCfKT22Abmchr/MVGBxrPBgur5XYO3NUmqddR5MJrwcveu
         Wi5NCLAxbbdUbyBUmm2TTh50CnAos6FPicXl77g3ofCGS6ZiZDUCWu3cOmWNZHA69yPr
         aty7Bp0JnsiAma4Fab99d/TOQtj4v8H1yWLvNR71lGlhSCIuUMJPWE1UghuzA1Ayd/Mc
         GFkNCfnQHOMlu7NnvVxPh/TKMZErZhDe7vtdAUJcLcnD+wc65tLKvGgNl0yHCD69niUV
         XE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w+7X3CfX1FRWmi2Fem8aLWLdzycjgRPNwRTlG6s+Ink=;
        b=3j7iMy6e2u3RD8/wO849oGcghaUFJTADeGU0BZm+nZnS1VpbvKmNGehxRmxju9j8yL
         n/VIGnyA7+9aGbhUsLm6KyI6W3NX3QdXXKFCWF96NvBP2siMbV6ZIlDMNkgWjQsazObN
         si7+85gpMR9cnB8+lsP8Tmq0a+Lo5GOU7FsUCDc7ZpnLZsKQ7w8tcIumiCeGLsRggL7b
         6YWswvnj3Dlvlpy9UQaKP0Em7d/6gaCeXOo1qPKzXunPgAnGXh90cKvzC8cNMf5lfgyt
         hGhIO1fdkDNZsm8AKl3YcNc12Qr4M1idnBM6fon1U5FcaEsQy3xQAw7dG0mM/o5fx0UI
         Sdiw==
X-Gm-Message-State: AOAM530ExioEIfp82oJ+//a5hZHzurF5D3WWBqY6yxyJGpyou6Uw7GKq
	aUb9e91joXsVB4u4UN4phiDZpPz4xXV1HImwDgY=
X-Google-Smtp-Source: 
 ABdhPJzW+OlpZswwJJrdR8eBPWD2Je5EcZk+8M9Cxnq+V8cKb7JZdEBOT2D0GC+2mNPC/WXDl3S+PqmLDgisLiX6Hm4=
X-Received: by 2002:a05:6402:2549:b0:415:c31c:f9c2 with SMTP id
 l9-20020a056402254900b00415c31cf9c2mr8443064edb.335.1646996613431; Fri, 11
 Mar 2022 03:03:33 -0800 (PST)
MIME-Version: 1.0
References: <20220309110906.2925117-1-bertrand.marquis@arm.com>
 <20220310194302.GB37392@gmail.com>
 <78A69072-AA10-42A5-BF2D-685E529C5D4C@arm.com>
In-Reply-To: <78A69072-AA10-42A5-BF2D-685E529C5D4C@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 11 Mar 2022 06:03:22 -0500
Message-ID: 
 <CADkTA4NWRc3XjigSSx2RHZ6O-tzDFSeQ1g6JUhfnhknoRc6UDw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] xen: Override CC and CPP in make
 command line
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
 "cardoe@gentoo.org" <cardoe@gentoo.org>,
	Michal Orzel <Michal.Orzel@arm.com>
Content-Type: multipart/alternative; boundary="00000000000017065705d9ef481d"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 11 Mar 2022 11:03:36 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7092

--00000000000017065705d9ef481d
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 11, 2022 at 3:57 AM Bertrand Marquis <Bertrand.Marquis@arm.com>
wrote:

> Hi Bruce,
>
> > On 10 Mar 2022, at 19:43, Bruce Ashfield via lists.yoctoproject.org
> <bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
> >
> > I've merged the patch, if Christopher has any review comments or needs
> > changes, we'll stack them on top.
>
> Could this be also added in honister branch ?
>
>
No problem. I did the cherry pick.

Bruce



> Thanks
> Bertrand
>
> >
> > Bruce
> >
> > In message: [meta-virtualization] [PATCH] xen: Override CC and CPP in
> make command line
> > on 09/03/2022 Bertrand Marquis wrote:
> >
> >> From: Michal Orzel <michal.orzel@arm.com>
> >>
> >> After 4.16 release, Xen build system has been changed significantly.
> >> When building latest status of Xen it was observed that commit
> >> 317c98cb91 broke the hypervisor build on arm32 due to the change in
> >> handling Rules.mk that xen.inc modifies to override CC and CPP.
> >>
> >> In order to fix the issue this patch moves overriding CC and CPP from
> >> Rules.mk to make command line by adding them to EXTRA_OEMAKE:arm.
> >>
> >> Take the opportunity to bump SRCREV of xen_git.bb and xen-tools_git.bb
> >> to the current status of master.
> >>
> >> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> >> ---
> >> recipes-extended/xen/xen-hypervisor.inc | 8 ++++++++
> >> recipes-extended/xen/xen-tools_git.bb   | 4 ++--
> >> recipes-extended/xen/xen.inc            | 6 ------
> >> recipes-extended/xen/xen_git.bb         | 4 ++--
> >> 4 files changed, 12 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/recipes-extended/xen/xen-hypervisor.inc
> b/recipes-extended/xen/xen-hypervisor.inc
> >> index 81e361f..6f3d24d 100644
> >> --- a/recipes-extended/xen/xen-hypervisor.inc
> >> +++ b/recipes-extended/xen/xen-hypervisor.inc
> >> @@ -48,6 +48,14 @@ do_configure() {
> >>     fi
> >> }
> >>
> >> +# The hypervisor binary for arm must not be built with the hard
> floating point
> >> +# ABI. Override CC and CPP when invoking make so that they do not
> contain
> >> +# TUNE_CCARGS.
> >> +EXTRA_OEMAKE:arm += "CC='${CCACHE}${HOST_PREFIX}gcc
> ${TOOLCHAIN_OPTIONS} \
> >> +                         ${CC_REPRODUCIBLE_OPTIONS}' \
> >> +                     CPP='${CCACHE}${HOST_PREFIX}gcc -E
> ${TOOLCHAIN_OPTIONS} \
> >> +                         ${CC_REPRODUCIBLE_OPTIONS}'"
> >> +
> >> do_compile() {
> >>     oe_runmake xen PYTHON="${PYTHON}" \
> >>                    EXTRA_CFLAGS_XEN_CORE="${EXTRA_CFLAGS_XEN_CORE}"
> >> diff --git a/recipes-extended/xen/xen-tools_git.bb
> b/recipes-extended/xen/xen-tools_git.bb
> >> index 8ff9c4c..e733f1d 100644
> >> --- a/recipes-extended/xen/xen-tools_git.bb
> >> +++ b/recipes-extended/xen/xen-tools_git.bb
> >> @@ -1,5 +1,5 @@
> >> -# master status on 2020-10-21
> >> -SRCREV ?= "23ec1ebc8acbfd2bf06f6085a776f0db923f9fa9"
> >> +# master status on 2022-03-08
> >> +SRCREV ?= "9d4a44380d273de22d5753883cbf5581795ff24d"
> >>
> >> XEN_REL ?= "4.16"
> >> XEN_BRANCH ?= "master"
> >> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> >> index 4df99bf..8b86de5 100644
> >> --- a/recipes-extended/xen/xen.inc
> >> +++ b/recipes-extended/xen/xen.inc
> >> @@ -193,12 +193,6 @@ do_post_patch() {
> >>     fi
> >> }
> >>
> >> -do_post_patch:append:arm()  {
> >> -    # The hypervisor binary must not be built with the hard floating
> point ABI.
> >> -    echo "CC := \$(filter-out ${TUNE_CCARGS},\$(CC))" >>
> ${S}/xen/arch/arm/Rules.mk
> >> -    echo "CPP := \$(filter-out ${TUNE_CCARGS},\$(CPP))" >>
> ${S}/xen/arch/arm/Rules.mk
> >> -}
> >> -
> >> addtask post_patch after do_patch before do_configure
> >>
> >> # Allow all hypervisor settings in a defconfig
> >> diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/
> xen_git.bb
> >> index e014733..2fbfb54 100644
> >> --- a/recipes-extended/xen/xen_git.bb
> >> +++ b/recipes-extended/xen/xen_git.bb
> >> @@ -1,5 +1,5 @@
> >> -# master status on 2020-10-21
> >> -SRCREV ?= "23ec1ebc8acbfd2bf06f6085a776f0db923f9fa9"
> >> +# master status on 2022-03-08
> >> +SRCREV ?= "9d4a44380d273de22d5753883cbf5581795ff24d"
> >>
> >> XEN_REL ?= "4.16"
> >> XEN_BRANCH ?= "master"
> >> --
> >> 2.25.1
> >>
> >
> >>
> >>
> >>
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7086):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7086
> > Mute This Topic: https://lists.yoctoproject.org/mt/89659618/3619089
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> [bertrand.marquis@arm.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000017065705d9ef481d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Mar 11, 2022 at 3:57 AM Bertrand Marquis &l=
t;<a href=3D"mailto:Bertrand.Marquis@arm.com">Bertrand.Marquis@arm.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Br=
uce,<br>
<br>
&gt; On 10 Mar 2022, at 19:43, Bruce Ashfield via <a href=3D"http://lists.y=
octoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.or=
g</a> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.o=
rg" target=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt; <br>
&gt; I&#39;ve merged the patch, if Christopher has any review comments or n=
eeds<br>
&gt; changes, we&#39;ll stack them on top.<br>
<br>
Could this be also added in honister branch ?<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">No problem. I did the cherry pick.</div><div class=3D"gmai=
l_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default"=
 style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
Thanks<br>
Bertrand<br>
<br>
&gt; <br>
&gt; Bruce<br>
&gt; <br>
&gt; In message: [meta-virtualization] [PATCH] xen: Override CC and CPP in =
make command line<br>
&gt; on 09/03/2022 Bertrand Marquis wrote:<br>
&gt; <br>
&gt;&gt; From: Michal Orzel &lt;<a href=3D"mailto:michal.orzel@arm.com" tar=
get=3D"_blank">michal.orzel@arm.com</a>&gt;<br>
&gt;&gt; <br>
&gt;&gt; After 4.16 release, Xen build system has been changed significantl=
y.<br>
&gt;&gt; When building latest status of Xen it was observed that commit<br>
&gt;&gt; 317c98cb91 broke the hypervisor build on arm32 due to the change i=
n<br>
&gt;&gt; handling Rules.mk that xen.inc modifies to override CC and CPP.<br=
>
&gt;&gt; <br>
&gt;&gt; In order to fix the issue this patch moves overriding CC and CPP f=
rom<br>
&gt;&gt; Rules.mk to make command line by adding them to EXTRA_OEMAKE:arm.<=
br>
&gt;&gt; <br>
&gt;&gt; Take the opportunity to bump SRCREV of <a href=3D"http://xen_git.b=
b" rel=3D"noreferrer" target=3D"_blank">xen_git.bb</a> and <a href=3D"http:=
//xen-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">xen-tools_git.bb</=
a><br>
&gt;&gt; to the current status of master.<br>
&gt;&gt; <br>
&gt;&gt; Signed-off-by: Michal Orzel &lt;<a href=3D"mailto:michal.orzel@arm=
.com" target=3D"_blank">michal.orzel@arm.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; recipes-extended/xen/xen-hypervisor.inc | 8 ++++++++<br>
&gt;&gt; recipes-extended/xen/<a href=3D"http://xen-tools_git.bb" rel=3D"no=
referrer" target=3D"_blank">xen-tools_git.bb</a>=C2=A0 =C2=A0| 4 ++--<br>
&gt;&gt; recipes-extended/xen/xen.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 6 ------<br>
&gt;&gt; recipes-extended/xen/<a href=3D"http://xen_git.bb" rel=3D"noreferr=
er" target=3D"_blank">xen_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 +=
+--<br>
&gt;&gt; 4 files changed, 12 insertions(+), 10 deletions(-)<br>
&gt;&gt; <br>
&gt;&gt; diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-ext=
ended/xen/xen-hypervisor.inc<br>
&gt;&gt; index 81e361f..6f3d24d 100644<br>
&gt;&gt; --- a/recipes-extended/xen/xen-hypervisor.inc<br>
&gt;&gt; +++ b/recipes-extended/xen/xen-hypervisor.inc<br>
&gt;&gt; @@ -48,6 +48,14 @@ do_configure() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0fi<br>
&gt;&gt; }<br>
&gt;&gt; <br>
&gt;&gt; +# The hypervisor binary for arm must not be built with the hard f=
loating point<br>
&gt;&gt; +# ABI. Override CC and CPP when invoking make so that they do not=
 contain<br>
&gt;&gt; +# TUNE_CCARGS.<br>
&gt;&gt; +EXTRA_OEMAKE:arm +=3D &quot;CC=3D&#39;${CCACHE}${HOST_PREFIX}gcc =
${TOOLCHAIN_OPTIONS} \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0${CC_REPRODUCIBLE_OPTIONS}&#39; \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0CPP=3D&#39;${CCACHE}${HOST_PREFIX}gcc -E ${TOOLCHAIN_OPTIONS} =
\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0${CC_REPRODUCIBLE_OPTIONS}&#39;&quot;<br>
&gt;&gt; +<br>
&gt;&gt; do_compile() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0oe_runmake xen PYTHON=3D&quot;${PYTHON}&quot; \=
<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 EXTRA_CFLAGS_XEN_CORE=3D&quot;${EXTRA_CFLAGS_XEN_CORE}&quot;<br>
&gt;&gt; diff --git a/recipes-extended/xen/<a href=3D"http://xen-tools_git.=
bb" rel=3D"noreferrer" target=3D"_blank">xen-tools_git.bb</a> b/recipes-ext=
ended/xen/<a href=3D"http://xen-tools_git.bb" rel=3D"noreferrer" target=3D"=
_blank">xen-tools_git.bb</a><br>
&gt;&gt; index 8ff9c4c..e733f1d 100644<br>
&gt;&gt; --- a/recipes-extended/xen/<a href=3D"http://xen-tools_git.bb" rel=
=3D"noreferrer" target=3D"_blank">xen-tools_git.bb</a><br>
&gt;&gt; +++ b/recipes-extended/xen/<a href=3D"http://xen-tools_git.bb" rel=
=3D"noreferrer" target=3D"_blank">xen-tools_git.bb</a><br>
&gt;&gt; @@ -1,5 +1,5 @@<br>
&gt;&gt; -# master status on 2020-10-21<br>
&gt;&gt; -SRCREV ?=3D &quot;23ec1ebc8acbfd2bf06f6085a776f0db923f9fa9&quot;<=
br>
&gt;&gt; +# master status on 2022-03-08<br>
&gt;&gt; +SRCREV ?=3D &quot;9d4a44380d273de22d5753883cbf5581795ff24d&quot;<=
br>
&gt;&gt; <br>
&gt;&gt; XEN_REL ?=3D &quot;4.16&quot;<br>
&gt;&gt; XEN_BRANCH ?=3D &quot;master&quot;<br>
&gt;&gt; diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/x=
en.inc<br>
&gt;&gt; index 4df99bf..8b86de5 100644<br>
&gt;&gt; --- a/recipes-extended/xen/xen.inc<br>
&gt;&gt; +++ b/recipes-extended/xen/xen.inc<br>
&gt;&gt; @@ -193,12 +193,6 @@ do_post_patch() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0fi<br>
&gt;&gt; }<br>
&gt;&gt; <br>
&gt;&gt; -do_post_patch:append:arm()=C2=A0 {<br>
&gt;&gt; -=C2=A0 =C2=A0 # The hypervisor binary must not be built with the =
hard floating point ABI.<br>
&gt;&gt; -=C2=A0 =C2=A0 echo &quot;CC :=3D \$(filter-out ${TUNE_CCARGS},\$(=
CC))&quot; &gt;&gt; ${S}/xen/arch/arm/Rules.mk<br>
&gt;&gt; -=C2=A0 =C2=A0 echo &quot;CPP :=3D \$(filter-out ${TUNE_CCARGS},\$=
(CPP))&quot; &gt;&gt; ${S}/xen/arch/arm/Rules.mk<br>
&gt;&gt; -}<br>
&gt;&gt; -<br>
&gt;&gt; addtask post_patch after do_patch before do_configure<br>
&gt;&gt; <br>
&gt;&gt; # Allow all hypervisor settings in a defconfig<br>
&gt;&gt; diff --git a/recipes-extended/xen/<a href=3D"http://xen_git.bb" re=
l=3D"noreferrer" target=3D"_blank">xen_git.bb</a> b/recipes-extended/xen/<a=
 href=3D"http://xen_git.bb" rel=3D"noreferrer" target=3D"_blank">xen_git.bb=
</a><br>
&gt;&gt; index e014733..2fbfb54 100644<br>
&gt;&gt; --- a/recipes-extended/xen/<a href=3D"http://xen_git.bb" rel=3D"no=
referrer" target=3D"_blank">xen_git.bb</a><br>
&gt;&gt; +++ b/recipes-extended/xen/<a href=3D"http://xen_git.bb" rel=3D"no=
referrer" target=3D"_blank">xen_git.bb</a><br>
&gt;&gt; @@ -1,5 +1,5 @@<br>
&gt;&gt; -# master status on 2020-10-21<br>
&gt;&gt; -SRCREV ?=3D &quot;23ec1ebc8acbfd2bf06f6085a776f0db923f9fa9&quot;<=
br>
&gt;&gt; +# master status on 2022-03-08<br>
&gt;&gt; +SRCREV ?=3D &quot;9d4a44380d273de22d5753883cbf5581795ff24d&quot;<=
br>
&gt;&gt; <br>
&gt;&gt; XEN_REL ?=3D &quot;4.16&quot;<br>
&gt;&gt; XEN_BRANCH ?=3D &quot;master&quot;<br>
&gt;&gt; -- <br>
&gt;&gt; 2.25.1<br>
&gt;&gt; <br>
&gt; <br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#7086): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/7086" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/7086</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/89659618=
/3619089" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.o=
rg/mt/89659618/3619089</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject=
.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproje=
ct.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bertrand.marquis@=
arm.com" target=3D"_blank">bertrand.marquis@arm.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--00000000000017065705d9ef481d--

