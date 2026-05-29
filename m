Return-Path: <Haitao.Liu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E38E9CD6E4C
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 03:01:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2675.1780023650996931716
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 28 May 2026 20:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=n7yS/VSn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=06090f33be=haitao.liu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T2D4pG2982308
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 29 May 2026 03:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=SeJF/Q/+5iwr1IgcZAjle1q9lSL5hX18GJcjfJKxRcg=; b=n7yS/VSnP4YL
	rylO77rKphfW4DNj70KtJeFfhokAnKKDNWklFnJA36oUilehBpPY2NuITgO1n5Tb
	88i4WQglnBgA9R5w3pgqmGYP4+81kAONlHLNY2EEPw76lIxGhDwGidEibZNCCG4K
	o/3wc38dckRVQT6U2z+mDC/pqqOCy5U5jkoCbdl0cHtzhcnL0qjCrDlJCNHsd4WN
	gO3aecN7zby0Jgs+5wCvINL/cVQRx951po4r9D8TxhtDDYwQCpen4AoYuQqJqRE4
	1vSI0jviC1FizH0X5OLIcUGNnGTOVLNbpoixMrIL+u0Ri1cZr1hS3mfepyiWKUe0
	CJ1YcAvlSw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ee7x8su55-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 29 May 2026 03:00:49 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 28 May 2026 20:00:48 -0700
Received: from pek-lpd-susbld.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 28 May 2026 20:00:47 -0700
From: Haitao Liu <haitao.liu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][wrynose][PATCH 2/2] libvirt: re-add ptest support for meson build system
Date: Fri, 29 May 2026 11:00:40 +0800
Message-ID: <20260529030040.1487113-2-haitao.liu@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260529030040.1487113-1-haitao.liu@windriver.com>
References: <20260529030040.1487113-1-haitao.liu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: -ivqn8tAhPx_u4pZ4x8EIv77gA2Y_-G1
X-Proofpoint-GUID: -ivqn8tAhPx_u4pZ4x8EIv77gA2Y_-G1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDAyOCBTYWx0ZWRfX4XdtnCKfDGcl
 ag8Q6fNoWdDSSWGAxAiouDFDnGsQaYtwy0u1Bb6eYz3jZfeXU8pNqXbFGl8rHoA6iq6lInK4JAn
 GCSGDGlGMBfK5rMZxLs/yrlJ11593lEOAxaeDpPJ47uKXbdJcoqJY2jVk3CjXI+DLBp4azmcH+O
 7Fj2EQonQZGEwaPZNF8fHMDOji+q1gHvrnFY+amnrWe4jryiAy+K+uV8S/g8W8T94J3+fL8zvod
 oZ8fclWT00T6qASlcLK1ERyM5ZUSRYM5Leeexe09vztGwS20KGeDtFM2+x3cW5kdkr2g6Qhsw+9
 XI0PH1qIvKbFyonl4H2cAEUrmLormctnSSxfIKjGUoFIksLNbRNEogT//YLA9yhuqxILOxBZurt
 b0HGa4dqD8XxJByLhjPoOBh74ILRaz5Q7bbg200NBuVlyBeMrykJMsjoL8SszyH9NUxup3sONrU
 h7S6QG/HeYVbMGC58bg==
X-Authority-Analysis: v=2.4 cv=E6v9Y6dl c=1 sm=1 tr=0 ts=6a190161 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=8Ad4tvYqdmIA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=FDcp4cXCS3qWZ9KsLuMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290028
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 29 May 2026 03:01:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9824

libvirt has switched its build system from Makefile to meson, so the
original run-ptest which relied on "make -C tests -k check-TESTS" no
longer works. Re-add ptest support based on the meson build system:

- Rewrite run-ptest to directly execute the compiled test binaries
  instead of invoking make.
- Patch meson.build at configure time to replace absolute build/source
  paths with the ptest install paths, removing the need for separate
  path-stripping patches.
- Install test binaries and their required data files into the ptest
  directory.

Test results on genericx86-64:

  All 120 tests passed (0 failures, 0 skips).

root@genericx86-64:/usr/lib/libvirt/ptest# ./run-ptest
PASS: chxml2xmltest
PASS: nssguestlinktest
PASS: virbuftest
PASS: viracpitest
PASS: esxutilstest
PASS: ssh
PASS: storagepoolxml2xmltest
PASS: commandtest
...
...
PASS: nwfilterebiptablestest
PASS: cputest

=== Test Summary ===
PASS: 120
FAIL: 0
SKIP: 0
TOTAL: 120

Signed-off-by: Haitao Liu <haitao.liu@windriver.com>
---
 recipes-extended/libvirt/libvirt/run-ptest | 32 ++++++++++++++-
 recipes-extended/libvirt/libvirt_git.bb    | 45 ++++++++++++++++++++--
 2 files changed, 73 insertions(+), 4 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt/run-ptest b/recipes-extended/libvirt/libvirt/run-ptest
index a434b186..dd1f94d3 100644
--- a/recipes-extended/libvirt/libvirt/run-ptest
+++ b/recipes-extended/libvirt/libvirt/run-ptest
@@ -1,3 +1,33 @@
 #!/bin/sh
 
-make -C tests -k check-TESTS
+PTEST_DIR="/usr/lib/libvirt/ptest/tests"
+export LD_LIBRARY_PATH="${PTEST_DIR}:${LD_LIBRARY_PATH}"
+PASS=0
+FAIL=0
+SKIP=0
+
+run_test() {
+    tname="$1"
+    tpath="$2"
+    "$tpath" >/dev/null 2>&1
+    rc=$?
+    case $rc in
+        0)  echo "PASS: $tname"; PASS=$((PASS + 1)) ;;
+        77) echo "SKIP: $tname"; SKIP=$((SKIP + 1)) ;;
+        *)  echo "FAIL: $tname"; FAIL=$((FAIL + 1)) ;;
+    esac
+}
+
+# Skip run-ptest (self), commandhelper and qemucapsprobe are middleware
+# used by other test cases, not test cases themselves.
+for t in $(find ${PTEST_DIR} -maxdepth 1 -type f -executable ! -name "*.so" ! -name "run-ptest" ! -name "commandhelper" ! -name "qemucapsprobe"); do
+    run_test "$(basename $t)" "$t"
+done
+
+# Summary
+echo ""
+echo "=== Test Summary ==="
+echo "PASS: $PASS"
+echo "FAIL: $FAIL"
+echo "SKIP: $SKIP"
+echo "TOTAL: $((PASS + FAIL + SKIP))"
diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/libvirt/libvirt_git.bb
index cb5d3482..0052f527 100644
--- a/recipes-extended/libvirt/libvirt_git.bb
+++ b/recipes-extended/libvirt/libvirt_git.bb
@@ -34,17 +34,16 @@ PV = "v${LIBVIRT_VERSION}+git"
 SRC_URI = "gitsm://github.com/libvirt/libvirt.git;name=libvirt;protocol=https;branch=master \
            file://libvirtd.sh \
            file://libvirtd.conf \
+           file://run-ptest \
            file://dnsmasq.conf \
            file://hook_support.py \
            file://gnutls-helper.py;subdir=${BP} \
            file://libvirt-qemu.conf \
            file://0001-prevent-gendispatch.pl-generating-build-path-in-code.patch \
-           file://0001-messon.build-remove-build-path-information-to-avoid-.patch \
-           file://0001-tests-meson-clear-absolute-directory-paths.patch \
            file://0001-qemu_nbdkit.c-use-llu-to-print-time_t.patch \
           "
 
-inherit meson gettext update-rc.d pkgconfig systemd useradd perlnative
+inherit meson gettext update-rc.d pkgconfig systemd useradd perlnative ptest
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM:${PN} = "-r qemu; -r kvm; -r libvirt; -r virtlogin"
 USERADD_PARAM:${PN} = "-r -g qemu -G kvm qemu"
@@ -188,6 +187,46 @@ CVE_STATUS[CVE-2023-3750] = "fixed-version: Fixed in 9.6.0, NVD tracks this as v
 # Enable the Python tool support
 require libvirt-python.inc
 
+do_configure:prepend() {
+      sed -i \
+        -e "s|meson.current_build_dir()|'${PTEST_PATH}/tests'|g" \
+        -e "s|meson.project_build_root()|'${PTEST_PATH}'|g" \
+        -e "s|meson.current_source_dir()|'${PTEST_PATH}/datas/tests'|g" \
+        -e "s|meson.project_source_root()|'${PTEST_PATH}/datas'|g" \
+        ${S}/tests/meson.build ${S}/scripts/rpcgen/tests/meson.build ${S}/tests/schemas/meson.build
+}
+
+# Guard abs_top_builddir/abs_top_srcdir defines with #ifndef to avoid
+# -Werror redefinition conflict when tests pass them via -D compile flags.
+do_configure:append() {
+      sed -i '/^#define abs_top_builddir/c\#ifndef abs_top_builddir\n#define abs_top_builddir " "\n#endif' ${B}/meson-config.h
+      sed -i '/^#define abs_top_srcdir/c\#ifndef abs_top_srcdir\n#define abs_top_srcdir " "\n#endif' ${B}/meson-config.h
+}
+
+
+do_install_ptest() {
+       install -d ${D}${PTEST_PATH}/tests
+       install -d ${D}${PTEST_PATH}/datas/tests
+        # The virshtest expects virsh at ${PTEST_PATH}/tests/tools/virsh, but it is
+        # installed to /usr/bin/virsh by libvirt-virsh. Create a symlink to satisfy
+        # the test's expected path.
+       install -d ${D}${PTEST_PATH}/tools 
+       ln -sf /usr/bin/virsh ${D}${PTEST_PATH}/tools/virsh 
+       find ${B}/tests/  -type f -executable -print -maxdepth 1 | xargs -i cp {} ${D}${PTEST_PATH}/tests -rf
+       cd ${S}/tests && find . -mindepth 1 -maxdepth 1 -type d | xargs -i cp {} ${D}${PTEST_PATH}/datas/tests -a
+       install -m 0755 ${B}/scripts/rpcgen/tests/test_demo ${D}${PTEST_PATH}/tests
+       install -m 0644 ${S}/scripts/rpcgen/tests/*.bin ${D}${PTEST_PATH}/datas/tests
+       install -D -m 0644 -t ${D}${PTEST_PATH}/datas/examples/xml/test/  ${S}/examples/xml/test/*.xml
+       install -D -m 0644 -t ${D}${PTEST_PATH}/datas/examples/xml/storage/ ${S}/examples/xml/storage/*.xml
+       install -D -m 0644 -t ${D}${PTEST_PATH}/datas/src/conf/schemas/ ${S}/src/conf/schemas/*.rng
+       install -D -m 0644 -t ${D}${PTEST_PATH}/datas/src/nwfilter/xml/ ${S}/src/nwfilter/xml/*.xml
+       install -D -m 0644 -t ${D}${PTEST_PATH}/tests/schemas/ ${B}/tests/schemas/*.rng
+       install -m 0644 ${S}/tests/openvzutilstest.conf ${D}${PTEST_PATH}/datas/tests
+       install -d ${D}${PTEST_PATH}/datas/src/network
+}
+
+RDEPENDS:${PN}-ptest += " ${PN}-virsh"
+
 do_compile() {
 	cd ${B}/src
 	# There may be race condition, but without creating these directories
-- 
2.34.1


