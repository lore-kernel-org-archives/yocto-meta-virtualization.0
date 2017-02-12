Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 78574E009B2; Sun, 12 Feb 2017 14:28:40 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C7C4FE0049D
	for <meta-virtualization@yoctoproject.org>;
	Sun, 12 Feb 2017 14:28:39 -0800 (PST)
Received: by mail-yw0-f194.google.com with SMTP id l16so6042112ywb.2
	for <meta-virtualization@yoctoproject.org>;
	Sun, 12 Feb 2017 14:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=gfHJcQ2+nD3S9ts0q95+7l7RlLHcr+huC1Vg5A8hLAA=;
	b=dDbd3IP4REB0/ulJDdcJXrPrT0PJxlnlN3hXOpJQh6KZK8OVAk74hZ+PmgOTTnym/F
	TETS/cyPaVKIwFqWetQtVXYmSz7K/NXwlwh+MqgnkGoycurJeTzZjU7JjjRKIDYyjJ2x
	wQmyBDb/2gI+ES9vRImvgQKTu9qIB8SWMUYIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=gfHJcQ2+nD3S9ts0q95+7l7RlLHcr+huC1Vg5A8hLAA=;
	b=oN1DVK21wwMxNywFCCnLMdUneuP6HglIAW++DiK1I3k986qLS/0v83hhJpU9qKJu3+
	JQcDGbp5mCYUGBR/WGboGNstjn+IfYAVzYNhJ8vkG5GscnDQaIyQ5YOX8suCULBXg04b
	eCS8qBtwy+9b2e2XPUAgvvvT8xbvN9HdszIbc5TC1Hc0Rmec2ZoDLLMHxyXwsKjBRUp4
	q+7eUhNK54/3rVxzTi5/xS9+m8Dd00t3Aw/Z9+/MAoXz23mWvuu3KHKWkd9PDm/Zq6vk
	/6JEWIPFoUjhnXtt3l4tOuo8Nw8UYPVIm4S/7xj5bghSwW4KCnsy7IgyttyURW8GODFL
	xYjA==
X-Gm-Message-State: AMke39lklC3WgV1Usd7UwCEzHa3sFHb1A1ag1dF+4I117MYHDhkr7ZmVqOCGxBN2I35LUA==
X-Received: by 10.129.132.77 with SMTP id u74mr14461358ywf.125.1486938518495; 
	Sun, 12 Feb 2017 14:28:38 -0800 (PST)
Received: from [192.168.1.73] (104-179-196-18.lightspeed.brhmal.sbcglobal.net.
	[104.179.196.18]) by smtp.googlemail.com with ESMTPSA id
	b3sm2622879ywb.77.2017.02.12.14.28.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 12 Feb 2017 14:28:37 -0800 (PST)
To: meta-virtualization@yoctoproject.org, nitish jha <nitishjha16@gmail.com>
References: <CABh+foZ_SRHRa8Q296ESxS4Woj0AcoBbWSmuSJ=Z=W_Sy3raDQ@mail.gmail.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <a88bb8cc-1232-6493-fbd2-7020cc373df9@cardoe.com>
Date: Sun, 12 Feb 2017 16:28:32 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <CABh+foZ_SRHRa8Q296ESxS4Woj0AcoBbWSmuSJ=Z=W_Sy3raDQ@mail.gmail.com>
Subject: Re: Error Building xen-image-minimal
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
X-List-Received-Date: Sun, 12 Feb 2017 22:28:40 -0000
X-Groupsio-MsgNum: 2442
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="fbN2HcjmfRkCG5AAdBTcsgRUX3O9fTxIH"

--fbN2HcjmfRkCG5AAdBTcsgRUX3O9fTxIH
Content-Type: multipart/mixed; boundary="77eTsxrQxuLMpoBlPiKk9SOCL5hv3f3NU";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: meta-virtualization@yoctoproject.org, nitish jha <nitishjha16@gmail.com>
Message-ID: <a88bb8cc-1232-6493-fbd2-7020cc373df9@cardoe.com>
Subject: Re: [meta-virtualization] Error Building xen-image-minimal
References: <CABh+foZ_SRHRa8Q296ESxS4Woj0AcoBbWSmuSJ=Z=W_Sy3raDQ@mail.gmail.com>
In-Reply-To: <CABh+foZ_SRHRa8Q296ESxS4Woj0AcoBbWSmuSJ=Z=W_Sy3raDQ@mail.gmail.com>

--77eTsxrQxuLMpoBlPiKk9SOCL5hv3f3NU
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 2/11/17 9:57 AM, nitish jha wrote:
> Hello All,
>=20
> I am tryin to build xen-image-minimal
>=20
> but I am getting following error
>=20
> ERROR: glibc-locale-2.24-r0 do_package: QA Issue: glibc-locale:
> Files/directories were installed but not shipped in any package:

<snip>

> Please set FILES such that these items are packaged. Alternatively if
> they are unneeded, avoid installing them or delete them within do_insta=
ll.
> glibc-locale: 820 installed and not shipped files. [installed-vs-shippe=
d]
> ERROR: glibc-locale-2.24-r0 do_package: Fatal QA errors found, failing =
task.
> ERROR: glibc-locale-2.24-r0 do_package: Function failed: do_package
> ERROR: Logfile of failure stored in:
> /home/njking/yocto_morty/build_xen_qemu/tmp/work/core2-64-poky-linux/gl=
ibc-locale/2.24-r0/temp/log.do_package.17564
> ERROR: Task
> (/home/njking/yocto_morty/poky/meta/recipes-core/glibc/glibc-locale_2.2=
4.bb:do_package)
> failed with exit code '1'
>=20

Unfortunately this issue is with the glibc package. Which does not live
in meta-virtualization. I'm at a loss why you would see that since I
build morty fairly regularly and haven't seen this. I would make sure
you are on the latest versions.

--=20
Doug Goldstein


--77eTsxrQxuLMpoBlPiKk9SOCL5hv3f3NU--

--fbN2HcjmfRkCG5AAdBTcsgRUX3O9fTxIH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJYoOGUXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUN7EP/3BjxgPdCmxPEeVdUvv+32bS
PzrvFJA7LeBCQQLMYxQdvYAlM3F5tletVqdYUCzuMD6XSPBOW6I6MDhGjkZxS1oI
vej7T/kxhjCqzbm++V7Q6QC9pvx+11JWhWda/q6qw3FISjrZgpZ4HOGDLnbqlXwZ
ffBffK31QEf0c8tMlAyarXYASodkpxZI27glNIb7Ybag0Nu7bjD5yajTUu27I45q
rvngDKOcg5lJuNshj3CiQQjNdl8asg1axINYGN1aTk8cNi9S15eyafi8hANK1O0H
L+HOeqe9v5HSNEYH7dC9zWB521UTE9JPMKb33NYUj/8hmXRKuva+CAI8UJ9Wj7as
2f7spzqmo+Nnak4/uXs4jGKN96KVV+PvAVc3mmUqZny+o2wKZ33spJdtn2Mh9hwj
sks5dFl+sXrDPa8wB3UF46mFNBKEfI3wQBuc4EUeGwr7FsVQzt4ruv6QHNZnwzcb
xUfDw/pCR0A7cY7GI24zTpSl/JiX8vxlvPSsOVdQDyt9S7SMnnR4fkTnfxs5V1rO
7wXbxfQe6jUn0JKWxPZEmJYl9rEv5aps07YW3H97ZE4HycH/JEQfoFAi6a1lXwDI
tQlDwiEmP2yM+gMFvBsVj/nZw7JiS2NNzJ0mTYT6MnwbXPLwRptTTlVUdpVcjjTi
u/Gn5/WDHYZUm8r/VXfj
=hw1h
-----END PGP SIGNATURE-----

--fbN2HcjmfRkCG5AAdBTcsgRUX3O9fTxIH--
