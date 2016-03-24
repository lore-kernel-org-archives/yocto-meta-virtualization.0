Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C84FEE00C39; Thu, 24 Mar 2016 10:56:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 816BEE008E3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Mar 2016 10:56:06 -0700 (PDT)
Received: by mail-yw0-f195.google.com with SMTP id w6so6308230ywd.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Mar 2016 10:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=BwH+J6W1Kphz7y77Jndstobim6KAJ30tedkv/mJDVGQ=;
	b=TOEPOkH8ZrLnAoJ75c9RHI6ku3I1Eguf13pHIJfwK7bBHJ6gj8CJNgL2Aavw0hqNLL
	4j5GilP/vwG4FBKC0R5KRmlG0uH/9irFa2DVRSroCeNjuGraL3IP0pQbMldJrunhs0pY
	EXOrNaGrbqv2CFbJB3dXiYAgo8duDP/rHDwZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=BwH+J6W1Kphz7y77Jndstobim6KAJ30tedkv/mJDVGQ=;
	b=fXMxf9nfnTL0HQ6qDjEDZqdGoCE/DHR0xHAHCb8MI3PETEG5Pryx/hkVJJS227YecL
	RIrQQW2EPg03QqJT1W/NqbmY1jqv5nvqHmq31JNpvK9p+RPjdDgYFC8EuPt2rFrImQ+m
	IbOz0CybuQkbhKZWsCK8mjbDs4H3NEAWn24Jjsr+S+TFk13yKrtZJvTDei9gMCfv0/JV
	chYy0rT7xOYXZxJ0USbIpGnURr7O9TumEQvdoHKt18q2h5Nc8ENxdSDxaAc8ZhfYxQa/
	8eMqrzCmmwMnhAZXVNZNHajGgsbzSBM7mwZK4uFq+y88UnzvXcmWRZfIeXpf2AMKE/eR
	SlzA==
X-Gm-Message-State: AD7BkJLCTp66Mtx1kM73As66HAY6Pgd9CnaCMpVyMYSzsv6G0D2ByHNxpYRb/HcAE5raVg==
X-Received: by 10.13.211.132 with SMTP id v126mr5475416ywd.189.1458842166166; 
	Thu, 24 Mar 2016 10:56:06 -0700 (PDT)
Received: from doug-macbook.lan (c-68-34-224-206.hsd1.al.comcast.net.
	[68.34.224.206]) by smtp.googlemail.com with ESMTPSA id
	t15sm5137950ywc.0.2016.03.24.10.56.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Mar 2016 10:56:05 -0700 (PDT)
To: Derek Straka <derek@asterius.io>, meta-virtualization@yoctoproject.org
References: <1458833491-7717-1-git-send-email-derek@asterius.io>
	<1458833491-7717-4-git-send-email-derek@asterius.io>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <56F42A34.1080509@cardoe.com>
Date: Thu, 24 Mar 2016 12:56:04 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1458833491-7717-4-git-send-email-derek@asterius.io>
Subject: Re: [PATCH 4/4] xen: add the extra packages released with xen 4.7
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
X-List-Received-Date: Thu, 24 Mar 2016 17:56:06 -0000
X-Groupsio-MsgNum: 1852
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="o4uwibNdIS8hS6uGXMicr5Njf99lotHPS"

--o4uwibNdIS8hS6uGXMicr5Njf99lotHPS
Content-Type: multipart/mixed; boundary="lvrGDj0LCjuME0oGbcNkxkspdenpSfT2A"
From: Doug Goldstein <cardoe@cardoe.com>
To: Derek Straka <derek@asterius.io>, meta-virtualization@yoctoproject.org
Message-ID: <56F42A34.1080509@cardoe.com>
Subject: Re: [meta-virtualization] [PATCH 4/4] xen: add the extra packages
 released with xen 4.7
References: <1458833491-7717-1-git-send-email-derek@asterius.io>
 <1458833491-7717-4-git-send-email-derek@asterius.io>
In-Reply-To: <1458833491-7717-4-git-send-email-derek@asterius.io>

--lvrGDj0LCjuME0oGbcNkxkspdenpSfT2A
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 3/24/16 10:31 AM, Derek Straka wrote:
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---

Reviewed-by: Doug Goldstein <cardoe@cardoe.com>

--=20
Doug Goldstein


--lvrGDj0LCjuME0oGbcNkxkspdenpSfT2A--

--o4uwibNdIS8hS6uGXMicr5Njf99lotHPS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJW9Co0XxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUEiAP/2Noy86GY75sil7YdlsK/fdA
8IROfva0CA+IJFqMAeDPoGEmlkkMTxgYR6blygdGifPtlYgHiWZ7seqbebrGv+Lw
Y4lqkpigbToD8Un1/XKfg5p7lSCCc1MRZNVffFurlJIjtsM0YDVEdGsJ34dyAXD9
jqnnHDeC0ssmarrawaD++wbQUvv34nE2qOQqmkWJEX4g5CJ9UrVYmOyXDo/sNvH1
3E/KMphtHt1Y3BJV1vQrw3LvW1bF2nA83PH+0gdCdZpoAFyQLE7BYJ95xS/TFG/X
72Jhg43yORwi9U94oANNRJpKVyjFPdEErWl5CrCUqMhnvGhX2DBvaU0oQAcwa1ES
kypoAqdIRlBBrN7j13jtlA7dcW/lVHar2NCCjTsryNpGc48TS12sl9OMr1rEYQhY
FXr4I9c0f5R3rCdbgJ2TmLDn2LXVlIoiruRPL8IKov2vTmIG1xi2aWLT9q5+HwQw
PPvCaoU2MIGxMY7Xl8LiNH2o1gLWY11SKGVXIlWgfGGzyYqWyw8CmK2jSOq23uC3
RlszU1+J4jOohNjYMsfB7yF11+IMeaTYJM3wT8Hs4x1mt/0PIuicB88mPBRvqqHK
588bIPzcKEU+5sVxxRplGXddNgMc6q7y7DG2xqnp4un5ShP3WVgiy1LWCVWmIU6l
cOqWoEUEBa1PUeERkxjR
=m/3d
-----END PGP SIGNATURE-----

--o4uwibNdIS8hS6uGXMicr5Njf99lotHPS--
