Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00345C19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 16:36:08 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web09.14159.1660062961215098515
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 09:36:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JH6xCZOn;
 spf=pass (domain: gmail.com, ip: 209.85.208.170,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id v7so13556107ljj.4
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 09:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=uGFyQfkeiq6T8/M86j1YMiNtbAINjtrDOw5z6+8JTSw=;
        b=JH6xCZOnYYTACZTyCI01+qaHDwa6DVPCQSnukuHy/Z/x4NcAwvFU2XBG9ZzFbe13ui
         FNynn+IDupicNc5PPfI5kwckv3C4TgZdPHFV651VdaHmTxkiEOJzFzY7t0PLh8tnVC/G
         09R9bTofyrjKSXyPf/ZXSXn8aaVINIKoK8nAKWSD731Q4iol0SxhNZN0NzFCSXdzdAHG
         9M2fpBKPuHr5Ou5w176Ar1HMXZlCFpR+rmMWFolT6CmDyRtVbosIl85BMZ7T1RZJWpWL
         3Hc+o6nUFBrECtgDaDLY5zIHtH2xHCLtGJnzQEzr1PC8OBOtfEZTdVNzvLcgWHJeUdoM
         gmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=uGFyQfkeiq6T8/M86j1YMiNtbAINjtrDOw5z6+8JTSw=;
        b=UTwOlbYEReq4cxN7TpufYrGPZuDmz8PUnnJw1v4zdfc21SH6IFmQj8mfrFK4i+7Msf
         Dr8x7i8JPf0Z6QKzKrNLgivsRtWpOQtULrWYYQnMX/f2lYPAHj9inpdB+XiA2taDfZG1
         C8YDXLnN/tL7+YFcgmJfGrupO11mGVpNqG2phX83BpE4s0ehUbGNKCulB48+a4zQntES
         NNXnej53uPLw0G1YXhpnzzhjRQ3LwwgCwcoBfCfHbXn9eXnsKVK/Jfgh02MsCEmUiyED
         y8MoQAcCtp8VxRhybWJ+mhdwTgfy9dFJ6HPxEHkuTyzATxxC1SxalsLrW7m8/hsxay8W
         BElg==
X-Gm-Message-State: ACgBeo2u0s9hHJBwzeobQGkujUGqXZma6kCu42Hl4Lz5SwCzx3eBOguA
	uU2zPJJkcXZnzVGKS83JKTwEbdwzE2yoiRHe61o=
X-Google-Smtp-Source: 
 AA6agR7QlYu4RtCEqhU7ulxpvKjRRQqZ+XdgZz5FZDCXaUFhI2KfuNTf+AxDkpzO4gO+p+XSKnpyCW2UZa4GtSNvGzg=
X-Received: by 2002:a05:651c:92:b0:25f:f326:f2c1 with SMTP id
 18-20020a05651c009200b0025ff326f2c1mr1177639ljq.273.1660062959262; Tue, 09
 Aug 2022 09:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220809121619.32258-1-jose.quaresma@foundries.io>
 <20220809121619.32258-2-jose.quaresma@foundries.io>
 <CADkTA4OGLGXrRWaEVJMpUKs_X3F3nJf1Y7LUQP4SziXXPaBJ2g@mail.gmail.com>
 <CANPvuRkiHG6_Rbw_oh_JaJYzbs+YkbhSSbQfsXaURRVfcPD4hg@mail.gmail.com>
 <CADkTA4PCWwSU2zGud1PABZbqFrrwwG-0dzmUock_9qfonzy_Kg@mail.gmail.com>
 <CANPvuRkb99OunJcrDaQCVXU7kpqkmxo_oUDiSYG0c8Q8+SttXQ@mail.gmail.com>
 <1709B323FD9DD073.19746@lists.yoctoproject.org>
 <CADkTA4N2haNGYTvxUCU6kEObZkE9RjYUd7_QYskCWUrskjEB9Q@mail.gmail.com>
In-Reply-To: 
 <CADkTA4N2haNGYTvxUCU6kEObZkE9RjYUd7_QYskCWUrskjEB9Q@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 9 Aug 2022 17:35:47 +0100
Message-ID: 
 <CANPvuR=R9WWNRvEBbve+fXkXWqVrCLKr4jBRdu2AbAW3NPd7KQ@mail.gmail.com>
Subject: Re: [meta-virtualization][kirkstone][master][PATCH 2/4] kubernetes:
 install the binaries in OE standard places
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000fde1ca05e5d1868f"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Aug 2022 16:36:08 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7510

--000000000000fde1ca05e5d1868f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=A7a, 9/08/=
2022
=C3=A0(s) 16:05:

> On Tue, Aug 9, 2022 at 10:21 AM Bruce Ashfield via
> lists.yoctoproject.org
> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > On Tue, Aug 9, 2022 at 10:02 AM Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> > >
> > >
> > >
> > > Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=A7a,
> 9/08/2022 =C3=A0(s) 14:43:
> > >>
> > >> On Tue, Aug 9, 2022 at 9:34 AM Jose Quaresma <quaresma.jose@gmail.co=
m>
> wrote:
> > >> >
> > >> > Hi Bruce,
> > >> >
> > >> > Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=
=A7a,
> 9/08/2022 =C3=A0(s) 14:19:
> > >> >>
> > >> >> You must have something different in your environment, I'm not
> seeing
> > >> >> any of these same issues.
> > >> >
> > >> >
> > >> > Maybe because you have the BIN_PREFIX defined somewhere in your
> distro or local.conf
> > >> > BIN_PREFIX is defined only in k3s recipe BIN_PREFIX ?=3D
> "${exec_prefix}/local"
> > >> >
> > >>
> > >> I'm building a plain OE + meta-virt. BIN_PREFIX isn't in the
> > >> environment anywhere (which is admittedly strange .. but that's
> > >> consistent with how it has been).
> > >>
> > >> Also, there's no other reports of this ever on the mailing list,
> > >> including demos for conferences, etc. ... that fails the "how can th=
is
> > >> be working for everyone else ?" test.
> > >>
> > >> So there's definitely something different that I'm not seeing. I use
> > >> OE nodistro or poky, others are using some other distros .. so I nee=
d
> > >> to figure out what is the difference.
> > >>
> > >> That being said, even if we tweaked the binaries install, we don't
> > >> want them changing where they've been installed previously, there
> > >> could be any number of scripts expecting those locations in layers
> > >> that I don't maintain.
> > >>
> > >> i.e. there's no way we should be patching the .service file, since
> > >> that indicates the binaries have moved from where they were before.
> > >>
> > >> Bruce
> > >>
> > >
> > > By default with BIN_PREFIX=3D"" the binaries seem to be installed on
> /bin/k8s-init so they will work as this is in the PATH.
> > > For OE nodistro maybe this QA is disabled (need to confirm that) but
> for distros that have this QA enabled it will fire up.
> > >
> >
> > The installed but not shipped, isn't inhibited anywhere that I know
> > of. Certainly not on poky, which is where most of the nightly builds
> > happen for this.
> >
> > > About moving the binaries for another place is mainly because /bin is
> not the right place for them IMO.
> > > https://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/bin.html
> >
> > But that's not where they are going for all the rest of the builds :)
> > I'm aware of the various filesystem standards.
> >
> > >
> > > But I forgot to update all the services involved in this patch set so
> please drop it all and I will update all services as well in V2.
> > >
> >
> > I wouldn't bother with that for v2, since again, they are using
> > /usr/bin and /usr/local/bin from all the .service files I recall, and
> > that's where we want the binaries to continue to be.
> >
>
> aha. I see that k3s does set BIN_PREFIX, but it has been lost for
> kubernetes and nerdctl.
>

right, maybe you don't see the QA because it will only shon for files
installed in /bin when usrmerge is enabled.

for nerdctl, the BIN_PREFIX is there from the beginning so the recipe
allway install it in /bin.
for kubernetes, BIN_PREFIX is added in [1] and this only install k8s-init
in /bin and all the other binaries
continue where they were installed (in /usr/bin in this case).

[1] -
https://git.yoctoproject.org/meta-virtualization/commit/?id=3D4d0f0a5ca2338=
e5f6ed3fe3a18c602447cf60eb4


> The easiest / lowest footprint route is to just add the variable back
> in for kubernetes and nerdctl, to the current default location. That
> allows folks to override it and/or keep their scripts/service files
> unmodified.
>

This is what I did but using ${bindir} instead of ${BIN_PREFIX}.
Adding the BIN_PREFIX ?=3D "${exec_prefix}/local" will change install
location so
since we have to change, we can use the ${bindir} and put the files in the
right place.

The last patch for k3s is more invasive as it touches many places and the
systemd services as well.
I will send it separate because this one don't fix anything and only change
the installation of binaries
from /usr/local/bin to /usr/bin

Jose


> Bruce
>
> > Bruce
> >
> > > Jose
> > >
> > >>
> > >>
> > >> > Jose
> > >> >
> > >> >>
> > >> >>
> > >> >> Cheers,
> > >> >>
> > >> >> Bruce
> > >> >>
> > >> >> On Tue, Aug 9, 2022 at 8:16 AM Jose Quaresma <
> quaresma.jose@gmail.com> wrote:
> > >> >> >
> > >> >> > - The env BIN_PREFIX is there from the beginning but there are
> no references to it,
> > >> >> > also fix a fatal QA errors installed-vs-shipped.
> > >> >> >
> > >> >> > ERROR:
> kubernetes-1_v1.23.6+gitfbcfa33018159c033aee77b0d5456df6771aa9b5-r0
> do_package: QA Issue: kubernetes: Files/directories were installed but no=
t
> shipped in any package:
> > >> >> >   /bin
> > >> >> >   /bin/k8s-init
> > >> >> > Please set FILES such that these items are packaged.
> Alternatively if they are unneeded, avoid installing them or delete them
> within do_install.
> > >> >> > kubernetes: 2 installed and not shipped files.
> [installed-vs-shipped]
> > >> >> > ERROR:
> kubernetes-1_v1.23.6+gitfbcfa33018159c033aee77b0d5456df6771aa9b5-r0
> do_package: Fatal QA errors were found, failing task.
> > >> >> >
> > >> >> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > >> >> > ---
> > >> >> >  recipes-containers/kubernetes/kubernetes_git.bb | 6 +++---
> > >> >> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >> >> >
> > >> >> > diff --git a/recipes-containers/kubernetes/kubernetes_git.bb
> b/recipes-containers/kubernetes/kubernetes_git.bb
> > >> >> > index e9460d4..82b75b1 100644
> > >> >> > --- a/recipes-containers/kubernetes/kubernetes_git.bb
> > >> >> > +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> > >> >> > @@ -103,8 +103,8 @@ do_install() {
> > >> >> >      install -m 0644
> ${WORKDIR}/git/release/cmd/kubepkg/templates/latest/deb/kubeadm/10-kubead=
m.conf
> ${D}${systemd_unitdir}/system/kubelet.service.d/
> > >> >> >
> > >> >> >      if
> ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> > >> >> > -       install -d "${D}${BIN_PREFIX}/bin"
> > >> >> > -       install -m 755 "${WORKDIR}/k8s-init"
> "${D}${BIN_PREFIX}/bin"
> > >> >> > +       install -d ${D}${bindir}
> > >> >> > +       install -m 755 ${WORKDIR}/k8s-init ${D}${bindir}
> > >> >> >
> > >> >> >         install -d ${D}${sysconfdir}/sysctl.d
> > >> >> >         install -m 0644 "${WORKDIR}/99-kubernetes.conf"
> "${D}${sysconfdir}/sysctl.d"
> > >> >> > @@ -141,7 +141,7 @@ FILES:kube-proxy =3D "${bindir}/kube-proxy"
> > >> >> >  FILES:${PN}-misc =3D "${bindir} ${sysconfdir}/sysctl.d"
> > >> >> >
> > >> >> >  ALLOW_EMPTY:${PN}-host =3D "1"
> > >> >> > -FILE:${PN}-host =3D "${BIN_PREFIX}/bin/k8s-init"
> > >> >> > +FILE:${PN}-host =3D "${bindir}/k8s-init"
> > >> >> >  RDEPENDS:${PN}-host =3D "${PN}"
> > >> >> >
> > >> >> >  RRECOMMENDS:${PN} =3D "\
> > >> >> > --
> > >> >> > 2.37.1
> > >> >> >
> > >> >> >
> > >> >> >
> > >> >> >
> > >> >>
> > >> >>
> > >> >> --
> > >> >> - Thou shalt not follow the NULL pointer, for chaos and madness
> await
> > >> >> thee at its end
> > >> >> - "Use the force Harry" - Gandalf, Star Trek II
> > >> >
> > >> >
> > >> >
> > >> > --
> > >> > Best regards,
> > >> >
> > >> > Jos=C3=A9 Quaresma
> > >>
> > >>
> > >>
> > >> --
> > >> - Thou shalt not follow the NULL pointer, for chaos and madness awai=
t
> > >> thee at its end
> > >> - "Use the force Harry" - Gandalf, Star Trek II
> > >
> > >
> > >
> > > --
> > > Best regards,
> > >
> > > Jos=C3=A9 Quaresma
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7504):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7504
> > Mute This Topic: https://lists.yoctoproject.org/mt/92913426/1050810
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

--000000000000fde1ca05e5d1868f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Bruce Ashfield &lt;<a href=3D"mailto:=
bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt=
; escreveu no dia ter=C3=A7a, 9/08/2022 =C3=A0(s) 16:05:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On Tue, Aug 9, 2022 at 10:21 AM Br=
uce Ashfield via<br>
<a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.yoctoproject.org</a><br>
&lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org" ta=
rget=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, Aug 9, 2022 at 10:02 AM Jose Quaresma &lt;<a href=3D"mailto:qu=
aresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; wr=
ote:<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" ta=
rget=3D"_blank">bruce.ashfield@gmail.com</a>&gt; escreveu no dia ter=C3=A7a=
, 9/08/2022 =C3=A0(s) 14:43:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On Tue, Aug 9, 2022 at 9:34 AM Jose Quaresma &lt;<a href=3D"m=
ailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a=
>&gt; wrote:<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Hi Bruce,<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmai=
l.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt; escreveu no dia t=
er=C3=A7a, 9/08/2022 =C3=A0(s) 14:19:<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; You must have something different in your environmen=
t, I&#39;m not seeing<br>
&gt; &gt;&gt; &gt;&gt; any of these same issues.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Maybe because you have the BIN_PREFIX defined somewhere =
in your distro or local.conf<br>
&gt; &gt;&gt; &gt; BIN_PREFIX is defined only in k3s recipe BIN_PREFIX ?=3D=
 &quot;${exec_prefix}/local&quot;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I&#39;m building a plain OE + meta-virt. BIN_PREFIX isn&#39;t=
 in the<br>
&gt; &gt;&gt; environment anywhere (which is admittedly strange .. but that=
&#39;s<br>
&gt; &gt;&gt; consistent with how it has been).<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Also, there&#39;s no other reports of this ever on the mailin=
g list,<br>
&gt; &gt;&gt; including demos for conferences, etc. ... that fails the &quo=
t;how can this<br>
&gt; &gt;&gt; be working for everyone else ?&quot; test.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; So there&#39;s definitely something different that I&#39;m no=
t seeing. I use<br>
&gt; &gt;&gt; OE nodistro or poky, others are using some other distros .. s=
o I need<br>
&gt; &gt;&gt; to figure out what is the difference.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; That being said, even if we tweaked the binaries install, we =
don&#39;t<br>
&gt; &gt;&gt; want them changing where they&#39;ve been installed previousl=
y, there<br>
&gt; &gt;&gt; could be any number of scripts expecting those locations in l=
ayers<br>
&gt; &gt;&gt; that I don&#39;t maintain.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; i.e. there&#39;s no way we should be patching the .service fi=
le, since<br>
&gt; &gt;&gt; that indicates the binaries have moved from where they were b=
efore.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Bruce<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; By default with BIN_PREFIX=3D&quot;&quot; the binaries seem to be=
 installed on /bin/k8s-init so they will work as this is in the PATH.<br>
&gt; &gt; For OE nodistro maybe this QA is disabled (need to confirm that) =
but for distros that have this QA enabled it will fire up.<br>
&gt; &gt;<br>
&gt;<br>
&gt; The installed but not shipped, isn&#39;t inhibited anywhere that I kno=
w<br>
&gt; of. Certainly not on poky, which is where most of the nightly builds<b=
r>
&gt; happen for this.<br>
&gt;<br>
&gt; &gt; About moving the binaries for another place is mainly because /bi=
n is not the right place for them IMO.<br>
&gt; &gt; <a href=3D"https://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/b=
in.html" rel=3D"noreferrer" target=3D"_blank">https://tldp.org/LDP/Linux-Fi=
lesystem-Hierarchy/html/bin.html</a><br>
&gt;<br>
&gt; But that&#39;s not where they are going for all the rest of the builds=
 :)<br>
&gt; I&#39;m aware of the various filesystem standards.<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; But I forgot to update all the services involved in this patch se=
t so please drop it all and I will update all services as well in V2.<br>
&gt; &gt;<br>
&gt;<br>
&gt; I wouldn&#39;t bother with that for v2, since again, they are using<br=
>
&gt; /usr/bin and /usr/local/bin from all the .service files I recall, and<=
br>
&gt; that&#39;s where we want the binaries to continue to be.<br>
&gt;<br>
<br>
aha. I see that k3s does set BIN_PREFIX, but it has been lost for<br>
kubernetes and nerdctl.<br></blockquote><div><br></div><div>right, maybe yo=
u don&#39;t see the QA because=C2=A0it will only shon for files installed i=
n /bin when usrmerge is enabled.</div><div><br></div><div>for nerdctl, the =
BIN_PREFIX is there from the beginning so the recipe allway install it in /=
bin.</div><div>for kubernetes, BIN_PREFIX is added in [1] and this only ins=
tall=C2=A0k8s-init in /bin and all the other binaries</div><div>continue wh=
ere they were installed (in /usr/bin in this case).</div><div><br>[1] - <a =
href=3D"https://git.yoctoproject.org/meta-virtualization/commit/?id=3D4d0f0=
a5ca2338e5f6ed3fe3a18c602447cf60eb4" target=3D"_blank">https://git.yoctopro=
ject.org/meta-virtualization/commit/?id=3D4d0f0a5ca2338e5f6ed3fe3a18c602447=
cf60eb4</a><br></div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
The easiest / lowest footprint route is to just add the variable back<br>
in for kubernetes and nerdctl, to the current default location. That<br>
allows folks to override it and/or keep their scripts/service files<br>
unmodified.<br></blockquote><div><br></div><div>This is what I did but usin=
g ${bindir} instead of ${BIN_PREFIX}.</div><div>Adding the BIN_PREFIX ?=3D =
&quot;${exec_prefix}/local&quot;=C2=A0will change install location so</div>=
<div>since we have to change, we can use the ${bindir} and put the files in=
 the right=C2=A0place.</div><div><br></div><div>The last patch for=C2=A0k3s=
 is more invasive as it touches many places and the systemd services as wel=
l.</div><div>I will send it=C2=A0separate because this one don&#39;t fix an=
ything and only change the installation=C2=A0of binaries</div><div>from /us=
r/local/bin to /usr/bin</div><div><br></div><div>Jose<br></div><div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Bruce<br>
<br>
&gt; Bruce<br>
&gt;<br>
&gt; &gt; Jose<br>
&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; Jose<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; Cheers,<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; Bruce<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; On Tue, Aug 9, 2022 at 8:16 AM Jose Quaresma &lt;<a =
href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gma=
il.com</a>&gt; wrote:<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; - The env BIN_PREFIX is there from the beginnin=
g but there are no references to it,<br>
&gt; &gt;&gt; &gt;&gt; &gt; also fix a fatal QA errors installed-vs-shipped=
.<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; ERROR: kubernetes-1_v1.23.6+gitfbcfa33018159c03=
3aee77b0d5456df6771aa9b5-r0 do_package: QA Issue: kubernetes: Files/directo=
ries were installed but not shipped in any package:<br>
&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0/bin<br>
&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0/bin/k8s-init<br>
&gt; &gt;&gt; &gt;&gt; &gt; Please set FILES such that these items are pack=
aged. Alternatively if they are unneeded, avoid installing them or delete t=
hem within do_install.<br>
&gt; &gt;&gt; &gt;&gt; &gt; kubernetes: 2 installed and not shipped files. =
[installed-vs-shipped]<br>
&gt; &gt;&gt; &gt;&gt; &gt; ERROR: kubernetes-1_v1.23.6+gitfbcfa33018159c03=
3aee77b0d5456df6771aa9b5-r0 do_package: Fatal QA errors were found, failing=
 task.<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mai=
lto:jose.quaresma@foundries.io" target=3D"_blank">jose.quaresma@foundries.i=
o</a>&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; ---<br>
&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 recipes-containers/kubernetes/<a href=3D"=
http://kubernetes_git.bb" rel=3D"noreferrer" target=3D"_blank">kubernetes_g=
it.bb</a> | 6 +++---<br>
&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 1 file changed, 3 insertions(+), 3 deleti=
ons(-)<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; diff --git a/recipes-containers/kubernetes/<a h=
ref=3D"http://kubernetes_git.bb" rel=3D"noreferrer" target=3D"_blank">kuber=
netes_git.bb</a> b/recipes-containers/kubernetes/<a href=3D"http://kubernet=
es_git.bb" rel=3D"noreferrer" target=3D"_blank">kubernetes_git.bb</a><br>
&gt; &gt;&gt; &gt;&gt; &gt; index e9460d4..82b75b1 100644<br>
&gt; &gt;&gt; &gt;&gt; &gt; --- a/recipes-containers/kubernetes/<a href=3D"=
http://kubernetes_git.bb" rel=3D"noreferrer" target=3D"_blank">kubernetes_g=
it.bb</a><br>
&gt; &gt;&gt; &gt;&gt; &gt; +++ b/recipes-containers/kubernetes/<a href=3D"=
http://kubernetes_git.bb" rel=3D"noreferrer" target=3D"_blank">kubernetes_g=
it.bb</a><br>
&gt; &gt;&gt; &gt;&gt; &gt; @@ -103,8 +103,8 @@ do_install() {<br>
&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/=
git/release/cmd/kubepkg/templates/latest/deb/kubeadm/10-kubeadm.conf=C2=A0 =
${D}${systemd_unitdir}/system/kubelet.service.d/<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if ${@bb.utils.contains(&#3=
9;DISTRO_FEATURES&#39;,&#39;systemd&#39;,&#39;true&#39;,&#39;false&#39;,d)}=
; then<br>
&gt; &gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d &quot;${=
D}${BIN_PREFIX}/bin&quot;<br>
&gt; &gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 755 &quo=
t;${WORKDIR}/k8s-init&quot; &quot;${D}${BIN_PREFIX}/bin&quot;<br>
&gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${bi=
ndir}<br>
&gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 755 ${WO=
RKDIR}/k8s-init ${D}${bindir}<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D=
}${sysconfdir}/sysctl.d<br>
&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 064=
4 &quot;${WORKDIR}/99-kubernetes.conf&quot; &quot;${D}${sysconfdir}/sysctl.=
d&quot;<br>
&gt; &gt;&gt; &gt;&gt; &gt; @@ -141,7 +141,7 @@ FILES:kube-proxy =3D &quot;=
${bindir}/kube-proxy&quot;<br>
&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 FILES:${PN}-misc =3D &quot;${bindir} ${sy=
sconfdir}/sysctl.d&quot;<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 ALLOW_EMPTY:${PN}-host =3D &quot;1&quot;<=
br>
&gt; &gt;&gt; &gt;&gt; &gt; -FILE:${PN}-host =3D &quot;${BIN_PREFIX}/bin/k8=
s-init&quot;<br>
&gt; &gt;&gt; &gt;&gt; &gt; +FILE:${PN}-host =3D &quot;${bindir}/k8s-init&q=
uot;<br>
&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 RDEPENDS:${PN}-host =3D &quot;${PN}&quot;=
<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 RRECOMMENDS:${PN} =3D &quot;\<br>
&gt; &gt;&gt; &gt;&gt; &gt; --<br>
&gt; &gt;&gt; &gt;&gt; &gt; 2.37.1<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; --<br>
&gt; &gt;&gt; &gt;&gt; - Thou shalt not follow the NULL pointer, for chaos =
and madness await<br>
&gt; &gt;&gt; &gt;&gt; thee at its end<br>
&gt; &gt;&gt; &gt;&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Tr=
ek II<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; --<br>
&gt; &gt;&gt; &gt; Best regards,<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Jos=C3=A9 Quaresma<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; - Thou shalt not follow the NULL pointer, for chaos and madne=
ss await<br>
&gt; &gt;&gt; thee at its end<br>
&gt; &gt;&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Best regards,<br>
&gt; &gt;<br>
&gt; &gt; Jos=C3=A9 Quaresma<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await<=
br>
&gt; thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#7504): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/7504" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/7504</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/92913426=
/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.o=
rg/mt/92913426/1050810</a><br>
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
><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div=
></div>

--000000000000fde1ca05e5d1868f--

