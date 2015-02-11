Return-Path: <j105.rob@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C8F15E008CF; Wed, 11 Feb 2015 06:35:32 -0800 (PST)
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
	*      [209.85.220.43 listed in list.dnswl.org]
	*  1.3 TRACKER_ID BODY: Incorporates a tracking ID number
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C0C98E008A7
	for <meta-virtualization@yoctoproject.org>;
	Wed, 11 Feb 2015 06:35:29 -0800 (PST)
Received: by mail-pa0-f43.google.com with SMTP id fa1so4403226pad.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 11 Feb 2015 06:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=QV0grrpyzE+EyqfjbaS/tfxhEDdDW9ULNN3r8/m3SrM=;
	b=RR+HAg0Z5TVrbG6IWocKdQ7J+AnIb4qK838g7eiEIiTuRMvPheNOKylSiDfPp8DDCR
	iPeeTLFKSqRpi6OgINaL9IFEEDaw9wZ9JHlGpfB6G6V9m2m38DdmGp9eeVCgFEEouRrr
	5RR8EdFk6dqrWCzDqwuIrgor3paLXNay0IizOCcj7Z1hzpQUBb+5WVl/p5eN0egQrFYs
	IFGJcUqbR5cdW6sl10XGgizgei7NpP2dslaBOsnCg9USy4HH4u5vkPgjM+EqFiPuGPeJ
	2N1waGe+jWpfCA/RcnHMcDVjlGm8tnEWK1gOX9mIJyDW+zdZbfBBQKei4RogzJHmVpyG
	V03A==
MIME-Version: 1.0
X-Received: by 10.70.88.9 with SMTP id bc9mr46789975pdb.145.1423665329532;
	Wed, 11 Feb 2015 06:35:29 -0800 (PST)
Received: by 10.66.160.137 with HTTP; Wed, 11 Feb 2015 06:35:29 -0800 (PST)
Date: Wed, 11 Feb 2015 09:35:29 -0500
Message-ID: <CAOWu+mCXRMGc=34bW7sEYLZpecuwSmqM4+=_RvrQ4gMn9R4z9w@mail.gmail.com>
From: Rob Weiss <j105.rob@gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: Building xen-image-minimal problem
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
X-List-Received-Date: Wed, 11 Feb 2015 14:35:32 -0000
Content-Type: multipart/alternative; boundary=001a11c21e0c3ef36c050ed0ead9

--001a11c21e0c3ef36c050ed0ead9
Content-Type: text/plain; charset=UTF-8

I am trying to build xen-image-minimal using poky dizzy and I am getting
the follow error:

ubuntu@yocto:/opt/rob/poky/build$ bitbake -v xen-image-minimal
Loading cache: 100%
|##########################################################################################################################################################################################################|
ETA:  00:00:00
Loaded 2074 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
NOTE: selecting pigz-native to satisfy gzip-native due to
PREFERRED_PROVIDERS
NOTE: selecting pseudo-native to satisfy virtual/fakeroot-native due to
PREFERRED_PROVIDERS
NOTE: selecting linux-yocto to satisfy virtual/kernel due to
PREFERRED_PROVIDERS
NOTE: selecting opkg-utils-native to satisfy
virtual/update-alternatives-native due to PREFERRED_PROVIDERS
NOTE: selecting linux-yocto to satisfy runtime
kernel-module-xen-acpi-processor due to PREFERRED_PROVIDER_virtual/kernel =
linux-yocto
NOTE: selecting linux-yocto to satisfy runtime kernel-module-xen-blkback
due to PREFERRED_PROVIDER_virtual/kernel = linux-yocto
NOTE: selecting linux-yocto to satisfy runtime kernel-module-xen-gntalloc
due to PREFERRED_PROVIDER_virtual/kernel = linux-yocto
NOTE: selecting linux-yocto to satisfy runtime kernel-module-xen-gntdev due
to PREFERRED_PROVIDER_virtual/kernel = linux-yocto
NOTE: selecting linux-yocto to satisfy runtime kernel-module-xen-netback
due to PREFERRED_PROVIDER_virtual/kernel = linux-yocto
NOTE: selecting linux-yocto to satisfy runtime kernel-module-xen-pciback
due to PREFERRED_PROVIDER_virtual/kernel = linux-yocto
NOTE: selecting linux-yocto to satisfy runtime kernel-module-xen-wdt due to
PREFERRED_PROVIDER_virtual/kernel = linux-yocto
ERROR: Nothing RPROVIDES 'xen-base' (but
/opt/extras/meta-virtualization/recipes-extended/images/xen-image-minimal.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'xen-base' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['xen-base']
NOTE: Target 'xen-image-minimal' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['xen-image-minimal',
'xen-base']
ERROR: Required build target 'xen-image-minimal' has no buildable providers.
Missing or unbuildable dependency chain was: ['xen-image-minimal',
'xen-base']

Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

Any insight as to why this is happening? What additional information is
needed to diagnose this error. I am very new to yocto and this is my first
attempt at building an image.

Thanks,
Rob.

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

--001a11c21e0c3ef36c050ed0ead9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am trying to build xen-image-minimal using poky dizzy an=
d I am getting the follow error:<div><br></div><div><div>ubuntu@yocto:/opt/=
rob/poky/build$ bitbake -v xen-image-minimal</div><div>Loading cache: 100% =
|##########################################################################=
###########################################################################=
#####################################################| ETA: =C2=A000:00:00<=
/div><div>Loaded 2074 entries from dependency cache.</div><div>NOTE: Resolv=
ing any missing task queue dependencies</div><div>NOTE: selecting pigz-nati=
ve to satisfy gzip-native due to PREFERRED_PROVIDERS</div><div>NOTE: select=
ing pseudo-native to satisfy virtual/fakeroot-native due to PREFERRED_PROVI=
DERS</div><div>NOTE: selecting linux-yocto to satisfy virtual/kernel due to=
 PREFERRED_PROVIDERS</div><div>NOTE: selecting opkg-utils-native to satisfy=
 virtual/update-alternatives-native due to PREFERRED_PROVIDERS</div><div>NO=
TE: selecting linux-yocto to satisfy runtime kernel-module-xen-acpi-process=
or due to PREFERRED_PROVIDER_virtual/kernel =3D linux-yocto</div><div>NOTE:=
 selecting linux-yocto to satisfy runtime kernel-module-xen-blkback due to =
PREFERRED_PROVIDER_virtual/kernel =3D linux-yocto</div><div>NOTE: selecting=
 linux-yocto to satisfy runtime kernel-module-xen-gntalloc due to PREFERRED=
_PROVIDER_virtual/kernel =3D linux-yocto</div><div>NOTE: selecting linux-yo=
cto to satisfy runtime kernel-module-xen-gntdev due to PREFERRED_PROVIDER_v=
irtual/kernel =3D linux-yocto</div><div>NOTE: selecting linux-yocto to sati=
sfy runtime kernel-module-xen-netback due to PREFERRED_PROVIDER_virtual/ker=
nel =3D linux-yocto</div><div>NOTE: selecting linux-yocto to satisfy runtim=
e kernel-module-xen-pciback due to PREFERRED_PROVIDER_virtual/kernel =3D li=
nux-yocto</div><div>NOTE: selecting linux-yocto to satisfy runtime kernel-m=
odule-xen-wdt due to PREFERRED_PROVIDER_virtual/kernel =3D linux-yocto</div=
><div>ERROR: Nothing RPROVIDES &#39;xen-base&#39; (but /opt/extras/meta-vir=
tualization/recipes-extended/images/<a href=3D"http://xen-image-minimal.bb"=
>xen-image-minimal.bb</a> RDEPENDS on or otherwise requires it)</div><div>N=
OTE: Runtime target &#39;xen-base&#39; is unbuildable, removing...</div><di=
v>Missing or unbuildable dependency chain was: [&#39;xen-base&#39;]</div><d=
iv>NOTE: Target &#39;xen-image-minimal&#39; is unbuildable, removing...</di=
v><div>Missing or unbuildable dependency chain was: [&#39;xen-image-minimal=
&#39;, &#39;xen-base&#39;]</div><div>ERROR: Required build target &#39;xen-=
image-minimal&#39; has no buildable providers.</div><div>Missing or unbuild=
able dependency chain was: [&#39;xen-image-minimal&#39;, &#39;xen-base&#39;=
]</div><div><br></div><div>Summary: There were 2 ERROR messages shown, retu=
rning a non-zero exit code.</div><div><br></div><div>Any insight as to why =
this is happening? What additional information is needed to diagnose this e=
rror. I am very new to yocto and this is my first attempt at building an im=
age.</div><div><br></div><div>Thanks,</div><div>Rob.</div><div><br></div>--=
 <br><div class=3D"gmail_signature"><div dir=3D"ltr"><div><br></div><div>--=
---BEGIN PGP PUBLIC KEY BLOCK-----</div><div>Version: GnuPG v1.4.12 (GNU/Li=
nux)</div><div><br></div><div>mQENBFKEwSUBCADi6r/xXH0QTgLbPg2EIQD86M+5w1Pek=
vnLLxfUEficcvlTNrLW</div><div>bBsGVCdksAymJdHuuLrrujnoQrd5REoTq7R6IZHFZ5SS7=
eRkfrG4eFImRoXmHHRq</div><div>71DPdZnlALoUXUS9lb1pY4AbMaF51pduGigGUrVSHaAH2=
aLQMz2k9C+Cox5QLghm</div><div>9M0vhwGXviJ2PEZZ2nc03YT2PTwqQQHYJI9rLRJQXOpl9=
nUZn4zLDJg9H8nkhm4b</div><div>8yj3MRW1FVfW1KqnCuRBnwKuXVmeaJ0aA0ZnXy4xb7sT7=
Gw92K2a6QJzFviCJfx4</div><div>jAGB6wuRF9wFI2GswposLN4514FzyNSb+3BnABEBAAG0I=
1JvYmVydCBKIFdlaXNz</div><div>IDxqMTA1LnJvYkBnbWFpbC5jb20+iQE4BBMBAgAiBQJSh=
MElAhsDBgsJCAcDAgYV</div><div>CAIJCgsEFgIDAQIeAQIXgAAKCRA7Vynrc6yHx2yyCACfv=
7iBr49MvbXMlkgeXk3T</div><div>vsJGXhXS7ZuwjaGLY1jGRMgj9ir1gS3D8qJzcjNhofW52=
Kn2TWhPbh7ed9xpuDQp</div><div>zk75Nw/TNT2FBerKF7d2s/v3qhpUUod72q7rTHBA3EMYD=
fUa+XsxfmI3TybOJn1N</div><div>aSNS/7LyNqaJY1Mh+SbhmBppVZQJmmGAcq3g4WmDo9WXv=
L11nKEwHp5eVzH7u6E1</div><div>HszjKTu26s+Vtre0dE2lq2EaatK88t+5aE8kQtTQ9oyTy=
eVikrJ40nqajRbZqAOH</div><div>1Kh0EWOrJvzjloeC33UPIqS7ITIBtDpzzQgjmh4KjLQhj=
Ygg6abxOgbjmrDXif4H</div><div>uQENBFKEwSUBCADqgJH5/im2YwGUxF8Hf2RF8Wd3G6tQH=
EIVl5DIsT6OAcL2/aLD</div><div>J1V2gGkPzXltvf8sRWa8IdHoqLpe0RDEzxpjjP26BTq2U=
oQu1Hn44W19QM93EaFP</div><div>M7vdQLWClmGzxNC2/Jw7nszm92QpxP/RWvWXJDxsa8cjr=
JCHBzQj74hMeMMCmK2O</div><div>rCAUlH3q1iI9KAQAz6r+aIsQuaeXSNT5N7La4pBidooV8=
LxLI/zyPMJ42x4uSNbD</div><div>2KEpFrs6lYPiJDTcv2e8ZqTdbqR9JS6KopvJQzf31MfGZ=
ENZB6MqEjH92FQMtjl3</div><div>Psx6PUhZlsOXBQkcexh4AYalolSYdgQU4lBTABEBAAGJA=
R8EGAECAAkFAlKEwSUC</div><div>GwwACgkQO1cp63Osh8eQNwf+OTc1mOBCFUhdlMK1JCDFs=
BdFPmPICy3e/ZKSXgZu</div><div>Ti9ywcIJrAmyjx6TPXLzoSB6VH+Qouq+dYlYCnm9rn2lj=
l8Ek0q0lCDAJKrVfIjy</div><div>zErWLwkSFBaAg2BrmiQnDxrKV1ba1eubf8WJz7fDh9RX0=
NZwBjz+8BHoOiCz2iBD</div><div>onFBrt0/v9D/aIiiTOSzKTNnipmPKldDVsseh02F3jTog=
UXcDoPFKD6terrF5mgD</div><div>SHa5uGDy9MixlsVxptUTOyonFt8UKU6XCBvFCGUc4o6kT=
1IOPybqNxa/+b0LpEE0</div><div>x6KyVLpc5VDkkhby/MI/lEnt7qPEct37NYBbaSf8348gK=
Q=3D=3D</div><div>=3DL0yr</div><div>-----END PGP PUBLIC KEY BLOCK-----</div=
><div><br></div></div></div>
</div></div>

--001a11c21e0c3ef36c050ed0ead9--
