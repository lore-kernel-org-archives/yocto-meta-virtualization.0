Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34007C19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 13:34:08 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.12037.1660052045130709803
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 06:34:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mnUfr4/Q;
 spf=pass (domain: gmail.com, ip: 209.85.167.53,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id a9so16977521lfm.12
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 06:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=fz1d8DWShZfUsr2Ftg8pZ+LpFtghtpVOmFMvKBqVWKk=;
        b=mnUfr4/QllFeKaKyiN40HUjpfRW5ojGo8KJfNum0AjWTAQTYciY9SioZo4G6cqu+B0
         Kd2sEVMSKJaOqdc73+XwsJJVifq0VLNPm48bp0qiFp+sjznwFAjcWS88i5MyFJvxlMdV
         PQaPPC8Y9vqGvmyk6oG+dPsabK7DYSDfu56+gq57TDL12p3TsARBAG5mrqY4YDwXpXOG
         pyLL+Kal8RPVw49CwCwLcyBbe85dlA1i+lQlZ/iFMrBljC+8gqxKTkFIHjb5T+MKApmq
         eVp2oLuOFJQOI0AefLSfafgFWASufZNZMOLXJdXPdfGVvDJPXLPO47pA9jn8qMlLRtKi
         z1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=fz1d8DWShZfUsr2Ftg8pZ+LpFtghtpVOmFMvKBqVWKk=;
        b=qU2eYWR6WmcfA5zxT3IJmJ7Obd5+wj0MWehnEfKUAs8TnU+ZpqjZD8hB/zmRBtQszT
         ZWOoF7/LewE2yHkbMyhg8IGpG0OGY2dl4hEdoadjEf1pJpO7JiNOi3i52K7Z0cLHcPRF
         3c56L7kK/Eh2laPM2zBD1NqvpAXY6a1My8+SNxY33GdnnRwiHOVMZPxXgNEoRyWJdgYl
         KYXLMyJtcW5CSMJr50yLnPBv2WZ/7HsXAtEBJJD7cVzUEkranqhy0EQ77s+1Z6U6L6JL
         uTYYMLvEkRAuQtQyMrflKjmCDCmjqFjcJE4CUUL+Zo51lMQgJh12EXnZfYv5ck6G/FVL
         L7gg==
X-Gm-Message-State: ACgBeo2lSK8YOKTm80xuKltHkUcJe/UW7+72CVEh3JlLuZeaZKHaeegF
	7I5lK94Vx94w4B9x6cHq378brWWzPeD35iJckZQ=
X-Google-Smtp-Source: 
 AA6agR6Fsmb81W3Bq6rDITmDxD8eG5I6yTCi8vQkAurUF1F0YtpBsOMo5WWhF1npBiyBmSoCcFeUBh93DVM5vI6NBQ8=
X-Received: by 2002:a05:6512:2984:b0:48b:2ef5:35d9 with SMTP id
 du4-20020a056512298400b0048b2ef535d9mr7822077lfb.412.1660052043100; Tue, 09
 Aug 2022 06:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220809121619.32258-1-jose.quaresma@foundries.io>
 <20220809121619.32258-2-jose.quaresma@foundries.io>
 <CADkTA4OGLGXrRWaEVJMpUKs_X3F3nJf1Y7LUQP4SziXXPaBJ2g@mail.gmail.com>
In-Reply-To: 
 <CADkTA4OGLGXrRWaEVJMpUKs_X3F3nJf1Y7LUQP4SziXXPaBJ2g@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 9 Aug 2022 14:33:51 +0100
Message-ID: 
 <CANPvuRkiHG6_Rbw_oh_JaJYzbs+YkbhSSbQfsXaURRVfcPD4hg@mail.gmail.com>
Subject: Re: [meta-virtualization][kirkstone][master][PATCH 2/4] kubernetes:
 install the binaries in OE standard places
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="00000000000056770d05e5cefcea"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Aug 2022 13:34:08 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7501

--00000000000056770d05e5cefcea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=A7a, 9/08/=
2022
=C3=A0(s) 14:19:

> You must have something different in your environment, I'm not seeing
> any of these same issues.
>

Maybe because you have the BIN_PREFIX defined somewhere in your distro or
local.conf
BIN_PREFIX is defined only in k3s recipe BIN_PREFIX ?=3D
"${exec_prefix}/local"

Jose


>
> Cheers,
>
> Bruce
>
> On Tue, Aug 9, 2022 at 8:16 AM Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> >
> > - The env BIN_PREFIX is there from the beginning but there are no
> references to it,
> > also fix a fatal QA errors installed-vs-shipped.
> >
> > ERROR:
> kubernetes-1_v1.23.6+gitfbcfa33018159c033aee77b0d5456df6771aa9b5-r0
> do_package: QA Issue: kubernetes: Files/directories were installed but no=
t
> shipped in any package:
> >   /bin
> >   /bin/k8s-init
> > Please set FILES such that these items are packaged. Alternatively if
> they are unneeded, avoid installing them or delete them within do_install=
.
> > kubernetes: 2 installed and not shipped files. [installed-vs-shipped]
> > ERROR:
> kubernetes-1_v1.23.6+gitfbcfa33018159c033aee77b0d5456df6771aa9b5-r0
> do_package: Fatal QA errors were found, failing task.
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >  recipes-containers/kubernetes/kubernetes_git.bb | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/recipes-containers/kubernetes/kubernetes_git.bb
> b/recipes-containers/kubernetes/kubernetes_git.bb
> > index e9460d4..82b75b1 100644
> > --- a/recipes-containers/kubernetes/kubernetes_git.bb
> > +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> > @@ -103,8 +103,8 @@ do_install() {
> >      install -m 0644
> ${WORKDIR}/git/release/cmd/kubepkg/templates/latest/deb/kubeadm/10-kubead=
m.conf
> ${D}${systemd_unitdir}/system/kubelet.service.d/
> >
> >      if
> ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> > -       install -d "${D}${BIN_PREFIX}/bin"
> > -       install -m 755 "${WORKDIR}/k8s-init" "${D}${BIN_PREFIX}/bin"
> > +       install -d ${D}${bindir}
> > +       install -m 755 ${WORKDIR}/k8s-init ${D}${bindir}
> >
> >         install -d ${D}${sysconfdir}/sysctl.d
> >         install -m 0644 "${WORKDIR}/99-kubernetes.conf"
> "${D}${sysconfdir}/sysctl.d"
> > @@ -141,7 +141,7 @@ FILES:kube-proxy =3D "${bindir}/kube-proxy"
> >  FILES:${PN}-misc =3D "${bindir} ${sysconfdir}/sysctl.d"
> >
> >  ALLOW_EMPTY:${PN}-host =3D "1"
> > -FILE:${PN}-host =3D "${BIN_PREFIX}/bin/k8s-init"
> > +FILE:${PN}-host =3D "${bindir}/k8s-init"
> >  RDEPENDS:${PN}-host =3D "${PN}"
> >
> >  RRECOMMENDS:${PN} =3D "\
> > --
> > 2.37.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7496):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7496
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

--00000000000056770d05e5cefcea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Bruce,</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">Bruce Ashfield &lt;<a href=3D"mailto:bruce.a=
shfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt; escre=
veu no dia ter=C3=A7a, 9/08/2022 =C3=A0(s) 14:19:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">You must have something different in your=
 environment, I&#39;m not seeing<br>
any of these same issues.<br></blockquote><div><br></div><div style=3D"colo=
r:rgb(0,0,0)">Maybe because you have the BIN_PREFIX defined=C2=A0somewhere=
=C2=A0in your distro or local.conf</div><div><span style=3D"color:rgb(0,0,0=
)">BIN_PREFIX is defined only in k3s recipe=C2=A0</span><span style=3D"colo=
r:rgb(178,24,24);font-family:monospace">BIN_PREFIX ?=3D &quot;${exec_prefix=
}/local&quot;</span></div><div><br></div><div>Jose</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Bruce<br>
<br>
On Tue, Aug 9, 2022 at 8:16 AM Jose Quaresma &lt;<a href=3D"mailto:quaresma=
.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; wrote:<b=
r>
&gt;<br>
&gt; - The env BIN_PREFIX is there from the beginning but there are no refe=
rences to it,<br>
&gt; also fix a fatal QA errors installed-vs-shipped.<br>
&gt;<br>
&gt; ERROR: kubernetes-1_v1.23.6+gitfbcfa33018159c033aee77b0d5456df6771aa9b=
5-r0 do_package: QA Issue: kubernetes: Files/directories were installed but=
 not shipped in any package:<br>
&gt;=C2=A0 =C2=A0/bin<br>
&gt;=C2=A0 =C2=A0/bin/k8s-init<br>
&gt; Please set FILES such that these items are packaged. Alternatively if =
they are unneeded, avoid installing them or delete them within do_install.<=
br>
&gt; kubernetes: 2 installed and not shipped files. [installed-vs-shipped]<=
br>
&gt; ERROR: kubernetes-1_v1.23.6+gitfbcfa33018159c033aee77b0d5456df6771aa9b=
5-r0 do_package: Fatal QA errors were found, failing task.<br>
&gt;<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 recipes-containers/kubernetes/<a href=3D"http://kubernetes_git.b=
b" rel=3D"noreferrer" target=3D"_blank">kubernetes_git.bb</a> | 6 +++---<br=
>
&gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/recipes-containers/kubernetes/<a href=3D"http://kubernete=
s_git.bb" rel=3D"noreferrer" target=3D"_blank">kubernetes_git.bb</a> b/reci=
pes-containers/kubernetes/<a href=3D"http://kubernetes_git.bb" rel=3D"noref=
errer" target=3D"_blank">kubernetes_git.bb</a><br>
&gt; index e9460d4..82b75b1 100644<br>
&gt; --- a/recipes-containers/kubernetes/<a href=3D"http://kubernetes_git.b=
b" rel=3D"noreferrer" target=3D"_blank">kubernetes_git.bb</a><br>
&gt; +++ b/recipes-containers/kubernetes/<a href=3D"http://kubernetes_git.b=
b" rel=3D"noreferrer" target=3D"_blank">kubernetes_git.bb</a><br>
&gt; @@ -103,8 +103,8 @@ do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/git/release/cmd/kubepkg=
/templates/latest/deb/kubeadm/10-kubeadm.conf=C2=A0 ${D}${systemd_unitdir}/=
system/kubelet.service.d/<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;,=
&#39;systemd&#39;,&#39;true&#39;,&#39;false&#39;,d)}; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d &quot;${D}${BIN_PREFIX}/bin&quo=
t;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 755 &quot;${WORKDIR}/k8s-init&q=
uot; &quot;${D}${BIN_PREFIX}/bin&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${bindir}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 755 ${WORKDIR}/k8s-init ${D}${b=
indir}<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/sysctl.d=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 &quot;${WORKDIR}/99-k=
ubernetes.conf&quot; &quot;${D}${sysconfdir}/sysctl.d&quot;<br>
&gt; @@ -141,7 +141,7 @@ FILES:kube-proxy =3D &quot;${bindir}/kube-proxy&qu=
ot;<br>
&gt;=C2=A0 FILES:${PN}-misc =3D &quot;${bindir} ${sysconfdir}/sysctl.d&quot=
;<br>
&gt;<br>
&gt;=C2=A0 ALLOW_EMPTY:${PN}-host =3D &quot;1&quot;<br>
&gt; -FILE:${PN}-host =3D &quot;${BIN_PREFIX}/bin/k8s-init&quot;<br>
&gt; +FILE:${PN}-host =3D &quot;${bindir}/k8s-init&quot;<br>
&gt;=C2=A0 RDEPENDS:${PN}-host =3D &quot;${PN}&quot;<br>
&gt;<br>
&gt;=C2=A0 RRECOMMENDS:${PN} =3D &quot;\<br>
&gt; --<br>
&gt; 2.37.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#7496): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/7496" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/7496</a><br>
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

--00000000000056770d05e5cefcea--

