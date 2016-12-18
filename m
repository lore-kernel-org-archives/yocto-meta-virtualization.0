Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 90120E00E73; Sun, 18 Dec 2016 09:00:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.223.196 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.223.196 listed in dnsbl.sorbs.net]
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 61F90E0070F
	for <meta-virtualization@yoctoproject.org>;
	Sun, 18 Dec 2016 09:00:32 -0800 (PST)
Received: by mail-io0-f196.google.com with SMTP id p13so16919215ioi.0
	for <meta-virtualization@yoctoproject.org>;
	Sun, 18 Dec 2016 09:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=subject:references:to:from:cc:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=xEMteRWf8iE41h3oApCAqwBBTlyg1jAZ5reJ9WVmiCM=;
	b=i4AGXHN3O0MqM6hZpzpdEdQspZl4Veu/oNdtlBMrhfwX7kBkSTp225kgVJRkSa5xKx
	acmqe9e+d/cekV/xEBN8d6e+PJ3v73eIH1GyNuX5qcXfhkdDGINp7DHruFLO1lES15Bx
	d1mnfApD9HCWE8oAH7u4WFpq74LgCwxqrxyNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:references:to:from:cc:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=xEMteRWf8iE41h3oApCAqwBBTlyg1jAZ5reJ9WVmiCM=;
	b=GhKtcomlvJqCWdz5knsctVEaBEIHjo/R4Ywyb5/hoJi10IngExXs0l4VmMap2ntVN3
	Zn8afFT/NiurOfI8XGT5NGoUZPzMTzH3Girg2LfHVtqhV8zSK+dOtn5mGKbpnMZecn1F
	F8c3FvWlcg9rmIQEMOObGApNG+PjAV/aCpwsbFaK5KoeOPOOUJ8cUYahTJcr9Luq/qwd
	/hjmBnqV1B3tTCoDMEqB34oFFdBS077HJlnndOL9n0Is7p4i/QDk7JSnVzdwWwwHWNBN
	rfPuNIHRct+csKdr8q6Kg1ZQxsCXIPwQunKoRznmMo8V+bO/j/jCEbeQzET+Gor2skTL
	1kwQ==
X-Gm-Message-State: AIkVDXKZD2fEnat+W5VdCR89BN0woctflvbFX8bsPIFIue/4rlABUE7GXw/rdzk9YTH8CQ==
X-Received: by 10.107.138.142 with SMTP id c14mr11605832ioj.135.1482080432039; 
	Sun, 18 Dec 2016 09:00:32 -0800 (PST)
Received: from doug-macbook.local
	(104-179-196-18.lightspeed.brhmal.sbcglobal.net. [104.179.196.18])
	by smtp.googlemail.com with ESMTPSA id
	h17sm6750817ioh.6.2016.12.18.09.00.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Dec 2016 09:00:31 -0800 (PST)
References: <20161218164456.30100-1-cardoe@cardoe.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <194b570c-c45c-1816-9041-96eb615fdebb@cardoe.com>
Date: Sun, 18 Dec 2016 11:00:27 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20161218164456.30100-1-cardoe@cardoe.com>
Cc: Derek Straka <derek@asterius.io>
Subject: Re: [PATCH 1/3] xen: add extra generated file to package
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
X-List-Received-Date: Sun, 18 Dec 2016 17:00:36 -0000
X-Groupsio-MsgNum: 2153
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="PcIHedDWKmVP1u2amalfiBPhsh7X3C62l"

--PcIHedDWKmVP1u2amalfiBPhsh7X3C62l
Content-Type: multipart/mixed; boundary="tts8AkTWRXo16MK5ICCJF0DW6Mi1dPJa2";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: "meta-virtualization@yoctoproject.org"
 <meta-virtualization@yoctoproject.org>
Cc: Derek Straka <derek@asterius.io>,
 Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <194b570c-c45c-1816-9041-96eb615fdebb@cardoe.com>
Subject: Re: [meta-virtualization][PATCH 1/3] xen: add extra generated file to
 package
References: <20161218164456.30100-1-cardoe@cardoe.com>
In-Reply-To: <20161218164456.30100-1-cardoe@cardoe.com>

--tts8AkTWRXo16MK5ICCJF0DW6Mi1dPJa2
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 12/18/16 10:44 AM, Doug Goldstein wrote:

Bruce,

Please apply this series to morty and master please. This is to prevent
morty from getting a bit stale.

Some background on the users of meta-virtualization for Xen that I know.
Derek and I both used Xen 4.7.0 for krogoth and going forward we're
using Xen 4.8.0 (and probably 4.8.1 when it drops) for morty. The OpenXT
folks are looking to use meta-virtualization with pyro and will likely
be aiming at Xen 4.9.0 which is the same that Derek and I will be aiming
for with pyro. So I'm looking to hopefully keep the versions in
meta-virtualization more up to date so that we get more users, even if
that potentially means doing a version bump after a Yocto release drops
(e.g. morty has dropped and we're bumping the version in this series).

--=20
Doug Goldstein


--tts8AkTWRXo16MK5ICCJF0DW6Mi1dPJa2--

--PcIHedDWKmVP1u2amalfiBPhsh7X3C62l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJYVsCuXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvU8s4P/i2zB5sX6hY7FJGi1VtHSbIJ
xthl+Bbgb5aklpu2nwo5nc7H9z5vKBvZ8gcybfCqlk5LJFpIxUWnpQg5EdyihHxC
b5+89jVhi6uPCYjg9vA5iyLUcQ7/Ei8RlB2gjhPA2sqcBg/lTo0tIAXpN7sI7/3E
jS5NQySESqtS5n6s/o4EW+pVugfQHXXpNYiFjAAV0nT2fcAICYZzSLUFfVFnXWXe
ICShRQ4ZHvRKzQLdfDwrKr5CLnI25KMLMBZwt5L9qCsVh+fUApsHxKd9Iuarm/jO
Yn91rRq9250FGVBOwsNZkoeee3xdDjOrEqTU3h6jjLF2k4dGPGJHoCY3ue4TT7sm
2Onc++TmRrs8SqeSInIxGhJWUvkzCVSZcYbVciAkKJg864pFwh6XCwjDhRT6pOAe
QItrf9yl5fODPCdFbI93wurszmf3HmHj60bICiYTGum6ZBLIoO7ssg+Xeazb2yB3
hX+igMV9fJnn+baQfZnelfmJl8SsGH3YYonbiqiIsMPmElARnNd6VXDViMUpXCvQ
AqnBcoYW61U9UO53kJKIW8GPOVIkAgZUSKE7ddSnYd1Nh3dgGV0urFpV0idNi+If
bzTh/iFx4uI92aovrdIpcaoph1pnAPnYWeEuvus2R9OinNj/D/zC6LwCfuO2bS9E
zzU8mXEBLkY7UBDCV8ke
=YqSv
-----END PGP SIGNATURE-----

--PcIHedDWKmVP1u2amalfiBPhsh7X3C62l--
