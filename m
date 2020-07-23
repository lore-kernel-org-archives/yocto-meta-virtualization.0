Subject: Re: [PATCH] qemu: Remove duplicated xen PACKAGECONFIG
To: meta-virtualization@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: California, US (217.140.99.251)
X-Originating-Platform: Windows Chrome 84
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 23 Jul 2020 07:45:54 -0700
References: <1595515203-105178-1-git-send-email-diego.sueiro@arm.com>
In-Reply-To: <1595515203-105178-1-git-send-email-diego.sueiro@arm.com>
Message-ID: <3944.1595515554632053002@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2020 at 03:40 PM, Diego Sueiro wrote:

>
> The "meta/recipes-devtools/qemu/qemu.inc" already sets the PACKAGECONFIG=
[xen].
>=20
> Change-Id: I60aeecd357f13fab572885db2d3e00c37681d07b

By bad. I forgot to remove the Change-Id. Sending a v2 now.

> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ---
>  recipes-devtools/qemu/qemu_%.bbappend | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/recipes-devtools/qemu/qemu_%.bbappend
> b/recipes-devtools/qemu/qemu_%.bbappend
> index 998a401..5cca9e1 100644
> --- a/recipes-devtools/qemu/qemu_%.bbappend
> +++ b/recipes-devtools/qemu/qemu_%.bbappend
> @@ -1,3 +1 @@
> -PACKAGECONFIG[xen] =3D
> "--enable-xen,--disable-xen,xen-tools,xen-tools-libxenstore
> xen-tools-libxenctrl xen-tools-libxenguest"
> -
>  require ${@bb.utils.contains('DISTRO_FEATURES', 'vmsep',
> '${BPN}-package-split.inc', '', d)}
> --=20
> 2.7.4
>=20
>
