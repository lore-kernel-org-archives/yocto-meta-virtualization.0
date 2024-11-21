Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 860DED75BB6
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 04:34:40 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.3805.1732163673982245026
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 20 Nov 2024 20:34:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GUgUPN1U;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b13ff3141aso29772285a.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 20 Nov 2024 20:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732163673; x=1732768473; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MqHqtWg4pdgZ0dEnAr438m2zpwi5+Bgt+HFLMhxwP1I=;
        b=GUgUPN1UjnfHNi6glR4OvmyKw8mUoJw+vwiBXg7SQTLN3q1j5KwC41ucRSdZa3O4vm
         hE1x6DnztaX7hNYn2B23jYnQtzSSWJA3MalXOkSpEem7zMVFPy10QOpabsFlu2g/BFNa
         EEoKc52C+w0h1cuD8Jf+cyxChIweN7cS84iASAwxSoJMKkb7mpo0sVa2tdfJbL5DZvZM
         6nxSVn8nVeWiJuRcFAjBpoULn5AzLsRurDLlqW+8QS7jTVCmqLrWOijrL2Uiq9bhw1pV
         q3DO83fqjTrQ1MUy3TDzgkUtdtjmKC8QggLxCLHMU62leYF/SWWDLW+vRNOcca1frYzu
         QusQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732163673; x=1732768473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqHqtWg4pdgZ0dEnAr438m2zpwi5+Bgt+HFLMhxwP1I=;
        b=wPwUxcyvxKjtrNZLbdR7skEJtG1E9tuxf3IP5pGnHxa64if5NPheneyFyRpeIbZ0jx
         TZk+88b1ucV02j5RDVUYzWHUvBPcka1axTVKEeszDGK7IEGXOyTubMPPu+QQ9KmC375/
         UTUBivsQoOTdtjYHHKhaU9KtA5UC/QdtrzLPAj24HRvU3pXC/r9zx3OvNeqRVT/LD2nU
         Bqc4KHjl+44KBekQiefLR2Bhg9X7R8n9tXmrzkUcnFbVrSvar7uNASK3Lu5EVKwi3UKu
         G5Rzcn8zjOqdo5MhPqwDfUQnEHGmKqd62rnUpR5eyVmxj8JR1RFJHQY5i7C54xcWrv/z
         8oXg==
X-Gm-Message-State: AOJu0YzMBVfF7iG92CHL9opsPoJal6y5OXDxhx6NZi5RzYIEmhKeiWuL
	YFsD50gW7Z9gFKnBmJxIU+EBO2hRtpviFaahKflAL9CmiAnAgBQGQOyaRQ4j
X-Google-Smtp-Source: AGHT+IGxQpsGI68kqGQvGXFhkR8AjsxUTR2RlqDIf0koeZdud3cy63JgVJcxroBVbQAp0Eru9FjJ7Q==
X-Received: by 2002:a05:620a:179f:b0:7b1:4fe2:a32a with SMTP id af79cd13be357-7b431ab9bb0mr715772585a.55.1732163672774;
        Wed, 20 Nov 2024 20:34:32 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b479d2dc5bsm166505285a.24.2024.11.20.20.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 20:34:32 -0800 (PST)
Date: Thu, 21 Nov 2024 04:34:30 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: peng.zhang1.cn@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] cri-o: enable ptest
Message-ID: <Zz64Vljz9C29rI2H@gmail.com>
References: <20241115141231.1778125-1-peng.zhang1.cn@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115141231.1778125-1-peng.zhang1.cn@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Nov 2024 04:34:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8989

In message: [meta-virtualization][PATCH] cri-o: enable ptest
on 15/11/2024 Zhang, Peng (Paul) (CN) via lists.yoctoproject.org wrote:

> From: Zhang Peng <peng.zhang1.cn@windriver.com>
> 
> The ptest build for cri-o was previously disabled due to issues
> introduced with Go 1.11, which borken the build process. With the
> current Go version, these issues no longer occur, and the ptest build is
> now functional.
> This commit enables ptest support and resolves the "TMPDIR
> [buildpaths]" issue encountered during the ptest build process.

Can you include a log of the ptest running in the commit log ?
That way the baseline pass/fail is understood and captured.

> 
> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
> ---
>  recipes-containers/cri-o/cri-o_git.bb         | 37 ++++++++++++++++++-
>  .../0001-Add-trimpath-to-build-nri.test.patch | 31 ++++++++++++++++
>  recipes-containers/cri-o/files/run-ptest      | 11 ++++++
>  3 files changed, 77 insertions(+), 2 deletions(-)
>  create mode 100644 recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.patch
>  create mode 100644 recipes-containers/cri-o/files/run-ptest
> 
> diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
> index efc86fbe..596a43e2 100644
> --- a/recipes-containers/cri-o/cri-o_git.bb
> +++ b/recipes-containers/cri-o/cri-o_git.bb
> @@ -17,7 +17,9 @@ At a high level, we expect the scope of cri-o to be restricted to the following
>  SRCREV_cri-o = "20c06a19cb395445620c31730c0f1a0a1922eaae"
>  SRC_URI = "\
>  	git://github.com/kubernetes-sigs/cri-o.git;branch=release-1.31;name=cri-o;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
> +        file://0001-Add-trimpath-to-build-nri.test.patch \
>          file://crio.conf \
> +        file://run-ptest \
>  	"
>  
>  # Apache-2.0 for docker
> @@ -28,7 +30,7 @@ GO_IMPORT = "import"
>  
>  PV = "1.31.0+git${SRCREV_cri-o}"
>  
> -inherit features_check
> +inherit features_check ptest
>  REQUIRED_DISTRO_FEATURES ?= "seccomp"
>  
>  DEPENDS = " \
> @@ -69,6 +71,13 @@ do_compile() {
>  	oe_runmake binaries
>  }
>  
> +do_compile_ptest() {
> +    set +e
> +
> +    cd ${S}/src/import
> +
> +    oe_runmake test-binaries
> +}
>  SYSTEMD_PACKAGES = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
>  SYSTEMD_SERVICE:${PN} = "${@bb.utils.contains('DISTRO_FEATURES','systemd','crio.service','',d)}"
>  SYSTEMD_AUTO_ENABLE:${PN} = "enable"
> @@ -100,6 +109,14 @@ do_install() {
>      install -d ${D}${localstatedir}/lib/crio
>  }
>  
> +do_install_ptest() {
> +    install -d ${D}${PTEST_PATH}/test
> +    install -d ${D}${PTEST_PATH}/bin
> +    install -d ${D}${PTEST_PATH}/vendor
> +    cp -rf ${S}/src/import/test ${D}${PTEST_PATH}
> +    cp -rf ${S}/src/import/bin ${D}${PTEST_PATH}
> +    cp -rf ${S}/src/import/vendor ${D}${PTEST_PATH}
> +}

I'm curious. Why does the vendor directory need to be
copied / installed for the ptest ?

>  FILES:${PN}-config = "${sysconfdir}/crio/config/*"
>  FILES:${PN} += "${systemd_unitdir}/system/*"
>  FILES:${PN} += "/usr/local/bin/*"
> @@ -109,7 +126,23 @@ FILES:${PN} += "/usr/share/containers/oci/hooks.d"
>  ALLOW_EMPTY:${PN} = "1"
>  
>  INSANE_SKIP:${PN} += "ldflags already-stripped textrel"
> +INSANE_SKIP:${PN}-ptest += "textrel"
>  
> -deltask compile_ptest_base
> +RDEPENDS:${PN}-ptest += " \
> +    bash \
> +    bats \
> +    cni \
> +    crictl \
> +    bind-utils \
> +    coreutils \
> +    dbus-daemon-proxy \
> +    iproute2 \
> +    util-linux-unshare \
> +    jq \
> +    ipcalc \
> +    slirp4netns \
> +    parallel \
> +    podman \
> +"

This is an extensive list of rdepends for a ptest.
What exactly is it testing ? I think we need to document
in a README what exactly is being tested, since this
dependency list tells me that it is not trivial and it
will be prone to breakage.

Bruce

>  
>  COMPATIBLE_HOST = "^(?!(qemu)?mips).*"
> diff --git a/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.patch b/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.patch
> new file mode 100644
> index 00000000..c6be41f0
> --- /dev/null
> +++ b/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.patch
> @@ -0,0 +1,31 @@
> +From 0bf230f59d211044e7993543e010b0d7f9dcead3 Mon Sep 17 00:00:00 2001
> +From: Peng Zhang <peng.zhang1.cn@windriver.com>
> +Date: Fri, 25 Oct 2024 10:42:02 +0800
> +Subject: [PATCH] Add --trimpath to build nri.test
> +
> +when build test-binary, TMPDIR[buildpaths] error found in nri.test
> +to fix this error, add "--trimpath" option to build nri.test.
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Peng Zhang <peng.zhang1.cn@windriver.com>
> +---
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +Index: cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae/src/import/Makefile
> +===================================================================
> +--- cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae.orig/src/import/Makefile
> ++++ cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae/src/import/Makefile
> +@@ -169,7 +169,7 @@ test/checkcriu/checkcriu: $(GO_FILES)
> + 	$(GO_BUILD) $(GCFLAGS) $(GO_LDFLAGS) -tags "$(BUILDTAGS)" -o $@ ./test/checkcriu
> + 
> + test/nri/nri.test: $(wildcard test/nri/*.go)
> +-	$(GO) test --tags "test $(BUILDTAGS)" -c ./test/nri -o $@
> ++	$(GO) test --tags "test $(BUILDTAGS)" -c ./test/nri -o $@ ${TRIMPATH}
> + 
> + bin/crio: $(GO_FILES)
> + 	$(GO_BUILD) $(GCFLAGS) $(GO_LDFLAGS) -tags "$(BUILDTAGS)" -o $@ ./cmd/crio
> +-- 
> +2.34.1
> +
> diff --git a/recipes-containers/cri-o/files/run-ptest b/recipes-containers/cri-o/files/run-ptest
> new file mode 100644
> index 00000000..62abe959
> --- /dev/null
> +++ b/recipes-containers/cri-o/files/run-ptest
> @@ -0,0 +1,11 @@
> +#!/bin/sh
> +
> +./test/test_runner.sh | while IFS= read -r line; do
> +	if [[ $line =~ ^not\ ok ]]; then
> +		echo "FAIL: ${line#not ok }"
> +	elif [[ $line =~ ^ok && ! $line =~ \#\ skip ]]; then
> +		echo "PASS: ${line#ok }"
> +	elif [[ $line =~ ^ok.*#\ skip ]]; then
> +		echo "SKIP: ${line#ok }"
> +	fi
> +done
> -- 
> 2.35.5
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8971): https://lists.yoctoproject.org/g/meta-virtualization/message/8971
> Mute This Topic: https://lists.yoctoproject.org/mt/109593003/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


