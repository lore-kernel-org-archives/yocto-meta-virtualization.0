Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 793C7C433FE
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 17:42:19 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.157258.1669743731655962925
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 29 Nov 2022 09:42:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RKhSIN7I;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id q7so22406714wrr.8
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Nov 2022 09:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zNInSh3JPhrZBNdWa9Z3Ln/VeSsg7a+tGOFZL5tERIo=;
        b=RKhSIN7IAxip9uC4oyoT8+MwKV13PUK+Mn/rFm0jW/SrPtqSXeRIIIq5v6ehrYj2gd
         6Il8OWenFcBEH1VaqgmukkM265MTf+fk+qJpHroGXU/HaP+c1AfeVVDkKOCfnEJhbQZU
         7/Vo1itV09TQfjNudifLZGpBtKSSbLr2+PfY4ZpSmVzfL8W0gRibo2OB1K5ZDBERHwwN
         qKfEhSrsTnDqAqNT3CK/fUz+thMG9vXryBAu8tpwceuWH6/yR2CAWB5kYQDAT/Yw5elX
         efRwVWch7cnb2kTsOcett2kt2SCNrRVewyOtpVpOzMNBfCWx7lrPyxHa+Lkn/LQ5FNa5
         dYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zNInSh3JPhrZBNdWa9Z3Ln/VeSsg7a+tGOFZL5tERIo=;
        b=eVHnc+9UCL1nbGzqHSuTAmswKPHNjsH2vuV0WOHbVLhEfdnAuCnqPvjz1voHQtp5Po
         oIYMAgFJS33oU3BozdUrGa/HTEExWfDH6tXusEoiL4upu0zdECfZByJm6fVVVavU5H8O
         /aWO8/EgqEATwbEx33JVeW9YADKuU5QzUaGCNB/0j97r56WPOFxw62mpxQxHNZPw4U7A
         5hBm73FEYGhq2m8OOCkWdWGVZGHgvXGhJVhV1zNAYqu8kaKWCF9jGwYP6Mv4owafKJQ/
         NUc5FM9NhZGQa6kiwFAZlSNy+ENN0/fWaD66m95bPUUoVBgMLGwVa3eA6uz2JfWxjCCZ
         AyGw==
X-Gm-Message-State: ANoB5pnnGtskelOH0Qay1A9w9Is000fLkDcmSbS9wYJ/GdDvyYPGIpZe
	A/cgBPRmJcikTBB8F3BY6A4=
X-Google-Smtp-Source: AA0mqf73o+0blSRj3gFasfOp02h7lCGTFha9ScfQ6E1Uw+7vIQBan3N5/TUVcmecCqaV6GqDf26yMw==
X-Received: by 2002:a5d:6e84:0:b0:22d:6ad5:bc0f with SMTP id k4-20020a5d6e84000000b0022d6ad5bc0fmr36462622wrz.115.1669743729932;
        Tue, 29 Nov 2022 09:42:09 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.33])
        by smtp.gmail.com with ESMTPSA id m188-20020a1c26c5000000b003c83465ccbfsm2653097wmm.35.2022.11.29.09.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 09:42:09 -0800 (PST)
Message-ID: <b058213da464f5c61ce8cbcd18efb8d6247004d3.camel@gmail.com>
Subject: Re: [meta-virtualization] docker 20.10.21 from master-next
From: adrian.freihofer@gmail.com
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Date: Tue, 29 Nov 2022 18:42:07 +0100
In-Reply-To: <CADkTA4OVZsthXHcG3NwV-LXCs20M1zMUJmg-YqnVqZmn_GKvEQ@mail.gmail.com>
References: <49b1aa12228d4e7ea8d0a3784c72bfd935f75042.camel@gmail.com>
	 <CADkTA4OVZsthXHcG3NwV-LXCs20M1zMUJmg-YqnVqZmn_GKvEQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Nov 2022 17:42:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7704

On Mon, 2022-11-28 at 23:28 -0500, Bruce Ashfield wrote:
> On Mon, Nov 28, 2022 at 4:46 PM Adrian Freihofer
> <adrian.freihofer@gmail.com> wrote:
> >=20
> > Hi Bruce
> >=20
> > Three comments regarding the docker 20.10.21 recipes on master-
> > next:
> >=20
> > =C2=A0* Could the DEPENDS be reduced to the follwoing list? I guess all
> > =C2=A0=C2=A0 other dependencies (the go stuff) are taken from=C2=A0 the=
 vendor
> > folder
> > =C2=A0=C2=A0 anyway. It's at least working for me like that:
> >=20
> > =C2=A0=C2=A0 DEPENDS =3D " \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libtool-native \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libtool \
> > =C2=A0=C2=A0 "
>=20
> There are some usecases that are using unvendored builds (even if
> docker is currently using a vendor/ directory). They aren't commonly
> tested, but I know they exist, so for now, I'll leave those in place.
>=20
> They are mainly just extra build time, or are you seeing a build
> failure and/or something installed on the rootfs.
It's just a matter of not having to deal with additional artifacts. All
good if there is a reason to keep them.

Regards,
Adrian
>=20
> >=20
> > =C2=A0* The CVE_PRODUCT should probably be changed to:
> >=20
> > =C2=A0=C2=A0 CVE_PRODUCT =3D "mobyproject:moby"
> >=20
> > =C2=A0=C2=A0 With docker e.g. CVE-2022-36109 is not reported by cve_che=
ck but
> > =C2=A0=C2=A0 with mobyproject:moby it works as expected.
>=20
> I didn't add the CVE_PRODUCT part of the recipe, so let me dig into
> that a bit more. It definitely used to need to be 'docker', but I'll
> try and pinpoint where that changed.
>=20
> I'd rather it be an addition, than a replacement (as long as I can
> convince myself we won't mask any CVEs by leaving 'docker' in place).
>=20
> > =C2=A0=C2=A0 Im not 100% sure if mobyproject:moby covers also CVEs in
> > libnetwork
> > =C2=A0=C2=A0 and the cli which are separate repositories.
>=20
> It probably doesn't, since they are quite separate (but maybe the CVE
> tracking takes into account the subproject hashes associated with a
> release). But that is a general problem with all unvendored or multi
> repository go applications .. tracking CVEs is challenging.
>=20
> But just adding the projects to CVE_PRODUCT probably isn't enough,
> unless we individually version the components. I haven't looked at
> how
> the tools work, but I'll put it on my TODO list to have a closer
> look.
>=20
> > =C2=A0* The default PACKAGECONFIG could consider the seccomp
> > DISTRO_FEATURE:
> > =C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 'seccom=
p',
> > '',)}
>=20
> This was in place before seccomp moved to OE Core, and yes, large
> parts of meta-virt need seccomp now, so this isn't a big deal.
>=20
> >=20
> > Of course I can send you a patch but I guess you would prefer to
> > quickly do it on your own since you already started with the update
> > and
> > you usually reject patches against your current work in progress.
> > Hope
> > this is helpful. Otherwise let me know.
>=20
> Yes, I am in the middle of getting things updated, in fact, I have
> some more bumps coming up in addition to what is in master-next, I
> ran
> into some system level issues (again) and have been sorting through
> them.
>=20
> This approach works fine, and I'll take care of stacking some
> patches.
>=20
> Bruce
>=20
> >=20
> > Thank you and regards,
> > Adrian
> >=20
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7700):
> > https://lists.yoctoproject.org/g/meta-virtualization/message/7700
> > Mute This Topic: https://lists.yoctoproject.org/mt/95321879/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe:
> > https://lists.yoctoproject.org/g/meta-virtualization/unsub=C2=A0[
> > bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20
>=20
>=20
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II


