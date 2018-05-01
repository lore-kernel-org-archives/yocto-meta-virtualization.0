Return-Path: <kurt.bodiker@braintrust-us.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A676AE00AE6; Tue,  1 May 2018 07:05:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.220.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 71952E007C2
	for <meta-virtualization@yoctoproject.org>;
	Tue,  1 May 2018 07:05:48 -0700 (PDT)
Received: by mail-qk0-f194.google.com with SMTP id z75so8932265qkb.6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 01 May 2018 07:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=braintrust-us-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:to:cc:subject:date:message-id;
	bh=FjDMMGwm3HrH46gmQYqzn5GpRMZUq+yIb9iu+cUaiZw=;
	b=zSg8Bfj8Ep1TSxj1R8DNf1WZLiDzDMmqtZv4lw+T7EXqpf+wAgNSeV790TXLpiQVsQ
	onja1yvyzSVnAq/u1ejFgVJkraU+wKW0JBqt8VxICNtBgKhZZNi+AGy6HYrOUQcoKb08
	X9yajL0bzacdi/8m6EWhX2G1KWCTFXpiLRAkfrnNOqDBDwoafgpkZHFHWcEjjD/u+bzu
	rvRwaHLxerb1rNvSEk2i30lb5YOc3a+EFh3j96a4XpNqlFt2f63iAUQkSX01tOsMeL5w
	6iBzCMm4ikDdKjJvgo7jxa6Xl8fgVUq5HQ3dPz3RsGM1Lh1DulT+NGo6KyzuRAiQPAkA
	/HCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:to:cc:subject:date:message-id;
	bh=FjDMMGwm3HrH46gmQYqzn5GpRMZUq+yIb9iu+cUaiZw=;
	b=MxG52pZKMLMLBoCBlmStWtBrhFSga7UbbL6PThLxI60N7gEVWk0LDJEvPtKOnxVU+U
	mPCK9BDe+6stntGJT0aOEDaAXkMyXp/jfr0iszh2OVwCV24Jtjaicb9wkN7Rx2uuHqiM
	PRaf0PkLoxhipxxBpvOG5Vgg1P6eohALqiRiHnwF8p7+5v0brWt8vsT8kbRFyi3Y4D44
	saKqMoYyVFKmF+5Aaj4kWIz3HNc3qNbXO0Y5ke/ZdJbajibOCGvzKucuDJ71hJwBV7fT
	qArmsknl0VUnm3wxQF0U72NIwMia97zJ51w8cK3GTT8Ou6TtNHNwjPXoe1AQb0lq7bFj
	fHGg==
X-Gm-Message-State: ALQs6tAlzUhUHNsfUdyyioNPF+Gyw3XjPfOBNMf46GZ/W0eJWlL3FN/y
	ARbV96t4kecU7ZgJVk4/mAOwdEy3fby31i+6pf3UDHgXNSqP6Uhf76QAIWmpW77m95B6RMVYQ3f
	j+QwoAAOOHfOfCqv48Y9KKNkjWCzIi0Y=
MIME-Version: 1.0
X-Google-Smtp-Source: AB8JxZobMub1i/BD8KpqyuUC8J99HzMwH/E+XeCpDV5SVJs8qLjN1wb4prE3h3ZDjInIoCXo3nGJsw==
X-Received: by 10.55.12.13 with SMTP id 13mr12490175qkm.320.1525183548064;
	Tue, 01 May 2018 07:05:48 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
	by smtp.gmail.com with ESMTPSA id
	i25-v6sm9048335qte.26.2018.05.01.07.05.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 01 May 2018 07:05:47 -0700 (PDT)
From: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
To: meta-virtualization@yoctoproject.org
Date: Tue,  1 May 2018 10:05:26 -0400
Message-Id: <cover.1525180972.git.kurt.bodiker@braintrust-us.com>
X-Mailer: git-send-email 2.14.3
Cc: kurt.bodiker@braintrust-us.com
Subject: [PATCH v5 0/8] xen: Xen vTPM stubdomains
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
X-List-Received-Date: Tue, 01 May 2018 14:05:50 -0000
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
Changes in v5:
 - Correct license in TPM Emulator recipe
 - Remove aarch64 from COMPATIBLE_HOST in stubdom.inc 
Changes in v4:
 - Fix whitespace errors in MiniOS, Newlib, and TPM Emulator patchfiles
 - Corrected type in Newlib recipe
Changes in v3:
 - Limit builds to 64-bit only through COMPATIBLE_HOST 
 - Change Xen version comparison logic in xen-vtpm recipe
 - Introduce MiniOS patch for GCC v7 that was not backported into the
   4.9.x releases
 - Change cross-root-${XEN_TARGET_ARCH} to cross-root-${GNU_TARGET_ARCH}
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
 .../xen/files/mini-os_udivmoddi4-gcc7.patch        |   43 +
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
 recipes-extended/xen/mini-os_4.9.0.bb              |   18 +
 recipes-extended/xen/newlib.inc                    |   64 +
 recipes-extended/xen/newlib_1.16.0.bb              |   21 +
 recipes-extended/xen/polarssl.inc                  |   27 +
 recipes-extended/xen/polarssl_1.1.4.bb             |   19 +
 recipes-extended/xen/stubdom-gmp.inc               |   37 +
 recipes-extended/xen/stubdom-gmp_4.3.2.bb          |   20 +
 recipes-extended/xen/stubdom.inc                   |  152 ++
 recipes-extended/xen/tpm-emulator.inc              |   37 +
 recipes-extended/xen/tpm-emulator_0.7.4.bb         |   26 +
 recipes-extended/xen/xen-vtpm.inc                  |  111 +
 recipes-extended/xen/xen-vtpm_4.9.0.bb             |   21 +
 30 files changed, 4656 insertions(+)
 create mode 100644 recipes-extended/xen/files/lwip.dhcp_create_request-hwaddr_len.patch
 create mode 100644 recipes-extended/xen/files/lwip.patch-cvs
 create mode 100644 recipes-extended/xen/files/mini-os_udivmoddi4-gcc7.patch
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

