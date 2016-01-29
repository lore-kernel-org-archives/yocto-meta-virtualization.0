Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 29A21E00A92; Thu, 28 Jan 2016 18:36:06 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.174 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 48D99E008F5
	for <meta-virtualization@yoctoproject.org>;
	Thu, 28 Jan 2016 18:36:03 -0800 (PST)
Received: by mail-yk0-f174.google.com with SMTP id a85so54479222ykb.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 28 Jan 2016 18:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type;
	bh=E4GMAffalhT3ueDiewEoh4XSJS8vIwlKVWMC8v50suQ=;
	b=XOnF9dvBcJmuup0Xk6B8lrwJUJFcy+FBFDciuNwEMRtnaaQeRz2RiDvpCQx8Tma1oR
	aefEzEiMBKdBoCwTVWyxeQ4/6W02xyol/52Ch9UtHrvpGL3l4xiOHhoBwuD3YU8nVICA
	Xb+Fi6v7uviFT+HMZ0xqJy+TlrsoI/XQ2YOjJssmBP7WVoPDSyP37fgdMsRq0464Beko
	lWCd4lSDVl+FLMFb79JJVB6XO3WxEzBuj0zhCV8jov3b/cPAuBxa3ONhZmPORCLs87xz
	blWbg4x8kvZ2oqj50+nyqsXV3j6jxk1f/kXy2kfBNJNv1kixTC20NcwZRPUfNhaxPlrY
	WElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type;
	bh=E4GMAffalhT3ueDiewEoh4XSJS8vIwlKVWMC8v50suQ=;
	b=bLXkGah59hn1spbhc+McAER2/yeso06DV8tcxn4IG9Eay6xpXVxNgCQJoQRPJqViLs
	GNNp0Z0TzVaY/YTg8xf0Poc+EYPxN9SCwT6U/7Ft73EystLaOCCD/mHIvaUeyZydTjgj
	sRQcGLLolwJl0oYDaTJ9IQ6K4OjKKLQDlh41wB5RYEdZAmn0gYlFDPkHgoAXbPh4KxSX
	QF2R872LINNEOBWWRIwR9JHHhKSygWVUiM9TfEnv+qEC04hY8lkjY/ybBlY38Rj/BN3C
	7v7hVlgV7fiOzX/ciGVpDmxt+T4E0Whrlr6RYLVQAlYRpt4mpBB3dMBbpo5AsJY2QPFm
	I+jQ==
X-Gm-Message-State: AG10YOTami4P4QTqYcP+qHSvX+hLviHRn1ykfylPfHqMeWQJEt/1Af4kUPgkRIuv5oeAmA==
X-Received: by 10.129.74.69 with SMTP id x66mr3353748ywa.256.1454034962917;
	Thu, 28 Jan 2016 18:36:02 -0800 (PST)
Received: from doug-macbook.lan ([2601:7c0:c300:dad6:1836:375a:737c:ebf7])
	by smtp.googlemail.com with ESMTPSA id
	w82sm10709600ywc.29.2016.01.28.18.36.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jan 2016 18:36:01 -0800 (PST)
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <56AA7638.2070204@cardoe.com>
	<CADkTA4N-7sJos=VrMmXP_qKAtvUDXA6fbvhq7_YyrX_c=fXQgw@mail.gmail.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <56AAD00D.2010708@cardoe.com>
Date: Thu, 28 Jan 2016 20:35:57 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CADkTA4N-7sJos=VrMmXP_qKAtvUDXA6fbvhq7_YyrX_c=fXQgw@mail.gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: jethro branch?
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
X-List-Received-Date: Fri, 29 Jan 2016 02:36:06 -0000
X-Groupsio-MsgNum: 1729
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="JpAEEkVefppjnXbeOJuUMciEStaMVVNRr"

--JpAEEkVefppjnXbeOJuUMciEStaMVVNRr
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 1/28/16 6:25 PM, Bruce Ashfield wrote:
>=20
>=20
> On Thu, Jan 28, 2016 at 3:12 PM, Doug Goldstein <cardoe@cardoe.com
> <mailto:cardoe@cardoe.com>> wrote:
>=20
>     Hi all,
>=20
>     With the addition of the linux-yocto_4.4.bbappend, master no longer=

>     works with jethro. Could we land the Xen patches I proposed and the=
n
>     create a jethro branch and drop linux-yocto_4.4.bbappend from that
>     branch?
>=20
>=20
> I actually have a jethro branch prep'd already. Once I've merged the pe=
nding
> changes to master, I'll cherry pick them to the jethro and push both
> branches.
>=20
> Bruce

Thanks Bruce.

--=20
Doug Goldstein


--JpAEEkVefppjnXbeOJuUMciEStaMVVNRr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJWqtAQXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUbJMP/2bXvVDC0JBBbYM5jtUMxvrz
t6NLZ1y61NBvraSkozpBNPAqDmF0n5QQslgF/aJfXKj58v9cjl14qUaz9zE47R5z
yGKpIbKCG69epDZPZ8MB44mj5chPtMPyVCSEyZpWq3/zqVjcNfsOqYQsH4g46/e4
ZMytcReouYv/eE9skJllVOrgxIxq7Z9sHFY6vJUBzv0V90jajmhgq9v+F+LD6UO1
1gLXJj/AvN24ApPvF6NaIpFk7wHI7REXvsQ9T9aK+FAEqIBOHLeloiYyS867gnQK
6SmM1NtYlLuMEA77knIVq3b7ubjuMaunyT2lA5E4fXT2vWtGfRyanH62NwgZrEar
rQWjE4KcLALzQNNdLMgHjAsUdjWoljD+Ib10N5grYorgwAmFcOUy8eERoFm99eny
FWsB++Clff6z18CahrbWI+nvwP9ILGqLKtDqM+l+GJYh7HCcawZPplfNs0PRbm1O
0+KdrKfH8lTL87ucYjVF8kg4Jya9t+q7GZbEya1l3xvyKZhqyG0J8DDwJeU/2O0V
68KD48Qen1edhaYRCjP7uYsGqf1xC5lil02KiFWCWC4akPoNqlLloxrp9pJT5MGA
UrzK9BSb0ISmN9iBB2ug+8Sz1+Tto+2r02zQlbdx+cK58+hOh3eVgFTmtTy5j4g3
VlbAuKPCukNgHuY1bis8
=0ey+
-----END PGP SIGNATURE-----

--JpAEEkVefppjnXbeOJuUMciEStaMVVNRr--
