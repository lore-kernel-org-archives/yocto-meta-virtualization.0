Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D9E3AE00C4B; Tue, 22 Dec 2015 06:40:38 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.179 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f179.google.com (mail-yk0-f179.google.com
	[209.85.160.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B056BE0082E
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Dec 2015 06:40:33 -0800 (PST)
Received: by mail-yk0-f179.google.com with SMTP id p130so165413218yka.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Dec 2015 06:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type;
	bh=DkuZh3ln532z+asr4RQzRk+BI04As8cIbGpPbC+Ohug=;
	b=Fm2lXT7LG1EIFfKy+KEjRN1IVqCAkixAaYCoMOnzcxrMrqtXJBizbLJFK8Y4F4CcgO
	v8nzhm9XQimVmzxollfC4vMKcxuF4MG13TUoOiAP9jeR2a6XKe+cEtUIoFPeBJ4dacTt
	TFQrySlMKlNfb9oBDPB4uePsrF2q2ZcmvhM5q30vdeWJ1sNdwJMeCsisjL1zFU7GyXd+
	NRlUZpkdiQkOwXr9u8zb+CBE724vIB2bq9I00+Fhjvt61LpWwREVIObdg8J40w2g12GI
	MFjBtvSJkzl0Aw+RKn4MUg/5xVbX0MHZ23nwMlX5Wrt0FH9cPOni4yGBfIIrrL37320m
	CY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type;
	bh=DkuZh3ln532z+asr4RQzRk+BI04As8cIbGpPbC+Ohug=;
	b=GWFi/RrBYsfoQxgkywcj/DQ1lEvSwQPVwfYauGDFJBZmcVMcHhImBJ2IqPf55MhUo9
	zRqzVqvUuzywODp+0KoDRzsHD4VSqEa6bVHhSqn61YU+aJEf8yyyie9fplPe0H6juEAA
	7/6eW5YWHIuDRSQVK1uv+z0Bs+IHzeXDnbs9Ugh5BYW0UIPjfclnh9B7aEMRBaDzK0kG
	vonqqdVpBXEtBavu1qs9OmxQOtJ+dyAkRYelvqFSL+su+kxleLFHhWXvKL80edfU/lwl
	aw0hN19nOQ+a/pk0m1oEI2RtHob/RAr7BrQcQAvgnTi7NI9457KYt+lacDUAc/sGWXDi
	jlcQ==
X-Gm-Message-State: ALoCoQn/xL2MftFtTymZ8HcctIwl+xfPJZrYcH0vNFwpAddxVop45bUUam7CeIrU2TBqb2PvspUaWf/F/3Py1wXwZuUgaH4l8w==
X-Received: by 10.13.232.87 with SMTP id r84mr21362895ywe.67.1450795232797;
	Tue, 22 Dec 2015 06:40:32 -0800 (PST)
Received: from doug-macbook.lan (c-68-34-224-206.hsd1.al.comcast.net.
	[68.34.224.206]) by smtp.googlemail.com with ESMTPSA id
	t189sm32950050ywd.43.2015.12.22.06.40.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Dec 2015 06:40:32 -0800 (PST)
To: "M. Gregory" <mbgrego@tycho.nsa.gov>, meta-virtualization@yoctoproject.org
References: <1450285722-14530-1-git-send-email-mbgrego@tycho.nsa.gov>
	<1450285722-14530-2-git-send-email-mbgrego@tycho.nsa.gov>
	<5678E38F.3030609@cardoe.com> <56794133.5010805@tycho.nsa.gov>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <567960DC.6060203@cardoe.com>
Date: Tue, 22 Dec 2015 08:40:28 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <56794133.5010805@tycho.nsa.gov>
Subject: Re: [V2 Patch 2/2] Enables XSM functionality in builds that contain "xsm" in the PACKAGECONFIG.
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
X-List-Received-Date: Tue, 22 Dec 2015 14:40:38 -0000
X-Groupsio-MsgNum: 1610
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="goSk9vxQ7lBTgKmV7IAdGmG6hi9E7uLen"

--goSk9vxQ7lBTgKmV7IAdGmG6hi9E7uLen
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 12/22/15 6:25 AM, M. Gregory wrote:
> I believe this patch will still be needed. Your patch to Xen just
> enables the flask utilities to be built. The XSM framework and policy
> loading code will still need to be compiled.
>=20
> -Machon

I've moved the build options into Kconfig, so the patch will have to be
different. I'm waiting on Daniel's ACK on the patch you mentioned before
posting the follow on.

--=20
Doug Goldstein


--goSk9vxQ7lBTgKmV7IAdGmG6hi9E7uLen
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJWeWDfXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUHLcP/0Kw1UuYyqLdCSc6UWwAYu6l
5TW+NrKTOUUxUFnRfcrj3OmLCwL4LxH+bUKVPUqEmKFkR1I0d8N+974vyfbIUlAJ
3z8Qc/dNb2zS49CyZdaIOIvxWRL2qqQaxIJ7LIAiIxXIP3NcoNbp6NlxWfcAIc/7
LXU0GunFMFSLlBLxkSYPV58bZzpAv6RoSoauMQmbILkkRRdodFXl2sjaUUFZAjiL
fXbj6K8v1kPiBZzooAoloYbEcpLsltaeg0Zh2BzYbu9z/muFHv5/7Km8EdUZS6M8
/OwdO06g4PJ3nTM+FWyG5EGdzN2DzsJg21dwQRcrfyKs9PjBQGMMNeqs2gpr2+41
xyLUo0sjIOetoWqNn69V7lpklW8J8lXo60z8lq643NY+wwWtR6rTYHPAX4sB1Nk0
48klhq+hv9WaneBV/1VzbbV68IYyLJmyA67cCBYRCmeB/W+4UdoErVr+WBzSg/os
p6b4X51Uj6I/VmWXYtql0o4BTUSu0g0P7q1jMprvhOTX+bRCqgvOmkxNHo97cVp+
qamVjaFEwQ0GdKicrFg4bTWmHlIhSLBXFtAOLa1p1o78UYCekHZrzoJRaI6odELC
bp/cXLaG7+zgjS70mkcVJ0oEYwiq8M0NccMDxMNvHLh+lc4+xkQ7vCW1F9xXwu9n
fGqw8nlboqAg0TkMy9NR
=vCdI
-----END PGP SIGNATURE-----

--goSk9vxQ7lBTgKmV7IAdGmG6hi9E7uLen--
