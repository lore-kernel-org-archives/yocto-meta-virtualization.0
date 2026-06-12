Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5993ECD98D2
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 18:48:13 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.77266.1781290084932547869
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 12 Jun 2026 11:48:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=h178l7Oy;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-51778077b28so13548681cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Jun 2026 11:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781290084; x=1781894884; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jy4BVsCwGgUTgI5XIjdni1sAFlAp1qQJcjbzYYQtNms=;
        b=h178l7OyzeH8VE/U8zyyWtgoHF/Sx7E880/NCnExkFiwE+ckmF2+16iho+4S1ZxhsE
         2A6Mgyq5xx8rtrzYwzQ2/PBZZYSSP6yJNOs/p7s1TdXbV0ACXrd8D3tU3+fqiVM3Lma7
         EijSSMfYgaOkipdYWQIrS6A+uual4I8CKfiAq3sgaO74JEAYpu1W96xndqEeffrLUXxS
         b415oRGdGq62dl/+kfnBqPeybxPVTZzOGFFOS2wW9ncGh1cuuxnlNW6a7Mfb8ELJ2WEV
         7ZC7FMSyDtCZBClDglJrkdU2bla5HeBdCWuJ0BQumSx11XnSMehIOMczbyfb4tI+Dzlk
         64YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781290084; x=1781894884;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jy4BVsCwGgUTgI5XIjdni1sAFlAp1qQJcjbzYYQtNms=;
        b=jO4CKkBkZRdpiJGOiq13qU3sbrDM9nMeHNSruxkjA/+EQvCd3I3Pk8zbqQT96Q0Jp9
         pXNFwHwCxbdUIwT+Mq1F8jTAe7TvuFNKjEKskHvv3zwJBDrWKyc0HkQEL+arv+cONa1c
         /1ZiS0xcT+yMyFe66Py7MDzWIjNcwgWr0SaeREWrRNVziSm3JMkYHlqbiWlaqEFa7atd
         vSe+8ib0w/ewY4XNat+1GdKSE4eunesnWkRLG/mIvM7dGffL0NZdmYs3ANRLxxgbj+Fp
         7HJSxRNHurVcOzheYG4VrLEyIVKIOlWlag4MN0c6LyqEztiUdWkzAktVJDQGeV9ETwAH
         Wf8Q==
X-Gm-Message-State: AOJu0YwLlywJilIoP97oF22jkbpGSJ6P6SXuLuhi/JK6q9J1JGV8ylpJ
	xVIRdlWLfBkX/hyTnRm5y09tl+przuTgwobo0IY0fO3ghOcAq+JcUsBP
X-Gm-Gg: Acq92OFX0+cEL8JDXfVwLqs2A2uf5fVjjFHT4oclnZiRw0ZnKUs1LB68cR5KJXtm50V
	IZprU05tVjyct2h+icMfn1RlzijmY+QtQeopNWHnN1X2mptAj/jADb8dIm/xcWhDhJ/UfxozHEE
	QurHl3PNipJJHswuoFG/Fb3LMX8ZrgBwLIOf0c166GkdE4CgN2xNbu++REpPpMYrHiRSQqGn8Ne
	XXH/VjRkQ0R2IuoaUfrl4ctNBrsiTk7rRMnuBt6Q9vLC0fw6xMsJsT8ldMYSMCXoFHSj8IwCHIV
	oI1AYsieG8rmFIFFzXaU9BlJXVFoHLd5hxn7Snqjhas5YzAvwmFfr3zi7tVllzrBloWUQeoVkTq
	0Z3Nvwp9CqOzHbAy+vk9QTjgTjo4j9sL999QDqAJOTxXLCQ/mI//vrdXP/N7i2m6JoMQNvVx91M
	4UmCMN8TxVlBSliNjKUYLNtBluSlk8P9QJYlprzgTHgcdlaLo/mC6zeLQMkjrIDIiYBe4hZ5rWM
	iIWtFBosuKE/NUphXrrUhp5S8K5GB3DEs1YexFWozGKxnFnVTBnCd/lkW+JmGabREnhlaVfdgi7
	X403+HeGpjvFQbag3bVR47Ix
X-Received: by 2002:ac8:5794:0:b0:517:8242:489d with SMTP id d75a77b69052e-517fe4fba41mr58093561cf.28.1781290083398;
        Fri, 12 Jun 2026 11:48:03 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d301b2d004sm31756526d6.15.2026.06.12.11.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 11:48:02 -0700 (PDT)
Message-ID: <6a2c5462.f542fed9.183ec6.cc90@mx.google.com>
Date: Fri, 12 Jun 2026 11:48:02 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: haitao.liu@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] libvirt: re-add ptest support for
 meson build system
In-Reply-To: <20260529023941.1460960-1-haitao.liu@windriver.com>
References: <20260529023941.1460960-1-haitao.liu@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Jun 2026 18:48:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9878

Merged into master as 3ed3d6b3.

This one needed a small conflict resolution. Your patch was generated
against master state from before our 2026-06-02 libvirt 12.4.0 bump,
which dropped the file://0001-qemu_nbdkit.c-use-llu-to-print-time_t.patch
SRC_URI entry (upstream took an equivalent fix between v12.1.0 and
v12.4.0, so the local backport became a reverse-apply hazard).

The qemu_nbdkit line was context for your hunk's removal of
file://0001-messon.build-remove-build-path-information-to-avoid-.patch
and file://0001-tests-meson-clear-absolute-directory-paths.patch, so
git am --3way landed it as a conflict. The right resolution is the
intersection of both intents: drop the qemu_nbdkit patch (already done
on master) AND drop the two meson patches (your intent). The
substantive change in the rest of the patch =E2=80=94 adding run-ptest,
inheriting ptest, the do_configure prepend/append blocks, and
do_install_ptest =E2=80=94 applies cleanly.

End state of the SRC_URI block, for confirmation:

    SRC_URI =3D "gitsm://github.com/libvirt/libvirt.git;name=3Dlibvirt;protoc=
ol=3Dhttps;branch=3Dmaster \
               file://libvirtd.sh \
               file://libvirtd.conf \
               file://run-ptest \
               file://dnsmasq.conf \
               file://hook_support.py \
               file://gnutls-helper.py;subdir=3D${BP} \
               file://libvirt-qemu.conf \
               file://0001-prevent-gendispatch.pl-generating-build-path-in-co=
de.patch \
              "

The wrynose-tagged 2/2 of this patch (#2881) is parked behind the
rejected wrynose libvirt 12.2.0 version-bump in 1/2, so this master
landing doesn't affect that decision.

Thanks for the meson ptest work.

Bruce

On Fri, May 29, 2026 at 10:39 +0800, jason.lau wrote:
> libvirt has switched its build system from Makefile to meson, so the
> original run-ptest which relied on "make -C tests -k check-TESTS" no
> longer works. Re-add ptest support based on the meson build system:
>=20
> - Rewrite run-ptest to directly execute the compiled test binaries
>   instead of invoking make.
> - Patch meson.build at configure time to replace absolute build/source
>   paths with the ptest install paths, removing the need for separate
>   path-stripping patches.
> - Install test binaries and their required data files into the ptest
>   directory.
>=20
> Test results on genericx86-64:
>=20
>   All 120 tests passed (0 failures, 0 skips).
>=20
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
>=20
> =3D=3D=3D Test Summary =3D=3D=3D
> PASS: 120
> FAIL: 0
> SKIP: 0
> TOTAL: 120
>=20
> Signed-off-by: Haitao Liu <haitao.liu@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt/run-ptest | 32 ++++++++++++++-
>  recipes-extended/libvirt/libvirt_git.bb    | 45 ++++++++++++++++++++--
>  2 files changed, 73 insertions(+), 4 deletions(-)
>=20
> diff --git a/recipes-extended/libvirt/libvirt/run-ptest b/recipes-extended/=
libvirt/libvirt/run-ptest
> index a434b186..dd1f94d3 100644
> --- a/recipes-extended/libvirt/libvirt/run-ptest
> +++ b/recipes-extended/libvirt/libvirt/run-ptest
> @@ -1,3 +1,33 @@
>  #!/bin/sh
> =20
> -make -C tests -k check-TESTS
> +PTEST_DIR=3D"/usr/lib/libvirt/ptest/tests"
> +export LD_LIBRARY_PATH=3D"${PTEST_DIR}:${LD_LIBRARY_PATH}"
> +PASS=3D0
> +FAIL=3D0
> +SKIP=3D0
> +
> +run_test() {
> +    tname=3D"$1"
> +    tpath=3D"$2"
> +    "$tpath" >/dev/null 2>&1
> +    rc=3D$?
> +    case $rc in
> +        0)  echo "PASS: $tname"; PASS=3D$((PASS + 1)) ;;
> +        77) echo "SKIP: $tname"; SKIP=3D$((SKIP + 1)) ;;
> +        *)  echo "FAIL: $tname"; FAIL=3D$((FAIL + 1)) ;;
> +    esac
> +}
> +
> +# Skip run-ptest (self), commandhelper and qemucapsprobe are middleware
> +# used by other test cases, not test cases themselves.
> +for t in $(find ${PTEST_DIR} -maxdepth 1 -type f -executable ! -name "*.so=
" ! -name "run-ptest" ! -name "commandhelper" ! -name "qemucapsprobe"); do
> +    run_test "$(basename $t)" "$t"
> +done
> +
> +# Summary
> +echo ""
> +echo "=3D=3D=3D Test Summary =3D=3D=3D"
> +echo "PASS: $PASS"
> +echo "FAIL: $FAIL"
> +echo "SKIP: $SKIP"
> +echo "TOTAL: $((PASS + FAIL + SKIP))"
> diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/lib=
virt/libvirt_git.bb
> index 34a1ff21..d1d957cc 100644
> --- a/recipes-extended/libvirt/libvirt_git.bb
> +++ b/recipes-extended/libvirt/libvirt_git.bb
> @@ -34,17 +34,16 @@ PV =3D "v${LIBVIRT_VERSION}+git"
>  SRC_URI =3D "gitsm://github.com/libvirt/libvirt.git;name=3Dlibvirt;protoco=
l=3Dhttps;branch=3Dmaster \
>             file://libvirtd.sh \
>             file://libvirtd.conf \
> +           file://run-ptest \
>             file://dnsmasq.conf \
>             file://hook_support.py \
>             file://gnutls-helper.py;subdir=3D${BP} \
>             file://libvirt-qemu.conf \
>             file://0001-prevent-gendispatch.pl-generating-build-path-in-cod=
e.patch \
> -           file://0001-messon.build-remove-build-path-information-to-avoid=
-.patch \
> -           file://0001-tests-meson-clear-absolute-directory-paths.patch \
>             file://0001-qemu_nbdkit.c-use-llu-to-print-time_t.patch \
>            "
> =20
> -inherit meson gettext update-rc.d pkgconfig systemd useradd perlnative
> +inherit meson gettext update-rc.d pkgconfig systemd useradd perlnative pte=
st
>  USERADD_PACKAGES =3D "${PN}"
>  GROUPADD_PARAM:${PN} =3D "-r qemu; -r kvm; -r libvirt; -r virtlogin"
>  USERADD_PARAM:${PN} =3D "-r -g qemu -G kvm qemu"
> @@ -188,6 +187,46 @@ CVE_STATUS[CVE-2023-3750] =3D "fixed-version: Fixed in=
 9.6.0, NVD tracks this as v
>  # Enable the Python tool support
>  require libvirt-python.inc
> =20
> +do_configure:prepend() {
> +      sed -i \
> +        -e "s|meson.current_build_dir()|'${PTEST_PATH}/tests'|g" \
> +        -e "s|meson.project_build_root()|'${PTEST_PATH}'|g" \
> +        -e "s|meson.current_source_dir()|'${PTEST_PATH}/datas/tests'|g" \
> +        -e "s|meson.project_source_root()|'${PTEST_PATH}/datas'|g" \
> +        ${S}/tests/meson.build ${S}/scripts/rpcgen/tests/meson.build ${S}/=
tests/schemas/meson.build
> +}
> +
> +# Guard abs_top_builddir/abs_top_srcdir defines with #ifndef to avoid
> +# -Werror redefinition conflict when tests pass them via -D compile flags.
> +do_configure:append() {
> +      sed -i '/^#define abs_top_builddir/c\#ifndef abs_top_builddir\n#defi=
ne abs_top_builddir " "\n#endif' ${B}/meson-config.h
> +      sed -i '/^#define abs_top_srcdir/c\#ifndef abs_top_srcdir\n#define a=
bs_top_srcdir " "\n#endif' ${B}/meson-config.h
> +}
> +
> +
> +do_install_ptest() {
> +       install -d ${D}${PTEST_PATH}/tests
> +       install -d ${D}${PTEST_PATH}/datas/tests
> +        # The virshtest expects virsh at ${PTEST_PATH}/tests/tools/virsh, =
but it is
> +        # installed to /usr/bin/virsh by libvirt-virsh. Create a symlink t=
o satisfy
> +        # the test's expected path.
> +       install -d ${D}${PTEST_PATH}/tools=20
> +       ln -sf /usr/bin/virsh ${D}${PTEST_PATH}/tools/virsh=20
> +       find ${B}/tests/  -type f -executable -print -maxdepth 1 | xargs -i=
 cp {} ${D}${PTEST_PATH}/tests -rf
> +       cd ${S}/tests && find . -mindepth 1 -maxdepth 1 -type d | xargs -i =
cp {} ${D}${PTEST_PATH}/datas/tests -a
> +       install -m 0755 ${B}/scripts/rpcgen/tests/test_demo ${D}${PTEST_PAT=
H}/tests
> +       install -m 0644 ${S}/scripts/rpcgen/tests/*.bin ${D}${PTEST_PATH}/d=
atas/tests
> +       install -D -m 0644 -t ${D}${PTEST_PATH}/datas/examples/xml/test/  $=
{S}/examples/xml/test/*.xml
> +       install -D -m 0644 -t ${D}${PTEST_PATH}/datas/examples/xml/storage/=
 ${S}/examples/xml/storage/*.xml
> +       install -D -m 0644 -t ${D}${PTEST_PATH}/datas/src/conf/schemas/ ${S=
}/src/conf/schemas/*.rng
> +       install -D -m 0644 -t ${D}${PTEST_PATH}/datas/src/nwfilter/xml/ ${S=
}/src/nwfilter/xml/*.xml
> +       install -D -m 0644 -t ${D}${PTEST_PATH}/tests/schemas/ ${B}/tests/s=
chemas/*.rng
> +       install -m 0644 ${S}/tests/openvzutilstest.conf ${D}${PTEST_PATH}/d=
atas/tests
> +       install -d ${D}${PTEST_PATH}/datas/src/network
> +}
> +
> +RDEPENDS:${PN}-ptest +=3D " ${PN}-virsh"
> +
>  do_compile() {
>  	cd ${B}/src
>  	# There may be race condition, but without creating these directories

