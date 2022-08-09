Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FADEC19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 15:05:58 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.13122.1660057556727929886
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 08:05:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bSUXgvUF;
 spf=pass (domain: gmail.com, ip: 209.85.167.182,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id u14so6010245oie.2
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 08:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=pLvPIbTY8dY73ijkKaegRaIe7lQEB176eDzC5TdGb0k=;
        b=bSUXgvUFcOygbdyknf57JswpvI5no9rkZ4egdYy7e5Ib3Pp1JJJOOmtjMuL2E6/q3d
         A4k6RaOTBso247LfINl5C7IYBIjD9h56m8Xm9zzBhDdKyY9D3oq/tNYdr9vU39zRJ/gm
         jnGkLmnSMjtvTSVZr2oOxUBso93O2Z4hWa+f/BuUCN8ePb9V1AKzmlqFzgq4OjNW31pP
         xelzxWi/do0rp8I8kOcqyAgM1EwfbrWjAo+biOXhdIFBuxkJP2E2lORFrkYEK0kXl1aY
         oqdtXGf+Lbt+BEHP/lAbsy0QWl8HYX7eolTazInN1s4TCdGAZ7d7Icpc9vzW3M6/q3Ca
         LrdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=pLvPIbTY8dY73ijkKaegRaIe7lQEB176eDzC5TdGb0k=;
        b=YRv/ghl3bhOKgKS8/6q822BvnZPs5D5SXtCWrBLCtgNwgKupczbjy4wf6lkai4kLSf
         cVRkUGpdyYdKjpSmJlqtyiOpeVWeogRS2QY0q8pw2KsTZrIAkpuR/EDmUkjBOWt9mogi
         5TRFjpTZOWYqflR5i0j/rDFIJ4VIoXo9PgbPh61hW/t5Rkj1PsALHzZXWQ7FSXq4QhgP
         933+eJhGkwA5Zk4v4/SVZb/w6hQmeR76Tjvt0wwjLyuSlAQUss2AeFqWiQrcvXUhJRNr
         lkN0CvxqtKIV2pbuE3H+riDgq8ZfXoWi/pZVlAJXoIHh5CBvH+eXKxFZNzb8fK1ySrNc
         GRZQ==
X-Gm-Message-State: ACgBeo3nRGh3Ur7msIdkNRz1SyfLqmO7aPl9mI6Y2UBn0KzCb4vxyi5a
	AwAHvtr5/1II8fTxseHvplVbCLWyjIw8Jt1yp7w=
X-Google-Smtp-Source: 
 AA6agR4atOTnjYIV6H6j+SXBH0dSboTZ4YEXQJaeRik3GX30KVqUwo5K6hZH7vYVLMiltxz4huJ1w8KVd+HBhFRe+Kk=
X-Received: by 2002:a05:6808:199d:b0:343:290a:9f4c with SMTP id
 bj29-20020a056808199d00b00343290a9f4cmr328665oib.6.1660057555714; Tue, 09 Aug
 2022 08:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220809121619.32258-1-jose.quaresma@foundries.io>
 <20220809121619.32258-2-jose.quaresma@foundries.io>
 <CADkTA4OGLGXrRWaEVJMpUKs_X3F3nJf1Y7LUQP4SziXXPaBJ2g@mail.gmail.com>
 <CANPvuRkiHG6_Rbw_oh_JaJYzbs+YkbhSSbQfsXaURRVfcPD4hg@mail.gmail.com>
 <CADkTA4PCWwSU2zGud1PABZbqFrrwwG-0dzmUock_9qfonzy_Kg@mail.gmail.com>
 <CANPvuRkb99OunJcrDaQCVXU7kpqkmxo_oUDiSYG0c8Q8+SttXQ@mail.gmail.com>
 <1709B323FD9DD073.19746@lists.yoctoproject.org>
In-Reply-To: <1709B323FD9DD073.19746@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 9 Aug 2022 11:05:43 -0400
Message-ID: 
 <CADkTA4N2haNGYTvxUCU6kEObZkE9RjYUd7_QYskCWUrskjEB9Q@mail.gmail.com>
Subject: Re: [meta-virtualization][kirkstone][master][PATCH 2/4] kubernetes:
 install the binaries in OE standard places
To: bruce.ashfield@gmail.com
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
 meta-virtualization@lists.yoctoproject.org,
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Aug 2022 15:05:58 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7505

On Tue, Aug 9, 2022 at 10:21 AM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> On Tue, Aug 9, 2022 at 10:02 AM Jose Quaresma <quaresma.jose@gmail.com> w=
rote:
> >
> >
> >
> > Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=A7a, 9=
/08/2022 =C3=A0(s) 14:43:
> >>
> >> On Tue, Aug 9, 2022 at 9:34 AM Jose Quaresma <quaresma.jose@gmail.com>=
 wrote:
> >> >
> >> > Hi Bruce,
> >> >
> >> > Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=A7a=
, 9/08/2022 =C3=A0(s) 14:19:
> >> >>
> >> >> You must have something different in your environment, I'm not seei=
ng
> >> >> any of these same issues.
> >> >
> >> >
> >> > Maybe because you have the BIN_PREFIX defined somewhere in your dist=
ro or local.conf
> >> > BIN_PREFIX is defined only in k3s recipe BIN_PREFIX ?=3D "${exec_pre=
fix}/local"
> >> >
> >>
> >> I'm building a plain OE + meta-virt. BIN_PREFIX isn't in the
> >> environment anywhere (which is admittedly strange .. but that's
> >> consistent with how it has been).
> >>
> >> Also, there's no other reports of this ever on the mailing list,
> >> including demos for conferences, etc. ... that fails the "how can this
> >> be working for everyone else ?" test.
> >>
> >> So there's definitely something different that I'm not seeing. I use
> >> OE nodistro or poky, others are using some other distros .. so I need
> >> to figure out what is the difference.
> >>
> >> That being said, even if we tweaked the binaries install, we don't
> >> want them changing where they've been installed previously, there
> >> could be any number of scripts expecting those locations in layers
> >> that I don't maintain.
> >>
> >> i.e. there's no way we should be patching the .service file, since
> >> that indicates the binaries have moved from where they were before.
> >>
> >> Bruce
> >>
> >
> > By default with BIN_PREFIX=3D"" the binaries seem to be installed on /b=
in/k8s-init so they will work as this is in the PATH.
> > For OE nodistro maybe this QA is disabled (need to confirm that) but fo=
r distros that have this QA enabled it will fire up.
> >
>
> The installed but not shipped, isn't inhibited anywhere that I know
> of. Certainly not on poky, which is where most of the nightly builds
> happen for this.
>
> > About moving the binaries for another place is mainly because /bin is n=
ot the right place for them IMO.
> > https://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/bin.html
>
> But that's not where they are going for all the rest of the builds :)
> I'm aware of the various filesystem standards.
>
> >
> > But I forgot to update all the services involved in this patch set so p=
lease drop it all and I will update all services as well in V2.
> >
>
> I wouldn't bother with that for v2, since again, they are using
> /usr/bin and /usr/local/bin from all the .service files I recall, and
> that's where we want the binaries to continue to be.
>

aha. I see that k3s does set BIN_PREFIX, but it has been lost for
kubernetes and nerdctl.

The easiest / lowest footprint route is to just add the variable back
in for kubernetes and nerdctl, to the current default location. That
allows folks to override it and/or keep their scripts/service files
unmodified.

Bruce

> Bruce
>
> > Jose
> >
> >>
> >>
> >> > Jose
> >> >
> >> >>
> >> >>
> >> >> Cheers,
> >> >>
> >> >> Bruce
> >> >>
> >> >> On Tue, Aug 9, 2022 at 8:16 AM Jose Quaresma <quaresma.jose@gmail.c=
om> wrote:
> >> >> >
> >> >> > - The env BIN_PREFIX is there from the beginning but there are no=
 references to it,
> >> >> > also fix a fatal QA errors installed-vs-shipped.
> >> >> >
> >> >> > ERROR: kubernetes-1_v1.23.6+gitfbcfa33018159c033aee77b0d5456df677=
1aa9b5-r0 do_package: QA Issue: kubernetes: Files/directories were installe=
d but not shipped in any package:
> >> >> >   /bin
> >> >> >   /bin/k8s-init
> >> >> > Please set FILES such that these items are packaged. Alternativel=
y if they are unneeded, avoid installing them or delete them within do_inst=
all.
> >> >> > kubernetes: 2 installed and not shipped files. [installed-vs-ship=
ped]
> >> >> > ERROR: kubernetes-1_v1.23.6+gitfbcfa33018159c033aee77b0d5456df677=
1aa9b5-r0 do_package: Fatal QA errors were found, failing task.
> >> >> >
> >> >> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> >> >> > ---
> >> >> >  recipes-containers/kubernetes/kubernetes_git.bb | 6 +++---
> >> >> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >> >> >
> >> >> > diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/re=
cipes-containers/kubernetes/kubernetes_git.bb
> >> >> > index e9460d4..82b75b1 100644
> >> >> > --- a/recipes-containers/kubernetes/kubernetes_git.bb
> >> >> > +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> >> >> > @@ -103,8 +103,8 @@ do_install() {
> >> >> >      install -m 0644 ${WORKDIR}/git/release/cmd/kubepkg/templates=
/latest/deb/kubeadm/10-kubeadm.conf  ${D}${systemd_unitdir}/system/kubelet.=
service.d/
> >> >> >
> >> >> >      if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','=
false',d)}; then
> >> >> > -       install -d "${D}${BIN_PREFIX}/bin"
> >> >> > -       install -m 755 "${WORKDIR}/k8s-init" "${D}${BIN_PREFIX}/b=
in"
> >> >> > +       install -d ${D}${bindir}
> >> >> > +       install -m 755 ${WORKDIR}/k8s-init ${D}${bindir}
> >> >> >
> >> >> >         install -d ${D}${sysconfdir}/sysctl.d
> >> >> >         install -m 0644 "${WORKDIR}/99-kubernetes.conf" "${D}${sy=
sconfdir}/sysctl.d"
> >> >> > @@ -141,7 +141,7 @@ FILES:kube-proxy =3D "${bindir}/kube-proxy"
> >> >> >  FILES:${PN}-misc =3D "${bindir} ${sysconfdir}/sysctl.d"
> >> >> >
> >> >> >  ALLOW_EMPTY:${PN}-host =3D "1"
> >> >> > -FILE:${PN}-host =3D "${BIN_PREFIX}/bin/k8s-init"
> >> >> > +FILE:${PN}-host =3D "${bindir}/k8s-init"
> >> >> >  RDEPENDS:${PN}-host =3D "${PN}"
> >> >> >
> >> >> >  RRECOMMENDS:${PN} =3D "\
> >> >> > --
> >> >> > 2.37.1
> >> >> >
> >> >> >
> >> >> >
> >> >> >
> >> >>
> >> >>
> >> >> --
> >> >> - Thou shalt not follow the NULL pointer, for chaos and madness awa=
it
> >> >> thee at its end
> >> >> - "Use the force Harry" - Gandalf, Star Trek II
> >> >
> >> >
> >> >
> >> > --
> >> > Best regards,
> >> >
> >> > Jos=C3=A9 Quaresma
> >>
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
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7504): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7504
> Mute This Topic: https://lists.yoctoproject.org/mt/92913426/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

