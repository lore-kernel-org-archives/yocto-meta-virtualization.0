Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A902C25B07
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 14:21:48 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web08.12662.1660054904505566652
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 07:21:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kBzQZWCD;
 spf=pass (domain: gmail.com, ip: 209.85.160.49,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-10ee900cce0so14109088fac.5
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 07:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=dqFVn5n0elcqk6gn/S38Xypf3MSFnl2UrWKz2akYi7Q=;
        b=kBzQZWCDUMNmRjm2Wz1fcrY+R4/9+wbcw/027lga1rG7VVPrYQWb6L65GCs0T5am9f
         lfThCxDHnBhhWjifQP/pUORjaPPKwkT9DRS115v8VaZXPACcqIDsI4HASnsOkJCavaTy
         tRmm6MMbyjRnJ4Nl+PU2CXHONWFy2Jw420rw0v24VxKtzRnu7uMRuGszb991tjOcONQC
         J+6h3yBI/Stl7vIN0PFhXvhfy0VFY0eIVTV7NzbgMxv0atAByGlgMOFvJjLIBzb3Dlfz
         NiiGaO0ZCF+cBs9au3NTm7u35hW0mnnVen1v7/Xfvd7TfYzJVljgiDQJafToJQxzp1+B
         fpRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=dqFVn5n0elcqk6gn/S38Xypf3MSFnl2UrWKz2akYi7Q=;
        b=s0ntfbyTNpTp028zq7ufSWXiQc4pdmxSvquV66T+7UpFrm5W811sjIMCRxTLxvShAZ
         IV11rcFkWxTRZ6pvUed99MZwqu38GQ6OFlF4TWs2Y8EwGgKn93KQuBJEw+M8EdIATNM+
         MM3IoTiyfB/ZO/8AnvqIHtEgARjHvducfOINNEH9DJElfx0tzIYPjKlkwnnsjo4/2xPo
         1sj0tcU0g9fbl2aZDosuL7kaN0+9FPXs9OUZAVXFq7QRTfEw8F8PemGxrYRUfx+5Es/9
         wTf3+6ORTRFbMEI38CRJIl42EPAKNSMzBk+zjKJqDjuhEcYNVbPZW3Ks9/vkKXoN/7eA
         yM+Q==
X-Gm-Message-State: ACgBeo3d18H4/8Z/PbbbqcI+q4Wa9BfAL7sPD6uMCqgF6ldJCVTpcJaQ
	podNnSlyJDo7uQ5LMtuvwlqesJ+cnw9qlo46UFA=
X-Google-Smtp-Source: 
 AA6agR7cDpfRn85BiSUpD4KTDVDKRR1y9bWh6jR8Pw9+bGGDIItS2Hmuzv2eefFwFfcYyIsY7aqCC1tAzNz6NGiFGK0=
X-Received: by 2002:a05:6870:d29d:b0:10e:747b:f87b with SMTP id
 d29-20020a056870d29d00b0010e747bf87bmr14111321oae.6.1660054903726; Tue, 09
 Aug 2022 07:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220809121619.32258-1-jose.quaresma@foundries.io>
 <20220809121619.32258-2-jose.quaresma@foundries.io>
 <CADkTA4OGLGXrRWaEVJMpUKs_X3F3nJf1Y7LUQP4SziXXPaBJ2g@mail.gmail.com>
 <CANPvuRkiHG6_Rbw_oh_JaJYzbs+YkbhSSbQfsXaURRVfcPD4hg@mail.gmail.com>
 <CADkTA4PCWwSU2zGud1PABZbqFrrwwG-0dzmUock_9qfonzy_Kg@mail.gmail.com>
 <CANPvuRkb99OunJcrDaQCVXU7kpqkmxo_oUDiSYG0c8Q8+SttXQ@mail.gmail.com>
In-Reply-To: 
 <CANPvuRkb99OunJcrDaQCVXU7kpqkmxo_oUDiSYG0c8Q8+SttXQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 9 Aug 2022 10:21:31 -0400
Message-ID: 
 <CADkTA4Mskp+ipMWPhvorGJMioUtdqw4M67tBXqGFUf4D4xK5Ww@mail.gmail.com>
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
 <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Aug 2022 14:21:48 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7504

On Tue, Aug 9, 2022 at 10:02 AM Jose Quaresma <quaresma.jose@gmail.com> wro=
te:
>
>
>
> Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=A7a, 9/0=
8/2022 =C3=A0(s) 14:43:
>>
>> On Tue, Aug 9, 2022 at 9:34 AM Jose Quaresma <quaresma.jose@gmail.com> w=
rote:
>> >
>> > Hi Bruce,
>> >
>> > Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=A7a, =
9/08/2022 =C3=A0(s) 14:19:
>> >>
>> >> You must have something different in your environment, I'm not seeing
>> >> any of these same issues.
>> >
>> >
>> > Maybe because you have the BIN_PREFIX defined somewhere in your distro=
 or local.conf
>> > BIN_PREFIX is defined only in k3s recipe BIN_PREFIX ?=3D "${exec_prefi=
x}/local"
>> >
>>
>> I'm building a plain OE + meta-virt. BIN_PREFIX isn't in the
>> environment anywhere (which is admittedly strange .. but that's
>> consistent with how it has been).
>>
>> Also, there's no other reports of this ever on the mailing list,
>> including demos for conferences, etc. ... that fails the "how can this
>> be working for everyone else ?" test.
>>
>> So there's definitely something different that I'm not seeing. I use
>> OE nodistro or poky, others are using some other distros .. so I need
>> to figure out what is the difference.
>>
>> That being said, even if we tweaked the binaries install, we don't
>> want them changing where they've been installed previously, there
>> could be any number of scripts expecting those locations in layers
>> that I don't maintain.
>>
>> i.e. there's no way we should be patching the .service file, since
>> that indicates the binaries have moved from where they were before.
>>
>> Bruce
>>
>
> By default with BIN_PREFIX=3D"" the binaries seem to be installed on /bin=
/k8s-init so they will work as this is in the PATH.
> For OE nodistro maybe this QA is disabled (need to confirm that) but for =
distros that have this QA enabled it will fire up.
>

The installed but not shipped, isn't inhibited anywhere that I know
of. Certainly not on poky, which is where most of the nightly builds
happen for this.

> About moving the binaries for another place is mainly because /bin is not=
 the right place for them IMO.
> https://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/bin.html

But that's not where they are going for all the rest of the builds :)
I'm aware of the various filesystem standards.

>
> But I forgot to update all the services involved in this patch set so ple=
ase drop it all and I will update all services as well in V2.
>

I wouldn't bother with that for v2, since again, they are using
/usr/bin and /usr/local/bin from all the .service files I recall, and
that's where we want the binaries to continue to be.

Bruce

> Jose
>
>>
>>
>> > Jose
>> >
>> >>
>> >>
>> >> Cheers,
>> >>
>> >> Bruce
>> >>
>> >> On Tue, Aug 9, 2022 at 8:16 AM Jose Quaresma <quaresma.jose@gmail.com=
> wrote:
>> >> >
>> >> > - The env BIN_PREFIX is there from the beginning but there are no r=
eferences to it,
>> >> > also fix a fatal QA errors installed-vs-shipped.
>> >> >
>> >> > ERROR: kubernetes-1_v1.23.6+gitfbcfa33018159c033aee77b0d5456df6771a=
a9b5-r0 do_package: QA Issue: kubernetes: Files/directories were installed =
but not shipped in any package:
>> >> >   /bin
>> >> >   /bin/k8s-init
>> >> > Please set FILES such that these items are packaged. Alternatively =
if they are unneeded, avoid installing them or delete them within do_instal=
l.
>> >> > kubernetes: 2 installed and not shipped files. [installed-vs-shippe=
d]
>> >> > ERROR: kubernetes-1_v1.23.6+gitfbcfa33018159c033aee77b0d5456df6771a=
a9b5-r0 do_package: Fatal QA errors were found, failing task.
>> >> >
>> >> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>> >> > ---
>> >> >  recipes-containers/kubernetes/kubernetes_git.bb | 6 +++---
>> >> >  1 file changed, 3 insertions(+), 3 deletions(-)
>> >> >
>> >> > diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/reci=
pes-containers/kubernetes/kubernetes_git.bb
>> >> > index e9460d4..82b75b1 100644
>> >> > --- a/recipes-containers/kubernetes/kubernetes_git.bb
>> >> > +++ b/recipes-containers/kubernetes/kubernetes_git.bb
>> >> > @@ -103,8 +103,8 @@ do_install() {
>> >> >      install -m 0644 ${WORKDIR}/git/release/cmd/kubepkg/templates/l=
atest/deb/kubeadm/10-kubeadm.conf  ${D}${systemd_unitdir}/system/kubelet.se=
rvice.d/
>> >> >
>> >> >      if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','fa=
lse',d)}; then
>> >> > -       install -d "${D}${BIN_PREFIX}/bin"
>> >> > -       install -m 755 "${WORKDIR}/k8s-init" "${D}${BIN_PREFIX}/bin=
"
>> >> > +       install -d ${D}${bindir}
>> >> > +       install -m 755 ${WORKDIR}/k8s-init ${D}${bindir}
>> >> >
>> >> >         install -d ${D}${sysconfdir}/sysctl.d
>> >> >         install -m 0644 "${WORKDIR}/99-kubernetes.conf" "${D}${sysc=
onfdir}/sysctl.d"
>> >> > @@ -141,7 +141,7 @@ FILES:kube-proxy =3D "${bindir}/kube-proxy"
>> >> >  FILES:${PN}-misc =3D "${bindir} ${sysconfdir}/sysctl.d"
>> >> >
>> >> >  ALLOW_EMPTY:${PN}-host =3D "1"
>> >> > -FILE:${PN}-host =3D "${BIN_PREFIX}/bin/k8s-init"
>> >> > +FILE:${PN}-host =3D "${bindir}/k8s-init"
>> >> >  RDEPENDS:${PN}-host =3D "${PN}"
>> >> >
>> >> >  RRECOMMENDS:${PN} =3D "\
>> >> > --
>> >> > 2.37.1
>> >> >
>> >> >
>> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> > Links: You receive all messages sent to this group.
>> >> > View/Reply Online (#7496): https://lists.yoctoproject.org/g/meta-vi=
rtualization/message/7496
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
>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

