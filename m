Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF30ECAAD8
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 13:17:28 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.11751.1663679838011640616
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 06:17:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EIGoIpPZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.172,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id j12so2683209pfi.11
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 06:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=zTm9mOeJRkkpl/VmiFKlpwhddI4AVHtcCmGIHagrHWM=;
        b=EIGoIpPZ2PRXLguHukyUEJ99PZiqDn0iPYUM0QiJKQCXUGt96JPDgpZfaY1SJ9WXpr
         7rVJVS/Gd0kEh4sikSDoHldgZQtAPB/KqxQ9KlfA1zVl0lMjF+UM5QSUcKveO8cMMdOI
         ZAP3nRqOTaMXm4qduYoAzkZ5yYGMPcwmaqmLyJkPiYa+D2akqSDYBUuPpVWAHTgXStUK
         2vIwJROfwZaCi8/t/5iOmHn0tQ2hBSWpsaUIrrgzf+wUdjpP6w0u34wErxF0SIqq4Ke4
         K/fYURjSkeQCcqTzezXk9Gxs36e8q1OlrZgSw+Vtqq2EK4duxD2dYirCPRNJoQ2jMHqa
         AH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=zTm9mOeJRkkpl/VmiFKlpwhddI4AVHtcCmGIHagrHWM=;
        b=xF96DmQcVm2p/oueoR5rOimYrzeKAkxQ0dzkKe3mls+oE4/XVdmzBNPfbHF3KR0uRY
         OxjH9RWC1UeMxoeS8siRxRIJu2Tpq048bwJYTQxkeGsMthueOrd+O9W9BxLadvRTPgdX
         MCfl5bqr149qeHw19MwQyHYkY6crvYDHEAaem/Yq5KSS9wimK/8B1zOgnQSb77lnScwQ
         h4R5e+OTi32wXq6xj2bXK1mqzcZwXBS1hvlRXsVOQoS3bYK9B9IU3PrDJMK9n7ni0v5X
         3MaTpM8orJRwZ/lQRliGGZV0zFv+opglfvZJjv2EKHM9gistNKKD1UNW/5DVS4gbxuEW
         PNgQ==
X-Gm-Message-State: ACrzQf1e4bHaIpXV2/U/s07yJ2BQCCUkh1DirABMEK/6LCuXMG3+EYNH
	6TkyRiuxhTdVCGtC0ZHWzAThQig7YW6YOaHdIEw=
X-Google-Smtp-Source: 
 AMsMyM4bVF5JYKk7rfTQnqzTobxyOCRvfpnFU/GjDELqOC9GtsxISRkoA4cYYa/OjJMoDPZgLl5+cDlWH76AJcaZsD4=
X-Received: by 2002:a05:6a00:cc8:b0:541:5de7:fcd2 with SMTP id
 b8-20020a056a000cc800b005415de7fcd2mr23984615pfv.25.1663679837312; Tue, 20
 Sep 2022 06:17:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220920114609.495910-1-jose.quaresma@foundries.io>
 <CADkTA4NYkryDK5oGDFhA3aWXTtd7t6RTUz9eMKOrbjTrJ7KHDg@mail.gmail.com>
In-Reply-To: 
 <CADkTA4NYkryDK5oGDFhA3aWXTtd7t6RTUz9eMKOrbjTrJ7KHDg@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 20 Sep 2022 14:17:06 +0100
Message-ID: 
 <CANPvuRnd3oQUYC3fqD+GiEFQwX4SV9z5qTUUaTS_kXeSo-X++Q@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] docker: don't use -linkshared
 uncondictional
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Ricardo Salveti <ricardo@foundries.io>,
 Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000b91d6f05e91ba55a"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 20 Sep 2022 13:17:28 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7625

--000000000000b91d6f05e91ba55a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=A7a, 20/09=
/2022
=C3=A0(s) 13:45:

> Jose,
>
> There were a few typos in the patch, I've fixed them up, and tweaked
> the shortlog.
>

Thanks for fixing my typos that is something I need to improve.


>
> I've relocated this to the .inc file, as both docker-moby and
> docker-ce should be consistent with this possible tweak.
>

Relocating to the .inc seams more appropriate but I only test the patch
with docker-ce on riscv.


>
> I also added a comment above the export to indicate that the default
> value comes from go.bbclass and that currently only libnetwork / proxy
> will leverage it.


This kind of description always helps.


>
> The result is on master-next, have a look and let me know if it
> addresses your issue.
>

Perfect, yours looks better.

Jose


>
> Bruce
>
> On Tue, Sep 20, 2022 at 7:46 AM Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> >
> > The linkshared is not supported in some machines like riscv64 and
> > when supported we can use the GO_LINKSHARED instaed.
> > So export GO_LINKSHARED on the recipe to be available for Makafile.
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >  recipes-containers/docker/docker-ce_git.bb                    | 3 +++
> >  .../docker/files/0001-libnetwork-use-GO-instead-of-go.patch   | 4 ++--
> >  2 files changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/recipes-containers/docker/docker-ce_git.bb
> b/recipes-containers/docker/docker-ce_git.bb
> > index b36ac0d..f010648 100644
> > --- a/recipes-containers/docker/docker-ce_git.bb
> > +++ b/recipes-containers/docker/docker-ce_git.bb
> > @@ -55,3 +55,6 @@ DOCKER_VERSION =3D "20.10.17-ce"
> >  PV =3D "${DOCKER_VERSION}+git${SRCREV_docker}"
> >
> >  CVE_PRODUCT =3D "docker"
> > +
> > +# to be used in the Makefile
> > +export GO_LINKSHARED
> > diff --git
> a/recipes-containers/docker/files/0001-libnetwork-use-GO-instead-of-go.pa=
tch
> b/recipes-containers/docker/files/0001-libnetwork-use-GO-instead-of-go.pa=
tch
> > index d4f84e3..b9b41de 100644
> > ---
> a/recipes-containers/docker/files/0001-libnetwork-use-GO-instead-of-go.pa=
tch
> > +++
> b/recipes-containers/docker/files/0001-libnetwork-use-GO-instead-of-go.pa=
tch
> > @@ -34,8 +34,8 @@ Index: git/libnetwork/Makefile
> >         @echo "=F0=9F=90=B3 $@"
> >  -      go build -o "bin/dnet-$$GOOS-$$GOARCH" ./cmd/dnet
> >  -      go build -o "bin/docker-proxy-$$GOOS-$$GOARCH" ./cmd/proxy
> > -+      @$(GO) build -trimpath -linkshared $(GOBUILDFLAGS) -o
> "bin/docker-proxy-$$GOOS-$$GOARCH" ./cmd/proxy
> > -+      @$(GO) build -trimpath -linkshared $(GOBUILDFLAGS) -o
> "bin/dnet-$$GOOS-$$GOARCH" ./cmd/dnet
> > ++      @$(GO) build -trimpath $(GO_LINKSHARED) $(GOBUILDFLAGS) -o
> "bin/docker-proxy-$$GOOS-$$GOARCH" ./cmd/proxy
> > ++      @$(GO) build -trimpath $(GO_LINKSHARED) $(GOBUILDFLAGS) -o
> "bin/dnet-$$GOOS-$$GOARCH" ./cmd/dnet
> >
> >   # Rebuild protocol buffers.
> >   # These may need to be rebuilt after vendoring updates, so .proto
> files are declared .PHONY so they are always rebuilt.
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7621):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7621
> > Mute This Topic: https://lists.yoctoproject.org/mt/93801294/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub
> [bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000b91d6f05e91ba55a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Bruce,</div><div><br></div><div><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">Bruce Ashfield &lt;<a href=
=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; escre=
veu no dia ter=C3=A7a, 20/09/2022 =C3=A0(s) 13:45:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Jose,<br>
<br>
There were a few typos in the patch, I&#39;ve fixed them up, and tweaked<br=
>
the shortlog.<br></blockquote><div><br></div>Thanks for fixing my typos tha=
t is something I need to improve.<br class=3D"gmail-Apple-interchange-newli=
ne"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I&#39;ve relocated this to the .inc file, as both docker-moby and<br>
docker-ce should be consistent with this possible tweak.<br></blockquote><d=
iv><br></div>Relocating to the .inc seams more appropriate but I only test =
the patch with docker-ce on riscv.<br><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<br>
I also added a comment above the export to indicate that the default<br>
value comes from go.bbclass and that currently only libnetwork / proxy<br>
will leverage it.=C2=A0</blockquote><div><br></div><div>This kind of descri=
ption always helps.<br>=C2=A0<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
<br>
The result is on master-next, have a look and let me know if it<br>
addresses your issue.<br></blockquote><div><br></div><div>Perfect, yours lo=
oks better.<br><br>Jose=C2=A0<br>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
Bruce<br>
<br>
On Tue, Sep 20, 2022 at 7:46 AM Jose Quaresma &lt;<a href=3D"mailto:quaresm=
a.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; wrote:<=
br>
&gt;<br>
&gt; The linkshared is not supported in some machines like riscv64 and<br>
&gt; when supported we can use the GO_LINKSHARED instaed.<br>
&gt; So export GO_LINKSHARED on the recipe to be available for Makafile.<br=
>
&gt;<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 recipes-containers/docker/<a href=3D"http://docker-ce_git.bb" re=
l=3D"noreferrer" target=3D"_blank">docker-ce_git.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3 +++<br>
&gt;=C2=A0 .../docker/files/0001-libnetwork-use-GO-instead-of-go.patch=C2=
=A0 =C2=A0| 4 ++--<br>
&gt;=C2=A0 2 files changed, 5 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/recipes-containers/docker/<a href=3D"http://docker-ce_git=
.bb" rel=3D"noreferrer" target=3D"_blank">docker-ce_git.bb</a> b/recipes-co=
ntainers/docker/<a href=3D"http://docker-ce_git.bb" rel=3D"noreferrer" targ=
et=3D"_blank">docker-ce_git.bb</a><br>
&gt; index b36ac0d..f010648 100644<br>
&gt; --- a/recipes-containers/docker/<a href=3D"http://docker-ce_git.bb" re=
l=3D"noreferrer" target=3D"_blank">docker-ce_git.bb</a><br>
&gt; +++ b/recipes-containers/docker/<a href=3D"http://docker-ce_git.bb" re=
l=3D"noreferrer" target=3D"_blank">docker-ce_git.bb</a><br>
&gt; @@ -55,3 +55,6 @@ DOCKER_VERSION =3D &quot;20.10.17-ce&quot;<br>
&gt;=C2=A0 PV =3D &quot;${DOCKER_VERSION}+git${SRCREV_docker}&quot;<br>
&gt;<br>
&gt;=C2=A0 CVE_PRODUCT =3D &quot;docker&quot;<br>
&gt; +<br>
&gt; +# to be used in the Makefile<br>
&gt; +export GO_LINKSHARED<br>
&gt; diff --git a/recipes-containers/docker/files/0001-libnetwork-use-GO-in=
stead-of-go.patch b/recipes-containers/docker/files/0001-libnetwork-use-GO-=
instead-of-go.patch<br>
&gt; index d4f84e3..b9b41de 100644<br>
&gt; --- a/recipes-containers/docker/files/0001-libnetwork-use-GO-instead-o=
f-go.patch<br>
&gt; +++ b/recipes-containers/docker/files/0001-libnetwork-use-GO-instead-o=
f-go.patch<br>
&gt; @@ -34,8 +34,8 @@ Index: git/libnetwork/Makefile<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;=F0=9F=90=B3 $@&quot;<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 go build -o &quot;bin/dnet-$$GOOS-$$GOARCH=
&quot; ./cmd/dnet<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 =C2=A0 go build -o &quot;bin/docker-proxy-$$GOOS-=
$$GOARCH&quot; ./cmd/proxy<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 @$(GO) build -trimpath -linkshared $(GOBUILDFLA=
GS) -o &quot;bin/docker-proxy-$$GOOS-$$GOARCH&quot; ./cmd/proxy<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 @$(GO) build -trimpath -linkshared $(GOBUILDFLA=
GS) -o &quot;bin/dnet-$$GOOS-$$GOARCH&quot; ./cmd/dnet<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 @$(GO) build -trimpath $(GO_LINKSHARED) $(GOBUI=
LDFLAGS) -o &quot;bin/docker-proxy-$$GOOS-$$GOARCH&quot; ./cmd/proxy<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 @$(GO) build -trimpath $(GO_LINKSHARED) $(GOBUI=
LDFLAGS) -o &quot;bin/dnet-$$GOOS-$$GOARCH&quot; ./cmd/dnet<br>
&gt;<br>
&gt;=C2=A0 =C2=A0# Rebuild protocol buffers.<br>
&gt;=C2=A0 =C2=A0# These may need to be rebuilt after vendoring updates, so=
 .proto files are declared .PHONY so they are always rebuilt.<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#7621): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/7621" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/7621</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/93801294=
/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.o=
rg/mt/93801294/1050810</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject=
.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproje=
ct.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gm=
ail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div></div>

--000000000000b91d6f05e91ba55a--

