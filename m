Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7C69CE00E6B; Thu,  8 Mar 2018 12:58:47 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.48 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F39ACE00DC2
	for <meta-virtualization@yoctoproject.org>;
	Thu,  8 Mar 2018 12:58:45 -0800 (PST)
Received: by mail-lf0-f48.google.com with SMTP id m69-v6so10250135lfe.8
	for <meta-virtualization@yoctoproject.org>;
	Thu, 08 Mar 2018 12:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=w1uC3jxi6uRWRRxefImgDXB7QTHCsNcRLAg8SF407uY=;
	b=ROU01Mmn1qrh3Bwua8CBUSI5voN89eLS4Hz0T3dlpRRTN9QT6nAhJrHptvZpARQD5s
	6GfiJp1z66Xx55B7VhznueXxCqMZpkE/7MhWuR8g9nX2pprOIigm22TKcUMvzCIYHJHs
	gssQPUOcnDN5zXSMQqT6KdTkMk1iIMqYHa0MfSfxoXO5sCDI/mNtpNVHrXLAu5+4c/Mh
	ESYD7SE3Xw/VrmWN4ROjFSURMMyu2FNjwT8kX+/1EnOgEpt72bO50V6GxdCPv2Hy9dFU
	hG7PgnuK1n2+yoyvnTCA+ztKT7qgK5270AIneLrv/1ak0Lfa5txHst1LBwKwu8sTidoR
	q7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=w1uC3jxi6uRWRRxefImgDXB7QTHCsNcRLAg8SF407uY=;
	b=Zuibz6LvqA9y7RbkJMHWm97ItsZHeRMFrwng0nJbRNHhLuGHMDldSwj4u2C4cnBJ3f
	WWtFi6jQCvQCz/s3kr1VoozVtizv/cOGjvss603PCpkGdtlkCYZEyvjTGwM6oGBgi9Oh
	gjY3Wah4Fe1AAPcUk08f9Jmy7vYmxemeqoKE9wEuyWm8hTryFBodrRGwiSrPafGbrvIt
	k2W/YqS7naILiQLnQl0yxvmQ1zNRLLxTgrKiToCYrhqOEYPAglv6/77xDk9fq4seC9pp
	Ake5hu5/BbstnPLspFP98ElT21w+pZUBf1bSfYLoTSzJPyffcMbfS+yoVQDQ0xTlWL4G
	bHmg==
X-Gm-Message-State: APf1xPC2lMwCyv3fnFfAph1xG0psbAX64YsaOEsnzi1EY6CKXUjIPzAM
	NgGz9MLRhh5bMdXIIts8qT3bU2MPQBiEpepqfbw=
X-Google-Smtp-Source: AG47ELvR/1XL3wXE8vUiFf4HyxQRr45vOLddvrKGy9R7UQMgomKsY/tVI2lube3LDWytl+SmebcXTovO/aPftwCECks=
X-Received: by 10.46.25.86 with SMTP id p83mr19282475lje.142.1520542724693;
	Thu, 08 Mar 2018 12:58:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.48.4 with HTTP; Thu, 8 Mar 2018 12:58:43 -0800 (PST)
In-Reply-To: <cover.1519915283.git.kurt.bodiker@braintrust-us.com>
References: <cover.1519915283.git.kurt.bodiker@braintrust-us.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 8 Mar 2018 15:58:43 -0500
Message-ID: <CADkTA4PBpA5d4zg0XgChtcmzaGSSso+gDro9QfO+WKk3propzQ@mail.gmail.com>
To: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 0/7] Xen vTPM stubdomains
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
X-List-Received-Date: Thu, 08 Mar 2018 20:58:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 5, 2018 at 10:35 AM, Kurt Bodiker
<kurt.bodiker@braintrust-us.com> wrote:
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

I don't have any major issues with the series, I'll wait another day
or so to see
if there are any comments, and will merge it after that.

Cheers,

Bruce

>
>
> kebodiker (7):
>   xen: Define the standard values needed for stubdoms
>   xen: LWIP source code with patches applied for stubdoms
>   xen: Newlib recipe and patches for Xen stubdoms
>   xen: PolarSSL recipe and patches for Xen stubdoms
>   xen: GMP recipe for Xen stubdoms
>   xen: TPM Emulator for Xen stubdoms
>   xen: vTPM and vTPM Manager stubdoms for Xen
>
>  .../lwip.dhcp_create_request-hwaddr_len.patch      |   13 +
>  recipes-extended/xen/files/lwip.patch-cvs          | 2398 ++++++++++++++++++++
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
>  recipes-extended/xen/lwip.inc                      |   22 +
>  recipes-extended/xen/lwip_1.3.0.bb                 |   22 +
>  recipes-extended/xen/newlib.inc                    |   64 +
>  recipes-extended/xen/newlib_1.16.0.bb              |   19 +
>  recipes-extended/xen/polarssl.inc                  |   25 +
>  recipes-extended/xen/polarssl_1.1.4.bb             |   17 +
>  recipes-extended/xen/stubdom-gmp.inc               |   36 +
>  recipes-extended/xen/stubdom-gmp_4.3.2.bb          |   20 +
>  recipes-extended/xen/stubdom.inc                   |  141 ++
>  recipes-extended/xen/tpm-emulator.inc              |   31 +
>  recipes-extended/xen/tpm-emulator_0.7.4.bb         |   26 +
>  recipes-extended/xen/xen-vtpm.inc                  |   97 +
>  recipes-extended/xen/xen-vtpm_1.0.bb               |   16 +
>  27 files changed, 4525 insertions(+)
>  create mode 100644 recipes-extended/xen/files/lwip.dhcp_create_request-hwaddr_len.patch
>  create mode 100644 recipes-extended/xen/files/lwip.patch-cvs
>  create mode 100644 recipes-extended/xen/files/newlib-chk.patch
>  create mode 100644 recipes-extended/xen/files/newlib-stdint-size_max-fix-from-1.17.0.patch
>  create mode 100644 recipes-extended/xen/files/newlib.patch
>  create mode 100644 recipes-extended/xen/files/polarssl.patch
>  create mode 100644 recipes-extended/xen/files/tpmemu-0.7.4.patch
>  create mode 100644 recipes-extended/xen/files/vtpm-bufsize.patch
>  create mode 100644 recipes-extended/xen/files/vtpm-cmake-Wextra.patch
>  create mode 100644 recipes-extended/xen/files/vtpm-deepquote-anyloc.patch
>  create mode 100644 recipes-extended/xen/files/vtpm-deepquote.patch
>  create mode 100644 recipes-extended/xen/files/vtpm-implicit-fallthrough.patch
>  create mode 100644 recipes-extended/xen/files/vtpm-locality.patch
>  create mode 100644 recipes-extended/xen/files/vtpm-parent-sign-ek.patch
>  create mode 100644 recipes-extended/xen/lwip.inc
>  create mode 100644 recipes-extended/xen/lwip_1.3.0.bb
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
>  create mode 100644 recipes-extended/xen/xen-vtpm_1.0.bb
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



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

