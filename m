Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AF626E00DD8; Thu, 28 Apr 2016 07:33:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.182 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f182.google.com (mail-yw0-f182.google.com
	[209.85.161.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5AD12E00DD0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 28 Apr 2016 07:33:22 -0700 (PDT)
Received: by mail-yw0-f182.google.com with SMTP id g133so108706178ywb.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 28 Apr 2016 07:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=qsLvteDdbMFbKVRJFvUcvcbaGrQKeYFT9IYw74cGyYc=;
	b=B25yvYO3tVj45j9hZaOpISHiHYXf1+S2joMmWmM60e5VBLYe8KdadiDH7wyIHEi8FP
	/qDkl9EQyCHAn5Y23W2OfP0bYLFVnOfyD4GHmA9zp8sBdqfGH0dqxf8qRmhD8i5OBVmC
	+ms9rz5KiBEcPxh+BJoP964CAKKpP2/lbRqZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=qsLvteDdbMFbKVRJFvUcvcbaGrQKeYFT9IYw74cGyYc=;
	b=nIzJqalVEgN8FxkLG+rAk8plueQPtF+F7aLC9OUChCjus517jIy2jNhiQtPFLyDhpl
	+Wij01aFqdE79N7CMUgcUK7NJdvv4C5jHIznLYRV39f/7bTMTLTq1vmD32jdmplmxjAY
	u936QjgLKF0R9CRqPaFb3BaLnL1kthiO/JLEke7bU59850q086YtlEgHEWlHnRY1dutB
	nJZBhicZhRPxhgvTa4hzEgtAYtreLvmJli7J8JYBBWMu9KzwF6KRKCfGq/WAdcsQbMZz
	/DvThrlQTzu9IhZH6wKGyV7g1s0Ia3Xfdqpn8Ydt6xBxqttEjSn6XcUhruYPpnPBSP9r
	nCDQ==
X-Gm-Message-State: AOPr4FW9Umlrkuka1j7iO2jCg0hLAkmJsJLMcEIQOzj3hFlaJUcWa78BvlVfpkW9S0lBOA==
X-Received: by 10.129.132.83 with SMTP id u80mr9463062ywf.7.1461854001983;
	Thu, 28 Apr 2016 07:33:21 -0700 (PDT)
Received: from doug-macbook.lan (c-68-34-224-206.hsd1.al.comcast.net.
	[68.34.224.206]) by smtp.googlemail.com with ESMTPSA id
	e6sm4837160ywd.23.2016.04.28.07.33.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Apr 2016 07:33:20 -0700 (PDT)
To: "McGillion, Brian" <brian.mcgillion@intel.com>,
	meta-virtualization@yoctoproject.org
References: <CADqm_STregrFb_Tc3ecznTcAQSt36n8NoKv1CTC9VvzcR-STbw@mail.gmail.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <75caec66-47b5-e9db-4e30-29a5f3309d81@cardoe.com>
Date: Thu, 28 Apr 2016 09:33:16 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.0
MIME-Version: 1.0
In-Reply-To: <CADqm_STregrFb_Tc3ecznTcAQSt36n8NoKv1CTC9VvzcR-STbw@mail.gmail.com>
Subject: Re: failure to build xen minimal
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
X-List-Received-Date: Thu, 28 Apr 2016 14:33:26 -0000
X-Groupsio-MsgNum: 1914
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="U0FDajIc3NPQhHlJr7FVF72d6tv4v0AMK"

--U0FDajIc3NPQhHlJr7FVF72d6tv4v0AMK
Content-Type: multipart/mixed; boundary="KclKICpn7xc49OM5tJldmjTOEM5sPbVVL"
From: Doug Goldstein <cardoe@cardoe.com>
To: "McGillion, Brian" <brian.mcgillion@intel.com>,
 meta-virtualization@yoctoproject.org
Message-ID: <75caec66-47b5-e9db-4e30-29a5f3309d81@cardoe.com>
Subject: Re: [meta-virtualization] failure to build xen minimal
References: <CADqm_STregrFb_Tc3ecznTcAQSt36n8NoKv1CTC9VvzcR-STbw@mail.gmail.com>
In-Reply-To: <CADqm_STregrFb_Tc3ecznTcAQSt36n8NoKv1CTC9VvzcR-STbw@mail.gmail.com>

--KclKICpn7xc49OM5tJldmjTOEM5sPbVVL
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 4/27/16 7:32 AM, McGillion, Brian wrote:
> Hi,
>=20
> Using the master branch, I am getting the following errors when trying =
to
> build the xen-image-minimal.

Which version of poky? jethro? kergoth? master?

--=20
Doug Goldstein


--KclKICpn7xc49OM5tJldmjTOEM5sPbVVL--

--U0FDajIc3NPQhHlJr7FVF72d6tv4v0AMK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJXIh8vXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvU8p4P/3d1uYoK/4cCEMYsBdeMkqSz
WbgTo+QwwF6t2Kj3qhNeBe1KTATo4VkJ51sF3xckdfmP9+EP1g5h3Fmue5qLNb4p
Iw2F19ZI5qzH5m3qUm4VuD9ThurKIQHsnY3gyQUP1Vd4X5IWi1SYVY9eL9KxDLw+
60B06itdJEiYbEW9czoK2F94XsIDdWGMwDu2+h0Ui5T6TC5nKuUkCZ/jnEb1ETQm
36Kakjl8rzXKyk26YBVylzJWkmSCZWA/E7Vl4BEwfCqSnM3xNyA+Bi7c0Oto7I6w
wemo2/Moeon0x//OBq4EVzBnTh9Y3U/djyrYrRB9YBvOfEF0N5zhRLlkQMAnaHEQ
ivfhId3BJnpsVAtRQovyq4MtiTMMO+lsw4CQtX62FbvpNI7mmhAzqOn3Dfbg5DIl
+MAKCWTvD1goeOcbqx8FNScH+pzJJuEvYPTF9vsMeq7OJww5BXP1LqFegz+nn3t3
3XkuXcEWV5uQNDthN4O4RtFaMATR0CL41FI+TgJsi3FQXMq4PCAQ9kirsCDy+WjD
gO5EUqsrVQyQrS5qC2wdcNMdBjObOOF+kV682bl2B9Osj36lt9AH8TgYa6btWW+p
2V04TIvzj2KfUnr6fvz3jprGy98hD4hVosR5j07V4Lc2TF2DFDaS00AcU26J8fxZ
GKx+5unH9aujRyO3FoW9
=R+VB
-----END PGP SIGNATURE-----

--U0FDajIc3NPQhHlJr7FVF72d6tv4v0AMK--
