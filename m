Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 357D3FE51EB
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 08:57:11 +0000 (UTC)
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16692.1777021029870571561
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 24 Apr 2026 01:57:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=FwNzMeuk;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=fArihBmi;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.145, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id EAD3EEC0175;
	Fri, 24 Apr 2026 04:57:08 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 24 Apr 2026 04:57:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1777021028; x=1777107428; bh=CW2afnYmnd
	NnJkVswSxIHgckUna6k2FJCBtp1W/DVyQ=; b=FwNzMeuk+hSkSQtBA64hkVZFVY
	xgOpB0B6vxk9KXDUWoWgzX5QIip7/fEjq5IVZ5J0rFfszcih/jpmWY8XAkBZKRBX
	NoS/qjSaGcXztY8E0ZGGsauu7iALN1hyIdUluSW5t6mPp+bsYqCOHAmcFu7Snv6L
	VCmiwfH48jxphC0sWiSfyiD4xWedoxHyh1PUREUQLgfviXX5VYMfODgNP4qMSugb
	dNtDYwQDcCKp2nJuyuAXqlQmFTaORkIfXGbIOYhU6C9g7LBdM/B+y1waIkI1BwaD
	QkkmoWhiLsUv/5eh1F1J4BgO/SKYy978nM9bQPwSoGqn/sLGtlHNftpyc12A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1777021028; x=1777107428; bh=CW2afnYmndNnJkVswSxIHgckUna6k2FJCBt
	p1W/DVyQ=; b=fArihBmiK9hmiLZekavimHRLiYftfztLrMrmazb9yeJ78Rn/cUQ
	wsZh1vXaGj7cONcBSGnhYqFVF3TXBKxBtdjI1/7DJRiGeJ0omdbcYMFQQC0E+Ho8
	DLxhcTaY5hxKkBlhrYArol/t5vqSYRBKXV1nyyhg2ZMYq63ORFTlLjX5FBUYcFLK
	PF+RFmFAr+Ul2K6fnPX9Y5Pr7TNPSs5s7W1vrq7R2drLaYJdb8TV8/nXiszs7Qn9
	Adz3eUMgZ3plrb24fdg3/360c9ePB40OsB0gskEdRYogzGw8l1r0DYE4KX2BAU2q
	SnLOWdrEHc6lIssbMpsu3c9ruCACjSNAPGg==
X-ME-Sender: <xms:ZDDraSuo8x47DlDNfl6wyqVEad8yj5SY0j6Hj0vLFZdvfaDWBzFvVQ>
    <xme:ZDDrae4zSxrEaNYGQbFrcrZ5KBCI_OrM7FMYoQDHlgy9gDuWUlkW2Z9RuiQm_oBlt
    yyfvg1fic6UkQwoAqHzogyYPkbjyKAblaEGvoxtL3ZjMwfJfN9MAdg>
X-ME-Received: <xmr:ZDDrabL4kjotQeLIy6W6TvI3x-0f8FMP_Ix_TOhfsv1GCejyESkaWhnwCxuc96exP6IQLnOtw75xQOhZ0_XDCeyXlQPPqOqN8xyXvOdVcKk_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeileeiudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefkuffhvfevffgjfhgtfgggsehgtderredtreejnecuhfhrohhmpefrrghulhcuuegr
    rhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpe
    evkeehveelgeeuueefhedtkeefvdfggfetueetudetjeffveekteejleeggeegjeenucff
    ohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdhophgvnhgvmhgsvgguuggvug
    drohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepfedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepthhitghothhimhhosehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepmhgvthgrqdhvihhrthhurghlihiirghtihhonheslhhishhtshdrhihotg
    htohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepthhimhdrohhrlhhinhhgsehkohhn
    shhulhhkohdrtghomh
X-ME-Proxy: <xmx:ZDDraW5T5oTtFxbYiNmUEHQAyxCKD9TARqZW6BHNDbwxHMFWG4hXpA>
    <xmx:ZDDraWzVzzywRcjva6vHF2YfLB9IxeCaWehutnDru1e7oIKS43tU_w>
    <xmx:ZDDraSZoXhCNUxSmoNTAgp-6n0i1DJ5GRbVse3-vSGLjCHi2tY4fog>
    <xmx:ZDDraQSGny58V49MPI8_0AJQMBYEJmK0_iM9jfT5BiXvqYq7T14uFQ>
    <xmx:ZDDraeKBo0qNS-fVfPTBrMS4tbfafiJtRulp-WB5cXiS-NC8r50esJle>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Apr 2026 04:57:08 -0400 (EDT)
Message-ID: <db641b6a21142d5ca3960265be985239aa17ec3b.camel@pbarker.dev>
Subject: Re: [meta-virtualization][PATCH] distro/vruntime:
 DISTRO_FEATURES_DEFAULT is obsolete
From: Paul Barker <paul@pbarker.dev>
To: ticotimo@gmail.com, meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Date: Fri, 24 Apr 2026 09:57:02 +0100
In-Reply-To: <20260424042727.75417-1-tim.orling@konsulko.com>
References: <20260424042727.75417-1-tim.orling@konsulko.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-XNa6a6jEQ/CRBJay5Axq"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 24 Apr 2026 08:57:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9741


--=-XNa6a6jEQ/CRBJay5Axq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-04-23 at 21:26 -0700, Tim Orling via lists.yoctoproject.org
wrote:
> Replace with DISTRO_FEATURES_DEFAULTS
>=20
> https://git.openembedded.org/openembedded-core/commit/meta/conf?id=3D0548=
ea447445834647be7ef35ed0ae8d1d3387b3
>=20
> Fixes:
> ERROR: Nothing PROVIDES 'nativesdk-libseccomp' ...
>=20
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  conf/distro/vruntime.conf | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/conf/distro/vruntime.conf b/conf/distro/vruntime.conf
> index 0ea43e62..56c5ad6a 100644
> --- a/conf/distro/vruntime.conf
> +++ b/conf/distro/vruntime.conf
> @@ -46,8 +46,8 @@ DISTRO_FEATURES =3D "acl ext2 ipv4 ipv6 seccomp vfat pc=
i vcontainer vxn"
>  DISTRO_FEATURES_OPTED_OUT =3D "pulseaudio gobject-introspection-data ope=
ngl ptest multiarch wayland vulkan"
> =20
>  # Native and nativesdk classes need full features for build tools
> -DISTRO_FEATURES:class-native =3D "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFA=
ULT_DISTRO_FEATURES}"
> -DISTRO_FEATURES:class-nativesdk =3D "${DISTRO_FEATURES_DEFAULT} ${POKY_D=
EFAULT_DISTRO_FEATURES}"
> +DISTRO_FEATURES:class-native =3D "${DISTRO_FEATURES_DEFAULTS} ${POKY_DEF=
AULT_DISTRO_FEATURES}"
> +DISTRO_FEATURES:class-nativesdk =3D "${DISTRO_FEATURES_DEFAULTS} ${POKY_=
DEFAULT_DISTRO_FEATURES}"
> =20
>  # Default to ext4, but image recipes may override to squashfs
>  IMAGE_FSTYPES =3D "ext4"

Hi Tim,

This is the wrong approach as it bypasses the default feature filtering.
Instead, just drop DISTRO_FEATURES_DEFAULT, the defaults are appended
automatically after filtering for opt-outs.

See the corresponding change in poky [1] for an example.

[1]: https://git.yoctoproject.org/meta-yocto/commit/?id=3D96085aaec5bfb33c4=
e4322465eaf0af370db6fc0

Best regards,

--=20
Paul Barker


--=-XNa6a6jEQ/CRBJay5Axq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaeswXhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0biD7AP9qCtb78FJwyFfE/6oBzo3pLO5Cq+2sUbsI
mQpyHXIYkAD7B5w2rgNwxYeT43Cl41asgilT0NWKrecA8C0G7M7mqAI=
=1yBH
-----END PGP SIGNATURE-----

--=-XNa6a6jEQ/CRBJay5Axq--

