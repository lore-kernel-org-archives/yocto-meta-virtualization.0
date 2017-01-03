Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 194F0E007AE; Tue,  3 Jan 2017 08:24:05 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.214.65 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.214.65 listed in list.dnswl.org]
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5E21E006D8
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Jan 2017 08:24:02 -0800 (PST)
Received: by mail-it0-f65.google.com with SMTP id 75so51199029ite.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Jan 2017 08:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=0fCE26y3tf6vmGBHRDgQuzrSJ3IBtw6RXhdoAV9aoGg=;
	b=fcDMHeCuBpY0gHe5kFFpIAMgMozOBCE8kekld7GMLtix4X0/tsjNfFiRV/UFc+BlMw
	iOx7Z16wSW463zPwBkmUUJcpZCEn0Nxvra4SU8R0fmUlDpB+hm4jRb5Nod4vZ8hvP/Hf
	JeJ3ZnuFTOJeQdRMBZsW0we4YtCIq82xhV0tM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=0fCE26y3tf6vmGBHRDgQuzrSJ3IBtw6RXhdoAV9aoGg=;
	b=BO4/QUnHRzq4iH8E05mLU0DWQxDNdULh8h7O7ZVD8BvP/bgTw8oHiuQLpoKKZGY+rV
	PDADEInZR0mVbup/VxKwIOUUWjTVeJ724sLOwV4pSuxFVTlQCEAcpklAV3WXsHdQDSpH
	P6JXDOj6vSvY/v0+snZOiFHGr5CPZoGnlF9bdcFCRiOs6a4VsSxYqbmfdUz8RV3Coddt
	jgvgXDrNCcV9watvSisuFtRx3dbrpoJY7dMxVEnSf24FU12p4tgrH67CNCHJ+R1pJgnL
	1YTOolTur88VCLsyaIOcg7K8MlJJtMWD37oTIagO5FK9sUKXvc0gByvsPVUSbQOXxNut
	CxdA==
X-Gm-Message-State: AIkVDXLmhA5w5Mz/bftS/NXbBdf/gAR9QAVJtezFq52D5wYssTDBpZOCv52StMSIa693eQ==
X-Received: by 10.36.29.19 with SMTP id 19mr52316891itj.101.1483460641890;
	Tue, 03 Jan 2017 08:24:01 -0800 (PST)
Received: from doug-macbook.hsv.starlab.io
	(c-68-32-173-93.hsd1.al.comcast.net. [68.32.173.93])
	by smtp.googlemail.com with ESMTPSA id
	81sm32585665itj.6.2017.01.03.08.24.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Jan 2017 08:24:01 -0800 (PST)
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20170103044754.15012-1-cardoe@cardoe.com>
	<CADkTA4Oc0BCLmhAw7vFLspt4eMN-BAeCEv8ij0cmDuEAUDSUVg@mail.gmail.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <e0ad95d4-a453-d6c1-7ee2-d1fdc7c23072@cardoe.com>
Date: Tue, 3 Jan 2017 10:23:56 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4Oc0BCLmhAw7vFLspt4eMN-BAeCEv8ij0cmDuEAUDSUVg@mail.gmail.com>
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
X-List-Received-Date: Tue, 03 Jan 2017 16:24:05 -0000
X-Groupsio-MsgNum: 2239
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="0vqOoeLwILO3fGI5BduVOKKP97gfd23oN"

--0vqOoeLwILO3fGI5BduVOKKP97gfd23oN
Content-Type: multipart/mixed; boundary="eAxKvis8sgn46ktPc78aoQaoWMFAivpHE";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
 <meta-virtualization@yoctoproject.org>
Message-ID: <e0ad95d4-a453-d6c1-7ee2-d1fdc7c23072@cardoe.com>
Subject: Re: [meta-virtualization] [meta-virtualization (krogoth)][PATCH 1/5]
 xen: switch to updated download URL
References: <20170103044754.15012-1-cardoe@cardoe.com>
 <CADkTA4Oc0BCLmhAw7vFLspt4eMN-BAeCEv8ij0cmDuEAUDSUVg@mail.gmail.com>
In-Reply-To: <CADkTA4Oc0BCLmhAw7vFLspt4eMN-BAeCEv8ij0cmDuEAUDSUVg@mail.gmail.com>

--eAxKvis8sgn46ktPc78aoQaoWMFAivpHE
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 1/3/17 9:31 AM, Bruce Ashfield wrote:
> You didn't follow up to patch 1 and 2, I assume these are for the same
> branches
> as patches 3 -> 5 ?
>=20
> Bruce

No. Actually 1 and 2 are only for krogoth. Sorry for all the confusion.
I realize I should have sent this differently for better clarity.

--=20
Doug Goldstein


--eAxKvis8sgn46ktPc78aoQaoWMFAivpHE--

--0vqOoeLwILO3fGI5BduVOKKP97gfd23oN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJYa9AfXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvU7PEP/3NhNWuTNkZokIIICX3igMTS
hbxJDDc8v3ngEGpj7ELK3M86rmWRZw23nzSGzaVg7vLjkpPbEmOKV+C52oiw+OVh
b1gvL8z/+KP0Zl1wnwW8Z/RMGReI+8Q5XEVr4weH9qj2qUFFHy3SOAbDLoMF7sCQ
Wl3Vv12vqPbYrYg+/xFeMQJg1hQXv61xWgjocXwgyq8Pn1WOnP6QDxYEiEZzzHIu
9NBKXCQPUvVuJdDTUGZs7sWzDu9n6Iululi0yG0QskC7jdvA/ZQrKwlyGzoflmII
VbV12p7/UpyKb2ekL8zpOlQseuV62IM6wCjbc23pLjJRSX2K/3qAdKHfOEXH2Adj
PCTYqSuGD0dWNsHgT8PvgZHR1Uqn1A6zG6QI2bu8Ujq/2tgciAphuk591D+MYSp3
KZeA5QVNBHV+4BIUP+eZbdzFEDQeKxkxfi/Jvt+RH8t4J5A7LAFKet0O5fgp8PXs
8oJPkdLJgrZaQYOKomWQusM6EA8DSqrGrVYd/gaKga9nisSfohg8zoaGBXVcwQ5/
00vOzWaJbKaF0Hym2aIIAS+eofbPG5Z8JTWHSMQsRlaaRGVaZzTdiFEqUJcg9dQm
rZi4VbxT7U7HVJm2wUfTz17oAoPb0v+l2ToFjx9v4v7Qhd/rK+obwcWtiHdSoGVp
wQmYYugZTtTfSEjT3+CO
=j/pG
-----END PGP SIGNATURE-----

--0vqOoeLwILO3fGI5BduVOKKP97gfd23oN--
