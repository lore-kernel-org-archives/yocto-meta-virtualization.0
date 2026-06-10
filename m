Return-Path: <kraghava@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E079FCD98C6
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 06:37:05 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14240.1781073416184976096
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 23:36:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=XmJ2HH+U;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: kraghava@qti.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A4X9NA573128;
	Wed, 10 Jun 2026 06:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ePDPnTOXg+Y4d6ZAteoDa1xNwCBKHQe0507IsqHZB+U=; b=XmJ2HH+UMBwNjGfG
	pk0jtiX4U5AVyK7yBlboB4l2Dp98ktam2uvwXF5IjCVr69L6IFhuceozhPI3YgRu
	mPpLGb94OK2CtIbZG7sh/ZcCCuWbakJpJUuZhbQIWKyoWpNQbVmCpfALEdN7qx6q
	6Dnf3IsEdpOYpfoovY7JEdfH+ra8JSyFH7O5ghUwmd40FCRcIADCebvnLiqcGzGD
	2jaZsQab+Knfm0GBFPrJHo5tFxjtuFeWNuxguOpb86ohS8GzcTaY8kVUdzlZvPBE
	tjMdHvSLNJ55i5IHKoRZEuzICoNkJUKTyx+otla/59886nBaDjmjiFyKLwtdvb5I
	pwKzhA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq10a8de7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 06:36:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 65A6arnE028609
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 06:36:53 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Jun 2026 23:36:50 -0700
From: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
To: <vkraleti@qti.qualcomm.com>, <anujmitt@qti.qualcomm.com>,
        <sbanerje@qti.qualcomm.com>, <bruce.ashfield@gmail.com>,
        <meta-virtualization@lists.yoctoproject.org>
CC: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
Subject: [PATCH v1 2/2] crosvm-image-minimal: add a reference image for crosvm demo
Date: Wed, 10 Jun 2026 12:06:24 +0530
Message-ID: <20260610063624.3420495-3-kraghava@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610063624.3420495-1-kraghava@qti.qualcomm.com>
References: <20260610063624.3420495-1-kraghava@qti.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=GoFyPE1C c=1 sm=1 tr=0 ts=6a290606 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=3BVm0z1yjlMEecujqqwA:9
X-Proofpoint-ORIG-GUID: uF3SazLwJRMG4bS0xq3HhwnE9TLBIpVl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA2MCBTYWx0ZWRfX8w9Y+S1rm7HW
 ULR7CWHjT2Gvu0GnlfeHi2RDbajgMmqOY5nNh51Ukpn44bvkh1WWnO/cq4v4HxpEVa9ZzqZp4Mm
 wA+uv+A/AyDupYIHJCF6LCV5kdFzv0vDHsNyPdw6U3eH5n8GF6alcCr+uIb2mUaqi8G5+wlAb0e
 KYOJHgRKhf5aLOdNPCD3o6n2hOL/ZDGTYWh025ePwVIb1wb7hrhvpIa7fBMauf1vEyEEFukHMpE
 l5CEeaRACcvEU/oVpcS88P6EoUYtGpoYmtfi/dYbPojUB39/pngZXvXNDct/dzFsteB3MCX0LEf
 mxiR+Xg9JOCnnZfSra0iFouq4lMYKRG2+OpLEXtoyVK+EEOGLu1oUrRQMl9upcljWoP9KRMrR/s
 1UOStpQXJIjz/u/0sIMTfL6mMrXwuZuwHaZ6pM6rhIiDnH/eAAT5uZdPgRG04OXY/D8tjW3jJzh
 tUUrsbP/o46ZR3Duz8g==
X-Proofpoint-GUID: uF3SazLwJRMG4bS0xq3HhwnE9TLBIpVl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100060
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jun 2026 06:37:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9859

A reference image called `crosvm-image-minimal` is provided
for testing/validation on supported machines(arm64 and x86-64).
Instructions are provided to test on QEMU(x86-64 only).

Testing was done on x86-64 by achieving boot to shell on a crosvm vm
instance running inside a vm instance on QEMU, i.e nested virtualization
with machine as qemux86-64.
Testing was done on arm64 by achieving boot to shell on a crosvm vm
instance running directly on meta-qcom machine qcs9100-ride-sx.

Signed-off-by: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
---
 recipes-extended/images/README-crosvm.md      | 68 +++++++++++++++++++
 .../images/crosvm-image-minimal.bb            | 68 +++++++++++++++++++
 2 files changed, 136 insertions(+)
 create mode 100644 recipes-extended/images/README-crosvm.md
 create mode 100644 recipes-extended/images/crosvm-image-minimal.bb

diff --git a/recipes-extended/images/README-crosvm.md b/recipes-extended/images/README-crosvm.md
new file mode 100644
index 00000000..2c36da7d
--- /dev/null
+++ b/recipes-extended/images/README-crosvm.md
@@ -0,0 +1,68 @@
+# crosvm-image-minimal: build and test
+
+Steps to test/validate crosvm are given below.
+A reference image `crosvm-image-minimal` is provided
+for this purpose.
+
+## local.conf example
+
+```conf
+# virtualization
+MACHINE ??= "qemux86-64"
+DISTRO ??= "nodistro"
+BBMULTICONFIG ?= ""
+
+DISTRO_FEATURES += " kvm virtualization"
+IMAGE_FEATURES += " empty-root-password allow-empty-password allow-root-login"
+IMAGE_FSTYPES = "ext4"
+IMAGE_FSTYPES:remove = "ext4.zst"
+```
+
+## Build
+
+```bash
+bitbake crosvm-image-minimal
+```
+
+## Boot in QEMU
+
+When the target `MACHINE` is `qemux86-64`, the host running QEMU must support:
+- nested virtualization
+- Intel VT-x or AMD SVM
+- exposed `/dev/kvm`
+
+Run from `tmp/deploy/images/qemux86-64/` (or adjust paths):
+
+```bash
+qemu-system-x86_64 \
+  -enable-kvm \
+  -machine q35 \
+  -cpu host \
+  -smp 4 \
+  -m 4096 \
+  -kernel bzImage \
+  -drive file=crosvm-image-minimal-qemux86-64.rootfs.ext4,format=raw,if=virtio \
+  -append "root=/dev/vda rw console=ttyS0 earlyprintk=serial nokaslr" \
+  -nographic
+```
+
+## Run crosvm inside the guest
+
+The image bundles:
+
+- `/var/lib/crosvm/images/guest-kernel`
+- `/var/lib/crosvm/images/guest.ext4`
+
+```bash
+crosvm --log-level "debug,disk=off" run \
+  --disable-sandbox  /var/lib/crosvm/images/guest-kernel \
+  --block /var/lib/crosvm/images/guest.ext4,root \
+  -p "root=/dev/vda rw console=ttyS0 earlyprintk=serial nokaslr"
+```
+
+## Quick sanity checks
+
+```bash
+test -e /dev/kvm && echo "/dev/kvm present"
+ls -l /var/lib/crosvm/images/
+```
diff --git a/recipes-extended/images/crosvm-image-minimal.bb b/recipes-extended/images/crosvm-image-minimal.bb
new file mode 100644
index 00000000..de503a99
--- /dev/null
+++ b/recipes-extended/images/crosvm-image-minimal.bb
@@ -0,0 +1,68 @@
+SUMMARY = "A minimal image containing crosvm to demo its uage."
+
+KVM_MODULES = ""
+
+KVM_MODULES:x86-64 = " \
+    kernel-module-kvm \
+    kernel-module-kvm-intel \
+    kernel-module-kvm-amd \
+"
+
+IMAGE_INSTALL = "packagegroup-core-boot crosvm"
+IMAGE_INSTALL:append = " ${KVM_MODULES}"
+
+IMAGE_LINGUAS = " "
+
+LICENSE = "MIT"
+
+inherit core-image
+
+# Guest artifact source settings (can be overridden in local.conf).
+CROSVM_GUEST_IMAGE_RECIPE ?= "core-image-minimal"
+CROSVM_GUEST_IMAGE_FSTYPE ?= "ext4"
+CROSVM_GUEST_ROOTFS ?= "${CROSVM_GUEST_IMAGE_RECIPE}-${MACHINE}.rootfs.${CROSVM_GUEST_IMAGE_FSTYPE}"
+CROSVM_GUEST_KERNEL ?= "${KERNEL_IMAGETYPE}"
+
+# Final location inside the host/root image.
+CROSVM_GUEST_TARGET_DIR ?= "/var/lib/crosvm/images"
+CROSVM_GUEST_TARGET_ROOTFS_NAME ?= "guest.${CROSVM_GUEST_IMAGE_FSTYPE}"
+CROSVM_GUEST_TARGET_KERNEL_NAME ?= "guest-kernel"
+
+# Ensure guest image and kernel are available before rootfs postprocess runs.
+# The same kernel is used for both the host and guest.
+do_rootfs[depends] += "${CROSVM_GUEST_IMAGE_RECIPE}:do_image_complete virtual/kernel:do_deploy"
+
+# Copy guest rootfs+kernel into the host rootfs for crosvm demo runtime.
+bundle_crosvm_guest() {
+    set -e
+
+    local deploy_dir="${DEPLOY_DIR_IMAGE}"
+    local rootfs_src="${deploy_dir}/${CROSVM_GUEST_ROOTFS}"
+    local kernel_src="${deploy_dir}/${CROSVM_GUEST_KERNEL}"
+    local target_dir="${IMAGE_ROOTFS}${CROSVM_GUEST_TARGET_DIR}"
+
+    if [ ! -e "$rootfs_src" ]; then
+        bbfatal "Cannot find guest rootfs. Tried: \
+                ${deploy_dir}/${CROSVM_GUEST_ROOTFS} and \
+                ${deploy_dir}/${CROSVM_GUEST_IMAGE_RECIPE}-${MACHINE}.rootfs.${CROSVM_GUEST_IMAGE_FSTYPE}"
+    fi
+
+    if [ ! -e "$kernel_src" ]; then
+        bbfatal "Cannot find guest kernel. Tried: \
+                ${deploy_dir}/${CROSVM_GUEST_KERNEL}"
+    fi
+
+    install -d "$target_dir"
+
+    install -m 0644 "$(readlink -f "$rootfs_src")" \
+                    "$target_dir/${CROSVM_GUEST_TARGET_ROOTFS_NAME}"
+
+    install -m 0644 "$(readlink -f "$kernel_src")" \
+                    "$target_dir/${CROSVM_GUEST_TARGET_KERNEL_NAME}"
+}
+
+ROOTFS_POSTPROCESS_COMMAND += "bundle_crosvm_guest;"
+
+IMAGE_ROOTFS_SIZE = "0"
+
+KERNEL_MODULE_AUTOLOAD:append:x86-64 = " kvm kvm_amd kvm_intel"
-- 
2.34.1


