Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC69C54EFC
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 11:56:59 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9751.1785239815336654635
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 04:56:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Kz3LRe5F;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=KAPYUUVJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBH2nY2776869
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 11:56:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MHt/ZBP+i9OHBr19dB01o1pDw9PIrMZOHCF
	6YgMhJH0=; b=Kz3LRe5FGb3pCFloGUUWYOuKZFzfGblj5pH4ImLqe2XlZZFGXIM
	b7ZgQq7HFbV6Ta+G9Qopy02BHQVvPcG3M3LeiJsA/dAhTKhBZzu/418fgHT5+r/U
	yhKvmbSTHmIisTPeCKbEfbvrRJJYF/kazNBBfbejIHDlB+Y/hu6bppzGjCOP1RgH
	ORtD8458knpv6oFjP3i5FXnm8e2Kf80y+hQIA4CrYPLZhwcMaD0wF0h+Z922Aqff
	+Bi1WsoDVuQZBIKqmPB7xYAauRsAZIUvLPtm9PW8wHULeS2+TVe5VwqQeEsEM8Ow
	+yNxBVzy3/PjDYQly1kejeWnZ0LHd08IBvQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fptatgds3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 11:56:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f45dde7595so46338886d6.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 04:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785239813; x=1785844613; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MHt/ZBP+i9OHBr19dB01o1pDw9PIrMZOHCF6YgMhJH0=;
        b=KAPYUUVJb5GnVG8j/X9m0Ah7AVQAYnO9pBEKqVb0urunX0E18qiqcsoS5EzD3idqsD
         e0/bCxW/KQ+qkaTJL4kxehlJ/6c3kE/Hb5aYN9X6Og/HhxsjghyNZSTHgNue3y9lUGQ3
         uYqGiugqcifyZK3klXBBOEy8tZh4mJNFXYQxyhioqdu5AezPOhub32xic5DmfSCoUlEg
         BP4s37Z1M0C0lVJ8MnCrochghZwEKmCAcyywal21J1QTfaz5mlJpxi2P6szNmr2yTzK4
         zjr9UEak1v2LI+4IVFfU7XAIB86ZOtRKQybEn+u1+Va/luBYLzLmRRybN9IrM8SfqMGO
         cK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785239813; x=1785844613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MHt/ZBP+i9OHBr19dB01o1pDw9PIrMZOHCF6YgMhJH0=;
        b=f2aCvfPOjqjYDd03Fl0ibCD51yfEm7GZATVJ83kwL7Q8W+BOD1fMANdCxg2UvTcbrH
         bnaIZM9lqVFxObjWFcixLaG44tmc+clh47nFkXIkIbizccugQyMLCRqUR3qbogqdHI2i
         /AFZp1BGqBDLhL09ilkFmrLtdTHIg/TLqCAIovtt5n/hEa4NQ0ErV0Rml5iczBALuqDO
         y4yytbfRaASY2zJU0uNfhQMk8f/haacF1OuWL7t/5nwfTY8KGykO60um23rUkV6PTX2b
         7nDpkDaZ+xwdJS/rw15BthocQOZozE6btnsAt155sbz/gv96MpdxZuM+5pmWBzQlDdg7
         EkEg==
X-Gm-Message-State: AOJu0YxmoquUKC+04hl/WqGd4FMlmtlfTsCL0WjvbJS2/8+4ulndzet1
	5xQBkexTUc87WWZr6n9h9wkgwWgQlk2uZx+5ZNGtlDjQnnuZz7WgA03PgX6IvJAkwhtqCgqIeVa
	Wfzr1ZDUDUHSQqgKU6nULJ5LehezFLONMccKDKUvCq88/hIIvRWBn1vGybyX4hioQ6wo7koyNzX
	UPHeD3LJ6BT3AltNE4jQ==
X-Gm-Gg: AR+sD12GXZmz2sGI1xXtaajmRhfuGcCNm+bFk1HX9rv2hUSGUy4IG1fDj1l8SFNv1Aq
	lGbCz1nuWlW0+ztFon66TEwZinNY8AF2HkT8U/Z8c6PxXhcnmXMhLocNRzYIPfmvJzpj6E07gic
	occyVug3HW99Snq6CXv3ifkwtl2fHkj4jToAKXu7NkwIqrIseD+Djf9lQIwetZr5GDmdRCA5ubi
	kORKYvaokTO6xB/LFfe63qIHYNqeMNSKYUA3gMD3qKYS/ex6TXoY5IVQaWmDJcadttxIQtP6qCG
	rvzCKPwB+XVgikS3n6Fy4/X565enw7k3f9zV6nKYN93z4UiZZOOxi/BPAmCkck30PfzP+iMk0EV
	zKoHfmfpaSBvrXayhA/ZMc/s=
X-Received: by 2002:a05:622a:5888:b0:51c:b58:dfeb with SMTP id d75a77b69052e-529d71e9728mr17475051cf.45.1785239813361;
        Tue, 28 Jul 2026 04:56:53 -0700 (PDT)
X-Received: by 2002:a05:622a:5888:b0:51c:b58:dfeb with SMTP id d75a77b69052e-529d71e9728mr17474701cf.45.1785239812690;
        Tue, 28 Jul 2026 04:56:52 -0700 (PDT)
Received: from hu-kkooi-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c58b8b992sm582268466b.31.2026.07.28.04.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 04:56:51 -0700 (PDT)
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
Subject: [meta-virtualization][PATCH 0/2] image-oci: two do_image_oci bugfixes (missing pm.update(), libgcc/libgcc-initial sysroot collision)
Date: Tue, 28 Jul 2026 13:55:14 +0200
Message-Id: <20260728115516.1107990-1-koen.kooi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEwNSBTYWx0ZWRfX/Kc9B5/+J4sU
 i9ujnwu2q2xvqw2IiidCjS5aT5QaFuHXrFbsEAdFD5wbGCi9VAylANXqTfcWGs7mb7fjzAvHIk4
 JgI38cFo20AeLYPzJokHq+0+LQBhIOk=
X-Proofpoint-ORIG-GUID: khBmWiCwCiEuTc9VU9eMVhq_Kr93RPT0
X-Authority-Analysis: v=2.4 cv=KtJ9H2WN c=1 sm=1 tr=0 ts=6a689906 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=aOfyKmJTlNRI89DFfssA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: khBmWiCwCiEuTc9VU9eMVhq_Kr93RPT0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEwNSBTYWx0ZWRfX4Y/lUNzFGTgb
 FANf33T5GXkghJ51HZuFNvfBGNA6z+5vN8dQgXa99ZsD8o1cVFfdZGp4C7PgEwnIN5vf71YCv1R
 oG4Kwp6x8xoteiWFcxarfdo+AjBJIHEF0+A7Afk//jQ/oHwa3xSMfQz5iSQkUruLqneJ6qkRT3l
 uNYpLxKvVwkbKS29K7J6w9I74MTdptJN9UouYy3kO3X3HHY03+3Q43kPReAtP44kHgfYZSPIAFe
 tAcFh/5YpFP9mi3dQ9CU+crarB5stfbth0Eel5YBi2+j4FSZKaVO9O2pUpLTFBXFPPCRIcbVEU9
 OA0kAIUvki/c8pcO8UNd5y8Yw0OAyogGzS9tgkd8WnIVDBsZjn8Q9DVWYeUElVsYbVzZ09A9bcX
 Tb5Q6sapE3kNoa/sgSaKR1cfTpvGeG7rGEGd6QCAxB3iwz7A5cIJRmE63/aNP/ZZSQ8lXllhKHM
 c0AOY22+mGPgEneZ2kw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280105
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 11:56:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9990

I've been working on a prototype for building a rootfs with multiple multi-layer OCI images images, all built from scratch, in one bitbake command. I ran into some issues along the way:

* image-oci never runs "opkg update" or its rpm equivalents, so nothing gets installed
* both libgcc-initial and libgcc want to be in the sysroot

The first issue is straightforward, for the second I leaned heavily on Claude to write a proper python version and explain it better. I'm not fond of the wall of text that ends up with, but this is already the 3rd iteration of trimming it down. 

Anyway, This is the first wave, I'm working on other fixes, like mtime influencing base-layer sharing, but that needs more testing and review. I do need to mention how surprisingly small the resulting image recipes are, a big thanks to everyone who has been working on this!

Below is what Claude suggested as coverletter, it is still verbose, but doesn't suffer from the "Is Koen being sarcastic or not?" issue :)

1/2 - image-oci: call pm.update() before pm.install() for multi-layer
      package layers

  Multi-layer OCI images (OCI_LAYER_MODE = "multi") with a "packages:"
  layer silently produce an empty layer: do_image_oci reports success,
  but the layer's opkg/rpm install never actually installs anything,
  because the per-layer package manager's local index/cache was never
  refreshed after write_index() (do_rootfs itself always calls
  pm.update() between the two; image-oci's per-layer installer
  skipped it). The failure is only visible as a bb.warn(), so the
  build looks green while shipping an empty (or partial) layer.

  Reproduced with a minimal recipe (base-files+coreutils in a
  "packages:" layer): before the fix, the resulting OCI layer blob
  contains 0 regular files; after the fix, the same layer contains
  272 files and the compressed blob grows from 299 bytes to 7.5 MB.
  Full before/after evidence in the patch commit message and in
  TEST-CASES.md if you'd like to reproduce it independently.

2/2 - image-oci: drop *-initial sysroot deps in do_image_oci to avoid
      libgcc collision

  do_image_oci can abort with:
    ERROR: <recipe> do_image_oci: The file .../crtbegin.o is installed
    by both libgcc and libgcc-initial, aborting

  Root cause is in extend_recipe_sysroot's dependency walk: the
  SSTATE_EXCLUDEDEPS_SYSROOT exclusion that normally keeps libgcc and
  libgcc-initial from landing in the same sysroot only applies when
  the *consuming* task is itself do_populate_sysroot. do_image_oci
  reaches extend_recipe_sysroot through the generic "any task whose
  [depends] contains populate_sysroot gets this prefunc" path
  (staging_taskhandler), so that exclusion never fires for it.

  This one is sstate-state-dependent -- whether it fires depends on
  whether extend_recipe_sysroot's walk actually needs to populate (vs.
  skip via sstate/setscene shortcuts) both libgcc and libgcc-initial
  for a given recipe/build. A minimal single-package OCI recipe did
  not reach libgcc in our testing, but a multi-layer "packages:" recipe
  installing a from-source-compiled library with a moderately large
  DEPENDS (boost) did: instrumenting the fix confirms it stripping two
  "*-initial" do_populate_sysroot nodes out of BB_TASKDEPDATA for that
  recipe, i.e. libgcc-initial is a real, reachable node in
  do_image_oci's dependency walk for realistic recipes. We were not
  able to force the raw abort deterministically within our test
  window (a downstream build did hit it deterministically across 6+
  clean-sstate attempts on a wider dependency set) -- see the patch
  commit message and TEST-CASES.md for exactly what was and wasn't
  reproduced, and why the fix is justified regardless.


Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>

