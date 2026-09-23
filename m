Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52519C9830E
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 14:04:40 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7745.1790172279906123769
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 07:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=njGqTbG7;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=IXPtrxdv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDKiPB322210
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Sep 2026 14:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RVP6I5YdOTW
	HC8T/4e7U9UFm5biq3XjRxS3FKyD5DpA=; b=njGqTbG7SdJPlutNXR1EeFDNsWH
	f33kjMFU2IhqsR9crE8+QBURDnZs6MUBmbPMQRdNEMhB+/x2zuBBshNxWjLHyUpO
	owG4A3KPVKPuIIpayYXN4ja/h+ptOF/olafacMrxdir94PCPV9EnOFaPvP6FVYNi
	NmtJaOg7k9+rBuXTK/+BZEHQbF51Yf7yqKo/dXNP2dCkaHyhyQ1VoHyUK37zFX14
	qVfJLeEfRGlWI2nlX0zDagtJZWbzmhXlZuDKGiEqGGLitwyP6Z3to8cuqoevGJKz
	NO6A3xu8qRc4BRMTT1gS4wpTBLjpUe1Wpw2WI6yTihz0SkbQU87RMfrSnlg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjsg5np-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Sep 2026 14:04:39 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7a532e31dadso1004502137.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Sep 2026 07:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790172278; x=1790777078; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RVP6I5YdOTWHC8T/4e7U9UFm5biq3XjRxS3FKyD5DpA=;
        b=IXPtrxdvlEtqkemDLn653btjuXKlwXb2g65eGnblV3rnfrphP4s9VWWozYCxrB7Bdi
         unAKmg4Q7+aTD7Mz33yc6ZEBwJRd3L2On5F8Q0FpgQDOoG6c8Y7kwL3rRUGlliEPbGtH
         WLSa75mIjwMd15P8wqFSbKsGoacgWHz/eIgCaSN1wDUnt5Azt49Nf8mebxJoTt9ynk00
         bcmRVQtDuGg34m7V8xNuDVR1RXLFlARqIlDLhyMKroq3Fxm8FPKrdsHuyH7PBIvayt6x
         QuytU+LOlerDZ46IWsCvY/7O2Y2/hGb2pljzVt6uVDirfefG0DUM2j3YTc3ESgDJCQW9
         4VmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790172278; x=1790777078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RVP6I5YdOTWHC8T/4e7U9UFm5biq3XjRxS3FKyD5DpA=;
        b=2vgrHCUFFWDV/dRlm/CMXar6C6HitIqURqsALxDKrKLc4HZ5V7wSrz1MHRs+4JGBO+
         d7TC2M87WsydD9b2bCngib9mwbNsPRa3WPxRarx9zmUsxyiwGlQkNJP8gYKtlkKimMYy
         BcXTCl9KFxOsf4AMmPi1/TWX4k9OnQ5B8sWjYBoIUY18enzCeVaypoy05xJQLYPjIOGG
         tsRy5vuLv0HfRRDNsY37X5xw7M3NOpq/aSu7/2v6G0QGMoAA2Dza1EqX+m+xKkNZF2eo
         HRKvxWnh2V2nPqNphjGzc+6iORvjAcfVt6HHwpP3ALOCSEWbTgHX+zUuE4z10+1yw5fH
         SOaA==
X-Gm-Message-State: AFuF++l7q2hWfz10dQ16p41w9O2gAIw8UwxZeqn0zIH63OcbuFSxkUMI
	xaIAnTYwNoXvf3Z5JWNvHktI7eul6J5vv0he67nxVBHHGKIoQVHY4x/GEPWQEigizHS2/xBV+mA
	ibVG1biVg4LRTXbgdV/YacoF1/nFmYfbEJwsAuKQ5uyuJtNInjZHaH+Q0emnKrQ4n2p19KP8csQ
	42ortcjbKkrabO74Cb5Q==
X-Gm-Gg: AYBFou1+XG3RHKjnzNA1KdzF63Ixm5unVR5ylTmBehBaiT1zijILHcomE3kqrrOMfZn
	csvDBgXnqruTd7LQfJzktxjmI5fGstQ2Rx8IhQ13K81yafkO1ytFLNFyjtM+UlCrdGfX48MurOi
	rDH1zaUA2D29Q0k2aO00h/Lu1OzypzQYmV4E6z7fWIyeBAVwZFqm20scCR2G77uhzVMP+iR2Eep
	NXaa+kJuNvVeu2QXHSk7uqdZSTkz6AS1IpFDxp9u65S/2XwW+OD1qxb7KNcNde92VTibV1ywrKs
	EJlM+Fw4X2rvOlsrCy8bwC6P6+iJRH5gPxQH77Kuikc5rZ1e3Ol1V+e6xUeHMXK6hqmbWjiFeY9
	P4Ct+
X-Received: by 2002:a05:6102:41a1:b0:7a7:198b:6748 with SMTP id ada2fe7eead31-7ac1da2e150mr2444120137.29.1790172278414;
        Wed, 23 Sep 2026 07:04:38 -0700 (PDT)
X-Received: by 2002:a05:6102:41a1:b0:7a7:198b:6748 with SMTP id ada2fe7eead31-7ac1da2e150mr2444098137.29.1790172277951;
        Wed, 23 Sep 2026 07:04:37 -0700 (PDT)
Received: from rogue.. ([2a01:90a0:1ff:8900:7efe:90ff:fe5b:c3c0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ab3ffbc6dsm99671266b.30.2026.09.23.07.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:04:37 -0700 (PDT)
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
Subject: [PATCH 1/1] image-oci: use rsync --checksum --no-times for cross-image layer dedup
Date: Wed, 23 Sep 2026 16:04:33 +0200
Message-ID: <20260923140433.3632759-2-koen.kooi@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260923140433.3632759-1-koen.kooi@oss.qualcomm.com>
References: <20260923140433.3632759-1-koen.kooi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1NiBTYWx0ZWRfX+a7JuZyt4J5C
 Ooe1afx6Ai2i9s2Rg1lkokeuwMex3mAPqa2sw8k0NvqG7vHISoePC5JudCd7+YCSEIBADhXYSQ1
 nEFQ8AeKLcYgPMT9srRkwHVPf509RhfrMFySMpVKl8GEJensVTdWu9suRubWv8xd7G89ny3UOcB
 9uhUM6yacay35URxEKNeZzqID0l+M2hTil8YSXWB/FJkCEYAun7RLhGNSC1E4gEro3I0IMtgKI9
 GUds6tdCMZk7KZ3oRzWj7LFly+Zdwb/Jf9SC870u1I6+tezJrhsGzSaQ4Xq9iVjzKgKK3U1c+7Y
 +4Dp0RLJCXHCaX+ahKbWXfQdJVK7EBmm96wS8aCuzTiGjWAtSFWrVHPqaBPPg8zWMO30VFrOjC5
 prUcxC29lJq6e4+OCUjrvX86Q3N1n+IrjvY8T8yoJXQ0EAeM6O5roaT4sTdiVAuG2Od77UGNSH7
 xhAXyzMYd2WovVX/PPw==
X-Proofpoint-GUID: IZG5HiJchZcGY3qsePJ5-EN4gieR2uom
X-Proofpoint-ORIG-GUID: IZG5HiJchZcGY3qsePJ5-EN4gieR2uom
X-Authority-Analysis: v=2.4 cv=K4+3jCWI c=1 sm=1 tr=0 ts=6ab3dc77 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=i4UxAMiDx0pAy8vsgYgA:9
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1NiBTYWx0ZWRfX7j7QEx8Kx4pv
 9yR5UBlOxduaCiEK/x0ubu6QTKvIuA35A51F9FNaqP/9FcW1SFPWwlRYbeAeTGEZotdC31vB1r2
 wmWqkritpxCkIM0/StvCoxEi1z4v71E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230056
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Sep 2026 14:04:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10091

An app image sharing OCI_BASE_IMAGE with a base image should not
duplicate content the base already provides. It does:

- oci_multilayer_install_packages() merges the layer rootfs into the
  base bundle with plain "rsync -a", which only checks mtime+size.
- The per-recipe SOURCE_DATE_EPOCH makes the same recipe build for
  different images have different mtimes, so "rsync -a" wrongly thinks
  the files are different and will re-copy it every time.
- rsync -a also implies --times, so the re-copy overwrites the
  matching mtime the base already had, confirmed via
  --itemize-changes: ">f..t...... usr/lib/libc.so.6".
- umoci repack then sees a changed file and duplicates its content
  into the new layer :(

Add --checksum and --no-times. Reproduced with a base image and an
app image both installing coreutils via a "packages:" layer:
unpatched, the app's own layer duplicates the base's full 16 MiB
content under a new digest; patched, that layer drops to a 14 KiB
residual, as was expected.

Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
---
 classes/image-oci-umoci.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.inc
index a033d73a..67f6c6e5 100644
--- a/classes/image-oci-umoci.inc
+++ b/classes/image-oci-umoci.inc
@@ -582,8 +582,8 @@ IMAGE_CMD:oci() {

                 if [ -d "$oci_preinstall_rootfs" ]; then
                     bbnote "OCI: Copying pre-installed packages from $oci_preinstall_rootfs"
-                    # Use rsync to merge into bundle rootfs (handles symlinks properly)
-                    rsync -a --no-owner --no-group "$oci_preinstall_rootfs/" "$image_bundle_name/rootfs/"
+                    # Use rsync to merge into bundle rootfs (handles symlinks properly), use content, not size+date to deduplicate, SOURCE_DATE_EPOCH breaks mtime.
+                    rsync -a --checksum --no-times --no-owner --no-group "$oci_preinstall_rootfs/" "$image_bundle_name/rootfs/"

                     # Create usrmerge symlinks in the first packages layer.
                     # Normally done by ROOTFS_PREPROCESS_COMMAND in do_rootfs,
--
2.47.3

