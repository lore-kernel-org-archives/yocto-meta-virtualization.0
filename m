Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2FBA1E00AD5; Fri, 21 Apr 2017 07:44:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.223.179 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.223.179 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EBF0FE00A30
	for <meta-virtualization@yoctoproject.org>;
	Fri, 21 Apr 2017 07:44:40 -0700 (PDT)
Received: by mail-io0-f179.google.com with SMTP id p80so2765092iop.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 21 Apr 2017 07:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=JvNiWOMNf63n+tN4dKVMZeqeP4VmA0r/nEobyXQl30o=;
	b=icd/y9csJjOrQnsV2SKFrZCqHlUKNpnC2zmAwf26TxIjF7a9/bDQOUUEQbus3ay/bo
	4C+cDfwFYdhFJyp6uXhis9fP4OXz8pA5QGpEman1iJ09YClV6E2PIFSjOPKk9sC+tIFr
	4SYC/0l1VOizDrss1Gk/nuYJtUGu+dxTp6A8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to;
	bh=JvNiWOMNf63n+tN4dKVMZeqeP4VmA0r/nEobyXQl30o=;
	b=bdq7/dDYwMTwdogqD4wb/bP1HPdM3cxEchIQSOW99vNJVtjZ7iqwhk8VHLF7luRs+k
	YlWtrmTbS6tIG+k+lebS8BUzMgixWsNgSt3kRcFe/nJP/NKC3dEI3rxWck45xqNBCrVv
	a7VueLY0V4VRAlqLXa1sLtaobcMLCxzDo3cBz++T8xM5pgSeMQIu2ozjMl6SkXhnwfzX
	TKHA6DEkQFQGm/fvBTFeixP9yn0vKg89H5bMjwZJe92XCPsMyZ0XOTJmiaFnTI6R5QmU
	BAnOTFqTTY0bzM2TXvHJZicVA4BZBRQWuNkspxubVQn8uylEOOxIQb0cTed283aMBTOb
	/DOQ==
X-Gm-Message-State: AN3rC/4VKLjKEFn0yLrqbgXOavL60cvJjvQCoeX0G9cmCx39DqLGt1dI
	YNe9+rNgE3Na3Q==
X-Received: by 10.107.12.22 with SMTP id w22mr16075522ioi.209.1492785828099;
	Fri, 21 Apr 2017 07:43:48 -0700 (PDT)
Received: from doug-macbook.hsv.starlab.io
	(c-68-32-173-93.hsd1.al.comcast.net. [68.32.173.93])
	by smtp.googlemail.com with ESMTPSA id
	9sm4137426iol.36.2017.04.21.07.43.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Apr 2017 07:43:46 -0700 (PDT)
Sender: Doug Goldstein <cardoe@cardoe.com>
To: Yunguo Wei <yunguo.wei@windriver.com>,
	meta-virtualization@yoctoproject.org, bruce.ashfield@gmail.com
References: <75c6a75c-b2b6-c086-1a48-e7b6370a63a2@windriver.com>
From: Doug Goldstein <cardoe@gentoo.org>
Message-ID: <46f32fd0-e7ad-b6b4-5860-4172b29d0d95@gentoo.org>
Date: Fri, 21 Apr 2017 09:43:42 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <75c6a75c-b2b6-c086-1a48-e7b6370a63a2@windriver.com>
Subject: Re: xen build error
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
X-List-Received-Date: Fri, 21 Apr 2017 14:44:42 -0000
X-Groupsio-MsgNum: 2523
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="BBxusarihtXfAe0t2jCg01xISvHEMBgR4"

--BBxusarihtXfAe0t2jCg01xISvHEMBgR4
Content-Type: multipart/mixed; boundary="kMmJ0wPeLMG6T1X9NmHpct72wFgMq7NB6";
 protected-headers="v1"
From: Doug Goldstein <cardoe@gentoo.org>
To: Yunguo Wei <yunguo.wei@windriver.com>,
 meta-virtualization@yoctoproject.org, bruce.ashfield@gmail.com
Message-ID: <46f32fd0-e7ad-b6b4-5860-4172b29d0d95@gentoo.org>
Subject: Re: xen build error
References: <75c6a75c-b2b6-c086-1a48-e7b6370a63a2@windriver.com>
In-Reply-To: <75c6a75c-b2b6-c086-1a48-e7b6370a63a2@windriver.com>

--kMmJ0wPeLMG6T1X9NmHpct72wFgMq7NB6
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 4/20/17 2:53 AM, Yunguo Wei wrote:
> Hi Guys,
>=20
> I'm building xen with latest poky and meta-virtualization, but running
> into the following error on ubu1404/1604:
>=20
> x86_64-poky-linux-gcc -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3
> --sysroot=3D/buildarea/raid0/ywei/git-repos/poky/build/tmp/work/core2-6=
4-poky-linux/xen/4.8.0-r0/recipe-sysroot
> -m32 -march=3Di686 -DBUILD_ID -fno-strict-aliasing -std=3Dgnu99 -Wall
> -Wstrict-prototypes -Wdeclaration-after-statement
> -Wno-unused-but-set-variable -Wno-unused-local-typedefs   -O2
> -fomit-frame-pointer
> -D__XEN_INTERFACE_VERSION__=3D__XEN_LATEST_INTERFACE_VERSION__ -MMD -MF=

> .hvmloader.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -mno-tls-direct-seg-refs  -DNDEBUG -Werror -fno-stack-protector
> -fno-exceptions -fno-builtin -msoft-float
> -I/buildarea/raid0/ywei/git-repos/poky/build/tmp/work/core2-64-poky-lin=
ux/xen/4.8.0-r0/xen-4.8.0/tools/firmware/hvmloader/../../../tools/include=

> -D__XEN_INTERFACE_VERSION__=3D__XEN_LATEST_INTERFACE_VERSION__
> -I../../libacpi  -c -o hvmloader.o hvmloader.c
> In file included from
> /buildarea/raid0/ywei/git-repos/poky/build/tmp/work/core2-64-poky-linux=
/xen/4.8.0-r0/recipe-sysroot/usr/include/sys/cdefs.h:442:0,
>=20
>                  from
> /buildarea/raid0/ywei/git-repos/poky/build/tmp/work/core2-64-poky-linux=
/xen/4.8.0-r0/recipe-sysroot/usr/include/features.h:410,
>=20
>                  from
> /buildarea/raid0/ywei/git-repos/poky/build/tmp/work/core2-64-poky-linux=
/xen/4.8.0-r0/recipe-sysroot/usr/include/bits/libc-header-start.h:33,
>=20
>                  from
> /buildarea/raid0/ywei/git-repos/poky/build/tmp/work/core2-64-poky-linux=
/xen/4.8.0-r0/recipe-sysroot/usr/include/stdint.h:26,
>=20
>                  from
> /buildarea/raid0/ywei/git-repos/poky/build/tmp/work/core2-64-poky-linux=
/xen/4.8.0-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-=
poky-linux/6.3.0/include/stdint.h:9,
>=20
>                  from util.h:5,
>                  from hvmloader.c:22:
> /buildarea/raid0/ywei/git-repos/poky/build/tmp/work/core2-64-poky-linux=
/xen/4.8.0-r0/recipe-sysroot/usr/include/bits/long-double.h:53:33:
> fatal error: bits/long-double-32.h: No such file or directory
>  #include <bits/long-double-32.h>
>                                  ^
> compilation terminated.
> make[7]: *** [hvmloader.o] Error 1
> make[7]: Leaving directory
> `/buildarea/raid0/ywei/git-repos/poky/build/tmp/work/core2-64-poky-linu=
x/xen/4.8.0-r0/xen-4.8.0/tools/firmware/hvmloader'
>=20
> make[6]: *** [all] Error 2
> make[6]: Leaving directory
> `/buildarea/raid0/ywei/git-repos/poky/build/tmp/work/core2-64-poky-linu=
x/xen/4.8.0-r0/xen-4.8.0/tools/firmware/hvmloader'
>=20
> make[5]: *** [subdir-all-hvmloader] Error 2
> make[5]: Leaving directory
> `/buildarea/raid0/ywei/git-repos/poky/build/tmp/work/core2-64-poky-linu=
x/xen/4.8.0-r0/xen-4.8.0/tools/firmware'
>=20
> make[4]: *** [subdirs-all] Error 2
> make[4]: Leaving directory
> `/buildarea/raid0/ywei/git-repos/poky/build/tmp/work/core2-64-poky-linu=
x/xen/4.8.0-r0/xen-4.8.0/tools/firmware'
>=20
> make[3]: *** [all] Error 2
> make[3]: Leaving directory
> `/buildarea/raid0/ywei/git-repos/poky/build/tmp/work/core2-64-poky-linu=
x/xen/4.8.0-r0/xen-4.8.0/tools/firmware'
>=20
>=20
> Is there anyone see similar issue?
>=20
>=20
> Regards,
>=20
> Yunguo
>=20


What version of Yocto?

--=20
Doug Goldstein


--kMmJ0wPeLMG6T1X9NmHpct72wFgMq7NB6--

--BBxusarihtXfAe0t2jCg01xISvHEMBgR4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJY+hqhXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUVc8QAIX71EYKQ2RrYI7OSHkA3G7e
m+u0Ny7LRYnkrACqoFPEH/bL0JFVH9KD2JueCKXYlJg/O4fUUqCw821X7Yj4lcwN
soq1xfnS4L+OKsceHlP9NIX04L5z829Ixnz/8OgEG3TWn49Qc7Ja4aS3ZNX5/OKk
5+5KYGSJNPTg+c3inLZA1D7nXGnqblQF6Ud+LdwAkS6w2TU48ZxEwbFa/QalgEmF
MpToPrqg5NVogjMdImW/jlC3YWzX9RzRCp4VS230xREtU7OWgMbmVSducFlm/mh+
WtN7ZOHtkHtuXOnNfo61fVA2hEG1wouqp9SEUL0XCBZ9zFZ5fmVHYgYbGaRjCUGd
vb/0CGLiCHl1F25MghXZp3Wm5VYlgTMVAg73+Ff0s+ma8souUCmisOlZBCPtexA5
EiJZguH+D5cDFaOu1U74HaDffJYWDL6y4uEI/cOi0iH+zT5ZbdgvMfXkIxnwJiCK
EJMqvKSJXt3oxxcAB08Dzwn8OwtxLeMi5Mb05WFat0n4bmN5HUmoKEFVjSyK3JaH
35I2yZwHtcqqiIu6gzNP+syV2r74YG5CFgyGtDt6AzKYQhQuYwZOh7tas8Y75+rY
ZMpqu+3k+jjPPAV9PS52qfT5ZGGyxYSKHPVVGVuhw1NRlfr8SfKyJI9mdciFfCYV
Fsh/pTOottRAKoaSy65f
=pV2F
-----END PGP SIGNATURE-----

--BBxusarihtXfAe0t2jCg01xISvHEMBgR4--
