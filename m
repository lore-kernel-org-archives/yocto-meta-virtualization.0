Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38BBCC19F29
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 21:42:33 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web12.25397.1658958146147726722
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 27 Jul 2022 14:42:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iZ2ouO0a;
 spf=pass (domain: gmail.com, ip: 209.85.210.174,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id b133so268892pfb.6
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 27 Jul 2022 14:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=nKJtOAimP/tuFGe+EmwqWG2H33bTVWy3Jawz7oflZpY=;
        b=iZ2ouO0aS9EVtuZ+T1bCJfugR4pURAM4GM2/uiFfT7E7zo8OA9SVI5ZHOIC/e/ODrk
         BDySbWcF20brWYLaLIflJ0jfMZe/jJyH6aK51Fe86r3ypIhtwqG5OY9OXil13nRZeqYX
         TeVzoHtuaoj9i9ohyvJc6T7FT7j/HQTFEUEXzcBzFfJkgBndEIB5oJuItlW14YhYP9vc
         P1Ri4Qemakllpgu11dz5JQRiRhmp1KdJP9chYtvFb01w9Sp2W8YRFG6Ovh2s9Lrh1IAM
         N5zrRdDIVfdc4OSnbJZ6UCcJTLLXutediSB71F6KvpjVi1BsqjsLCCbjNiqXWcg5fHiH
         Fdqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=nKJtOAimP/tuFGe+EmwqWG2H33bTVWy3Jawz7oflZpY=;
        b=o5vnoXB3zEclICsyLE5LwjkSq1cU2Vv8l0Iq2p6EznAc4T6gctWen7GlxDkdRGJvaU
         ZyCA9Pyqza96ap+3AwNgCT4oUH24nJlhv6w3A9M+ygUxVSJSIocqLb+brK7yO0OnLt70
         tOnpRgIUb5GFYlYfNXyxIKFzzrhNHoIlaCCsk1AtT62pyBFpKXlqSWQESbDXtKTiSWf9
         DYWwI3QFLsQy4Ande3hviQnSd5b/nZLevg16RdEeCkniC/9rnEwPZ75Yo+qJBSaf2HMp
         yNvSDr1/ONVFD0Vmsn9zWrmn483ZZ7cHSn2oanVR/qL9yLgrYIWa51fnjyvqn3ZGaPbJ
         cZVA==
X-Gm-Message-State: AJIora9g02fcl2fbDR3WDPRWZYpbWLakDKaCZxjR8qmgGolm7+9XMIm7
	eMIFO/aRYx7vOQeJisjbGiAm7UjN3CU1sIAvTzg=
X-Google-Smtp-Source: 
 AGRyM1sdH6HIWTLKaVPJiRQbWdkVlS+AdyWOff7aWs9/fJF18E3UpwnkWTmvcfdS0AfmCjSeu+OOiKWQEmVQhCUaNFQ=
X-Received: by 2002:a63:6945:0:b0:41a:5127:a477 with SMTP id
 e66-20020a636945000000b0041a5127a477mr20394568pgc.15.1658958145114; Wed, 27
 Jul 2022 14:42:25 -0700 (PDT)
MIME-Version: 1.0
References: <BF86DE9A-16AF-4423-95B0-3FFF3ED5A9CD@ieee.org>
 <49660EA1-CD22-40DB-98C7-C43F38A72CCA@ieee.org>
 <CADkTA4MrnrWbWfJNFNdSqDcXOfN=VS11SGy_zrS2+z0Da4p4+w@mail.gmail.com>
 <68F0A22B-8CE4-47A3-A6DF-B19C0D80220A@ieee.org>
In-Reply-To: <68F0A22B-8CE4-47A3-A6DF-B19C0D80220A@ieee.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 27 Jul 2022 14:42:13 -0700
Message-ID: 
 <CANx9H-CtjL1wCyrbd_cJK2KB2hi2rFV-a8jYNHb1T+iUYOnmgA@mail.gmail.com>
Subject: Re: [meta-virtualization] Docker Compose issue regarding the
 deprecation of Python3 distutils on Kirkstone
To: ierturk@ieee.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
 meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000efd63f05e4d04a54"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 27 Jul 2022 21:42:33 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7481

--000000000000efd63f05e4d04a54
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 27, 2022 at 2:34 PM Ibrahim Erturk via lists.yoctoproject.org
<ierturk=3Dieee.org@lists.yoctoproject.org> wrote:

>
> On 27 Jul 2022, at 21:19, Bruce Ashfield <bruce.ashfield@gmail.com> wrote=
:
>
>
> On Wed, Jul 27, 2022 at 3:24 AM Ibrahim Erturk via
> lists.yoctoproject.org <ierturk=3Dieee.org@lists.yoctoproject.org>
> wrote:
>
>
> Hello,
>
> I added the following line into local.conf to get the packages docker and
> docker-compose on Rapberry Pi (meta-raspberrypi) with the branch kirkston=
e.
>
> # Virtualization
> DISTRO_FEATURES:append =3D " virtualization"
> IMAGE_INSTALL:append =3D " docker-ce"
> IMAGE_INSTALL:append =3D " python3-docker-compose=E2=80=9D
> # IMAGE_INSTALL:append =3D " python3-distutils"
>
> However, due to python3-distutils deprecated as of Python3.10, I got the
> following error.
>
> raspberrypi3:~$ docker-compose
> Traceback (most recent call last):
> File "/usr/bin/docker-compose", line 5, in <module>
>   from compose.cli.main import main
> File "/usr/lib/python3.10/site-packages/compose/cli/main.py", line 9, in
> <module>
>   from distutils.spawn import find_executable
> ModuleNotFoundError: No module named =E2=80=98distutils=E2=80=99
>
> Is there any workaround regarding this issue or am I missing some
> configuration?
>
>
> I'm not sure I'm following.
>
> docker-compose has been on the same version for quite some time (mid
> 2021) on pypi (the source repo does have newer versions, so we could
> consider switching to source vs pypi).
>
> and yes, that version is still using distutils. So either you need to
> install the depreciated module, or do an uprev to a newer version
> using the github repo.
>
> Bruce
>
>
> Thanks in advance.
>
> Regards,
> Ibrahim ERTURK
>
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> Hi Bruce,
>
> Thanks for the reply. I explicitly added the deprecated python package
> python3-distutils as follow, and it seem that compose works properly
>
> IMAGE_INSTALL:append =3D " python3-distutils"
>

Or just patch it to use setuptools. It is often very simple.


> Ibrahim
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7480):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7480
> Mute This Topic: https://lists.yoctoproject.org/mt/92644827/924729
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000efd63f05e4d04a54
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Jul 27, 2022 at 2:34 PM Ibrahim Erturk via <a href=
=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;ierturk=
=3D<a href=3D"mailto:ieee.org@lists.yoctoproject.org">ieee.org@lists.yoctop=
roject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div sty=
le=3D"word-wrap:break-word;line-break:after-white-space"></div><div style=
=3D"word-wrap:break-word;line-break:after-white-space"><br><div>On 27 Jul 2=
022, at 21:19, Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.co=
m" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt; wrote:<br><blockquote=
 type=3D"cite"><br><div><span style=3D"font-family:Helvetica;font-size:12px=
;font-style:normal;font-variant-caps:normal;font-weight:normal;letter-spaci=
ng:normal;text-align:start;text-indent:0px;text-transform:none;white-space:=
normal;word-spacing:0px;text-decoration:none;float:none;display:inline!impo=
rtant">On Wed, Jul 27, 2022 at 3:24 AM Ibrahim Erturk via</span><br style=
=3D"font-family:Helvetica;font-size:12px;font-style:normal;font-variant-cap=
s:normal;font-weight:normal;letter-spacing:normal;text-align:start;text-ind=
ent:0px;text-transform:none;white-space:normal;word-spacing:0px;text-decora=
tion:none"><a href=3D"http://lists.yoctoproject.org/" style=3D"font-family:=
Helvetica;font-size:12px;font-style:normal;font-variant-caps:normal;font-we=
ight:normal;letter-spacing:normal;text-align:start;text-indent:0px;text-tra=
nsform:none;white-space:normal;word-spacing:0px" target=3D"_blank">lists.yo=
ctoproject.org</a><span style=3D"font-family:Helvetica;font-size:12px;font-=
style:normal;font-variant-caps:normal;font-weight:normal;letter-spacing:nor=
mal;text-align:start;text-indent:0px;text-transform:none;white-space:normal=
;word-spacing:0px;text-decoration:none;float:none;display:inline!important"=
><span>=C2=A0</span>&lt;</span><a href=3D"mailto:ierturk=3Dieee.org@lists.y=
octoproject.org" style=3D"font-family:Helvetica;font-size:12px;font-style:n=
ormal;font-variant-caps:normal;font-weight:normal;letter-spacing:normal;tex=
t-align:start;text-indent:0px;text-transform:none;white-space:normal;word-s=
pacing:0px" target=3D"_blank">ierturk=3Dieee.org@lists.yoctoproject.org</a>=
<span style=3D"font-family:Helvetica;font-size:12px;font-style:normal;font-=
variant-caps:normal;font-weight:normal;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
text-decoration:none;float:none;display:inline!important">&gt;</span><br st=
yle=3D"font-family:Helvetica;font-size:12px;font-style:normal;font-variant-=
caps:normal;font-weight:normal;letter-spacing:normal;text-align:start;text-=
indent:0px;text-transform:none;white-space:normal;word-spacing:0px;text-dec=
oration:none"><span style=3D"font-family:Helvetica;font-size:12px;font-styl=
e:normal;font-variant-caps:normal;font-weight:normal;letter-spacing:normal;=
text-align:start;text-indent:0px;text-transform:none;white-space:normal;wor=
d-spacing:0px;text-decoration:none;float:none;display:inline!important">wro=
te:</span><br style=3D"font-family:Helvetica;font-size:12px;font-style:norm=
al;font-variant-caps:normal;font-weight:normal;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;text-decoration:none"><blockquote type=3D"cite" style=3D"font-famil=
y:Helvetica;font-size:12px;font-style:normal;font-variant-caps:normal;font-=
weight:normal;letter-spacing:normal;text-align:start;text-indent:0px;text-t=
ransform:none;white-space:normal;word-spacing:0px;text-decoration:none"><br=
>Hello,<br><br>I added the following line into local.conf to get the packag=
es docker and docker-compose on Rapberry Pi (meta-raspberrypi) with the bra=
nch kirkstone.<br><br># Virtualization<br>DISTRO_FEATURES:append =3D &quot;=
 virtualization&quot;<br>IMAGE_INSTALL:append =3D &quot; docker-ce&quot;<br=
>IMAGE_INSTALL:append =3D &quot; python3-docker-compose=E2=80=9D<br># IMAGE=
_INSTALL:append =3D &quot; python3-distutils&quot;<br><br>However, due to p=
ython3-distutils deprecated as of Python3.10, I got the following error.<br=
><br>raspberrypi3:~$ docker-compose<br>Traceback (most recent call last):<b=
r>File &quot;/usr/bin/docker-compose&quot;, line 5, in &lt;module&gt;<br>=
=C2=A0=C2=A0from compose.cli.main import main<br>File &quot;/usr/lib/python=
3.10/site-packages/compose/cli/main.py&quot;, line 9, in &lt;module&gt;<br>=
=C2=A0=C2=A0from distutils.spawn import find_executable<br>ModuleNotFoundEr=
ror: No module named =E2=80=98distutils=E2=80=99<br><br>Is there any workar=
ound regarding this issue or am I missing some configuration?<br></blockquo=
te><br style=3D"font-family:Helvetica;font-size:12px;font-style:normal;font=
-variant-caps:normal;font-weight:normal;letter-spacing:normal;text-align:st=
art;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px=
;text-decoration:none"><span style=3D"font-family:Helvetica;font-size:12px;=
font-style:normal;font-variant-caps:normal;font-weight:normal;letter-spacin=
g:normal;text-align:start;text-indent:0px;text-transform:none;white-space:n=
ormal;word-spacing:0px;text-decoration:none;float:none;display:inline!impor=
tant">I&#39;m not sure I&#39;m following.</span><br style=3D"font-family:He=
lvetica;font-size:12px;font-style:normal;font-variant-caps:normal;font-weig=
ht:normal;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;text-decoration:none"><br sty=
le=3D"font-family:Helvetica;font-size:12px;font-style:normal;font-variant-c=
aps:normal;font-weight:normal;letter-spacing:normal;text-align:start;text-i=
ndent:0px;text-transform:none;white-space:normal;word-spacing:0px;text-deco=
ration:none"><span style=3D"font-family:Helvetica;font-size:12px;font-style=
:normal;font-variant-caps:normal;font-weight:normal;letter-spacing:normal;t=
ext-align:start;text-indent:0px;text-transform:none;white-space:normal;word=
-spacing:0px;text-decoration:none;float:none;display:inline!important">dock=
er-compose has been on the same version for quite some time (mid</span><br =
style=3D"font-family:Helvetica;font-size:12px;font-style:normal;font-varian=
t-caps:normal;font-weight:normal;letter-spacing:normal;text-align:start;tex=
t-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;text-d=
ecoration:none"><span style=3D"font-family:Helvetica;font-size:12px;font-st=
yle:normal;font-variant-caps:normal;font-weight:normal;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;text-decoration:none;float:none;display:inline!important">2=
021) on pypi (the source repo does have newer versions, so we could</span><=
br style=3D"font-family:Helvetica;font-size:12px;font-style:normal;font-var=
iant-caps:normal;font-weight:normal;letter-spacing:normal;text-align:start;=
text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;tex=
t-decoration:none"><span style=3D"font-family:Helvetica;font-size:12px;font=
-style:normal;font-variant-caps:normal;font-weight:normal;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;text-decoration:none;float:none;display:inline!important=
">consider switching to source vs pypi).</span><br style=3D"font-family:Hel=
vetica;font-size:12px;font-style:normal;font-variant-caps:normal;font-weigh=
t:normal;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;text-decoration:none"><br styl=
e=3D"font-family:Helvetica;font-size:12px;font-style:normal;font-variant-ca=
ps:normal;font-weight:normal;letter-spacing:normal;text-align:start;text-in=
dent:0px;text-transform:none;white-space:normal;word-spacing:0px;text-decor=
ation:none"><span style=3D"font-family:Helvetica;font-size:12px;font-style:=
normal;font-variant-caps:normal;font-weight:normal;letter-spacing:normal;te=
xt-align:start;text-indent:0px;text-transform:none;white-space:normal;word-=
spacing:0px;text-decoration:none;float:none;display:inline!important">and y=
es, that version is still using distutils. So either you need to</span><br =
style=3D"font-family:Helvetica;font-size:12px;font-style:normal;font-varian=
t-caps:normal;font-weight:normal;letter-spacing:normal;text-align:start;tex=
t-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;text-d=
ecoration:none"><span style=3D"font-family:Helvetica;font-size:12px;font-st=
yle:normal;font-variant-caps:normal;font-weight:normal;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;text-decoration:none;float:none;display:inline!important">i=
nstall the depreciated module, or do an uprev to a newer version</span><br =
style=3D"font-family:Helvetica;font-size:12px;font-style:normal;font-varian=
t-caps:normal;font-weight:normal;letter-spacing:normal;text-align:start;tex=
t-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;text-d=
ecoration:none"><span style=3D"font-family:Helvetica;font-size:12px;font-st=
yle:normal;font-variant-caps:normal;font-weight:normal;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;text-decoration:none;float:none;display:inline!important">u=
sing the github repo.</span><br style=3D"font-family:Helvetica;font-size:12=
px;font-style:normal;font-variant-caps:normal;font-weight:normal;letter-spa=
cing:normal;text-align:start;text-indent:0px;text-transform:none;white-spac=
e:normal;word-spacing:0px;text-decoration:none"><br style=3D"font-family:He=
lvetica;font-size:12px;font-style:normal;font-variant-caps:normal;font-weig=
ht:normal;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;text-decoration:none"><span s=
tyle=3D"font-family:Helvetica;font-size:12px;font-style:normal;font-variant=
-caps:normal;font-weight:normal;letter-spacing:normal;text-align:start;text=
-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;text-de=
coration:none;float:none;display:inline!important">Bruce</span><br style=3D=
"font-family:Helvetica;font-size:12px;font-style:normal;font-variant-caps:n=
ormal;font-weight:normal;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;text-decoratio=
n:none"><br style=3D"font-family:Helvetica;font-size:12px;font-style:normal=
;font-variant-caps:normal;font-weight:normal;letter-spacing:normal;text-ali=
gn:start;text-indent:0px;text-transform:none;white-space:normal;word-spacin=
g:0px;text-decoration:none"><blockquote type=3D"cite" style=3D"font-family:=
Helvetica;font-size:12px;font-style:normal;font-variant-caps:normal;font-we=
ight:normal;letter-spacing:normal;text-align:start;text-indent:0px;text-tra=
nsform:none;white-space:normal;word-spacing:0px;text-decoration:none"><br>T=
hanks in advance.<br><br>Regards,<br>Ibrahim ERTURK<br><br><br></blockquote=
><br style=3D"font-family:Helvetica;font-size:12px;font-style:normal;font-v=
ariant-caps:normal;font-weight:normal;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;t=
ext-decoration:none"><br style=3D"font-family:Helvetica;font-size:12px;font=
-style:normal;font-variant-caps:normal;font-weight:normal;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;text-decoration:none"><span style=3D"font-family:Helveti=
ca;font-size:12px;font-style:normal;font-variant-caps:normal;font-weight:no=
rmal;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px;text-decoration:none;float:none;di=
splay:inline!important">--<span>=C2=A0</span></span><br style=3D"font-famil=
y:Helvetica;font-size:12px;font-style:normal;font-variant-caps:normal;font-=
weight:normal;letter-spacing:normal;text-align:start;text-indent:0px;text-t=
ransform:none;white-space:normal;word-spacing:0px;text-decoration:none"><sp=
an style=3D"font-family:Helvetica;font-size:12px;font-style:normal;font-var=
iant-caps:normal;font-weight:normal;letter-spacing:normal;text-align:start;=
text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;tex=
t-decoration:none;float:none;display:inline!important">- Thou shalt not fol=
low the NULL pointer, for chaos and madness await</span><br style=3D"font-f=
amily:Helvetica;font-size:12px;font-style:normal;font-variant-caps:normal;f=
ont-weight:normal;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;text-decoration:none"=
><span style=3D"font-family:Helvetica;font-size:12px;font-style:normal;font=
-variant-caps:normal;font-weight:normal;letter-spacing:normal;text-align:st=
art;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px=
;text-decoration:none;float:none;display:inline!important">thee at its end<=
/span><br style=3D"font-family:Helvetica;font-size:12px;font-style:normal;f=
ont-variant-caps:normal;font-weight:normal;letter-spacing:normal;text-align=
:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:=
0px;text-decoration:none"><span style=3D"font-family:Helvetica;font-size:12=
px;font-style:normal;font-variant-caps:normal;font-weight:normal;letter-spa=
cing:normal;text-align:start;text-indent:0px;text-transform:none;white-spac=
e:normal;word-spacing:0px;text-decoration:none;float:none;display:inline!im=
portant">- &quot;Use the force Harry&quot; - Gandalf, Star Trek II</span></=
div></blockquote></div><br></div><div style=3D"word-wrap:break-word;line-br=
eak:after-white-space"><div>Hi Bruce,</div><div><br></div><div><div>Thanks =
for the reply. I explicitly added the deprecated python package python3-dis=
tutils as follow, and it seem that compose works properly</div><div><br></d=
iv><div>IMAGE_INSTALL:append =3D &quot; python3-distutils&quot;</div><div><=
/div></div></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Or just patch it to use setuptools. It is often very simple.</div><div dir=
=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div style=3D"word-wrap:=
break-word;line-break:after-white-space"><div><div><br></div><div>Ibrahim</=
div></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#7480): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/7480" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/7480</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/92644827/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt/=
92644827/924729</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" ta=
rget=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000efd63f05e4d04a54--

