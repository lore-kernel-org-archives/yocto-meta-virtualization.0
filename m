Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DEA0CE006CA; Thu, 24 Mar 2016 11:07:43 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AD524E00443
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Mar 2016 11:07:41 -0700 (PDT)
Received: by mail-yw0-f195.google.com with SMTP id w6so6341462ywd.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 Mar 2016 11:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=UY5hy3Rh2mwtD3Th87WsU9xpEG8klZ8Q1GXQZRl32g4=;
	b=LpMH2qE+YJU6Vyie2oDfdViDTBPs7Hkff49B9mAF7YPvsTGwzvCCl/Ry4dfyV5GmtA
	KzDDMLFulJMqWI/VG2q0ilbgEFFvpaOteDTjitCvEnvMIbLovkl4WXKJz2yz8xLmz8Nr
	thDZgQXp45cGk/QpiWAhJHOcPjKgTJlJHM+vs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=UY5hy3Rh2mwtD3Th87WsU9xpEG8klZ8Q1GXQZRl32g4=;
	b=GQ04KhHInl1RhoUJoHD3V39brG1mh+fhRS4Tu1GapTieXtxkdq11yhq++y2bEPG+As
	bJSDcL6bzf1RH8ztr53pWCgdgIkcnZ+6bjngYF1BckD/12lkKzd/5S/mKckdDHqypwru
	yO1AkRdNGYSLXzhtkVQcuBWBlgqRBAB0uo/uVxoa5hrPW9qvtXlJ8dKtCkGiYW7pAGYx
	DVFQ/K1hr59pAWwRALxBASJX47lakxlhSmKw5B3tNoODuxD36naBYcnFzDbkWtnUWKOv
	ksiDij9OzxvVMXOl86u7L1tz9asq+39g7Q+3Lohe59uRl9slUkJAb1g99utfvg9BvzPj
	sVDQ==
X-Gm-Message-State: AD7BkJLqV6zTlTeJzvHlfNjbpNbPUspsf+tSk78pKfO4w4Nx+ko1+f1lFTaFjxjD/kM88Q==
X-Received: by 10.129.32.66 with SMTP id g63mr5034857ywg.240.1458842129367;
	Thu, 24 Mar 2016 10:55:29 -0700 (PDT)
Received: from doug-macbook.lan (c-68-34-224-206.hsd1.al.comcast.net.
	[68.34.224.206]) by smtp.googlemail.com with ESMTPSA id
	k186sm5140056ywf.14.2016.03.24.10.55.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Mar 2016 10:55:28 -0700 (PDT)
To: Derek Straka <derek@asterius.io>, meta-virtualization@yoctoproject.org
References: <1458833491-7717-1-git-send-email-derek@asterius.io>
	<1458833491-7717-2-git-send-email-derek@asterius.io>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <56F42A0F.8000203@cardoe.com>
Date: Thu, 24 Mar 2016 12:55:27 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1458833491-7717-2-git-send-email-derek@asterius.io>
Subject: Re: [PATCH 2/4] xen: add the ability to configure the name of the policy
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
X-List-Received-Date: Thu, 24 Mar 2016 18:07:43 -0000
X-Groupsio-MsgNum: 1853
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="mKP2F7ua5BTfm3VS0VqeOLQIkf3tHtKmH"

--mKP2F7ua5BTfm3VS0VqeOLQIkf3tHtKmH
Content-Type: multipart/mixed; boundary="hvvHH9OwulNCvUnnC5vN7a517jTsEUegh"
From: Doug Goldstein <cardoe@cardoe.com>
To: Derek Straka <derek@asterius.io>, meta-virtualization@yoctoproject.org
Message-ID: <56F42A0F.8000203@cardoe.com>
Subject: Re: [meta-virtualization] [PATCH 2/4] xen: add the ability to
 configure the name of the policy
References: <1458833491-7717-1-git-send-email-derek@asterius.io>
 <1458833491-7717-2-git-send-email-derek@asterius.io>
In-Reply-To: <1458833491-7717-2-git-send-email-derek@asterius.io>

--hvvHH9OwulNCvUnnC5vN7a517jTsEUegh
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 3/24/16 10:31 AM, Derek Straka wrote:
> When using non-release versions, the policy files may have a different =
name (xenpolicy-${PV}-unstable).  Allow the policy file name to be config=
ured by the xen recipe.
>=20
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---

Reviewed-by: Doug Goldstein <cardoe@cardoe.com>

--=20
Doug Goldstein


--hvvHH9OwulNCvUnnC5vN7a517jTsEUegh--

--mKP2F7ua5BTfm3VS0VqeOLQIkf3tHtKmH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJW9CoPXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUTQAQAIfATmeDjCwvQsGCuwd9n3ao
4ar63cmo3k9krwsCYwnyuxrfhZ50+ffhZ75T2nKN+mM0l9VFJ5pTwB9Q0yFYD8/v
ecJO5dsuQZ08ajIJDCNkNK1Z6/GDd07JWbGHt4FqYy84pU1/yehdot4BrH7vJL2J
4Mu+qHz5M+/b4cFESqR0cC1Pb+NVuogAlGGXCryWxwfQFOeglqsrMNNNx08xM7Gf
Kn6O1skFBKb1NA8yYDDKK7ZU1uoSWfg1q9Im3BGCYK6yhWq5F63qXp56hptze9fl
rvw9GqQFUP2JDr3I9CqhpUbIw82eubp983huMbozdQ/pbkKIOiYXgvXBGxZr8uqF
Z2SCN+db/dPzrCj5uuYpazcMoNzYX2N9jyuVwisFOuX8cuqjtyUrSTq2OrUuzQQ1
bQFowttIaPYAUDxMjusmZEGupj6bj4Qn8j1axiUFpdhsgq7yokF0wjCStpUVjhAZ
LLcBqTF/hc05bGtyf5KpoQvww7g01/fKBnl3pyFAOjXOCFjJbx1VIUfCD5Hqo3UY
NGIW39zCrpMmDLj1mTSmfj4iDMKlvxnnHMB2ehvqa37FPBoYKeTDNI4E5tRnQ/Vk
V8UETgNkCgOJlxTy9/K1WgmB5VDN3b/GGqbotq0HV5XnREpAku9okWRq/Ad/VBJ7
aIRyur2T+u5UpThDzrHC
=qHby
-----END PGP SIGNATURE-----

--mKP2F7ua5BTfm3VS0VqeOLQIkf3tHtKmH--
