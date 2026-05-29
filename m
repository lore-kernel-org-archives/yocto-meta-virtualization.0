Return-Path: <Haitao.Liu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A40DDCD5BD1
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 02:39:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2392.1780022384496603207
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 28 May 2026 19:39:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Pg+o88cW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=06090f33be=haitao.liu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T0W65N3077653
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 28 May 2026 19:39:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=LqsWrMyMN32+sxAeRKo/
	wtQA2x9+GJ6ntEV47U0kTN4=; b=Pg+o88cWL49ocKi7JJs4VPLrdC0vhW8ze7NK
	+7MnbKWjWZzbMuMfLm0nThYOP4DNWPQa0J7lLXF4T15g3dvWOF0AzW6zvnKWPHCB
	b8FysGqDefCMSuKolSXPxToTMiqCyE5IYhSA75WPzMs7j+2qmsCH5g7g5ZKaOM7q
	XuDxncYGx3oqZWQryhcYcbUGdZ8psOarjmbYxCMUJA015tc7kDoN4Osjbr/PM+Up
	zeZn+X5AesvSHPH71NKRaXV99OsjmZ6fgdv0FDCCGAxam36/UYoOWDBohGVzGGFK
	8aHhkJdj+pEEbBBlKT1kz4Z2Umx7H+wReKJSVTkc0dWjUzTmDQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ee7x6hv6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 28 May 2026 19:39:43 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 28 May 2026 19:39:43 -0700
Received: from pek-lpd-susbld.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 28 May 2026 19:39:42 -0700
From: Haitao Liu <haitao.liu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] libvirt: re-add ptest support for meson build system
Date: Fri, 29 May 2026 10:39:41 +0800
Message-ID: <20260529023941.1460960-1-haitao.liu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ywOKkHV781Wpy7nd8Sj2HKPVer542TCQ
X-Proofpoint-ORIG-GUID: ywOKkHV781Wpy7nd8Sj2HKPVer542TCQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDAyNCBTYWx0ZWRfXxG5Zg0TarDsE
 4/cVpop+Q/vuhUnXnpCvepzTrUECX18330orw+PUFSXwqcKrxo/4WWhnd+A8TN7UMEDWyewriH/
 hkHilpqsL2tu91fmPr9iZGsiNJHQMRtbo5L377Cke10jZ03FZ2jJIO9X9X4q+lQyqF4NGtmVZ6q
 2/qXkfkg1YHX3M5Z91BFwIEi9uLFK8eDRZ24apL3TZCJn0nIxAi6GuerImJy5clJqz4KUaE0vUg
 viMQ6s/2N5GzfTvWw5ngPD3musZwLYI8pl2Zp0l1rs7Fksbsd+aIVUqCoy0Qn+g6ZwTmWqBTVfP
 ZWeUHKWSlNTczA5hzlbUvmXaU8+EL5/psrUKxbe0zJi1Wp9LbjD+27KlJjjC2Y8/wjQRwE/PxtH
 DVhkaY3l3UX+6uR8ptNmqWcKDvljV59Cv0Mlya0HDZvhHRoLhp7cw02935le/Ix7nYzENxKhoAw
 2fcB0X1pvmRJDudOQTA==
X-Authority-Analysis: v=2.4 cv=bY1bluPB c=1 sm=1 tr=0 ts=6a18fc6f cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=FDcp4cXCS3qWZ9KsLuMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1011 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290024
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 29 May 2026 02:39:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9822

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
index 34a1ff21..d1d957cc 100644
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


