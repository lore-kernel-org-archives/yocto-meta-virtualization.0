Subject: Re: linux-yocto virtualization requires virtio.scc from yocto-kernel-cache
To: meta-virtualization@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: Santa Clara, California, US (217.140.99.251)
X-Originating-Platform: Linux Chrome 92
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 22 Jul 2021 23:32:22 -0700
References: <CAFrQVPN-a-5DPmxe3A9-o6U=bwsdGQForwQ-qYUPXsJS1pgdCw@mail.gmail.com>
In-Reply-To: <CAFrQVPN-a-5DPmxe3A9-o6U=bwsdGQForwQ-qYUPXsJS1pgdCw@mail.gmail.com>
Message-ID: <32271.1627021942920151318@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 23, 2021 at 05:03 AM, Kyle Russell wrote:

>
> Hello,
>=20
> meta-virtualization's linux-yocto_virtualization.inc includes
> cfg/virtio.scc in KERNEL_FEATURES, which is a dependency from
> yocto-kernel-cache.  However, we do not use yocto-kernel-cache with our
> custom linux-* recipe, so we're hitting a metadata error because of a
> missing virtio.scc.  It seems like the creation of linux-%.bbappend (in
> f2f36a8061c600b35b5f0ce1599d59f1d144a3aa) was intentional to match kerne=
l
> recipes other than linux-yocto*, which we could benefit from, but the la=
ck
> of yocto-kernel-cache is problematic with virtio.scc.
>=20
> Can meta-virtualization provide virtio.scc like it does for the other
> kernel features to allow decoupling from yocto-kernel-cache?
>=20

Your question made me remember about the docker.scc. Which is being mainta=
ined
both on meta-virt and yocto-kernel-cache. And linux-yocto_virtualization.i=
nc makes
usage of the one from meta-virt, which feels strange to me since it is a
**linux-yocto**_virtualization.inc file that supposedly extends linux-yoct=
o*.bb from
oe-core.
IMHO, for scc/cfg files we should try to rely on a single canonical source=
, and in this
case, I believe is yocto-kernel-cache repo. Maintaining the same file for =
the same
purpose in two different places brings the risk of diversion and increases=
 maintenance
effort to keep the instances aligned.
Also, the yocto-kernel-cache gives us the ability to easily manage .scc fi=
les
per kernel version.

> meta-virtualization used to allow this decoupling by configuring the vir=
tio
> feature without the yocto-kernel-cache in
> f1c03f390e95b63d5c2dfba9140d1b07c4d17acf, but that was restructured in
> 21d8bcdb791a1ea766a3e7e7663c7b6d49bc861a.  The dependency was not requir=
ed
> unless you were using linux-yocto, but as of f2f36a8061c60 is now requir=
ed
> for all linux-% recipes.  (We just now noticed because our linux recipe =
has
> recently been updated to match a kernel version supported by
> meta-virtualization.
>=20
> Thanks,
>=20
> Kyle
>
