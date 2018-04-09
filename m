Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 51C6DE00CDF; Mon,  9 Apr 2018 16:56:57 -0700 (PDT)
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
	*      [209.85.215.48 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A025FE00CD5
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Apr 2018 16:56:54 -0700 (PDT)
Received: by mail-lf0-f48.google.com with SMTP id x70-v6so9045030lfa.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 09 Apr 2018 16:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nOENkWD1Ec8ws5Zs+dWIfxQgh/HqCltsmPH+GKyK0fE=;
	b=H/EPDoFub6oE6e+Yq5w3FOhR+9Af2E5UxA+hP85BuSop71cCoe1x246ly5mrXXncPD
	MMWeNvI1mzf1LBYIGLtINBnA7tT0RZujoaseyEEO/tTyI6fefTjdTaU45L1LUy3akhoU
	M2fYxD8hk4sPKWmnF1P7izi41EbXBbtLSE2T40hrvQafubK3b6wuvPTLL2Cwy++FPtVU
	/OWJraNebd+bdtVlGdDESZ11BDLwBqu7F6SwZjuCiUlxXrpc+CQGUD37tie/Kkbf71sA
	IY1hxdFba3d62JjmIDrghmyAJOF16100RwLf0nzZ7oTTmx6zUjMsA0lJVIBK+YbprLxL
	yE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nOENkWD1Ec8ws5Zs+dWIfxQgh/HqCltsmPH+GKyK0fE=;
	b=VrrlkuJVsHRt/Nn8aKQQ3QhpNV/wkYRp7yppM3Zz6bTfB2tVcfPg91NfhiDzFbpaIh
	HOXSAoQX81Uz1k5dflseu9fAeUYD4z9YtI52rrheO4YLcwW/zTZwMpTKhF6VKkU9nDMG
	LTF7HVQ0PY0ZIXSiaU2iCGoCREQ98LtU2G8H2XLjpu0OLAx1nCMQ31Faq+TVOYxq2FCs
	il19dU7tw4X/Giovfsc7jexUM6vqr/wme8eAQhq9prhnAbUJVlB7oKujw8bJFIxHZbUU
	QxdIPFRfZFNoi8YPXqK2ZRbqmH6wCNY+i0ZWQxlYBsMelFk5MdhTAOT7yq8+MFFOvb82
	iHQg==
X-Gm-Message-State: ALQs6tBKB1DZQjRFV8rvBv8ZKISwjNyg8ouyX9KmM3qg/VAaOp3LSiYa
	5E9+veqyTU+SwBmRMS0GsXl0FFKG42PvoMZytcs=
X-Google-Smtp-Source: AIpwx486imftWVCdaQq9Ak/7SFNmYe4hoKs+c/56VsnTBuYcbCcASPKMB3BLjOPMkHF/v7ESa3oetTWsyxhhPXZsHOg=
X-Received: by 10.46.84.12 with SMTP id i12mr23562001ljb.9.1523318212874; Mon,
	09 Apr 2018 16:56:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.43.203 with HTTP; Mon, 9 Apr 2018 16:56:52 -0700 (PDT)
In-Reply-To: <cover.1522956183.git.kurt.bodiker@braintrust-us.com>
References: <cover.1522956183.git.kurt.bodiker@braintrust-us.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Mon, 9 Apr 2018 16:56:52 -0700
Message-ID: <CACMJ4GZUZhaVj3u2tP_HE_n21_MnGjot1reSpTrsuTQ2ZMwSvw@mail.gmail.com>
To: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH v2 0/8] xen: Xen vTPM stubdomains
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
X-List-Received-Date: Mon, 09 Apr 2018 23:56:57 -0000
Content-Type: multipart/alternative; boundary="f403045fb4f4f5591005697328b0"

--f403045fb4f4f5591005697328b0
Content-Type: text/plain; charset="UTF-8"

Kurt,

I've reviewed the patches today and all the improvements look good.

Unfortunately, in performing a build with the patches applied to rocko, I
encountered a link error when attempting:
  bitbake xen-vtpm
Details and output are below.

A separate minor thing I saw in patch 1 was that "no-red-zone" is applied
to STUBDOM_CFLAGS unconditionally, whereas in the original Xen Makefile,
it's only set for 64-bit target builds - I haven't inspected further
though, or attempted a 32-bit target build yet as my 64-bit build didn't
succeed.

Christopher


Build description:

Source: rocko branches of each of:
git://git.yoctoproject.org/poky.git
git://git.openembedded.org/meta-openembedded
git://git.yoctoproject.org/meta-virtualization

and applied the 8 proposed patches applied to meta-virtualization
(on top of the rocko branch).

Build host is x86_64, running Debian 8.8 with gcc 4.9.2

local.conf settings:

MACHINE = "genericx86-64"
DISTRO_FEATURES_append = " xen virtualization"
BB_NUMBER_THREADS ?= "8"
PARALLEL_MAKE ?= "-j 4"

Error encountered:
| x86_64-poky-linux-ld
--sysroot=/mnt/3build/review-vtpm/poky/build/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-r0/recipe-sysroot
   -nostdlib
 -L/mnt/3build/review-vtpm/poky/build/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-r0/recipe-sysroot/cross-root-x86_64/x86_64-xen-elf/lib
 -m elf_x86_64 -T
/mnt/3build/review-vtpm/poky/build/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-r0/stubdom/mini-os-x86_64-vtpmmgr/arch/x86/minios-x86_64.lds
/mnt/3build/review-vtpm/poky/build/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-r0/stubdom/mini-os-x86_64-vtpmmgr/mini-os.o
-o
/mnt/3build/review-vtpm/poky/build/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-r0/stubdom/mini-os-x86_64-vtpmmgr/mini-os
|
/mnt/3build/review-vtpm/poky/build/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-r0/stubdom/mini-os-x86_64-vtpmmgr/mini-os.o:
In function `vtpmmgr_GroupRegister':
| vtpm_cmd_handler.c:(.text+0x38ab): undefined reference to `tpmrsa_free'
| vtpm_cmd_handler.c:(.text+0x3b6e): undefined reference to `tpmrsa_free'
|
/mnt/3build/review-vtpm/poky/build/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-r0/stubdom/mini-os-x86_64-vtpmmgr/mini-os.o:
In function `vtpmmgr_handle_cmd':
| gdtoa-hexnan.c:(.text+0x4ac6): undefined reference to `tpmrsa_free'
|
/mnt/3build/review-vtpm/poky/build/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-r0/stubdom/mini-os-x86_64-vtpmmgr/mini-os.o:
In function `TPM_TakeOwnership':
| gdtoa-hexnan.c:(.text+0x7e33): undefined reference to `unpack3_TPM_KEY'
| gdtoa-hexnan.c:(.text+0x7e67): undefined reference to `unpack3_TPM_KEY'
| gdtoa-hexnan.c:(.text+0x7ec8): undefined reference to
`unpack3_TPM_AUTH_SESSION'
| gdtoa-hexnan.c:(.text+0x7f68): undefined reference to `free_TPM_KEY'
|
/mnt/3build/review-vtpm/poky/build/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-r0/stubdom/mini-os-x86_64-vtpmmgr/mini-os.o:
In function `TPM_Seal':
| gdtoa-hexnan.c:(.text+0x8b76): undefined reference to
`unpack3_TPM_STORED_DATA12'
| gdtoa-hexnan.c:(.text+0x8bd7): undefined reference to
`unpack3_TPM_AUTH_SESSION'
|
/mnt/3build/review-vtpm/poky/build/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-r0/stubdom/mini-os-x86_64-vtpmmgr/mini-os.o:
In function `TPM_Unseal':
| gdtoa-hexnan.c:(.text+0x9115): undefined reference to `unpack_ALLOC'
| gdtoa-hexnan.c:(.text+0x9169): undefined reference to
`unpack3_TPM_AUTH_SESSION'
| gdtoa-hexnan.c:(.text+0x91a3): undefined reference to
`unpack3_TPM_AUTH_SESSION'
|
/mnt/3build/review-vtpm/poky/build/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-r0/stubdom/mini-os-x86_64-vtpmmgr/mini-os.o:
In function `TPM_LoadKey':
| gdtoa-hexnan.c:(.text+0x9809): undefined reference to
`unpack3_TPM_AUTH_SESSION'
|
/mnt/3build/review-vtpm/poky/build/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-r0/stubdom/mini-os-x86_64-vtpmmgr/mini-os.o:
In function `TPM_ReadPubek':
| gdtoa-hexnan.c:(.text+0x9cd3): undefined reference to
`unpack3_TPM_RSA_KEY_PARMS'
| gdtoa-hexnan.c:(.text+0x9cf8): undefined reference to
`unpack3_TPM_SYMMETRIC_KEY_PARMS'
| gdtoa-hexnan.c:(.text+0x9d57): undefined reference to `unpack3_PTR'
|
/mnt/3build/review-vtpm/poky/build/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-r0/stubdom/mini-os-x86_64-vtpmmgr/mini-os.o:
In function `TPM_GetCapability':
| gdtoa-hexnan.c:(.text+0xa23d): undefined reference to `unpack_ALLOC'
|
/mnt/3build/review-vtpm/poky/build/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-r0/stubdom/mini-os-x86_64-vtpmmgr/mini-os.o:
In function `TPM_CreateEndorsementKeyPair':
| gdtoa-hexnan.c:(.text+0xa55c): undefined reference to
`unpack3_TPM_RSA_KEY_PARMS'
| gdtoa-hexnan.c:(.text+0xa580): undefined reference to
`unpack3_TPM_SYMMETRIC_KEY_PARMS'
| gdtoa-hexnan.c:(.text+0xa5dd): undefined reference to `unpack3_PTR'
|
/mnt/3build/review-vtpm/poky/build/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-r0/stubdom/mini-os-x86_64-vtpmmgr/mini-os.o:
In function `TPM_MakeIdentity':
| gdtoa-hexnan.c:(.text+0xad87): undefined reference to `unpack3_TPM_KEY'
| gdtoa-hexnan.c:(.text+0xae09): undefined reference to `unpack_ALLOC'
| gdtoa-hexnan.c:(.text+0xae6c): undefined reference to
`unpack3_TPM_AUTH_SESSION'
| gdtoa-hexnan.c:(.text+0xaea9): undefined reference to
`unpack3_TPM_AUTH_SESSION'
|
/mnt/3build/review-vtpm/poky/build/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-r0/stubdom/mini-os-x86_64-vtpmmgr/mini-os.o:
In function `TPM_ActivateIdentity':
| gdtoa-hexnan.c:(.text+0xb30d): undefined reference to
`unpack3_TPM_SYMMETRIC_KEY'
| gdtoa-hexnan.c:(.text+0xb37b): undefined reference to
`unpack3_TPM_AUTH_SESSION'
| gdtoa-hexnan.c:(.text+0xb3b4): undefined reference to
`unpack3_TPM_AUTH_SESSION'
|
/mnt/3build/review-vtpm/poky/build/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-r0/stubdom/mini-os-x86_64-vtpmmgr/mini-os.o:
In function `TPM_Quote':
| gdtoa-hexnan.c:(.text+0xb756): undefined reference to
`unpack3_TPM_PCR_COMPOSITE'
| gdtoa-hexnan.c:(.text+0xb7c2): undefined reference to `unpack_ALLOC'
| gdtoa-hexnan.c:(.text+0xb81b): undefined reference to
`unpack3_TPM_AUTH_SESSION'
|
/mnt/3build/review-vtpm/poky/build/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-r0/stubdom/mini-os-x86_64-vtpmmgr/mini-os.o:
In function `TPM2_Create':
| gdtoa-hexnan.c:(.text+0xc794): undefined reference to
`unpack_TPMS_ECC_POINT'
|
/mnt/3build/review-vtpm/poky/build/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-r0/stubdom/mini-os-x86_64-vtpmmgr/mini-os.o:
In function `TPM2_CreatePrimary':
| gdtoa-hexnan.c:(.text+0xd20d): undefined reference to
`unpack_TPMS_ECC_POINT'
| Makefile:165: recipe for target
'/mnt/3build/review-vtpm/poky/build/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-r0/stubdom/mini-os-x86_64-vtpmmgr/mini-os'
failed
| make: ***
[/mnt/3build/review-vtpm/poky/build/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-r0/stubdom/mini-os-x86_64-vtpmmgr/mini-os]
Error 1
| make: Leaving directory
'/mnt/3build/review-vtpm/poky/build/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-r0/recipe-sysroot/cross-root-x86_64/mini-os'
| WARNING: exit code 2 from a shell command.
| ERROR: Function failed: do_compile (log file is located at
/mnt/3build/review-vtpm/poky/build/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-r0/temp/log.do_compile.6524)
ERROR: Task
(/mnt/3build/review-vtpm/poky/meta-virtualization/recipes-extended/xen/xen-vtpm_4.9.0.bb:do_compile)
failed with exit code '1'
NOTE: Tasks Summary: Attempted 859 tasks of which 0 didn't need to be rerun
and 1 failed.

Summary: 1 task failed:

/mnt/3build/review-vtpm/poky/meta-virtualization/recipes-extended/xen/xen-vtpm_4.9.0.bb:
do_compile
Summary: There was 1 ERROR message shown, returning a non-zero exit code.


On Fri, Apr 6, 2018 at 10:06 AM, Kurt Bodiker <
kurt.bodiker@braintrust-us.com> wrote:

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
>  .../lwip.dhcp_create_request-hwaddr_len.patch      |   13 +
>  recipes-extended/xen/files/lwip.patch-cvs          | 2398
> ++++++++++++++++++++
>  recipes-extended/xen/files/newlib-chk.patch        |  155 ++
>  .../newlib-stdint-size_max-fix-from-1.17.0.patch   |   16 +
>  recipes-extended/xen/files/newlib.patch            |  727 ++++++
>  recipes-extended/xen/files/polarssl.patch          |   64 +
>  recipes-extended/xen/files/tpmemu-0.7.4.patch      |   12 +
>  recipes-extended/xen/files/vtpm-bufsize.patch      |   13 +
>  recipes-extended/xen/files/vtpm-cmake-Wextra.patch |   21 +
>  .../xen/files/vtpm-deepquote-anyloc.patch          |  127 ++
>  recipes-extended/xen/files/vtpm-deepquote.patch    |  187 ++
>  .../xen/files/vtpm-implicit-fallthrough.patch      |   10 +
>  recipes-extended/xen/files/vtpm-locality.patch     |   50 +
>  .../xen/files/vtpm-parent-sign-ek.patch            |  196 ++
>  recipes-extended/xen/lwip.inc                      |   24 +
>  recipes-extended/xen/lwip_1.3.0.bb                 |   19 +
>  recipes-extended/xen/mini-os.inc                   |   28 +
>  recipes-extended/xen/mini-os_4.9.0.bb              |   17 +
>  recipes-extended/xen/newlib.inc                    |   64 +
>  recipes-extended/xen/newlib_1.16.0.bb              |   21 +
>  recipes-extended/xen/polarssl.inc                  |   27 +
>  recipes-extended/xen/polarssl_1.1.4.bb             |   19 +
>  recipes-extended/xen/stubdom-gmp.inc               |   42 +
>  recipes-extended/xen/stubdom-gmp_4.3.2.bb          |   20 +
>  recipes-extended/xen/stubdom.inc                   |  150 ++
>  recipes-extended/xen/tpm-emulator.inc              |   37 +
>  recipes-extended/xen/tpm-emulator_0.7.4.bb         |   26 +
>  recipes-extended/xen/xen-vtpm.inc                  |   98 +
>  recipes-extended/xen/xen-vtpm_4.9.0.bb             |   21 +
>  29 files changed, 4602 insertions(+)
>  create mode 100644 recipes-extended/xen/files/lwip.dhcp_create_request-
> hwaddr_len.patch
>  create mode 100644 recipes-extended/xen/files/lwip.patch-cvs
>  create mode 100644 recipes-extended/xen/files/newlib-chk.patch
>  create mode 100644 recipes-extended/xen/files/newlib-stdint-size_max-fix-
> from-1.17.0.patch
>  create mode 100644 recipes-extended/xen/files/newlib.patch
>  create mode 100644 recipes-extended/xen/files/polarssl.patch
>  create mode 100644 recipes-extended/xen/files/tpmemu-0.7.4.patch
>  create mode 100644 recipes-extended/xen/files/vtpm-bufsize.patch
>  create mode 100644 recipes-extended/xen/files/vtpm-cmake-Wextra.patch
>  create mode 100644 recipes-extended/xen/files/vtpm-deepquote-anyloc.patch
>  create mode 100644 recipes-extended/xen/files/vtpm-deepquote.patch
>  create mode 100644 recipes-extended/xen/files/vtpm-implicit-fallthrough.
> patch
>  create mode 100644 recipes-extended/xen/files/vtpm-locality.patch
>  create mode 100644 recipes-extended/xen/files/vtpm-parent-sign-ek.patch
>  create mode 100644 recipes-extended/xen/lwip.inc
>  create mode 100644 recipes-extended/xen/lwip_1.3.0.bb
>  create mode 100644 recipes-extended/xen/mini-os.inc
>  create mode 100644 recipes-extended/xen/mini-os_4.9.0.bb
>  create mode 100644 recipes-extended/xen/newlib.inc
>  create mode 100644 recipes-extended/xen/newlib_1.16.0.bb
>  create mode 100644 recipes-extended/xen/polarssl.inc
>  create mode 100644 recipes-extended/xen/polarssl_1.1.4.bb
>  create mode 100644 recipes-extended/xen/stubdom-gmp.inc
>  create mode 100644 recipes-extended/xen/stubdom-gmp_4.3.2.bb
>  create mode 100644 recipes-extended/xen/stubdom.inc
>  create mode 100644 recipes-extended/xen/tpm-emulator.inc
>  create mode 100644 recipes-extended/xen/tpm-emulator_0.7.4.bb
>  create mode 100644 recipes-extended/xen/xen-vtpm.inc
>  create mode 100644 recipes-extended/xen/xen-vtpm_4.9.0.bb
>
> --
> 2.14.2
>
>
> --
>
> *This email and all attachments are considered confidential and the
> proprietary information of BrainTrust Holdings.  Unauthorized disclosure is
> prohibited.  *
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

--f403045fb4f4f5591005697328b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Kurt,</div><div><br></div><div>I&#39;ve reviewed the =
patches today and all the improvements look good.</div><div><br></div><div>=
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:sm=
all;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norma=
l;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;text-decoration-style=
:initial;text-decoration-color:initial">Unfortunately, in performing a buil=
d with the patches applied to rocko, I encountered a link error when attemp=
ting:</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;f=
ont-size:small;font-style:normal;font-variant-ligatures:normal;font-variant=
-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-in=
dent:0px;text-transform:none;white-space:normal;word-spacing:0px;text-decor=
ation-style:initial;text-decoration-color:initial">=C2=A0 bitbake xen-vtpm<=
/div>Details and output are below.<br class=3D"gmail-Apple-interchange-newl=
ine"><br></div><div>A separate minor thing I saw in patch 1 was that &quot;=
no-red-zone&quot; is applied to STUBDOM_CFLAGS unconditionally, whereas in =
the original Xen Makefile, it&#39;s only set for 64-bit target builds - I h=
aven&#39;t inspected further though, or attempted a 32-bit target build yet=
 as my 64-bit build didn&#39;t succeed.</div><div><br></div><div>Christophe=
r</div><div><br></div><div><br></div><div>Build description:</div><div><br>=
</div><div>Source: rocko branches of each of:</div><div>git://<a href=3D"ht=
tp://git.yoctoproject.org/poky.git">git.yoctoproject.org/poky.git</a></div>=
<div>git://<a href=3D"http://git.openembedded.org/meta-openembedded">git.op=
enembedded.org/meta-openembedded</a></div><div>git://<a href=3D"http://git.=
yoctoproject.org/meta-virtualization">git.yoctoproject.org/meta-virtualizat=
ion</a></div><div><br></div><div>and applied the 8 proposed patches applied=
 to meta-virtualization</div><div>(on top of the rocko branch).</div><div><=
br></div><div>Build host is x86_64, running Debian 8.8 with gcc 4.9.2</div>=
<div><br></div><div>local.conf settings:</div><div><br></div><div>MACHINE =
=3D &quot;genericx86-64&quot;</div><div>DISTRO_FEATURES_append =3D &quot; x=
en virtualization&quot;</div><div>BB_NUMBER_THREADS ?=3D &quot;8&quot;</div=
><div>PARALLEL_MAKE ?=3D &quot;-j 4&quot;</div><div><br></div><div>Error en=
countered:</div><div><div>| x86_64-poky-linux-ld --sysroot=3D/mnt/3build/re=
view-vtpm/poky/build/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-r0/recipe-=
sysroot=C2=A0 =C2=A0 =C2=A0-nostdlib=C2=A0 =C2=A0 =C2=A0-L/mnt/3build/revie=
w-vtpm/poky/build/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-r0/recipe-sys=
root/cross-root-x86_64/x86_64-xen-elf/lib=C2=A0 =C2=A0-m elf_x86_64 -T /mnt=
/3build/review-vtpm/poky/build/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-=
r0/stubdom/mini-os-x86_64-vtpmmgr/arch/x86/minios-x86_64.lds=C2=A0 /mnt/3bu=
ild/review-vtpm/poky/build/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-r0/s=
tubdom/mini-os-x86_64-vtpmmgr/mini-os.o=C2=A0 -o /mnt/3build/review-vtpm/po=
ky/build/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-r0/stubdom/mini-os-x86=
_64-vtpmmgr/mini-os</div><div>| /mnt/3build/review-vtpm/poky/build/tmp/work=
/core2-64-poky-linux/xen-vtpm/4.9.0-r0/stubdom/mini-os-x86_64-vtpmmgr/mini-=
os.o: In function `vtpmmgr_GroupRegister&#39;:</div><div>| vtpm_cmd_handler=
.c:(.text+0x38ab): undefined reference to `tpmrsa_free&#39;</div><div>| vtp=
m_cmd_handler.c:(.text+0x3b6e): undefined reference to `tpmrsa_free&#39;</d=
iv><div>| /mnt/3build/review-vtpm/poky/build/tmp/work/core2-64-poky-linux/x=
en-vtpm/4.9.0-r0/stubdom/mini-os-x86_64-vtpmmgr/mini-os.o: In function `vtp=
mmgr_handle_cmd&#39;:</div><div>| gdtoa-hexnan.c:(.text+0x4ac6): undefined =
reference to `tpmrsa_free&#39;</div><div>| /mnt/3build/review-vtpm/poky/bui=
ld/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-r0/stubdom/mini-os-x86_64-vt=
pmmgr/mini-os.o: In function `TPM_TakeOwnership&#39;:</div><div>| gdtoa-hex=
nan.c:(.text+0x7e33): undefined reference to `unpack3_TPM_KEY&#39;</div><di=
v>| gdtoa-hexnan.c:(.text+0x7e67): undefined reference to `unpack3_TPM_KEY&=
#39;</div><div>| gdtoa-hexnan.c:(.text+0x7ec8): undefined reference to `unp=
ack3_TPM_AUTH_SESSION&#39;</div><div>| gdtoa-hexnan.c:(.text+0x7f68): undef=
ined reference to `free_TPM_KEY&#39;</div><div>| /mnt/3build/review-vtpm/po=
ky/build/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-r0/stubdom/mini-os-x86=
_64-vtpmmgr/mini-os.o: In function `TPM_Seal&#39;:</div><div>| gdtoa-hexnan=
.c:(.text+0x8b76): undefined reference to `unpack3_TPM_STORED_DATA12&#39;</=
div><div>| gdtoa-hexnan.c:(.text+0x8bd7): undefined reference to `unpack3_T=
PM_AUTH_SESSION&#39;</div><div>| /mnt/3build/review-vtpm/poky/build/tmp/wor=
k/core2-64-poky-linux/xen-vtpm/4.9.0-r0/stubdom/mini-os-x86_64-vtpmmgr/mini=
-os.o: In function `TPM_Unseal&#39;:</div><div>| gdtoa-hexnan.c:(.text+0x91=
15): undefined reference to `unpack_ALLOC&#39;</div><div>| gdtoa-hexnan.c:(=
.text+0x9169): undefined reference to `unpack3_TPM_AUTH_SESSION&#39;</div><=
div>| gdtoa-hexnan.c:(.text+0x91a3): undefined reference to `unpack3_TPM_AU=
TH_SESSION&#39;</div><div>| /mnt/3build/review-vtpm/poky/build/tmp/work/cor=
e2-64-poky-linux/xen-vtpm/4.9.0-r0/stubdom/mini-os-x86_64-vtpmmgr/mini-os.o=
: In function `TPM_LoadKey&#39;:</div><div>| gdtoa-hexnan.c:(.text+0x9809):=
 undefined reference to `unpack3_TPM_AUTH_SESSION&#39;</div><div>| /mnt/3bu=
ild/review-vtpm/poky/build/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-r0/s=
tubdom/mini-os-x86_64-vtpmmgr/mini-os.o: In function `TPM_ReadPubek&#39;:</=
div><div>| gdtoa-hexnan.c:(.text+0x9cd3): undefined reference to `unpack3_T=
PM_RSA_KEY_PARMS&#39;</div><div>| gdtoa-hexnan.c:(.text+0x9cf8): undefined =
reference to `unpack3_TPM_SYMMETRIC_KEY_PARMS&#39;</div><div>| gdtoa-hexnan=
.c:(.text+0x9d57): undefined reference to `unpack3_PTR&#39;</div><div>| /mn=
t/3build/review-vtpm/poky/build/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0=
-r0/stubdom/mini-os-x86_64-vtpmmgr/mini-os.o: In function `TPM_GetCapabilit=
y&#39;:</div><div>| gdtoa-hexnan.c:(.text+0xa23d): undefined reference to `=
unpack_ALLOC&#39;</div><div>| /mnt/3build/review-vtpm/poky/build/tmp/work/c=
ore2-64-poky-linux/xen-vtpm/4.9.0-r0/stubdom/mini-os-x86_64-vtpmmgr/mini-os=
.o: In function `TPM_CreateEndorsementKeyPair&#39;:</div><div>| gdtoa-hexna=
n.c:(.text+0xa55c): undefined reference to `unpack3_TPM_RSA_KEY_PARMS&#39;<=
/div><div>| gdtoa-hexnan.c:(.text+0xa580): undefined reference to `unpack3_=
TPM_SYMMETRIC_KEY_PARMS&#39;</div><div>| gdtoa-hexnan.c:(.text+0xa5dd): und=
efined reference to `unpack3_PTR&#39;</div><div>| /mnt/3build/review-vtpm/p=
oky/build/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-r0/stubdom/mini-os-x8=
6_64-vtpmmgr/mini-os.o: In function `TPM_MakeIdentity&#39;:</div><div>| gdt=
oa-hexnan.c:(.text+0xad87): undefined reference to `unpack3_TPM_KEY&#39;</d=
iv><div>| gdtoa-hexnan.c:(.text+0xae09): undefined reference to `unpack_ALL=
OC&#39;</div><div>| gdtoa-hexnan.c:(.text+0xae6c): undefined reference to `=
unpack3_TPM_AUTH_SESSION&#39;</div><div>| gdtoa-hexnan.c:(.text+0xaea9): un=
defined reference to `unpack3_TPM_AUTH_SESSION&#39;</div><div>| /mnt/3build=
/review-vtpm/poky/build/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-r0/stub=
dom/mini-os-x86_64-vtpmmgr/mini-os.o: In function `TPM_ActivateIdentity&#39=
;:</div><div>| gdtoa-hexnan.c:(.text+0xb30d): undefined reference to `unpac=
k3_TPM_SYMMETRIC_KEY&#39;</div><div>| gdtoa-hexnan.c:(.text+0xb37b): undefi=
ned reference to `unpack3_TPM_AUTH_SESSION&#39;</div><div>| gdtoa-hexnan.c:=
(.text+0xb3b4): undefined reference to `unpack3_TPM_AUTH_SESSION&#39;</div>=
<div>| /mnt/3build/review-vtpm/poky/build/tmp/work/core2-64-poky-linux/xen-=
vtpm/4.9.0-r0/stubdom/mini-os-x86_64-vtpmmgr/mini-os.o: In function `TPM_Qu=
ote&#39;:</div><div>| gdtoa-hexnan.c:(.text+0xb756): undefined reference to=
 `unpack3_TPM_PCR_COMPOSITE&#39;</div><div>| gdtoa-hexnan.c:(.text+0xb7c2):=
 undefined reference to `unpack_ALLOC&#39;</div><div>| gdtoa-hexnan.c:(.tex=
t+0xb81b): undefined reference to `unpack3_TPM_AUTH_SESSION&#39;</div><div>=
| /mnt/3build/review-vtpm/poky/build/tmp/work/core2-64-poky-linux/xen-vtpm/=
4.9.0-r0/stubdom/mini-os-x86_64-vtpmmgr/mini-os.o: In function `TPM2_Create=
&#39;:</div><div>| gdtoa-hexnan.c:(.text+0xc794): undefined reference to `u=
npack_TPMS_ECC_POINT&#39;</div><div>| /mnt/3build/review-vtpm/poky/build/tm=
p/work/core2-64-poky-linux/xen-vtpm/4.9.0-r0/stubdom/mini-os-x86_64-vtpmmgr=
/mini-os.o: In function `TPM2_CreatePrimary&#39;:</div><div>| gdtoa-hexnan.=
c:(.text+0xd20d): undefined reference to `unpack_TPMS_ECC_POINT&#39;</div><=
div>| Makefile:165: recipe for target &#39;/mnt/3build/review-vtpm/poky/bui=
ld/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-r0/stubdom/mini-os-x86_64-vt=
pmmgr/mini-os&#39; failed</div><div>| make: *** [/mnt/3build/review-vtpm/po=
ky/build/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-r0/stubdom/mini-os-x86=
_64-vtpmmgr/mini-os] Error 1</div><div>| make: Leaving directory &#39;/mnt/=
3build/review-vtpm/poky/build/tmp/work/core2-64-poky-linux/xen-vtpm/4.9.0-r=
0/recipe-sysroot/cross-root-x86_64/mini-os&#39;</div><div>| WARNING: exit c=
ode 2 from a shell command.</div><div>| ERROR: Function failed: do_compile =
(log file is located at /mnt/3build/review-vtpm/poky/build/tmp/work/core2-6=
4-poky-linux/xen-vtpm/4.9.0-r0/temp/log.do_compile.6524)</div><div>ERROR: T=
ask (/mnt/3build/review-vtpm/poky/meta-virtualization/recipes-extended/xen/=
xen-vtpm_4.9.0.bb:do_compile) failed with exit code &#39;1&#39;</div><div>N=
OTE: Tasks Summary: Attempted 859 tasks of which 0 didn&#39;t need to be re=
run and 1 failed.</div><div><br></div><div>Summary: 1 task failed:</div><di=
v>=C2=A0 /mnt/3build/review-vtpm/poky/meta-virtualization/recipes-extended/=
xen/xen-vtpm_4.9.0.bb:do_compile</div><div>Summary: There was 1 ERROR messa=
ge shown, returning a non-zero exit code.</div></div><div><br></div></div><=
div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Apr 6, 201=
8 at 10:06 AM, Kurt Bodiker <span dir=3D"ltr">&lt;<a href=3D"mailto:kurt.bo=
diker@braintrust-us.com" target=3D"_blank">kurt.bodiker@braintrust-us.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This patchset introd=
uces the basic recipes necessary to build Xen<br>
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
=C2=A0 vTPM and vTPM Manager stubdoms<br>
<br>
=C2=A0.../lwip.dhcp_create_request-<wbr>hwaddr_len.patch=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A013 +<br>
=C2=A0recipes-extended/xen/files/<wbr>lwip.patch-cvs=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 2398 ++++++++++++++++++++<br>
=C2=A0recipes-extended/xen/files/<wbr>newlib-chk.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 155 ++<br>
=C2=A0.../newlib-stdint-size_max-<wbr>fix-from-1.17.0.patch=C2=A0 =C2=A0|=
=C2=A0 =C2=A016 +<br>
=C2=A0recipes-extended/xen/files/<wbr>newlib.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 727 ++++++<br>
=C2=A0recipes-extended/xen/files/<wbr>polarssl.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A064 +<br>
=C2=A0recipes-extended/xen/files/<wbr>tpmemu-0.7.4.patch=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A012 +<br>
=C2=A0recipes-extended/xen/files/<wbr>vtpm-bufsize.patch=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A013 +<br>
=C2=A0recipes-extended/xen/files/<wbr>vtpm-cmake-Wextra.patch |=C2=A0 =C2=
=A021 +<br>
=C2=A0.../xen/files/vtpm-deepquote-<wbr>anyloc.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 127 ++<br>
=C2=A0recipes-extended/xen/files/<wbr>vtpm-deepquote.patch=C2=A0 =C2=A0 |=
=C2=A0 187 ++<br>
=C2=A0.../xen/files/vtpm-implicit-<wbr>fallthrough.patch=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A010 +<br>
=C2=A0recipes-extended/xen/files/<wbr>vtpm-locality.patch=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A050 +<br>
=C2=A0.../xen/files/vtpm-parent-<wbr>sign-ek.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 196 ++<br>
=C2=A0recipes-extended/xen/lwip.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A024 +<br>
=C2=A0recipes-extended/xen/<a href=3D"http://lwip_1.3.0.bb" rel=3D"noreferr=
er" target=3D"_blank">lwip_1.3.<wbr>0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A019 +<br>
=C2=A0recipes-extended/xen/mini-os.<wbr>inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A028 +<br>
=C2=A0recipes-extended/xen/<a href=3D"http://mini-os_4.9.0.bb" rel=3D"noref=
errer" target=3D"_blank">mini-os_<wbr>4.9.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A017 +<br>
=C2=A0recipes-extended/xen/newlib.<wbr>inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A064 +<br>
=C2=A0recipes-extended/xen/<a href=3D"http://newlib_1.16.0.bb" rel=3D"noref=
errer" target=3D"_blank">newlib_1.<wbr>16.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A021 +<br>
=C2=A0recipes-extended/xen/polarssl.<wbr>inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A027 +<br>
=C2=A0recipes-extended/xen/<a href=3D"http://polarssl_1.1.4.bb" rel=3D"nore=
ferrer" target=3D"_blank">polarssl_<wbr>1.1.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A019 +<br>
=C2=A0recipes-extended/xen/stubdom-<wbr>gmp.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A042 +<br>
=C2=A0recipes-extended/xen/<a href=3D"http://stubdom-gmp_4.3.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">stubdom-<wbr>gmp_4.3.2.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A020 +<br>
=C2=A0recipes-extended/xen/stubdom.<wbr>inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 150 ++<br>
=C2=A0recipes-extended/xen/tpm-<wbr>emulator.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A037 +<br>
=C2=A0recipes-extended/xen/<a href=3D"http://tpm-emulator_0.7.4.bb" rel=3D"=
noreferrer" target=3D"_blank">tpm-<wbr>emulator_0.7.4.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A026 +<br>
=C2=A0recipes-extended/xen/xen-vtpm.<wbr>inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A098 +<br>
=C2=A0recipes-extended/xen/<a href=3D"http://xen-vtpm_4.9.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">xen-vtpm_<wbr>4.9.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A021 +<br>
=C2=A029 files changed, 4602 insertions(+)<br>
=C2=A0create mode 100644 recipes-extended/xen/files/<wbr>lwip.dhcp_create_r=
equest-<wbr>hwaddr_len.patch<br>
=C2=A0create mode 100644 recipes-extended/xen/files/<wbr>lwip.patch-cvs<br>
=C2=A0create mode 100644 recipes-extended/xen/files/<wbr>newlib-chk.patch<b=
r>
=C2=A0create mode 100644 recipes-extended/xen/files/<wbr>newlib-stdint-size=
_max-fix-<wbr>from-1.17.0.patch<br>
=C2=A0create mode 100644 recipes-extended/xen/files/<wbr>newlib.patch<br>
=C2=A0create mode 100644 recipes-extended/xen/files/<wbr>polarssl.patch<br>
=C2=A0create mode 100644 recipes-extended/xen/files/<wbr>tpmemu-0.7.4.patch=
<br>
=C2=A0create mode 100644 recipes-extended/xen/files/<wbr>vtpm-bufsize.patch=
<br>
=C2=A0create mode 100644 recipes-extended/xen/files/<wbr>vtpm-cmake-Wextra.=
patch<br>
=C2=A0create mode 100644 recipes-extended/xen/files/<wbr>vtpm-deepquote-any=
loc.patch<br>
=C2=A0create mode 100644 recipes-extended/xen/files/<wbr>vtpm-deepquote.pat=
ch<br>
=C2=A0create mode 100644 recipes-extended/xen/files/<wbr>vtpm-implicit-fall=
through.<wbr>patch<br>
=C2=A0create mode 100644 recipes-extended/xen/files/<wbr>vtpm-locality.patc=
h<br>
=C2=A0create mode 100644 recipes-extended/xen/files/<wbr>vtpm-parent-sign-e=
k.patch<br>
=C2=A0create mode 100644 recipes-extended/xen/lwip.inc<br>
=C2=A0create mode 100644 recipes-extended/xen/<a href=3D"http://lwip_1.3.0.=
bb" rel=3D"noreferrer" target=3D"_blank">lwip_1.3.<wbr>0.bb</a><br>
=C2=A0create mode 100644 recipes-extended/xen/mini-os.<wbr>inc<br>
=C2=A0create mode 100644 recipes-extended/xen/<a href=3D"http://mini-os_4.9=
.0.bb" rel=3D"noreferrer" target=3D"_blank">mini-os_<wbr>4.9.0.bb</a><br>
=C2=A0create mode 100644 recipes-extended/xen/newlib.<wbr>inc<br>
=C2=A0create mode 100644 recipes-extended/xen/<a href=3D"http://newlib_1.16=
.0.bb" rel=3D"noreferrer" target=3D"_blank">newlib_1.<wbr>16.0.bb</a><br>
=C2=A0create mode 100644 recipes-extended/xen/polarssl.<wbr>inc<br>
=C2=A0create mode 100644 recipes-extended/xen/<a href=3D"http://polarssl_1.=
1.4.bb" rel=3D"noreferrer" target=3D"_blank">polarssl_<wbr>1.1.4.bb</a><br>
=C2=A0create mode 100644 recipes-extended/xen/stubdom-<wbr>gmp.inc<br>
=C2=A0create mode 100644 recipes-extended/xen/<a href=3D"http://stubdom-gmp=
_4.3.2.bb" rel=3D"noreferrer" target=3D"_blank">stubdom-<wbr>gmp_4.3.2.bb</=
a><br>
=C2=A0create mode 100644 recipes-extended/xen/stubdom.<wbr>inc<br>
=C2=A0create mode 100644 recipes-extended/xen/tpm-<wbr>emulator.inc<br>
=C2=A0create mode 100644 recipes-extended/xen/<a href=3D"http://tpm-emulato=
r_0.7.4.bb" rel=3D"noreferrer" target=3D"_blank">tpm-<wbr>emulator_0.7.4.bb=
</a><br>
=C2=A0create mode 100644 recipes-extended/xen/xen-vtpm.<wbr>inc<br>
=C2=A0create mode 100644 recipes-extended/xen/<a href=3D"http://xen-vtpm_4.=
9.0.bb" rel=3D"noreferrer" target=3D"_blank">xen-vtpm_<wbr>4.9.0.bb</a><br>
<br>
--<br>
2.14.2<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
--<br>
<br>
*This email and all attachments are considered confidential and the<br>
proprietary information of BrainTrust Holdings.=C2=A0 Unauthorized disclosu=
re is<br>
prohibited.=C2=A0 *<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br></div>

--f403045fb4f4f5591005697328b0--
