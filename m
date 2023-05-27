Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBB5AC77B7E
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 12:41:20 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.9237.1685191274154093772
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 27 May 2023 05:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=b3QQiDgM;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-30ad99fa586so1432462f8f.2
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 27 May 2023 05:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685191272; x=1687783272;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pyPoOnoARiV+GOcM9rcZ1my09I56oWUsGh2Cj2YhmDk=;
        b=b3QQiDgMQ6ywsXR/jWL7vAxkzSv2G5oxlYkRyFnlmmsue17b9SVlffymewNxGBh6FT
         UaxWtMMIzE+5XXB//kga0mgpHQ74xOfapOdRGzu6nx4HMNDeDtffnr/E9fTxOsXQYS5f
         Xay4MkfzSpCgLQFzJzosT7EDoDmDnpJ4uSZAu7yy4crWFKxygYPGanKs4fGL01luuLYo
         zoCLDitQ6nNdFeStcyIxSDx1UZvkvcEks3Q9qwmFWLflQ4vxVA6tY4PXux+x6K0NQdWo
         ZBnMAEDjfjKZ35Gpi1SvKUNvu7NyGdqd+esWCOxU9pQ/E8noNcRVImG1zCBjdxGaztSb
         aJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685191272; x=1687783272;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pyPoOnoARiV+GOcM9rcZ1my09I56oWUsGh2Cj2YhmDk=;
        b=FNRAUTrh+BHIzHSOkglpCy5ASBYnf6Gc68UhnzLsm0yY0VAcGPKsGBexpXeSsZkdgv
         GdwmwpZFwZjQV73I5S9AZttXfI9ZlpPckHxhd93tiLRAyUie3BYv9OHbG/2l2yshIOOf
         nCglh+Xr7Y1UaiVOJx3Zb1OljPF7LZ4knO3ylbq/DhhNUNRlg34dEeEmhgvB3ntm6u7E
         mYxX7N06EZbkPo7Nfmr8l49DKDa2xc2LB8VrWyhRYbZrmO0T7MK/o4qTPQtkyovZFXoP
         7V9U22j6ASqlAwXVRdmXVh2zqgS29pRKCfOc2LY7+pmW+EBR+J/qHW/jzj9d3RJicb04
         PIrQ==
X-Gm-Message-State: AC+VfDxGd+5mAdCNY4neG76zKIjx2iqMZfVy8RDLG/dOsKilzIIYXkAr
	zlm0GQhXY9jz77CnkrIJDSWlHJz1t72nZIQzdlo=
X-Google-Smtp-Source: ACHHUZ7OMevuIKahvMQ0Ntp2VxSN8EiLO4zH/QS3cElXpKtQTNni8huRj925/8pog7k8EsmkQo/G0rydysWdhR68Ki4=
X-Received: by 2002:adf:f187:0:b0:306:39e5:f338 with SMTP id
 h7-20020adff187000000b0030639e5f338mr4289843wro.62.1685191272122; Sat, 27 May
 2023 05:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230512050404.1105546-1-mingli.yu@eng.windriver.com> <ZGT3dZ3rr1sKbw98@gmail.com>
In-Reply-To: <ZGT3dZ3rr1sKbw98@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 27 May 2023 14:41:00 +0200
Message-ID: <CA+chaQczv7W0CnsQWVg37Hn_wuJa49-2LsK8UG01idVY0jGxVg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] yq: Redefine do_compile
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "Yu, Mingli" <mingli.yu@eng.windriver.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000274b8c05fcac2b04"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 27 May 2023 12:41:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8077

--000000000000274b8c05fcac2b04
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This fixed https://lists.yoctoproject.org/g/meta-virtualization/message/804=
7
and now can be reverted again in master as go was upgraded in
https://git.openembedded.org/openembedded-core/commit/?id=3De043bfb42156c59=
c93c6a4816528a63cfdaccc3e

On Wed, May 17, 2023 at 5:49=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmai=
l.com>
wrote:

> In message: [meta-virtualization] [PATCH] yq: Redefine do_compile
> on 12/05/2023 Yu, Mingli wrote:
>
> > From: Mingli Yu <mingli.yu@windriver.com>
> >
> > This reverts commit 9b87b12885243c8cbba933e218c325416ec4d19d
> > which states the linkshared issue is resolved. Actually the
> > issue still exists as build fails on qemuarm64 and we still
> > need the fix [1]. So add the fix [1] back and it's also better
> > define its own do_compile and not let the do_compile logic
> > in go.bbclass affect the build.
>
> More yq and linkshared fun!
>
> This is now merged to master and mickledore.
>
> Bruce
>
> >
> > [1]
> https://git.yoctoproject.org/meta-virtualization/commit/?id=3Dd2a630ce6cf=
67a145f218012fbf02e4d0d9648df
> > ---
> >  recipes-devtools/yq/yq_git.bb | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/
> yq_git.bb
> > index 45f2f970..bd474a79 100644
> > --- a/recipes-devtools/yq/yq_git.bb
> > +++ b/recipes-devtools/yq/yq_git.bb
> > @@ -50,7 +50,7 @@ GO_IMPORT =3D "github.com/mikefarah/yq"
> >
> >  inherit go ptest
> >
> > -do_compile:prepend() {
> > +do_compile() {
> >      # arrange for some of the golang built ins to be found
> >      (
> >       cd ${WORKDIR}/build/src/
> > @@ -60,6 +60,7 @@ do_compile:prepend() {
> >      # arrange for the fetched dependencies to be found
> >      export GOPATH=3D"${GOPATH}:${WORKDIR}/build/vendor/"
> >      export GO111MODULE=3Doff
> > +    ${GO} install ${GOBUILDFLAGS} `go_list_packages`
> >  }
> >
> >  do_install:append() {
> > --
> > 2.25.1
> >
>
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8061):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8061
> Mute This Topic: https://lists.yoctoproject.org/mt/98843722/3617156
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe:
> https://lists.yoctoproject.org/g/meta-virtualization/leave/7925988/361715=
6/1068030116/xyzzy
> [Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000274b8c05fcac2b04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This fixed=C2=A0<a href=3D"https://lists.yoctoproject.org/=
g/meta-virtualization/message/8047">https://lists.yoctoproject.org/g/meta-v=
irtualization/message/8047</a> and now can be reverted again in master as g=
o was upgraded in=C2=A0<a href=3D"https://git.openembedded.org/openembedded=
-core/commit/?id=3De043bfb42156c59c93c6a4816528a63cfdaccc3e">https://git.op=
enembedded.org/openembedded-core/commit/?id=3De043bfb42156c59c93c6a4816528a=
63cfdaccc3e</a></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, May 17, 2023 at 5:49=E2=80=AFPM Bruce Ashfield &lt;=
<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">In mess=
age: [meta-virtualization] [PATCH] yq: Redefine do_compile<br>
on 12/05/2023 Yu, Mingli wrote:<br>
<br>
&gt; From: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" target=
=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
&gt; <br>
&gt; This reverts commit 9b87b12885243c8cbba933e218c325416ec4d19d<br>
&gt; which states the linkshared issue is resolved. Actually the<br>
&gt; issue still exists as build fails on qemuarm64 and we still<br>
&gt; need the fix [1]. So add the fix [1] back and it&#39;s also better<br>
&gt; define its own do_compile and not let the do_compile logic<br>
&gt; in go.bbclass affect the build.<br>
<br>
More yq and linkshared fun!<br>
<br>
This is now merged to master and mickledore.<br>
<br>
Bruce<br>
<br>
&gt; <br>
&gt; [1] <a href=3D"https://git.yoctoproject.org/meta-virtualization/commit=
/?id=3Dd2a630ce6cf67a145f218012fbf02e4d0d9648df" rel=3D"noreferrer" target=
=3D"_blank">https://git.yoctoproject.org/meta-virtualization/commit/?id=3Dd=
2a630ce6cf67a145f218012fbf02e4d0d9648df</a><br>
&gt; ---<br>
&gt;=C2=A0 recipes-devtools/yq/<a href=3D"http://yq_git.bb" rel=3D"noreferr=
er" target=3D"_blank">yq_git.bb</a> | 3 ++-<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/recipes-devtools/yq/<a href=3D"http://yq_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">yq_git.bb</a> b/recipes-devtools/yq/<a href=3D=
"http://yq_git.bb" rel=3D"noreferrer" target=3D"_blank">yq_git.bb</a><br>
&gt; index 45f2f970..bd474a79 100644<br>
&gt; --- a/recipes-devtools/yq/<a href=3D"http://yq_git.bb" rel=3D"noreferr=
er" target=3D"_blank">yq_git.bb</a><br>
&gt; +++ b/recipes-devtools/yq/<a href=3D"http://yq_git.bb" rel=3D"noreferr=
er" target=3D"_blank">yq_git.bb</a><br>
&gt; @@ -50,7 +50,7 @@ GO_IMPORT =3D &quot;<a href=3D"http://github.com/mik=
efarah/yq" rel=3D"noreferrer" target=3D"_blank">github.com/mikefarah/yq</a>=
&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 inherit go ptest<br>
&gt;=C2=A0 <br>
&gt; -do_compile:prepend() {<br>
&gt; +do_compile() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # arrange for some of the golang built ins to be f=
ound<br>
&gt;=C2=A0 =C2=A0 =C2=A0 (<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${WORKDIR}/build/src/<br>
&gt; @@ -60,6 +60,7 @@ do_compile:prepend() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # arrange for the fetched dependencies to be found=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 export GOPATH=3D&quot;${GOPATH}:${WORKDIR}/build/v=
endor/&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 export GO111MODULE=3Doff<br>
&gt; +=C2=A0 =C2=A0 ${GO} install ${GOBUILDFLAGS} `go_list_packages`<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 do_install:append() {<br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8061): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8061" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8061</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/98843722/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/98843722/3617156</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/leave/7925988/3617156/1068030116/xyzzy" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.yoctoproject.org/g/meta-virtualization/leave/7925988/3617=
156/1068030116/xyzzy</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" target=
=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000274b8c05fcac2b04--

