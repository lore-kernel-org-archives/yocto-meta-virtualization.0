Subject: Re: [meta-cloud-services] [PATCH] iproute2: upgrade bbappend to 7.%
To: meta-virtualization@lists.yoctoproject.org
From: "Jonas Gorski" <jonas.gorski@bisdn.de>
X-Originating-Location: Berlin, State of Berlin, DE (92.75.58.142)
X-Originating-Platform: Linux Firefox 158
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 22 Oct 2026 04:43:52 -0700
References: <20260508055141.351-1-wangmy@fujitsu.com>
In-Reply-To: <20260508055141.351-1-wangmy@fujitsu.com>
Message-ID: <2546327.1792669432289997348@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 11:44:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10122

Hi,

On Fri, May  8, 2026 at 07:52 AM, wangmy wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>=20
> Compatibility with OE-core nanbield.
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../iproute2/{iproute2_6.%.bbappend =3D> iproute2_7.%.bbappend}     | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-openstack/recipes-support/iproute2/{iproute2_6.%.bbappend =
=3D>
> iproute2_7.%.bbappend} (100%)
>=20
> diff --git a/meta-openstack/recipes-support/iproute2/iproute2_6.%.bbappen=
d
> b/meta-openstack/recipes-support/iproute2/iproute2_7.%.bbappend
> similarity index 100%
> rename from meta-openstack/recipes-support/iproute2/iproute2_6.%.bbappend
> rename to meta-openstack/recipes-support/iproute2/iproute2_7.%.bbappend
> --=20
> 2.43.0
>=20
>

This (and the qemu bbappend bump) prevent building from the wrynose branch =
for me:

ERROR: No recipes in default available for:
  .../meta-cloud-services/meta-openstack/recipes-devtools/qemu/qemu_11.%.bb=
append
  .../meta-cloud-services/meta-openstack/recipes-support/iproute2/iproute2_=
7.%.bbappend

and indeed, wrynose is still at qemu 10(.2.0) and iproute2 6(.19).

(Simple reverts should fix this).

Best regards,
Jonas
