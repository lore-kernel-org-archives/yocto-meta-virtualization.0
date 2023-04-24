Return-Path: <diego.sueiro@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B1ABC7618E
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 17:46:33 +0000 (UTC)
Subject: Re: [kirkstone,langdale][PATCH v2] k3s: Fix go-api repo fetch
To: meta-virtualization@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: Philadelphia, Pennsylvania, US (216.238.112.55)
X-Originating-Platform: Android Phone Chrome 112
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 24 Apr 2023 10:46:27 -0700
References: <4bba85da8980f7150fc622e3f4d66c8b0aa27f90.1682081786.git.diego.sueiro@arm.com>
In-Reply-To: <4bba85da8980f7150fc622e3f4d66c8b0aa27f90.1682081786.git.diego.sueiro@arm.com>
Message-ID: <28306.1682358387564089488@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 24 Apr 2023 17:46:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8012

Hi Bruce,=20

It seems that the https://github.com/storageos/go-api repository has been r=
estored. Hence, we don't need this patch anymore.=20

Cheers,=20

Diego Sueiro

On Fri, Apr 21, 2023 at 01:57 PM, Diego Sueiro wrote:

>
> Currently, k3s do_fetch fails with:
> ERROR: k3s-v1.22.6+k3s1+git4262c6b91a43ef8411870f72ff8b8715949f90e2-r0 do=
=3D
> _fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any s=
=3D
> ource.', 'git://github.com/storageos/go-api;name=3D3Dgo-api;protocol=3D3D=
http=3D
> s;nobranch=3D3D1;destsuffix=3D3D/<snip>/build/tmp/work/armv8a-poky-linux/=
k3s/=3D
> v1.22.6+k3s1+git4262c6b91a43ef8411870f72ff8b8715949f90e2-r0/k3s-v1.22.6+k=
=3D
> 3s1+git4262c6b91a43ef8411870f72ff8b8715949f90e2/src/import/vendor.fetch/g=
=3D
> ithub.com/storageos/go-api')
>=20
> The https://github.com/storageos/go-api repository is currently being mig=
=3D
> rated.
> It's locked while the migration is in progress.
>=20
> To workaround this issue, download the release tarball from
> https://proxy.golang.org instead.
>=20
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ---
>  recipes-containers/k3s/src_uri.inc | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes-containers/k3s/src_uri.inc b/recipes-containers/k3s/=
=3D
> src_uri.inc
> index 4c0c283..3af48a8 100644
> --- a/recipes-containers/k3s/src_uri.inc
> +++ b/recipes-containers/k3s/src_uri.inc
> @@ -1950,8 +1950,13 @@ SRC_URI +=3D3D "git://github.com/stoewer/go-strcas=
e;=3D
> name=3D3Dgo-strcase;protocol=3D3Dhttps;n
> =3D20
>  # github.com/storageos/go-api v2.2.0+incompatible
>  # [1] git ls-remote https://github.com/storageos/go-api d6e6bab2519238b8=
=3D
> a582cabd2f4a71cca81963aa=3D20
> -SRCREV_go-api=3D3D"d6e6bab2519238b8a582cabd2f4a71cca81963aa"
> -SRC_URI +=3D3D "git://github.com/storageos/go-api;name=3D3Dgo-api;protoc=
ol=3D3D=3D
> https;nobranch=3D3D1;destsuffix=3D3D${WORKDIR}/${BP}/src/import/vendor.fe=
tch/=3D
> github.com/storageos/go-api"
> +# The following needs to be changed because the https://github.com/stora=
=3D
> geos/go-api
> +# repository is currently being migrated. It's locked while the migratio=
=3D
> n is in progress.
> +# To workaround this issue, download the release tarball from https://pr=
=3D
> oxy.golang.org instead.
> +#SRCREV_go-api=3D3D"d6e6bab2519238b8a582cabd2f4a71cca81963aa"
> +#SRC_URI +=3D3D "git://github.com/storageos/go-api;name=3D3Dgo-api;proto=
col=3D3D=3D
> https;nobranch=3D3D1;destsuffix=3D3D${WORKDIR}/${BP}/src/import/vendor.fe=
tch/=3D
> github.com/storageos/go-api"
> +SRC_URI[go-api.sha256sum] =3D3D "2a23ff05a9ad02084e31afa7ffaf4fd97757af9=
27=3D
> 7a5fe8001e5335a6db1ddea"
> +SRC_URI +=3D3D "https://proxy.golang.org/github.com/storageos/go-api/v2/=
@v=3D
> /v2.2.0.zip;downloadfilename=3D3Dgo-api_v2.2.0.zip;name=3D3Dgo-api;subdir=
=3D3D$=3D
> {WORKDIR}/${BP}/src/import/vendor.fetch/github.com/storageos/go-api"
> =3D20
>  # github.com/stretchr/objx v0.2.0
>  # [1] git ls-remote https://github.com/stretchr/objx ea4fe68685ee0d3cee7=
=3D
> 032121851b57e7494e8ea=3D20
> --=3D20
> 2.25.1
>=20
>

