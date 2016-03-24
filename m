Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 11951E00C39; Thu, 24 Mar 2016 10:55:49 -0700 (PDT)
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
	*      [209.85.161.195 listed in list.dnswl.org]
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B6FBCE008E3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Mar 2016 10:55:45 -0700 (PDT)
Received: by mail-yw0-f195.google.com with SMTP id o63so2546336ywe.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Mar 2016 10:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=Iqac6ld9gnF5OYsHU9S7B6Bst+zi/abeW1jtUZGB0wY=;
	b=FS7mLLWDUgChAfxzE0RLkoA9N1BNT68Q5/oLa3Dw093eYoqRVrC5qcERFWAc/xHbc5
	Tyhj77OalWDQfxtaZ1qD4t04UdSTCEgT+UHFZF8907qNygF9Prbg2y7JggXgf3HdwXnH
	nvgJG36O3fXtjZjUxbopM86nXjU5pGQD4HOUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=Iqac6ld9gnF5OYsHU9S7B6Bst+zi/abeW1jtUZGB0wY=;
	b=VhcpO3fkjem/mzH/z0NKG5ZkvwFfkx3jUTAXhs5dSlvMxzw25PE5FHGN+F8LMzNNGH
	PCDunGpBf8dCGvL9Y3OElPodB+Gnk8i2xLGslEPftr48eLqISORlhJt69uRDL6KSrGAU
	viy2QK6eXBmCiPO5LaNIUqBQUy2GETXvv2riMscOFs6ZudP44BGmnxzf4pNgc1rTdWqu
	upy2+ccEWCNuF90wxgO+4CEiYlas94gMqTj+aaUMMubAobsoGTDVVgkrHbndI5B3TBcU
	zqxLjTM1EUQm65838NSfdS7EMEzCGVstP5yMhUTT+S9e8NenM2UYYUqvkV3BD0/p0rkT
	n89g==
X-Gm-Message-State: AD7BkJLt3+tDBkBTy6MhvslbPV3uEmywPcHcB0wUv+9AHOndXEM7NCrmnxL9RjM0KvyYIg==
X-Received: by 10.37.105.135 with SMTP id e129mr4980561ybc.185.1458842144887; 
	Thu, 24 Mar 2016 10:55:44 -0700 (PDT)
Received: from doug-macbook.lan (c-68-34-224-206.hsd1.al.comcast.net.
	[68.34.224.206]) by smtp.googlemail.com with ESMTPSA id
	i189sm5135315ywc.30.2016.03.24.10.55.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Mar 2016 10:55:43 -0700 (PDT)
To: Derek Straka <derek@asterius.io>, meta-virtualization@yoctoproject.org
References: <1458833491-7717-1-git-send-email-derek@asterius.io>
	<1458833491-7717-3-git-send-email-derek@asterius.io>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <56F42A1E.2020606@cardoe.com>
Date: Thu, 24 Mar 2016 12:55:42 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1458833491-7717-3-git-send-email-derek@asterius.io>
Subject: Re: [PATCH 3/4] xen: add the flask policy to the set of files installed to the deploy directory
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
X-List-Received-Date: Thu, 24 Mar 2016 17:55:49 -0000
X-Groupsio-MsgNum: 1851
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="MctWfr9VQbBMew8gDro7fxk0LGMuqcDHd"

--MctWfr9VQbBMew8gDro7fxk0LGMuqcDHd
Content-Type: multipart/mixed; boundary="eRbcIQp4r1Eij61bl6iKrsw6Dorn6woEu"
From: Doug Goldstein <cardoe@cardoe.com>
To: Derek Straka <derek@asterius.io>, meta-virtualization@yoctoproject.org
Message-ID: <56F42A1E.2020606@cardoe.com>
Subject: Re: [meta-virtualization] [PATCH 3/4] xen: add the flask policy to
 the set of files installed to the deploy directory
References: <1458833491-7717-1-git-send-email-derek@asterius.io>
 <1458833491-7717-3-git-send-email-derek@asterius.io>
In-Reply-To: <1458833491-7717-3-git-send-email-derek@asterius.io>

--eRbcIQp4r1Eij61bl6iKrsw6Dorn6woEu
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 3/24/16 10:31 AM, Derek Straka wrote:
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---

Reviewed-by: Doug Goldstein <cardoe@cardoe.com>

--=20
Doug Goldstein


--eRbcIQp4r1Eij61bl6iKrsw6Dorn6woEu--

--MctWfr9VQbBMew8gDro7fxk0LGMuqcDHd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJW9CofXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUDqYP/AheVg7oQxaxLO/WhR75Wiad
IQFlUwKM+JgmfEJsoXK2ItftR+gLNLCwCbH8prwdtfSt31aPXeC1KYw2xWqrrg7z
aXd2q/+S4BQ63tA1vRZWiKK+IKPDqUn1WBWb2CXcS3SZMcOoIIB3q8Afv0GXU/qQ
5yLWFK9INwdzA9cgDhnDSIPGhklf5fFevbdDsbZ0n586spRiWyszUDHrRhGjydoA
e7oNJJcbk6V6u26cp8rJYcwc3cbcIqFsgc465wd5qvCh/78rx0lfrzsQDVYYb5l/
bSN4OfqDE1wj9OZpV1QiwW0JtHM8jrJ381DD+V9QE2PfG7MFu1MUruxOZq1ilP0c
ys3kkZBFb7+Q/ymgJV6UzbfcENi1ZEqSUypUcd83aqjAXAO1xM6+bFlPT+5PTX5o
BmxNp/Wpr/+DkXxupCM08S5gTwaukIBTu8GT+VPZuinDg9d8s94cxelUVHxguIxd
okUgWcH6/WcI02J8ROoz5JzGVCEyxdgfjhXSAyFV4VFsE8Wmz97BHh9yTzVtdirg
2H3iFKeLb13DDeq5aiYmSSvzdwArUTm7V1WRZu5/vroClJANbesihHRNFCoX5FGM
sfQB07mjvGlgixi2mBEUvIiD25uqSPLgQjZM8pBEcJXlnWsNh4qGmXVvqSMrAscK
C9yqDiRcA1HrqzfTf5Rr
=xTwQ
-----END PGP SIGNATURE-----

--MctWfr9VQbBMew8gDro7fxk0LGMuqcDHd--
