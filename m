Return-Path: <diego.sueiro@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA558C7618E
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 12:53:51 +0000 (UTC)
Subject: Re: [kirkstone,langdale][PATCH] k3s: Fix go-api repo fetch
To: meta-virtualization@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: Cambridge, England, GB (217.140.99.251)
X-Originating-Platform: Linux Chrome 112
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 21 Apr 2023 05:53:45 -0700
References: <CADkTA4ORGgHbUE0pGaZq4H1QJd1nTK5En9n+feu_ZyPPS8AqxQ@mail.gmail.com>
In-Reply-To: <CADkTA4ORGgHbUE0pGaZq4H1QJd1nTK5En9n+feu_ZyPPS8AqxQ@mail.gmail.com>
Message-ID: <23569.1682081625012000457@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 21 Apr 2023 12:53:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8006

On Fri, Apr 21, 2023 at 01:41 PM, Bruce Ashfield wrote:

>
> On Fri, Apr 21, 2023 at 4:23=E2=80=AFAM Diego Sueiro <diego.sueiro@arm.co=
m> wrote:
> >
> > Currently, k3s do_fetch fails with:
> > ERROR: k3s-v1.22.6+k3s1+git4262c6b91a43ef8411870f72ff8b8715949f90e2-r0
> do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any
> source.',
> 'git://github.com/storageos/go-api;name=3Dgo-api;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D/<snip>/build/tmp/work/armv8a-poky-linux/k3s/v1.22.6+k3s=
1+git4262c6b91a43ef8411870f72ff8b8715949f90e2-r0/k3s-v1.22.6+k3s1+git4262c6=
b91a43ef8411870f72ff8b8715949f90e2/src/import/vendor.fetch/github.com/stora=
geos/go-api')
> >
> > The https://github.com/storageos/go-api repository is currently being
> migrated.
> > It's locked while the migration is in progress.
> >
> > To workaround this issue, download the the release tarball instead.
> >
>=20
> I'm ok to make the switch, but can we leave the old SRCREV and SRC_URI
> entries in the file, commented out, with a comment explaining why
> we've made the change.
>=20
> Bruce

Agreed.
I'll be sending a v2 shortly.

Cheers,

Diego

>=20
> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> > ---
> >  recipes-containers/k3s/src_uri.inc | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/recipes-containers/k3s/src_uri.inc
> b/recipes-containers/k3s/src_uri.inc
> > index 4c0c283..fddbbfd 100644
> > --- a/recipes-containers/k3s/src_uri.inc
> > +++ b/recipes-containers/k3s/src_uri.inc
> > @@ -1950,8 +1950,8 @@ SRC_URI +=3D
> "git://github.com/stoewer/go-strcase;name=3Dgo-strcase;protocol=3Dhttps;n
> >
> >  # github.com/storageos/go-api v2.2.0+incompatible
> >  # [1] git ls-remote https://github.com/storageos/go-api
> d6e6bab2519238b8a582cabd2f4a71cca81963aa
> > -SRCREV_go-api=3D"d6e6bab2519238b8a582cabd2f4a71cca81963aa"
> > -SRC_URI +=3D
> "git://github.com/storageos/go-api;name=3Dgo-api;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/stor=
ageos/go-api"
> > +SRC_URI[go-api.sha256sum] =3D
> "2a23ff05a9ad02084e31afa7ffaf4fd97757af9277a5fe8001e5335a6db1ddea"
> > +SRC_URI +=3D
> "https://proxy.golang.org/github.com/storageos/go-api/v2/@v/v2.2.0.zip;do=
wnloadfilename=3Dgo-api_v2.2.0.zip;name=3Dgo-api;subdir=3D${WORKDIR}/${BP}/=
src/import/vendor.fetch/github.com/storageos/go-api"
> >
> >  # github.com/stretchr/objx v0.2.0
> >  # [1] git ls-remote https://github.com/stretchr/objx
> ea4fe68685ee0d3cee7032121851b57e7494e8ea
> > --
> > 2.25.1
> >
>=20
>=20
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

