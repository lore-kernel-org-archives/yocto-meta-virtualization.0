Return-Path: <Haitao.Liu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFAF2CD5BD1
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 09:56:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24976.1780307757233417931
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 01 Jun 2026 02:55:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lChsZtV+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0612209e35=haitao.liu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6519tuYG3143009
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 1 Jun 2026 02:55:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=st9B3Xwn4VzfeDgM3LxJ
	/+pzLrhZJDaw02OaqxUJcuc=; b=lChsZtV+zH2qAPqzoBWAaVfWzMEu2bCiHqyo
	z1RVoaC+g6RONgIJ9wxct9Yi58pu06LF4ReM9Jg7V8ARMGm5t62dYjj8rKL6qdf8
	pAtgqWzTMwdq/zN2NYki8Soi/k9sj/Z/kbgzdW3IbaWsYZumBtuLUgpHaOVxLTvc
	WR2Zsi0HFvNsb0gnPQ2SgWHfkt66relMn+KEfXN958fS2oLrFZ9y/r114456JJx0
	+MEv64NxF6kSZ0wILjSHXUJVUxLOwLNlz2WulnYYvJILZJ2nsSVkh5a6asGQHPJ9
	b7cav987yixOGo0UU7wbolXa3pVTUcD+g17ZqBv8Pt2Sf2j0DQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4efydead1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 01 Jun 2026 02:55:56 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 1 Jun 2026 02:55:55 -0700
Received: from pek-lpd-susbld.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 1 Jun 2026 02:55:55 -0700
From: Haitao Liu <haitao.liu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][PATCH] openvswitch: re-enable ptest
Date: Mon, 1 Jun 2026 17:55:54 +0800
Message-ID: <20260601095554.460399-1-haitao.liu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA5OSBTYWx0ZWRfXy9R7i0c6maOE
 0kpBMfYJKTgfkYQtDt80G9B2ZmrpV/0ErCCyyloUjFXMK1LBTQz5r3EPFUYWlGIaYGKzAFVg91m
 A9ZR9BBlrTM15+IkU8XMUu81UNnwIQoXC2w8dzJWb+78p7rmZZlUdE/zmdT72yXxYUymajtRsi5
 yH9pc2hs8w0F0xCChQLsbA15V/yMA2+ucUnYl7Jxy/MA3P+hDd53g2H0hhWagm6cB8EnkXCa6nN
 NTItZrmgEbOCVmcjfkenL7Mzs+LIrmgzRygd0XOZO92jBs21E3JiF01TFCZ8yYOjfh+1JyxW8Lh
 y1CUW+975bqv37qwWT3YkkiC26HyDOmy54Ct33iapkmySE07LtybYrR2859476GjCrp/8+AmboW
 YOHWqWnhSQFf9cs90jwvZMhNGjvhOWKXvqvsS1J80nxofNXOHglnilEKuN+7rnUSO8tt0FUTdTx
 li0p43a+EHiopTZG1oQ==
X-Proofpoint-GUID: bZ3DJ17IxMtSNMWOTicY5YRcaG0JPkfi
X-Authority-Analysis: v=2.4 cv=Iq0utr/g c=1 sm=1 tr=0 ts=6a1d572c cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=EQfKLX93OnTQK2PhQ0oA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: bZ3DJ17IxMtSNMWOTicY5YRcaG0JPkfi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010099
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 01 Jun 2026 09:56:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9836

Ptest support was disabled in commit 816d4c6e0e7c due to breakage in
source handling that prevented proper installation of test files.

Fix the ptest installation by:
  - Copying test binaries from the build directory, preserving subdirectory
    structure (e.g., oss-fuzz/) for optional test components
  - Installing *.at test definitions and *.py test scripts from the source tree
  - Fixing PYTHONPATH in atlocal to use runtime paths instead of build paths
  - Symlinking schema files already provided by the main package to avoid
    file duplication

Re-enable ptest now that installation works correctly.

Test results on genericx86-64:

PASS: checkpatch - catastrophic backtracking
PASS: checkpatch - Unicode code
PASS: appctl-bashcomp - complex completion check 4
PASS: appctl-bashcomp - complex completion check 2
PASS: checkpatch - check misuse APIs
PASS: checkpatch - whitespace around cast
PASS: checkpatch - comments
PASS: checkpatch - check egrep / fgrep
PASS: checkpatch - file contents checks - bare return
PASS: checkpatch - subject
PASS: appctl-bashcomp - negative test
...
...
...
PASS: drop-stats - bridge sampling
PASS: drop-stats - sampling action
PASS: ovsdb-idl - Check Python IDL reconnects to leader - Python3 (leader only)
PASS: monitor-cond-change with many sessions pending

2658 tests were successful.
89 tests were skipped.

Signed-off-by: Haitao Liu <haitao.liu@windriver.com>
---
 .../openvswitch/openvswitch_git.bb            | 59 ++++++++++++++++++-
 1 file changed, 56 insertions(+), 3 deletions(-)

diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index 87790090..c02ef9fd 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -20,7 +20,6 @@ FILESEXTRAPATHS:append := "${THISDIR}/${PN}-git:"
 
 SRCREV = "0d4c78e153d2b22ab1b173cd4a4dfff89002666d"
 SRC_URI += "git://github.com/openvswitch/ovs.git;protocol=https;branch=branch-3.7 \
-            file://openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch \
             file://run-ptest \
             file://disable_m4_check.patch \
             file://systemd-update-tool-paths.patch \
@@ -50,6 +49,60 @@ inherit ptest
 EXTRA_OEMAKE += "TEST_DEST=${D}${PTEST_PATH} TEST_ROOT=${PTEST_PATH}"
 
 do_install_ptest() {
-	echo "disabled: oe_runmake test-install"
-}
 
+    install -d ${D}${PTEST_PATH}/tests/
+
+    install -m 0644 ${B}/tests/atlocal ${B}/tests/atconfig ${D}${PTEST_PATH}/tests/
+
+    # Copy test binaries into the ptest directory, preserving subdirectory structure.
+    # Use -maxdepth 2 because subdirectories like oss-fuzz/ are not enabled by default;
+    # when enabled, their binaries (e.g., ./oss-fuzz/oss) need to be copied as well.
+    cd ${B}/tests && find . -maxdepth 2 -type f -executable | xargs -I {} cp --parents {} ${D}${PTEST_PATH}/tests/
+    cd ${S}/tests && find . -maxdepth 1 -name '*.at' | xargs -I {} cp --parents {} ${D}${PTEST_PATH}/tests/
+    cd ${S}/tests && find . -maxdepth 1 -type f -executable | xargs -I {} cp --parents {} ${D}${PTEST_PATH}/tests/
+
+    cd ${S}/tests && find . -maxdepth 1 -name '*.py' -exec install -m 0755 {} ${D}${PTEST_PATH}/tests/ \;
+
+    install -D -m 0644 ${S}/vswitchd/vswitch.ovsschema ${D}${PTEST_PATH}/vswitchd/vswitch.ovsschema
+
+    install -D -m 0755 ${S}/utilities/checkpatch.py ${D}${PTEST_PATH}/utilities/checkpatch.py
+    install -D -m 0644 ${S}/utilities/ovs-pcap.in ${D}${PTEST_PATH}/utilities/ovs-pcap.in
+    install -D -m 0644 ${S}/utilities/ovs-pki.in  ${D}${PTEST_PATH}/utilities/ovs-pki.in
+
+    install -D -m 0644 ${S}/python/test_requirements.txt ${D}${PTEST_PATH}/python/test_requirements.txt
+    install -m 0644 ${S}/tests/idltest.ovsschema ${D}${PTEST_PATH}/tests/
+    install -m 0644 ${S}/tests/idltest2.ovsschema ${D}${PTEST_PATH}/tests/
+    install -m 0644 ${S}/AUTHORS.rst ${D}${PTEST_PATH}/
+    install -D -m 0644 ${S}/build-aux/check-structs ${D}${PTEST_PATH}/build-aux/check-structs
+
+    # Symlink vtep.ovsschema to the path expected by ptest; the actual file is
+    # already installed by the main openvswitch package.
+    install -d ${D}${PTEST_PATH}/vtep
+    ln -sf /usr/share/openvswitch/vtep.ovsschema ${D}${PTEST_PATH}/vtep/vtep.ovsschema
+
+    sed  -i \
+         -e 's|PYTHON=.*|PYTHON="python3"|' \
+         -e 's|PYTHONPATH=.*|PYTHONPATH=/usr/share/openvswitch/python:${PTEST_PATH}/tests:$PYTHONPATH|' \
+         -e 's|EGREP=.*|EGREP='"'"'grep -E'"'"'|g' \
+         -e 's|CFLAGS=.*|CFLAGS='"'"' '"'"'|g' \
+         ${D}${PTEST_PATH}/tests/atlocal
+
+    sed -i \
+        -e "s|^at_testdir=.*|at_testdir='${PTEST_PATH}'|" \
+        -e "s|^abs_builddir=.*|abs_builddir='${PTEST_PATH}'|" \
+        -e "s|^at_srcdir=.*|at_srcdir='${PTEST_PATH}/tests'|" \
+        -e "s|^abs_srcdir=.*|abs_srcdir='${PTEST_PATH}/tests'|" \
+        -e "s|^at_top_srcdir=.*|at_top_srcdir='${PTEST_PATH}'|" \
+        -e "s|^abs_top_srcdir=.*|abs_top_srcdir='${PTEST_PATH}'|" \
+        -e "s|^at_top_build_prefix=.*|at_top_build_prefix='${PTEST_PATH}'|" \
+        -e "s|^abs_top_builddir=.*|abs_top_builddir='${PTEST_PATH}'|" \
+         ${D}${PTEST_PATH}/tests/atconfig
+
+    sed -i \
+        -e "s|ovs-appctl-bashcomp\.bash|/etc/bash_completion.d/ovs-appctl-bashcomp\.bash|g" \
+        -e "s|ovs-vsctl-bashcomp\.bash|/etc/bash_completion.d/ovs-vsctl-bashcomp\.bash|g"   \
+        -e "s|^\(.*config\.log.*\)|#\1|g" \
+         ${D}${PTEST_PATH}/tests/testsuite
+}
+RDEPENDS:${PN}-ptest += " ${PN}-testcontroller"
+RDEPENDS:${PN}-ptest += "python3-packaging python3-setuptools"
-- 
2.34.1


