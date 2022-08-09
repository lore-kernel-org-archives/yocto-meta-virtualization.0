Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F182C25B07
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 18:15:29 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web08.15620.1660068925232303479
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 11:15:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HNbjUFMI;
 spf=pass (domain: gmail.com, ip: 209.85.160.48,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-10ee900cce0so14931969fac.5
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 11:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=lNbeVk7F6BlMfe9oQNmcTjFo45ZyTaq07dnHxCP17wU=;
        b=HNbjUFMINqFO2THcHcxeHAaqQ9Om+0dNBjjR28f4GpVAfWQhA48rv4Z5aKb0a5HA6R
         8sBNeMcuiJT7uBZU+YVpX4TB7pnpvR/PjuZ/7WrpniljVSPS6/bxYUD1TKVHwZSXcJ+r
         SwmA8cXgKmc5CjH8m5M/iNqwHtKfGxYmZE08lOsxhwoLqTGE9oFo8K6Q1Xm1iwJEbBXF
         vDn5BF4l8T+Q9w82z7YRNy4Gq254XN8vD9/W1fe4IisOwAYiFKJgopoimlpG37PIik2k
         KnqL/Xk9YP2f4KRiEwib20T7F5zKLbYUK1bj9+oucNZXP5Lg7eVJ2KFJpqWEpP6imZ3V
         tf8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=lNbeVk7F6BlMfe9oQNmcTjFo45ZyTaq07dnHxCP17wU=;
        b=4Li/jdjCdZzeo+wYQiY98kWIYKHyH05ac5xKUjf0kk38upHctFb8Hp1vtw7Q3e4zrY
         fxkRo+OPxOpt6DwWol5JHHrV+PCblu1UnA+v8tCc8Sf7fvxUr8BwoPXfeWQ+tX1wW8Xx
         QgdrC2owgx/hAgr5+/iyV6KWgDI3xKEmfFHrrM5PSbsaaysraH5XNAsHrRG4yTFN16jb
         zPxre+7sZXHimcOPKLW2e2SiAdgkwOiYvxHXLQHQdK9AyDnLDd1efaD0hsru1fB2cdyI
         QJv7Bkihxf5admEN51zQi3IpUTn28yYdhpQTnYEEOqYXKcRPnWFmk0gBE4p4CyuI9Gto
         UyDQ==
X-Gm-Message-State: ACgBeo1PwCe2nmYeOilqkkXGugR0rSrH7F1UrFp3vIXgrln0RTnyLCXg
	zoJBH8c+o0QJ04Zh9TIEL4suuPa2oa+0uFTS6jw=
X-Google-Smtp-Source: 
 AA6agR4NyWwVJDhMwEhrcXwi9abhXhS6XRyUmCYVqAixrKFVYEiBiStkzzLK9CV5fkBuZL0OU6F77hRWt7Jkds7Beh4=
X-Received: by 2002:a05:6870:4388:b0:10e:803f:9dae with SMTP id
 r8-20020a056870438800b0010e803f9daemr13931411oah.175.1660068924222; Tue, 09
 Aug 2022 11:15:24 -0700 (PDT)
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
 <CANPvuR==oy+miqy-eJ3gPFFf4fooyDEw39Mhb_qYpTGgMYX5Ew@mail.gmail.com>
In-Reply-To: 
 <CANPvuR==oy+miqy-eJ3gPFFf4fooyDEw39Mhb_qYpTGgMYX5Ew@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 9 Aug 2022 14:15:12 -0400
Message-ID: 
 <CADkTA4NOD3J4sR2eHnTGKyajNyoGMSeyMHCxyNUWhL6F7tTfew@mail.gmail.com>
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
 <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Aug 2022 18:15:29 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7513

On Tue, Aug 9, 2022 at 1:36 PM Jose Quaresma <quaresma.jose@gmail.com> wrot=
e:
>
>
>
> Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=A7a, 9/0=
8/2022 =C3=A0(s) 18:07:
>>
>> On Tue, Aug 9, 2022 at 12:36 PM Jose Quaresma <quaresma.jose@gmail.com> =
wrote:
>> >
>> >
>> >
>> > Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=A7a, =
9/08/2022 =C3=A0(s) 16:05:
>> >>
>> >> On Tue, Aug 9, 2022 at 10:21 AM Bruce Ashfield via
>> >> lists.yoctoproject.org
>> >> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>> >> >
>> >> > On Tue, Aug 9, 2022 at 10:02 AM Jose Quaresma <quaresma.jose@gmail.=
com> wrote:
>> >> > >
>> >> > >
>> >> > >
>> >> > > Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=
=A7a, 9/08/2022 =C3=A0(s) 14:43:
>> >> > >>
>> >> > >> On Tue, Aug 9, 2022 at 9:34 AM Jose Quaresma <quaresma.jose@gmai=
l.com> wrote:
>> >> > >> >
>> >> > >> > Hi Bruce,
>> >> > >> >
>> >> > >> > Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=
=C3=A7a, 9/08/2022 =C3=A0(s) 14:19:
>> >> > >> >>
>> >> > >> >> You must have something different in your environment, I'm no=
t seeing
>> >> > >> >> any of these same issues.
>> >> > >> >
>> >> > >> >
>> >> > >> > Maybe because you have the BIN_PREFIX defined somewhere in you=
r distro or local.conf
>> >> > >> > BIN_PREFIX is defined only in k3s recipe BIN_PREFIX ?=3D "${ex=
ec_prefix}/local"
>> >> > >> >
>> >> > >>
>> >> > >> I'm building a plain OE + meta-virt. BIN_PREFIX isn't in the
>> >> > >> environment anywhere (which is admittedly strange .. but that's
>> >> > >> consistent with how it has been).
>> >> > >>
>> >> > >> Also, there's no other reports of this ever on the mailing list,
>> >> > >> including demos for conferences, etc. ... that fails the "how ca=
n this
>> >> > >> be working for everyone else ?" test.
>> >> > >>
>> >> > >> So there's definitely something different that I'm not seeing. I=
 use
>> >> > >> OE nodistro or poky, others are using some other distros .. so I=
 need
>> >> > >> to figure out what is the difference.
>> >> > >>
>> >> > >> That being said, even if we tweaked the binaries install, we don=
't
>> >> > >> want them changing where they've been installed previously, ther=
e
>> >> > >> could be any number of scripts expecting those locations in laye=
rs
>> >> > >> that I don't maintain.
>> >> > >>
>> >> > >> i.e. there's no way we should be patching the .service file, sin=
ce
>> >> > >> that indicates the binaries have moved from where they were befo=
re.
>> >> > >>
>> >> > >> Bruce
>> >> > >>
>> >> > >
>> >> > > By default with BIN_PREFIX=3D"" the binaries seem to be installed=
 on /bin/k8s-init so they will work as this is in the PATH.
>> >> > > For OE nodistro maybe this QA is disabled (need to confirm that) =
but for distros that have this QA enabled it will fire up.
>> >> > >
>> >> >
>> >> > The installed but not shipped, isn't inhibited anywhere that I know
>> >> > of. Certainly not on poky, which is where most of the nightly build=
s
>> >> > happen for this.
>> >> >
>> >> > > About moving the binaries for another place is mainly because /bi=
n is not the right place for them IMO.
>> >> > > https://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/bin.html
>> >> >
>> >> > But that's not where they are going for all the rest of the builds =
:)
>> >> > I'm aware of the various filesystem standards.
>> >> >
>> >> > >
>> >> > > But I forgot to update all the services involved in this patch se=
t so please drop it all and I will update all services as well in V2.
>> >> > >
>> >> >
>> >> > I wouldn't bother with that for v2, since again, they are using
>> >> > /usr/bin and /usr/local/bin from all the .service files I recall, a=
nd
>> >> > that's where we want the binaries to continue to be.
>> >> >
>> >>
>> >> aha. I see that k3s does set BIN_PREFIX, but it has been lost for
>> >> kubernetes and nerdctl.
>> >
>> >
>> > right, maybe you don't see the QA because it will only shon for files =
installed in /bin when usrmerge is enabled.
>>
>> That could very well be it.
>>
>> >
>> > for nerdctl, the BIN_PREFIX is there from the beginning so the recipe =
allway install it in /bin.
>> > for kubernetes, BIN_PREFIX is added in [1] and this only install k8s-i=
nit in /bin and all the other binaries
>> > continue where they were installed (in /usr/bin in this case).
>> >
>> > [1] - https://git.yoctoproject.org/meta-virtualization/commit/?id=3D4d=
0f0a5ca2338e5f6ed3fe3a18c602447cf60eb4
>> >
>> >>
>> >> The easiest / lowest footprint route is to just add the variable back
>> >> in for kubernetes and nerdctl, to the current default location. That
>> >> allows folks to override it and/or keep their scripts/service files
>> >> unmodified.
>> >
>> >
>> > This is what I did but using ${bindir} instead of ${BIN_PREFIX}.
>> > Adding the BIN_PREFIX ?=3D "${exec_prefix}/local" will change install =
location so
>> > since we have to change, we can use the ${bindir} and put the files in=
 the right place.
>>
>> I'm really only interested in the BIN_PREFIX being set in those
>> recipes. The smallest
>> footprint change.
>
>
> kubernetes is installing all binaries files to ${D}/${bindir}:
> install -m 755 -D ${S}/src/import/_output/local/bin/${TARGET_GOOS}/${TARG=
ET_GOARCH}/* ${D}/${bindir}

I realize that.

>
> and you are suggesting to install only k8s-init with BIN_PREFIX:
> install -m 755 "${WORKDIR}/k8s-init" "${D}${BIN_PREFIX}/bin"

No, I'm suggesting the smallest footprint change, but that is more for
the other recipes, versus the single use of it in this kubernetes
recipe.

>
> this will end up with BIN_PREFIX =3D "/usr" to be consistent with the oth=
er binaries in the recipe
> or BIN_PREFIX =3D "${exec_prefix}/local" to use something not defined in =
bitbake.conf.
> I don't really know what you prefer BIN_PREFIX =3D "/usr" or BIN_PREFIX =
=3D "${exec_prefix}/local"
> as the two will change the installation path and you said that:
> "even if we tweaked the binaries install, we don't want them changing whe=
re they've been installed previously"

That comment was more for the k3s recipe, this helper is being
installed to the wrong place, and likely I'm the only one that uses
it.

For this specific recipe, I'd make it consistent with the other
binaries and set it to ${prefix} which is "/usr", which of course is
the same as ${exec_prefix}

>
> sorry but changing this patch and using BIN_PREFIX doesn't make much sens=
e in my opinion.
>

That's the style of the recipes as they stand, keeping them consistent
to that has value .. in particular, since I end up spending the
majority of time debugging system level runtime issues. There were
many issues found during the creation of the recipes and stack with
binaries being assumed in one location and then someone changing their
bitbake configuration and them not being present. So the control was
pulled into the recipes under BIN_PREFIX to make it explicit and to
save many hours debugging. That's the same reason why many of the go
build settings are in the recipes when for the most part they could be
used from the bbclasses.

That being said, we could change k8s and nerdctl to just use
${bindir}, but k3s should be left as-is.

Bruce

> Jose
>
>>
>>
>> So as the series currently stands, it isn't something I'll merge.
>>
>> Cheers,
>>
>> Bruce
>>
>>
>> >
>> > The last patch for k3s is more invasive as it touches many places and =
the systemd services as well.
>> > I will send it separate because this one don't fix anything and only c=
hange the installation of binaries
>> > from /usr/local/bin to /usr/bin
>> >
>> > Jose
>> >
>> >>
>> >> Bruce
>> >>
>> >> > Bruce
>> >> >
>> >> > > Jose
>> >> > >
>> >> > >>
>> >> > >>
>> >> > >> > Jose
>> >> > >> >
>> >> > >> >>
>> >> > >> >>
>> >> > >> >> Cheers,
>> >> > >> >>
>> >> > >> >> Bruce
>> >> > >> >>
>> >> > >> >> On Tue, Aug 9, 2022 at 8:16 AM Jose Quaresma <quaresma.jose@g=
mail.com> wrote:
>> >> > >> >> >
>> >> > >> >> > - The env BIN_PREFIX is there from the beginning but there =
are no references to it,
>> >> > >> >> > also fix a fatal QA errors installed-vs-shipped.
>> >> > >> >> >
>> >> > >> >> > ERROR: kubernetes-1_v1.23.6+gitfbcfa33018159c033aee77b0d545=
6df6771aa9b5-r0 do_package: QA Issue: kubernetes: Files/directories were in=
stalled but not shipped in any package:
>> >> > >> >> >   /bin
>> >> > >> >> >   /bin/k8s-init
>> >> > >> >> > Please set FILES such that these items are packaged. Altern=
atively if they are unneeded, avoid installing them or delete them within d=
o_install.
>> >> > >> >> > kubernetes: 2 installed and not shipped files. [installed-v=
s-shipped]
>> >> > >> >> > ERROR: kubernetes-1_v1.23.6+gitfbcfa33018159c033aee77b0d545=
6df6771aa9b5-r0 do_package: Fatal QA errors were found, failing task.
>> >> > >> >> >
>> >> > >> >> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>> >> > >> >> > ---
>> >> > >> >> >  recipes-containers/kubernetes/kubernetes_git.bb | 6 +++---
>> >> > >> >> >  1 file changed, 3 insertions(+), 3 deletions(-)
>> >> > >> >> >
>> >> > >> >> > diff --git a/recipes-containers/kubernetes/kubernetes_git.b=
b b/recipes-containers/kubernetes/kubernetes_git.bb
>> >> > >> >> > index e9460d4..82b75b1 100644
>> >> > >> >> > --- a/recipes-containers/kubernetes/kubernetes_git.bb
>> >> > >> >> > +++ b/recipes-containers/kubernetes/kubernetes_git.bb
>> >> > >> >> > @@ -103,8 +103,8 @@ do_install() {
>> >> > >> >> >      install -m 0644 ${WORKDIR}/git/release/cmd/kubepkg/tem=
plates/latest/deb/kubeadm/10-kubeadm.conf  ${D}${systemd_unitdir}/system/ku=
belet.service.d/
>> >> > >> >> >
>> >> > >> >> >      if ${@bb.utils.contains('DISTRO_FEATURES','systemd','t=
rue','false',d)}; then
>> >> > >> >> > -       install -d "${D}${BIN_PREFIX}/bin"
>> >> > >> >> > -       install -m 755 "${WORKDIR}/k8s-init" "${D}${BIN_PRE=
FIX}/bin"
>> >> > >> >> > +       install -d ${D}${bindir}
>> >> > >> >> > +       install -m 755 ${WORKDIR}/k8s-init ${D}${bindir}
>> >> > >> >> >
>> >> > >> >> >         install -d ${D}${sysconfdir}/sysctl.d
>> >> > >> >> >         install -m 0644 "${WORKDIR}/99-kubernetes.conf" "${=
D}${sysconfdir}/sysctl.d"
>> >> > >> >> > @@ -141,7 +141,7 @@ FILES:kube-proxy =3D "${bindir}/kube-pr=
oxy"
>> >> > >> >> >  FILES:${PN}-misc =3D "${bindir} ${sysconfdir}/sysctl.d"
>> >> > >> >> >
>> >> > >> >> >  ALLOW_EMPTY:${PN}-host =3D "1"
>> >> > >> >> > -FILE:${PN}-host =3D "${BIN_PREFIX}/bin/k8s-init"
>> >> > >> >> > +FILE:${PN}-host =3D "${bindir}/k8s-init"
>> >> > >> >> >  RDEPENDS:${PN}-host =3D "${PN}"
>> >> > >> >> >
>> >> > >> >> >  RRECOMMENDS:${PN} =3D "\
>> >> > >> >> > --
>> >> > >> >> > 2.37.1
>> >> > >> >> >
>> >> > >> >> >
>> >> > >> >> >
>> >> > >> >> >
>> >> > >> >>
>> >> > >> >>
>> >> > >> >> --
>> >> > >> >> - Thou shalt not follow the NULL pointer, for chaos and madne=
ss await
>> >> > >> >> thee at its end
>> >> > >> >> - "Use the force Harry" - Gandalf, Star Trek II
>> >> > >> >
>> >> > >> >
>> >> > >> >
>> >> > >> > --
>> >> > >> > Best regards,
>> >> > >> >
>> >> > >> > Jos=C3=A9 Quaresma
>> >> > >>
>> >> > >>
>> >> > >>
>> >> > >> --
>> >> > >> - Thou shalt not follow the NULL pointer, for chaos and madness =
await
>> >> > >> thee at its end
>> >> > >> - "Use the force Harry" - Gandalf, Star Trek II
>> >> > >
>> >> > >
>> >> > >
>> >> > > --
>> >> > > Best regards,
>> >> > >
>> >> > > Jos=C3=A9 Quaresma
>> >> >
>> >> >
>> >> >
>> >> > --
>> >> > - Thou shalt not follow the NULL pointer, for chaos and madness awa=
it
>> >> > thee at its end
>> >> > - "Use the force Harry" - Gandalf, Star Trek II
>> >> >
>> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> > Links: You receive all messages sent to this group.
>> >> > View/Reply Online (#7504): https://lists.yoctoproject.org/g/meta-vi=
rtualization/message/7504
>> >> > Mute This Topic: https://lists.yoctoproject.org/mt/92913426/1050810
>> >> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> >> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/u=
nsub [bruce.ashfield@gmail.com]
>> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> >
>> >>
>> >>
>> >> --
>> >> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> >> thee at its end
>> >> - "Use the force Harry" - Gandalf, Star Trek II
>> >
>> >
>> >
>> > --
>> > Best regards,
>> >
>> > Jos=C3=A9 Quaresma
>>
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>>
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

