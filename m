Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 07EBFE00873; Fri, 20 Feb 2015 18:18:22 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.45 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37B05E0078E
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Feb 2015 18:18:17 -0800 (PST)
Received: by labge10 with SMTP id ge10so9493687lab.12
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Feb 2015 18:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=zNhKHVR6tEU7bP5oczes+llbpatOSdeyanDH+fgGVuA=;
	b=iutUwxx6fU3ZBUw7yWjnLnr98ZCL02PpUyulPRPfjArzEVWRC+M4ItnfSwKl+kcS/t
	M8iQsSDHTBY60W3w5Bt6eaYBeciIojZrjMIxCwcf6ee21DNxt1FWK1kFyhraMjOqw3bf
	4Ro9J2ROIomeZlhZtSK+pThwWLINahbw4IpWmdimUe8vTsZZfyplgc1nDNrly/o2nshH
	mCYMiJJxx+XwtYNXNEDPgwNEWwmseilxbIt1j+bDVtWIyAcsuCQzuTl/CMbQgV1lk9OK
	D4W6EBvBGWJCQd7FSEBCEZ+4M4wQvUn1z1dHA4H5uTe0F7ARgrVUMNNTfvd54e8c8w9d
	xIWw==
MIME-Version: 1.0
X-Received: by 10.152.115.169 with SMTP id jp9mr398991lab.121.1424485094934;
	Fri, 20 Feb 2015 18:18:14 -0800 (PST)
Received: by 10.112.40.11 with HTTP; Fri, 20 Feb 2015 18:18:14 -0800 (PST)
In-Reply-To: <a1cf9e8fd22746b8bc3b3017c13067b5@BL2FFO11FD050.protection.gbl>
References: <a1cf9e8fd22746b8bc3b3017c13067b5@BL2FFO11FD050.protection.gbl>
Date: Fri, 20 Feb 2015 21:18:14 -0500
Message-ID: <CADkTA4MD62xW6UKOH=SXwXzQ+SimGYBuPJncmGAmHXJitLCMag@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Nathan Rossi <nathan.rossi@xilinx.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 00/14] Update to Xen 4.5.0 and add AArch64 support
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
X-List-Received-Date: Sat, 21 Feb 2015 02:18:22 -0000
Content-Type: text/plain; charset=UTF-8

The soak time has passed, so I went ahead and merged this.

Follow up patches are welcome if anything breaks :)

Cheers,

Bruce

On Mon, Feb 16, 2015 at 3:34 AM, Nathan Rossi <nathan.rossi@xilinx.com> wrote:
> This patch series updates the Xen recipes to use version 4.5.0 as well as
> refactoring and adding support for AArch64.
>
> This series changes some of the default behaviour of Xen and how it builds the
> hypervisor and its dependent components (e.g. SeaBIOS).
>
> Firstly instead of building QEMU from within Xen, this series configures the Xen
> build to use the QEMU which is part of oe-core which is built with Xen support.
> Since Xen support is available in mainline QEMU this allows for easier support
> of the Xen device emulation via QEMU without the need to manage two independent
> versions of QEMU. The PACKAGECONFIG option in oe-core has been updated to allow
> for this.
>
> SeaBIOS, VGABIOS and IPXE have been extracted from the Xen build system in order
> to allow for better cross compilation support as well and to handle dependencies
> better between different architectures. As these components are only required
> for x86 they depend on the HVM feature being enabled for Xen, this is enabled by
> default in the Xen PACKAGECONFIG for all machines that have the x86
> MACHINE_FEATURE.
>
> The patches in this series are also available via the following remote/branch:
>     remote: https://github.com/nathanrossi/meta-virtualization.git
>     branch: nrossi/add-aarch64-support-v2
>
> This patch series relies on the current master of oe-core, as the patch to QEMU
> which enables Xen support within was only merged recently.
> (http://git.openembedded.org/openembedded-core/commit/?id=d3c82cd6019ad43af489fdc518a3f8a9f31f6777)
>
> Thanks,
> Nathan
>
> Chris Patterson (3):
>   xen: break out firmware bits
>   vgabios: DEPENDS on dev86-native
>   seabios: minor cleanup
>
> Nathan Rossi (11):
>   xen: Fix and refactor common include
>   xen: Add Build and Target architecture mapping
>   xen: Move x86/arch specific components into RRECOMMENDS
>   xen: Fix up architecture specific steps
>   xen: Add aarch64 as compatible host
>   xen-*image-minimal: Setup conditional based on MACHINE_FEATURES
>   xen: Update recipe to 4.5.0
>   xen-image-minimal: Install qemu instead of xen-qemu
>   xen: Add support for systemd
>   xen: Add patch to fix build failure on x86
>   xen: Add 'hvm' PACKAGECONFIG for hvmloader building
>
>  recipes-extended/images/xen-guest-image-minimal.bb |   2 +-
>  recipes-extended/images/xen-image-minimal.bb       |   6 +-
>  recipes-extended/ipxe/ipxe_git.bb                  |  31 ++++
>  recipes-extended/seabios/seabios/defconfig         | 102 +++++++++++
>  recipes-extended/seabios/seabios/hostcc.patch      |  21 +++
>  recipes-extended/seabios/seabios_1.7.5.bb          |  45 +++++
>  recipes-extended/vgabios/vgabios_0.7a.bb           |  31 ++++
>  ...lask-avoid-installing-policy-file-as-boot.patch |  26 ---
>  ...xen-x86-Fix-up-rules-when-forcing-mno-sse.patch |  28 +++
>  recipes-extended/xen/xen-arch.inc                  |  18 ++
>  recipes-extended/xen/xen.inc                       | 195 ++++++++++++++++-----
>  recipes-extended/xen/xen_4.3.1.bb                  |  24 ---
>  recipes-extended/xen/xen_4.5.0.bb                  |  50 ++++++
>  13 files changed, 486 insertions(+), 93 deletions(-)
>  create mode 100644 recipes-extended/ipxe/ipxe_git.bb
>  create mode 100644 recipes-extended/seabios/seabios/defconfig
>  create mode 100644 recipes-extended/seabios/seabios/hostcc.patch
>  create mode 100644 recipes-extended/seabios/seabios_1.7.5.bb
>  create mode 100644 recipes-extended/vgabios/vgabios_0.7a.bb
>  delete mode 100644 recipes-extended/xen/files/flask-avoid-installing-policy-file-as-boot.patch
>  create mode 100644 recipes-extended/xen/files/xen-x86-Fix-up-rules-when-forcing-mno-sse.patch
>  create mode 100644 recipes-extended/xen/xen-arch.inc
>  delete mode 100644 recipes-extended/xen/xen_4.3.1.bb
>  create mode 100644 recipes-extended/xen/xen_4.5.0.bb
>
> --
> 2.1.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

