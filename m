Return-Path: <kraghava@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D3D3C43602
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 13:23:27 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.174315.1783430604946173988
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Jul 2026 06:23:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=bVI4LQnq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: kraghava@qti.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8WTj3741892;
	Tue, 7 Jul 2026 13:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gUaMcs6PQ4oB7aeih2gFlD8uGL0c/iAHZ0+XkhR1/dM=; b=bVI4LQnqf1cisyzv
	lw5PMSxd3/AB0bgxJ95L5EUoisiY84COG54YTX5lKfvHX0379JlzrlAxPCqaKVgz
	9LI0sms9howiHWIzu2XCJIm5YvRBXoLHnZQC+cfoK0ScIj5TEflQDYFMGbyNOAtG
	KLpswsLFy+0JZ1LoLo5WGqrYBDeZXVIUiIUZz8gfEx1jDh8I8PoJekbxw8IRuJqg
	CBQ5xaP18jrr+y3UztCmuf2pr1Vg5V5WHFbe18769R7OhBR2jCKEqwZcYYMXSvm/
	8MxCcaJsdZuFL+8Qh59XK5pCEPZbtv2LZa3SoAjLT570OiO0Fe6EPfmkmyw5PcVe
	MqibXA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8ye0gqw0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 13:23:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTPS id 667DNNqF004179
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jul 2026 13:23:23 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 7 Jul 2026 06:23:20 -0700
From: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
To: <anujmitt@qti.qualcomm.com>, <vkraleti@qti.qualcomm.com>,
        <sbanerje@qti.qualcomm.com>, <bruce.ashfield@gmail.com>,
        <meta-virtualization@lists.yoctoproject.org>
CC: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
Subject: [PATCH v3 2/2] crosvm-image-minimal: add a reference image for crosvm demo
Date: Tue, 7 Jul 2026 18:52:49 +0530
Message-ID: <20260707132249.677711-3-kraghava@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260707132249.677711-1-kraghava@qti.qualcomm.com>
References: <20260707132249.677711-1-kraghava@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: y0i4yg5whQ-Y4ufseFhkOna-qIAl8hd-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMSBTYWx0ZWRfX+4KMiv4NMns7
 K8QiiD/mtX+v69roAAWKUVcl7Rd9IAR8Eg6d4TISFHoDQXQONZlBfxHq7FLdH1ukHeVxO0UZbnM
 9lf0FMsiX283d5AXCmJpGPvN6fLxrKY=
X-Authority-Analysis: v=2.4 cv=SZfHsPRu c=1 sm=1 tr=0 ts=6a4cfdcb cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=3BVm0z1yjlMEecujqqwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: y0i4yg5whQ-Y4ufseFhkOna-qIAl8hd-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMSBTYWx0ZWRfX6NTNhY1yqxx7
 WY5KSaqr0qqBPrWezLDdBYxqey2tWQGIk4Wh+UjdevU3Z+2QQE4BMokxglMdYyRx5fEESEZGK8W
 7c9l0l9lCUdnV1S/tE3rvbJuch8wQ/4W0lTbtNFdxzofBKtG1QK5iAu9LvJNePU9/+ttLKqHi3V
 rmP0haz2aaJbDitgHZcHRJFEjq2dc5Sc8vmJfymvpo/W1gLzK9kf1ba1Vk6imRJ7isD0JpEg8yG
 YE3zx9mq+ouUAvFapPAgD6A+eSwVZsbPECx5fhCTbT+kD3mlMO2WSC2FPzVdnk43m0TtNkMhCSg
 wVekEgO/7tMsrsBfKCYReA/h82SIyry9Ge+LQO5c5Wqjdcvuzt6GZSqtHlA9cCY/AeDEV+nn1/F
 m8irHBFNa0zzcjdKKwoC+mI+9fcNPH7oa9scZebZHaHkq7ThGxpaMJ+yKSq4J+GJrhPBDZxN0Mq
 UMrqHXX+fOpKjKoHVxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070131
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 667C8WTj3741892
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Jul 2026 13:23:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9942

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
changes from v2:
- Fix typo in SUMMARY: "uage" =E2=86=92 "usage".
- Simplify the KVM_MODULES:aarch64 comment: "arm64 linux kernels have kvm=
 inbuilt" =E2=86=92 "kvm is built-in on arm64".
- Remove trailing blank lines at end of file.

 recipes-extended/images/README-crosvm.md      | 68 ++++++++++++++++
 .../images/crosvm-image-minimal.bb            | 80 +++++++++++++++++++
 2 files changed, 148 insertions(+)
 create mode 100644 recipes-extended/images/README-crosvm.md
 create mode 100644 recipes-extended/images/crosvm-image-minimal.bb

diff --git a/recipes-extended/images/README-crosvm.md b/recipes-extended/=
images/README-crosvm.md
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
+MACHINE ??=3D "qemux86-64"
+DISTRO ??=3D "nodistro"
+BBMULTICONFIG ?=3D ""
+
+DISTRO_FEATURES +=3D " kvm virtualization"
+IMAGE_FEATURES +=3D " empty-root-password allow-empty-password allow-roo=
t-login"
+IMAGE_FSTYPES =3D "ext4"
+IMAGE_FSTYPES:remove =3D "ext4.zst"
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
+When the target `MACHINE` is `qemux86-64`, the host running QEMU must su=
pport:
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
+  -drive file=3Dcrosvm-image-minimal-qemux86-64.rootfs.ext4,format=3Draw=
,if=3Dvirtio \
+  -append "root=3D/dev/vda rw console=3DttyS0 earlyprintk=3Dserial nokas=
lr" \
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
+crosvm --log-level "debug,disk=3Doff" run \
+  --disable-sandbox  /var/lib/crosvm/images/guest-kernel \
+  --block /var/lib/crosvm/images/guest.ext4,root \
+  -p "root=3D/dev/vda rw console=3DttyS0 earlyprintk=3Dserial nokaslr"
+```
+
+## Quick sanity checks
+
+```bash
+test -e /dev/kvm && echo "/dev/kvm present"
+ls -l /var/lib/crosvm/images/
+```
diff --git a/recipes-extended/images/crosvm-image-minimal.bb b/recipes-ex=
tended/images/crosvm-image-minimal.bb
new file mode 100644
index 00000000..f9668519
--- /dev/null
+++ b/recipes-extended/images/crosvm-image-minimal.bb
@@ -0,0 +1,80 @@
+SUMMARY =3D "A minimal image containing crosvm to demo its usage."
+
+KVM_MODULES =3D ""
+
+# kvm is built-in on arm64
+KVM_MODULES:aarch64 =3D ""
+
+KVM_MODULES:x86-64 =3D " \
+    kernel-module-kvm \
+    kernel-module-kvm-intel \
+    kernel-module-kvm-amd \
+"
+
+IMAGE_INSTALL =3D "packagegroup-core-boot crosvm"
+IMAGE_INSTALL:append =3D " ${KVM_MODULES}"
+
+IMAGE_LINGUAS =3D " "
+
+LICENSE =3D "MIT"
+
+inherit core-image
+
+# Guest artifact source settings.
+# This is intentionally a normal variable
+# assignment so it can be overridden in local.conf. The do_rootfs[depend=
s]
+# is added at parse time, so any local.conf override is picked up correc=
tly.
+CROSVM_GUEST_IMAGE_RECIPE ?=3D "core-image-minimal"
+CROSVM_GUEST_IMAGE_FSTYPE ?=3D "ext4"
+CROSVM_GUEST_ROOTFS ?=3D "${CROSVM_GUEST_IMAGE_RECIPE}-${MACHINE}.rootfs=
.${CROSVM_GUEST_IMAGE_FSTYPE}"
+CROSVM_GUEST_KERNEL ?=3D "${KERNEL_IMAGETYPE}"
+
+# Final location inside the host/root image.
+CROSVM_GUEST_TARGET_DIR ?=3D "/var/lib/crosvm/images"
+CROSVM_GUEST_TARGET_ROOTFS_NAME ?=3D "guest.${CROSVM_GUEST_IMAGE_FSTYPE}=
"
+CROSVM_GUEST_TARGET_KERNEL_NAME ?=3D "guest-kernel"
+
+# Ensure guest image and kernel are available before rootfs postprocess =
runs.
+# The image also depends on guest rootfs to avoid stale consumption
+# of deployed guest image artifact.
+# The same kernel is used for both the host and guest.
+do_rootfs[depends] +=3D "\
+	${CROSVM_GUEST_IMAGE_RECIPE}:do_image_complete \
+	${CROSVM_GUEST_IMAGE_RECIPE}:do_rootfs \
+	virtual/kernel:do_deploy \
+"
+
+# Copy guest rootfs+kernel into the host rootfs for crosvm demo runtime.
+bundle_crosvm_guest() {
+    set -e
+
+    local deploy_dir=3D"${DEPLOY_DIR_IMAGE}"
+    local rootfs_src=3D"${deploy_dir}/${CROSVM_GUEST_ROOTFS}"
+    local kernel_src=3D"${deploy_dir}/${CROSVM_GUEST_KERNEL}"
+    local target_dir=3D"${IMAGE_ROOTFS}${CROSVM_GUEST_TARGET_DIR}"
+
+    if [ ! -e "$rootfs_src" ]; then
+        bbfatal "Cannot find guest rootfs. Tried: \
+                ${deploy_dir}/${CROSVM_GUEST_ROOTFS} and \
+                ${deploy_dir}/${CROSVM_GUEST_IMAGE_RECIPE}-${MACHINE}.ro=
otfs.${CROSVM_GUEST_IMAGE_FSTYPE}"
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
+ROOTFS_POSTPROCESS_COMMAND +=3D "bundle_crosvm_guest;"
+
+IMAGE_ROOTFS_SIZE =3D "0"
+
+KERNEL_MODULE_AUTOLOAD:append:x86-64 =3D " kvm kvm_amd kvm_intel"
--=20
2.34.1


