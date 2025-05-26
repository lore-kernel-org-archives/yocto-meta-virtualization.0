Return-Path: <patrick.vogelaar@belden.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7341C5AD49
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 07:10:29 +0000 (UTC)
Subject: [PATCH] cni: make ca-certificates rrecommends
To: meta-virtualization@lists.yoctoproject.org
From: "Patrick Vogelaar via B4 Relay" <patrick.vogelaar@belden.com>
X-Originating-Location: Laupheim, Baden-Wurttemberg, DE (217.232.212.164)
X-Originating-Platform: Linux Firefox 138
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 26 May 2025 00:10:19 -0700
References: <CADkTA4OFj6L70KHB3meGRxJ_6kd2B+W=du5mtEynhHFdnXxGmQ@mail.gmail.com>
In-Reply-To: <CADkTA4OFj6L70KHB3meGRxJ_6kd2B+W=du5mtEynhHFdnXxGmQ@mail.gmail.com>
Message-ID: <15379.1748243419319118604@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="SD8f5e81lM2nGFwIbo6f"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 26 May 2025 07:10:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9258

--SD8f5e81lM2nGFwIbo6f
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 11:59 PM, Bruce Ashfield wrote:

>=20
>=20
>=20
> On Thu, May 22, 2025 at 4:19=E2=80=AFPM Patrick Vogelaar via B4 Relay via=
 lists.yoctoproject.org
> ( http://lists.yoctoproject.org ) <patrick.vogelaar=3D belden.com@lists.y=
octoproject.org
> > wrote:
>=20
>> Moving ca-certificates from RDEPENDS to RRECOMMENDS allows using cni
>> without
>> installing all the certificates.
>=20
>=20
> Hmmm. This was done on purpose as kubernetes images using cni won't
> Come up with the certificates.
>=20
>=20

Shouldn't this be then a dependency of kubernetes?
>=20
>=20
>=20
> So if this changes, those sorts of images will indirectly break.
>=20
>=20

This was the reason why I added it as RRECOMMENDS, because it will still be=
 added but can be removed by adding. PACKAGE_EXCLUDE=3D"ca-certificates"

>=20
>=20
>=20
> If this was a configurable option for the recipe (packageconfig), then
> It would be acceptable and consuming distros could modify the
> Depends if they don't want the certificates to be installed.
>=20
>=20

Should I add it as packageconfig or as dependency of kubernetes?
Patrick

>=20
>=20
>=20
> Bruce
>=20
>=20
>> Signed-off-by: Patrick Vogelaar < patrick.vogelaar@belden.com >
>> ---
>> recipes-networking/cni/ cni_git.bb ( http://cni_git.bb ) | 3 +--
>> 1 file changed, 1 insertion(+), 2 deletions(-)
>>=20
>> diff --git a/recipes-networking/cni/ cni_git.bb ( http://cni_git.bb ) b/=
recipes-networking/cni/
>> cni_git.bb ( http://cni_git.bb )
>> index e6d71aa2..bd67cd0d 100644
>> --- a/recipes-networking/cni/ cni_git.bb ( http://cni_git.bb )
>> +++ b/recipes-networking/cni/ cni_git.bb ( http://cni_git.bb )
>> @@ -109,5 +109,4 @@ INSANE_SKIP:${PN} +=3D "ldflags already-stripped"
>>=20
>> deltask compile_ptest_base
>>=20
>> -RDEPENDS:${PN} +=3D " ca-certificates"
>> -RRECOMMENDS:${PN} +=3D "iptables iproute2"
>> +RRECOMMENDS:${PN} +=3D "ca-certificates iptables iproute2"
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
>=20
>=20
>=20
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>=20
>=20
>

--SD8f5e81lM2nGFwIbo6f
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Thu, May 22, 2025 at 11:59 PM, Bruce Ashfield wrote:</div>
<div>
<blockquote>
<div dir=3D"ltr">
<div dir=3D"ltr">
<div class=3D"gmail_default" style=3D"font-size: small;">&nbsp;</div>
</div>
<br />
<div class=3D"gmail_quote gmail_quote_container">
<div class=3D"gmail_attr" dir=3D"ltr">On Thu, May 22, 2025 at 4:19=E2=80=AF=
PM Patrick Vogelaar via B4 Relay via <a href=3D"http://lists.yoctoproject.o=
rg">lists.yoctoproject.org</a> &lt;patrick.vogelaar=3D<a href=3D"mailto:bel=
den.com@lists.yoctoproject.org">belden.com@lists.yoctoproject.org</a>&gt; w=
rote:</div>
<blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; borde=
r-left: 1px solid #cccccc; padding-left: 1ex;">Moving ca-certificates from =
RDEPENDS to RRECOMMENDS allows using cni without<br />installing all the ce=
rtificates.<span class=3D"gmail_default" style=3D"font-size: small;"></span=
></blockquote>
<div>&nbsp;</div>
<div class=3D"gmail_default" style=3D"font-size: small;">Hmmm. This was don=
e on purpose as kubernetes images using cni won't</div>
<div class=3D"gmail_default" style=3D"font-size: small;">Come up with the c=
ertificates.</div>
<div class=3D"gmail_default" style=3D"font-size: small;">&nbsp;</div>
</div>
</div>
</blockquote>
Shouldn't this be then a dependency of kubernetes?
<blockquote>
<div dir=3D"ltr">
<div class=3D"gmail_quote gmail_quote_container">
<div class=3D"gmail_default" style=3D"font-size: small;">&nbsp;</div>
<div class=3D"gmail_default" style=3D"font-size: small;">&nbsp;</div>
<div class=3D"gmail_default" style=3D"font-size: small;">So if this changes=
, those sorts of images will indirectly break.</div>
<div class=3D"gmail_default" style=3D"font-size: small;">&nbsp;</div>
</div>
</div>
</blockquote>
This was the reason why I added it as RRECOMMENDS, because it will still be=
 added but can be removed by adding. PACKAGE_EXCLUDE=3D"ca-certificates"<br=
 />
<blockquote>
<div dir=3D"ltr">
<div class=3D"gmail_quote gmail_quote_container">
<div class=3D"gmail_default" style=3D"font-size: small;">&nbsp;</div>
<div class=3D"gmail_default" style=3D"font-size: small;">&nbsp;</div>
<div class=3D"gmail_default" style=3D"font-size: small;">If this was a conf=
igurable option for the recipe (packageconfig), then</div>
<div class=3D"gmail_default" style=3D"font-size: small;">It would be accept=
able and consuming distros could modify the</div>
<div class=3D"gmail_default" style=3D"font-size: small;">Depends if they do=
n't want the certificates to be installed.</div>
<div class=3D"gmail_default" style=3D"font-size: small;">&nbsp;</div>
</div>
</div>
</blockquote>
Should I add it as packageconfig or as dependency of kubernetes?<br />Patri=
ck</div>
<div>
<blockquote>
<div dir=3D"ltr">
<div class=3D"gmail_quote gmail_quote_container">
<div class=3D"gmail_default" style=3D"font-size: small;">&nbsp;</div>
<div class=3D"gmail_default" style=3D"font-size: small;">&nbsp;</div>
<div class=3D"gmail_default" style=3D"font-size: small;">Bruce</div>
<div class=3D"gmail_default" style=3D"font-size: small;">&nbsp;</div>
<blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px 0.8ex; borde=
r-left: 1px solid #cccccc; padding-left: 1ex;">Signed-off-by: Patrick Vogel=
aar &lt;<a href=3D"mailto:patrick.vogelaar@belden.com" target=3D"_blank" re=
l=3D"noopener">patrick.vogelaar@belden.com</a>&gt;<br />---<br />&nbsp;reci=
pes-networking/cni/<a href=3D"http://cni_git.bb" target=3D"_blank" rel=3D"n=
oopener noreferrer">cni_git.bb</a> | 3 +--<br />&nbsp;1 file changed, 1 ins=
ertion(+), 2 deletions(-)<br /><br />diff --git a/recipes-networking/cni/<a=
 href=3D"http://cni_git.bb" target=3D"_blank" rel=3D"noopener noreferrer">c=
ni_git.bb</a> b/recipes-networking/cni/<a href=3D"http://cni_git.bb" target=
=3D"_blank" rel=3D"noopener noreferrer">cni_git.bb</a><br />index e6d71aa2.=
.bd67cd0d 100644<br />--- a/recipes-networking/cni/<a href=3D"http://cni_gi=
t.bb" target=3D"_blank" rel=3D"noopener noreferrer">cni_git.bb</a><br />+++=
 b/recipes-networking/cni/<a href=3D"http://cni_git.bb" target=3D"_blank" r=
el=3D"noopener noreferrer">cni_git.bb</a><br />@@ -109,5 +109,4 @@ INSANE_S=
KIP:${PN} +=3D "ldflags already-stripped"<br /><br />&nbsp;deltask compile_=
ptest_base<br /><br />-RDEPENDS:${PN} +=3D " ca-certificates"<br />-RRECOMM=
ENDS:${PN} +=3D "iptables iproute2"<br />+RRECOMMENDS:${PN} +=3D "ca-certif=
icates iptables iproute2"<br />-- <br />2.34.1<br /><br /><br />***********=
***********************************************************<br />DISCLAIMER=
:<br />Privileged and/or Confidential information may be contained in this =
message. If you are not the addressee of this message, you may not copy, us=
e or deliver this message to anyone. In such event, you should destroy the =
message and kindly notify the sender by reply e-mail. It is understood that=
 opinions or conclusions that do not relate to the official business of the=
 company are neither given nor endorsed by the company. Thank You.</blockqu=
ote>
</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<span class=3D"gmail_signature_prefix">-- </span><br />
<div class=3D"gmail_signature" dir=3D"ltr">- Thou shalt not follow the NULL=
 pointer, for chaos and madness await thee at its end<br />- "Use the force=
 Harry" - Gandalf, Star Trek II<br /><br /></div>
</div>
</blockquote>
</div>

--SD8f5e81lM2nGFwIbo6f--

