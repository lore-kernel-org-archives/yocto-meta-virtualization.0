Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44BF6C98302
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 14:04:40 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7743.1790172279286841626
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 07:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=RF0WRLWb;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=E3f+pXwM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbUw93295541
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Sep 2026 14:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+kBvMPY055QZAH3CuObxJuYyrDqZb2vW4jA
	icRlUsv4=; b=RF0WRLWb7a/VDsrJwRoZ6+FN5tF+tJ7ERuOjUXCv2uGd8O5gWIH
	gkjc33wpb6JZnVzK+qY7R6iJb6AjjKCD9vGVVSuVwaNDQQdwEGmEKEQqZEP8d2is
	VedU3i9DBY9xjCiDUbLNt6Aif1dDEGs+m+B+UDGepCfhBpnKVySwuTrMFNNNjLey
	O3kr57OTXyRLkj0TWlzgwhc8su1SJ6Nr+O0p1FHpNkaQMhXxH65Ir1ELMgChfxd/
	ck9DTRdNbEZzzdQRAdazYN5MdzYxbEjK0SrGHEfLu8GHbWOsddZjYUqY5Lf1XpBu
	TeRodKEUzjm1hIPw3mFoj1zw+MJYVd9J51Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwm9612-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Sep 2026 14:04:38 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7866c4ed349so813662137.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Sep 2026 07:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790172277; x=1790777077; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+kBvMPY055QZAH3CuObxJuYyrDqZb2vW4jAicRlUsv4=;
        b=E3f+pXwMWUZNWRYpnAWIhu2RWLwchQqJrxPoLrbvljR5d54kb8+pBlymprhORLEUP6
         DEZqmTdknmlloSLwwPcFKmo8XxKxcShWhunNnSypoA1nMNYOpZOqzkehJsYnsf7/5VGM
         P8JL9b5tl1fpBh9cwq5mWmbi5wo5+6ebBS81aK2InG95pWWffv3THz2J3tE4xyGjTkGn
         lHdavbON3npAcQ4G9qIgiofK9JddLu9XDRSlBivajLqHHr2HYiJ9tXNkIEI+9NjA1/BD
         QZWK7mfXmhgDoMrFsEMsvtL0BNjqJ20wKWRwPFQYMCeviFq3QONDs5xxauVGqpn1Lp+Q
         /aPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790172277; x=1790777077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+kBvMPY055QZAH3CuObxJuYyrDqZb2vW4jAicRlUsv4=;
        b=YnCnFZGt6xbg3quzKIXdzINLHGLrf8BTo1T2PB3mVWmSsG5ViO8oUiDEnU3JdpDP41
         UxkG8syY4zngQo2Ozi7Li/zCRW0uDil4Ky8Y4HTp/z+HisEKcru0/TNzdg0CjSScScyD
         KUBZW6CU+SfsgOLEnyF4IpqpU6kNHYD/wWwnS9dMYXIhTOCpNZxYgpDcdeVpLQ14KB28
         fUvQGRaNel32Sw1MJkAnvEM0mvOjd+7GeDjvPB/Jcb+yOPOHKHmEar989QUWKnmnGUGW
         KXTD+zIzmEg0Mf0UQEzsy/V7H3de8fQZ4vOfUSNMORjny9ufJ+GG28RsLZlj+xS8OfEO
         QNcg==
X-Gm-Message-State: AFuF++kXcQE7Pju2MXEhv9H9V30razGtG6hlkiRcnwCbTKCRTb+RzzCN
	iFnT//9tSMB1b0ib3zDaF/W4TDZRuv/xZiVVnRZIALB1SamsfNI/NdCKXGzmgB+8mT8Iv9niab7
	9MceH3tzxgJ7FLHGy9Idk8JJzSbJwlUoBBRaULTfYDY0x2DuyTuG5IPxSJpWSc5vfemDVS8jJb8
	8xGwxkAIFAKD1kT0LlNQ==
X-Gm-Gg: AYBFou1hF3nZw1vzI354pu0OIJ9o4aJcpDVNAgyUYn02VzxAUmMeTnndJEOFAbChGiR
	TUpL5NHFC/Yz/XqXCmKFeCnGlmj9vBak9qTOmxK6rOLTNz2RzcCjs/mWNtIhDs+IVPqEX7xzz6S
	a8o6FrFhOug8Xo13h3pfjWJ5SvE80hm9rtMC7bBPInsGB6kfR9rd4/i8H2GEFK8kj6mybqlIst/
	6qSKFi4gIfFaXQjdB4uTE0rv9PNScpPoTHdv7h+4sRpNeVLoqgdH7vGnMj0/6K7echwpNrOYOvF
	DIlEBD4Bwhakzu8ExLTKZGGPX4GyVhiiQALeCORNJxiQHNrgKkO1MWUdYmMS2zuzSvmqjQ1G8Tz
	wUYtu
X-Received: by 2002:a05:6102:956:b0:7a7:ce1f:6b93 with SMTP id ada2fe7eead31-7ac1a8b44a2mr2530949137.3.1790172277301;
        Wed, 23 Sep 2026 07:04:37 -0700 (PDT)
X-Received: by 2002:a05:6102:956:b0:7a7:ce1f:6b93 with SMTP id ada2fe7eead31-7ac1a8b44a2mr2530911137.3.1790172276803;
        Wed, 23 Sep 2026 07:04:36 -0700 (PDT)
Received: from rogue.. ([2a01:90a0:1ff:8900:7efe:90ff:fe5b:c3c0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ab3ffbc6dsm99671266b.30.2026.09.23.07.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:04:36 -0700 (PDT)
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
Subject: [PATCH 0/1] image-oci: cross-image OCI layer dedup broken by rsync's mtime handling
Date: Wed, 23 Sep 2026 16:04:32 +0200
Message-ID: <20260923140433.3632759-1-koen.kooi@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1NiBTYWx0ZWRfX0ddGdrUG7/Rq
 Ihs03eAckOV5/XxHxQzJ3u8M4bVIbCHMc8/ml3U5SEkVOrnM9Z/CS/iJqU6fgAcH9pQVWSD1VzV
 0vWFzL7Mm3I9CIkfrtRTkfyxEaCc+6U=
X-Authority-Analysis: v=2.4 cv=R/6WitRX c=1 sm=1 tr=0 ts=6ab3dc76 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=G5O4NANFKlZK4voyy34A:9 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: SEznguxh-ShajBc-z1jSyh_k24ilsNqI
X-Proofpoint-ORIG-GUID: SEznguxh-ShajBc-z1jSyh_k24ilsNqI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1NiBTYWx0ZWRfX+UpFLK9GfBo9
 1laDb3f9VrjxqvkcA3aGNKky15Ds4TtlOYEe+/JNK1jC6H5aqwhHDoOtFCEpbhPL9x1rDIAnCXK
 UMNErF8T5QjwypEAt+PDSjOUk8i8Y0Wy8aLKE6k448h1HTvvHoExE6zZ5Qf0wx8Rb7eFRs9zI5M
 w8M5bBBscs0BqkT6kigParcWp2qusIG+Lfo1aJiqaEt0Gb0uKgGhA+NN6NSOiXJfP/g4J7g3Jw+
 i7pwuTikwVefGXZTXTLYTbjlvhbVIJIfB/xs7rGqMe2tNUzHcJzKeXmU0tMvtlLLpVlgf22fvZp
 t9kGzMsgPwLC8QSPFxDW0IV33rOp/eDcyE7f9HfZI/RTzijxXcgky9LqrWGOPNl8OlOOEwuWnKq
 SQyhUrM/o9+p87Msi+kno9rrZ3eIVf8Xf7RTiKap6USqgFLSQcGw/lROhqUObbgmg5p7u2VZmZJ
 N765hknOVEgBRtIoKgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230056
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Sep 2026 14:04:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10090

Hi!

While working on the project that triggered "image-oci: drop *-initial
sysroot deps in do_image_oci to avoid libgcc collision", I found
another issue with reusing layers. The timestamp that the reproducible
builds feature locks in doesn't play well with rsync.

The issue:
oci_multilayer_install_packages() merges a layer's freshly installed
rootfs into the already-unpacked OCI_BASE_IMAGE bundle with plain
"rsync -a", which decides whether to re-transfer a file by size+mtime,
not content. SOURCE_DATE_EPOCH is resolved per recipe, so the same
package installed independently for a base image and for an app image
is identical but gets a different mtime each time. -a also implies
--times, so the mismatched re-copy overwrites the base's matching
mtime too. umoci repack then sees a "changed" file and duplicates its
content into the new layer instead of reusing the base's blob by
digest.

It's fairly easy to reproduce[1]:

  # repro-base.bb
  OCI_LAYER_MODE = "multi"
  OCI_LAYERS = "base:packages:coreutils"
  IMAGE_FSTYPES = "container oci"
  inherit image
  inherit image-oci

  # repro-app.bb
  OCI_BASE_IMAGE = "repro-base"
  OCI_LAYER_MODE = "multi"
  OCI_LAYERS = "app:packages:coreutils"
  IMAGE_FSTYPES = "container oci"
  inherit image
  inherit image-oci

Base image manifest: one layer, sha256:5b133f90..., 16 MiB
App image manifest, stock rsync -a: two layers:
  sha256:5b133f90... (same digest, correctly shared) plus a second
  layer, sha256:64f1136e..., a *different* digest at the *same* 16 MiB
Coreutils is completely duplicated under a new digest :(

With "rsync -a --checksum --no-times" in
oci_multilayer_install_packages(): the second layer drops to
sha256:536fe286..., 14 KiB, as expected.

regards,

Koen

[1] This will of course run into the *-initial issue, I still don't
have a proper fix for that.

Koen Kooi (1):
  image-oci: use rsync --checksum --no-times for cross-image layer
    dedup

 classes/image-oci-umoci.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

--
2.34.1

