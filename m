Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 70447E00D2C; Thu, 25 Feb 2016 18:59:07 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-yk0-f181.google.com (mail-yk0-f181.google.com
	[209.85.160.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C48E8E00D25
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Feb 2016 18:59:05 -0800 (PST)
Received: by mail-yk0-f181.google.com with SMTP id r207so31077079ykd.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Feb 2016 18:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type;
	bh=YeHAFQGiVhEel48/8U3fRyrQq+7iJ0MmnOKckva7B6c=;
	b=aClWqAza8fzdpZfufWfqIdcq08jTzsOLCNsgLT1zhdWmRnnHu8bmmifH6asMSDL/DD
	XqKqYJcasGWHCxNxqcp7tGFRrjP0mNr527xA8LUt/T64xMbQmB+bM13wyq/bW+//ZMB7
	x4qv1gJelGP2AgHYIB4VWo9x0/LL6O2tScSAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type;
	bh=YeHAFQGiVhEel48/8U3fRyrQq+7iJ0MmnOKckva7B6c=;
	b=Aqwvfl9w8EP3uuhMgL8ucnJRulNKJW4ePgj3hGZ5L6oi9qlWlD1OsFvbLwmoKDZuZf
	x5iZwpId+xqEEJF/HDdJyvWuC1NZwmgC3LW5m4xLCgqmw6fXMr58S9fGo/vJeHMCe6x0
	/GVBoFg2PCUMKxgIK4u0MNFeTIN1pri62cLxiyfIs0CfR+99+twtH0uFKMbos/H0TukA
	EvTH8iUmN2VXiFqpiwzyoYHm6f2Ngv3trFvQU66pHe8wYqXekcqWzwnBjGKEjlkC9n5X
	qopNTrj5PY3I/LVNMyO6Ya+57mPyCVd+BcWUQzO6/gvxRWdNOiLhNtZ3iwOVqWHSAXzB
	b9hQ==
X-Gm-Message-State: AG10YOSjoBppmWj4v+pQcJ+s5M94Hqul2S/fQWsZDZFOL7xrBG2mReX/HiS3gwMBkUNs3w==
X-Received: by 10.37.100.8 with SMTP id y8mr18811512ybb.33.1456455545111;
	Thu, 25 Feb 2016 18:59:05 -0800 (PST)
Received: from doug-macbook.lan ([2601:7c0:c300:dad6:285f:bbcd:1fa4:34dd])
	by smtp.googlemail.com with ESMTPSA id
	b3sm8467243ywc.24.2016.02.25.18.59.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 25 Feb 2016 18:59:03 -0800 (PST)
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Chris Patterson <cjp256@gmail.com>
References: <1455291269-32533-1-git-send-email-cjp256@gmail.com>
	<CADkTA4MW9xP254y=tBQU33pztWGJwqqQUb+BwEApFb3UvUg8Ag@mail.gmail.com>
	<CADkTA4NLHMjkY92WYWam7zzPqKXeD_S48bWKvQq3wgvao_20BA@mail.gmail.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <56CFBF77.5050700@cardoe.com>
Date: Thu, 25 Feb 2016 20:59:03 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4NLHMjkY92WYWam7zzPqKXeD_S48bWKvQq3wgvao_20BA@mail.gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] xen.inc: fix ordering of stubs task
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
X-List-Received-Date: Fri, 26 Feb 2016 02:59:07 -0000
X-Groupsio-MsgNum: 1819
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="so36glgG54qVl0Vtg1uhjnd8uuRnF9Vxs"

--so36glgG54qVl0Vtg1uhjnd8uuRnF9Vxs
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 2/24/16 10:04 AM, Bruce Ashfield wrote:
> Someone was pinging me about cherry-picking a patch to Jethro, but I ca=
n't
> find any trace of that email any more.
>=20
> I can't even remember 100% who it was, but this patch rings a bell.
>=20
> Does anyone know of this, or other Xen patches that should also be
> pulled into
> the jethro branch ?
>=20
> Bruce

Bruce,

They likely pinged you off list because they dropped me a note and I
told them to ask you to backport this. As far as I'm aware this is the
only fix needed and its necessary into jethro and master.

--=20
Doug Goldstein


--so36glgG54qVl0Vtg1uhjnd8uuRnF9Vxs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJWz793XxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUoAsP/R+C53GduFSWbIeQkGoFH0MR
i6Cs0SHu+TF5oZgnnHvAzsY6hRmMgtXQZcpRwiS7UpVRXAiPYD9lkWwhu+bL4Zrq
7ac0I1OFDHHQ9v6czMk8iQBT6P1oT1vgVfkl9eloGadQMi4+q0S1U17yxVBQKEMA
V5lQylZMpCne82MZ83RQZw8714R7qVXoI4u21sQHQK6Znw1Cg2vtHvILzNbwLHEU
ukH2hJPe2GeTvKF8StY2wtcOqlsNfJsvln3kjQMR+26ejEhHeawX9mDWuAD+wgu3
QQxDStq6Xjv/pQF9kPaD6fe/fh/KI00Cupk4nXgCa8rr0RCjNZXXiEorkY94sghE
Vw+1/fg84IqM6xEqKZgErjz3v6XbU1Js0/z7HQMIn++LHseG5nG1dtN1MtqipUhS
LyVj/xlPtD8KgJddIBr+2J5Pljjp0f53NyAXTnHSHs7VelyJdmJ4aZ25h1EyW161
83iyHV+7IhlmCS3o7RtwtsnYyoeKr3IuJ7Z3/Y6jXYpLVpfcy4qcmk1HAGfHP1hO
KD86WQ2mafBURJ/xPkqlmVaBPxW3NwDLnDcvvhl2YuRbWUIw1kcrzyJl9nZmBugH
yOWdtZLqAf9r8LXf7vupzX+0iFcyTT/DJf/JMnt91yL2dhcvNzYOLPtAZhxHpyx6
wWEInOb773obbK9bY8GO
=RxA+
-----END PGP SIGNATURE-----

--so36glgG54qVl0Vtg1uhjnd8uuRnF9Vxs--
