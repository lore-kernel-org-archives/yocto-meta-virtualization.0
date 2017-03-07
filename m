Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A442BE00519; Mon,  6 Mar 2017 16:22:46 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.194 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.194 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2A8FEE0033D
	for <meta-virtualization@yoctoproject.org>;
	Mon,  6 Mar 2017 16:22:45 -0800 (PST)
Received: by mail-yw0-f194.google.com with SMTP id h11so10194ywa.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 06 Mar 2017 16:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=Qe1E+T7I7PfjZ8Wqk3Xft+Si0Ib0Q/JdtGznG+EKlJ8=;
	b=KpEQ6Gyh4hhck9Gz4MBUna33E/fP47bPHfaOrcBgOOjof6V/W9IF74zKFk2WMtYiS4
	XXL48YAII5Aq7hn1VbXJaq7kmy9xyVKqkpnlwy70EWYbfsGod7tHa8xeaHA8Sp9VEKBG
	7Qu+eDdGdZv+zml+ZE0srzDci5rk5e94EW6cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=Qe1E+T7I7PfjZ8Wqk3Xft+Si0Ib0Q/JdtGznG+EKlJ8=;
	b=Ve6KSM9XNj+H/R5v0arpPenvmPeA2z6D/pfqJwy2mMeBo4ClxKUs/YWwDSmuLc7c7i
	0hPagMZ9LEv7EnAuTvBKDkMwS2+4nUdV/lyhW6klDf1G66AQHaSqM8KwL5+km1Z8uEWK
	PsS3BR3maVxnIFUXryGhnLUHctihztqXMZRcqc2L43SIJ62KNUZyIODhVWguxmElOvYl
	QYjrX3TA4aoaoJTYHAbzPeKds/kERo126EUZzDPMQ6wM83Fa4jpg6bfEisquQ7gljMxs
	VdOAvnJhnQk1XfV5cXseTUGv9hyNZ5JHjbUQAsfAP6n+iEioRRBLfxCYQrXca7vzE0+Z
	aSqw==
X-Gm-Message-State: AMke39np2QPwG4VUrLY10JNsnEnC3FchwW1H2++zv/FJDIQnFNPJtaR61IlptfFmtWf3sg==
X-Received: by 10.37.39.202 with SMTP id n193mr7704734ybn.127.1488846164590;
	Mon, 06 Mar 2017 16:22:44 -0800 (PST)
Received: from doug-macbook.local
	(104-179-196-18.lightspeed.brhmal.sbcglobal.net. [104.179.196.18])
	by smtp.googlemail.com with ESMTPSA id
	d11sm8449066ywc.22.2017.03.06.16.22.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Mar 2017 16:22:44 -0800 (PST)
To: Pello Heriz <pello.heriz@alumni.mondragon.edu>,
	meta-xilinx@yoctoproject.org, meta-virtualization@yoctoproject.org,
	meta-xilinx-request@yoctoproject.org
References: <CAFL6qn47o85GDVoJeVMB62tpcug-=1nysU+OvWVMseS+3_Qpfg@mail.gmail.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <c8089081-78ef-0885-74a8-57da4c134788@cardoe.com>
Date: Mon, 6 Mar 2017 18:22:41 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <CAFL6qn47o85GDVoJeVMB62tpcug-=1nysU+OvWVMseS+3_Qpfg@mail.gmail.com>
Subject: Re: Building xen image on yocto
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
X-List-Received-Date: Tue, 07 Mar 2017 00:22:46 -0000
X-Groupsio-MsgNum: 2462
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="nuqDU0hSaPePbWtixfBHQAs7h7whioMul"

--nuqDU0hSaPePbWtixfBHQAs7h7whioMul
Content-Type: multipart/mixed; boundary="koRgijsK7lQev7BhhTefU0E4lvHfErmc1";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: Pello Heriz <pello.heriz@alumni.mondragon.edu>,
 meta-xilinx@yoctoproject.org, meta-virtualization@yoctoproject.org,
 meta-xilinx-request@yoctoproject.org
Message-ID: <c8089081-78ef-0885-74a8-57da4c134788@cardoe.com>
Subject: Re: [meta-virtualization] Building xen image on yocto
References: <CAFL6qn47o85GDVoJeVMB62tpcug-=1nysU+OvWVMseS+3_Qpfg@mail.gmail.com>
In-Reply-To: <CAFL6qn47o85GDVoJeVMB62tpcug-=1nysU+OvWVMseS+3_Qpfg@mail.gmail.com>

--koRgijsK7lQev7BhhTefU0E4lvHfErmc1
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 3/6/17 4:23 AM, Pello Heriz wrote:
> Hi,
>=20
> I have read that I need to include "xen" in the DISTRO_FEATURES
> variable, is this necessary at all? If it is, where can I add this to m=
y
> project?
>=20
> Thanks,
>=20
>=20

So that's a pretty fundamental question when working with Yocto. I would
recommend reading through the Quick Start Guide [1] and then refer to
the Reference Manual [2] for more info about DISTRO_FEATURES.

[1]
http://www.yoctoproject.org/docs/2.2.1/yocto-project-qs/yocto-project-qs.=
html
[2]
https://www.yoctoproject.org/docs/2.2.1/ref-manual/ref-manual.html#ref-fe=
atures-distro

--=20
Doug Goldstein


--koRgijsK7lQev7BhhTefU0E4lvHfErmc1--

--nuqDU0hSaPePbWtixfBHQAs7h7whioMul
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJYvf1SXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUcbsP/1W1fOXWihokqEzslrWsP20o
xkHrPvv75wou7KZttXRIKy7mKa7m42XlJ4h6cCKq6UliIzZmw5XIjJSGmBQdww0B
NYGvB4dxLEao7NPfO6Yysg2b4OFqJ0yDbzh2oK8vizdaORDntAu3556iv8sRsvSo
KhiI5dqhvTcqivYv4GeucHEe87MvNml1WJjtV8ZavkIuEJqYSe8y0oGANxqii/FB
uFt4x2wKxdUAoAR29MLxfy4C3QjiaXl2k288e7o4MClvVpp3hFsfSr2NiOX/vTmc
EO7HRs5Yqtxh2MbFbgQmIYPR5v7ENSRSXNyVYSGPmkuPkfOHX/MJstK5nJw+NoZs
Qjf5H7jAKn+MxBjkZbQqAGjU4pJTjC2ttB/jsTq1HrxzEPfFmqr1hUCizjqTBXOO
uiZYydpiVOaL+DOWSRJQs42PAgVYlY59jU6vL/SefLBG5lKISKTCiNwzK8i/nOZW
KgyGrRvzBibGlW/teoCKipkBwptz1/dvPtqIxH/V0a5LDqPFbQkToevtypPUylNU
gq6NRt203tevqjORv8nhHGEjGNvF+lxbFli0KC72p0bH+geNj/5shWMdLLaXOs1w
NasSmPraOMqNVrsuG4yLgknSXGt9vLjGbwh8VqiRt9GaIDc2GerEv5dsJw3g3nTi
bdr1G+ZuPGtIdzOHoWGp
=XP31
-----END PGP SIGNATURE-----

--nuqDU0hSaPePbWtixfBHQAs7h7whioMul--
