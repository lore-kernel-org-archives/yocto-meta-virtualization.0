Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 742C5E009FA; Thu,  5 Jan 2017 09:33:39 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.223.194 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.223.194 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E6B17E009F0
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Jan 2017 09:33:38 -0800 (PST)
Received: by mail-io0-f194.google.com with SMTP id j15so921617ioj.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 05 Jan 2017 09:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=subject:references:to:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=hCOqxGSBNwWjzUwfzPch+NGnSOSWhQXFldS9TdSX3g4=;
	b=VqO4CEPr57MCMhmzCgEfl85k/4RgusgACkRhq5z19U4qtrk/mV3jns+n6SoCIvMLGl
	3+BG+K6705jO7lTtu5zCgCk/oeATM4WNsxHbw97RmmsiG8zyCC8pchFinZcxaB8P6tov
	6qHlEEApU5O9n0JXszYza7z7sQaTxSfQctzmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:references:to:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=hCOqxGSBNwWjzUwfzPch+NGnSOSWhQXFldS9TdSX3g4=;
	b=I7EswEzNGoAP6idi8UzDZaT+F/CD71XWolMQGqi7RB3dLMroUXCq3VlGDruKqdkXdz
	mkeczEOMJkJoTbTnmf9yv6NJXtfhubF4HIBBaHunA5/ddNoM6p1e0ueCqsvPhbH6GqiP
	7uQNwH5PyrPwTx5ciJ/0BBlbUE20uj4SgB+zxIdYyIbpS5VP9LH9uBgpj5QJw3u8CmcN
	ZKpZq7nsq1COV0xhu0tgjV4IzmQV20Ia6+KKBgDj3Q3719aaUnEdzQf3XndadvdfIR2V
	DiXHvQcx8y+5+F3BW1WGQD/Tu59BCbUb9oEgbtsv6dH4oF/mr0P+O2oCa9ljAlU3436z
	w1dw==
X-Gm-Message-State: AIkVDXJjUXojOQIL+jGwSMiJtRO9lVWG/y53QNzX2qtuYjqf26lK21EMyAtlGmHFJIrRdg==
X-Received: by 10.107.148.76 with SMTP id w73mr65037124iod.235.1483637618256; 
	Thu, 05 Jan 2017 09:33:38 -0800 (PST)
Received: from doug-macbook.hsv.starlab.io
	(c-68-32-173-93.hsd1.al.comcast.net. [68.32.173.93])
	by smtp.googlemail.com with ESMTPSA id
	i187sm895158ioi.31.2017.01.05.09.33.37
	for <meta-virtualization@yoctoproject.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jan 2017 09:33:37 -0800 (PST)
References: <20170105170523.1318-1-cardoe@cardoe.com>
	<20170105173213.1815-1-cardoe@cardoe.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <4d323721-5650-361f-b69f-b14f592c1779@cardoe.com>
Date: Thu, 5 Jan 2017 11:33:34 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170105173213.1815-1-cardoe@cardoe.com>
Subject: Re: [PATCH] xen: add a README to provide info for users
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
X-List-Received-Date: Thu, 05 Jan 2017 17:33:39 -0000
X-Groupsio-MsgNum: 2256
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="iVSdId3aqe5v0Ev9BeV35rHNiTQDbc3Cn"

--iVSdId3aqe5v0Ev9BeV35rHNiTQDbc3Cn
Content-Type: multipart/mixed; boundary="l3REJjqrdVhDWRKu3WLLqTNhOGNCox1ox";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: "meta-virtualization@yoctoproject.org"
 <meta-virtualization@yoctoproject.org>
Message-ID: <4d323721-5650-361f-b69f-b14f592c1779@cardoe.com>
Subject: Re: [PATCH] xen: add a README to provide info for users
References: <20170105170523.1318-1-cardoe@cardoe.com>
 <20170105173213.1815-1-cardoe@cardoe.com>
In-Reply-To: <20170105173213.1815-1-cardoe@cardoe.com>

--l3REJjqrdVhDWRKu3WLLqTNhOGNCox1ox
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

sorry for the confusion. This replaces patch 3 and provides better wordin=
g.


On 1/5/17 11:32 AM, Doug Goldstein wrote:
> Provided some basic documentation on how to use the xen recipe properly=
=2E
> ---
>  recipes-extended/xen/README | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 recipes-extended/xen/README
>=20
> diff --git a/recipes-extended/xen/README b/recipes-extended/xen/README
> new file mode 100644
> index 0000000..3686530
> --- /dev/null
> +++ b/recipes-extended/xen/README
> @@ -0,0 +1,24 @@
> +Xen
> +---
> +
> +For any issues with the xen recipes please make sure you CC cardoe@gen=
too.org
> +
> +configuring the hypervisor
> +--------------------------
> +
> +Since 4.7.0 Xen supports using Kconfig to configure the hypervisor. Si=
milarly
> +to how the recipe for busybox works, you can provide a .config as a de=
fconfig
> +to override the default configuration of the hypervisor. The easiest w=
ay
> +for you to take advantage of this is to create a .config for Xen and t=
hen
> +copy it to your Yocto layer as 'defconfig' inside of
> +'recipes-extended/xen/files/' and then create a bbappend adding
> +'file://defconfig' to your SRC_URI.
> +
> +security patches
> +----------------
> +
> +The base recipe does not include security fixes that the Xen community=
 releases
> +as XSAs (http://xenbits.xen.org/xsa/). The easiest way to include thos=
e is to
> +drop patches in 'recipes-extened/xen/files' and create a bbappend addi=
ng those
> +patches to SRC_URI and they will be applied. Alternatively, you can ov=
erride
> +the SRC_URI to a git repo you provide that contains the patches.
>=20


--=20
Doug Goldstein


--l3REJjqrdVhDWRKu3WLLqTNhOGNCox1ox--

--iVSdId3aqe5v0Ev9BeV35rHNiTQDbc3Cn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJYboNwXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUU98P/1ogqXXctqE/zRTD022Qz5P2
A9S4sOkTzVUyjwpHdyys1NuvNrKJSlaVMZGBaCY3naTm/odzy0hs9ze6CBXMQM6k
bCpxLxsyNQ32qnMqeb75btiOvQfuH7RFOJgM1O8UofVBB5FbRD1XpSaE62MseFYB
kusDj8V1V4mf7zigcNcDeOmGuhJOQ6a6WI0rKQpgUxa7qoNZ0tr4w5YRHdbgg2g0
MwjfdjfKB5LaDDCTPNegy94mfZA9zRG0EriO4NAAaGjle4K+RdU/PKkrppn3VS0F
rOmoowtMQUGJ/MZzDZJspmAjIj4lrAgYcUMe1Rxx4LiFgafDQ9qCMtHmne3u3Suc
FTXOLkoAS9PcTCQ+xtUw4xi6T2eWcowqU8wG3n2t3hThSogZMncRhwcYe5cua94Y
A6B5aY8GupQ9DJixK1WAtb7isoSg130l8cm6HzBGkWQWevnBzIkHR1QFqKTzUN3o
EYr1ICfBlGN+ZkV9B5UAnpU6yKkHYLwL9zdmENzUf7vadbYry4mNRx8TIZgYGTfp
bW3BORftqiy9ATzgMCcbYed+/EvSEo+WNDEiVM6tqW/dg1WkaQZJZcUs4Rz+fxm0
QLH+68NsFvnqC/1YaI63HAzbfUKAuwZxMs6a0SGGaiQyBzQCj+vyeSIgdhfxkibq
g7LJZYUy8qQTPqI8HYUb
=Kf1O
-----END PGP SIGNATURE-----

--iVSdId3aqe5v0Ev9BeV35rHNiTQDbc3Cn--
