Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B58B7C7EE39
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 09:52:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.18343.1677664369525144099
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Mar 2023 01:52:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=TbHuuxt3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2424f77153=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3219DswS023627
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 1 Mar 2023 09:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=4uNod9yOzjFLF1AGe20n5ig/w3lb4eNkVwfaFq7GgvM=;
 b=TbHuuxt3V6OBsTDa2ZzOMlvDuhIU2JbVlBbuy5uZqgnDpQaQvn/4h5n/rojQb+1ko6CG
 cBbO8KdEE9rzsmOOWaNvGY0sEmTDrVQmiTMiuFheoepuHI/NZJ0TL0S7Tcy0seNCs+cK
 U9XOKfcFa6Bv6XVMTJLPHWChG5q9VGfKgEOBUtm5euvw+aXGXj5k8pn8FsnudIr39Akt
 roUvGxZL1FCKL2KdpBoHUR2306jQxwEl9IMynMDDHRVOozs/pJ4kHMse5AtijHY7OsRm
 J3LFuLu2r5WtjrTruVxwnaetGOdPzsK6ZGXfXfabDNY46J30DjMinpNgEy+VKw7uQEWb 2Q== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nybnwm1vf-9
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Mar 2023 09:52:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gajWaDzHPqxvyuXOO/b/D/xCdPOJMle6Vau69h10ZyDGlV/2Jnxayr6MM8utNOqffkmuUxWTbX6TlIabpJadLt1xbWi13GgUUP4riuLCMObRfwWbMt5/EcMj7KaCOe05da8pBbS5ndjedhgerxaNcFBa0N7EmvfdiXhQqQss/xpdZXz6H8vN4J9uzSOU5ig7BOUVVnbK3grK6CabrPKhj8pyQ3SuW4QDRDq5YOODGAt/hAhDkLK4vTRa306+sA0bfcQ2iZODMAfBTW1RX3V0ZB9WLfX+tOa5j1qQ6xIUjfTxkCI5PJiiJrqKBIZUochR87nAvXcPh6WBJIie/FKzqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4uNod9yOzjFLF1AGe20n5ig/w3lb4eNkVwfaFq7GgvM=;
 b=Npg4HqnCa9U+VW1jbDMsDLMKyRLWlo+IGMBLPsHlNYKPnFL7z9cE73Tp1eh5fEBZsyclEDX2wyT8FGH3b7Agx/xehYRXugY/sd9X+yWeynsKEK6Xlze3CQQTaE6j6NBZ2JP53OtnPK2dvGa5fDaEUT9dWQbNME4UxHe1yvo4oF4/2T0PtN3vRC6pnq8JP8IN0sHUu/PEa1iljRbxhnCu8e62KayDELrzQy7UkZ1aoU1PgOJ7b72p1neKE45qYhq2o2teHiXANUjBZdRMRH0LYELLQognX48Nd0F8IXPXPedSsyetMD6sSqgWGK5GXbQ93Ad7qANEt4NjPy2oRBnYfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA0PR11MB7160.namprd11.prod.outlook.com (2603:10b6:806:24b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Wed, 1 Mar
 2023 09:52:46 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3%5]) with mapi id 15.20.6156.018; Wed, 1 Mar 2023
 09:52:46 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][kirkstone][PATCH 09/10] container-host-config: provide /etc/containers/policy.json
Date: Wed,  1 Mar 2023 01:52:27 -0800
Message-Id: <20230301095228.122562-9-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230301095228.122562-1-Qi.Chen@windriver.com>
References: <20230301095228.122562-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::17) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA0PR11MB7160:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f8ca137-8b71-4609-32f3-08db1a3ab4bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	u3snVlAmcAZEYDWFbB6QPXt2p7wzS5gq8iEcgxgq7kAuHcbDnMlKI1dBwUf71zxp2HaCT2o2RmQHtyAQ7f6f2DbkLats5B+aCxVDGC1Vi6yoq5nREXo+fwKw3qRyA5oY2QjkH+WJapyxwLZVyUGnifpX61N4lzcqMuaEZ2obEK0pC87toqFzzMtvMFLjkukVxyazrLU+kZC0OMX3R745Pr5uHRLA0mAhxTmPqEqAbXmgHoOEGE9EEzOs6+FSL+ZeTBmGcas0CaPa+K/goKfdj9S/tHJngL9ppr0wTvocFz1WP7QAHUoVt4dxpCj+v58Q1Mi0J64oKtp9BoNTrRdYvgv7o11kP6JgD19oiKMpo6rswdd/0B0Q5xUwEzpkcaQL2MaAP63IXGrZkE65v3i+FdVqspqGvccz2N9UqPhzQTjByLY+fq7U95sqtM2gArNRLS+k9jrhBIMUm3EY14r5Vu0l6PSvhi4ehERzrpOdcowljj+l2//ZAdc7l+znABPCk6SdT5SgnbeEB8Yau5P7YrCN6WsXLVx+8iqnTA8GdqriFGF+IsTIrLfJWxiW1wcsYYofbrkMk+lC5NvDU++Q+tztOPkb1WQ6iG7iisEpz9ku3RUDDg/5nDLmThTR89PolS9H0klLELXtesdMLYNj7V9jczwVpUOt7emJqvrAa+rRZoal7Ap/QfTnjLqeHhvx
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(366004)(346002)(376002)(136003)(396003)(451199018)(5660300002)(478600001)(186003)(83380400001)(26005)(1076003)(6506007)(6512007)(6666004)(2616005)(86362001)(966005)(6486002)(52116002)(36756003)(2906002)(41300700001)(316002)(38100700002)(38350700002)(6916009)(8676002)(66476007)(66556008)(8936002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gCs1X7jkA0uUvSMI7AevlPXLz97afe5LZrmrAsbNQ6AbRB5sbIq8F+rhgxnI?=
 =?us-ascii?Q?S5LCwy71lEhCdlOdQW+vDJ4LkD/5STeHx5tbYR/XSSMmE+C8trUsM7M7gjaN?=
 =?us-ascii?Q?5EC92wfsLPr75UH5hZRsoZAR3zJV0sCYsSZkgCujf1rCdrTBiu73nserjdFx?=
 =?us-ascii?Q?6qOhkNKFYkFDT2LOtYl1Qs6DYaE8gFDA+isnj7IQ1LxlVtYTHf8O+rVvvNtE?=
 =?us-ascii?Q?dP6ByN0iSMyynRxn3NlZ3X3PVDc/Rc/HOQpEKO9w6oIKRj/eMzjp+aRbkpKp?=
 =?us-ascii?Q?LYVgeuszPsb8p4E9eURWgk5u5oaeOR1y74hhPm/ckxrW6HHBjsDEB/i75bQ7?=
 =?us-ascii?Q?72qykKbKQrvno3Wi+/inJEW1AhSoGmKAxEFbkB0khxKwuQx6Jf1mA7qYkMba?=
 =?us-ascii?Q?SiOuIAO5s5drXj1wLGZ8YIWd6fCR+hHy841IkrZF9i4Dng4Tqb1Cmdn7sIqf?=
 =?us-ascii?Q?wIKjs0BARnkWwDEMGVLUA5N7p0jXtk5/MJli3at9QkbSS44Ux7+bJC8vfJSg?=
 =?us-ascii?Q?DL88eYV5plsmH8VHZEiobyUaswu7QM1XwDmirPhkuHvvslBNyL88EBtNHLY/?=
 =?us-ascii?Q?UFrKKsLfPNbYT92TM2E+KjakxMWVQtr3O2Bm4gdvdg0OzB1kql40LPOdRDpR?=
 =?us-ascii?Q?87ia0+mks5UO1ikfWLbT/1lMljQtPFY37LLjAREEwJSamT9Dl1gcLrMupx2V?=
 =?us-ascii?Q?Krv6G8Y8fA0T+ucPh9gezvM8zft0wu8GzL1kqH3CCDNaSuOONDk38cajjsBD?=
 =?us-ascii?Q?105IBYa2E8Cf9CiS4kHDEWbt+HyHHffeiamkefVOgb5YQ2GjPeMY+mIeuvcG?=
 =?us-ascii?Q?p+dJZCUHLxV5obMR77rY4Qi+Rc0UFoOlvSj2EGBOY9EhYf5NO2behaHZpRz8?=
 =?us-ascii?Q?NFSc6Vt6u4E/V7qN3EAufsHQuC/PuhQGza/Qa8RRJOam4LXkUSqA+42Hc7Cg?=
 =?us-ascii?Q?6XNeVejK2rm9s8+JA/AmLtxT6SFiUjNtLLtAQ4X4XeYAiDu7x/SVAW3oYEHH?=
 =?us-ascii?Q?5IswJWSg6s0lGfgeb8fOzhAIq/pzUk/KTeVOEbZwlBqBFBKIL/ESVNsOT2S+?=
 =?us-ascii?Q?aa1iCEsd1LQ5IbyTDMcdvbtRWX0s/leqtBXXGiRV8gERnDimij4Dc1IliXqA?=
 =?us-ascii?Q?00eZJkSc1cMuf+y7jqwOsnw6y8ghw+qHnYwYHTknPhegb49i2spmaicjA2VT?=
 =?us-ascii?Q?rXhPl2B2HVdJ+yIRPo6Fi1m7rxbXCos7a2864uMIO5MQsWZAM4fEvBRls0+K?=
 =?us-ascii?Q?wfmKvVxK9zn2E6rpnY9H+PCH44+mFpgVB42hVibIpr5yYjtVe+uelnw6EY9o?=
 =?us-ascii?Q?0TuAxRYApkfEkBH5zla7vrUfS07AE/FQQS5L5Zhe6cw25vfzzRo66vtOfrjC?=
 =?us-ascii?Q?s4qxCQXE0OgwobFmUxVNhmzaaC/XZoWH7EBvn22krbxk8M5/hkfGUr7D8QWa?=
 =?us-ascii?Q?sPAu0Ut9pYf3Pg84M0vEeWSIDiyKSQDtBkMRrTuQfPSaymKftOPdSuVnhVqv?=
 =?us-ascii?Q?73AmwUnhaJnhARIpVCbVMkN8P3BR0NHJLk2JLEjLFnVLe3Lpfjd4Cxvgo2z/?=
 =?us-ascii?Q?X0pReL+sSktBRVz3brh9Nc/EbGZuBSrsx4owmNP62DsscEETyYPdTHCredJy?=
 =?us-ascii?Q?gQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8ca137-8b71-4609-32f3-08db1a3ab4bc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 09:52:44.6808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7S9scfYTohap9/UAAc5LR/CujZRvJN40oAD7fu/53jpew0wcUQMYW4+ZBXuNicoaaJKEsfFHwA4pOe3OsQTCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7160
X-Proofpoint-ORIG-GUID: g3Ca6H_k2p3zWoh6fUzoFeUdvdJ407Gr
X-Proofpoint-GUID: g3Ca6H_k2p3zWoh6fUzoFeUdvdJ407Gr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-01_04,2023-02-28_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 mlxlogscore=946 mlxscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303010081
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Mar 2023 09:52:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7919

The /etc/containers/policy.json[1] file is used to specify verification
policy. For now, we can see it's used by both cri-o and skopeo. To avoid
conflict, we use container-host-config to provide this file and make both
skopeo and cri-o depend on it.

[1] https://github.com/containers/image/blob/main/docs/containers-policy.json.5.md

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../container-host-config/container-host-config.bb         | 2 ++
 .../container-host-config/policy.json                      | 7 +++++++
 recipes-containers/cri-o/cri-o_git.bb                      | 1 +
 recipes-containers/skopeo/skopeo_git.bb                    | 1 -
 4 files changed, 10 insertions(+), 1 deletion(-)
 create mode 100755 recipes-containers/container-host-config/container-host-config/policy.json

diff --git a/recipes-containers/container-host-config/container-host-config.bb b/recipes-containers/container-host-config/container-host-config.bb
index c762dea..c2f17bf 100644
--- a/recipes-containers/container-host-config/container-host-config.bb
+++ b/recipes-containers/container-host-config/container-host-config.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 SRC_URI = " \
     file://storage.conf \
     file://registries.conf \
+    file://policy.json \
 "
 
 do_install() {
@@ -15,4 +16,5 @@ do_install() {
 
 	install ${WORKDIR}/storage.conf ${D}/${sysconfdir}/containers/storage.conf
 	install ${WORKDIR}/registries.conf ${D}/${sysconfdir}/containers/registries.conf
+	install ${WORKDIR}/policy.json ${D}/${sysconfdir}/containers/policy.json
 }
diff --git a/recipes-containers/container-host-config/container-host-config/policy.json b/recipes-containers/container-host-config/container-host-config/policy.json
new file mode 100755
index 0000000..bb26e57
--- /dev/null
+++ b/recipes-containers/container-host-config/container-host-config/policy.json
@@ -0,0 +1,7 @@
+{
+    "default": [
+        {
+            "type": "insecureAcceptAnything"
+        }
+    ]
+}
diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index 2597942..d74a17f 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -57,6 +57,7 @@ inherit systemd
 inherit go
 inherit goarch
 inherit pkgconfig
+inherit container-host
 
 EXTRA_OEMAKE="BUILDTAGS=''"
 
diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
index 12a24b0..e396e3a 100644
--- a/recipes-containers/skopeo/skopeo_git.bb
+++ b/recipes-containers/skopeo/skopeo_git.bb
@@ -80,7 +80,6 @@ do_install() {
 	install -d ${D}/${sysconfdir}/containers
 
 	install ${S}/src/import/bin/skopeo ${D}/${sbindir}/
-	install ${S}/src/import/default-policy.json ${D}/${sysconfdir}/containers/policy.json
 }
 
 do_install:append:class-native() {
-- 
2.37.1


