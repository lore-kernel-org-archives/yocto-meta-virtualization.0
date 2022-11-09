Return-Path: <g.meyer@signum-media.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1031BC433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 11:06:00 +0000 (UTC)
Received: from srv.signum-media.de (srv.signum-media.de [159.69.219.184])
 by mx.groups.io with SMTP id smtpd.web12.1940.1667991949958135765
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 09 Nov 2022 03:05:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@signum-media.de header.s=20221012 header.b=KyTUeJo5;
 spf=pass (domain: signum-media.de, ip: 159.69.219.184, mailfrom: g.meyer@signum-media.de)
Received: from serenity.localnet (i59F7C766.versanet.de [89.247.199.102])
	by srv.signum-media.de (Postfix) with ESMTPSA id 7097E1F4D0
	for <meta-virtualization@lists.yoctoproject.org>; Wed,  9 Nov 2022 12:05:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 srv.signum-media.de 7097E1F4D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=signum-media.de;
	s=20221012; t=1667991947;
	bh=EcLSXsJa+XjYY/6xTuZTOGuL9gYUAAZO9ZSq2U1dx50=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KyTUeJo5IxKfuprCvVz/vi2p67Hm+F/z27OksE/jTd+FBT3bb7T1/M+hCG1i6Lbry
	 A5Clvil8jrtvwqmUQL780WiYy9az9GwREYb4ttGlvXaJtzwk5+/6Q8+fCo5nO7Tb1w
	 umVfEgehgkAGe3iJImXMDkhgd06oRtEUEq2eNdWf48CcMWRBP35kJRukj5z6bDb04U
	 9dkgmlctkvP8TwkdH1yHd/4V8UlaRRvq/LEl+FKF3DaA2XZTD6YoYXG7WT2hVszRRn
	 6JH12t+1TxBfFJi7DdgsDcko0sj9Z4cJcDixmLW1ldGmmM3PLm2HTkvjPrCGIKtnL7
	 O3mfLZRF/D5vQ==
From: Guenther Meyer <g.meyer@signum-media.de>
To: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] Problems building an OCI container image
Date: Wed, 09 Nov 2022 12:05:46 +0100
Message-ID: <3841288.YgC1jYaZfg@serenity>
Organization: Signum Media
In-Reply-To: <CADkTA4NDNN=gkkCz0DG1VMHSq_S_1su3jEUa1oYcWDM79PDGkQ@mail.gmail.com>
References: <2422477.irdbgypaU6@serenity> <CADkTA4NDNN=gkkCz0DG1VMHSq_S_1su3jEUa1oYcWDM79PDGkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3398043.h1zkN1R2NQ"; micalg="pgp-sha256"; protocol="application/pgp-signature"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 09 Nov 2022 11:06:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7679

--nextPart3398043.h1zkN1R2NQ
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Guenther Meyer <g.meyer@signum-media.de>
To: meta-virtualization@lists.yoctoproject.org
Date: Wed, 09 Nov 2022 12:05:46 +0100
Message-ID: <3841288.YgC1jYaZfg@serenity>
Organization: Signum Media
Disposition-Notification-To: Guenther Meyer <g.meyer@signum-media.de>
MIME-Version: 1.0

On Dienstag, 8. November 2022 17:37:18 CET Bruce Ashfield wrote:
> On Tue, Nov 8, 2022 at 10:45 AM Guenther Meyer <g.meyer@signum-media.de> 
wrote:
> I recently tweaked the container image backends to make an additional
> symlink, you can see those on the master-next branch of meta-virt.

That's exactly what I need.  Would it be possible to backport that to 
kirkstone?


> > The second issue is the resulting tar-file. I thought, I could directly
> > load it as an image, but that results in an error.
> > Investigating the content of the archive, I found, that the necessary
> > content like index.json, oci-layout ad blob/* is not on the root level
> > but inside a subfolder
> > "example-container-qemux86-64-20221108152401.rootfs-oci/".
> > 
> > Is that intentional, if yes, why?
> > Because when I create an archive with the same files on the root level, it
> > can directly be used with podman or other tools.
> 
> This has been discussed on the list before, it is intentional. The tar file
> was created to make handling the images a bit easier (since when i did the
> work, the oci image class was just specifying directories). There are
> workflows and use-cases that expect that format. I promised to think about
> how to handle and support both use cases, and I haven't come up with an
> answer yet.
> 
> I'll get to that shortly (fingers crossed).
> 
> The primary use case for the oci images is that they are expected to be
> manipulated with something with skopeo and copied/transformed in that
> sort of workflow.

That's interesting, what are those workflows and use cases? I guess, skopeo 
should be able to handle the image also without the subfolder, because that's 
what the oci specs says - at least as I understand it.

I see two main use cases here: The one is to load the image directly into a 
container runtime, the other would be to push it to a registry.

Don't get me wrong, I could easily create my own tar from the image folder.
But I would expect, that a generated tar image could be used directly without 
any additional handling.
Loading the tar directly with tools like podman or ctr works, when the 
expected file structure is at the root of the tar file, but not when there is an 
additional directory.


> > If I want to use a predeployed image with k3s, what is the name of the
> > image that I have to use in the deployment yaml? Is it just the filename
> > or is it something else? If the latter, how do I set the image name
> > during the build?
> I've never done something predeployed (or at least what I think of in that
> sense), but you can find a very simple example of a yaml file that I did for
> a ELC presentation in the meta-virt layer itself
> (recipes-demo/helloworld-flask/helloworld-flask)

Thanks, I will have a look.


--nextPart3398043.h1zkN1R2NQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMriC4l7RumrDsZEievmd2d8CKRIFAmNriYoACgkQevmd2d8C
KRJZwhAAsH4efctTzZPAfUuKc6Q1pOiYAL3vHlDr9EvoJFxajF0LLgvVplm3ve5S
3pJiviOVet8im2fWJWaEayiV28rCON8CQzQM6grNG+C+0LjaN2raazP3DomR1UYw
uWRrHTd0Of0Y5c4dzCXwQ23ZzdhGHchvnt2VgxAIKSwS6dyVcP7sQ2OaJp6aZMll
GMLi/0Ad7rg8mKtgPOmv/2JiCDbUb6VBcP09OY2N42/pox69uOa7YaTtnPNtS8hl
JyT3emuHq4FX3G+jataV1c2bEBnPQAzekaN/1Fi/EeQvHVbeCFHcRAll9iD+wGMU
Gm9U7PFtc8IaErYrrMB7T7UN1Lu1KWpmY0iempicKgcA4d19D/wRm52GP/4QdRRC
z6cv0WcR60uw56Rf5bCPVJB7QsNvxEuXzDtkSHVP3ZjQNNIwsn8DCTiuXdTXjcXd
3py+/Ldt6N6uH+9PtwDPGbKLbLOk/XJBOLQNh0eKheAYTf99GzQ3WmgmNQpK7xem
XCAUjXuXQWIoHsc5dQNXDXlWKr21OoPiyURtvUru/cuQSc2VM9RyQo/HI7QO53sv
tdDfd3i4jXJDSUAYd0HAnr2mWQ5VphztWhHbk2ozlzu7NvFAHR1tkZXFpyofq/LD
KqQ4a0HAZYn3sF1KfO0IJqTl2350C/5W9RRxoJEfgfw3gpm25j8=
=2GSg
-----END PGP SIGNATURE-----

--nextPart3398043.h1zkN1R2NQ--




