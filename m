Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ACC42E003C1; Mon,  6 Mar 2017 16:17:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.178 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.161.178 listed in list.dnswl.org]
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
	[209.85.161.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3040EE0030B
	for <meta-virtualization@yoctoproject.org>;
	Mon,  6 Mar 2017 16:17:35 -0800 (PST)
Received: by mail-yw0-f178.google.com with SMTP id v76so34595772ywg.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 06 Mar 2017 16:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=4WbsOn4CP4RcMC1mBr1NQIikX5iZLbawAVKb68xNTC0=;
	b=gkeX/QxydvF+CngnMsEQZ3/Tlg5Hcei14C4CT3hGJNyfLw2OcaeqcLoikTsUsDBLZW
	Qpj/0piQ4c7KP5fEjafKXWhcPh+iOU7GY0BL6a9ibVwOSRJrnTOXiuKrGFS/gnoor7V6
	/dqPuc8OjpKBgbefKm6NBVHwYRsOfpw+iyYM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=4WbsOn4CP4RcMC1mBr1NQIikX5iZLbawAVKb68xNTC0=;
	b=SP4tWinpm8728SFeIaA3vzcR44eIs7iU2g4lu1vi8DDkab7dJcj+doje7BoUV5p08S
	kquYr3wBTgiGTP6ZaCy00FfmT7ah735xEBHxTlNCboweqXrYINj3onNE96HjTqCFEGTY
	7i+MXI2TAmftnY8FUbfL0UV0cl8FhfTPwQ7v6K4AXCiqSQkKF7Tv7uYTOqAI6yldStXK
	HE0RFbf/RKThwJnbbbGuEWfd0lXnJEgyVZSoEhk91My5oqYWwE+0WLxWmopaitsoVA6t
	WE6stt0qOZAm+JlmnmVVcC5/7RU5wewJQd7hzv2T6Qb3mwXFawqQTKXBFOOgqlBoGRHY
	CydA==
X-Gm-Message-State: AMke39mplmrOxpKzwRspph66oovTlqimirpfdIas8E0mxy17IV9bfjKy8vCbh+7e42onwQ==
X-Received: by 10.37.17.6 with SMTP id 6mr12888435ybr.62.1488845854866;
	Mon, 06 Mar 2017 16:17:34 -0800 (PST)
Received: from doug-macbook.local
	(104-179-196-18.lightspeed.brhmal.sbcglobal.net. [104.179.196.18])
	by smtp.googlemail.com with ESMTPSA id
	p4sm8439998ywe.53.2017.03.06.16.17.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Mar 2017 16:17:34 -0800 (PST)
To: nitish jha <nitishjha16@gmail.com>, meta-virtualization@yoctoproject.org
References: <CABh+foZe-UwGBX9T3Dcp9XBJMnHmxEh5qnbruTSfR7yDrZP81Q@mail.gmail.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <37ab2894-7609-5162-80b6-24c9c2d778b9@cardoe.com>
Date: Mon, 6 Mar 2017 18:17:29 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <CABh+foZe-UwGBX9T3Dcp9XBJMnHmxEh5qnbruTSfR7yDrZP81Q@mail.gmail.com>
Subject: Re: Xen-image-minimal: xl tool error
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
X-List-Received-Date: Tue, 07 Mar 2017 00:17:36 -0000
X-Groupsio-MsgNum: 2460
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="9j4dxD9IrcNhm3wbWSqBSOJoUoLpKdCPb"

--9j4dxD9IrcNhm3wbWSqBSOJoUoLpKdCPb
Content-Type: multipart/mixed; boundary="n9rdUXgTmlwPBRwadIl3Sb3W55DN1Lsmi";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: nitish jha <nitishjha16@gmail.com>, meta-virtualization@yoctoproject.org
Message-ID: <37ab2894-7609-5162-80b6-24c9c2d778b9@cardoe.com>
Subject: Re: [meta-virtualization] Xen-image-minimal: xl tool error
References: <CABh+foZe-UwGBX9T3Dcp9XBJMnHmxEh5qnbruTSfR7yDrZP81Q@mail.gmail.com>
In-Reply-To: <CABh+foZe-UwGBX9T3Dcp9XBJMnHmxEh5qnbruTSfR7yDrZP81Q@mail.gmail.com>

--n9rdUXgTmlwPBRwadIl3Sb3W55DN1Lsmi
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 3/1/17 4:49 AM, nitish jha wrote:
> Hi All,
>=20
> I somehow build xen-image-minimal successfully.
>=20
> Machine type used is qemux86-64
>=20
> But inside qemu when I try to run *xl list *command, it gives error :
>  Could not obtain handle on privileged command interface
>=20
> I am already logged in with root.
>=20
> What I am not understanding is once we build xen-image-minimal, is xl
> tool not included in that?
>=20
> if yes then what else I am missing to make it work
>=20
> Is there any wiki page which gives details on how to use xen with yocto=

>=20
> Thanks and Regards
> --=20
> Nitish Jha
>=20
>=20
>=20
>=20

You either didn't enable 'xen' in your DISTRO_FEATURES so your kernel
doesn't have the necessary xen drivers or you didn't actually boot the
xen hypervisor and instead directly booted into Linux.

--=20
Doug Goldstein


--n9rdUXgTmlwPBRwadIl3Sb3W55DN1Lsmi--

--9j4dxD9IrcNhm3wbWSqBSOJoUoLpKdCPb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJYvfwcXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUjFcP/2raVUnMUA0ZqxT8l/zKLGRx
gkSExebsySqJR9YHOKLr9WYFUJZa9rOp7dE/KNC7GO1yGeFKfDb7Y0IEMpLEJ8PZ
RzIxRApFUwqoP0rkmtFw538KB+Grd9RMoMWD/FI8h/Zcu3Pdv8rBOoXR7hzyzo7i
apEP1VItxnRXa8UXUx9SMI6mXOCx6BDsLcqo0uF8YuK4tnpEPrca6JXrom6Pp0+U
RyYNfjegfp5QIcKZwNkZfkp0V0ApvJ91pzy9y2nO/MLbVb1qOWupyZQvitkaHpea
uAlYOiBCx+9peXq5S8HlGB+hifIZWdnlQMzltgsgTzTxqway2r5k52SONrr0ETDT
rocLkmx8zmbMMweZigoCGJgJdvfuofElcmVam1myHDoAvqIel/tT9Ur/4RbcMTyo
8VgWwl/42Ieuj1hDoIiccE/R21vrIqdB+yoELOFDmUseHqdLUPpbxCOGC2thX66o
bRZ8MFYU70lXF/sBOFwZvSJq8UavC5nwwHPTaW2yx7e67HpONsvhojXUCrbuWtkM
1lS4tXx0ygpy+hHEjn56SUzXoxilOIczG+b4Sr9JMmxo5r177/Y8Zk90o3cpkC8S
211txW1YtQK+hD9L9r/vGGhSVXQsyI0MXsKChEuby1UI7/bJsTpTRHWu8lbqnuGM
vhTmPlJHHbXY5l6UUHP3
=O60c
-----END PGP SIGNATURE-----

--9j4dxD9IrcNhm3wbWSqBSOJoUoLpKdCPb--
