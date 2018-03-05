Return-Path: <kurt.bodiker@braintrust-us.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3014BE00E46; Mon,  5 Mar 2018 07:35:28 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.220.180 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1C499E0074C
	for <meta-virtualization@yoctoproject.org>;
	Mon,  5 Mar 2018 07:35:26 -0800 (PST)
Received: by mail-qk0-f180.google.com with SMTP id v124so21032439qkh.11
	for <meta-virtualization@yoctoproject.org>;
	Mon, 05 Mar 2018 07:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=braintrust-us-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:to:subject:date:message-id;
	bh=uNapCU/MaZRZXFbO8d6hfmNy8cXRe9c2q3SXGgLUksk=;
	b=bcmow/9E4RU11xFzUqsOr0snW37Tsz7DxwDwuWMGXH5oeV74PcnlrsFRm8itrnhMIV
	iA5v6wxqiwh1VIyLLuz0RXtgJGzcQY3SEkjNjbfjdVjuDjHbWjqu2Oirjqbtcd6g7g+m
	gBCCwOKnGVijC/V2SKDPGsvsbJr9JkAWIepnGekUrlA/7an1dJJIfATebHgN/4M9vgXK
	w8hNXozoZyGrhE7k4fiCTGMGCn0XGiaW1FchPsdRdE6CZz+ELzgPKZO/N1i0RKVxzaRc
	LMTYADFxNV2JghvzRGGMWZr8D5dKEUDpANdy/bxtiWsWZsoBbpkU5kjdu9zT5/cHSQBm
	rKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:to:subject:date:message-id;
	bh=uNapCU/MaZRZXFbO8d6hfmNy8cXRe9c2q3SXGgLUksk=;
	b=Qgj3xHaIKXlLH4IcXf5ANQc9tAIIbKd6E3dC7oWa4zO89vF7grmOHhmQ1WowwBlCtP
	TsyjUhoG8f/gSXDDexR5wLw6btuNsEM8el3kzfzYCQlvOSIqCkPLR6jDgvFn6KilKM0W
	G3DBmjkdq7ybAYLful/ZA9C2G+Ud4rzNLI6kyqyuFOx7R3Tz7DoHfzgquSFSfw/6YHsy
	8iaPHfKE84Adeq0eiQs5TMFXlxiLajB8/MsjF64/O6qoP2sdECe/XM9b6U56pSMnmEfI
	X1vQBBcSVW5o5poW60z9Vqzbr+f8Q/xjVK8uUY7iwSJl6tbWvCFUjvdxAFEWESNBvf28
	Iz1A==
X-Gm-Message-State: AElRT7FTqUdHmHD+IPjds/xv6XftkJvR9l2a3nETJN8nP518Q0ZyCWVY
	jvPhl8XENx5RajbBpMT1M6GRQiG6gcPGejZqi4KuRx+QkyaaIDj3qbcvIuKWomZP43PJh/Lnt4G
	HDX08pEFWkzlVUcYrVFAspjN9PDZxyWw=
MIME-Version: 1.0
X-Google-Smtp-Source: AG47ELsYffzRmmAK5XE+XvVGg6flBLOXbwzapxDV8mkfnBqul+HgOWWhwU1UToyCcrgNNbhIWvpWCg==
X-Received: by 10.55.104.138 with SMTP id d132mr21717020qkc.306.1520264126207; 
	Mon, 05 Mar 2018 07:35:26 -0800 (PST)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:1126:b99c:ee44:103c])
	by smtp.gmail.com with ESMTPSA id
	n29sm9474962qtf.18.2018.03.05.07.35.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 05 Mar 2018 07:35:25 -0800 (PST)
From: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
To: kurt.bodiker@braintrust-us.com,
	meta-virtualization@yoctoproject.org
Date: Mon,  5 Mar 2018 10:35:00 -0500
Message-Id: <cover.1519915283.git.kurt.bodiker@braintrust-us.com>
X-Mailer: git-send-email 2.14.3
Subject: [PATCH 0/7] Xen vTPM stubdomains
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
X-List-Received-Date: Mon, 05 Mar 2018 15:35:28 -0000
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


kebodiker (7):
  xen: Define the standard values needed for stubdoms
  xen: LWIP source code with patches applied for stubdoms
  xen: Newlib recipe and patches for Xen stubdoms
  xen: PolarSSL recipe and patches for Xen stubdoms
  xen: GMP recipe for Xen stubdoms
  xen: TPM Emulator for Xen stubdoms
  xen: vTPM and vTPM Manager stubdoms for Xen

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
 recipes-extended/xen/lwip.inc                      |   22 +
 recipes-extended/xen/lwip_1.3.0.bb                 |   22 +
 recipes-extended/xen/newlib.inc                    |   64 +
 recipes-extended/xen/newlib_1.16.0.bb              |   19 +
 recipes-extended/xen/polarssl.inc                  |   25 +
 recipes-extended/xen/polarssl_1.1.4.bb             |   17 +
 recipes-extended/xen/stubdom-gmp.inc               |   36 +
 recipes-extended/xen/stubdom-gmp_4.3.2.bb          |   20 +
 recipes-extended/xen/stubdom.inc                   |  141 ++
 recipes-extended/xen/tpm-emulator.inc              |   31 +
 recipes-extended/xen/tpm-emulator_0.7.4.bb         |   26 +
 recipes-extended/xen/xen-vtpm.inc                  |   97 +
 recipes-extended/xen/xen-vtpm_1.0.bb               |   16 +
 27 files changed, 4525 insertions(+)
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
 create mode 100644 recipes-extended/xen/xen-vtpm_1.0.bb

-- 
2.14.2


-- 

*This email and all attachments are considered confidential and the 
proprietary information of BrainTrust Holdings.  Unauthorized disclosure is 
prohibited.  *

