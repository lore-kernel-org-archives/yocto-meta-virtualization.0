Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B3BCD6E6B
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 03:31:08 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.704.1780630267330938772
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 04 Jun 2026 20:31:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HsCcaj7q;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8ce9df31130so21679816d6.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 04 Jun 2026 20:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780630266; x=1781235066; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i24BYH3pF617cZEOMyVlRse5I8Y/zR/sQgk+zQkZSBM=;
        b=HsCcaj7q5/ypa2oGy6P2FJkbPSWHZSUjtpLoKcGRa8Juvqw2zhjT1QIabWRX/dTNup
         64LFH1vP8XbyQVc+zAbso++uuMaAWdPfWUJntmXRBcZn6PLYWsjpb8lSCGCAwIDhjrhI
         d+AvAUMLC+1o1oORKt2KpoXtVQXtC1DXHa0g1QYfjdsgB1cWFz2QqXN0GQF76Y29aLfa
         yI5ydh87nRisHejIE+wHOJt1pTnpdcub3PhOYNmvwtzEPHrcoSNbC5DpmClNjgtuwwxg
         S8V8SX/XXjxSMI2fLmUks3lvbL93nncp3gIJHrAn2v3+fn4UYwhDFdg3Fjg8pWbNZa70
         DeuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780630266; x=1781235066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i24BYH3pF617cZEOMyVlRse5I8Y/zR/sQgk+zQkZSBM=;
        b=gbGWjAzngeqn+6ygVLgAlW1yxWnT5DUqZWLT6prvUZEE+JtP8RlA+LmYtGoc63ORRt
         6YjmpoCdJ7Lt4K1mw3alz4iDfu5FS87BBEEQjDT4B4jlWBfUwAlPakpY4aKP6m3fZDW9
         WJCW/OsAoG+cNcvs6YOteUbVu9vfMLKCD9yEJbZrT6n/OTzG69Zdztcs0mOWq1RY1yvM
         M2VnGzhnRWHEr3/ra9PVwWN52Un4PTiPwpJfPWOoZrpTmXcpAMKjmM6RKdjHpwGzQSxy
         umvLrMuaWVs2X+OCHcXIjjD286rHm3tchtKTFiWkviaqhYRrkCCSdaBlKIHKtETMdpeB
         /gUQ==
X-Gm-Message-State: AOJu0YwWVyTnaYKdpsIQGVQLyEBdYtwgrq9nJFf/oLjUEqakYDYJ8GXd
	dui2dm+ghbN3B8T1AQf6D+JkSQK+mdNFObCoD5J+mXO9Cz7aCM8T/to2EMxf89YZ
X-Gm-Gg: Acq92OG9aoTJ+aH07IKWezrDcVSFCGcndx0SEdrvCs9N5yGR1hFkqJppJMfmKHSLpfi
	tzc9hbL3u4Sfnu3Ec3p+IYCnwZXQMgG6V+nPUtXZweHJeEDJjkGzVCq5KGmCSVqwJ3Ux6fGD4+/
	bI6zs3uJq7oXADFEUkDEkqC814W6pkGgzUQPqcNbqg97zE5kumjgsB+NHhTgDUJ72ee15EDLFV/
	sY8866C3rTmRHpD/YGisIdGb0ZFreCt4DCvc2TOgrIszv2TOap41bqO6bLofiQW6vIWSuYq0NJa
	4OLs8wrnb/7rlSPvyA4+zvjsVUg3x2vSx2XWfE2ADAEj8eeLIctcU6hem7dbdV1ARRiY3GMU//A
	YFbuIAFpyeOzZGTWVaUJSRA5w1mA3l583iPDMq4M5/mdtVAX4sEiX7mNaF7XUkE6r8arTKk65uY
	KPyN1w0J/1n+YokV+DyRhBdGnOJtuSp1EGz6CQWA+PDulj+Akphqb9hCK3ugWmIGVJ5aw7fHJll
	OkTrvMUNOZWAHcBBb8HL3AS6SwGxmReydYy1tZt2UZ6pMgF0FF8AnLnoUxyu3t9EqclfxAoAutk
	ujYssNetgV1GU0Ja5gBg12K1E3MAdM72/KS82brKHAs=
X-Received: by 2002:a05:6214:2f93:b0:8be:3da0:bba3 with SMTP id 6a1803df08f44-8cee625bb2amr37381066d6.34.1780630266249;
        Thu, 04 Jun 2026 20:31:06 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccda0904sm71799136d6.7.2026.06.04.20.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 20:31:05 -0700 (PDT)
Date: Fri, 5 Jun 2026 03:31:04 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Haitao.Liu@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][wrynose][PATCH 2/2] libvirt: re-add ptest
 support for meson build system
Message-ID: <aiJC-KJDCjsCNBjN@gmail.com>
References: <20260529030040.1487113-1-haitao.liu@windriver.com>
 <20260529030040.1487113-2-haitao.liu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529030040.1487113-2-haitao.liu@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 05 Jun 2026 03:31:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9852

This isn't strictly within bounds of "no new features", but since
it will help maintain the LTS branch, I'll mege it once I'm through
feature testing and a few other items.

Bruce"


In message: [meta-virtualization][wrynose][PATCH 2/2] libvirt: re-add ptest support for meson build system
on 29/05/2026 jason.lau via lists.yoctoproject.org wrote:

> libvirt has switched its build system from Makefile to meson, so the
> original run-ptest which relied on "make -C tests -k check-TESTS" no
> longer works. Re-add ptest support based on the meson build system:
> 
> - Rewrite run-ptest to directly execute the compiled test binaries
>   instead of invoking make.
> - Patch meson.build at configure time to replace absolute build/source
>   paths with the ptest install paths, removing the need for separate
>   path-stripping patches.
> - Install test binaries and their required data files into the ptest
>   directory.
> 
> Test results on genericx86-64:
> 
>   All 120 tests passed (0 failures, 0 skips).
> 
> root@genericx86-64:/usr/lib/libvirt/ptest# ./run-ptest
> PASS: chxml2xmltest
> PASS: nssguestlinktest
> PASS: virbuftest
> PASS: viracpitest
> PASS: esxutilstest
> PASS: ssh
> PASS: storagepoolxml2xmltest
> PASS: commandtest
> ...
> ...
> PASS: nwfilterebiptablestest
> PASS: cputest
> 
> === Test Summary ===
> PASS: 120
> FAIL: 0
> SKIP: 0
> TOTAL: 120
> 
> Signed-off-by: Haitao Liu <haitao.liu@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt/run-ptest | 32 ++++++++++++++-
>  recipes-extended/libvirt/libvirt_git.bb    | 45 ++++++++++++++++++++--
>  2 files changed, 73 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-extended/libvirt/libvirt/run-ptest b/recipes-extended/libvirt/libvirt/run-ptest
> index a434b186..dd1f94d3 100644
> --- a/recipes-extended/libvirt/libvirt/run-ptest
> +++ b/recipes-extended/libvirt/libvirt/run-ptest
> @@ -1,3 +1,33 @@
>  #!/bin/sh
>  
> -make -C tests -k check-TESTS
> +PTEST_DIR="/usr/lib/libvirt/ptest/tests"
> +export LD_LIBRARY_PATH="${PTEST_DIR}:${LD_LIBRARY_PATH}"
> +PASS=0
> +FAIL=0
> +SKIP=0
> +
> +run_test() {
> +    tname="$1"
> +    tpath="$2"
> +    "$tpath" >/dev/null 2>&1
> +    rc=$?
> +    case $rc in
> +        0)  echo "PASS: $tname"; PASS=$((PASS + 1)) ;;
> +        77) echo "SKIP: $tname"; SKIP=$((SKIP + 1)) ;;
> +        *)  echo "FAIL: $tname"; FAIL=$((FAIL + 1)) ;;
> +    esac
> +}
> +
> +# Skip run-ptest (self), commandhelper and qemucapsprobe are middleware
> +# used by other test cases, not test cases themselves.
> +for t in $(find ${PTEST_DIR} -maxdepth 1 -type f -executable ! -name "*.so" ! -name "run-ptest" ! -name "commandhelper" ! -name "qemucapsprobe"); do
> +    run_test "$(basename $t)" "$t"
> +done
> +
> +# Summary
> +echo ""
> +echo "=== Test Summary ==="
> +echo "PASS: $PASS"
> +echo "FAIL: $FAIL"
> +echo "SKIP: $SKIP"
> +echo "TOTAL: $((PASS + FAIL + SKIP))"
> diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/libvirt/libvirt_git.bb
> index cb5d3482..0052f527 100644
> --- a/recipes-extended/libvirt/libvirt_git.bb
> +++ b/recipes-extended/libvirt/libvirt_git.bb
> @@ -34,17 +34,16 @@ PV = "v${LIBVIRT_VERSION}+git"
>  SRC_URI = "gitsm://github.com/libvirt/libvirt.git;name=libvirt;protocol=https;branch=master \
>             file://libvirtd.sh \
>             file://libvirtd.conf \
> +           file://run-ptest \
>             file://dnsmasq.conf \
>             file://hook_support.py \
>             file://gnutls-helper.py;subdir=${BP} \
>             file://libvirt-qemu.conf \
>             file://0001-prevent-gendispatch.pl-generating-build-path-in-code.patch \
> -           file://0001-messon.build-remove-build-path-information-to-avoid-.patch \
> -           file://0001-tests-meson-clear-absolute-directory-paths.patch \
>             file://0001-qemu_nbdkit.c-use-llu-to-print-time_t.patch \
>            "
>  
> -inherit meson gettext update-rc.d pkgconfig systemd useradd perlnative
> +inherit meson gettext update-rc.d pkgconfig systemd useradd perlnative ptest
>  USERADD_PACKAGES = "${PN}"
>  GROUPADD_PARAM:${PN} = "-r qemu; -r kvm; -r libvirt; -r virtlogin"
>  USERADD_PARAM:${PN} = "-r -g qemu -G kvm qemu"
> @@ -188,6 +187,46 @@ CVE_STATUS[CVE-2023-3750] = "fixed-version: Fixed in 9.6.0, NVD tracks this as v
>  # Enable the Python tool support
>  require libvirt-python.inc
>  
> +do_configure:prepend() {
> +      sed -i \
> +        -e "s|meson.current_build_dir()|'${PTEST_PATH}/tests'|g" \
> +        -e "s|meson.project_build_root()|'${PTEST_PATH}'|g" \
> +        -e "s|meson.current_source_dir()|'${PTEST_PATH}/datas/tests'|g" \
> +        -e "s|meson.project_source_root()|'${PTEST_PATH}/datas'|g" \
> +        ${S}/tests/meson.build ${S}/scripts/rpcgen/tests/meson.build ${S}/tests/schemas/meson.build
> +}
> +
> +# Guard abs_top_builddir/abs_top_srcdir defines with #ifndef to avoid
> +# -Werror redefinition conflict when tests pass them via -D compile flags.
> +do_configure:append() {
> +      sed -i '/^#define abs_top_builddir/c\#ifndef abs_top_builddir\n#define abs_top_builddir " "\n#endif' ${B}/meson-config.h
> +      sed -i '/^#define abs_top_srcdir/c\#ifndef abs_top_srcdir\n#define abs_top_srcdir " "\n#endif' ${B}/meson-config.h
> +}
> +
> +
> +do_install_ptest() {
> +       install -d ${D}${PTEST_PATH}/tests
> +       install -d ${D}${PTEST_PATH}/datas/tests
> +        # The virshtest expects virsh at ${PTEST_PATH}/tests/tools/virsh, but it is
> +        # installed to /usr/bin/virsh by libvirt-virsh. Create a symlink to satisfy
> +        # the test's expected path.
> +       install -d ${D}${PTEST_PATH}/tools 
> +       ln -sf /usr/bin/virsh ${D}${PTEST_PATH}/tools/virsh 
> +       find ${B}/tests/  -type f -executable -print -maxdepth 1 | xargs -i cp {} ${D}${PTEST_PATH}/tests -rf
> +       cd ${S}/tests && find . -mindepth 1 -maxdepth 1 -type d | xargs -i cp {} ${D}${PTEST_PATH}/datas/tests -a
> +       install -m 0755 ${B}/scripts/rpcgen/tests/test_demo ${D}${PTEST_PATH}/tests
> +       install -m 0644 ${S}/scripts/rpcgen/tests/*.bin ${D}${PTEST_PATH}/datas/tests
> +       install -D -m 0644 -t ${D}${PTEST_PATH}/datas/examples/xml/test/  ${S}/examples/xml/test/*.xml
> +       install -D -m 0644 -t ${D}${PTEST_PATH}/datas/examples/xml/storage/ ${S}/examples/xml/storage/*.xml
> +       install -D -m 0644 -t ${D}${PTEST_PATH}/datas/src/conf/schemas/ ${S}/src/conf/schemas/*.rng
> +       install -D -m 0644 -t ${D}${PTEST_PATH}/datas/src/nwfilter/xml/ ${S}/src/nwfilter/xml/*.xml
> +       install -D -m 0644 -t ${D}${PTEST_PATH}/tests/schemas/ ${B}/tests/schemas/*.rng
> +       install -m 0644 ${S}/tests/openvzutilstest.conf ${D}${PTEST_PATH}/datas/tests
> +       install -d ${D}${PTEST_PATH}/datas/src/network
> +}
> +
> +RDEPENDS:${PN}-ptest += " ${PN}-virsh"
> +
>  do_compile() {
>  	cd ${B}/src
>  	# There may be race condition, but without creating these directories
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9824): https://lists.yoctoproject.org/g/meta-virtualization/message/9824
> Mute This Topic: https://lists.yoctoproject.org/mt/119542053/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


