Return-Path: <diego.sueiro@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE5BC04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 07:19:18 +0000 (UTC)
Subject: Re: K3s service not starting after go-lang version update in poky
To: meta-virtualization@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: Cambridge, England, GB (217.140.106.55)
X-Originating-Platform: Linux Chrome 103
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 27 Jul 2022 00:19:16 -0700
References: 
 <CADkTA4OwycAA=stusCGHrEjRga+JP3vjm+U5anU50y-D-0o8kA@mail.gmail.com>
In-Reply-To: 
 <CADkTA4OwycAA=stusCGHrEjRga+JP3vjm+U5anU50y-D-0o8kA@mail.gmail.com>
Message-ID: <8237.1658906356879254972@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 27 Jul 2022 07:19:18 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7475

Hi Bruce,

On Mon, Jun 27, 2022 at 01:51 PM, Bruce Ashfield wrote:

>
> On Mon, Jun 27, 2022 at 6:00 AM Kamil Dzie=C5=BCyk <Kamil.Dziezyk@arm.com=
> wrote:
> >
> > Hello Bruce,
> >
> > There is a problem with the k3s service starting when the Yocto image i=
s
> built with the meta-virtualization master branch.
> >
> > This issue might be related to the go-lang version(1.18) used to build =
the
> k3s.
> > After this patch was merged:
> https://git.yoctoproject.org/poky/commit/?id=3D8dc1f28aa10c775e64b5275679=
b1f8142e8cd038
> > a warning pops up during the k3s build:
> > ```
> > WARNING: k3s-v1.22.6+k3s1+git4262c6b91a43ef8411870f72ff8b8715949f90e2-r=
0
> do_package_qa: QA Issue: k3s: ELF binary /usr/local/bin/k3s has relocatio=
ns in
> .text [textrel]
>=20
> That warning has actually been around for a while.
>=20
> > ```
> > See k3s service start logs here: https://pastebin.com/uXvsjPFu
> > I have tried a more recent version of k3s 1.22.8 with a small change an=
d
> this version of the k3s starts successfully.
> > However, I did not manage to update all k3s build dependency sources fr=
om
> the recipes-container/k3s/src_uri.inc.
> > I have built the k3s with this change: https://pastebin.com/3QGvcqta
> >
> > Could you update the k3s recipe on the master branch, to build a more r=
ecent
> version 1.23 or 1.24?
>=20
> I have a 1.24 update already underway. So hopefully things will be
> sorted out shortly.

Do you have an ETA for this?

--
Diego Sueiro

>=20
> Bruce
>=20
> >
> > Thanks,
> >
> > Kamil Dzie=C5=BCyk
> >
>=20
>=20
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

