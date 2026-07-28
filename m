Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A04C531F9
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 11:57:09 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9676.1785239820236015643
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 04:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=La6D2nHt;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=N0mWc6UN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBI4Ax2122693
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 11:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NyPVKLS9W0B
	NNl3ZKTGpYVFYtM5Ez+SgAWzr1tGotYM=; b=La6D2nHtu04wejmRKbzeGffK/0I
	awinv7bNbIUEeLCNec/RlB3YJk/O3MP3BRhu5sJdv4xfLBrIUPLB9MEtODCXWI3u
	ufmFiAcY/3uW6w0ARRHq+VkTTVHLt81UFic97lOBad3fvRmYXrV6HPNUG0zkH4b+
	9sMrhdgxga2n1xxKbPrPO3fl4QGzG4XLg6BmhcPhDGJifvGxExhY3COwGEV5Eryb
	Xmhx99G5UmIVcBf/KrknlfM4vvRclvOFCIIzEr3THTMkM/SOVd5LguhG0/5vhZS5
	V8YWOb11dP0Ts78ecrrwDNrIzuz9LOeqsHsMMX0jjUlaT24wC6hm1eg/uaw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fppttsdwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 11:56:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfe3fa93bso44685881cf.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 04:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785239819; x=1785844619; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NyPVKLS9W0BNNl3ZKTGpYVFYtM5Ez+SgAWzr1tGotYM=;
        b=N0mWc6UNMq2xWS3XD9syXftL0V68789VqeE9w4+xYiVho7hmDLFilwn97Tgbmflcm1
         qQ21bB6bgXMXeX5DZ0rsWDJUnkAZBS7G5DiEZhwkc+++FLcndnp8ma+gnPuvJVTZ/L8T
         WFe34+td+6wfrn2mzvK/FZvXDMKcbl1o8Dq8hyKQWhSV+FhN3XztaG17T5IeR3RvJeZq
         eEvkc+U9/o14tvVf9KSfRjoTYw070zkBlsjH0WaYNGKbMEflggdW0LxJwPTuaG1Q+cxv
         QHdu2aJXgJe/EkCqu3yZzRYdPGb9aagijVpUHpC90eu2FI1OrgBE5Fr/gtiRPL69v69n
         4pIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785239819; x=1785844619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NyPVKLS9W0BNNl3ZKTGpYVFYtM5Ez+SgAWzr1tGotYM=;
        b=s0xZH08zhgLpDwNeqabUmgjjdcu5zNLufy/rO67EuNiS/moTWy+zm8LONWe4ETHXpT
         q62mIvmk3v70LPJS8YmKgS6HB0iG3oQh5X9MQ6nZ67VP2WYYYaRWRV37MQSAMXXS6V4b
         +JY5Qc7PGkgdJPld621g2DxmfKBYN1jQvhM8L5Nf5bxi/X/UFaHaUZ7zweOQX7kjIDwO
         3fjSqPojNWG8FdX+Ul8M+X5Mbvqg8R7p82gxC/kLajnVhErCKYl2kuNk83pUiVXiLJCZ
         aLA/hnUMe+sQko+CNuUJs5zGSp0vDqvE4rTl+hU0PDEbysgnVZg0MidUwa6PZOtFvZ1c
         qp8Q==
X-Gm-Message-State: AOJu0Yx2l/IcmbOYQfsO6YF70o+T0GpVYrlv6xiZ++Q0gfi74goTtxAC
	JYpPcBVQjEYBsROC+gSchCxy4ElzTz4pNskKXvI655XXU7XqKNokRHOqyCqq4BFdhef3vY9cX0H
	KD/3vbruGCGzXTjIqw0hfG9XuZ4W6ndYNtUxh1FtxHVxpjCEMcwYguOKrm5HvJW8t7ZCO4hMPbI
	x7lH0GbuJYqE0NZifg9A==
X-Gm-Gg: AR+sD13l1C026A3zwT85akdI/j6cFQR94CZII/GMAuHhsf6PwrJ3b51RDZy6Ijbc9p3
	4Cqi6fZahpYotTAb0by9q5MK01RFtcRe5vtPFLGRwJOsMSmvGgeTIjEx5KMn1bNlq36hEeOxD+J
	8yL/bWyl+hL/JraYfEnSL9gT9TCxL+KrsOj3rnuKok1i0mDVEAvlFayivFMFMOelc/2JpFx4Gd4
	v96Da0jNsUXWxvooVjZW9Tk4AoQq9l1dEPU9TKnKCSI+MoQbGIIN4C34fgLFGDmUme83bl+Gcpq
	hR7nKyLxHfAYqUbulFIfnlEs/XILSDXz13KJHZYmpSaQU5OG9mOF8LItxL8gV/9dUu28T9NDWAx
	2alkD/+/kbOfZ/sP7PH4eqeQ=
X-Received: by 2002:ac8:5a82:0:b0:51c:8fb:fa45 with SMTP id d75a77b69052e-529d7110314mr16258021cf.58.1785239818512;
        Tue, 28 Jul 2026 04:56:58 -0700 (PDT)
X-Received: by 2002:ac8:5a82:0:b0:51c:8fb:fa45 with SMTP id d75a77b69052e-529d7110314mr16257451cf.58.1785239817471;
        Tue, 28 Jul 2026 04:56:57 -0700 (PDT)
Received: from hu-kkooi-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c58b8b992sm582268466b.31.2026.07.28.04.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 04:56:56 -0700 (PDT)
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
Subject: [PATCH 2/2] image-oci: drop *-initial sysroot deps in do_image_oci to avoid libgcc collision
Date: Tue, 28 Jul 2026 13:55:16 +0200
Message-Id: <20260728115516.1107990-3-koen.kooi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728115516.1107990-1-koen.kooi@oss.qualcomm.com>
References: <20260728115516.1107990-1-koen.kooi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEwNSBTYWx0ZWRfX+D3t52ehtuEx
 sDPzZ9AX1/WoMpdILoOjB0S1JnaWE7iHq2EIrBBrgMZ0euMufk42r8LvVd5eUKYslUQjxaZXrtN
 1l5yimGXba+VDWyhKns6U5PPTny0Lmg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEwNSBTYWx0ZWRfXz38Xd157uLbO
 ymxTcrVCUbPh02VP+wpZkHV8akpeqdhVXH806mnEvZ9ndHGkCfCk8RZwjFgC0BfCsgp6PomiDnK
 1BZaPr8jkOHvfAyEcoqPNgOLQHKrrVKv2dtY60Egqj5qlYG7oWjS6VX/jfmRXTQtwbAFGbb1NpQ
 u9nCVc6i6DjjmMmZnYhR9IHlrSelku/d3NzVI5n3iX+0Xe1aFugqu2t9pZ9tuAcSLwd3xHU2l2g
 t2ylugveqCTzo7JocUsLBbudtNAuv/yiL8rjDY84ALa9eum5LOmOZX0xxkI4u2oA/W3a/1Wdreu
 uVB0h7rkjygkjLavUTORyD4AWrw6mIt9kzWFwTynm2Qp5ubESBt/lb/p3fSVYGKQsugxxMOs83V
 dj2wC9iYF4Q+3B1wQcRfM65gKHEIb8iY8YmHh3GcdraLctGY2heH17V0kXUNm7PAb4xyt8lqRlW
 1bW9gZiTrn1CNi2VMoQ==
X-Authority-Analysis: v=2.4 cv=aa1RWxot c=1 sm=1 tr=0 ts=6a68990b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=ZKCcNxj31Ayd8cZQ89sA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: GNMQueVj3p_y3PQqHoeFPyIbfyirosXD
X-Proofpoint-ORIG-GUID: GNMQueVj3p_y3PQqHoeFPyIbfyirosXD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280105
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 11:57:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9992

do_image_oci can abort with:

  ERROR: <recipe> do_image_oci: The file .../crtbegin.o is installed
  by both libgcc and libgcc-initial, aborting

This was seen deterministically (6+ clean-sstate attempts) on an
OCI_LAYER_MODE = "multi" image recipe whose "packages:" content is a
from-source-compiled library with a moderately large DEPENDS. It is
sstate-state-dependent: it only fires once do_image_oci's dependency
walk actually has to populate (rather than skip via sstate/setscene
shortcuts) both libgcc and libgcc-initial into the same recipe
sysroot, so a given recipe/build combination can build clean one run
and hit the collision on the next, depending on what is already
present in sstate. Confirmed in our own testing: instrumenting the
fix below shows it stripping two "*-initial" do_populate_sysroot
nodes out of BB_TASKDEPDATA for a boost-based multi-layer "packages:"
recipe -- i.e. libgcc-initial is a real, reachable node in
do_image_oci's dependency walk for realistic recipes, even though a
minimal single-package recipe does not reach it.

Root cause: do_image_oci[depends] contains several
"...:do_populate_sysroot" entries (umoci-native, jq-native, and for
multi-layer package installs, opkg-native/rsync-native/dnf-native).
Any task whose [depends] flag contains the substring
"populate_sysroot" gets oe-core's extend_recipe_sysroot
(staging.bbclass) auto-attached as a prefunc, which walks the full
transitive do_populate_sysroot closure reachable from those deps and
copies it into the recipe's private sysroot.

oe-core already protects against exposing both libgcc and
libgcc-initial into the same sysroot: setscene_depvalid() excludes
"*-initial" recipes via SSTATE_EXCLUDEDEPS_SYSROOT
(".*->.*-initial.*", meta/conf/layer.conf, "nothing needs to depend
on libc-initial"), and staging_populate_sysroot_dir has its own
"skip libgcc-initial due to file overlap" special case. But the
SSTATE_EXCLUDEDEPS_SYSROOT check inside setscene_depvalid only
applies when the *dependent* task is itself do_populate_sysroot
("taskdependees[task][1] == 'do_populate_sysroot'"). For
do_image_oci, the dependent task is do_image_oci, not
do_populate_sysroot, so that exclusion is skipped entirely and both
libgcc and libgcc-initial fall through to the default "keep it"
path, landing in the same sysroot and colliding on their shared
crtbegin.o.

Fix: add a RecipeTaskPreProcess handler that, for do_image_oci
specifically, prepends a prefunc which strips "*-initial"
do_populate_sysroot nodes out of BB_TASKDEPDATA before
extend_recipe_sysroot runs (extend_recipe_sysroot re-reads
BB_TASKDEPDATA fresh each time, so this is sufficient). This mirrors
the existing "skip *-initial" intent from
staging_populate_sysroot_dir, scoped narrowly to do_image_oci so it
doesn't change behavior for any other task. The *-initial recipes
are bootstrap-only (used to build glibc) and are fully superseded by
their real counterparts by image-assembly time, so nothing an image
needs is lost by excluding them here.

Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
---
 classes/image-oci.bbclass | 77 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/classes/image-oci.bbclass b/classes/image-oci.bbclass
index ed8926f6..c397e2f9 100644
--- a/classes/image-oci.bbclass
+++ b/classes/image-oci.bbclass
@@ -526,6 +526,83 @@ def oci_install_layer_packages(d, layer_rootfs, layer_packages, layer_name):

     bb.note(f"OCI: Package installation complete for layer '{layer_name}'")

+# =============================================================================
+# Work around libgcc vs libgcc-initial sysroot collision in do_image_oci
+# =============================================================================
+#
+# do_image_oci[depends] contains "...:do_populate_sysroot" entries (for the
+# native tools it needs: umoci/jq/opkg/rsync-native). oe-core's
+# staging_taskhandler therefore auto-attaches extend_recipe_sysroot as a
+# prefunc of do_image_oci (any task whose [depends] contains the substring
+# "populate_sysroot" gets it). extend_recipe_sysroot then walks the whole
+# reachable populate_sysroot dependency tree and exposes it into this recipe's
+# private sysroot.
+#
+# For a *do_populate_sysroot* consumer, oe-core's setscene_depvalid() excludes
+# *-initial recipes (SSTATE_EXCLUDEDEPS_SYSROOT ".*->.*-initial.*"), so a normal
+# recipe never sees both libgcc and libgcc-initial. But that exclusion is gated
+# behind "taskdependees[task][1] == 'do_populate_sysroot'", which is false here
+# (the consuming task is do_image_oci), so both libgcc and libgcc-initial get
+# exposed and their shared crtbegin.o collides:
+#   ERROR: ... The file .../crtbegin.o is installed by both libgcc and
+#          libgcc-initial, aborting
+#
+# oe-core already skips *-initial on its other sysroot-population codepaths
+# (staging_populate_sysroot_dir: "skip libgcc-initial due to file overlap", and
+# the do_sdk_depends/do_populate_sdk_ext skip inside extend_recipe_sysroot
+# itself). We apply the same intent here, narrowly and only for image-oci
+# recipes: before extend_recipe_sysroot runs, drop *-initial do_populate_sysroot
+# nodes from this task's copy of BB_TASKDEPDATA so they never enter the tree.
+# extend_recipe_sysroot re-reads BB_TASKDEPDATA fresh, so this is sufficient and
+# touches nothing else. The *-initial recipes are bootstrap-only (used to build
+# glibc) and are fully superseded by their real counterparts by image-assembly
+# time, so nothing an image needs is lost.
+python oci_strip_initial_from_taskdepdata () {
+    import copy
+
+    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
+    if not taskdepdata:
+        return
+
+    filtered = copy.deepcopy(taskdepdata)
+    drop = set()
+    for k, v in filtered.items():
+        # v[0] = PN, v[1] = taskname
+        if v[1] == "do_populate_sysroot" and v[0].endswith("-initial"):
+            drop.add(k)
+
+    if not drop:
+        return
+
+    for k in drop:
+        del filtered[k]
+    # Remove inbound edges to the dropped nodes. Each entry is a bb.TaskData
+    # namedtuple (immutable), but its dep set (index 3) is a mutable set, so
+    # mutate it in place rather than reassigning the field.
+    for v in filtered.values():
+        v[3].difference_update(drop)
+
+    bb.note("OCI: dropped %d *-initial do_populate_sysroot node(s) from "
+            "BB_TASKDEPDATA to avoid libgcc/libgcc-initial sysroot collision"
+            % len(drop))
+    d.setVar("BB_TASKDEPDATA", filtered)
+}
+oci_strip_initial_from_taskdepdata[vardepsexclude] += "BB_TASKDEPDATA"
+
+# Ensure our prefunc runs *before* extend_recipe_sysroot. staging_taskhandler
+# (a global class) prepends extend_recipe_sysroot on the RecipeTaskPreProcess
+# event; this handler is registered later (image-oci is inherited after the
+# global classes) so its prepend lands first in the prefunc list.
+python oci_taskhandler() {
+    task = "do_image_oci"
+    if task in e.tasklist:
+        deps = d.getVarFlag(task, "depends")
+        if deps and "populate_sysroot" in deps:
+            d.prependVarFlag(task, "prefuncs", "oci_strip_initial_from_taskdepdata ")
+}
+oci_taskhandler[eventmask] = "bb.event.RecipeTaskPreProcess"
+addhandler oci_taskhandler
+
 # the IMAGE_CMD:oci comes from the .inc
 OCI_IMAGE_BACKEND_INC ?= "${@"image-oci-" + "${OCI_IMAGE_BACKEND}" + ".inc"}"
 include ${OCI_IMAGE_BACKEND_INC}
--
2.34.1

