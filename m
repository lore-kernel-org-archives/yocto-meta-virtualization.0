Return-Path: <kurt.bodiker@braintrust-us.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 63C22E00AE6; Fri,  6 Apr 2018 10:07:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.220.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4AD04E008D3
	for <meta-virtualization@yoctoproject.org>;
	Fri,  6 Apr 2018 10:07:31 -0700 (PDT)
Received: by mail-qk0-f195.google.com with SMTP id o64so1898135qkl.7
	for <meta-virtualization@yoctoproject.org>;
	Fri, 06 Apr 2018 10:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=braintrust-us-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=AD1UoXx8LfCAbanF9oW5tKaEy/iNsRqu33BUT1ni9FU=;
	b=moIkLM29IendK6d/LWI7Z/MD81JrdRjk42Bp2HWZEPCTG++4WmxB4KQjWyPTejMDlO
	BO2qo6sCekcazD+xufDnMqjO64KZ2ELrjkB3wrxQXwb2KpIPaOopiwLaSMv5JFLUYOCT
	F6582648Lphra5Ga70RZ89jhcnqnpuCrJdRQVIKDTyCHFXof+UpONe/SHXrDJAj6NXeE
	mjrSW+ENp02lxOTE62dFJPogd7aZE3+B4RxAdDupv3ljD/5MJyFdYzkIIy4Y4tNCmOOM
	14cah1PfK7FVQ+fdypnb+TEDZAAUL7YtcELzLmm7suTmlV5fxSs6LoK87JbXrRf/B1pQ
	Vdvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:references;
	bh=AD1UoXx8LfCAbanF9oW5tKaEy/iNsRqu33BUT1ni9FU=;
	b=PZ4XG5Qi1GvGldWe5Q8jJysgLYtZh4H+0KxHkDjirh3q6M6k9h3a4FeSZOqbbJhCnb
	9bO6SRtrfgPCMdPKhQTPCqxNa0kb1bCvgaoX8seIgolctFqAGiRc+1nawxUJY7YEMf78
	M4JVykbMaEkk38abs6X8QOZFb7cZAsG3HPA42MkIqH33WPdxUrMCl0E+4nBczLZU79Kc
	9le6oQx0NW/Ezs7zcJ8fyzF3uWqbs0NuAkTB8VZ3bejs6tZaYwaZ0V3Hjgcr/wY3jiMv
	2ifLl6cEbH8hRdYkl1XXViiXhsG+C9gmkefSXsmCZd3s9vIVxZjLLfOggHXh+uDlVUaU
	2Pag==
X-Gm-Message-State: ALQs6tA+ta6001jtnVZ9pAPwzYyLpQ4uDCTETVXfA/67zlonn2M9gbdp
	M4PSQC/6P2vbNXB+43PocI5VQYSuPrs9QFGZqpkcFapfmIeOrgp3IdhvFq2sGS6cnB4pmOGZuza
	pn2H+193jSslkKC/VeeSuVzvkuReeqco=
MIME-Version: 1.0
X-Google-Smtp-Source: AIpwx4+DNKns9zvQ1zo7c6fIHUc1KKRf9V+WhhjcgOMllmPuWisYHukpTup/bnBB/MtiVVhSV5fu2g==
X-Received: by 10.55.155.6 with SMTP id d6mr35493042qke.160.1523034450893;
	Fri, 06 Apr 2018 10:07:30 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
	by smtp.gmail.com with ESMTPSA id
	y66sm8290900qky.61.2018.04.06.10.07.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 06 Apr 2018 10:07:30 -0700 (PDT)
From: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
To: meta-virtualization@yoctoproject.org
Date: Fri,  6 Apr 2018 13:06:40 -0400
Message-Id: <36342012f41d8365198bdc2f14e4cc9c5a69b5c1.1522956183.git.kurt.bodiker@braintrust-us.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1522956183.git.kurt.bodiker@braintrust-us.com>
References: <cover.1522956183.git.kurt.bodiker@braintrust-us.com>
In-Reply-To: <cover.1522956183.git.kurt.bodiker@braintrust-us.com>
References: <cover.1522956183.git.kurt.bodiker@braintrust-us.com>
Cc: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
Subject: [PATCH v2 3/8] xen: Mini-OS source code with make links target applied
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
X-List-Received-Date: Fri, 06 Apr 2018 17:07:33 -0000
Content-Type: text/plain; charset="US-ASCII"

Mini-OS is a tiny OS kernel distributed with the Xen Project Hypervisor
sources. It is mainly used as operating system for stub domains that are
used for Dom0 Disaggregation.

The Mini-OS source tree is updated and released in coordination with Xen
releases. The Mini-OS source tree and architecture-specific symbolic
links are required for building the dependencies used to build Xen
stubodmains. For convenience, the make links target was executed before
packaging. Otherwise, this is a source package. The current build
methods for Xen stubdomains require either a source archive which
contains the Mini-OS source code or execution of a make target that will
fetch the appropriate Mini-OS source tree from it's git repository. This
recipe removes the mysticism of relating to the version of Mini-OS being
used and it's origins and provides the flexibility to easily changes
versions or patch as necessary.

Signed-off-by: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
---
Changes in v2:
 - Mini-OS recipe introduced
---
 recipes-extended/xen/mini-os.inc      | 28 ++++++++++++++++++++++++++++
 recipes-extended/xen/mini-os_4.9.0.bb | 17 +++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 recipes-extended/xen/mini-os.inc
 create mode 100644 recipes-extended/xen/mini-os_4.9.0.bb

diff --git a/recipes-extended/xen/mini-os.inc b/recipes-extended/xen/mini-os.inc
new file mode 100644
index 0000000..61c2704
--- /dev/null
+++ b/recipes-extended/xen/mini-os.inc
@@ -0,0 +1,28 @@
+# Copyright (C) 2018 kebodiker <kurt.bodiker@braintrust-us.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+require stubdom.inc
+
+# clear this out to break dependency circle
+DEPENDS = ""
+
+do_configure() {
+    ${MAKE} -C ${WORKDIR}/mini-os links
+}
+
+# Nothing to configure or compile
+do_compile[noexec] = "1"
+
+# needed because this directory isn't typically part of a sysroot
+SYSROOT_DIRS += "${prefix}/mini-os"
+RDEPENDS_${PN}-dev = "perl"
+
+FILES_${PN}-dev = "\
+    ${prefix} \
+"
+
+do_install() {
+    install -d ${D}${prefix}/mini-os
+    cp -r -t ${D}${prefix}/mini-os ${S}/*
+    rm -rf ${D}${prefix}/mini-os/scripts
+}
diff --git a/recipes-extended/xen/mini-os_4.9.0.bb b/recipes-extended/xen/mini-os_4.9.0.bb
new file mode 100644
index 0000000..68b44d9
--- /dev/null
+++ b/recipes-extended/xen/mini-os_4.9.0.bb
@@ -0,0 +1,17 @@
+# Copyright (C) 2017 Kurt Bodiker <kurt.bodiker@braintrust-us.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "Mini-OS is a tiny OS kernel distributed with the Xen Project"
+HOMEPAGE = "https://wiki.xenproject.org/wiki/Mini-OS"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8a437231894440a8f7629caa372243d0"
+
+# git commit hash for tags: xen-RELEASE-4.9.0, xen-RELEASE-4.9.1, xen-RELEASE-4.9.2
+SRCREV_minios = "ca013fa9baf92f47469ba1f2e1aaa31c41d8a0bb"
+SRC_URI = "\
+    git://xenbits.xen.org/mini-os.git;protocol=git;nobranch=1;destsuffix=mini-os;name=minios \
+"
+S="${WORKDIR}/mini-os"
+B="${S}"
+
+require mini-os.inc
-- 
2.14.2


-- 

*This email and all attachments are considered confidential and the 
proprietary information of BrainTrust Holdings.  Unauthorized disclosure is 
prohibited.  *

