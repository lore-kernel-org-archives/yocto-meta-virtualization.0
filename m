Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 77DB2E00A7D; Mon, 18 Jan 2016 08:07:48 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.169 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E3547E008A5
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Jan 2016 08:07:42 -0800 (PST)
Received: by mail-yk0-f169.google.com with SMTP id v14so524102543ykd.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Jan 2016 08:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type;
	bh=D3wC7TAOj8E2Enf4sm4cd/Sk8h3GUeRkzW0nZ6pR8Lw=;
	b=1CAv1xXQt8Oo8E+e+WBBsiAki3YfzvQ6eA+0/b0JdVuwXdL2tVqG5d32UEBNvCLK8n
	71zGg2cALRk7/HNRQq29KEp8pxFDdESDVPpVCox2wGH50HhqtIF2JWDKawu8+gheHdEp
	P6jc/TIy/3FZMde5t7kTIoshrAlc/2sPRQaEo6yIzaz23XMsT7vCJ+C1/UatnhsS2XVW
	zJMYOkPmVN1s+5iVQBssOirm3AUwX8cOPZMLglvXYIpeWLORi6tk0BODCIedCPO+JoxQ
	pryIFAuxR01Z8XSZcEGgk9HT6H7faX2sCQIBKiLNB/0C7tAagCl+MxeYE94qD8njN0Tr
	MkAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type;
	bh=D3wC7TAOj8E2Enf4sm4cd/Sk8h3GUeRkzW0nZ6pR8Lw=;
	b=i/zIIDeyusOxXiCQgAO37A7pYTtfncsGbPBkWV5YpEsQBjo7OnF/jU+3j0zKNipDik
	C4/OiYQWyT282LNoYALz+lg0Ox1fT/ADNL5nnJxYUmmvDsTnkzC+lmUUd50Qbn/wGgDu
	yYzcHKlMM1l9a7WMS66pbg+9ZgyHxHt4vjBRpqOFYDep4eCh0Y2oQNXqrtMRT0Xbttj9
	UlQ0IcVKHL4EDMVQTfOdzLynAhR0W4mT+Gmhru9d0nKZ6yHeFQFvCiLoDH4w3WrkyJmu
	7sjMzw6oCJ7cH4OHwlZE4+ay9Z5tJFd+18UJyaB2OKVLfQp29COUxXboYtAWGh9m8wRp
	584A==
X-Gm-Message-State: ALoCoQkctT760THSK5rEaUEhg+gkkJ3/GZKrqOzTnzA/HhbaHRdjZZ62UPt0Eo6VotpMGZbMLepQFmbSK8JCF3O9QO9zyqhAqg==
X-Received: by 10.37.231.146 with SMTP id e140mr5127075ybh.124.1453133261674; 
	Mon, 18 Jan 2016 08:07:41 -0800 (PST)
Received: from doug-macbook.lan ([2601:7c0:c300:dad6:3dcd:7ecb:2bfa:9082])
	by smtp.googlemail.com with ESMTPSA id
	p63sm18879295ywf.8.2016.01.18.08.07.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jan 2016 08:07:40 -0800 (PST)
To: akuster <akuster@mvista.com>, "M. Gregory" <mbgrego@tycho.nsa.gov>,
	meta-virtualization@yoctoproject.org
References: <569962FB.8070601@tycho.nsa.gov> <56996543.9070709@mvista.com>
From: Doug Goldstein <cardoe@cardoe.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <569D0DBF.2020007@cardoe.com>
Date: Mon, 18 Jan 2016 10:07:27 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <56996543.9070709@mvista.com>
Subject: Re: Error building xen-image-minimal
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
X-List-Received-Date: Mon, 18 Jan 2016 16:07:50 -0000
X-Groupsio-MsgNum: 1687
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="qs7sPSxsd0eqKTPdJwA1ncBDUpdh3M2ap"

--qs7sPSxsd0eqKTPdJwA1ncBDUpdh3M2ap
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 1/15/16 3:31 PM, akuster wrote:
> Machon,
>=20
>=20
> On 01/15/2016 01:22 PM, M. Gregory wrote:
>> I am still new to openembedded and I have not encountered the error
>> below before. It is occurring when building the xen-image-minimal
>> recipe. I added {PN}-devd, which contains xendriverdomain, to the
>> PACKAGE variable which solved the problem. Is that the correct solutio=
n?
>> -Machon
>=20
> You might need to add something like:
>=20
> FILES_${PN}-devd +=3D "${sysconfdir}/init.d/xendriverdomain"
>=20

Yes. That change should have been merged as part of:

https://lists.yoctoproject.org/pipermail/meta-virtualization/2015-Decembe=
r/001617.html

We might have to audit the different patches and make sure everything
has landed and if not repost them.

--=20
Doug Goldstein


--qs7sPSxsd0eqKTPdJwA1ncBDUpdh3M2ap
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJWnQ3CXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUKPMP/3RfkwWBG3FQ7dZcWge02tr5
b02VuJwKy/wPPKhwCvjy8cnD4fmvAai6DeQnufVUCub10I9uUkCFZitEw2W9yEYk
IC17/CQ1U6XdFugg4m4S6Gc6f7jTD6l/k1gIdl6S784YMUE8uppf20ETK0XurHBb
tHe+ILET4kST8dlZGWX0M/Jx9kCSw1Snsw7q66aznnOdbU/aY6AH4/59xmMBEIIf
4WFNJy5eymJ9CktgwnGKKNZ6PB6yiPLK3oWTUG/Rcr1hH9hERTjhxx2nwI1ghOZZ
52u+5M7+0JyD2Zoo3Mi5ikhdMN0I6ftdvGKjylqaXKWxVPuqrWoNEdB/j+JU3n0f
/w+weZSj0joUIer8+cQIkNvlwkJAP0aGqtj4mBQ4U/zwecwEG4+lY7rIcOK3AaSO
R3Tzmskr0WsWa93BvM93PRRHRXY8qcon8PfGbJW8mDhTajmFCzkRaNgArGlv7eDR
cauICM+G+DqlR+htoqUMgriWr4eqpArGZ6AvnBpG1M8MuKhi6QulqsFiwCvZa5Z2
S46hf6jneMdyt/c5TEj8IH97/KdnaGJyBmbPO8i7kKwTPD9cWfDohxlyJVfNusF8
jaRqC8ifS9KkDpt2Kn9WjAe1ZdHY6i/pns92JgwsLy8IzSZxq4zfUigxo52jyI4P
xE59XIx4vjr/ried8nw3
=z24X
-----END PGP SIGNATURE-----

--qs7sPSxsd0eqKTPdJwA1ncBDUpdh3M2ap--
