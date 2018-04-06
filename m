Return-Path: <kurt.bodiker@braintrust-us.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 51AF6E00AAF; Fri,  6 Apr 2018 10:07:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.220.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0A784E008D3
	for <meta-virtualization@yoctoproject.org>;
	Fri,  6 Apr 2018 10:06:59 -0700 (PDT)
Received: by mail-qk0-f193.google.com with SMTP id w6so1896299qkb.4
	for <meta-virtualization@yoctoproject.org>;
	Fri, 06 Apr 2018 10:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=braintrust-us-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:to:cc:subject:date:message-id;
	bh=giwVPAdan3H6UbBtjnaRiwlFpo+tVaTqpNY1njBLFzw=;
	b=LGlc1shtcQSBPDTNyIjbxCMZAF/TpezQtlv4Ut9Fof3UJWrhHd8LAw7+lxAsvDBbrg
	WKeJJTcmz632TQj6FOgDTjiZ/2hrOftAZtAx72rGeqw+bzdWG1rlNKD7oNwWVwG4cK78
	HoA5sJKsQnd+lbQM9XYnO/1u3FRKJc39+Ojj8DXC4P+co+j0EPZV2Z6aJpmrfDnL/tLN
	nFxdQmTKhdqGgf0wzuo2rLnYguAtUOdCMYHaRqLTkotxTRPWa/F25xkcs63d99aLW7ic
	zgepykTP07a73XRvFvKjrMDm6dROny/NANv7edowj2171KOsXH9cysYl2TwHgfkzjQhA
	4PvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:to:cc:subject:date:message-id;
	bh=giwVPAdan3H6UbBtjnaRiwlFpo+tVaTqpNY1njBLFzw=;
	b=KKwKKTjq/4KVeUN16eu8JRILWGtk4nNAeO84FYaOSHaEe9Y9KsQcBVno9/2KhKYK6j
	wBrhKWamIBbxm9GQSvLJaf9SVfIQ2/2avjQs4uF/oDs5VTw+3iKfCQQUzJvbbchkB3fM
	GmAMU3BTUgo0ZW3LYStSHmkrcxVdGh6VgIfb2fRKFI+ahcGW0hI/THVhg/86AsvTnmKh
	9wvNAZZneF/hW0hLIN0UkQ7P39jlIxId1Akv7wVLv9iDROJtkdPo/yMb+ySnBCA6AmPM
	bs0EbC/QlF5nem9pYFamcvj57t08qvzP/vp0JqYufPq7252DqQKYP+ZmXjgxgZT1L+AB
	iuSA==
X-Gm-Message-State: ALQs6tDCAYBZZpF/3NHzW76xyl/ecsy3NlX2Etn3NxRevORFEoZcfwoF
	EQb4XmW/4NU65AjAH1da1GwIf8UHOVqM5IjRHcxA1jyfeRZkFI3VYKmJJLnF/1eZi6wSBrdkG0J
	mJ/u0kp8nQCfgvK6MfSoucKs/dSnrCtI=
MIME-Version: 1.0
X-Google-Smtp-Source: AIpwx4/6U/Tzm4zYDCfy+JCphbi+ENOJVv1iS24tx8OH2YMz33gzrYkpVuKZfI+akqrFFhFQtWSasQ==
X-Received: by 10.55.21.27 with SMTP id f27mr37685524qkh.252.1523034418432;
	Fri, 06 Apr 2018 10:06:58 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
	by smtp.gmail.com with ESMTPSA id
	y66sm8290900qky.61.2018.04.06.10.06.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 06 Apr 2018 10:06:57 -0700 (PDT)
From: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
To: meta-virtualization@yoctoproject.org
Date: Fri,  6 Apr 2018 13:06:37 -0400
Message-Id: <cover.1522956183.git.kurt.bodiker@braintrust-us.com>
X-Mailer: git-send-email 2.14.3
Cc: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
Subject: [PATCH v2 0/8] xen: Xen vTPM stubdomains
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
X-List-Received-Date: Fri, 06 Apr 2018 17:07:01 -0000
Content-Type: text/plain; charset="US-ASCII"

This patchset introduces the basic recipes necessary to build Xen
stubdomains, in particular the vTPM and vTPM Manager stubdomains. vTPM
stubdomains provide Xen guest domains access to a virtualized TPM. The
vTPM Manager stubdomain manages each of the vTPM domains and seals them
to the physical TPM. The intention of this patchset is to provide the
ability to build Xen stubdomains separately from the rest of the Xen
components since the stubdomains have separate dependencies that are
hard-coded within the Xen build and configuration files.  Separating the
stubdomain recipes and dependencies from the rest of the Xen build gives
the ability to use newer or different libraries than what is currently
used.

The stubdom.inc file defines a set of CPPFLAGS, CFLAGS, and LDFLAGS
common for building all Xen stubdomains. Xen stubdomains are
cross-compiled with the MiniOS, which creates some issues when trying to
compile stubdomains in an OpenEmbedded environment. To address these
issues and to ensure the stubdoms are built as Xen had intended, all of
the build flags and build tools that are exported into the environment
by OE have been unset. Each of the new recipes introduced here then
implements the build flags and the tools as though the build had been
run in the bare-metal environment.

Recipes to create slightly modified source packages for lwIP amd Mini-OS
are introduced to standardize the dependency tree among stubdomain
related recipes and to avoid the hassle of maintaining the same tasks
within many recipes.

Xen vTPM stubdomains have depencencies on static libraries for newlib,
polarssl, gmp, and tpm emulator. Xen vTPM Manager stubdomain has
dependencies on static libraries for newlib and polarssl.

The newlib, polarssl, gmp, and tpm emulator recipes are constructed to
behave the same as a bare-metal build. These recipes are cross-compiled
against both the Xen and MiniOS source code.

The xen-vtpm recipe is responsible for building and installing the vTPM
and vTPM Manager stubdomain images into the Xen boot directory. xen-vtpm
would need to be added to DISTRO_FEATURES the similar for what is done
for Xen.

---
Changes in v2:
 - Multi-line variables formatted to match OE style guide
 - SRC_URI formatted to use SRCREV rather than git tag
 - patches formatted to striplevel=1
 - introduced Mini-OS recipe
 - Removed Xen dependency since this is handled (mostly) by Mini-OS
 - Changed version number of xen-vtpm recipe to match Xen version
---

Kurt Bodiker (8):
  Define standard values needed to build stubdomains
  LWIP source code with patches applied for stubdoms
  Mini-OS source code with make links target applied
  Newlib recipe and patches for Xen stubdoms
  PolarSSL recipe and patches for Xen stubdoms
  GMP recipe for Xen stubdoms
  TPM Emulator for Xen stubdoms
  vTPM and vTPM Manager stubdoms

 .../lwip.dhcp_create_request-hwaddr_len.patch      |   13 +
 recipes-extended/xen/files/lwip.patch-cvs          | 2398 ++++++++++++++++++++
 recipes-extended/xen/files/newlib-chk.patch        |  155 ++
 .../newlib-stdint-size_max-fix-from-1.17.0.patch   |   16 +
 recipes-extended/xen/files/newlib.patch            |  727 ++++++
 recipes-extended/xen/files/polarssl.patch          |   64 +
 recipes-extended/xen/files/tpmemu-0.7.4.patch      |   12 +
 recipes-extended/xen/files/vtpm-bufsize.patch      |   13 +
 recipes-extended/xen/files/vtpm-cmake-Wextra.patch |   21 +
 .../xen/files/vtpm-deepquote-anyloc.patch          |  127 ++
 recipes-extended/xen/files/vtpm-deepquote.patch    |  187 ++
 .../xen/files/vtpm-implicit-fallthrough.patch      |   10 +
 recipes-extended/xen/files/vtpm-locality.patch     |   50 +
 .../xen/files/vtpm-parent-sign-ek.patch            |  196 ++
 recipes-extended/xen/lwip.inc                      |   24 +
 recipes-extended/xen/lwip_1.3.0.bb                 |   19 +
 recipes-extended/xen/mini-os.inc                   |   28 +
 recipes-extended/xen/mini-os_4.9.0.bb              |   17 +
 recipes-extended/xen/newlib.inc                    |   64 +
 recipes-extended/xen/newlib_1.16.0.bb              |   21 +
 recipes-extended/xen/polarssl.inc                  |   27 +
 recipes-extended/xen/polarssl_1.1.4.bb             |   19 +
 recipes-extended/xen/stubdom-gmp.inc               |   42 +
 recipes-extended/xen/stubdom-gmp_4.3.2.bb          |   20 +
 recipes-extended/xen/stubdom.inc                   |  150 ++
 recipes-extended/xen/tpm-emulator.inc              |   37 +
 recipes-extended/xen/tpm-emulator_0.7.4.bb         |   26 +
 recipes-extended/xen/xen-vtpm.inc                  |   98 +
 recipes-extended/xen/xen-vtpm_4.9.0.bb             |   21 +
 29 files changed, 4602 insertions(+)
 create mode 100644 recipes-extended/xen/files/lwip.dhcp_create_request-hwaddr_len.patch
 create mode 100644 recipes-extended/xen/files/lwip.patch-cvs
 create mode 100644 recipes-extended/xen/files/newlib-chk.patch
 create mode 100644 recipes-extended/xen/files/newlib-stdint-size_max-fix-from-1.17.0.patch
 create mode 100644 recipes-extended/xen/files/newlib.patch
 create mode 100644 recipes-extended/xen/files/polarssl.patch
 create mode 100644 recipes-extended/xen/files/tpmemu-0.7.4.patch
 create mode 100644 recipes-extended/xen/files/vtpm-bufsize.patch
 create mode 100644 recipes-extended/xen/files/vtpm-cmake-Wextra.patch
 create mode 100644 recipes-extended/xen/files/vtpm-deepquote-anyloc.patch
 create mode 100644 recipes-extended/xen/files/vtpm-deepquote.patch
 create mode 100644 recipes-extended/xen/files/vtpm-implicit-fallthrough.patch
 create mode 100644 recipes-extended/xen/files/vtpm-locality.patch
 create mode 100644 recipes-extended/xen/files/vtpm-parent-sign-ek.patch
 create mode 100644 recipes-extended/xen/lwip.inc
 create mode 100644 recipes-extended/xen/lwip_1.3.0.bb
 create mode 100644 recipes-extended/xen/mini-os.inc
 create mode 100644 recipes-extended/xen/mini-os_4.9.0.bb
 create mode 100644 recipes-extended/xen/newlib.inc
 create mode 100644 recipes-extended/xen/newlib_1.16.0.bb
 create mode 100644 recipes-extended/xen/polarssl.inc
 create mode 100644 recipes-extended/xen/polarssl_1.1.4.bb
 create mode 100644 recipes-extended/xen/stubdom-gmp.inc
 create mode 100644 recipes-extended/xen/stubdom-gmp_4.3.2.bb
 create mode 100644 recipes-extended/xen/stubdom.inc
 create mode 100644 recipes-extended/xen/tpm-emulator.inc
 create mode 100644 recipes-extended/xen/tpm-emulator_0.7.4.bb
 create mode 100644 recipes-extended/xen/xen-vtpm.inc
 create mode 100644 recipes-extended/xen/xen-vtpm_4.9.0.bb

-- 
2.14.2


-- 

*This email and all attachments are considered confidential and the 
proprietary information of BrainTrust Holdings.  Unauthorized disclosure is 
prohibited.  *

