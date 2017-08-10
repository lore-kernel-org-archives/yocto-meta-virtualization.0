Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 21C25E00C09; Thu, 10 Aug 2017 11:33:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.216.196 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.196 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 145E9E00B8B
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 Aug 2017 11:33:33 -0700 (PDT)
Received: by mail-qt0-f196.google.com with SMTP id i19so1554333qte.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 Aug 2017 11:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=mvelvFKAxwWDkDuvS3m141wbwv//edpszJqkf3bBp98=;
	b=Df3mNl5Kq8AGn4c0NNGTV3yS3iTYeInTw9XrlY37+uYte6cLVkgw3E0UhGtYkk7N3v
	RW/Q5a9aM8Assv+WsMo4t6dEOtAuuUZ67cb6JiUBbrBCj++4vn+RNzegLp6ROaJT8Jbf
	VSlYp+R1wrqsZGPNbKg7abhVjTEZ3BagixzLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to;
	bh=mvelvFKAxwWDkDuvS3m141wbwv//edpszJqkf3bBp98=;
	b=jMw0I6CJTMiahYCuqLbdPhfc/rBCCcnqf8qSlOzZvMyDE+FbSHnEfnIWyNtPLxuO61
	LQPIQJau/57KomoAOOwVQzjJXFrumGWBla8h97k1tK78VAhcpK+NO74qYpRW/UpimqIX
	SxAQdJirZu7cA0PRv6QTJa4z3AWXIWTaMAa6Z4Z5G/ncd/a2dv5ZYOmIfdvLyn3BU0Hh
	IYwy4OntWyPUATNFe7aKk1tgA3+l+aHuLpa1OrBlUAFTSprZNMeHAs9HK1enodWsDavd
	9PMQNcSfT5cjNF9gWigymZvVABC8e9MsqLMPfOYLCrOhaGwmP+fHoNurn+SohNpmXtR9
	H1tA==
X-Gm-Message-State: AHYfb5jratZlxICab40P1LnZc3dZlhNf50Rw6BK3L5sV6KCBgHvmHxJk
	LuJFGM7LOtbTYJy48Y/mvA==
X-Received: by 10.200.54.210 with SMTP id b18mr18522716qtc.145.1502390013001; 
	Thu, 10 Aug 2017 11:33:33 -0700 (PDT)
Received: from doug-macbook.local
	(104-179-196-18.lightspeed.brhmal.sbcglobal.net. [104.179.196.18])
	by smtp.googlemail.com with ESMTPSA id
	f6sm4064847qtb.69.2017.08.10.11.33.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Aug 2017 11:33:32 -0700 (PDT)
Sender: Doug Goldstein <cardoe@cardoe.com>
To: christopher.w.clark@gmail.com, meta-virtualization@yoctoproject.org
References: <1502328524-4230-1-git-send-email-christopher.w.clark@gmail.com>
From: Doug Goldstein <cardoe@gentoo.org>
Message-ID: <eeb8f15b-bc35-022a-078f-0fb4ba8cb389@gentoo.org>
Date: Thu, 10 Aug 2017 13:33:25 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1502328524-4230-1-git-send-email-christopher.w.clark@gmail.com>
Subject: Re: [PATCH 0/3] xen: Add Xen recipe for 4.9.0
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
X-List-Received-Date: Thu, 10 Aug 2017 18:33:35 -0000
X-Groupsio-MsgNum: 2695
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="qcBDq2HGKqKd398e2dQHT7RX0DwKWOQGJ"

--qcBDq2HGKqKd398e2dQHT7RX0DwKWOQGJ
Content-Type: multipart/mixed; boundary="G0085eTMKHGN5fHehQdb5jk1RcUswu140";
 protected-headers="v1"
From: Doug Goldstein <cardoe@gentoo.org>
To: christopher.w.clark@gmail.com, meta-virtualization@yoctoproject.org
Message-ID: <eeb8f15b-bc35-022a-078f-0fb4ba8cb389@gentoo.org>
Subject: Re: [PATCH 0/3] xen: Add Xen recipe for 4.9.0
References: <1502328524-4230-1-git-send-email-christopher.w.clark@gmail.com>
In-Reply-To: <1502328524-4230-1-git-send-email-christopher.w.clark@gmail.com>

--G0085eTMKHGN5fHehQdb5jk1RcUswu140
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 8/9/17 8:28 PM, christopher.w.clark@gmail.com wrote:
> From: Christopher Clark <christopher.w.clark@gmail.com>
>=20
> Add recipe for Xen 4.9.0 and update xen.inc to package new items.
>=20
> Christopher Clark (3):
>   xen: Package libxendevicemodel, introduced in Xen 4.9
>   xen: Package .pc packageconfig files into dev packages
>   xen: add recipe for Xen 4.9.0
>=20
>  recipes-extended/xen/xen.inc      | 78 +++++++++++++++++++++++++++++++=
+-------
>  recipes-extended/xen/xen_4.9.0.bb | 10 +++++
>  2 files changed, 74 insertions(+), 14 deletions(-)
>  create mode 100644 recipes-extended/xen/xen_4.9.0.bb
>=20

ACK to this series. We can drop the existing xen 4.8 recipe with the 3rd
commit and just keep 4.9.0 in master.

--=20
Doug Goldstein


--G0085eTMKHGN5fHehQdb5jk1RcUswu140--

--qcBDq2HGKqKd398e2dQHT7RX0DwKWOQGJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQF8BAEBCgBmBQJZjKb5XxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXQ1M0I3MDI5Qzk4NzZGNjVFNkVBQjgwM0M2
QzRFNjIwNDMxQzk5ODBEAAoJEGxOYgQxyZgN72QIAIgcdQf/tu3LJT8o1rxOxXgk
KkKY71cR/iIW6elkZoMeFwa0GgErOK1brTzVjerjVc/k3nML8jG7zOOnmR2kt/pN
EiEN+rjWp7qACcRbA77lVYTD6kB5EGrXKOqwRnIyzwqPHXydyNL9Jmy9c3kOK7tZ
sPLoVPM35b9ChF6+77rLDTIOB5iEZMOUxSuPzgRUqo6g9xdxdt5eEu6scRDqOKEo
o3YiwSfuD2d+aDaZKnc0oOxOzLZ2nDdyq4QY2wAzzCk/lMRN860fmB3Q6Xn2nBP2
9KKVSXP2UTCRWOX73Hf2mijUBfMaJF/+yLMGsooQ0fymNLYGnww149GWOnzD5uo=
=iHxp
-----END PGP SIGNATURE-----

--qcBDq2HGKqKd398e2dQHT7RX0DwKWOQGJ--
