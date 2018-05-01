Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 24952E007F2; Tue,  1 May 2018 10:22:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.49 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C031EE006B4
	for <meta-virtualization@yoctoproject.org>;
	Tue,  1 May 2018 10:22:47 -0700 (PDT)
Received: by mail-lf0-f49.google.com with SMTP id u21-v6so17128405lfu.9
	for <meta-virtualization@yoctoproject.org>;
	Tue, 01 May 2018 10:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rlMXdYGi8p1TmVcvJv8oRnNC8gSpgv9JtLeUDVeOlgY=;
	b=NAxGECEdw+0f/0VevDzIYXw6ZPUwyACy9Q0gNgHAIbOAcOJ7Vrn2v8QgVVxhZg275B
	F7bl5HWygFQl+D6rgIpqsDZwkhGzlU9gqcBtQEP8rKusUZuN47L7r4cu97pIsijwd9kd
	Hefu9thadA4kfivqO9SIl+ywwSDgUX34TMCM/VQZeaDVUkhjaT8yNPlQZ/n/4C1QxL9C
	5YB9XLyxIQU+Em6Qj7lToaYATjBkEZq3kiz97u5fbuOGg/nJKZVkHe5kYpQHHfkYho6q
	/U8fMSHGstnl34bId8bFrKo8prstRXsVdAtDmp2yjTH5xgt26JSL6wZC5lFy06K4Yirh
	LmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rlMXdYGi8p1TmVcvJv8oRnNC8gSpgv9JtLeUDVeOlgY=;
	b=EZdyZIbZlt/xdRtIO4zvb/3skOoSFNZBJDHknbsXc2hd0Kqwitod4jIIoBk8iJUKX7
	VS7IPAsXPKN/3hZ2N0hW502r9glQQXiYX4idBhR7qyc270Fb+XAAYce3upBLuHPWlYiu
	kK1Z2auxcyU4Q0RPelwSI2oCQxedmQwMyYbvAFqYyws7OLbb2t2RwlIyGHZBq/v52QA2
	vziUtlU61f5MebN9TXHiJqNtKc0bDUgh52WcWZqFoP2Y7BVGzL5dQY1ZfKRIBghVSQD3
	VFenRYK8GDC3lMDvAlazPrWkYBeG1bFwUGP6FXyvF6wQxinCgmARFsI3ZOmTE/xAeDsp
	+eoA==
X-Gm-Message-State: ALQs6tDxAOAgeCJv+Xjqq7Jl1pZjYY6FJUWJ5MJYUodH5DhSvyQVbidN
	HFY1U8EE/ge09hmqowYI/BjNZyvt0d3n1+awYWo=
X-Google-Smtp-Source: AB8JxZrHi+naO4uOx9JNWpHtjQ9PlynIRxmiB9SH7QAmz9vHD49Nv01q8bo8c1W9mu4Z+Q4CxfpG+qWuWHya8SiYNZ8=
X-Received: by 2002:a19:2ccd:: with SMTP id
	s196-v6mr10569979lfs.18.1525195366329; 
	Tue, 01 May 2018 10:22:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.145.78 with HTTP; Tue, 1 May 2018 10:22:45 -0700 (PDT)
In-Reply-To: <cover.1525180972.git.kurt.bodiker@braintrust-us.com>
References: <cover.1525180972.git.kurt.bodiker@braintrust-us.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Tue, 1 May 2018 10:22:45 -0700
Message-ID: <CACMJ4GadnwJBVVMqVX5XRSdz8Gc_X0_aOHi8CeUfZ9eVf_g5cg@mail.gmail.com>
To: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH v5 0/8] xen: Xen vTPM stubdomains
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
X-List-Received-Date: Tue, 01 May 2018 17:22:49 -0000
Content-Type: multipart/alternative; boundary="00000000000005f194056b283867"

--00000000000005f194056b283867
Content-Type: text/plain; charset="UTF-8"

On Tue, May 1, 2018 at 7:05 AM, Kurt Bodiker <kurt.bodiker@braintrust-us.com
> wrote:

> This patchset introduces the basic recipes necessary to build Xen
> stubdomains, in particular the vTPM and vTPM Manager stubdomains. vTPM
> stubdomains provide Xen guest domains access to a virtualized TPM. The
> vTPM Manager stubdomain manages each of the vTPM domains and seals them
> to the physical TPM. The intention of this patchset is to provide the
> ability to build Xen stubdomains separately from the rest of the Xen
> components since the stubdomains have separate dependencies that are
> hard-coded within the Xen build and configuration files.  Separating the
> stubdomain recipes and dependencies from the rest of the Xen build gives
> the ability to use newer or different libraries than what is currently
> used.
>
> The stubdom.inc file defines a set of CPPFLAGS, CFLAGS, and LDFLAGS
> common for building all Xen stubdomains. Xen stubdomains are
> cross-compiled with the MiniOS, which creates some issues when trying to
> compile stubdomains in an OpenEmbedded environment. To address these
> issues and to ensure the stubdoms are built as Xen had intended, all of
> the build flags and build tools that are exported into the environment
> by OE have been unset. Each of the new recipes introduced here then
> implements the build flags and the tools as though the build had been
> run in the bare-metal environment.
>
> Recipes to create slightly modified source packages for lwIP amd Mini-OS
> are introduced to standardize the dependency tree among stubdomain
> related recipes and to avoid the hassle of maintaining the same tasks
> within many recipes.
>
> Xen vTPM stubdomains have depencencies on static libraries for newlib,
> polarssl, gmp, and tpm emulator. Xen vTPM Manager stubdomain has
> dependencies on static libraries for newlib and polarssl.
>
> The newlib, polarssl, gmp, and tpm emulator recipes are constructed to
> behave the same as a bare-metal build. These recipes are cross-compiled
> against both the Xen and MiniOS source code.
>
> The xen-vtpm recipe is responsible for building and installing the vTPM
> and vTPM Manager stubdomain images into the Xen boot directory. xen-vtpm
> would need to be added to DISTRO_FEATURES the similar for what is done
> for Xen.
>
> ---
> Changes in v5:
>  - Correct license in TPM Emulator recipe
>  - Remove aarch64 from COMPATIBLE_HOST in stubdom.inc
> Changes in v4:
>  - Fix whitespace errors in MiniOS, Newlib, and TPM Emulator patchfiles
>  - Corrected type in Newlib recipe
> Changes in v3:
>  - Limit builds to 64-bit only through COMPATIBLE_HOST
>  - Change Xen version comparison logic in xen-vtpm recipe
>  - Introduce MiniOS patch for GCC v7 that was not backported into the
>    4.9.x releases
>  - Change cross-root-${XEN_TARGET_ARCH} to cross-root-${GNU_TARGET_ARCH}
> Changes in v2:
>  - Multi-line variables formatted to match OE style guide
>  - SRC_URI formatted to use SRCREV rather than git tag
>  - patches formatted to striplevel=1
>  - introduced Mini-OS recipe
>  - Removed Xen dependency since this is handled (mostly) by Mini-OS
>  - Changed version number of xen-vtpm recipe to match Xen version
> ---
>
> Kurt Bodiker (8):
>   Define standard values needed to build stubdomains
>   LWIP source code with patches applied for stubdoms
>   Mini-OS source code with make links target applied
>   Newlib recipe and patches for Xen stubdoms
>   PolarSSL recipe and patches for Xen stubdoms
>   GMP recipe for Xen stubdoms
>   TPM Emulator for Xen stubdoms
>   vTPM and vTPM Manager stubdoms
>
>
For this whole series (v5):
Reviewed-by: Christopher Clark <christopher.clark6@baesystems.com>

Thanks,

Christopher

--00000000000005f194056b283867
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, May 1, 2018 at 7:05 AM, Kurt Bodiker <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:kurt.bodiker@braintrust-us.com" target=3D"_blank">kurt.bodike=
r@braintrust-us.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>This patchset introduces the basic recipes necessary to build Xen<br>
stubdomains, in particular the vTPM and vTPM Manager stubdomains. vTPM<br>
stubdomains provide Xen guest domains access to a virtualized TPM. The<br>
vTPM Manager stubdomain manages each of the vTPM domains and seals them<br>
to the physical TPM. The intention of this patchset is to provide the<br>
ability to build Xen stubdomains separately from the rest of the Xen<br>
components since the stubdomains have separate dependencies that are<br>
hard-coded within the Xen build and configuration files.=C2=A0 Separating t=
he<br>
stubdomain recipes and dependencies from the rest of the Xen build gives<br=
>
the ability to use newer or different libraries than what is currently<br>
used.<br>
<br>
The stubdom.inc file defines a set of CPPFLAGS, CFLAGS, and LDFLAGS<br>
common for building all Xen stubdomains. Xen stubdomains are<br>
cross-compiled with the MiniOS, which creates some issues when trying to<br=
>
compile stubdomains in an OpenEmbedded environment. To address these<br>
issues and to ensure the stubdoms are built as Xen had intended, all of<br>
the build flags and build tools that are exported into the environment<br>
by OE have been unset. Each of the new recipes introduced here then<br>
implements the build flags and the tools as though the build had been<br>
run in the bare-metal environment.<br>
<br>
Recipes to create slightly modified source packages for lwIP amd Mini-OS<br=
>
are introduced to standardize the dependency tree among stubdomain<br>
related recipes and to avoid the hassle of maintaining the same tasks<br>
within many recipes.<br>
<br>
Xen vTPM stubdomains have depencencies on static libraries for newlib,<br>
polarssl, gmp, and tpm emulator. Xen vTPM Manager stubdomain has<br>
dependencies on static libraries for newlib and polarssl.<br>
<br>
The newlib, polarssl, gmp, and tpm emulator recipes are constructed to<br>
behave the same as a bare-metal build. These recipes are cross-compiled<br>
against both the Xen and MiniOS source code.<br>
<br>
The xen-vtpm recipe is responsible for building and installing the vTPM<br>
and vTPM Manager stubdomain images into the Xen boot directory. xen-vtpm<br=
>
would need to be added to DISTRO_FEATURES the similar for what is done<br>
for Xen.<br>
<br>
---<br>
Changes in v5:<br>
=C2=A0- Correct license in TPM Emulator recipe<br>
=C2=A0- Remove aarch64 from COMPATIBLE_HOST in stubdom.inc <br>
Changes in v4:<br>
=C2=A0- Fix whitespace errors in MiniOS, Newlib, and TPM Emulator patchfile=
s<br>
=C2=A0- Corrected type in Newlib recipe<br>
Changes in v3:<br>
=C2=A0- Limit builds to 64-bit only through COMPATIBLE_HOST <br>
=C2=A0- Change Xen version comparison logic in xen-vtpm recipe<br>
=C2=A0- Introduce MiniOS patch for GCC v7 that was not backported into the<=
br>
=C2=A0 =C2=A04.9.x releases<br>
=C2=A0- Change cross-root-${XEN_TARGET_ARCH} to cross-root-${GNU_TARGET_ARC=
H}<br>
Changes in v2:<br>
=C2=A0- Multi-line variables formatted to match OE style guide<br>
=C2=A0- SRC_URI formatted to use SRCREV rather than git tag<br>
=C2=A0- patches formatted to striplevel=3D1<br>
=C2=A0- introduced Mini-OS recipe<br>
=C2=A0- Removed Xen dependency since this is handled (mostly) by Mini-OS<br=
>
=C2=A0- Changed version number of xen-vtpm recipe to match Xen version<br>
---<br>
<br>
Kurt Bodiker (8):<br>
=C2=A0 Define standard values needed to build stubdomains<br>
=C2=A0 LWIP source code with patches applied for stubdoms<br>
=C2=A0 Mini-OS source code with make links target applied<br>
=C2=A0 Newlib recipe and patches for Xen stubdoms<br>
=C2=A0 PolarSSL recipe and patches for Xen stubdoms<br>
=C2=A0 GMP recipe for Xen stubdoms<br>
=C2=A0 TPM Emulator for Xen stubdoms<br>
=C2=A0 vTPM and vTPM Manager stubdoms<br><span class=3D"HOEnZb"><font color=
=3D"#888888"><br></font></span></blockquote><div><br></div><div>For this wh=
ole series (v5):</div><div>Reviewed-by: Christopher Clark &lt;<a href=3D"ma=
ilto:christopher.clark6@baesystems.com">christopher.clark6@baesystems.com</=
a>&gt;</div><div><br></div><div>Thanks,</div><div><br></div><div>Christophe=
r=C2=A0</div></div><br></div></div>

--00000000000005f194056b283867--
