Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B8139E0090C; Wed, 10 Feb 2016 11:35:57 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.161.171 listed in list.dnswl.org]
Received: from mail-yw0-f171.google.com (mail-yw0-f171.google.com
	[209.85.161.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8B46CE008E1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 10 Feb 2016 11:35:53 -0800 (PST)
Received: by mail-yw0-f171.google.com with SMTP id g127so22572095ywf.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 10 Feb 2016 11:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type;
	bh=3W7TcDTyqDgMB/kweOiJX6fniL4AN8YFOWp0YiO2+IE=;
	b=invH+UepH1SoDJf6eUtHHqUiZFnMeVOGJ28ho5XI9OR9TYFXj/NfQCG55WOB2QLPYv
	x1yyaE1rYr6hURXdecr3yYm5XztE9tctxXcYbDsedHVupvuzW+wOTG+K6obiqcwAwwqL
	TOS/Ljvfa84OZMi90t90t/xpYTBD+jLBM0skg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type;
	bh=3W7TcDTyqDgMB/kweOiJX6fniL4AN8YFOWp0YiO2+IE=;
	b=QTYn/fUBwqS24tFTJI6H3YC7HtHHxfFyaS++r3P8tAy75NmVIUL4bg8SX3uV2AaDz1
	sv6pmjyadVtFifI1NRwtS04zO7wXH4+vcPUSrGAP7MLJFHyvTMYhtgQ9NFeVGGrcmCOM
	xIXMxoCcyUlKPUrIhEdvekTH+R5ZjkmingDL1cPspXtcLQNQ//moEPXl9/WL4iBkjsvH
	BlB/Cs6KsOk4UvGWXf6A4P08XNT4FMjoeReWeg36wyC+E+NIGxxgxNpkJYBIMOTVgKw6
	af9sq8l9v3A0TuR04CCQ3oBv58uzBLJiRkSaktCriSyM7mLgOikbGR7QzuUvlHBKQ6RF
	kXAA==
X-Gm-Message-State: AG10YORZAT09Eqv2mZHbR/mC3CoBUbCldC/2UYX6BJkumcqNWAX/CfOcm16DrpT5mB+r+Q==
X-Received: by 10.129.82.15 with SMTP id g15mr2182696ywb.344.1455132953156;
	Wed, 10 Feb 2016 11:35:53 -0800 (PST)
Received: from doug-macbook.local (c-68-34-224-206.hsd1.al.comcast.net.
	[68.34.224.206]) by smtp.googlemail.com with ESMTPSA id
	l140sm3674043ywe.21.2016.02.10.11.35.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 10 Feb 2016 11:35:51 -0800 (PST)
To: "M. Gregory" <mbgrego@tycho.nsa.gov>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
References: <56BB4783.5030902@tycho.nsa.gov>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <56BB9111.1020302@cardoe.com>
Date: Wed, 10 Feb 2016 13:35:45 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <56BB4783.5030902@tycho.nsa.gov>
Subject: Re: xen stubdom support
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
X-List-Received-Date: Wed, 10 Feb 2016 19:35:57 -0000
X-Groupsio-MsgNum: 1806
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="O1CCMIgHBmeIae6tcRwENwSLDBeEFASSw"

--O1CCMIgHBmeIae6tcRwENwSLDBeEFASSw
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 2/10/16 8:21 AM, M. Gregory wrote:
> Is there a technical reason that stubdom support is disabled in the xen=

> recipes?
> -Machon
>=20

It performs a fetch of different components during the build process and
can't be put in the SRC_URI.

--=20
Doug Goldstein


--O1CCMIgHBmeIae6tcRwENwSLDBeEFASSw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJWu5EUXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUBeYP/iFHerLGKmSIqo+BjfI035ul
Yrz1ey4oTqdrjTkV/nHEiUh2hvcfdcxm8yTxeUOTp69U9VFUk8Foxb0/Mvvt3VFm
73XEja1Nc0UGSR+9/fLolXOYAyKWWtHk6Ta17ybSyubyGYdtbkk5TWMZC4UczeMq
ZPiZxKK/j9Bln6A5zAL0B7KV2eO9B48GE9JPEfu5B4jhUunAxAVbfn2/FbOUMlOE
Xsk7avMLAw3GEp1VQZq3hgYYPUnT/4f+TrZmDz3kXdnY60zI6uQLAaW4i7M76bmh
Dcogxtb7P89IZ/BPFCy1N+DRw5rUQuL8224eExOZdsX7rpsL8H/ZIy92ePrYkOoI
ATnHSv1g7U4mY9VpC1Ofcmbmp/+jI6N/Eg8KaiKELgTCdvX7mGaWbSdLmUuM9exI
7kYkd24wyqQ6flTBJdcuB7N82vE9ebL+79EgLDkOzEAU63oK4J65/eEMk3ia0G4e
/dM2SgHwFVaDQt36wxgcicRzD+fu8Y5Da9vCe9pxOwytJ84V3HrYZ1br2dwL5uMC
M2AZ9yaThacUKc3gb3UqFye1lHMKw913DeycT/8AWn6A583MtgiPyRQZoLK57vbO
Yjy7W0t0p5QpcVhaOGND/JNOZBwBCFv1jYdIrfbnubHcVOffh7TzBxpI03/Q3xSg
CbpqJpR1mT0JRe04Cm7L
=iXeI
-----END PGP SIGNATURE-----

--O1CCMIgHBmeIae6tcRwENwSLDBeEFASSw--
