Return-Path: <zhixiong.chi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80EE0CD5BD0
	for <webhook@archiver.kernel.org>; Mon, 25 May 2026 13:03:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15367.1779714230198199630
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 May 2026 06:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hDoIx1Pl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9605e3e175=zhixiong.chi@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PA5hg82105104
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 May 2026 06:03:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=xflh8k0T12oFjHyVYEt1
	sDYE058T6OxmtAMLwmmKGgM=; b=hDoIx1Pl7WZ9+1UyS0b4VX7fsmi2hG+EPagH
	fHpZeUotMLOB4HtsC148b8NF0HLu65R7oUSWbtXbEgmlqorydAJWo2/BIajjLE5K
	78lmTZ2f0kXec2Xk6k6JJW4ZJgcG9KFO39mApNgWgOtHvAQl2ujS5Iy4gqtM9NVV
	+6YxFX4dLZkKwTUxdocNVJAh4LO3KiGk4gh4VOs1pD87uvTr++hJHrjfh1K195nm
	Yw3P4PjkL4x4GSQKT3pO3fX8DoZRD4nLT9XHbiiPUwUlmO6eJrmlcTmH5X5Kp+cm
	uxs0JhAbnTLkWKx+Bh6jncfjemovTdGd92HJPsAyoGvUXbi6pw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010062.outbound.protection.outlook.com [40.93.198.62])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ebbrej9gu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 May 2026 06:03:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l5FJMwwoYHQAMabhHB0jgiKIGp4b512ZdFsyAaJHuGAVJircopA03ZhCkAieFiv9ftpSeSOY5x59HpB1x5L4r3/6TeHxdtmjZrFDFXiYtBqzWIfwr2Rf+bty9PbJ+J78j6i1Wt4/UknbdrgDFQmuK6Se041FMCfNNVTwbJ46G3L1ZLL5PKPydDWifESLlcvDpYo4r7+bjGwFeqiMaIwCppRgrAsM/rabvvmEPy7ENxIvTi2rPj38GrKVAyCNcT/8cPCNm7RdMTaWOFLM1re7KGshwVIKJtdTEgD05spmjpFg4noUTgc+a7anbKoJpFHG31TeKtoNkLasU4C2VOrA7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xflh8k0T12oFjHyVYEt1sDYE058T6OxmtAMLwmmKGgM=;
 b=T0qMfzFBgnt31H/BAvKfBX+DNj4ZUyic68nQlc5Q8jMg1FC3htrUVSBwNHZXqCgdfBicDuCjoT0ombsfP5jN3AC0wOfrskVNU4/JCHyzTfottm8yeE4iytl5t0CmCyHPgv+H+CzRMAivjyNngxBgHXc5TqtT0iKE/0Bw4iHTtFIwJI2A+FAmakF8HCREYzn/EpHRdM2f/ASN28bXLI8DDdGbZU2Y+D1N1JA7H9KpujDeM/d6JOVIgmjiA47AtzqnCcQjUyIsGoPA5MLAD2MHQho1CpMkul66QjGrOsAGiUHYISAkQiXDJCoKiXuYbfB6aLp78PBVWsfe1xF+RTMhgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32) by CH8PR11MB9506.namprd11.prod.outlook.com
 (2603:10b6:610:2bf::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.18; Mon, 25 May
 2026 13:03:47 +0000
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a]) by DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a%6]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 13:03:46 +0000
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][wrynose][PATCH ] cri-tools: upgrade to 1.36.0
Date: Mon, 25 May 2026 13:03:39 +0000
Message-ID: <20260525130339.3963913-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0015.namprd04.prod.outlook.com
 (2603:10b6:a03:217::20) To DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF75D68BA1B:EE_|CH8PR11MB9506:EE_
X-MS-Office365-Filtering-Correlation-Id: bdb39894-40b2-4e5a-b046-08deba5e0e2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|3023799007|11063799006|56012099003|18002099003|6133799003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	/Ox8E/sr6rdzhUWZcmdkcbB7UoIsAnp8UknB63zQve1CU5wxvaTGKAliVF2xUiO0blA18S9WQZGff6d7wAb1FX7ejINyTkqIgyj5zCxWz5PsYo//XgOKveo+0dl4y8773ch2Oh3hPwpCv1buyqS6aCNl6J32MfYb34AykbfIkQZEhEcVg6hDh0Hh4u9MIYH+bgeAGp2Tt70SRueYIR7mhX/kh92Cxop2utbW42KAviW1TOQtb5roTDNFNih8IZkj+M+YmtPWdaVr+3smXvyndcySaazSYehRegk+QAYuYw0xi61Urq5enXuYQFy55hPtDwumQRPMRnPYcDjVaxFVeOcVmiw37ssJQ+UCpgDP1FqooV8cAunLz93fnr5IcqCkTeA0lBdGfbix0Co+85isCz7DwkDyq2SuWOThCiq1YxvR3LSAKfPhkuFfxczuN6xSe0z0R4nX1UFw0WelF8Q6CIb8RS+RraPfq7+uebBi2L1BjwPOE1brmWWcJul11IRpLKnwytycBGWuDbzPi/2OcrPT9MtvtD4Xk2jNNPMRP/0LuEmivgPPytIfg49JrA4AdfTmrNPlqsI1t8Km4M3gHfmGUUyVCuknHoUZQWoHNzblczkD0jlJ0AN4BX2bJ6/PWsIvb6XTd2UuzV570/fNbjRBJEr80fFUf94AZh5uJivUDmaCBHTWW1NdhVDJzgAl7LIj5G6daVaHZFRqSvXlsA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF75D68BA1B.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(3023799007)(11063799006)(56012099003)(18002099003)(6133799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NBg/INpq55UXpyDUK7Tnp06jHdugM0v8kdimMdmPWIpdZXhxM44H7acCuFWM?=
 =?us-ascii?Q?pGlq3Zx4oAD2zZkd9BZICrv/xq3npOb0eSn/H3ugDyRmyiSB3xdSKiZn1qLf?=
 =?us-ascii?Q?kdEDI9KJ0r24IAdm6Q7whNJiSR2HX1LI+SBCbJ6rS53ptSpcfTJhVS+PV212?=
 =?us-ascii?Q?ANnOvDNBMsE+BRyFKWhB2CdnoKSD4e7iwE7ANFnIMcAS7M7XON5s1hq36KxY?=
 =?us-ascii?Q?4b5/BOqrat+UvLzQIuX6HRhrfa+67EELGPV4LnQhYVa6u+XQmL9Xbrzt+8zB?=
 =?us-ascii?Q?RXCV8+X1c5eHPBKhOAV/vZuVptK0g1bzGf70wzIdYCw37/S6d6Pg1nquKAwD?=
 =?us-ascii?Q?+4d1z/01icWmF2WHqKrK7WDFmfFUtVzfSJXxJEUZyLq7znVPD+2YFExp33Cf?=
 =?us-ascii?Q?KIzlwPXZ5gKOTnqpCZPGX2KBvYYVZYF2YYgKOy9+w8/pQwV+MU9j61gr6eIM?=
 =?us-ascii?Q?LaZAaiFT5+lZY6nUTmWU2B0cor/DgVJqQt8yRLx75bxbUtkxSfeBRCI8kUug?=
 =?us-ascii?Q?P1Sxk8b8I269xpjtGhEEcqlVvHYjkNHZKgB5EKPAJGKnDcrVFqPUen8Dtvdz?=
 =?us-ascii?Q?0psj6eemL1IpMy/rlB12/F9xqEp5xAYZSGce9mlD0J1xVj+YqzgBgCIu2MrR?=
 =?us-ascii?Q?y2V3ttHBudV1lQuWt6Fpc4MseB+VjhKEhHKG2/MiiQMi+am3SvhXP/Jj8j4Z?=
 =?us-ascii?Q?b6UCLiIW3jWcanYGcykyiWwoK0VFZEaoYtPbfld7igi2Zyl7gF5WljPSU9/o?=
 =?us-ascii?Q?1EWfmcv/4b7LJ8cqWq2ctoiJvjgBw/IKvCNrDFGKN8Svr3Qv066OPHo6HmD8?=
 =?us-ascii?Q?nsIEjuCAl8AC321gyMCAR0+ZpHbpZPMWSUJa70tLlIpLvtRXQ6O8uakynjG7?=
 =?us-ascii?Q?5ExoC9O8kbxTiB3ndDQ7IPZON5qk4HNd81zlwZaohTfSetDII1IT0nmxEAmr?=
 =?us-ascii?Q?qO224PF/MI556wkvknaSVprDBp4oqqT6ISU96ZoJFIdSQgjuanDyXt9rRBVZ?=
 =?us-ascii?Q?zduZsPhDC3BSp1Mjw76P80DoKAdNfGJxhkiuLYmEw4p8UBeHoqbVXB9dbuyk?=
 =?us-ascii?Q?yLjESks+B9jT3aMDoukMqFXJ6ZrLe8pyrf5bpe2MYTh5+QR5AHgvbcl8kBwJ?=
 =?us-ascii?Q?mHqjg8vl8Lb0cHZrymc3I2Rj7vqYZwild3PHwqp+ZiUhoGO0Om1N6SDEbRQo?=
 =?us-ascii?Q?ze75Vc8IyWngs0Za/lStYT3DTLsfBD5Rtgj3g8L/G9CplHUWRool6K4OJkC6?=
 =?us-ascii?Q?ooghE6zRcr7hl/iPy+cwu+RXP6G6ZNer0F3IUBcReFFLsusdncKMp3TTQem9?=
 =?us-ascii?Q?OY1Oj+G6agGRE1q53hSQBKaOW6w6wtNyf80DwDH2U+t2UwJh5AsBMGTCw/QY?=
 =?us-ascii?Q?FOTsj9A8m+QGn0xWonVf+cs6HeWsf/mYqRaGNSxG/CIVWXAr73wlPDhm7/gR?=
 =?us-ascii?Q?uQJj704d30zrxkrdgQPJAO9NYzqSq7v2ZYfU4rfYMERyWGGHixrbhr3miBf+?=
 =?us-ascii?Q?TE2KGT9eCnXUL3Cm//zjxq9WtuFIYq0EhKyxw6tVUUEkPlFXV7hVNjmW9F4b?=
 =?us-ascii?Q?CwqXShJRbVSrPfUWetjvkQi1mfRByB15YNCX4aXa56NXzQ0w6Su20OMFrPnt?=
 =?us-ascii?Q?lk4RK/vtZnBnYG8sqD0vvXjDojChHaESoomIKZRwfiq96aIMj39RM/It9YkX?=
 =?us-ascii?Q?KNIAmXUlBSzesKOeMsO6sB5nyVHHN9/hncwj8ZCDQDTXJkSbdYhixhFwekY3?=
 =?us-ascii?Q?LiN1RAecsJVUQnQdB35tQzmaKCnqXlQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	e0GXAXXr/ooT5GRFFiJon381CpLLfY/AXq3yheqyPHNBD23fK8K3fc+J8hFkXvyfj3P2Z0vIj9S8zk4gubYAJxDOPTF8wGvEcqjDyv55Lbgf06qxHHSdNNm3GUzSf7idsDolK6oiPGTsHGr4SxLkjoQl7B/ib99+QfNoDo61QUY47r2BDPi4XOH3UbdNJrQaTK5lLc1ikfXNywR1+s/Y26Veo698jzbBriMETjCNtTedeItUaTClER6IAEuVevrTRofYp/3bCRFBRwnvwM0Ep8xg4TmInJikAlRHDpGRwXge2qJUOj26UkVHYJpm2ss/52mJl1Y7VtsfwqNnUAFPJg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdb39894-40b2-4e5a-b046-08deba5e0e2f
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF75D68BA1B.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 13:03:46.2223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HyUe7/AToitKf9QIFmcrluS5oRHI4Csn4f7h2LEzdo2J0ctp8H1iz3t2vs3emuAMlQLcZyMIGDZHn2zXsseZLCZqqFb6zlh4ELaq3lHwMY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9506
X-Proofpoint-GUID: C96vRo2U-bgxJCi2oDGO63q9WAJ0a_6o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzMyBTYWx0ZWRfX+0Me1Wu9vdcR
 PIGDIB/tDcfMNZBMI5w5RB5LjjGiSCNuTCI0VTPHEjaU84YWvPYfG3qk/oYSo65HKr9T1tcldZI
 iiXiqzec6ZAPIy+Er3T5vXNGs2ExWtDP9O7zhae743I7efAQEAy5YooCbqF1J9aIW/oHVqmmRor
 igPuAGKf+OZmDFZkLb2gV3RHn+Akn0EBpIZaApS2wxdEewqF74b0y7wUXIYobakEczN1DA7/U1e
 Ksxh0ZpxsVhlI5P2xqy8yMt7L/yJMY+GMnxwXRjv8Kz8zIHQ2CbsTh0DFJXeZ6Bmvczzm2i38we
 96pxr+alNAf2wFqB0tWNW8uuf6rP6nvdw7ufpx6NCfg2U0A1XOGAaFGIAEFaivmum3V+wvmW31s
 a831Z5YKYK47kIvlWYTHRM25sJ25xn0HPxd/JkCxJPJcibTqNetpqXQnmFNZ9v7LpqEKOpH+EM+
 4cgtRC9yuLuMkDlZtNQ==
X-Authority-Analysis: v=2.4 cv=IMUyzAvG c=1 sm=1 tr=0 ts=6a1448b5 cx=c_pps
 a=zLPr+aUDpHWP/LWwllnpHg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8Ad4tvYqdmIA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=pM9yUfARAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=3JueAJEtnetfFf-77kkA:9
 a=YH-7kEGJnRg4CV3apUU-:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: C96vRo2U-bgxJCi2oDGO63q9WAJ0a_6o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250133
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 25 May 2026 13:03:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9811

Bumping to version 1.36.0, which comprises the following commits:

    82f28d67 bumpo to release version of 1.36
    a846c714 fix typo: intead -> instead
    3f28b1c4 Add SergeyKanzhelev and tallclair to sig-node-approvers
    58a1a780 Bump crate-ci/typos from 1.45.0 to 1.45.1
    31b19db9 Bump actions/cache from 5.0.4 to 5.0.5
    507358f9 Bump actions/upload-artifact from 7.0.0 to 7.0.1
    3f90c7cf Bump k8s.io dependencies to v0.36.0-rc.0
    27c856e8 more gitignore
    30434d06 bump go tp 1.26.2
    7d5c1228 Bump crate-ci/typos from 1.44.0 to 1.45.0
    aad688ce Bump google.golang.org/grpc from 1.79.3 to 1.80.0 in the gomod group
    af533d44 Bump actions/setup-go from 6.3.0 to 6.4.0
    ffa8e166 validate: add KubernetesPodUIDLabel to container attributes test
    bdffd30d validate: use subset checks for labels and annotations
    661c011e removed deprecated TODO
    746da572 Use k8s v0.36.0-beta.0
    c98d29d2 Remediate GHSA-6g7g-w4f8-9c9x (bummp jsonparser to 1.1.2)
    58323188 Remediate CVE-2026-33186 (bump grpc to 1.79.3)
    d2f54006 validate: add conformance tests for attribute preservation
    a8b6fcf6 Revert "Disable runc integration tests due to AppArmor issue"
    c633d342 adopt the latest cri client
    76ce604b Bump actions/cache from 5.0.3 to 5.0.4
    5077d436 feat: add prettier validation to Makefile and AGENTS.md
    43768b05 crictl: replace utilyaml with sigs.k8s.io/yaml
    3866e388 Add verify rule to Makefile
    cdd3d738 created a local copy of AggregateGoroutines
    14a98847 start using k8s.io/streaming

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 recipes-containers/cri-tools/cri-tools_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/cri-tools/cri-tools_git.bb b/recipes-containers/cri-tools/cri-tools_git.bb
index b2706311..0805e7a2 100644
--- a/recipes-containers/cri-tools/cri-tools_git.bb
+++ b/recipes-containers/cri-tools/cri-tools_git.bb
@@ -16,7 +16,7 @@ What is not in scope for this project? \
     non-exist on the kube-apiserver. \
  "
 
-SRCREV_cri-tools = "16d5673873fda6d333f8411778a35f5778998680"
+SRCREV_cri-tools = "88d8ad9d40f82726fda53c2d271e6172b4c619c9"
 SRC_URI = "\
 	git://github.com/kubernetes-sigs/cri-tools.git;branch=master;name=cri-tools;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
         file://0001-build-allow-environmental-CGO-settings-and-pass-dont.patch \
@@ -27,7 +27,7 @@ LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c2
 
 GO_IMPORT = "import"
 
-PV = "1.35.0+git"
+PV = "1.36.0+git"
 
 RPROVIDES:${PN} += "crictl"
 PACKAGES =+ "${PN}-critest"
-- 
2.53.0


