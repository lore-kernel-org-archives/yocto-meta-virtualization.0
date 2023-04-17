Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F6DC77B72
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 12:13:02 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web11.52660.1681733573891328480
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 17 Apr 2023 05:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=TK73ZCuR;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id z132so328142iof.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Apr 2023 05:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681733573; x=1684325573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46G8cppfiME6etraogzOreTRxQTIQ0iwBQR+9v/I4/w=;
        b=TK73ZCuRtbhgTGI6K8bq7pdvPS1jtcuA6wm4FLl5cpqkZYEjX1wRuxde52fNdkfOqX
         6VFPrvRHErQa+JI1GGrZVGeb99k/xCqp/LjvB0mJTDEUHkpzsUElXnBnW31n2+zs2Y+L
         2T8YPJPZU/qr2PcZYQX2DKwDQ6t7IhlRFiHcBfE8SDMYiAgi33DyPzXarDfsxFwy41nO
         YdL8qbcfhU/rqj+Hf8FLSZkRUyeeLKPFzBfXoKbm61nYjvIUgk0xPiQlr3oI7CmonNHc
         55K0ObUehJIz0rUg1x3aB68zSCGXnZx6GLpVEMxnRvME/eYUw4aoUMlObqqVO1jh5Lne
         Zgcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681733573; x=1684325573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46G8cppfiME6etraogzOreTRxQTIQ0iwBQR+9v/I4/w=;
        b=YfUXcxPAbIZELEbo4hBvynX7yn8l7IvEkcDHU3XlNzAie9DJGK5D3+fmhvGeRBLIsd
         /eooMd2GX5FshHT5xXYTbVs7mT4GGbXP7Yw/7tnLTmuo978Y5LFhT5gdrQC9fvm1Qrqj
         CDrcYuNwGaYZD3E2FBC+LzAe6agAxEdnz6LUntGRvJxgRiz3FB2FUvuvQRb01j6kT0MA
         AeqPl87lCArxKXvqPCRc5rUT0JlM06SUbDsaCGYSxlLBDsWdiyhRIUBrG+MoH5TTPZE2
         9QzdiXV3/g6v9CCibg6ykZKOQWYarHD/8FN7/8xq25pRlqRPNR3+feb6/CHXXpvGPOZw
         q3gg==
X-Gm-Message-State: AAQBX9cck77zuoOopdGTFGTc0MyteBFxc+hnl9GlT2of8Hyoa2Rwz6Zl
	Ut1hLmv/sjIufhaik59WKdkX3GeS4rZtzGswhcc=
X-Google-Smtp-Source: AKy350bTHryb0RI45yUJv7fAZpIcshQN9fRFDlX8BeDES/6yZFf4X5P9IlSSo+R+DBNhmunsSan/DtMdrJKBx1TFiOM=
X-Received: by 2002:a6b:ec02:0:b0:762:e1f2:3ec3 with SMTP id
 c2-20020a6bec02000000b00762e1f23ec3mr756526ioh.1.1681733573004; Mon, 17 Apr
 2023 05:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230414070800.381040-1-xiangyu.chen@eng.windriver.com>
 <CADkTA4P8ZJ-wCoJdx8BfXbsQ+9-ixQDYKFmr8oa5FG4105imJg@mail.gmail.com> <21a0b758-1be5-86a3-4267-c3eecbfe1c67@windriver.com>
In-Reply-To: <21a0b758-1be5-86a3-4267-c3eecbfe1c67@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 17 Apr 2023 08:12:41 -0400
Message-ID: <CADkTA4MJwngrujsyu=76HF-8wQH5gj5ReHfy2xB+a5e358OYNg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] ovs: Uprev from 3.0.3 to 3.0.4
To: xiangyu.chen@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Apr 2023 12:13:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7996

On Sun, Apr 16, 2023 at 10:15=E2=80=AFPM <xiangyu.chen@eng.windriver.com> w=
rote:
>
>
> On 4/14/23 21:00, Bruce Ashfield wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > Note that I have a 3.1.x uprev for OVS prepared for post mickledore rel=
ease.
> >
> > But I'll stage this for now, pending the results of my testing.
> >
> > I'll also regenerate the commit message, as we should be capturing the
> > shortlogs of commits that are part of a release.
>
> Hi Bruce,
>
> Thanks for your response,  this small version bump is fixing
> CVE-2023-1668 which was found recently, so I bump the latest 3.0.x
> version directly :p.
>
> Regarding "capturing the shortlogs of commit", may I refer to this
> commit as an example so that I will follow the rule in next patch?
>
> https://git.yoctoproject.org/meta-virtualization/commit/?h=3Dmaster-next&=
id=3D28491d29ed5b77114822924b0a3c48a4573c9762
>

Yes, that is a good reference.

I see your kirstone patch has the logs, and it looks good!

Bruce

>
> Br,
>
> Xiangyu
>
>
> > Bruce
> >
> >
> > On Fri, Apr 14, 2023 at 3:09=E2=80=AFAM Xiangyu Chen
> > <xiangyu.chen@eng.windriver.com> wrote:
> >> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> >>
> >> Pickup the latest security and bug fixes for the ovs.
> >>
> >> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> >> ---
> >>   recipes-networking/openvswitch/openvswitch_git.bb | 6 +++---
> >>   1 file changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recip=
es-networking/openvswitch/openvswitch_git.bb
> >> index 1ad3e57..798c7be 100644
> >> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> >> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> >> @@ -14,12 +14,12 @@ RDEPENDS:${PN}-ptest +=3D "\
> >>          "
> >>
> >>   S =3D "${WORKDIR}/git"
> >> -PV =3D "3.0.3+${SRCPV}"
> >> -CVE_VERSION =3D "3.0.3"
> >> +PV =3D "3.0.4+${SRCPV}"
> >> +CVE_VERSION =3D "3.0.4"
> >>
> >>   FILESEXTRAPATHS:append :=3D "${THISDIR}/${PN}-git:"
> >>
> >> -SRCREV =3D "7b5c4240c1ed5f38e476cf08819869dc14f55e8a"
> >> +SRCREV =3D "2a98be5adaa6b3bd6c71a0ee01fc2782c67e7c78"
> >>   SRC_URI +=3D "git://github.com/openvswitch/ovs.git;protocol=3Dhttps;=
branch=3Dbranch-3.0 \
> >>               file://openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fba=
f5a2ae34de2f3.patch \
> >>               file://run-ptest \
> >> --
> >> 2.34.1
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#7991): https://lists.yoctoproject.org/g/meta-virtu=
alization/message/7991
> >> Mute This Topic: https://lists.yoctoproject.org/mt/98257376/1050810
> >> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> >> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsu=
b [bruce.ashfield@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

