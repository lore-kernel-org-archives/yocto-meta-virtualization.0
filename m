Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E44BC2A062
	for <webhook@archiver.kernel.org>; Sun,  4 Jan 2026 11:50:13 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41353.1767527412602914933
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 04 Jan 2026 03:50:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=MsRvccwY;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Y0LSPmr9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6044wFI21552476
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 4 Jan 2026 11:50:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CIk3cTlL688QbRDEPNVn1MIWOT6DbX1YAtt
	OQ6DOJ/c=; b=MsRvccwY4VXeoHo4aYwaoeZL0h4vEO6UlK2pxVVYPHS/nErTe29
	F5rDG0NIGFRL0eTSDvHAHNRDCW1NZdF76QXyGNG7udgZ5RWmMrBhJxa1Qg5b+tcG
	SDaHlik5mKHxX0RONgJJHpGESA3vzmuLTdprHKfiRxqABNGXN+Z4iA/dECn46aCZ
	66IryszDKllcgSX4iuRNEKo8JLmjuVcoFKIiclZvoRkH6ryVDcVyAbb6PkdoMSaH
	jr1BQSHGZimhGZpYssjLUpVmCTXjQLKU7z+7yJMxQ9K4QO8Fcgl2+P9nVa4qtOPD
	wAv6D2bPPJFNkzO9NXZSxAuaa5BXASddfbQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bet2qt29q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 04 Jan 2026 11:50:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88888397482so410303466d6.1
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 04 Jan 2026 03:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767527410; x=1768132210; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CIk3cTlL688QbRDEPNVn1MIWOT6DbX1YAttOQ6DOJ/c=;
        b=Y0LSPmr9QOl2RW5A8V9tTSO6LrYjEdmKeqPPyc0nUXpNuS4+kufDb3FXO5ZQzMAFS3
         5mbIsb0JHX2eqxoLQZldyhzUNCUrj28IV49olZQxZ3pYeJHX17bRCki4zbiYRpCPql+t
         KttHV5a9m5Eu+BkQIrseiML9rXcRYwq55KRsFsxgbdmhJoCVZTIFusTc4YndBoxyCCJu
         tVYj9VR+9HmcNX87C5GUZqDUvVBWXKethuC7y1ADEvdkrR20scL65VFYOPocvHpa4rAO
         SZJVpn5DNjc2qoSOaMOtTed75omuu+az/Iz4p4Btm7xQoq/c0jM6yZa9c4YPqT08gM20
         Iw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767527410; x=1768132210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CIk3cTlL688QbRDEPNVn1MIWOT6DbX1YAttOQ6DOJ/c=;
        b=FvmheWArt6ScOkIO1F9qjcyL/Eou7MUVd2xyzlpp2I1r5TBDamCtOTsIiCo7GpH+2H
         Z2tsgWAsngjgYirWdo0N5GJORl+uo2EGmMUupW9Uz2TY2MxxyXXHO+/mty3lHP6xGbZe
         FuZokgSQKUeO7lVAdiAMO4Um1AUYBrlbehkzCGeIDvRcUyhJvg3D9xM7a/PfmjXxLigJ
         VbbuAygWMmXz9gIY5cjNH7Xp/N4By2tOr7v1d99g2UZjJkgTnQQxioIUUIH5h8MAtVq8
         DITOKlD6R7fOvdOQ4qO4ea9JK7p9mH7adrGusjmjisVsyQiWcTRRXVlZOrJIGZ5Tw0KS
         YkWw==
X-Gm-Message-State: AOJu0YwFdLtdnQ6kQTdIUf2gWRv6d3a5aDKzCCdrv8l6T8M+2aCf+7jh
	sHCuS3D2nlDCKqvbHXYsX0pRp320eRqrPfXPDJlD71wsbJc2fWGcxIfxXBgm/PJLkoZmvlw+VQm
	H3T6miU4oRfB3lESKZptiaIDBPqR7W03QKC4QebtlQ6h4KbuEBOBXj3kkn/bab/yPcriqQLEUg+
	wc89LeXxoTG5tES/HaRQ==
X-Gm-Gg: AY/fxX4BvmkwepwCUb6eOhupzjS+3GDPIMLkdgBgp2J9OaiwMYXknUT7vVdq6xXEIZ4
	BHxhJUfWGvPqCAnKjCf8dXIDLJ1kKfYdbKsGO55N1z2cVf0mR3oIEBrKBFk2e7lDFkawZ4lJaEY
	eYhJ71x51LWkRw0MdpffpcwCcBU/pc8XODe/2SpoFR8GcU0K6v6gCZxNmNMDrT82l91J/IoLaJ4
	3bmeIIFfwM6Z6XLbKDfeBFoO8uwjYMQGNNN+MLzufrcG7pn4KbPpNQi1WLYat0tJKee8rM+8egr
	uJyAHAg9aNVTdmRVr+kp6hGa5N/Eeq8OG2gW0QeZhTR0iF/LHMRohLR2J1dtjkNWHU7hwAHILL6
	q7GKNSx2Z0GuBQxChvXXoR/2ttpfppY2xxvkaPPFgHR1EAkR/vzsWoLtpOGmzNv6klpLpH46ZDU
	Skhm0IfIRH36HJk0lO4NVLyag=
X-Received: by 2002:a0c:e90f:0:b0:888:593d:c08c with SMTP id 6a1803df08f44-88d81d46329mr527513466d6.20.1767527410525;
        Sun, 04 Jan 2026 03:50:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfrI1OLCjmdclxODwakDAm30QO3/U6sfRPc2G0cva9WUgDhjAjVgd2hv/SqUj4fQF4lDVh0Q==
X-Received: by 2002:a0c:e90f:0:b0:888:593d:c08c with SMTP id 6a1803df08f44-88d81d46329mr527513336d6.20.1767527409985;
        Sun, 04 Jan 2026 03:50:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18618d07sm13804757e87.62.2026.01.04.03.50.08
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 03:50:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] nerdctl: add textrel to the list of skipped QA checks
Date: Sun,  4 Jan 2026 13:50:08 +0200
Message-ID: <20260104115008.3349052-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: C9FkvB5yBrTx-sI1krBSicL8Z-bjvAHd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA0MDEwOCBTYWx0ZWRfX0UNKUVbDHhtO
 Rzgw1ob2VkviaZYK3t72j/jVnQBFcG1IkDEZNZ+RTdVgW3eljVWSehDUzy6zEFQfCm8w21fCrO4
 OdOS/7q+fwr4wMuHC60X2XS+bN9UKb0f1gKDY5iVw5OLfWUBn5tPppsSYeIY3LmdVW7Fn6tEocv
 KloiXo1+p08g/a2U1PpAFPrHycAc0wDcxTN4bfuVaI+ZQcWC9vcehTt7arDmioS4C4TQ2o066X0
 Ux6dpJCG4j+N7IecDMqQydlRY0U4DCWCNoRRBASfcpLjo4vdXqMoR+4XFqZShaLAO7yuQoK7rkl
 hDZoTgGOfDDBBXVAKQdvtpK2Ld/ZXbP9x+xlKMu1GFnt+5LirH0rc2FiTNE4M27ygAOnOgY5DOm
 6+VATWdlsUvtDXyp6vYusPxAHPZRPeFOZSKm37r9l/yCdVg4cTKujcwmNQu8dzphySdOnHU7vwn
 kxibx210agRkcQ56DrQ==
X-Authority-Analysis: v=2.4 cv=RKK+3oi+ c=1 sm=1 tr=0 ts=695a53f4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=pSV9KgSO0zAAxfwCEKEA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: C9FkvB5yBrTx-sI1krBSicL8Z-bjvAHd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-04_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601040108
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 04 Jan 2026 11:50:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9515

On ARMv7 building of nerdctl fails with:

ERROR: QA Issue: nerdctl: ELF binary /usr/bin/nerdctl has relocations in .text [textrel]

Add "textrel" to the skip list.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 recipes-containers/nerdctl/nerdctl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/nerdctl/nerdctl_git.bb b/recipes-containers/nerdctl/nerdctl_git.bb
index 8dc209b2d0e8..08a42aa3ff00 100644
--- a/recipes-containers/nerdctl/nerdctl_git.bb
+++ b/recipes-containers/nerdctl/nerdctl_git.bb
@@ -85,5 +85,5 @@ do_install() {
 }
 
 INHIBIT_PACKAGE_STRIP = "1"
-INSANE_SKIP:${PN} += "ldflags already-stripped"
+INSANE_SKIP:${PN} += "ldflags already-stripped textrel"
 
-- 
2.47.3


