Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4FE0CD6E4A
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:02:03 +0000 (UTC)
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21407.1780394522475797607
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 02 Jun 2026 03:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=z36HYkNR;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=ZIPuiFaH;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.147, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 7325DEC01B5;
	Tue,  2 Jun 2026 06:02:01 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 02 Jun 2026 06:02:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1780394521; x=1780480921; bh=N+1AmGmIJJ
	AUeDSF1HsqXUGV7ZOgRLhQaB/tbiAInsg=; b=z36HYkNRnbfJTeTOozGOx/3WJi
	zavEGHREo3Ki+AtFU3Mwy6W3n9UViHnUVSX+y0EYy3Esc8dCYfZAT9hK6/criQ9V
	BwXg9mq3D8yXafOlKSq8SGZngBVPCLI5IeocZojEEF1R6bULpuXol5cC08k8rC/5
	IIn+p3Dq4jxoG0krjWzCvJmspgSkYrgkimQjJzaZhZWddTgyQRxvm9FVc3a6F9Ul
	QyuBadbA61m12LHMdCFhl5nH/G91ZtreQJUb0tA3Me6HZzW/KuHJKa7S45SyDDXL
	vlHppQy7QVEJs/uaR4SYfm0iumpr4PoU2G0D8uvRzrxD6XMclQI91C9528UQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1780394521; x=1780480921; bh=N+1AmGmIJJAUeDSF1HsqXUGV7ZOgRLhQaB/
	tbiAInsg=; b=ZIPuiFaH7x7aVj6iyQhLwJI54iJDEbv9mo4QWrC7JsRiWAc9e+/
	OXY8HuASECVohRDWh9j9cHn82Ntw7R9Uit5F2GclPTPjrrzSPHBHyl7zZtm1IAM9
	nC/RGIZelIsdR9cZCjAr7tMU00wX5M9V25g0UfjzLTBwt1rVMe3Aequ1r+y2Ypdy
	8ZcNEZAGvINAvs6IOrrwpfyPKweg8CF4eVGYJqGvgLKgBWw7Gj93DiTSrR5LYbZn
	c9e/rckgoLktgaZ6GPqOsmvycRkJOFzTEqj6LGQn7C35vm0mfydVQH1EWdtRsxoU
	DA6d9XTeijlwoOlrEXpHNJ40TQ0Ju9mzXQA==
X-ME-Sender: <xms:Gaoeav3eGQOT6W3c7j19iUW_Mp5nUuvdd24IbLZY6mG05KlnfQO_tA>
    <xme:GaoeakHfKmDXLs2evP_eEX-xdMvUdZg77GMrxDym13zeXP8jdPyWcAWE4qANq-lzH
    qmMK191mJnAU93msSvfT_XppFcBNFd1GQXTKvKMhO1XVmzxtyW9sFo>
X-ME-Received: <xmr:GaoeathqCtluUg7BbkdQTpmv5YecqOlhlReA9EwApvL4PAIvfolVM9jgnjGuZ1pQSAAQJRTUO0rE3pwxPEmzEeeSDKdCNx3XMsG_WgrVtnaoGI21L_BHXP0NvNNhv7Wr>
X-ME-Proxy-Cause: dmFkZTGpEPehwGETNmZlY5emloX3sbfpm7sJDFau3RqUBHfCxQDq5Hs3L3tg/JjTK37DpR
    RyMHrcOE/8AuCGoe2JASjsI81bPhCZWPEzoitFxUZirUr5HEit5muH+jl8JfbsP03aIlfo
    O68/cNf1A33O9qbjNI2NMqa/O/eqc8xWlg1LIJO532dhAl0GBtr5ENmxje9WC2thsNgC+d
    Mhik4qRo8bVKUlwvVkkdV+RAToFaLuh2wC6qGi35WV4MsLG1XyrP7nYLtJoOKZFjeBuveR
    031pvYwCSOsHLj2lWZDgP2vCY7/YD7z+RppKHTCYs392RyOYQFmd0w81aqCbuVZu3HOMUB
    uAjVRqc3CN8XEVndubkHybcvCc4nWE0o/qZXpUJy+ulv1qo+rI0Psuk0yQ2atu0Epy+OEn
    xHdPhV3F24WyDdEvDvnDqa5EB4Y27cqLkZtAwbn1rff5++JNPYBhAYdBqw1LSETtJlltvO
    j/vx9bh1DznCJ4pvSjsXNaADDVZQ1fWPqyvONiDHxQPenVMF+PZbaNoLYALqzKBvoAMzrX
    CoSnjFStK93pPwLjYX7rayld3J2Ot0toJ+bO3fzW3bVHX/UgKuwcvgp5uO8Yod27Wg0HrR
    tuvIN6kzRi24kD4DGZtrnQ6ftqejGN6MCIYSZD7UNVZs9OqrMQtUUuRqWbtA
X-ME-Proxy: <xmx:Gaoeav_WZ7wV5VX8Yza75R3OS9jB9h4D8tyIwhE9nR1wtJJwA5qoVw>
    <xmx:GaoeakoiOsJifiHVcGlnbkRk_Me9JG0tglx2H67PMPPwR6HpMw_cgA>
    <xmx:Gaoeau8AX1NYabtU2I6zMzilLiPgKEv1LrWInSfkRM6WyrN7PrE5Vw>
    <xmx:GaoeaoXSMtRfkikNOZl5yE5MJP9PlhJOmMmwp2VIle4_2OS8Sq254g>
    <xmx:GaoeahFY9oaLLTTApZ5wQCb0tWEQdQh5TG0_z8mGA-418mBJwmFn2qQf>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Jun 2026 06:02:00 -0400 (EDT)
Message-ID: <cebff4c1c3da56add582976276b3c66d65465047.camel@pbarker.dev>
Subject: Re: [meta-virtualization][PATCH 2/7] recipes-containers/images: add
 app-container-python
From: Paul Barker <paul@pbarker.dev>
To: ticotimo@gmail.com, meta-virtualization@lists.yoctoproject.org
Date: Tue, 02 Jun 2026 11:01:58 +0100
In-Reply-To: <2c612245431bf2ebcfe9c4f188be1e27117cc0db.1780104071.git.tim.orling@konsulko.com>
References: <cover.1780104071.git.tim.orling@konsulko.com>
	 <2c612245431bf2ebcfe9c4f188be1e27117cc0db.1780104071.git.tim.orling@konsulko.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-M4lMY5It3YWUqB34Ir7T"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 02 Jun 2026 10:02:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9842


--=-M4lMY5It3YWUqB34Ir7T
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-05-29 at 18:31 -0700, Tim Orling via lists.yoctoproject.org
wrote:
> Add OCI container image recipe for Python to use as a base for
> other Python app containers. The image uses multi-layer mode with
> separate base, terminal and python layers.
>=20
> Add ncurses-terminfo-base to a "terminal" layer to avoid warnings in the
> REPL:
>   "Cannot read termcap database;
>   using dumb terminal settings."
>=20
> Add coreutils to "python" layer to provide /usr/bin/env needed by
> python3-idle in python3-modules.
>=20
> Inherit container-nonroot-user and run a `nonroot` user by default.
> Set PACKAGECONFIG:pn-app-container-python =3D "dev" in local.conf or
> distro/image config to run as 'root' and include 'pip'.
>=20
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
>  .../images/app-container-python.bb            | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 recipes-containers/images/app-container-python.bb
>=20
> diff --git a/recipes-containers/images/app-container-python.bb b/recipes-=
containers/images/app-container-python.bb
> new file mode 100644
> index 00000000..a93f1b0f
> --- /dev/null
> +++ b/recipes-containers/images/app-container-python.bb
> @@ -0,0 +1,57 @@
> +SUMMARY =3D "Base python3 container image"
> +DESCRIPTION =3D "OCI container image running Python with non-root user. =
\
> +\
> +In "dev" mode, can optionally run as 'root' and add 'pip' to allow \
> +developers to simply run 'pip install' on top of this container (Not \
> +advised for production/hardened use)."
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
> +
> +# Multi-layer mode: create explicit layers instead of single rootfs laye=
r
> +OCI_LAYER_MODE =3D "multi"
> +
> +# Optional 'dev' mode:
> +#   - adds python3-pip to the python layer (enables `pip install` at run=
time)
> +#   - runs the container as root (UID 0) so pip can write to site-packag=
es
> +# Enable with: PACKAGECONFIG:pn-app-container-python =3D "dev"
> +PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG[dev] =3D ""
> +
> +# Define layers: each layer contains specific packages
> +# Format: "name:type:content" where content uses + as delimiter for mult=
iple items
> +OCI_LAYERS =3D "\
> +    base:packages:base-files+base-passwd+netbase \

Hi Tim,

I wonder if we should define the base layer contents in image-oci to
ensure that it is consistent across recipes.

E.g. in image-oci.bbclass:

    OCI_BASE_LAYER =3D "base:packages:base-files+base-passwd+netbase"

Then in the recipe:

    OCI_LAYERS =3D "\
        ${OCI_BASE_LAYER} \
        ...
    "

That gives consistency without forcing all OCI images to use the base
layer definition if it isn't relevant to them.

> +    terminal:packages:ncurses-terminfo-base \
> +    python:packages:python3+coreutils${@bb.utils.contains('PACKAGECONFIG=
', 'dev', '+python3-pip', '', d)} \
> +"
> +
> +# In 'dev' mode, override the nonroot UID inherited from container-nonro=
ot-user
> +# so the container runs as root (required for `pip install`).
> +OCI_IMAGE_RUNTIME_UID =3D "${@bb.utils.contains('PACKAGECONFIG', 'dev', =
'0', '${NONROOT_UID}', d)}"
> +
> +# Use CMD so `docker run image /bin/sh` works as expected
> +OCI_IMAGE_CMD =3D "python3"
> +
> +IMAGE_FSTYPES =3D "container oci"
> +inherit image
> +inherit image-oci
> +inherit container-nonroot-user
> +
> +IMAGE_FEATURES =3D ""
> +IMAGE_LINGUAS =3D ""
> +NO_RECOMMENDATIONS =3D "1"
> +
> +# IMAGE_INSTALL triggers package builds via do_rootfs recrdeptask.
> +# Even for multi-layer mode, list packages here to ensure they're built.
> +# The PM will install them directly to layers from DEPLOY_DIR_IPK.
> +# Note: IMAGE_ROOTFS is still created but ignored for packages layers.
> +IMAGE_INSTALL =3D "base-files base-passwd netbase"

Maybe we also need an OCI_BASE_PACKAGES to go with OCI_BASE_LAYER.
Pretty much every image is going to need these three packages installed.

> +IMAGE_INSTALL +=3D "ncurses-terminfo-base"
> +IMAGE_INSTALL +=3D "python3 coreutils"
> +IMAGE_INSTALL +=3D "${@bb.utils.contains('PACKAGECONFIG', 'dev', 'python=
3-pip', '', d)}"
> +
> +# Allow build with or without a specific kernel
> +IMAGE_CONTAINER_NO_DUMMY =3D "1"
> +
> +# Note: No ROOTFS_POSTPROCESS_COMMAND needed - IMAGE_ROOTFS is empty
> +# and PM handles installation directly to OCI layers

Best regards,

--=20
Paul Barker


--=-M4lMY5It3YWUqB34Ir7T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCah6qFhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0blT0AP9ZHcC31hidP0DT4HtGQ7hU1MsHC3m0H7bb
x4V6bcyplQD+NHrRq29CQcN87NbHStZJ63UB+bfXUg/2FGbK9+DkpAo=
=VveH
-----END PGP SIGNATURE-----

--=-M4lMY5It3YWUqB34Ir7T--

