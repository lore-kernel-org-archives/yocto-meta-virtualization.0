Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA46C25B0C
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 14:02:38 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web08.12409.1660053748258269063
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 07:02:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dwU/T4ho;
 spf=pass (domain: gmail.com, ip: 209.85.167.46,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id r17so17094819lfm.11
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 07:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=q4MHzdY/nrRVXU/RT3RZ9W29W1DItH12mkGBqO2VzXw=;
        b=dwU/T4ho5j58CVNyfcQaNPF3/7Qa1Z+VAnCJlbmLgvZitTMC5rKMI7MgRS7T/zgJNk
         d06+RAOeb+9lYxO08XR7oEZ/zWI8QGInlwO2Q2vLwWlq2FEQvFvbWNrfzkj7ltjltqG8
         /hAWbIai4gdQXuH4dv6fcc8o+Pughk2hmbbnT60jvqzH7pRGhtLStxaNnCQLF54xtHPL
         Pj5xVUb8zng4mWPvKKoPc0XFI1uDI4RSkAAkCM0c/xF8yZ4vrkkaH35hVLO9tIVfnrBj
         tLmIzFpCLwO66S2j5USGfzlcxpf7qfDhTiqCp5h79TQgfNyoBnO5pXkqcDSEfOQv3wUf
         l4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=q4MHzdY/nrRVXU/RT3RZ9W29W1DItH12mkGBqO2VzXw=;
        b=DIQCmfltpdw3oG+SXY4xRMvOsV/kfh3MLxkJSPswMdfDIrJCg3IxoHxFZHuFyH41tf
         tcXn8qNvj0aSHSCeH/TYtrjXdQIq+Gl4YfNLumEUVKwDw2jN3rKMywf/ETeqQvBBzv9Q
         8C/FGRop+96lZ0WY6CW79gUPj5AvhiJ/gm7JuWph6vzSqKyeyI2UMTQtS3ndPkdquFWY
         t9aVOCP7xPVQnHuTSgSZl5j2yr0NpF7XjBuHWlL8lahngH6R/gzhho5XKsZVkgGiq8j7
         WY+gqL6+v1VO/p5lbhQU/ZO2edlInSs5kxvMnTc/lKJ2FWDqfbLM9sIyuc3uAoATd41Q
         1tNw==
X-Gm-Message-State: ACgBeo0RlUjbfVFhEGyR2n7B9kHzXZqVWTZvnIGYNKG8gD65JO+7muU+
	cqTOrLqKkRKEI4Z0vdYKj1/Trs5LVQeCvPde6S0=
X-Google-Smtp-Source: 
 AA6agR6nsBlJRuM4QaEUwgOEfQsPdSusjKyOXPjQMoo60sX15Ppu2kJu/4eiqqXbTytcK/q5DIXDlP8DQ774EX4cBpo=
X-Received: by 2002:a05:6512:1082:b0:48a:f9b5:a563 with SMTP id
 j2-20020a056512108200b0048af9b5a563mr9037937lfg.471.1660053746365; Tue, 09
 Aug 2022 07:02:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220809121619.32258-1-jose.quaresma@foundries.io>
 <20220809121619.32258-2-jose.quaresma@foundries.io>
 <CADkTA4OGLGXrRWaEVJMpUKs_X3F3nJf1Y7LUQP4SziXXPaBJ2g@mail.gmail.com>
 <CANPvuRkiHG6_Rbw_oh_JaJYzbs+YkbhSSbQfsXaURRVfcPD4hg@mail.gmail.com>
 <CADkTA4PCWwSU2zGud1PABZbqFrrwwG-0dzmUock_9qfonzy_Kg@mail.gmail.com>
In-Reply-To: 
 <CADkTA4PCWwSU2zGud1PABZbqFrrwwG-0dzmUock_9qfonzy_Kg@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 9 Aug 2022 15:02:13 +0100
Message-ID: 
 <CANPvuRkb99OunJcrDaQCVXU7kpqkmxo_oUDiSYG0c8Q8+SttXQ@mail.gmail.com>
Subject: Re: [meta-virtualization][kirkstone][master][PATCH 2/4] kubernetes:
 install the binaries in OE standard places
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000dc38a805e5cf6165"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Aug 2022 14:02:38 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7503

--000000000000dc38a805e5cf6165
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=A7a, 9/08/=
2022
=C3=A0(s) 14:43:

> On Tue, Aug 9, 2022 at 9:34 AM Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> >
> > Hi Bruce,
> >
> > Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=A7a,
> 9/08/2022 =C3=A0(s) 14:19:
> >>
> >> You must have something different in your environment, I'm not seeing
> >> any of these same issues.
> >
> >
> > Maybe because you have the BIN_PREFIX defined somewhere in your distro
> or local.conf
> > BIN_PREFIX is defined only in k3s recipe BIN_PREFIX ?=3D
> "${exec_prefix}/local"
> >
>
> I'm building a plain OE + meta-virt. BIN_PREFIX isn't in the
> environment anywhere (which is admittedly strange .. but that's
> consistent with how it has been).
>
> Also, there's no other reports of this ever on the mailing list,
> including demos for conferences, etc. ... that fails the "how can this
> be working for everyone else ?" test.
>
> So there's definitely something different that I'm not seeing. I use
> OE nodistro or poky, others are using some other distros .. so I need
> to figure out what is the difference.
>
> That being said, even if we tweaked the binaries install, we don't
> want them changing where they've been installed previously, there
> could be any number of scripts expecting those locations in layers
> that I don't maintain.
>
> i.e. there's no way we should be patching the .service file, since
> that indicates the binaries have moved from where they were before.
>
> Bruce
>
>
By default with BIN_PREFIX=3D"" the binaries seem to be installed on
/bin/k8s-init
so they will work as this is in the PATH.
For OE nodistro maybe this QA is disabled (need to confirm that) but for
distros that have this QA enabled it will fire up.

About moving the binaries for another place is mainly because /bin is not
the right place for them IMO.
https://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/bin.html

But I forgot to update all the services involved in this patch set so
please drop it all and I will update all services as well in V2.

Jose


>
> > Jose
> >
> >>
> >>
> >> Cheers,
> >>
> >> Bruce
> >>
> >> On Tue, Aug 9, 2022 at 8:16 AM Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> >> >
> >> > - The env BIN_PREFIX is there from the beginning but there are no
> references to it,
> >> > also fix a fatal QA errors installed-vs-shipped.
> >> >
> >> > ERROR:
> kubernetes-1_v1.23.6+gitfbcfa33018159c033aee77b0d5456df6771aa9b5-r0
> do_package: QA Issue: kubernetes: Files/directories were installed but no=
t
> shipped in any package:
> >> >   /bin
> >> >   /bin/k8s-init
> >> > Please set FILES such that these items are packaged. Alternatively i=
f
> they are unneeded, avoid installing them or delete them within do_install=
.
> >> > kubernetes: 2 installed and not shipped files. [installed-vs-shipped=
]
> >> > ERROR:
> kubernetes-1_v1.23.6+gitfbcfa33018159c033aee77b0d5456df6771aa9b5-r0
> do_package: Fatal QA errors were found, failing task.
> >> >
> >> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> >> > ---
> >> >  recipes-containers/kubernetes/kubernetes_git.bb | 6 +++---
> >> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >> >
> >> > diff --git a/recipes-containers/kubernetes/kubernetes_git.bb
> b/recipes-containers/kubernetes/kubernetes_git.bb
> >> > index e9460d4..82b75b1 100644
> >> > --- a/recipes-containers/kubernetes/kubernetes_git.bb
> >> > +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> >> > @@ -103,8 +103,8 @@ do_install() {
> >> >      install -m 0644
> ${WORKDIR}/git/release/cmd/kubepkg/templates/latest/deb/kubeadm/10-kubead=
m.conf
> ${D}${systemd_unitdir}/system/kubelet.service.d/
> >> >
> >> >      if
> ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> >> > -       install -d "${D}${BIN_PREFIX}/bin"
> >> > -       install -m 755 "${WORKDIR}/k8s-init" "${D}${BIN_PREFIX}/bin"
> >> > +       install -d ${D}${bindir}
> >> > +       install -m 755 ${WORKDIR}/k8s-init ${D}${bindir}
> >> >
> >> >         install -d ${D}${sysconfdir}/sysctl.d
> >> >         install -m 0644 "${WORKDIR}/99-kubernetes.conf"
> "${D}${sysconfdir}/sysctl.d"
> >> > @@ -141,7 +141,7 @@ FILES:kube-proxy =3D "${bindir}/kube-proxy"
> >> >  FILES:${PN}-misc =3D "${bindir} ${sysconfdir}/sysctl.d"
> >> >
> >> >  ALLOW_EMPTY:${PN}-host =3D "1"
> >> > -FILE:${PN}-host =3D "${BIN_PREFIX}/bin/k8s-init"
> >> > +FILE:${PN}-host =3D "${bindir}/k8s-init"
> >> >  RDEPENDS:${PN}-host =3D "${PN}"
> >> >
> >> >  RRECOMMENDS:${PN} =3D "\
> >> > --
> >> > 2.37.1
> >> >
> >> >
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> > Links: You receive all messages sent to this group.
> >> > View/Reply Online (#7496):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7496
> >> > Mute This Topic: https://lists.yoctoproject.org/mt/92913426/1050810
> >> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> >> > Unsubscribe:
> https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> >
> >>
> >>
> >> --
> >> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end
> >> - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
> > --
> > Best regards,
> >
> > Jos=C3=A9 Quaresma
>
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

--000000000000dc38a805e5cf6165
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Bruce Ashfield &lt;<a href=3D"mailto:=
bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; escreveu no dia =
ter=C3=A7a, 9/08/2022 =C3=A0(s) 14:43:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On Tue, Aug 9, 2022 at 9:34 AM Jose Quaresma &lt;<a =
href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gma=
il.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Bruce,<br>
&gt;<br>
&gt; Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=
=3D"_blank">bruce.ashfield@gmail.com</a>&gt; escreveu no dia ter=C3=A7a, 9/=
08/2022 =C3=A0(s) 14:19:<br>
&gt;&gt;<br>
&gt;&gt; You must have something different in your environment, I&#39;m not=
 seeing<br>
&gt;&gt; any of these same issues.<br>
&gt;<br>
&gt;<br>
&gt; Maybe because you have the BIN_PREFIX defined somewhere in your distro=
 or local.conf<br>
&gt; BIN_PREFIX is defined only in k3s recipe BIN_PREFIX ?=3D &quot;${exec_=
prefix}/local&quot;<br>
&gt;<br>
<br>
I&#39;m building a plain OE + meta-virt. BIN_PREFIX isn&#39;t in the<br>
environment anywhere (which is admittedly strange .. but that&#39;s<br>
consistent with how it has been).<br>
<br>
Also, there&#39;s no other reports of this ever on the mailing list,<br>
including demos for conferences, etc. ... that fails the &quot;how can this=
<br>
be working for everyone else ?&quot; test.<br>
<br>
So there&#39;s definitely something different that I&#39;m not seeing. I us=
e<br>
OE nodistro or poky, others are using some other distros .. so I need<br>
to figure out what is the difference.<br>
<br>
That being said, even if we tweaked the binaries install, we don&#39;t<br>
want them changing where they&#39;ve been installed previously, there<br>
could be any number of scripts expecting those locations in layers<br>
that I don&#39;t maintain.<br>
<br>
i.e. there&#39;s no way we should be patching the .service file, since<br>
that indicates the binaries have moved from where they were before.<br>
<br>
Bruce<br>
<br></blockquote><div><br></div><div>By default with BIN_PREFIX=3D&quot;&qu=
ot; the binaries seem to be installed on<span style=3D"color:rgb(0,0,0)">=
=C2=A0</span><span style=3D"color:rgb(0,0,0)">/bin/k8s-init so they will wo=
rk as this is in the PATH.</span></div><div><span style=3D"color:rgb(0,0,0)=
">For OE=C2=A0</span>nodistro maybe this QA is disabled (need to confirm th=
at) but for distros that have this QA enabled it will fire up.</div><div><b=
r></div><div>About moving the binaries for another place is mainly because =
/bin is not the right=C2=A0place for them IMO.</div><div><a href=3D"https:/=
/tldp.org/LDP/Linux-Filesystem-Hierarchy/html/bin.html">https://tldp.org/LD=
P/Linux-Filesystem-Hierarchy/html/bin.html</a><br></div><div>=C2=A0</div><d=
iv>But I forgot=C2=A0to update all the services involved in this patch set =
so please drop it all and I will update all services as well in V2.</div><d=
iv><br></div><div>Jose</div><div><br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
<br>
<br>
&gt; Jose<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Cheers,<br>
&gt;&gt;<br>
&gt;&gt; Bruce<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Aug 9, 2022 at 8:16 AM Jose Quaresma &lt;<a href=3D"mailto=
:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;=
 wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; - The env BIN_PREFIX is there from the beginning but there ar=
e no references to it,<br>
&gt;&gt; &gt; also fix a fatal QA errors installed-vs-shipped.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; ERROR: kubernetes-1_v1.23.6+gitfbcfa33018159c033aee77b0d5456d=
f6771aa9b5-r0 do_package: QA Issue: kubernetes: Files/directories were inst=
alled but not shipped in any package:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0/bin<br>
&gt;&gt; &gt;=C2=A0 =C2=A0/bin/k8s-init<br>
&gt;&gt; &gt; Please set FILES such that these items are packaged. Alternat=
ively if they are unneeded, avoid installing them or delete them within do_=
install.<br>
&gt;&gt; &gt; kubernetes: 2 installed and not shipped files. [installed-vs-=
shipped]<br>
&gt;&gt; &gt; ERROR: kubernetes-1_v1.23.6+gitfbcfa33018159c033aee77b0d5456d=
f6771aa9b5-r0 do_package: Fatal QA errors were found, failing task.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quare=
sma@foundries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 recipes-containers/kubernetes/<a href=3D"http://kuberne=
tes_git.bb" rel=3D"noreferrer" target=3D"_blank">kubernetes_git.bb</a> | 6 =
+++---<br>
&gt;&gt; &gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/recipes-containers/kubernetes/<a href=3D"http://=
kubernetes_git.bb" rel=3D"noreferrer" target=3D"_blank">kubernetes_git.bb</=
a> b/recipes-containers/kubernetes/<a href=3D"http://kubernetes_git.bb" rel=
=3D"noreferrer" target=3D"_blank">kubernetes_git.bb</a><br>
&gt;&gt; &gt; index e9460d4..82b75b1 100644<br>
&gt;&gt; &gt; --- a/recipes-containers/kubernetes/<a href=3D"http://kuberne=
tes_git.bb" rel=3D"noreferrer" target=3D"_blank">kubernetes_git.bb</a><br>
&gt;&gt; &gt; +++ b/recipes-containers/kubernetes/<a href=3D"http://kuberne=
tes_git.bb" rel=3D"noreferrer" target=3D"_blank">kubernetes_git.bb</a><br>
&gt;&gt; &gt; @@ -103,8 +103,8 @@ do_install() {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/git/release/cm=
d/kubepkg/templates/latest/deb/kubeadm/10-kubeadm.conf=C2=A0 ${D}${systemd_=
unitdir}/system/kubelet.service.d/<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;DISTRO_FEATU=
RES&#39;,&#39;systemd&#39;,&#39;true&#39;,&#39;false&#39;,d)}; then<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d &quot;${D}${BIN_PREFIX=
}/bin&quot;<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 755 &quot;${WORKDIR}/k=
8s-init&quot; &quot;${D}${BIN_PREFIX}/bin&quot;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${bindir}<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 755 ${WORKDIR}/k8s-ini=
t ${D}${bindir}<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}=
/sysctl.d<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 &quot;${WORK=
DIR}/99-kubernetes.conf&quot; &quot;${D}${sysconfdir}/sysctl.d&quot;<br>
&gt;&gt; &gt; @@ -141,7 +141,7 @@ FILES:kube-proxy =3D &quot;${bindir}/kube=
-proxy&quot;<br>
&gt;&gt; &gt;=C2=A0 FILES:${PN}-misc =3D &quot;${bindir} ${sysconfdir}/sysc=
tl.d&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 ALLOW_EMPTY:${PN}-host =3D &quot;1&quot;<br>
&gt;&gt; &gt; -FILE:${PN}-host =3D &quot;${BIN_PREFIX}/bin/k8s-init&quot;<b=
r>
&gt;&gt; &gt; +FILE:${PN}-host =3D &quot;${bindir}/k8s-init&quot;<br>
&gt;&gt; &gt;=C2=A0 RDEPENDS:${PN}-host =3D &quot;${PN}&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 RRECOMMENDS:${PN} =3D &quot;\<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.37.1<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; &gt; View/Reply Online (#7496): <a href=3D"https://lists.yoctoproj=
ect.org/g/meta-virtualization/message/7496" rel=3D"noreferrer" target=3D"_b=
lank">https://lists.yoctoproject.org/g/meta-virtualization/message/7496</a>=
<br>
&gt;&gt; &gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt=
/92913426/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.yocto=
project.org/mt/92913426/1050810</a><br>
&gt;&gt; &gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@li=
sts.yoctoproject.org" target=3D"_blank">meta-virtualization+owner@lists.yoc=
toproject.org</a><br>
&gt;&gt; &gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.y=
octoproject.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.as=
hfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; - Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait<br>
&gt;&gt; thee at its end<br>
&gt;&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Best regards,<br>
&gt;<br>
&gt; Jos=C3=A9 Quaresma<br>
<br>
<br>
<br>
--<br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000dc38a805e5cf6165--

