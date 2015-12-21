Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 05EFCE00C2D; Mon, 21 Dec 2015 14:46:17 -0800 (PST)
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
	*      [209.85.160.180 listed in list.dnswl.org]
Received: from mail-yk0-f180.google.com (mail-yk0-f180.google.com
	[209.85.160.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5BEDE00A9C
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Dec 2015 14:46:11 -0800 (PST)
Received: by mail-yk0-f180.google.com with SMTP id v6so145817651ykc.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Dec 2015 14:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cardoe-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type;
	bh=HYRdcRs55TQ2FyaU5wZZuaEgiWZvfF/AiD2ugtyVLgE=;
	b=ItWhxKqoSdC9SEEWJuWQ5sLo8O1uVzWl3gWB5V1W+3JHNRKsFUWYvkQBADyAteZXWJ
	pPTlCRTi+ZFMfWiUJhStASrPQdug/Zko990+TF1N1pbJjMoj5FYPbrCTSlGBXWviPNd5
	ikb+z2IB5EdSr0AnVf+bUKU0yOwPoA2aKqxizyGMpaDeDbLSXLaEaMiMalLCgK5Bl7ya
	H0zq25m5vmU4t0EwVQC2TmqmXOB6ogfSmR0fgN1RPJbDwHji/EgyRdlo3RpE2zNz3MXx
	Wrh83TDxEMMV0OwqbPMS6OOZmS20aK1aeMfZqjW/bkPlrZjYwtLCIaFxzm3kK9fayg1Q
	GlvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type;
	bh=HYRdcRs55TQ2FyaU5wZZuaEgiWZvfF/AiD2ugtyVLgE=;
	b=ik3796VHeZYkF2xzkLtOtLRZgFQaxUOg/hteIb3k1/VX76A0Mfuv83m28u146usnvy
	pl99DWkfPc2oUZORQEh5O3SZjnDhAp3JD4UAU2Yqhoh3anxdjxjhCChJvcy/rJTGZqef
	UDuPc5UaW1vb/IAFogfHiDfVTxPe2xWImG8yDwK8LbUuJdcJ49IiwqQAIq0UjOKBkfYa
	QzGEKy+ktmbwR+BMWj8Kmw4beUHBlkTpj2nHTfE6N5ZCe6oQh3vl8aPAwLw8aT5nryBe
	kIiv80A5tfTYVh4apw+u8Axy1rPbR/XT2MdcDqOdSaSz/Y/S3cTmkNtxvmrUTXh/xhGG
	w4Ng==
X-Gm-Message-State: ALoCoQkeFt3DaswaVeJ8Wgab9P7lZy2rqMtf3LzRKbimIiAIFSL83CqPRN1T1eXafFCh5Ee2BkrH89wq45AYMIrwGA5Jep1sWQ==
X-Received: by 10.13.198.199 with SMTP id i190mr16494002ywd.255.1450737970559; 
	Mon, 21 Dec 2015 14:46:10 -0800 (PST)
Received: from doug-macbook.lan ([2601:7c0:c300:dad6:7401:bb32:67d6:197e])
	by smtp.googlemail.com with ESMTPSA id
	e67sm30852678ywf.15.2015.12.21.14.46.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Dec 2015 14:46:09 -0800 (PST)
To: "M. Gregory" <mbgrego@tycho.nsa.gov>, meta-virtualization@yoctoproject.org
References: <56785AAC.5020807@tycho.nsa.gov>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <5678812E.1080008@cardoe.com>
Date: Mon, 21 Dec 2015 16:46:06 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <56785AAC.5020807@tycho.nsa.gov>
Subject: Re: [RFC] Separate Xen toolstack from hypervisor
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
X-List-Received-Date: Mon, 21 Dec 2015 22:46:17 -0000
X-Groupsio-MsgNum: 1597
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="F7LnPAspS42VSFcsQXt3OK7feGKqLmEno"

--F7LnPAspS42VSFcsQXt3OK7feGKqLmEno
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 12/21/15 2:01 PM, M. Gregory wrote:
> Xen supports a variety of toolstacks, xl, libvirt, and xapi. Would it b=
e
> acceptable to the meta-virtualization community to divide the Xen recip=
e
> into two separate recipes, one for the hypervisor and one for currently=

> supported xl toolstack? With the possibility of including a xapi recipe=

> in the future?
>=20
> -Machon
>=20

You can already do this. Just install "xen-hypervisor" instead of
"xen-base". xen-base is a fat package that includes all the other
components.

Just make a receipe for xapi and make it depend on the libraries you
need from the xen package which are all in their own packages as well.

--=20
Doug Goldstein


--F7LnPAspS42VSFcsQXt3OK7feGKqLmEno
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJWeIEwXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUCRwP/RZV004YKb9dLSEBEq2bfidM
o1LKV4uePrM4Y6xQgktAzwHuKAFVUaZSIjkl+TzzKGm9ujxU0L7XMucD3dWWO2le
FsovAz0oTWAkq8l5Q9M+qBhVB3s3S1fXglmsuO3gujAASz+yB7ejVdzjUa/FyJVv
+Ub12YG9ouakeO0uwKVrqFNDQ4jAyRYoRFPH3IRzPvHnG878E+jHtHdjCiopTgMh
hbWY+OXPdbK3I01IVkkJowrbOjUHY+pjJXMYkqmCvdIgWIRhxWJDyil/GS9zlWVr
iEbFTUI5oXBQOG/vJVvxmrT6WRrXQMvrvmpWtSYDvU13zqyzhQFX4vZWf3g8vsIb
rEdrvP12YFrH+7ZJURdy1XbFyTlfLXbwFSDbIu9OYnagDHjcAGOSsMGodcXQ5JgP
MxlcnlSBrhCAl630jyZuQdi8zncH8En1YDEO1qhtjigk5vHhagVlitgiRKQ2rrvq
GqCt2NMDljd+EGC7a5WA2C8rydOBNjIlnrohKuJQHML5NqCLk622jp+es1AMq8CV
CNHnoQdPWlBWuV1ylQ5YGeEryjW6jncXQfBMd4aeER9C+eFH69YGGm8UOnN3Ocy2
Qykcw8c3FBRSV22MPi5OuTj8Ni7m+k1Qv7m2oZCl9rThZiH63gxqx7vpztzi/HZD
LvYd1aDUBTHwqjfxs1zo
=C8S2
-----END PGP SIGNATURE-----

--F7LnPAspS42VSFcsQXt3OK7feGKqLmEno--
