Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A34C19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 17:07:19 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.14632.1660064831352066177
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 10:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W0Wc/RC2;
 spf=pass (domain: gmail.com, ip: 209.85.167.182,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id c185so14582341oia.7
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 10:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=wfs0lUs3+C23neCCwLRz/XuByNcATx059qC3tLMxjW0=;
        b=W0Wc/RC2AQMJHORip6woPm4sa431ovQwrGuL0xx+8k1mchBpP/tyFJZ5bg6QM+gpW0
         s7XvDN3W9EWQxaVm4YxkS1zAGelJ1tRkIck5IPWESiHpXtg2ow/LzAJGrzmXX5seZomo
         KSUeAdMYTIdhV+a6IwmeG8dKx/0Mdae81bx6FI5ScSXAKLqb/Zd9TGN/6N5nKDuXlvcj
         Du7gkS8D8S56N1yR7j4YkYBDVNhqtwycNiVeLXxP6NxGEQTSWLyyoK5Qfer/szbf8NZO
         +C9zlrAl1i3mknPUDk61jfyk3tE7XfVoB4Y7WdBF1FHHlScBYEn+J6NWSe9j4mrkm3V9
         3wIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=wfs0lUs3+C23neCCwLRz/XuByNcATx059qC3tLMxjW0=;
        b=6sPUXLfbYjle9vT+kkQa0q2qjO3ul+Mm8kjxhw6iwH9kFVrVsBgckS3n5h3XhxfGzm
         tEiW+10zJjz6Kz4W4olL5WoqjZCmo7V01q2W0arUpmJg5tyzFAiq5x8dmTTZrQCirtjH
         95wEMHWNuCSOcSHFXhJW2fnNbhLFSD3QZZ+BTXI2p6yczfiApho/hqmThtB2XMIe9em6
         n/W35NNE2iHqz2aWnsuhDvFGw+XbQ3leIXsfFqALQDupeC1mh5iDju/sy4B3PzMMs1+t
         OE7HM/3a9d/yDuIJmXdPtTboqS8dYW8v648JNhtEBNHTA6h7i6e6/y6hX967uOAOSRgI
         bz2g==
X-Gm-Message-State: ACgBeo0x8EotNGvYP9OuShuncR3JtW6g4KqRnp7W9ui7EYsKcUilpVb6
	gQ3qkuT/9j57Od2Po+0apetBWm7Dr3pd4jak1jU=
X-Google-Smtp-Source: 
 AA6agR5n5zNyPSGLV0f57Sxg4ih8Dnt1PZHtuKeynm/AQ8NSsls4yfJE3eHGMQB2d4t+Cj7BVw135jSVgTtGgb6rX78=
X-Received: by 2002:a05:6808:1312:b0:341:cbcd:5387 with SMTP id
 y18-20020a056808131200b00341cbcd5387mr12685010oiv.175.1660064830363; Tue, 09
 Aug 2022 10:07:10 -0700 (PDT)
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
In-Reply-To: 
 <CANPvuR=R9WWNRvEBbve+fXkXWqVrCLKr4jBRdu2AbAW3NPd7KQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 9 Aug 2022 13:06:58 -0400
Message-ID: 
 <CADkTA4OA+aFvc6FgYBXyBufJrin4iV8_fhE6nnC2_cC6Jw3e_Q@mail.gmail.com>
Subject: Re: [meta-virtualization][kirkstone][master][PATCH 2/4] kubernetes:
 install the binaries in OE standard places
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Aug 2022 17:07:19 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7511

On Tue, Aug 9, 2022 at 12:36 PM Jose Quaresma <quaresma.jose@gmail.com> wro=
te:
>
>
>
> Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=A7a, 9/0=
8/2022 =C3=A0(s) 16:05:
>>
>> On Tue, Aug 9, 2022 at 10:21 AM Bruce Ashfield via
>> lists.yoctoproject.org
>> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>> >
>> > On Tue, Aug 9, 2022 at 10:02 AM Jose Quaresma <quaresma.jose@gmail.com=
> wrote:
>> > >
>> > >
>> > >
>> > > Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=A7a=
, 9/08/2022 =C3=A0(s) 14:43:
>> > >>
>> > >> On Tue, Aug 9, 2022 at 9:34 AM Jose Quaresma <quaresma.jose@gmail.c=
om> wrote:
>> > >> >
>> > >> > Hi Bruce,
>> > >> >
>> > >> > Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=
=A7a, 9/08/2022 =C3=A0(s) 14:19:
>> > >> >>
>> > >> >> You must have something different in your environment, I'm not s=
eeing
>> > >> >> any of these same issues.
>> > >> >
>> > >> >
>> > >> > Maybe because you have the BIN_PREFIX defined somewhere in your d=
istro or local.conf
>> > >> > BIN_PREFIX is defined only in k3s recipe BIN_PREFIX ?=3D "${exec_=
prefix}/local"
>> > >> >
>> > >>
>> > >> I'm building a plain OE + meta-virt. BIN_PREFIX isn't in the
>> > >> environment anywhere (which is admittedly strange .. but that's
>> > >> consistent with how it has been).
>> > >>
>> > >> Also, there's no other reports of this ever on the mailing list,
>> > >> including demos for conferences, etc. ... that fails the "how can t=
his
>> > >> be working for everyone else ?" test.
>> > >>
>> > >> So there's definitely something different that I'm not seeing. I us=
e
>> > >> OE nodistro or poky, others are using some other distros .. so I ne=
ed
>> > >> to figure out what is the difference.
>> > >>
>> > >> That being said, even if we tweaked the binaries install, we don't
>> > >> want them changing where they've been installed previously, there
>> > >> could be any number of scripts expecting those locations in layers
>> > >> that I don't maintain.
>> > >>
>> > >> i.e. there's no way we should be patching the .service file, since
>> > >> that indicates the binaries have moved from where they were before.
>> > >>
>> > >> Bruce
>> > >>
>> > >
>> > > By default with BIN_PREFIX=3D"" the binaries seem to be installed on=
 /bin/k8s-init so they will work as this is in the PATH.
>> > > For OE nodistro maybe this QA is disabled (need to confirm that) but=
 for distros that have this QA enabled it will fire up.
>> > >
>> >
>> > The installed but not shipped, isn't inhibited anywhere that I know
>> > of. Certainly not on poky, which is where most of the nightly builds
>> > happen for this.
>> >
>> > > About moving the binaries for another place is mainly because /bin i=
s not the right place for them IMO.
>> > > https://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/bin.html
>> >
>> > But that's not where they are going for all the rest of the builds :)
>> > I'm aware of the various filesystem standards.
>> >
>> > >
>> > > But I forgot to update all the services involved in this patch set s=
o please drop it all and I will update all services as well in V2.
>> > >
>> >
>> > I wouldn't bother with that for v2, since again, they are using
>> > /usr/bin and /usr/local/bin from all the .service files I recall, and
>> > that's where we want the binaries to continue to be.
>> >
>>
>> aha. I see that k3s does set BIN_PREFIX, but it has been lost for
>> kubernetes and nerdctl.
>
>
> right, maybe you don't see the QA because it will only shon for files ins=
talled in /bin when usrmerge is enabled.

That could very well be it.

>
> for nerdctl, the BIN_PREFIX is there from the beginning so the recipe all=
way install it in /bin.
> for kubernetes, BIN_PREFIX is added in [1] and this only install k8s-init=
 in /bin and all the other binaries
> continue where they were installed (in /usr/bin in this case).
>
> [1] - https://git.yoctoproject.org/meta-virtualization/commit/?id=3D4d0f0=
a5ca2338e5f6ed3fe3a18c602447cf60eb4
>
>>
>> The easiest / lowest footprint route is to just add the variable back
>> in for kubernetes and nerdctl, to the current default location. That
>> allows folks to override it and/or keep their scripts/service files
>> unmodified.
>
>
> This is what I did but using ${bindir} instead of ${BIN_PREFIX}.
> Adding the BIN_PREFIX ?=3D "${exec_prefix}/local" will change install loc=
ation so
> since we have to change, we can use the ${bindir} and put the files in th=
e right place.

I'm really only interested in the BIN_PREFIX being set in those
recipes. The smallest
footprint change.

So as the series currently stands, it isn't something I'll merge.

Cheers,

Bruce


>
> The last patch for k3s is more invasive as it touches many places and the=
 systemd services as well.
> I will send it separate because this one don't fix anything and only chan=
ge the installation of binaries
> from /usr/local/bin to /usr/bin
>
> Jose
>
>>
>> Bruce
>>
>> > Bruce
>> >
>> > > Jose
>> > >
>> > >>
>> > >>
>> > >> > Jose
>> > >> >
>> > >> >>
>> > >> >>
>> > >> >> Cheers,
>> > >> >>
>> > >> >> Bruce
>> > >> >>
>> > >> >> On Tue, Aug 9, 2022 at 8:16 AM Jose Quaresma <quaresma.jose@gmai=
l.com> wrote:
>> > >> >> >
>> > >> >> > - The env BIN_PREFIX is there from the beginning but there are=
 no references to it,
>> > >> >> > also fix a fatal QA errors installed-vs-shipped.
>> > >> >> >
>> > >> >> > ERROR: kubernetes-1_v1.23.6+gitfbcfa33018159c033aee77b0d5456df=
6771aa9b5-r0 do_package: QA Issue: kubernetes: Files/directories were insta=
lled but not shipped in any package:
>> > >> >> >   /bin
>> > >> >> >   /bin/k8s-init
>> > >> >> > Please set FILES such that these items are packaged. Alternati=
vely if they are unneeded, avoid installing them or delete them within do_i=
nstall.
>> > >> >> > kubernetes: 2 installed and not shipped files. [installed-vs-s=
hipped]
>> > >> >> > ERROR: kubernetes-1_v1.23.6+gitfbcfa33018159c033aee77b0d5456df=
6771aa9b5-r0 do_package: Fatal QA errors were found, failing task.
>> > >> >> >
>> > >> >> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>> > >> >> > ---
>> > >> >> >  recipes-containers/kubernetes/kubernetes_git.bb | 6 +++---
>> > >> >> >  1 file changed, 3 insertions(+), 3 deletions(-)
>> > >> >> >
>> > >> >> > diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b=
/recipes-containers/kubernetes/kubernetes_git.bb
>> > >> >> > index e9460d4..82b75b1 100644
>> > >> >> > --- a/recipes-containers/kubernetes/kubernetes_git.bb
>> > >> >> > +++ b/recipes-containers/kubernetes/kubernetes_git.bb
>> > >> >> > @@ -103,8 +103,8 @@ do_install() {
>> > >> >> >      install -m 0644 ${WORKDIR}/git/release/cmd/kubepkg/templa=
tes/latest/deb/kubeadm/10-kubeadm.conf  ${D}${systemd_unitdir}/system/kubel=
et.service.d/
>> > >> >> >
>> > >> >> >      if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true=
','false',d)}; then
>> > >> >> > -       install -d "${D}${BIN_PREFIX}/bin"
>> > >> >> > -       install -m 755 "${WORKDIR}/k8s-init" "${D}${BIN_PREFIX=
}/bin"
>> > >> >> > +       install -d ${D}${bindir}
>> > >> >> > +       install -m 755 ${WORKDIR}/k8s-init ${D}${bindir}
>> > >> >> >
>> > >> >> >         install -d ${D}${sysconfdir}/sysctl.d
>> > >> >> >         install -m 0644 "${WORKDIR}/99-kubernetes.conf" "${D}$=
{sysconfdir}/sysctl.d"
>> > >> >> > @@ -141,7 +141,7 @@ FILES:kube-proxy =3D "${bindir}/kube-proxy=
"
>> > >> >> >  FILES:${PN}-misc =3D "${bindir} ${sysconfdir}/sysctl.d"
>> > >> >> >
>> > >> >> >  ALLOW_EMPTY:${PN}-host =3D "1"
>> > >> >> > -FILE:${PN}-host =3D "${BIN_PREFIX}/bin/k8s-init"
>> > >> >> > +FILE:${PN}-host =3D "${bindir}/k8s-init"
>> > >> >> >  RDEPENDS:${PN}-host =3D "${PN}"
>> > >> >> >
>> > >> >> >  RRECOMMENDS:${PN} =3D "\
>> > >> >> > --
>> > >> >> > 2.37.1
>> > >> >> >
>> > >> >> >
>> > >> >> >
>> > >> >> >
>> > >> >>
>> > >> >>
>> > >> >> --
>> > >> >> - Thou shalt not follow the NULL pointer, for chaos and madness =
await
>> > >> >> thee at its end
>> > >> >> - "Use the force Harry" - Gandalf, Star Trek II
>> > >> >
>> > >> >
>> > >> >
>> > >> > --
>> > >> > Best regards,
>> > >> >
>> > >> > Jos=C3=A9 Quaresma
>> > >>
>> > >>
>> > >>
>> > >> --
>> > >> - Thou shalt not follow the NULL pointer, for chaos and madness awa=
it
>> > >> thee at its end
>> > >> - "Use the force Harry" - Gandalf, Star Trek II
>> > >
>> > >
>> > >
>> > > --
>> > > Best regards,
>> > >
>> > > Jos=C3=A9 Quaresma
>> >
>> >
>> >
>> > --
>> > - Thou shalt not follow the NULL pointer, for chaos and madness await
>> > thee at its end
>> > - "Use the force Harry" - Gandalf, Star Trek II
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#7504): https://lists.yoctoproject.org/g/meta-virtu=
alization/message/7504
>> > Mute This Topic: https://lists.yoctoproject.org/mt/92913426/1050810
>> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsu=
b [bruce.ashfield@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

