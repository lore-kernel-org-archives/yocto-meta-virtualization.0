Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CDC2C531F9
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 11:56:59 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9753.1785239818630021669
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 04:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Czhcsf0P;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=BQ6NRhey;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBIE8q2735058
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 11:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kk4K+q15c3b
	3KIVl0BTl+k0kRZV/HvUizTAzg2i8bmk=; b=Czhcsf0PHkV/6jr20DuKiqET/l8
	iclQbuIoYD6n5kRUgUAhTGoCVnDq4hL1AJQRAK0FYJ9nnrLUn2UKU5FgEK1406zH
	3W8foJ5CK8fXk9ecX8KOMQNfoFSnpNd8fj7GFgSGEv7MTxneFoMPIvBQIH2wZsdB
	u0BTVaR157qlZAwuEXOHJbdzqIjplfI/uxI95b5tMEhKK6cE1hxMOrKwi9bTt+kF
	tx+vuF3ABiDKHXqjRa3Kg/BPe6eM3rW9ltuMbeOBv3OFZECDBVQGiAHHYR0VDl+C
	MXSF/aisKUqoeN/WRSEAiDzT53zZ2wFWF0nV8eCVH92CW4NyKMaQ0JgvoXQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbrsv2ej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 11:56:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0f0a0760so85934441cf.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 04:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785239817; x=1785844617; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kk4K+q15c3b3KIVl0BTl+k0kRZV/HvUizTAzg2i8bmk=;
        b=BQ6NRheyzLak3x3PFWBiU3zkE9qppshQpbqKP3+OEJu27YdwGHnj56gaiaEBfwjGkj
         AyJb/iiwXJPKBSAjHUhDpVSslxxD+eEyg35zgZFmhUIyqYGq5H4dmnxTtGy/aQAX9qdX
         mcH3jtYcWbYsCqj8RDuNKb07yM6WJdDdMzYVmyI49/ZD888xl/cxeY2gpk7vh1mSAXAw
         UiW+JEmPzt/XaO+hFmsBRVhmqkP8zeu6mpBTv8c9LvTW5rThQpEUxnxmbbjZk2Lqxx3X
         yBJULbbVqZPEPYxFyxhO5HYvyEiCyv0xPYXPKoVdomJZeXCEH2TLh3Pf1cV3sPbTHCas
         qCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785239817; x=1785844617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kk4K+q15c3b3KIVl0BTl+k0kRZV/HvUizTAzg2i8bmk=;
        b=QOaHCL6Z6NVhe7EtaxjWr3yIZMa3xysBC0OswXC/w7udca3lc1eN/NpTmQY9bTuttk
         M3wMMNQoLKe1XjiVxX7UZmQ4xtBkdyqsZ7luNWSfb33TajFF5DDgfsyhmvq5V96Vr5mR
         +C0k5al4RBmB1qvgi2ifjm51zGEz167sff8EbTvpyWqpHQ33lhfLtyf35jcVk/7ZOWkV
         NpwQTxpWsFi7J9UOV1TYb8w8ApPLWXmelhaT5IJZKtRHC9hyns0Cy4anXUZ1pei50I4C
         Sh9yjNcTglMMNFksd3du2u6QbdnhuRbOhcv4sSZ22vpoYY8baA9haKz1h5PT1rfHIALs
         IeuA==
X-Gm-Message-State: AOJu0Yx9VHvwswEUw7bY3DfHpR9/jjsNp0ZxtyqJh/gpB9eGglfHgQMh
	w/Bj6pNk8owQlBIj3sO1nLMwaoOrXxvYI2vnnOzragEkoZxemnh619be4Tx0fToxlkDAy4OizYS
	Rs8p+1K4k9QKYKMnqclTQtZrEQPSVF9jO5//2rllF8RigFWrL58kkjabWsGubG+vrl85vgvPoXl
	SOqkbqKTctnirGtg0JHw==
X-Gm-Gg: AR+sD138QpaW8diSQtA5fY6l42kZ1WfS/rDMpIrsdxf7fMGNEv/Shdnm28oBRpWDK9B
	Zd4ymKlGHZeeycVfp6h724RYFQKP3oIZUEgqnlUSuljUmxIvxHQ0CdBN16VBJ668vzbXBw/Ngqu
	MesbV1sLBtR+QE2U4nX4VnKIXtY4MImbcD9tsmvwMAX8LQRg3xw+W6ksVykJzWHHXvK8lgLA4u2
	twue6Qh4YI2r+6KRAhQsf2lF4jvZ97rKnYwB90QaUs+Yxwu5LkD/Ututh6Zk1Aj5NzKaEZlRgsX
	HYvgc0qVssDeQxE8xj6el0ub3PxFIi6uQ4K09rJmnpEHNqsRymBMedN2wCcAAJv39+BsnBgPOUU
	0+JwsXa3PMCO2+qPumIkTbnA=
X-Received: by 2002:ac8:7d84:0:b0:51c:511:c5 with SMTP id d75a77b69052e-529d709e567mr16456501cf.16.1785239816654;
        Tue, 28 Jul 2026 04:56:56 -0700 (PDT)
X-Received: by 2002:ac8:7d84:0:b0:51c:511:c5 with SMTP id d75a77b69052e-529d709e567mr16456261cf.16.1785239816036;
        Tue, 28 Jul 2026 04:56:56 -0700 (PDT)
Received: from hu-kkooi-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c58b8b992sm582268466b.31.2026.07.28.04.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 04:56:55 -0700 (PDT)
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
Subject: [PATCH 1/2] image-oci: call pm.update() before pm.install() in multi-layer package layers
Date: Tue, 28 Jul 2026 13:55:15 +0200
Message-Id: <20260728115516.1107990-2-koen.kooi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728115516.1107990-1-koen.kooi@oss.qualcomm.com>
References: <20260728115516.1107990-1-koen.kooi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEwNSBTYWx0ZWRfX5Nr0O2daSDDp
 53MSI1X8c5ktTPnP63wwFvLzbEVesVdfifIYfEOwjdd9xzNXHai69ikey4qQctCTPiJwHn/f7EM
 ecUwWcjwzm5zs9tDqJifVQX/I9UnUPq9dqXDwuY5uqLaBYVjXMveeYPqPqEgmbzhoqs2ZoSpBB5
 mFr1wzaN/jgm/4M8CGaXiHMhAF+lqup5pafV2iyeo4hbYVM3DFsQkOAcghCACWbV1ULXDCIHslx
 O5QNl3CFRKeEOw/3RluR7LjT7np3AWx4rwDoE7s5wWyhRsfhQMcWOHpLO8TUBGUFU8M2URTfmW6
 arTONkBhg4aFbP6vXkhFEJRMB0zpF/3mfrKsBvnQw916AdWZiy+myGnwQlhRj7qsEfJvAWZt9OX
 ZENRixgmHBwFwsKseMBCSXrrFB9cZXDLWlzjFpPYfQqWAjGbIsBJ4DJo0TOGyM4ptpHvyoXB0e6
 ppbmA9B9kLJiyXf11pg==
X-Proofpoint-ORIG-GUID: wRjw-o04yvpEPW_D3DdOw34FslzYIUBd
X-Proofpoint-GUID: wRjw-o04yvpEPW_D3DdOw34FslzYIUBd
X-Authority-Analysis: v=2.4 cv=ALkdLnG8 c=1 sm=1 tr=0 ts=6a689909 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=h8XYUP3Jp95Fn8rF3O8A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEwNSBTYWx0ZWRfX65qqIz6wUQPV
 4DtIS/ZHg8YzIOJQ6za7e65zhA/FbyPuPOvqlVLwKjmuRNy6fry2wYr4ZWPuvKeHQELdbqxtc86
 8onv08dTABrFP1HBi1Sys8t/vKUz8Wg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1011
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280105
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 11:56:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9991

For multi-layer packages, the class doesn't call pm.update() like the
OE-core image classes, making the package managers lack package lists.
And without lists, you can't install packages.

This is being hidden by the class treating opkg errors with bb.warn(),
leading to every tool shouting "Success!!!", but delivering empty
layers.

Applies to both opkg and rpm paths.

Reproducible with a minimal recipe:

  inherit image image-oci
  IMAGE_INSTALL = "base-files"
  OCI_LAYER_MODE = "multi"
  OCI_LAYERS = "base:packages:base-files+coreutils"

do_image_oci's log shows the real failure, demoted to a warning:

  WARNING: ... do_image_oci: Unable to install packages. Command
  '[...opkg... install base-files coreutils]' returned 255:
  error: opkg_prepare_url_for_install: Couldn't find anything to
  satisfy 'base-files'.

Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
---
 classes/image-oci.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/classes/image-oci.bbclass b/classes/image-oci.bbclass
index 9914411b..ed8926f6 100644
--- a/classes/image-oci.bbclass
+++ b/classes/image-oci.bbclass
@@ -484,6 +484,7 @@ def oci_install_layer_packages(d, layer_rootfs, layer_packages, layer_name):

         # Generate/update repo indexes
         pm.write_index()
+        pm.update()

         # Install packages
         # Use attempt_only=True to allow unresolved deps (resolved in later layers)
@@ -509,6 +510,7 @@ def oci_install_layer_packages(d, layer_rootfs, layer_packages, layer_name):

         # Write indexes
         pm.write_index()
+        pm.update()

         # Install packages
         try:
--
2.34.1

