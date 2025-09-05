Return-Path: <patrick.vogelaar@belden.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5118CA1015
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 08:42:15 +0000 (UTC)
Subject: Re: [PATCH] docker: make ca-certificates a packageconfig
To: meta-virtualization@lists.yoctoproject.org
From: "Patrick Vogelaar via B4 Relay" <patrick.vogelaar@belden.com>
X-Originating-Location: Slavonski Brod, Brod-Posavina County, HR (194.152.242.219)
X-Originating-Platform: Windows Firefox 142
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 05 Sep 2025 01:42:08 -0700
References: <aLjn3mCCaI8wCYlR@gmail.com>
In-Reply-To: <aLjn3mCCaI8wCYlR@gmail.com>
Message-ID: <14236.1757061728389674907@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="C9FVTguaAoYYfLKHV4Nf"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 05 Sep 2025 08:42:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9375

--C9FVTguaAoYYfLKHV4Nf
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 4, 2025 at 03:14 AM, Bruce Ashfield wrote:

>=20
> In message: [meta-virtualization][PATCH] docker: make ca-certificates a
> packageconfig
> on 24/08/2025 Patrick Vogelaar via B4 Relay via lists.yoctoproject.org
> wrote:
>=20
>=20
>> Moving ca-certificates into a packageconfig allows using docker without
>> installing all the certificates.
>=20
> I don't have (many) issues with the patch, but in my experience you
> can't work with any registries or services with the certs being present.
>=20
> Are you installing them some other way ? or using some alternative ?

We are either not installing from registry at all, or we have our own regis=
try
were we put only the required certificate and not the whole pool of
certificates.

Patrick
>=20
>=20
> Since the defaults aren't changed by this patch, I'll definitely merge
> it. I'd just like to make sure that it won't create a hidden/non-working
> configuration.
>=20
> Bruce
>=20
>=20
>> Signed-off-by: Patrick Vogelaar <patrick.vogelaar@belden.com>
>> ---
>> recipes-containers/docker/docker.inc | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/recipes-containers/docker/docker.inc
>> b/recipes-containers/docker/docker.inc
>> index 94ee34db..c464bc3c 100644
>> --- a/recipes-containers/docker/docker.inc
>> +++ b/recipes-containers/docker/docker.inc
>> @@ -10,7 +10,6 @@ RDEPENDS:${PN} =3D "util-linux util-linux-unshare ipta=
bles
>> \
>> ${@bb.utils.contains('DISTRO_FEATURES', 'aufs', 'aufs-util', '', d)} \
>> ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'cgroup-lite', d)=
}
>> \
>> bridge-utils \
>> - ca-certificates \
>> "
>> RDEPENDS:${PN} +=3D "virtual-containerd
>> ${VIRTUAL-RUNTIME_container_runtime}"
>>=20
>> @@ -37,10 +36,11 @@ RPROVIDES:${PN}-dev +=3D "docker-dev"
>> RPROVIDES:${PN}-contrip +=3D "docker-dev"
>>=20
>> inherit pkgconfig
>> -PACKAGECONFIG ??=3D "docker-init seccomp"
>> +PACKAGECONFIG ??=3D "docker-init seccomp ca-certs"
>> PACKAGECONFIG[seccomp] =3D "seccomp,,libseccomp"
>> PACKAGECONFIG[docker-init] =3D ",,,docker-init"
>> PACKAGECONFIG[transient-config] =3D "transient-config"
>> +PACKAGECONFIG[ca-certs] =3D ",,,ca-certificates"
>>=20
>> GO_IMPORT =3D "import"
>>=20
>> --
>> 2.34.1
>>=20
>>=20
>> **********************************************************************
>> DISCLAIMER:
>> Privileged and/or Confidential information may be contained in this
>> message. If you are not the addressee of this message, you may not copy,
>> use or deliver this message to anyone. In such event, you should destroy
>> the message and kindly notify the sender by reply e-mail. It is understo=
od
>> that opinions or conclusions that do not relate to the official business
>> of the company are neither given nor endorsed by the company. Thank You.
>=20
>

--C9FVTguaAoYYfLKHV4Nf
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Thu, Sep 4, 2025 at 03:14 AM, Bruce Ashfield wrote:</div>
<div>
<blockquote>In message: [meta-virtualization][PATCH] docker: make ca-certif=
icates a packageconfig<br />on 24/08/2025 Patrick Vogelaar via B4 Relay via=
 lists.yoctoproject.org wrote:<br /><br />
<blockquote>Moving ca-certificates into a packageconfig allows using docker=
 without<br />installing all the certificates.</blockquote>
I don't have (many) issues with the patch, but in my experience you<br />ca=
n't work with any registries or services with the certs being present.<br /=
><br />Are you installing them some other way ? or using some alternative ?=
</blockquote>
We are either not installing from registry at all, or we have our own regis=
try<br />were we put only the required certificate and not the whole pool o=
f<br />certificates.</div>
<div>&nbsp;</div>
<div>Patrick
<blockquote><br />Since the defaults aren't changed by this patch, I'll def=
initely merge<br />it. I'd just like to make sure that it won't create a hi=
dden/non-working<br />configuration.<br /><br />Bruce<br /><br />
<blockquote>Signed-off-by: Patrick Vogelaar &lt;patrick.vogelaar@belden.com=
&gt;<br />---<br />recipes-containers/docker/docker.inc | 4 ++--<br />1 fil=
e changed, 2 insertions(+), 2 deletions(-)<br /><br />diff --git a/recipes-=
containers/docker/docker.inc b/recipes-containers/docker/docker.inc<br />in=
dex 94ee34db..c464bc3c 100644<br />--- a/recipes-containers/docker/docker.i=
nc<br />+++ b/recipes-containers/docker/docker.inc<br />@@ -10,7 +10,6 @@ R=
DEPENDS:${PN} =3D "util-linux util-linux-unshare iptables \<br />${@bb.util=
s.contains('DISTRO_FEATURES', 'aufs', 'aufs-util', '', d)} \<br />${@bb.uti=
ls.contains('DISTRO_FEATURES', 'systemd', '', 'cgroup-lite', d)} \<br />bri=
dge-utils \<br />- ca-certificates \<br />"<br />RDEPENDS:${PN} +=3D "virtu=
al-containerd ${VIRTUAL-RUNTIME_container_runtime}"<br /><br />@@ -37,10 +3=
6,11 @@ RPROVIDES:${PN}-dev +=3D "docker-dev"<br />RPROVIDES:${PN}-contrip =
+=3D "docker-dev"<br /><br />inherit pkgconfig<br />-PACKAGECONFIG ??=3D "d=
ocker-init seccomp"<br />+PACKAGECONFIG ??=3D "docker-init seccomp ca-certs=
"<br />PACKAGECONFIG[seccomp] =3D "seccomp,,libseccomp"<br />PACKAGECONFIG[=
docker-init] =3D ",,,docker-init"<br />PACKAGECONFIG[transient-config] =3D =
"transient-config"<br />+PACKAGECONFIG[ca-certs] =3D ",,,ca-certificates"<b=
r /><br />GO_IMPORT =3D "import"<br /><br />-- <br />2.34.1<br /><br /><br =
/>**********************************************************************<br=
 />DISCLAIMER:<br />Privileged and/or Confidential information may be conta=
ined in this message. If you are not the addressee of this message, you may=
 not copy, use or deliver this message to anyone. In such event, you should=
 destroy the message and kindly notify the sender by reply e-mail. It is un=
derstood that opinions or conclusions that do not relate to the official bu=
siness of the company are neither given nor endorsed by the company. Thank =
You.</blockquote>
</blockquote>
</div>

--C9FVTguaAoYYfLKHV4Nf--

