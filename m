Return-Path: <nathan.fisher@gd-ms.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01122C47089
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 18:06:02 +0000 (UTC)
Subject: Re: kvmtool patch error
To: meta-virtualization@lists.yoctoproject.org
From: "Nathan.Fisher@gd-ms.com" <nathan.fisher@gd-ms.com>
X-Originating-Location: Washington, District of Columbia, US (136.226.19.47)
X-Originating-Platform: Windows Chrome 107
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 07 Dec 2022 10:05:54 -0800
References: <CADkTA4PUkWx2LP6NPaMSCHjQfGe3fGqVeE56comKeSqwM-4Caw@mail.gmail.com>
In-Reply-To: <CADkTA4PUkWx2LP6NPaMSCHjQfGe3fGqVeE56comKeSqwM-4Caw@mail.gmail.com>
Message-ID: <10014.1670436354431982246@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="oYvQ0ADRqFHhdvAkbQuS"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 07 Dec 2022 18:06:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7744

--oYvQ0ADRqFHhdvAkbQuS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The problem I think is here

Makefile contents lines 337 to 343:

>=20
> # This comment is on line 337
> ifeq ($(call try-build,$(SOURCE_STATIC),$(CFLAGS),$(LDFLAGS) -static),y)
> CFLAGS +=3D -DCONFIG_GUEST_INIT
> GUEST_INIT :=3D guest/init
> GUEST_OBJS =3D guest/guest_init.o
> ifeq ($(ARCH_PRE_INIT),)
> GUEST_INIT_FLAGS +=3D -static $(PIE_FLAGS)
>=20

Hunk 2 of external-crosscompiler.patch

>=20
> @@ -343,7 +337,7 @@ $(warning No static libc found. Skipping guest init)
> endif
>=20
> ifeq (y,$(ARCH_WANT_LIBFDT))
> - ifneq ($(call try-build,$(SOURCE_LIBFDT),$(CFLAGS),-lfdt),y)
> + ifneq ($(call try-build,$(SOURCE_LIBFDT),$(CPPFLAGS) $(CFLAGS),-lfdt),y=
)
>=20
> $(error No libfdt found. Please install libfdt-dev package)
> else
> CFLAGS_DYNOPT +=3D -DCONFIG_HAS_LIBFDT
>=20
>=20
>=20

Would the issue here be that the patch is trying to remove a line that is n=
ot present?
Closest I can find to what the patch file alludes to is more around line 37=
0:

>=20
> else ifeq ($(call try-build,$(SOURCE_LIBFDT),$(CFLAGS),-lfdt),y)
> LIBFDT_STATIC :=3D
> CFLAGS_DYNOPT +=3D -DCONFIG_HAS_LIBFDT
> CFLAGS_STATOPT +=3D -DCONFIG_HAS_LIBFDT
> LIBS_DYNOPT +=3D -lfdt
> LIBS_STATOPT +=3D -lfdt
> else
> $(error No libfdt found. Please install libfdt-dev package or set
> LIBFDT_DIR)
>=20

Except the patch is looking for an ifneq instead of an ifeq/else ifeq
(Note the ifneq at line 370 is the only place where the string "$(call try-=
build,$(SOURCE_LIBFDT),$(CFLAGS),-lfdt),y" exists in the makefile)

If my build environment may be at fault, my host machine is running ubuntu =
20.04 (x86) and I'm building for a device using an AMD embedded processor (=
AMD64)

--oYvQ0ADRqFHhdvAkbQuS
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The problem I think is here<br /><br />Makefile contents lines 337 to 343:<=
br />
<blockquote>
<div># This comment is on line 337</div>
<div>ifeq ($(call try-build,$(SOURCE_STATIC),$(CFLAGS),$(LDFLAGS) -static),=
y)</div>
<div><span style=3D"white-space: pre;"> </span>CFLAGS<span style=3D"white-s=
pace: pre;"> </span>+=3D -DCONFIG_GUEST_INIT</div>
<div><span style=3D"white-space: pre;"> </span>GUEST_INIT<span style=3D"whi=
te-space: pre;"> </span>:=3D guest/init</div>
<div><span style=3D"white-space: pre;"> </span>GUEST_OBJS<span style=3D"whi=
te-space: pre;"> </span>=3D guest/guest_init.o</div>
<div><span style=3D"white-space: pre;"> </span>ifeq ($(ARCH_PRE_INIT),)</di=
v>
<div><span style=3D"white-space: pre;"> </span>GUEST_INIT_FLAGS<span style=
=3D"white-space: pre;"> </span>+=3D -static $(PIE_FLAGS)</div>
</blockquote>
<br />Hunk 2 of external-crosscompiler.patch<br /><br />
<blockquote>
<div>@@ -343,7 +337,7 @@ $(warning No static libc found. Skipping guest ini=
t)</div>
<div>&nbsp;endif</div>
<div>&nbsp;</div>
<div>&nbsp;ifeq (y,$(ARCH_WANT_LIBFDT))</div>
<div>-<span style=3D"white-space: pre;"> </span>ifneq ($(call try-build,$(S=
OURCE_LIBFDT),$(CFLAGS),-lfdt),y)</div>
<div>+<span style=3D"white-space: pre;"> </span>ifneq ($(call try-build,$(S=
OURCE_LIBFDT),$(CPPFLAGS) $(CFLAGS),-lfdt),y)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;$(error No libfdt found. Plea=
se install libfdt-dev package)</div>
<div>&nbsp;<span style=3D"white-space: pre;"> </span>else</div>
<div>&nbsp;<span style=3D"white-space: pre;"> </span>CFLAGS_DYNOPT<span sty=
le=3D"white-space: pre;"> </span>+=3D -DCONFIG_HAS_LIBFDT<br /><br /></div>
</blockquote>
<div>Would the issue here be that the patch is trying to remove a line that=
 is not present?<br />Closest I can find to what the patch file alludes to =
is more around line 370:<br />
<blockquote>
<div>else ifeq ($(call try-build,$(SOURCE_LIBFDT),$(CFLAGS),-lfdt),y)</div>
<div><span style=3D"white-space: pre;"> </span>LIBFDT_STATIC<span style=3D"=
white-space: pre;"> </span>:=3D</div>
<div><span style=3D"white-space: pre;"> </span>CFLAGS_DYNOPT<span style=3D"=
white-space: pre;"> </span>+=3D -DCONFIG_HAS_LIBFDT</div>
<div><span style=3D"white-space: pre;"> </span>CFLAGS_STATOPT<span style=3D=
"white-space: pre;"> </span>+=3D -DCONFIG_HAS_LIBFDT</div>
<div><span style=3D"white-space: pre;"> </span>LIBS_DYNOPT<span style=3D"wh=
ite-space: pre;"> </span>+=3D -lfdt</div>
<div><span style=3D"white-space: pre;"> </span>LIBS_STATOPT<span style=3D"w=
hite-space: pre;"> </span>+=3D -lfdt</div>
<div><span style=3D"white-space: pre;"> </span>else</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; $(error No lib=
fdt found. Please install libfdt-dev package or set LIBFDT_DIR)</div>
</blockquote>
Except the patch is looking for an ifneq instead of an ifeq/else ifeq<br />=
(Note the ifneq at line 370 is the only place where the string "$(call try-=
build,$(SOURCE_LIBFDT),$(CFLAGS),-lfdt),y" exists in the makefile)<br /><br=
 />If my build environment may be at fault, my host machine is running ubun=
tu 20.04 (x86) and I'm building for a device using an AMD embedded processo=
r (AMD64)</div>

--oYvQ0ADRqFHhdvAkbQuS--

