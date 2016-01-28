Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6A0ECE00852; Thu, 28 Jan 2016 12:12:49 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.181 listed in list.dnswl.org]
Received: from mail-yk0-f181.google.com (mail-yk0-f181.google.com
	[209.85.160.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E8838E0079A
	for <meta-virtualization@yoctoproject.org>;
	Thu, 28 Jan 2016 12:12:47 -0800 (PST)
Received: by mail-yk0-f181.google.com with SMTP id r207so965671ykd.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 28 Jan 2016 12:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-type; bh=S6k6wYCn2JvnkNYVGFAPCEmT7br6ETDehkhGbSFlCvo=;
	b=OlWTRcQiutZ4aPtQSW03HIgnM8HIgcq8XwM7JB7p5O2lpf8gKNRX27M8HGeshtEtvf
	M152legJ50LN5yFP/mlyUh70+PkkXJ1OigL+bfcdbA5AMI+p2W0X/eyYNE5eIoel2y5u
	1I3J67GYDZopt6qHerE7o2gPeIKC6REpftQDl/gGTdbqXegf6FRUJkOjAIbm5MZNl5fd
	lmHf5+zglahX7WH87oOoV31wFvtDlOGYWnw7VXi8OEU5JXESjwWhCR1/9Xqzo5ovhiHH
	rYW25EzvGTOY3hc9cyLwNKeQT8owdi91aLxqd4lCwGd+86lJCVeqgsNidLfeEsAc02nz
	rKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-type;
	bh=S6k6wYCn2JvnkNYVGFAPCEmT7br6ETDehkhGbSFlCvo=;
	b=AIhfF1HQuTR+2tR93Zz7HVxBWxoe4gY2CsI+wx6cgMYp6O4Gswrfr+SgYDvOs/P002
	nJ60lOcAknCqLTZfS5p7IsoItoX9a7tzNCmcEu8NHSo97TK9R32SW1dx2VGaXAoOmBxK
	Xc5Kq0nvEp1ABm0V97YJpDodt5B7ll4ajLFo7+H5BiwRutuO/Ph6VsC/J2YMqvqh5QF5
	cY2vFXE0GdS+oT2hOk1p0COGM4uRlz7VE49ktgmzShM2LjwnypKo7MsD6jr+rtaCom6O
	Zo0OaI+sVtVMsaoi0QPG/mhbkLUJ3tIUQ+QwIkLn51AlOjnyTZsH5uIwE9QoOVjcgWTA
	laag==
X-Gm-Message-State: AG10YOQ/uXP4DVBXk9MuaGTVZOfy55XC6JNtQh//kIzc+SYksRx6rIjYLJ/I0qC3LgZk8Q==
X-Received: by 10.129.157.133 with SMTP id u127mr2544722ywg.282.1454011966995; 
	Thu, 28 Jan 2016 12:12:46 -0800 (PST)
Received: from doug-macbook.lan (c-68-34-224-206.hsd1.al.comcast.net.
	[68.34.224.206]) by smtp.googlemail.com with ESMTPSA id
	g64sm9610772ywa.27.2016.01.28.12.12.45
	for <meta-virtualization@yoctoproject.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jan 2016 12:12:45 -0800 (PST)
To: meta-virtualization@yoctoproject.org
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <56AA7638.2070204@cardoe.com>
Date: Thu, 28 Jan 2016 14:12:40 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.1
MIME-Version: 1.0
Subject: jethro branch?
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
X-List-Received-Date: Thu, 28 Jan 2016 20:12:49 -0000
X-Groupsio-MsgNum: 1726
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="KcSaD9thwq6dxU3ucUTlKiGLsNwjH4ErH"

--KcSaD9thwq6dxU3ucUTlKiGLsNwjH4ErH
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi all,

With the addition of the linux-yocto_4.4.bbappend, master no longer
works with jethro. Could we land the Xen patches I proposed and then
create a jethro branch and drop linux-yocto_4.4.bbappend from that branch=
?

--=20
Doug Goldstein


--KcSaD9thwq6dxU3ucUTlKiGLsNwjH4ErH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJWqnY6XxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUd+EP/3/NXd+CIKSWVSmpg9KecgyS
ij+XJCk7fNjVZb8bdW9DEPAlujnOjR0MaMcEdbpcyqZMbXuLGqYBtJwwlA9LBttF
zvtNGCGB7GASyu02SWyc+9sW4+vHlm5TVOOE8wVRINVO+463iuywokfUyUx/LBKu
iqS2GzDSFhAAUUeSbivLjuIliwed/Cp06dI9RDR6Biaz5VuN8mAu7n6n08lIkZOO
RqyOXlDQe29tGx6c8/+8jqmeQL9WiABE5zo8ootkzCiE9EH8IbHYeIVbGt95SKKw
Byt9yxxDZIsSRhqrY6yxrygyb7QnA9j9yGDzUZC5LOwB535lJ5qPOex4kyhoGMvE
ZwfL8S21gjC9uGenbpVDfXFLZbp3tNOmrHZkxBxz3mpiJTcTuX8MvwiM0KAJjvge
2Q9tPAedtfXB8h6rb7NIRuGA8c1S+LVC24D/hkmcweN2o7V1hn1RvwnqfEpEyXhu
b2Hal+MS2Ad9se2ndLLmmO9HyOv1cqKEXfNueKakYj2059E6x6VgBVQ8oNATXONO
madRqbc1aiJficaE1dFN/KmPlu2kBRVpQlIKRhncajgaO8/etpIMizqbgfufm16l
YY11DHbnBDL3StZN4NxApQoXANoK8KIx5nrPpnS6O/2aWyghCNB5EMQWpfqYEiOO
dqXauL9zEHozBtUn5qi6
=6Q/W
-----END PGP SIGNATURE-----

--KcSaD9thwq6dxU3ucUTlKiGLsNwjH4ErH--
