Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BAE81E00A64; Thu,  5 Jan 2017 08:41:04 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW,
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.214.45 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.214.45 listed in dnsbl.sorbs.net]
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8EB29E0052B
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Jan 2017 08:41:03 -0800 (PST)
Received: by mail-it0-f45.google.com with SMTP id c20so96712656itb.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 05 Jan 2017 08:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=68yvQAtxJ3XHNfMFy3gPZpbEw0iPHuIMffoWw9wvXnw=;
	b=cNmv4xS3wYXCHiFLQ7svK5hdA5QNMBcTU1teagWfhkBophwIqQLflZsKP9b7NdIu3Z
	WBeUMErUwyInDJuDWn+IDa2573LLKXE0EP3Zgwh38LX8Zz+68BYKdbc9ElbGAL7rEiZt
	LAPokjFZkyq7xlkoz/3tU19vgRS0oRqpXKB0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=68yvQAtxJ3XHNfMFy3gPZpbEw0iPHuIMffoWw9wvXnw=;
	b=eWBLBAvQQqcEvz7SG5ipfjg415YCQBOUStGDkjv1e6liknmGJhOsORUmiUmL4NZwDA
	MTDvGXlF/isYJ2ifjK3hB1qPFg6QvIB8XAui0eKHhYKCYQKEX+yWHSzH27haZINvN3S4
	vGtxovB2VV5BJHwQczRY8V4sot7SGFOL5iw+CwLaWE311lRtPzhx0+Ls0FpqhIPQsE+n
	FCxNt5+2QVVo/BSwIOp1VDG1YJ1sH6xS3Fvc0TyaYVPksOr+ppmMUQWP99WgOuQQVYjJ
	IDVnwHpXSSJpppjG6c9h1qfsMCjFbwwPcaObvPBB19ETOMjV/3b5z6tg4x0KPptZNV6D
	tKoA==
X-Gm-Message-State: AIkVDXKeCEMgOHNGXnp+KpN88NpVRiim+P6OUj42GdklZM2AyXyTd1qe/tVIzk1kT6GS7Q==
X-Received: by 10.36.87.203 with SMTP id u194mr61656592ita.100.1483634462601; 
	Thu, 05 Jan 2017 08:41:02 -0800 (PST)
Received: from doug-macbook.hsv.starlab.io
	(c-68-32-173-93.hsd1.al.comcast.net. [68.32.173.93])
	by smtp.googlemail.com with ESMTPSA id
	i187sm817781ioi.31.2017.01.05.08.41.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jan 2017 08:41:01 -0800 (PST)
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20170103044754.15012-1-cardoe@cardoe.com>
	<CADkTA4Oc0BCLmhAw7vFLspt4eMN-BAeCEv8ij0cmDuEAUDSUVg@mail.gmail.com>
	<e0ad95d4-a453-d6c1-7ee2-d1fdc7c23072@cardoe.com>
	<CADkTA4MD+oLkJ_5-O9e9uBazXBM_g0G3Exb2Uz8+2vEPTA_N=A@mail.gmail.com>
	<CADkTA4Puo1bP8ENg9SsVQEXV76kasr4OLJ5hYy3Uz+HFpnc0EQ@mail.gmail.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <ea445771-cb42-29ab-77cd-27c1e9978256@cardoe.com>
Date: Thu, 5 Jan 2017 10:40:58 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4Puo1bP8ENg9SsVQEXV76kasr4OLJ5hYy3Uz+HFpnc0EQ@mail.gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-virtualization (krogoth)][PATCH 1/5] xen: switch to updated download URL
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
X-List-Received-Date: Thu, 05 Jan 2017 16:41:04 -0000
X-Groupsio-MsgNum: 2250
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="Qk02oHwa9WL8S0NwNQuKTcmTaKRmPGMK5"

--Qk02oHwa9WL8S0NwNQuKTcmTaKRmPGMK5
Content-Type: multipart/mixed; boundary="TXvtFpSL3TE1lS7TIo9cHnJVMhewbBqsG";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
 <meta-virtualization@yoctoproject.org>
Message-ID: <ea445771-cb42-29ab-77cd-27c1e9978256@cardoe.com>
Subject: Re: [meta-virtualization] [meta-virtualization (krogoth)][PATCH 1/5]
 xen: switch to updated download URL
References: <20170103044754.15012-1-cardoe@cardoe.com>
 <CADkTA4Oc0BCLmhAw7vFLspt4eMN-BAeCEv8ij0cmDuEAUDSUVg@mail.gmail.com>
 <e0ad95d4-a453-d6c1-7ee2-d1fdc7c23072@cardoe.com>
 <CADkTA4MD+oLkJ_5-O9e9uBazXBM_g0G3Exb2Uz8+2vEPTA_N=A@mail.gmail.com>
 <CADkTA4Puo1bP8ENg9SsVQEXV76kasr4OLJ5hYy3Uz+HFpnc0EQ@mail.gmail.com>
In-Reply-To: <CADkTA4Puo1bP8ENg9SsVQEXV76kasr4OLJ5hYy3Uz+HFpnc0EQ@mail.gmail.com>

--TXvtFpSL3TE1lS7TIo9cHnJVMhewbBqsG
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 1/4/17 9:34 PM, Bruce Ashfield wrote:
> All the xen patches should now be merged. Let me know if I managed to
> muck up the branches.
>=20

Looks good Bruce. Thanks!

--=20
Doug Goldstein


--TXvtFpSL3TE1lS7TIo9cHnJVMhewbBqsG--

--Qk02oHwa9WL8S0NwNQuKTcmTaKRmPGMK5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJYbncdXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUIZ4P/3qLPH+0pQhTfvWVtcA0Tolu
tKsAMDslpbAIj2e4EcoU5T5FVQ5yEt4iDmjd+pdPC15c/OCixULid1dE3O3ZOzPd
pC8HIdMwqrd9Y4e5yabY1MvVpQz/VWWt5XLZd+23Rsd0UvB0F2UmG9VDDaaPGN7Y
42AI4ZC0v8JGUrw8L/ZtB9e8mJGjnDS3Y7c4xHF9Xl0UXXhkcplmUhA3GDuTicxI
FpQWhDEPR790ag2P3Cd2q3gK4t75cGaC2cfde2vj9orxxj1uQRNeY2RMCc1kjJ6h
SIGj0FZggFzPay36T5jKagetkguxXs6D+4Th3m8g3Bu331dE0n7kHycB12sT/znp
HDdOUNWHkDVMzs8o1830RMQKhEbmR7j1p57vIK6diraAmENDU+g3ikxBBIuVUsvI
sinlizWgUpiugZCpvtDEpZIK7eL7C1Ewatlmudzcjyr8Tp4DUovYOvd+qI17GaIq
KShuRirpkeEnqx7Z1SxEvn4ArEKUZFqunOZl0WY7q0qauEx/EhnlVsJyqnRqoCdN
Foufs5E5oSV9px4wHkGXwv2fr+mFbvtQRgoBwaAa5s1+DeBXQmyUqYDiCAplJUco
YBAWq3dzzkbKVR/nN4G7hv+F4pv5zYloRP19o+/XKEc1GTYchzGT3iRb8LrWB71i
mjO8gMfptKBZ7nTarHue
=UyOh
-----END PGP SIGNATURE-----

--Qk02oHwa9WL8S0NwNQuKTcmTaKRmPGMK5--
