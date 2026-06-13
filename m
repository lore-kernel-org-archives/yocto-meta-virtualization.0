Return-Path: <kraghava@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 992E0CD98D2
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 06:08:22 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86574.1781330894199577237
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 12 Jun 2026 23:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=XhfQ24C7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: kraghava@qti.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65D5be8u1532532;
	Sat, 13 Jun 2026 06:08:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QYicRBJc7WwMjUCIaV/Mp8ZCeFi0YTz47iUtth3sn98=; b=XhfQ24C7em2LUQuu
	daKQ6m2Gg3PVig4SC1slTXeNm2kyyfMBtqDCjURp+0zeyRg1t90FwSSwGmkO07BJ
	PzF11RNHw6lSu19LdnInQS49FhL22ut5QtsT4ozcLSTFp96pXyDOGf6z6nL3QgB6
	AQQVfU5d8sAFjcLDFunb3t0Jiolm7ys0QU2e58oIIzk6SioEWdtvIODmp+7cE+UA
	tRl/QRmToPtWRplfM6ojgY8iw4m+Tebl71hwPF7KMzZWnox7Vft71+mAuEwQZ0xy
	Q8oikAF6QiPMiWtIQTGjxpTzC1perzYNrtCjvx+Bg9OQhnLIk7UMgrwusZyUFYti
	KUANIQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery9509gn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jun 2026 06:08:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 65D68B2H032424
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Jun 2026 06:08:11 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Jun 2026 23:08:08 -0700
From: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
To: <vkraleti@qti.qualcomm.com>, <anujmitt@qti.qualcomm.com>,
        <sbanerje@qti.qualcomm.com>, <bruce.ashfield@gmail.com>,
        <meta-virtualization@lists.yoctoproject.org>
CC: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
Subject: [PATCH v2 2/2] crosvm-image-minimal: add a reference image for crosvm demo
Date: Sat, 13 Jun 2026 11:37:43 +0530
Message-ID: <20260613060743.3120135-3-kraghava@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260613060743.3120135-1-kraghava@qti.qualcomm.com>
References: <20260613060743.3120135-1-kraghava@qti.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: mW9gxHZP-XWWpUjbzsVLBMjAO_F82ngb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDA1OSBTYWx0ZWRfX91Xt4JHEaxwW
 pp8CCyESC9SPBgG7aI0/XlIZzcy/BvYBAerjOZEAGXwf31vC6ygQg9uSXRnxb2PF3JeDfUHTvt7
 s/ltxgHrCY0UzN783STzNDtShLCnO8A=
X-Proofpoint-GUID: mW9gxHZP-XWWpUjbzsVLBMjAO_F82ngb
X-Authority-Analysis: v=2.4 cv=EbP4hvmC c=1 sm=1 tr=0 ts=6a2cf3cc cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=3BVm0z1yjlMEecujqqwA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDA1OSBTYWx0ZWRfX3d1GylvTJiOe
 rofIG2whJHVqrGgKktWTCyI4cIVmcUQcqlFJ1aAli/1LXll08n/J+6jXbOPQNxUsQA2rXY8i4jt
 Qkt7uEcqiPyMvKJPKMpDgNte5WVKHoGJTUkMjGGty4s2bZu4m4GAK9TVwqRA20SaR4bePwiGHkx
 aWwYMev9VoHEZXHVi+TRoxZ9oLkxiX5+UqIfDuKjyHHUyo27b6CWajBgffDWLxefLXZRJmF3St7
 /2A74D18nHBwP3FFBI/LtYbwc/NV5yD651jlDqAkLLBe0ImIpt2yzP/uUo/BwyQb3Nd0i21n4p4
 K/i7s1j1OtyHdyKCiS6DKqwIZVrKX0JdDUmIVtTLT+DJn3+Tx812sNve3wBjxAzcvB+bUksZ5Mp
 Nrx6YD2Sc4mDNXLcUY9AedQaiJJ5eaxS/gvubW1f2Xg5t82L9E5IkUCZCuyg0+O9VLCLl19+jvU
 NnIhv/lQRQpJxqvIMQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130059
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 13 Jun 2026 06:08:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9889

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
 recipes-extended/images/README-crosvm.md      | 68 +++++++++++++++
 .../images/crosvm-image-minimal.bb            | 82 +++++++++++++++++++
 2 files changed, 150 insertions(+)
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
index 00000000..59ba7c9b
--- /dev/null
+++ b/recipes-extended/images/crosvm-image-minimal.bb
@@ -0,0 +1,82 @@
+SUMMARY = "A minimal image containing crosvm to demo its uage."
+
+KVM_MODULES = ""
+
+# arm64 linux kernels have kvm inbuilt
+KVM_MODULES:aarch64 = ""
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
+# Guest artifact source settings.
+# This is intentionally a normal variable
+# assignment so it can be overridden in local.conf. The do_rootfs[depends]
+# is added at parse time, so any local.conf override is picked up correctly.
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
+# The image also depends on guest rootfs to avoid stale consumption
+# of deployed guest image artifact.
+# The same kernel is used for both the host and guest.
+do_rootfs[depends] += "\
+	${CROSVM_GUEST_IMAGE_RECIPE}:do_image_complete \
+	${CROSVM_GUEST_IMAGE_RECIPE}:do_rootfs \
+	virtual/kernel:do_deploy \
+"
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
+
+
-- 
2.34.1


