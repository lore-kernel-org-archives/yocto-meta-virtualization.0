Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
 by mx.groups.io with SMTP id smtpd.web09.10426.1578584863971176429
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 09 Jan 2020 07:47:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agner.ch header.s=dkim header.b=lKqta5Wi;
 spf=pass (domain: agner.ch, ip: 178.209.48.109, mailfrom: stefan@agner.ch)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id DEF875C0851;
	Thu,  9 Jan 2020 16:47:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1578584861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=eS91leKvtwHRrjaR/GC921Gv0mj6YndyrHncem4sbCs=;
	b=lKqta5WiDDvMbr3PmdbZc4f1tpHnY52qlagR/bjZAxfeNCD3IKMOOlGuZycqLRiuEZph1q
	0qSPMlJj7C+ewF568OUfGGCp8jS3NGJ2Fck4kOixNLEAnxLR9mXPHAzL9RVLRXzlkB0zKC
	0hPAL6ATFgGRgFv/X/azmgrIvYixXME=
MIME-Version: 1.0
Date: Thu, 09 Jan 2020 16:47:41 +0100
From: "Stefan Agner" <stefan@agner.ch>
To: akuster <akuster808@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, Stefan Agner
 <stefan.agner@toradex.com>
Subject: Re: [meta-virtualization][zeus][PATCH] docker-ce: update to v19.03.5
In-Reply-To: <b284a9f6-2d39-2ff6-89ac-425cad49349d@gmail.com>
References: <20200109152053.17339-1-stefan@agner.ch>
 <b284a9f6-2d39-2ff6-89ac-425cad49349d@gmail.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <e6eb13621cafb71bde3e412cb01d4868@agner.ch>
X-Sender: stefan@agner.ch
Content-Type: multipart/alternative;
 boundary="=_983546baaa331184b6172c785762b06c"

--=_983546baaa331184b6172c785762b06c
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII

On 2020-01-09 16:25, akuster wrote:

> On 1/9/20 7:20 AM, Stefan Agner wrote: 
> 
>> From: Stefan Agner <stefan.agner@toradex.com>
>> 
>> Bump the git hashes to Docker CE v19.03.5. This requires to get the
>> docker daemon binary from a different location as the symlink from
>> the latest/ subdirectory has been removed. See also commit deaac5d4b3fa
>> ("hack/make.sh remove "latest" symlink") in the docker-ce repository.
> Bugfix only update? The helps the maintainer decide if the backport is viable.
> 
> - armin

That is not that easy to tell. The changelog lists also some stuff which
might be features (e.g.builder-next: Added entitlements in builder
config): 
https://docs.docker.com/engine/release-notes/ 

However, that said in OE we build most of the components outside of the
Docker recipe. It is mainly the Docker engine and client which we build
in that recipe. 

From what I can tell its mostly fixes in engine and client. 

-- 
Stefan 

>> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
>> ---
>> recipes-containers/docker/docker-ce_git.bb | 6 +++---
>> 1 file changed, 3 insertions(+), 3 deletions(-)
>> 
>> diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
>> index 817795f..0d088da 100644
>> --- a/recipes-containers/docker/docker-ce_git.bb
>> +++ b/recipes-containers/docker/docker-ce_git.bb
>> @@ -18,7 +18,7 @@ DESCRIPTION = "Linux container runtime \
>> subtle and/or glaring issues. \
>> "
>> 
>> -SRCREV_docker = "6a30dfca03664a0b6bf0646a7d389ee7d0318e6e"
>> +SRCREV_docker = "633a0ea838f10e000b7c6d6eed1623e6e988b5bb"
>> SRCREV_libnetwork = "5ac07abef4eee176423fdc1b870d435258e2d381"
>> SRC_URI = "\
>> git://github.com/docker/docker-ce.git;branch=19.03;name=docker \
>> @@ -38,7 +38,7 @@ GO_IMPORT = "import"
>> 
>> S = "${WORKDIR}/git"
>> 
>> -DOCKER_VERSION = "19.03.2-ce"
>> +DOCKER_VERSION = "19.03.5-ce"
>> PV = "${DOCKER_VERSION}+git${SRCREV_docker}"
>> 
>> PACKAGES =+ "${PN}-contrib"
>> @@ -99,7 +99,7 @@ do_compile() {
>> do_install() {
>> mkdir -p ${D}/${bindir}
>> cp ${S}/src/import/components/cli/build/docker ${D}/${bindir}/docker
>> -    cp ${S}/src/import/components/engine/bundles/latest/dynbinary-daemon/dockerd ${D}/${bindir}/dockerd
>> +    cp ${S}/src/import/components/engine/bundles/dynbinary-daemon/dockerd ${D}/${bindir}/dockerd
>> cp ${WORKDIR}/git/libnetwork/bin/docker-proxy* ${D}/${bindir}/docker-proxy
>> 
>> if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> 
> 

--=_983546baaa331184b6172c785762b06c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=
=3DUTF-8" /></head><body style=3D'font-size: 10pt'>
<p id=3D"reply-intro">On 2020-01-09 16:25, akuster wrote:</p>
<blockquote type=3D"cite" style=3D"padding: 0 0.4em; border-left: #1010ff =
2px solid; margin: 0">
<div id=3D"replybody1">
<div><br /><br />
<div class=3D"v1moz-cite-prefix">On 1/9/20 7:20 AM, Stefan Agner wrote:</d=
iv>
<blockquote type=3D"cite" style=3D"padding: 0 0.4em; border-left: #1010ff =
2px solid; margin: 0">
<pre class=3D"v1moz-quote-pre">From: Stefan Agner <a class=3D"v1moz-txt-li=
nk-rfc2396E" href=3D"mailto:stefan.agner@toradex.com" rel=3D"noreferrer">&l=
t;stefan.agner@toradex.com&gt;</a>

Bump the git hashes to Docker CE v19.03.5. This requires to get the
docker daemon binary from a different location as the symlink from
the latest/ subdirectory has been removed. See also commit deaac5d4b3fa
("hack/make.sh remove "latest" symlink") in the docker-ce repository.
</pre>
</blockquote>
Bugfix only update? The helps the maintainer decide if the backport is via=
ble.<br /><br />- armin</div>
<div>&nbsp;</div>
</div>
</blockquote>
<div id=3D"replybody1">
<div>&nbsp;</div>
<div>That is not that easy to tell. The changelog lists also some stuff wh=
ich might be features (e.g.<span>builder-next: Added&nbsp;</span><code clas=
s=3D"highlighter-rouge">entitlements</code><span>&nbsp;in builder config)</=
span>:</div>
<div><a href=3D"https://docs.docker.com/engine/release-notes/">https://doc=
s.docker.com/engine/release-notes/</a></div>
<div>&nbsp;</div>
<div>However, that said in OE we build most of the components outside of t=
he Docker recipe. It is mainly the Docker engine and client which we build =
in that recipe.</div>
<div>&nbsp;</div>
<div>From what I can tell its mostly fixes in engine and client.</div>
<div>&nbsp;</div>
<div>--</div>
<div>Stefan</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
</div>
<blockquote type=3D"cite" style=3D"padding: 0 0.4em; border-left: #1010ff =
2px solid; margin: 0">
<div id=3D"replybody1">
<div><br />
<blockquote type=3D"cite" style=3D"padding: 0 0.4em; border-left: #1010ff =
2px solid; margin: 0">
<pre class=3D"v1moz-quote-pre">Signed-off-by: Stefan Agner <a class=3D"v1m=
oz-txt-link-rfc2396E" href=3D"mailto:stefan.agner@toradex.com" rel=3D"noref=
errer">&lt;stefan.agner@toradex.com&gt;</a>
---
 recipes-containers/docker/docker-ce_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containe=
rs/docker/docker-ce_git.bb
index 817795f..0d088da 100644
--- a/recipes-containers/docker/docker-ce_git.bb
+++ b/recipes-containers/docker/docker-ce_git.bb
@@ -18,7 +18,7 @@ DESCRIPTION =3D "Linux container runtime \
  subtle and/or glaring issues. \
  "
=20
-SRCREV_docker =3D "6a30dfca03664a0b6bf0646a7d389ee7d0318e6e"
+SRCREV_docker =3D "633a0ea838f10e000b7c6d6eed1623e6e988b5bb"
 SRCREV_libnetwork =3D "5ac07abef4eee176423fdc1b870d435258e2d381"
 SRC_URI =3D "\
 =09git://github.com/docker/docker-ce.git;branch=3D19.03;name=3Ddocker \
@@ -38,7 +38,7 @@ GO_IMPORT =3D "import"
=20
 S =3D "${WORKDIR}/git"
=20
-DOCKER_VERSION =3D "19.03.2-ce"
+DOCKER_VERSION =3D "19.03.5-ce"
 PV =3D "${DOCKER_VERSION}+git${SRCREV_docker}"
=20
 PACKAGES =3D+ "${PN}-contrib"
@@ -99,7 +99,7 @@ do_compile() {
 do_install() {
 =09mkdir -p ${D}/${bindir}
 =09cp ${S}/src/import/components/cli/build/docker ${D}/${bindir}/docker
-	cp ${S}/src/import/components/engine/bundles/latest/dynbinary-daemon/doc=
kerd ${D}/${bindir}/dockerd
+	cp ${S}/src/import/components/engine/bundles/dynbinary-daemon/dockerd ${=
D}/${bindir}/dockerd
 =09cp ${WORKDIR}/git/libnetwork/bin/docker-proxy* ${D}/${bindir}/docker-p=
roxy
=20
 =09if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}=
; then
</pre>
</blockquote>
</div>
</div>
<br />
<div class=3D"pre" style=3D"margin: 0; padding: 0; font-family: monospace"=
></div>
</blockquote>
<p><br /></p>

</body></html>

--=_983546baaa331184b6172c785762b06c--
