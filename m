Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web09.6369.1635212526741394497
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 Oct 2021 18:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VvFt/nPu;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id u13so6887864edy.10
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 Oct 2021 18:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2ai9rfBO40UY8gjLrXItdXUbF2f6v7nkt7brhMwN3yA=;
        b=VvFt/nPuqfRcVFdD21MupP3NQB3gR0/PxNBfK8/Tfk8aHEHNqqBtz7yvpQDO/wXtwY
         hoTH+ZR6F/HuYlrr56NEKd3yiqudTc0TsQjEkBHs0fK6nLFLXzUMpdm7qI6dd6BGSAhK
         dMGLjB/l5ZWOle5JowFsSQMe0R5M8svL9dffXz3vy+HQ+nFet1vlqlsMsftR/Va1GS7g
         QTMkHZ3x4PNzZLDYzjfmd8EjqFS0hTK9KCYSZ0t3ac0JXP7HbnwBrtYpmrdbrvKpn9pB
         yUKujnQJ9e8RXoaoHHuaggGm2mteuxRFyp+5LTE29cc1S5Wbh9kEKmOGjP4bA5j865Pa
         6Yyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2ai9rfBO40UY8gjLrXItdXUbF2f6v7nkt7brhMwN3yA=;
        b=mNU8NDs4U6SNPjRdc3cSc7l6OU9/2uwfuAgCvCJ9ZfwGH+lai997LYd/jas9FQMMu3
         6aARXPVYZG64QHPq93CvscaqPeMo6xagDSB3E1Pc65/WSCYbKeVk9fUoKJGXsOLSxbVM
         /ERWRFbU3H7y8Tx+bmkwEoB5ytu46x9a9bi74Wf+ht7cMsjRB4K9ToHxuhwnDLoxYh54
         4UZ98EUoGcHtRsMHv5STp0TOdwW2AdCW0baVg6zVd4BvtVhCNlW3fBPEJvp1tnWipFR9
         ro727L0LQZ4ji/K5CvCSlxYxPc0TiSFpPN3vYtwEoKh8KHiam2YsgWU4dg3ZlFjD39xF
         tAiQ==
X-Gm-Message-State: AOAM5318mHzOuXFvTqlpeP+hZM8TfUIzK+yaeHillS50ETu2bK//1w64
	AcC6yiajG+OUA+Y+uJD5RJtm3jnR7PyOXMSOybQ=
X-Google-Smtp-Source: ABdhPJycq0pKP1RVfUuUl5F0HcIyC8iW0/7Zh5zAOu6F8ja6WYyQNo06hR9r/x5obfMbViNz20tD2s9GZoJB66KLhNs=
X-Received: by 2002:a17:906:3542:: with SMTP id s2mr26496701eja.379.1635212524849;
 Mon, 25 Oct 2021 18:42:04 -0700 (PDT)
MIME-Version: 1.0
References: <28d55e92-0471-6a72-914e-3d9b2529373b@systech.com> <04a849b5-7e46-8424-24ae-7a3201470e7c@systech.com>
In-Reply-To: <04a849b5-7e46-8424-24ae-7a3201470e7c@systech.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 25 Oct 2021 21:41:53 -0400
Message-ID: <CADkTA4NEEVkbK-qp+VcLUBFDKWy2D22ns_w_LovdqNMoaMq3ig@mail.gmail.com>
Subject: Re: Problems Building Docker with dunfell
To: jay.foster@systech.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000ad0f4305cf379593"

--000000000000ad0f4305cf379593
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 25, 2021 at 8:26 PM Jay Foster <jay.foster@systech.com> wrote:

> Sorry for the noise.  I think I found my silly mistake.  I checked out
> the dunfell branch instead of the yocto-3.1.11 tag, which results in a
> newer, incompatible, version of go.
>

The tip of dunfell should be fine, it doesn't take those sorts of upgrades
(incompatible go updates).

I fired off a clean build from the latest dunfell, and didn't have any
issues.

Bruce


> Jay
>
> On 10/25/2021 3:38 PM, Jay Foster wrote:
> > I am trying to build docker (virtual/docker) from dunfell
> > meta/virtualization layer with go from the dunfell
> > meta/recipes-devtools/go and cannot get it to build.  docker, runc,
> > and containerd (the go based programs) each fail with an error like:
> >
> > DEBUG: Executing shell function do_compile
> > NOTE: make -j 6 GODEBUG=3D1 binaries
> > =F0=9F=87=A9 bin/ctr
> > go: cannot find main module, but found vendor.conf in
> >
> /home2/jay/work/sc-docker/sc20_linux/poky/build/tmp-glibc/work/armv7ahf-n=
eon-oe-linux-gnueabi/containerd-opencontainers/v1.2.14+gitAUTOINC+3b3e9d5f6=
2-r0/git/src/import
> >     to create a module there, run:
> >     go mod init
> > Makefile:173: recipe for target 'bin/ctr' failed
> > make: *** [bin/ctr] Error 1
> > ERROR: oe_runmake failed
> > WARNING:
> >
> /home2/jay/work/sc-docker/sc20_linux/poky/build/tmp-glibc/work/armv7ahf-n=
eon-oe-linux-gnueabi/containerd-opencontainers/v1.2.14+gitAUTOINC+3b3e9d5f6=
2-r0/temp/run.do_compile.23657:1
>
> > exit 1 from 'exit 1'
> > ERROR: Function failed: do_compile (log file is located at
> >
> /home2/jay/work/sc-docker/sc20_linux/poky/build/tmp-glibc/work/armv7ahf-n=
eon-oe-linux-gnueabi/containerd-opencontainers/v1.2.14+gitAUTOINC+3b3e9d5f6=
2-r0/temp/log.do_compile.23657)
> >
> >
> > DEBUG: Executing shell function do_compile
> > NOTE: make -j 6 BUILDTAGS=3D${PACKAGECONFIG_CONFARGS}
> > GO=3Darm-oe-linux-gnueabi-go static
> > CGO_ENABLED=3D1 arm-oe-linux-gnueabi-go build  -tags " netgo osusergo
> > static_build" -installsuffix netgo -ldflags "-w -extldflags -static -X
> > main.gitCommit=3D"425e105d5a03fabd737a126ad93d62a9eeede87f-dirty" -X
> > main.version=3D1.0.0-rc8 " -o runc .
> > go: cannot find main module, but found vendor.conf in
> >
> /home2/jay/work/sc-docker/sc20_linux/poky/build/tmp-glibc/work/armv7ahf-n=
eon-oe-linux-gnueabi/runc-docker/1.0.0-rc8+gitAUTOINC+425e105d5a-r0/git/src=
/import
> >     to create a module there, run:
> >     go mod init
> > Makefile:43: recipe for target 'static' failed
> > make: *** [static] Error 1
> > ERROR: oe_runmake failed
> > WARNING:
> >
> /home2/jay/work/sc-docker/sc20_linux/poky/build/tmp-glibc/work/armv7ahf-n=
eon-oe-linux-gnueabi/runc-docker/1.0.0-rc8+gitAUTOINC+425e105d5a-r0/temp/ru=
n.do_compile.23438:1
>
> > exit 1 from 'exit 1'
> > ERROR: Function failed: do_compile (log file is located at
> >
> /home2/jay/work/sc-docker/sc20_linux/poky/build/tmp-glibc/work/armv7ahf-n=
eon-oe-linux-gnueabi/runc-docker/1.0.0-rc8+gitAUTOINC+425e105d5a-r0/temp/lo=
g.do_compile.23438)
> >
> > Am I missing something obvious or is meta/virtualization (dunfell) out
> > of sync with meta (dunfell)?
> >
> > Jay
> >
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000ad0f4305cf379593
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Oct 25, 2021 at 8:26 PM Jay Foster &lt;<a h=
ref=3D"mailto:jay.foster@systech.com">jay.foster@systech.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Sorry for the n=
oise.=C2=A0 I think I found my silly mistake.=C2=A0 I checked out <br>
the dunfell branch instead of the yocto-3.1.11 tag, which results in a <br>
newer, incompatible, version of go.<br></blockquote><div><br></div><div><di=
v class=3D"gmail_default" style=3D"font-size:small"> The tip of dunfell sho=
uld be fine, it doesn&#39;t take those sorts of upgrades (incompatible go u=
pdates).</div><div class=3D"gmail_default" style=3D"font-size:small"><br></=
div><div class=3D"gmail_default" style=3D"font-size:small">I fired off a cl=
ean build from the latest=C2=A0dunfell, and didn&#39;t have any issues.</di=
v></div><div>=C2=A0</div><div><div class=3D"gmail_default" style=3D"font-si=
ze:small">Bruce</div><div class=3D"gmail_default" style=3D"font-size:small"=
></div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Jay<br>
<br>
On 10/25/2021 3:38 PM, Jay Foster wrote:<br>
&gt; I am trying to build docker (virtual/docker) from dunfell <br>
&gt; meta/virtualization layer with go from the dunfell <br>
&gt; meta/recipes-devtools/go and cannot get it to build.=C2=A0 docker, run=
c, <br>
&gt; and containerd (the go based programs) each fail with an error like:<b=
r>
&gt;<br>
&gt; DEBUG: Executing shell function do_compile<br>
&gt; NOTE: make -j 6 GODEBUG=3D1 binaries<br>
&gt; =F0=9F=87=A9 bin/ctr<br>
&gt; go: cannot find main module, but found vendor.conf in <br>
&gt; /home2/jay/work/sc-docker/sc20_linux/poky/build/tmp-glibc/work/armv7ah=
f-neon-oe-linux-gnueabi/containerd-opencontainers/v1.2.14+gitAUTOINC+3b3e9d=
5f62-r0/git/src/import<br>
&gt; =C2=A0=C2=A0 =C2=A0to create a module there, run:<br>
&gt; =C2=A0=C2=A0 =C2=A0go mod init<br>
&gt; Makefile:173: recipe for target &#39;bin/ctr&#39; failed<br>
&gt; make: *** [bin/ctr] Error 1<br>
&gt; ERROR: oe_runmake failed<br>
&gt; WARNING: <br>
&gt; /home2/jay/work/sc-docker/sc20_linux/poky/build/tmp-glibc/work/armv7ah=
f-neon-oe-linux-gnueabi/containerd-opencontainers/v1.2.14+gitAUTOINC+3b3e9d=
5f62-r0/temp/run.do_compile.23657:1 <br>
&gt; exit 1 from &#39;exit 1&#39;<br>
&gt; ERROR: Function failed: do_compile (log file is located at <br>
&gt; /home2/jay/work/sc-docker/sc20_linux/poky/build/tmp-glibc/work/armv7ah=
f-neon-oe-linux-gnueabi/containerd-opencontainers/v1.2.14+gitAUTOINC+3b3e9d=
5f62-r0/temp/log.do_compile.23657)<br>
&gt;<br>
&gt;<br>
&gt; DEBUG: Executing shell function do_compile<br>
&gt; NOTE: make -j 6 BUILDTAGS=3D${PACKAGECONFIG_CONFARGS} <br>
&gt; GO=3Darm-oe-linux-gnueabi-go static<br>
&gt; CGO_ENABLED=3D1 arm-oe-linux-gnueabi-go build=C2=A0 -tags &quot; netgo=
 osusergo <br>
&gt; static_build&quot; -installsuffix netgo -ldflags &quot;-w -extldflags =
-static -X <br>
&gt; main.gitCommit=3D&quot;425e105d5a03fabd737a126ad93d62a9eeede87f-dirty&=
quot; -X <br>
&gt; main.version=3D1.0.0-rc8 &quot; -o runc .<br>
&gt; go: cannot find main module, but found vendor.conf in <br>
&gt; /home2/jay/work/sc-docker/sc20_linux/poky/build/tmp-glibc/work/armv7ah=
f-neon-oe-linux-gnueabi/runc-docker/1.0.0-rc8+gitAUTOINC+425e105d5a-r0/git/=
src/import<br>
&gt; =C2=A0=C2=A0 =C2=A0to create a module there, run:<br>
&gt; =C2=A0=C2=A0 =C2=A0go mod init<br>
&gt; Makefile:43: recipe for target &#39;static&#39; failed<br>
&gt; make: *** [static] Error 1<br>
&gt; ERROR: oe_runmake failed<br>
&gt; WARNING: <br>
&gt; /home2/jay/work/sc-docker/sc20_linux/poky/build/tmp-glibc/work/armv7ah=
f-neon-oe-linux-gnueabi/runc-docker/1.0.0-rc8+gitAUTOINC+425e105d5a-r0/temp=
/run.do_compile.23438:1 <br>
&gt; exit 1 from &#39;exit 1&#39;<br>
&gt; ERROR: Function failed: do_compile (log file is located at <br>
&gt; /home2/jay/work/sc-docker/sc20_linux/poky/build/tmp-glibc/work/armv7ah=
f-neon-oe-linux-gnueabi/runc-docker/1.0.0-rc8+gitAUTOINC+425e105d5a-r0/temp=
/log.do_compile.23438)<br>
&gt;<br>
&gt; Am I missing something obvious or is meta/virtualization (dunfell) out=
 <br>
&gt; of sync with meta (dunfell)?<br>
&gt;<br>
&gt; Jay<br>
&gt;<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000ad0f4305cf379593--
