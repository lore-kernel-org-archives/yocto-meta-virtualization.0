Return-Path: <j105.rob@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 251B7E0089B; Thu, 12 Feb 2015 08:48:34 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, TRACKER_ID autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (j105.rob[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.46 listed in list.dnswl.org]
	*  1.3 TRACKER_ID BODY: Incorporates a tracking ID number
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4AEC7E007CF
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Feb 2015 08:48:32 -0800 (PST)
Received: by mail-pa0-f46.google.com with SMTP id bj1so12580289pad.5
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Feb 2015 08:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=fHc+zyB3AvFBUynzJjII3U0cK0PvY4s82A1tgcGXQUc=;
	b=ceNhwX7w1SfU6HteewB8nLFQpdOYjiKFx3eI4aDkwOt0FhQDHYJEHtQaH40I6hyNaH
	4bsKY0skmQh8dpcOu/DUul420XQEYI9gvVkr2ZAFbAIDZN4RK2KAcyLgE5DbGHHy2mdS
	fGluP/eXrjO+k6YBYxYFVIRHcyvctAmEBIbE7tawpz+96RnL914iuVhjmULtRl1Qf1OS
	tHj4QxgmQGz26tf09RUEkcFLvNfNnL8JngQKtc/1j60pBUdM2HHpBtwn04S+VgBi6QCD
	zy33ds3vJhgY8iToK7Nz0ZVOuewYcGsnz6wi4nPjdO2g/xFCDP1GieIK2OOhi6Fj9vN/
	/glA==
MIME-Version: 1.0
X-Received: by 10.68.201.168 with SMTP id kb8mr7721629pbc.89.1423759711832;
	Thu, 12 Feb 2015 08:48:31 -0800 (PST)
Received: by 10.66.160.137 with HTTP; Thu, 12 Feb 2015 08:48:31 -0800 (PST)
Date: Thu, 12 Feb 2015 11:48:31 -0500
Message-ID: <CAOWu+mA6+Lqsv6rpkh0xEVaTsW6AsUfsVKiUgz65Z+W-5qOTDg@mail.gmail.com>
From: Rob Weiss <j105.rob@gmail.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: [Bug 7313] dev86 source location patch
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
X-List-Received-Date: Thu, 12 Feb 2015 16:48:34 -0000
X-Groupsio-MsgNum: 875
Content-Type: multipart/mixed; boundary=e89a8ff1cae8dfc43f050ee6e3ab

--e89a8ff1cae8dfc43f050ee6e3ab
Content-Type: multipart/alternative; boundary=e89a8ff1cae8dfc439050ee6e3a9

--e89a8ff1cae8dfc439050ee6e3a9
Content-Type: text/plain; charset=UTF-8

Regarding bug 7313 I have attached a patch for the new source location.

-- 

-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1.4.12 (GNU/Linux)

mQENBFKEwSUBCADi6r/xXH0QTgLbPg2EIQD86M+5w1PekvnLLxfUEficcvlTNrLW
bBsGVCdksAymJdHuuLrrujnoQrd5REoTq7R6IZHFZ5SS7eRkfrG4eFImRoXmHHRq
71DPdZnlALoUXUS9lb1pY4AbMaF51pduGigGUrVSHaAH2aLQMz2k9C+Cox5QLghm
9M0vhwGXviJ2PEZZ2nc03YT2PTwqQQHYJI9rLRJQXOpl9nUZn4zLDJg9H8nkhm4b
8yj3MRW1FVfW1KqnCuRBnwKuXVmeaJ0aA0ZnXy4xb7sT7Gw92K2a6QJzFviCJfx4
jAGB6wuRF9wFI2GswposLN4514FzyNSb+3BnABEBAAG0I1JvYmVydCBKIFdlaXNz
IDxqMTA1LnJvYkBnbWFpbC5jb20+iQE4BBMBAgAiBQJShMElAhsDBgsJCAcDAgYV
CAIJCgsEFgIDAQIeAQIXgAAKCRA7Vynrc6yHx2yyCACfv7iBr49MvbXMlkgeXk3T
vsJGXhXS7ZuwjaGLY1jGRMgj9ir1gS3D8qJzcjNhofW52Kn2TWhPbh7ed9xpuDQp
zk75Nw/TNT2FBerKF7d2s/v3qhpUUod72q7rTHBA3EMYDfUa+XsxfmI3TybOJn1N
aSNS/7LyNqaJY1Mh+SbhmBppVZQJmmGAcq3g4WmDo9WXvL11nKEwHp5eVzH7u6E1
HszjKTu26s+Vtre0dE2lq2EaatK88t+5aE8kQtTQ9oyTyeVikrJ40nqajRbZqAOH
1Kh0EWOrJvzjloeC33UPIqS7ITIBtDpzzQgjmh4KjLQhjYgg6abxOgbjmrDXif4H
uQENBFKEwSUBCADqgJH5/im2YwGUxF8Hf2RF8Wd3G6tQHEIVl5DIsT6OAcL2/aLD
J1V2gGkPzXltvf8sRWa8IdHoqLpe0RDEzxpjjP26BTq2UoQu1Hn44W19QM93EaFP
M7vdQLWClmGzxNC2/Jw7nszm92QpxP/RWvWXJDxsa8cjrJCHBzQj74hMeMMCmK2O
rCAUlH3q1iI9KAQAz6r+aIsQuaeXSNT5N7La4pBidooV8LxLI/zyPMJ42x4uSNbD
2KEpFrs6lYPiJDTcv2e8ZqTdbqR9JS6KopvJQzf31MfGZENZB6MqEjH92FQMtjl3
Psx6PUhZlsOXBQkcexh4AYalolSYdgQU4lBTABEBAAGJAR8EGAECAAkFAlKEwSUC
GwwACgkQO1cp63Osh8eQNwf+OTc1mOBCFUhdlMK1JCDFsBdFPmPICy3e/ZKSXgZu
Ti9ywcIJrAmyjx6TPXLzoSB6VH+Qouq+dYlYCnm9rn2ljl8Ek0q0lCDAJKrVfIjy
zErWLwkSFBaAg2BrmiQnDxrKV1ba1eubf8WJz7fDh9RX0NZwBjz+8BHoOiCz2iBD
onFBrt0/v9D/aIiiTOSzKTNnipmPKldDVsseh02F3jTogUXcDoPFKD6terrF5mgD
SHa5uGDy9MixlsVxptUTOyonFt8UKU6XCBvFCGUc4o6kT1IOPybqNxa/+b0LpEE0
x6KyVLpc5VDkkhby/MI/lEnt7qPEct37NYBbaSf8348gKQ==
=L0yr
-----END PGP PUBLIC KEY BLOCK-----

--e89a8ff1cae8dfc439050ee6e3a9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Regarding bug 7313 I have attached a patch for the new sou=
rce location.<br clear=3D"all"><div><br></div>-- <br><div class=3D"gmail_si=
gnature"><div dir=3D"ltr"><div><br></div><div>-----BEGIN PGP PUBLIC KEY BLO=
CK-----</div><div>Version: GnuPG v1.4.12 (GNU/Linux)</div><div><br></div><d=
iv>mQENBFKEwSUBCADi6r/xXH0QTgLbPg2EIQD86M+5w1PekvnLLxfUEficcvlTNrLW</div><d=
iv>bBsGVCdksAymJdHuuLrrujnoQrd5REoTq7R6IZHFZ5SS7eRkfrG4eFImRoXmHHRq</div><d=
iv>71DPdZnlALoUXUS9lb1pY4AbMaF51pduGigGUrVSHaAH2aLQMz2k9C+Cox5QLghm</div><d=
iv>9M0vhwGXviJ2PEZZ2nc03YT2PTwqQQHYJI9rLRJQXOpl9nUZn4zLDJg9H8nkhm4b</div><d=
iv>8yj3MRW1FVfW1KqnCuRBnwKuXVmeaJ0aA0ZnXy4xb7sT7Gw92K2a6QJzFviCJfx4</div><d=
iv>jAGB6wuRF9wFI2GswposLN4514FzyNSb+3BnABEBAAG0I1JvYmVydCBKIFdlaXNz</div><d=
iv>IDxqMTA1LnJvYkBnbWFpbC5jb20+iQE4BBMBAgAiBQJShMElAhsDBgsJCAcDAgYV</div><d=
iv>CAIJCgsEFgIDAQIeAQIXgAAKCRA7Vynrc6yHx2yyCACfv7iBr49MvbXMlkgeXk3T</div><d=
iv>vsJGXhXS7ZuwjaGLY1jGRMgj9ir1gS3D8qJzcjNhofW52Kn2TWhPbh7ed9xpuDQp</div><d=
iv>zk75Nw/TNT2FBerKF7d2s/v3qhpUUod72q7rTHBA3EMYDfUa+XsxfmI3TybOJn1N</div><d=
iv>aSNS/7LyNqaJY1Mh+SbhmBppVZQJmmGAcq3g4WmDo9WXvL11nKEwHp5eVzH7u6E1</div><d=
iv>HszjKTu26s+Vtre0dE2lq2EaatK88t+5aE8kQtTQ9oyTyeVikrJ40nqajRbZqAOH</div><d=
iv>1Kh0EWOrJvzjloeC33UPIqS7ITIBtDpzzQgjmh4KjLQhjYgg6abxOgbjmrDXif4H</div><d=
iv>uQENBFKEwSUBCADqgJH5/im2YwGUxF8Hf2RF8Wd3G6tQHEIVl5DIsT6OAcL2/aLD</div><d=
iv>J1V2gGkPzXltvf8sRWa8IdHoqLpe0RDEzxpjjP26BTq2UoQu1Hn44W19QM93EaFP</div><d=
iv>M7vdQLWClmGzxNC2/Jw7nszm92QpxP/RWvWXJDxsa8cjrJCHBzQj74hMeMMCmK2O</div><d=
iv>rCAUlH3q1iI9KAQAz6r+aIsQuaeXSNT5N7La4pBidooV8LxLI/zyPMJ42x4uSNbD</div><d=
iv>2KEpFrs6lYPiJDTcv2e8ZqTdbqR9JS6KopvJQzf31MfGZENZB6MqEjH92FQMtjl3</div><d=
iv>Psx6PUhZlsOXBQkcexh4AYalolSYdgQU4lBTABEBAAGJAR8EGAECAAkFAlKEwSUC</div><d=
iv>GwwACgkQO1cp63Osh8eQNwf+OTc1mOBCFUhdlMK1JCDFsBdFPmPICy3e/ZKSXgZu</div><d=
iv>Ti9ywcIJrAmyjx6TPXLzoSB6VH+Qouq+dYlYCnm9rn2ljl8Ek0q0lCDAJKrVfIjy</div><d=
iv>zErWLwkSFBaAg2BrmiQnDxrKV1ba1eubf8WJz7fDh9RX0NZwBjz+8BHoOiCz2iBD</div><d=
iv>onFBrt0/v9D/aIiiTOSzKTNnipmPKldDVsseh02F3jTogUXcDoPFKD6terrF5mgD</div><d=
iv>SHa5uGDy9MixlsVxptUTOyonFt8UKU6XCBvFCGUc4o6kT1IOPybqNxa/+b0LpEE0</div><d=
iv>x6KyVLpc5VDkkhby/MI/lEnt7qPEct37NYBbaSf8348gKQ=3D=3D</div><div>=3DL0yr</=
div><div>-----END PGP PUBLIC KEY BLOCK-----</div><div><br></div></div></div=
>
</div>

--e89a8ff1cae8dfc439050ee6e3a9--

--e89a8ff1cae8dfc43f050ee6e3ab
Content-Type: text/plain; charset=US-ASCII; name="dev86_0.16.19.diff"
Content-Disposition: attachment; filename="dev86_0.16.19.diff"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_i62drc380

ZGlmZiAtLWdpdCBhL3JlY2lwZXMtZXh0ZW5kZWQvZGV2ODYvZGV2ODZfMC4xNi4xOS5iYiBiL3Jl
Y2lwZXMtZXh0ZW5kZWQvZGV2ODYvZGV2ODZfMC4xNi4xOS5iYgppbmRleCA4MDc1MDRlLi4zZjQ3
YTBmIDEwMDY0NAotLS0gYS9yZWNpcGVzLWV4dGVuZGVkL2Rldjg2L2Rldjg2XzAuMTYuMTkuYmIK
KysrIGIvcmVjaXBlcy1leHRlbmRlZC9kZXY4Ni9kZXY4Nl8wLjE2LjE5LmJiCkBAIC01LDEwICs1
LDkgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9OGNhNDNjYmM4NDJj
MjMzNmU4MzU5MjZjMjE2NmMyOGIiCiBTRUNUSU9OID0gImNvbnNvbGUvdG9vbHMiCiBQUj0icjAi
CiAKLVNSQ19VUkk9Imh0dHA6Ly93d3cuZGViYXRoLmNvLnVrL2Rldjg2L0Rldjg2c3JjLSR7UFZ9
LnRhci5neiIKLQotU1JDX1VSSVttZDVzdW1dID0gIjQ0MmU5OGUxYWZhMjNmZTAwZDQwYzVhOTk2
Mzg1OTQyIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjMzMzk4Yjg3Y2E4NWUyYjY5ZTQwNjJjZjU5
ZjJmNzM1NGFmNDZkYTVlZGNiYTAzNmM2Zjk3YmFlMTdiOGQwMGUiCitTUkNfVVJJPSJodHRwczov
L2dpdGh1Yi5jb20vbGt1bmRyYWsvZGV2ODYvYXJjaGl2ZS92JHtQVn0uemlwIgorU1JDX1VSSVtt
ZDVzdW1dID0gIjEzMDg3NTlmMzZmOTkwN2U3ZGFlOTJjNDZmMzVjNTFlIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gImVmZDMzZDQ1NmZmODdkNmQwMzA4NjA4ZjZhMzQwNTJiMjJlYTg2Mjk5MTNkMDU5
N2Q5OGM3MzgxNWVkMGY5ZjAiCiAKIFMgPSAiJHtXT1JLRElSfS9kZXY4Ni0ke1BWfSIK

--e89a8ff1cae8dfc43f050ee6e3ab--
