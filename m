Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A04B3E00B70; Tue, 22 Dec 2015 06:27:02 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.172 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 204B1E00457
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Dec 2015 06:27:00 -0800 (PST)
Received: by mail-yk0-f172.google.com with SMTP id p130so165002812yka.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Dec 2015 06:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type;
	bh=DowilD/86uE0jpoL7RSYynqQrmT41wwbmT7O6NhAoGA=;
	b=dpNhCuMkNVchy1ONoTehnn5eaHKBxevHSqec9Q0rRS2/JSastEVWbETo2LWFjf64OO
	p9jOp9jhglFCBHJ2UU+cALaoiNu7qMtfo3Pi0dB/l+51Hee75W0GAsA5M6Mt3BaR5fm0
	/Rh41TabX/T/61H9fCDh//05GJekZj9iA4PBL+wTNVphxMMbDV3qf7SRUt15nSyYpWRy
	78GrT1cV4b/e4CaQS87pDdFitXsZ5YBt9SlbyZhdiu8niB7P6DXexPPYTply/4sbiR1F
	HpuKhKUxMexmXnSM1MfhY21liqGLdb+94JjMuGyNM9Zm8jxt0e3NIqECmw76N/X09o50
	WThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type;
	bh=DowilD/86uE0jpoL7RSYynqQrmT41wwbmT7O6NhAoGA=;
	b=WvI0wFf7WV96NNu/GAEYrx+O9DCJb7dItga89QEAsh7fIRlc5ifqWs/N1gU7kkIoth
	cps+iPJYaTYNFQix6BuXQKaVPhTyuju7v8tKt5hEPiuNWtdfryh3TivAgMG4JiE/BV8C
	cLQMRMpjPZmlSu16KPVAnDtQkyBY6SwnWiM7I4WFnqGx4TwTq6b1iYtEWjYCzq52+BWG
	WsO+9ySmqem66zX6O0kGrE9DZ8HKpRYiWCYblmy9fZTcPNyA5jokRIYl6aBQkKqnt4dq
	TSPiHpPeANmTJCFzo5XxNlvkALhN1QS8SKRrL9pw0q679BEgHCx0prsz+6lrRd9cNq+j
	eXGQ==
X-Gm-Message-State: ALoCoQnFgH7PSgvnqsPXK+EwP/YTbBgkTfsymB6MFaNAxk8abbvActJ9Szv/of6ueVS1BOM6RRvDCdzp41qyDUqkbhwk7rQknw==
X-Received: by 10.129.93.133 with SMTP id r127mr19364008ywb.109.1450794420181; 
	Tue, 22 Dec 2015 06:27:00 -0800 (PST)
Received: from doug-macbook.lan (c-68-34-224-206.hsd1.al.comcast.net.
	[68.34.224.206]) by smtp.googlemail.com with ESMTPSA id
	u125sm32952213ywa.54.2015.12.22.06.26.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Dec 2015 06:26:59 -0800 (PST)
To: Chris Patterson <cjp256@gmail.com>
References: <1450747435-5738-1-git-send-email-cjp256@gmail.com>
	<1450747435-5738-3-git-send-email-cjp256@gmail.com>
	<5678E434.10100@cardoe.com>
	<CABZSBQeA6WU4bsJqhVAkJ1+tQQL1zYCmXhvc5L+HXKTzkfjJ2A@mail.gmail.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <56795DB2.1000406@cardoe.com>
Date: Tue, 22 Dec 2015 08:26:58 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CABZSBQeA6WU4bsJqhVAkJ1+tQQL1zYCmXhvc5L+HXKTzkfjJ2A@mail.gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 3/4] xen: uprev to 4.6.0
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
X-List-Received-Date: Tue, 22 Dec 2015 14:27:02 -0000
X-Groupsio-MsgNum: 1609
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="7TrHsU2fJNAQ5qwUWmwU43wku8aI9Vecn"

--7TrHsU2fJNAQ5qwUWmwU43wku8aI9Vecn
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/22/15 7:35 AM, Chris Patterson wrote:
> On Tue, Dec 22, 2015 at 12:48 AM, Doug Goldstein <cardoe@cardoe.com> wr=
ote:
>>
>>
>> The dependency updates here aren't actually correct. You've dropped th=
e
>> udev rules but failed to capture the devd bits.
>>
>=20
> Yes, you are right.  I compared the list of systemd services and
> failed to do the same for the init scripts (which added
> xendriverdomain).
>=20
> I'll add xendriverdomain to v2, then afterwards provide add an
> equivalent systemd service (as there is no upstream unit).
>=20

Please submit the systemd service upstream if you would. That's been on
my TODO list to do for a while.

--=20
Doug Goldstein


--7TrHsU2fJNAQ5qwUWmwU43wku8aI9Vecn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJWeV2zXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUqUEP/0JKuC1cfnJkR/RkcE1MmO9E
RKYgNa775jnV58qUx3bWINH7Q5101Qv8dcpAePrYtNgsqqU+j8XeNbAlSOOVszdn
azvd4ls8Fmg9I6WndFWlYBysLkiEDC0DC3UKGjUS6FqcBsttPoJNf4wgfUW96MEP
2sX7ENJgOEnJCsKAyHFh8Z5KH7f9UjP07NueQ3BcIoOI8M1uozuNpccysput4n0i
8l70DBe8jYI2xl8oVK64aL3YxuGCUiHy6vH1wWAdbrIPzuEhQnGCFG7BmqwGfurF
zparnF1UJ8Bnf9gsQcZJLJ9iO0Lwa7I979YpaiMECIMVXHCgNfPeBmlV+f9bAUUV
nIQXBIS0yDol55MelmLKT3GO3uH7cY59i4FdHK6NNcxGgidqNWyYMvzwrICvbtHW
Q+IClJSsPHOx86brX7y+pPbirUX4EVqlZX6FOMrvHqKJaYNSTqGvEvdenZyNzjry
1gqsdSLUB2PRGG66XkpyK3JVl6iLzbddsDD6bb6ztOpn6BBIeAtULuFsNbwql1mh
cFW9PG8J5rYiyCaf5XgcRzRvr3zzIJlWFx3VJXLVBLafj73eczkOdEC82hAu2GkV
XIanKSYJR7unyySIOIA0E9Ghjwi0m0ygzNzdbB6N9pvYmwmfp0+vDWdNYn/ioayX
uUYCLvlElFbBl+8fBqBm
=AA+S
-----END PGP SIGNATURE-----

--7TrHsU2fJNAQ5qwUWmwU43wku8aI9Vecn--
