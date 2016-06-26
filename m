Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BA95CE00EA4; Sun, 26 Jun 2016 11:41:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.220.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 76061E00EA4
	for <meta-virtualization@yoctoproject.org>;
	Sun, 26 Jun 2016 11:40:58 -0700 (PDT)
Received: by mail-qk0-f196.google.com with SMTP id r136so8423308qke.3
	for <meta-virtualization@yoctoproject.org>;
	Sun, 26 Jun 2016 11:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=dUXU5muZ1Es6OYfmrJFPBRHIEPvsqvUu1/cqBovn3+U=;
	b=bQ+fCACPqdbebrnMtURTa7RhP7pMEFJG0DYyv1G15MUxGe5VZVcTbuhc4qvvQeUeUk
	lwim8jBOE7bxCkINeF6QyhByKdwK13s1iTO69IuLrtOxeT23cPiSPipUIwBwuW8kjgiM
	9aPQ3YiyntpTePjwxTI+DNe92xrsT2omaAa2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=dUXU5muZ1Es6OYfmrJFPBRHIEPvsqvUu1/cqBovn3+U=;
	b=XscBy3wtuCzlXUkKtH7XRIxX1XiNXqfnWsDOSV3cI785Pwk2F/W3hc6d2D4a7LXB06
	pRj8ycP3DqUixXG4UFk3pXyZLPyXwhSlteGWbvkVvxcKbSa0IEMYncK7YEi2IN+WlFry
	J7OhMVAI6DbDBgkobvvJq9H6Ru5Ph08ZvqUfQerMesVnE4ayKgbr+qdcCZ0XmNcH3h5s
	VGNjgVV7koZr5MyHEPgxakIs01p9ytnWcYEQE0yQwP78EFaLJLYTELryvDXxIBUWhnxb
	tQblOnD05RJyhvqFmOspiMKMAmBcfSb+G4xiGWHR3RBnUzwHLsMZLb04QsSQWLsuleBj
	JPrA==
X-Gm-Message-State: ALyK8tKi2CEb+dvNH2/QgvcCrP9n0GRYubU3g67Q/S7XPxv3i86yyvDURyU2XPr7x46qAw==
X-Received: by 10.55.133.6 with SMTP id h6mr19222283qkd.82.1466966457397;
	Sun, 26 Jun 2016 11:40:57 -0700 (PDT)
Received: from doug-macbook.local
	(104-179-196-18.lightspeed.brhmal.sbcglobal.net. [104.179.196.18])
	by smtp.googlemail.com with ESMTPSA id
	m25sm1862851qta.46.2016.06.26.11.40.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 26 Jun 2016 11:40:56 -0700 (PDT)
To: Chris Patterson <cjp256@gmail.com>, meta-virtualization@yoctoproject.org
References: <1466715778-32065-1-git-send-email-cjp256@gmail.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <392f2d1b-4b0b-4d2c-9d16-eb54bea986b6@cardoe.com>
Date: Sun, 26 Jun 2016 13:40:52 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1466715778-32065-1-git-send-email-cjp256@gmail.com>
Cc: Chris Patterson <pattersonc@ainfosec.com>
Subject: Re: [PATCH] xen: uprev to 4.7.0
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Jun 2016 18:41:03 -0000
X-Groupsio-MsgNum: 1994
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="wuxLhFeHD1SFHsWSuKNRtmXgrfLxitVuo"

--wuxLhFeHD1SFHsWSuKNRtmXgrfLxitVuo
Content-Type: multipart/mixed; boundary="r34cVSW707uT93Sk02Iss1USUVW9vx8Tf"
From: Doug Goldstein <cardoe@cardoe.com>
To: Chris Patterson <cjp256@gmail.com>, meta-virtualization@yoctoproject.org
Cc: Chris Patterson <pattersonc@ainfosec.com>
Message-ID: <392f2d1b-4b0b-4d2c-9d16-eb54bea986b6@cardoe.com>
Subject: Re: [meta-virtualization] [PATCH] xen: uprev to 4.7.0
References: <1466715778-32065-1-git-send-email-cjp256@gmail.com>
In-Reply-To: <1466715778-32065-1-git-send-email-cjp256@gmail.com>

--r34cVSW707uT93Sk02Iss1USUVW9vx8Tf
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 6/23/16 4:02 PM, Chris Patterson wrote:
> From: Chris Patterson <pattersonc@ainfosec.com>
>=20
> - update packages and add additional ones for new binaries
>   (cpuid and livepatch)
> - update xen_git to point to 4.7, make branch=3D fully variable,
>   and remove assumed .0 from release version.
>=20
> Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
> ---
>  recipes-extended/xen/xen.inc      | 15 +++++++++++++++
>  recipes-extended/xen/xen_4.6.1.bb | 10 ----------
>  recipes-extended/xen/xen_4.7.0.bb | 10 ++++++++++
>  recipes-extended/xen/xen_git.bb   |  9 +++++----
>  4 files changed, 30 insertions(+), 14 deletions(-)
>  delete mode 100644 recipes-extended/xen/xen_4.6.1.bb
>  create mode 100644 recipes-extended/xen/xen_4.7.0.bb
>=20
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.in=
c
> index de8c168..ff502ff 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -151,6 +151,7 @@ PACKAGES =3D "\
>      ${PN}-base \
>      ${PN}-blktap \
>      ${PN}-console \
> +    ${PN}-cpuid \
>      ${PN}-dbg \
>      ${PN}-dev \
>      ${PN}-devd \
> @@ -196,6 +197,7 @@ PACKAGES =3D "\
>      ${PN}-libxenvchan-dev \
>      ${PN}-libxlutil \
>      ${PN}-libxlutil-dev \
> +    ${PN}-livepatch \
>      ${PN}-misc \
>      ${PN}-pygrub \
>      ${PN}-python \
> @@ -369,6 +371,10 @@ FILES_${PN}-console =3D "\
>      ${sbindir}/xenconsoled \
>      "
> =20
> +FILES_${PN}-cpuid =3D "\
> +    ${bindir}/xen-cpuid \
> +    "
> +
>  FILES_${PN}-devd =3D "\
>      ${sysconfdir}/init.d/xendriverdomain \
>      "
> @@ -399,6 +405,10 @@ FILES_${PN}-kdd =3D "\
>      ${sbindir}/kdd \
>      "
> =20
> +FILES_${PN}-livepatch +=3D " \
> +    ${sbindir}/xen-livepatch \
> +    "
> +
>  FILES_${PN}-misc =3D "\
>      ${bindir}/xencons \
>      ${bindir}/xencov_split \
> @@ -527,6 +537,7 @@ FILES_${PN}-remus =3D "\
>      "
> =20
>  FILES_${PN}-scripts-network =3D " \
> +    ${sysconfdir}/xen/scripts/colo-proxy-setup \
>      ${sysconfdir}/xen/scripts/network-bridge \
>      ${sysconfdir}/xen/scripts/network-nat \
>      ${sysconfdir}/xen/scripts/network-route \
> @@ -544,6 +555,7 @@ FILES_${PN}-scripts-block =3D " \
>      ${sysconfdir}/xen/scripts/blktap \
>      ${sysconfdir}/xen/scripts/block \
>      ${sysconfdir}/xen/scripts/block-common.sh \
> +    ${sysconfdir}/xen/scripts/block-dummy \
>      ${sysconfdir}/xen/scripts/block-enbd \
>      ${sysconfdir}/xen/scripts/block-iscsi \
>      ${sysconfdir}/xen/scripts/block-nbd \
> @@ -837,6 +849,9 @@ do_configure() {
>  }
> =20
>  do_compile() {
> +    # workaround for build bug when CFLAGS is exported
> +    # https://www.mail-archive.com/xen-devel@lists.xen.org/msg67822.ht=
ml
> +    unset CFLAGS

You'll actually also need:

    export HOSTCXX=3D"${BUILD_CXX}"
    export HOSTCC=3D"${BUILD_CC}"

for things to compile properly for cross compiles as well. You'll need
that added to do_install() as well.


>      oe_runmake
>  }
> =20
> diff --git a/recipes-extended/xen/xen_4.6.1.bb b/recipes-extended/xen/x=
en_4.6.1.bb
> deleted file mode 100644
> index 0adf8ad..0000000
> --- a/recipes-extended/xen/xen_4.6.1.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require xen.inc
> -
> -SRC_URI =3D " \
> -    http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz \=

> -    "
> -
> -SRC_URI[md5sum] =3D "df2d854c3c90ffeefaf71e7f868fb326"
> -SRC_URI[sha256sum] =3D "44cc2fccba1e147ef4c8da0584ce0f24189c8743de0e3e=
9a9226da88ddb5f589"
> -
> -S =3D "${WORKDIR}/xen-${PV}"
> diff --git a/recipes-extended/xen/xen_4.7.0.bb b/recipes-extended/xen/x=
en_4.7.0.bb
> new file mode 100644
> index 0000000..0565596
> --- /dev/null
> +++ b/recipes-extended/xen/xen_4.7.0.bb
> @@ -0,0 +1,10 @@
> +require xen.inc
> +
> +SRC_URI =3D " \
> +    http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz \=

> +    "
> +
> +SRC_URI[md5sum] =3D "3aa4e01bf37a3a5bc8572907cb88e649"
> +SRC_URI[sha256sum] =3D "be5876144d49729572ae06142e0bb93f1c1f2695578141=
eff2931995add24623"
> +
> +S =3D "${WORKDIR}/xen-${PV}"
> diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen=
_git.bb
> index a86a501..391b47e 100644
> --- a/recipes-extended/xen/xen_git.bb
> +++ b/recipes-extended/xen/xen_git.bb
> @@ -1,15 +1,16 @@
>  require xen.inc
> =20
> -SRCREV =3D "1fd615aa0108490ffc558d27627f509183cbfdaf"
> +SRCREV =3D "9a6cc4f5c14b3d7542b7523f88a1b65464733d3a"

If you're going to make the branch variable then I don't think you can
set this since someone setting the branch will find that this revision
isn't necessarily in that branch. Granted this was already broken in a
way due to the ability to change the release.

I'd personally just make this ${AUTOREV} to compensate for that fact.

> =20
> -XEN_REL=3D"4.6"
> +XEN_REL ?=3D "4.7"
> +XEN_BRANCH ?=3D "staging-${XEN_REL}"
> =20
> -PV =3D "${XEN_REL}.0+git${SRCPV}"
> +PV =3D "${XEN_REL}+git${SRCPV}"
> =20
>  S =3D "${WORKDIR}/git"
> =20
>  SRC_URI =3D " \
> -    git://xenbits.xen.org/xen.git;branch=3Dstaging-${XEN_REL} \
> +    git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
>      "
> =20
>  DEFAULT_PREFERENCE =3D "-1"
>=20


--=20
Doug Goldstein


--r34cVSW707uT93Sk02Iss1USUVW9vx8Tf--

--wuxLhFeHD1SFHsWSuKNRtmXgrfLxitVuo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJXcCG3XxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvU3/QP/1SZ6Eo0waYJawj0Kk7R/BVx
3IV0EhdCXdZmfVDUSlGleWseyIDzCGbPt14uxPNwDU3ThKzXNdQAV9Bq1quYe5i/
ZnJrUT3NPhHriXspcsgFNxPW4WcxUB1srkzWko7rRCsBMIfFib7GrzHhi0e3qe7C
7X27DPozuDFrM3VSsZv43Es7ztBh4+EoKBNrDyNjNqUAdap44LVmDXNxj39QTHlp
OtoHdQMIVB3w+7gde8rExZYXvPVK4pmvNLrZ5UdYxsjmzJj1svABYPxkg/6/0ILv
iP8xKUhBXSi5HYgzJsvs9VL/351kDH4A2lS8DJC6nXGKPhtTgnqOXDsLSJuqHyky
Iw9iOQ0f1OyXCns9wk/7NTFuHNfLyAXfXmd8b6jzdSk4RjYPzZv2plpvISEi7qLS
4/xlaDYlHZCnCdf4Au23GW6gjgkgSwheoKrSTz7F70cNFK7Grls+fzxZkFRXSTmR
KAa4JusM1Fun5BB5NnWQjwguqbNp1Amf9VFNCeiAcBGn10Gzxv4DonuOHKgjtZE7
EarpwKf/QsrzIQkT7z+xxYSO57hjDEVIH3f75Oy1uowzpdfXkRqzvdImreQYmzg0
lRfBeKbX49KHxg68Uvxyv2p2xXsw9zzoKGOoLAxowLy4nbjXy4m9zmi10IiuTrYy
bojGKVZUWQNsGXFAJuF2
=jQ2D
-----END PGP SIGNATURE-----

--wuxLhFeHD1SFHsWSuKNRtmXgrfLxitVuo--
