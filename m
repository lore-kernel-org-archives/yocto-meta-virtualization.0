Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E1D0C19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 17:36:49 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web12.14902.1660066601378997293
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 10:36:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mTM5LlIx;
 spf=pass (domain: gmail.com, ip: 209.85.167.44,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id f20so17916690lfc.10
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 10:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=KUiYc40MY/Rr9oajHXPKu/iiLqpzu9AkRPprC/EeiTo=;
        b=mTM5LlIxg6nVANTWnuXUH85iYexbaJs2yFHray+0Wahn5KklCied8XocLkM1e3K6g7
         D5TyHG///Nc/NGmTHJwNN8KFsLDvY2eiYkmQW7pDsuXKpZchhuUZiOj6kLMiLCJtHu+M
         pPdaZNnuNB6NRIHpLt1KVZ3ZNgY9Zyoal66JdgMkL0w03sWK/yEAgLUAgAx0Xdh7kQEj
         iaRMtBOZ2AMBi2iN4cnstYjAPK2W1rHE30NLoGd4wTixNOEtknD0A4vEjy2JCEA5wzRT
         vo3p8kjiAKQbMZbUzrdrCoB8FgBT2Ob5/HOkobLCSNWrlQMvjs4tMftk3WVZWZNJzGoa
         mCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=KUiYc40MY/Rr9oajHXPKu/iiLqpzu9AkRPprC/EeiTo=;
        b=g77EXUjnbsfse93PqOrnxyow9ZZMtnrRGpLgcr2R4+Ivh3MEnuhF8xS+TiNXzVYAvU
         /2ospQNI6byEZKW6p4bi/NHJfJxn+0f6Shbz6jKtUbPB2HtUhbu+EkHKDEV4hD8Kti8/
         niFw9E+qHVGQN2nGOjzh0SUtCNcl8ZZOhMwC8mQlqhjF9IWjaxEBtsOFqtOIIkiQMEHZ
         7oMI/n9OEdOfDE3PAxlxJ3/WYD4GMOvsAcibSgxHMNATFa0iYgIrcMEMfi6CFZr6bH+G
         xphxcChbri5Saku9WQugQaOPhZQ2EVzaDk/mQ6UvN+y4MPCB/Fa+bAD+OpRz/IHVvnxL
         QPNw==
X-Gm-Message-State: ACgBeo0zoGeznXxPKML/lu6kfoqn4RxjUsX3iz3pssQFniZ3g6AqLTVd
	bidZu5rPOggxekZuZPvkXfWLvhd9psWZN5sla3k=
X-Google-Smtp-Source: 
 AA6agR50kSyWNQSgrMbihAIO3y/M7wjWk8Xb+TRFM5cau9xglQhlNofTxPwXEcvfwxu57JM87aVj03FwMnVmWn6QHlI=
X-Received: by 2002:a05:6512:2984:b0:48b:2ef5:35d9 with SMTP id
 du4-20020a056512298400b0048b2ef535d9mr8102718lfb.412.1660066599355; Tue, 09
 Aug 2022 10:36:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220809121619.32258-1-jose.quaresma@foundries.io>
 <20220809121619.32258-2-jose.quaresma@foundries.io>
 <CADkTA4OGLGXrRWaEVJMpUKs_X3F3nJf1Y7LUQP4SziXXPaBJ2g@mail.gmail.com>
 <CANPvuRkiHG6_Rbw_oh_JaJYzbs+YkbhSSbQfsXaURRVfcPD4hg@mail.gmail.com>
 <CADkTA4PCWwSU2zGud1PABZbqFrrwwG-0dzmUock_9qfonzy_Kg@mail.gmail.com>
 <CANPvuRkb99OunJcrDaQCVXU7kpqkmxo_oUDiSYG0c8Q8+SttXQ@mail.gmail.com>
 <1709B323FD9DD073.19746@lists.yoctoproject.org>
 <CADkTA4N2haNGYTvxUCU6kEObZkE9RjYUd7_QYskCWUrskjEB9Q@mail.gmail.com>
 <CANPvuR=R9WWNRvEBbve+fXkXWqVrCLKr4jBRdu2AbAW3NPd7KQ@mail.gmail.com>
 <CADkTA4OA+aFvc6FgYBXyBufJrin4iV8_fhE6nnC2_cC6Jw3e_Q@mail.gmail.com>
In-Reply-To: 
 <CADkTA4OA+aFvc6FgYBXyBufJrin4iV8_fhE6nnC2_cC6Jw3e_Q@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 9 Aug 2022 18:36:27 +0100
Message-ID: 
 <CANPvuR==oy+miqy-eJ3gPFFf4fooyDEw39Mhb_qYpTGgMYX5Ew@mail.gmail.com>
Subject: Re: [meta-virtualization][kirkstone][master][PATCH 2/4] kubernetes:
 install the binaries in OE standard places
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000f5494405e5d25f08"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Aug 2022 17:36:49 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7512

--000000000000f5494405e5d25f08
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=A7a, 9/08/=
2022
=C3=A0(s) 18:07:

> On Tue, Aug 9, 2022 at 12:36 PM Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> >
> >
> >
> > Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=A7a,
> 9/08/2022 =C3=A0(s) 16:05:
> >>
> >> On Tue, Aug 9, 2022 at 10:21 AM Bruce Ashfield via
> >> lists.yoctoproject.org
> >> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> >> >
> >> > On Tue, Aug 9, 2022 at 10:02 AM Jose Quaresma <
> quaresma.jose@gmail.com> wrote:
> >> > >
> >> > >
> >> > >
> >> > > Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=
=A7a,
> 9/08/2022 =C3=A0(s) 14:43:
> >> > >>
> >> > >> On Tue, Aug 9, 2022 at 9:34 AM Jose Quaresma <
> quaresma.jose@gmail.com> wrote:
> >> > >> >
> >> > >> > Hi Bruce,
> >> > >> >
> >> > >> > Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia
> ter=C3=A7a, 9/08/2022 =C3=A0(s) 14:19:
> >> > >> >>
> >> > >> >> You must have something different in your environment, I'm not
> seeing
> >> > >> >> any of these same issues.
> >> > >> >
> >> > >> >
> >> > >> > Maybe because you have the BIN_PREFIX defined somewhere in your
> distro or local.conf
> >> > >> > BIN_PREFIX is defined only in k3s recipe BIN_PREFIX ?=3D
> "${exec_prefix}/local"
> >> > >> >
> >> > >>
> >> > >> I'm building a plain OE + meta-virt. BIN_PREFIX isn't in the
> >> > >> environment anywhere (which is admittedly strange .. but that's
> >> > >> consistent with how it has been).
> >> > >>
> >> > >> Also, there's no other reports of this ever on the mailing list,
> >> > >> including demos for conferences, etc. ... that fails the "how can
> this
> >> > >> be working for everyone else ?" test.
> >> > >>
> >> > >> So there's definitely something different that I'm not seeing. I
> use
> >> > >> OE nodistro or poky, others are using some other distros .. so I
> need
> >> > >> to figure out what is the difference.
> >> > >>
> >> > >> That being said, even if we tweaked the binaries install, we don'=
t
> >> > >> want them changing where they've been installed previously, there
> >> > >> could be any number of scripts expecting those locations in layer=
s
> >> > >> that I don't maintain.
> >> > >>
> >> > >> i.e. there's no way we should be patching the .service file, sinc=
e
> >> > >> that indicates the binaries have moved from where they were befor=
e.
> >> > >>
> >> > >> Bruce
> >> > >>
> >> > >
> >> > > By default with BIN_PREFIX=3D"" the binaries seem to be installed =
on
> /bin/k8s-init so they will work as this is in the PATH.
> >> > > For OE nodistro maybe this QA is disabled (need to confirm that)
> but for distros that have this QA enabled it will fire up.
> >> > >
> >> >
> >> > The installed but not shipped, isn't inhibited anywhere that I know
> >> > of. Certainly not on poky, which is where most of the nightly builds
> >> > happen for this.
> >> >
> >> > > About moving the binaries for another place is mainly because /bin
> is not the right place for them IMO.
> >> > > https://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/bin.html
> >> >
> >> > But that's not where they are going for all the rest of the builds :=
)
> >> > I'm aware of the various filesystem standards.
> >> >
> >> > >
> >> > > But I forgot to update all the services involved in this patch set
> so please drop it all and I will update all services as well in V2.
> >> > >
> >> >
> >> > I wouldn't bother with that for v2, since again, they are using
> >> > /usr/bin and /usr/local/bin from all the .service files I recall, an=
d
> >> > that's where we want the binaries to continue to be.
> >> >
> >>
> >> aha. I see that k3s does set BIN_PREFIX, but it has been lost for
> >> kubernetes and nerdctl.
> >
> >
> > right, maybe you don't see the QA because it will only shon for files
> installed in /bin when usrmerge is enabled.
>
> That could very well be it.
>
> >
> > for nerdctl, the BIN_PREFIX is there from the beginning so the recipe
> allway install it in /bin.
> > for kubernetes, BIN_PREFIX is added in [1] and this only install
> k8s-init in /bin and all the other binaries
> > continue where they were installed (in /usr/bin in this case).
> >
> > [1] -
> https://git.yoctoproject.org/meta-virtualization/commit/?id=3D4d0f0a5ca23=
38e5f6ed3fe3a18c602447cf60eb4
> >
> >>
> >> The easiest / lowest footprint route is to just add the variable back
> >> in for kubernetes and nerdctl, to the current default location. That
> >> allows folks to override it and/or keep their scripts/service files
> >> unmodified.
> >
> >
> > This is what I did but using ${bindir} instead of ${BIN_PREFIX}.
> > Adding the BIN_PREFIX ?=3D "${exec_prefix}/local" will change install
> location so
> > since we have to change, we can use the ${bindir} and put the files in
> the right place.
>
> I'm really only interested in the BIN_PREFIX being set in those
> recipes. The smallest
> footprint change.
>

kubernetes is installing all binaries files to ${D}/${bindir}:
install -m 755 -D
${S}/src/import/_output/local/bin/${TARGET_GOOS}/${TARGET_GOARCH}/*
${D}/${bindir}

and you are suggesting to install only k8s-init with BIN_PREFIX:
install -m 755 "${WORKDIR}/k8s-init" "${D}${BIN_PREFIX}/bin"

this will end up with BIN_PREFIX =3D "/usr" to be consistent with the other
binaries in the recipe
or BIN_PREFIX =3D "${exec_prefix}/local" to use something not defined in
bitbake.conf.
I don't really know what you prefer BIN_PREFIX =3D "/usr" or BIN_PREFIX =3D
"${exec_prefix}/local"
as the two will change the installation path and you said that:
"even if we tweaked the binaries install, we don't want them changing where
they've been installed previously"

sorry but changing this patch and using BIN_PREFIX doesn't make much sense
in my opinion.

Jose


>
> So as the series currently stands, it isn't something I'll merge.
>
> Cheers,
>
> Bruce
>
>
> >
> > The last patch for k3s is more invasive as it touches many places and
> the systemd services as well.
> > I will send it separate because this one don't fix anything and only
> change the installation of binaries
> > from /usr/local/bin to /usr/bin
> >
> > Jose
> >
> >>
> >> Bruce
> >>
> >> > Bruce
> >> >
> >> > > Jose
> >> > >
> >> > >>
> >> > >>
> >> > >> > Jose
> >> > >> >
> >> > >> >>
> >> > >> >>
> >> > >> >> Cheers,
> >> > >> >>
> >> > >> >> Bruce
> >> > >> >>
> >> > >> >> On Tue, Aug 9, 2022 at 8:16 AM Jose Quaresma <
> quaresma.jose@gmail.com> wrote:
> >> > >> >> >
> >> > >> >> > - The env BIN_PREFIX is there from the beginning but there
> are no references to it,
> >> > >> >> > also fix a fatal QA errors installed-vs-shipped.
> >> > >> >> >
> >> > >> >> > ERROR:
> kubernetes-1_v1.23.6+gitfbcfa33018159c033aee77b0d5456df6771aa9b5-r0
> do_package: QA Issue: kubernetes: Files/directories were installed but no=
t
> shipped in any package:
> >> > >> >> >   /bin
> >> > >> >> >   /bin/k8s-init
> >> > >> >> > Please set FILES such that these items are packaged.
> Alternatively if they are unneeded, avoid installing them or delete them
> within do_install.
> >> > >> >> > kubernetes: 2 installed and not shipped files.
> [installed-vs-shipped]
> >> > >> >> > ERROR:
> kubernetes-1_v1.23.6+gitfbcfa33018159c033aee77b0d5456df6771aa9b5-r0
> do_package: Fatal QA errors were found, failing task.
> >> > >> >> >
> >> > >> >> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> >> > >> >> > ---
> >> > >> >> >  recipes-containers/kubernetes/kubernetes_git.bb | 6 +++---
> >> > >> >> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >> > >> >> >
> >> > >> >> > diff --git a/recipes-containers/kubernetes/kubernetes_git.bb
> b/recipes-containers/kubernetes/kubernetes_git.bb
> >> > >> >> > index e9460d4..82b75b1 100644
> >> > >> >> > --- a/recipes-containers/kubernetes/kubernetes_git.bb
> >> > >> >> > +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> >> > >> >> > @@ -103,8 +103,8 @@ do_install() {
> >> > >> >> >      install -m 0644
> ${WORKDIR}/git/release/cmd/kubepkg/templates/latest/deb/kubeadm/10-kubead=
m.conf
> ${D}${systemd_unitdir}/system/kubelet.service.d/
> >> > >> >> >
> >> > >> >> >      if
> ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> >> > >> >> > -       install -d "${D}${BIN_PREFIX}/bin"
> >> > >> >> > -       install -m 755 "${WORKDIR}/k8s-init"
> "${D}${BIN_PREFIX}/bin"
> >> > >> >> > +       install -d ${D}${bindir}
> >> > >> >> > +       install -m 755 ${WORKDIR}/k8s-init ${D}${bindir}
> >> > >> >> >
> >> > >> >> >         install -d ${D}${sysconfdir}/sysctl.d
> >> > >> >> >         install -m 0644 "${WORKDIR}/99-kubernetes.conf"
> "${D}${sysconfdir}/sysctl.d"
> >> > >> >> > @@ -141,7 +141,7 @@ FILES:kube-proxy =3D "${bindir}/kube-pro=
xy"
> >> > >> >> >  FILES:${PN}-misc =3D "${bindir} ${sysconfdir}/sysctl.d"
> >> > >> >> >
> >> > >> >> >  ALLOW_EMPTY:${PN}-host =3D "1"
> >> > >> >> > -FILE:${PN}-host =3D "${BIN_PREFIX}/bin/k8s-init"
> >> > >> >> > +FILE:${PN}-host =3D "${bindir}/k8s-init"
> >> > >> >> >  RDEPENDS:${PN}-host =3D "${PN}"
> >> > >> >> >
> >> > >> >> >  RRECOMMENDS:${PN} =3D "\
> >> > >> >> > --
> >> > >> >> > 2.37.1
> >> > >> >> >
> >> > >> >> >
> >> > >> >> >
> >> > >> >> >
> >> > >> >>
> >> > >> >>
> >> > >> >> --
> >> > >> >> - Thou shalt not follow the NULL pointer, for chaos and madnes=
s
> await
> >> > >> >> thee at its end
> >> > >> >> - "Use the force Harry" - Gandalf, Star Trek II
> >> > >> >
> >> > >> >
> >> > >> >
> >> > >> > --
> >> > >> > Best regards,
> >> > >> >
> >> > >> > Jos=C3=A9 Quaresma
> >> > >>
> >> > >>
> >> > >>
> >> > >> --
> >> > >> - Thou shalt not follow the NULL pointer, for chaos and madness
> await
> >> > >> thee at its end
> >> > >> - "Use the force Harry" - Gandalf, Star Trek II
> >> > >
> >> > >
> >> > >
> >> > > --
> >> > > Best regards,
> >> > >
> >> > > Jos=C3=A9 Quaresma
> >> >
> >> >
> >> >
> >> > --
> >> > - Thou shalt not follow the NULL pointer, for chaos and madness awai=
t
> >> > thee at its end
> >> > - "Use the force Harry" - Gandalf, Star Trek II
> >> >
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> > Links: You receive all messages sent to this group.
> >> > View/Reply Online (#7504):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7504
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

>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000f5494405e5d25f08
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Bruce Ashfield &lt;<a href=3D"mailto:=
bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; escreveu no dia =
ter=C3=A7a, 9/08/2022 =C3=A0(s) 18:07:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On Tue, Aug 9, 2022 at 12:36 PM Jose Quaresma &lt;<a=
 href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gm=
ail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=
=3D"_blank">bruce.ashfield@gmail.com</a>&gt; escreveu no dia ter=C3=A7a, 9/=
08/2022 =C3=A0(s) 16:05:<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Aug 9, 2022 at 10:21 AM Bruce Ashfield via<br>
&gt;&gt; <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" targe=
t=3D"_blank">lists.yoctoproject.org</a><br>
&gt;&gt; &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.yoctoprojec=
t.org" target=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br=
>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Tue, Aug 9, 2022 at 10:02 AM Jose Quaresma &lt;<a href=3D"=
mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</=
a>&gt; wrote:<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmai=
l.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt; escreveu no dia t=
er=C3=A7a, 9/08/2022 =C3=A0(s) 14:43:<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; On Tue, Aug 9, 2022 at 9:34 AM Jose Quaresma &lt;<a =
href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gma=
il.com</a>&gt; wrote:<br>
&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; Hi Bruce,<br>
&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashf=
ield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt; escreveu=
 no dia ter=C3=A7a, 9/08/2022 =C3=A0(s) 14:19:<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; You must have something different in your e=
nvironment, I&#39;m not seeing<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; any of these same issues.<br>
&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; Maybe because you have the BIN_PREFIX defined s=
omewhere in your distro or local.conf<br>
&gt;&gt; &gt; &gt;&gt; &gt; BIN_PREFIX is defined only in k3s recipe BIN_PR=
EFIX ?=3D &quot;${exec_prefix}/local&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; I&#39;m building a plain OE + meta-virt. BIN_PREFIX =
isn&#39;t in the<br>
&gt;&gt; &gt; &gt;&gt; environment anywhere (which is admittedly strange ..=
 but that&#39;s<br>
&gt;&gt; &gt; &gt;&gt; consistent with how it has been).<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; Also, there&#39;s no other reports of this ever on t=
he mailing list,<br>
&gt;&gt; &gt; &gt;&gt; including demos for conferences, etc. ... that fails=
 the &quot;how can this<br>
&gt;&gt; &gt; &gt;&gt; be working for everyone else ?&quot; test.<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; So there&#39;s definitely something different that I=
&#39;m not seeing. I use<br>
&gt;&gt; &gt; &gt;&gt; OE nodistro or poky, others are using some other dis=
tros .. so I need<br>
&gt;&gt; &gt; &gt;&gt; to figure out what is the difference.<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; That being said, even if we tweaked the binaries ins=
tall, we don&#39;t<br>
&gt;&gt; &gt; &gt;&gt; want them changing where they&#39;ve been installed =
previously, there<br>
&gt;&gt; &gt; &gt;&gt; could be any number of scripts expecting those locat=
ions in layers<br>
&gt;&gt; &gt; &gt;&gt; that I don&#39;t maintain.<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; i.e. there&#39;s no way we should be patching the .s=
ervice file, since<br>
&gt;&gt; &gt; &gt;&gt; that indicates the binaries have moved from where th=
ey were before.<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; Bruce<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; By default with BIN_PREFIX=3D&quot;&quot; the binaries s=
eem to be installed on /bin/k8s-init so they will work as this is in the PA=
TH.<br>
&gt;&gt; &gt; &gt; For OE nodistro maybe this QA is disabled (need to confi=
rm that) but for distros that have this QA enabled it will fire up.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The installed but not shipped, isn&#39;t inhibited anywhere t=
hat I know<br>
&gt;&gt; &gt; of. Certainly not on poky, which is where most of the nightly=
 builds<br>
&gt;&gt; &gt; happen for this.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt; About moving the binaries for another place is mainly be=
cause /bin is not the right place for them IMO.<br>
&gt;&gt; &gt; &gt; <a href=3D"https://tldp.org/LDP/Linux-Filesystem-Hierarc=
hy/html/bin.html" rel=3D"noreferrer" target=3D"_blank">https://tldp.org/LDP=
/Linux-Filesystem-Hierarchy/html/bin.html</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; But that&#39;s not where they are going for all the rest of t=
he builds :)<br>
&gt;&gt; &gt; I&#39;m aware of the various filesystem standards.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; But I forgot to update all the services involved in this=
 patch set so please drop it all and I will update all services as well in =
V2.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I wouldn&#39;t bother with that for v2, since again, they are=
 using<br>
&gt;&gt; &gt; /usr/bin and /usr/local/bin from all the .service files I rec=
all, and<br>
&gt;&gt; &gt; that&#39;s where we want the binaries to continue to be.<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; aha. I see that k3s does set BIN_PREFIX, but it has been lost for<=
br>
&gt;&gt; kubernetes and nerdctl.<br>
&gt;<br>
&gt;<br>
&gt; right, maybe you don&#39;t see the QA because it will only shon for fi=
les installed in /bin when usrmerge is enabled.<br>
<br>
That could very well be it.<br>
<br>
&gt;<br>
&gt; for nerdctl, the BIN_PREFIX is there from the beginning so the recipe =
allway install it in /bin.<br>
&gt; for kubernetes, BIN_PREFIX is added in [1] and this only install k8s-i=
nit in /bin and all the other binaries<br>
&gt; continue where they were installed (in /usr/bin in this case).<br>
&gt;<br>
&gt; [1] - <a href=3D"https://git.yoctoproject.org/meta-virtualization/comm=
it/?id=3D4d0f0a5ca2338e5f6ed3fe3a18c602447cf60eb4" rel=3D"noreferrer" targe=
t=3D"_blank">https://git.yoctoproject.org/meta-virtualization/commit/?id=3D=
4d0f0a5ca2338e5f6ed3fe3a18c602447cf60eb4</a><br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; The easiest / lowest footprint route is to just add the variable b=
ack<br>
&gt;&gt; in for kubernetes and nerdctl, to the current default location. Th=
at<br>
&gt;&gt; allows folks to override it and/or keep their scripts/service file=
s<br>
&gt;&gt; unmodified.<br>
&gt;<br>
&gt;<br>
&gt; This is what I did but using ${bindir} instead of ${BIN_PREFIX}.<br>
&gt; Adding the BIN_PREFIX ?=3D &quot;${exec_prefix}/local&quot; will chang=
e install location so<br>
&gt; since we have to change, we can use the ${bindir} and put the files in=
 the right place.<br>
<br>
I&#39;m really only interested in the BIN_PREFIX being set in those<br>
recipes. The smallest<br>
footprint change.<br></blockquote><div><br>kubernetes is installing all bin=
aries files to ${D}/${bindir}:<br>install -m 755 -D ${S}/src/import/_output=
/local/bin/${TARGET_GOOS}/${TARGET_GOARCH}/* ${D}/${bindir}<br><br>and you =
are suggesting to install only k8s-init with BIN_PREFIX:<br>install -m 755 =
&quot;${WORKDIR}/k8s-init&quot; &quot;${D}${BIN_PREFIX}/bin&quot; <br><br>t=
his will end up with BIN_PREFIX =3D &quot;/usr&quot; to be consistent with =
the other binaries in the recipe</div><div>or BIN_PREFIX =3D &quot;${exec_p=
refix}/local&quot; to use something not defined in bitbake.conf.</div><div>=
I don&#39;t really know what you prefer BIN_PREFIX =3D &quot;/usr&quot; or =
BIN_PREFIX =3D &quot;${exec_prefix}/local&quot;<br></div><div>as the two wi=
ll change the=C2=A0installation=C2=A0path and you said that:</div><div>&quo=
t;even if we tweaked the binaries install, we don&#39;t=C2=A0want them chan=
ging where they&#39;ve been installed previously&quot;<br></div><div><br></=
div><div>sorry but changing=C2=A0this patch and=C2=A0using BIN_PREFIX doesn=
&#39;t make much sense in my opinion.</div><div><br>Jose</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
So as the series currently stands, it isn&#39;t something I&#39;ll merge.<b=
r>
<br>
Cheers,<br>
<br>
Bruce<br>
<br>
<br>
&gt;<br>
&gt; The last patch for k3s is more invasive as it touches many places and =
the systemd services as well.<br>
&gt; I will send it separate because this one don&#39;t fix anything and on=
ly change the installation of binaries<br>
&gt; from /usr/local/bin to /usr/bin<br>
&gt;<br>
&gt; Jose<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Bruce<br>
&gt;&gt;<br>
&gt;&gt; &gt; Bruce<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt; Jose<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; Jose<br>
&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; Cheers,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; Bruce<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; On Tue, Aug 9, 2022 at 8:16 AM Jose Quaresm=
a &lt;<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma=
.jose@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; - The env BIN_PREFIX is there from the=
 beginning but there are no references to it,<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; also fix a fatal QA errors installed-v=
s-shipped.<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ERROR: kubernetes-1_v1.23.6+gitfbcfa33=
018159c033aee77b0d5456df6771aa9b5-r0 do_package: QA Issue: kubernetes: File=
s/directories were installed but not shipped in any package:<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0/bin<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0/bin/k8s-init<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; Please set FILES such that these items=
 are packaged. Alternatively if they are unneeded, avoid installing them or=
 delete them within do_install.<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; kubernetes: 2 installed and not shippe=
d files. [installed-vs-shipped]<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ERROR: kubernetes-1_v1.23.6+gitfbcfa33=
018159c033aee77b0d5456df6771aa9b5-r0 do_package: Fatal QA errors were found=
, failing task.<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; Signed-off-by: Jose Quaresma &lt;<a hr=
ef=3D"mailto:jose.quaresma@foundries.io" target=3D"_blank">jose.quaresma@fo=
undries.io</a>&gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; ---<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 recipes-containers/kubernetes/<a=
 href=3D"http://kubernetes_git.bb" rel=3D"noreferrer" target=3D"_blank">kub=
ernetes_git.bb</a> | 6 +++---<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 1 file changed, 3 insertions(+),=
 3 deletions(-)<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; diff --git a/recipes-containers/kubern=
etes/<a href=3D"http://kubernetes_git.bb" rel=3D"noreferrer" target=3D"_bla=
nk">kubernetes_git.bb</a> b/recipes-containers/kubernetes/<a href=3D"http:/=
/kubernetes_git.bb" rel=3D"noreferrer" target=3D"_blank">kubernetes_git.bb<=
/a><br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; index e9460d4..82b75b1 100644<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; --- a/recipes-containers/kubernetes/<a=
 href=3D"http://kubernetes_git.bb" rel=3D"noreferrer" target=3D"_blank">kub=
ernetes_git.bb</a><br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +++ b/recipes-containers/kubernetes/<a=
 href=3D"http://kubernetes_git.bb" rel=3D"noreferrer" target=3D"_blank">kub=
ernetes_git.bb</a><br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; @@ -103,8 +103,8 @@ do_install() {<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 install -m 0644 ${=
WORKDIR}/git/release/cmd/kubepkg/templates/latest/deb/kubeadm/10-kubeadm.co=
nf=C2=A0 ${D}${systemd_unitdir}/system/kubelet.service.d/<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if ${@bb.utils.con=
tains(&#39;DISTRO_FEATURES&#39;,&#39;systemd&#39;,&#39;true&#39;,&#39;false=
&#39;,d)}; then<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d=
 &quot;${D}${BIN_PREFIX}/bin&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m=
 755 &quot;${WORKDIR}/k8s-init&quot; &quot;${D}${BIN_PREFIX}/bin&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d=
 ${D}${bindir}<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m=
 755 ${WORKDIR}/k8s-init ${D}${bindir}<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0insta=
ll -d ${D}${sysconfdir}/sysctl.d<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0insta=
ll -m 0644 &quot;${WORKDIR}/99-kubernetes.conf&quot; &quot;${D}${sysconfdir=
}/sysctl.d&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; @@ -141,7 +141,7 @@ FILES:kube-proxy =
=3D &quot;${bindir}/kube-proxy&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 FILES:${PN}-misc =3D &quot;${bin=
dir} ${sysconfdir}/sysctl.d&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 ALLOW_EMPTY:${PN}-host =3D &quot=
;1&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; -FILE:${PN}-host =3D &quot;${BIN_PREFI=
X}/bin/k8s-init&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; +FILE:${PN}-host =3D &quot;${bindir}/k=
8s-init&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 RDEPENDS:${PN}-host =3D &quot;${=
PN}&quot;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 RRECOMMENDS:${PN} =3D &quot;\<br=
>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; --<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt; 2.37.1<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; - Thou shalt not follow the NULL pointer, f=
or chaos and madness await<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; thee at its end<br>
&gt;&gt; &gt; &gt;&gt; &gt;&gt; - &quot;Use the force Harry&quot; - Gandalf=
, Star Trek II<br>
&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; --<br>
&gt;&gt; &gt; &gt;&gt; &gt; Best regards,<br>
&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; Jos=C3=A9 Quaresma<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; --<br>
&gt;&gt; &gt; &gt;&gt; - Thou shalt not follow the NULL pointer, for chaos =
and madness await<br>
&gt;&gt; &gt; &gt;&gt; thee at its end<br>
&gt;&gt; &gt; &gt;&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Tr=
ek II<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; --<br>
&gt;&gt; &gt; &gt; Best regards,<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Jos=C3=A9 Quaresma<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; - Thou shalt not follow the NULL pointer, for chaos and madne=
ss await<br>
&gt;&gt; &gt; thee at its end<br>
&gt;&gt; &gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; &gt; View/Reply Online (#7504): <a href=3D"https://lists.yoctoproj=
ect.org/g/meta-virtualization/message/7504" rel=3D"noreferrer" target=3D"_b=
lank">https://lists.yoctoproject.org/g/meta-virtualization/message/7504</a>=
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
</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br></blockq=
uote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quare=
sma</div></div></div></div>

--000000000000f5494405e5d25f08--

