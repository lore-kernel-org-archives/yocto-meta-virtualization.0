Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8501AC64ED6
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 04:54:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6491.1676868881099292359
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 19 Feb 2023 20:54:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ljZ+bJWt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=14150b1c1b=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31K4jmoU012246
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 19 Feb 2023 20:54:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=TA86knNMeRTlfoWmrQ8xCc7nH7GnqgZwdZQeiu80+jk=;
 b=ljZ+bJWtPmyV/1+KHYdWvRycJUNXmv0uNLQLCGId+XEPCg8256ETzFbSXit3mD4xiovC
 1HVxBZW2NlkcJzExW2xPqGteGd/PUJZxZA8m4WSauVhmIqSefX4D3e3QQxBzxo6yG3j3
 hpJI8aTHcyTa+JlkdoYDuGdAjGSavCzdbAf9f9E0ngK24lJYDDvw9/PM6xq6MApoLvBS
 TP/8AG5bwaPjPAQTTgYRuvpoTQwked4oxmeVTPJAS+Kb1ufDGejcVfvG575eUxPJj4Lc
 /gyFIN47oxH/k6cKTggTxuUWjzvbh+UD3qK5Kf06ZM+9h0VkmIxhOt6pnzo2t3yFGqdc iA== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nttu6s9dr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 19 Feb 2023 20:54:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FvKtgBP+T1RnS3DI20euV5fyNHsB1trRYRiZ21zJr6B4BB7Zf8GmehcYP+V7itfui0u4YexNAxCoffoh9vw1nHd6aJv9QokeW/zeI7mgzu/DS8m8cichksk+ER8rWVT4KLqFbVJntbzA7xTlt4ZQ89AHnU3ccdQjemGtIrfnCRfx+mvy8NQLF6WgkGxogoWkXD8tVxMOMuL19eQ0/LsIh0CZCk9K9k6vlLuD7/EUpNsx/QEoQ+jduZVec3OehLIJ+CCTEqiFNdd8raC2dQTxWM3hgXsTMnv04+iLbJdxHqUNEPIEKFDMDql53FdoFPKZJ+scjuy9vyUSdDa2RQNMZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TA86knNMeRTlfoWmrQ8xCc7nH7GnqgZwdZQeiu80+jk=;
 b=jTTKj0Mn7DmWEox6FEca/hII8Zc2kySnWyrQI1GpfqfI0LVLaShasuiFox3kjQoxHpmHCqsUImD/KFy2bqIuFDjFCE1QBkuQy6iiRe0b7CNI/Pfv/oWTjzzTCC6+ZAXVmueMpg5Bi1QCNQv+8ISAS8U4ps20icM+2Aphob/J3NYHqwreoKXBG4LB64V3vkICkwyck5J/hVvxOvue0EoOhQ6+4oqUX0PBAY2fX84IL0/aQyf+8hlUJ9RCCzg8yoRficOjkPygsaYM/cwoHlB7XtexaktnPxC+M162r7+QPOHlU6/tNTfP56fw1gmNUoBGrQJA0m1LdHTs3h3apQbZwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB6794.namprd11.prod.outlook.com (2603:10b6:510:1b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Mon, 20 Feb
 2023 04:54:37 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7785:8a09:29b7:44a3%6]) with mapi id 15.20.6111.017; Mon, 20 Feb 2023
 04:54:37 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][master-next][PATCH 3/3] container-host-config: extend to native and nativesdk
Date: Sun, 19 Feb 2023 20:54:23 -0800
Message-Id: <20230220045423.84802-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230220045423.84802-1-Qi.Chen@windriver.com>
References: <20230220045423.84802-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:a03:217::27) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB6794:EE_
X-MS-Office365-Filtering-Correlation-Id: 556682a0-6c20-4728-f4be-08db12fe9124
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kaJiK00Jq5wZpqzzu4kHMxj+GoTNba08sWcZQ5j+LDAfcRucXJy5T7MTF9QpqKMZgJ2USN5nlc4T+YP44UoskKDfVI86Q9HvKWysqpeMLDktsWhxKBcHg2TvS0mhoAXLwnvD2cNZV101reb34+UO+OlMPHvVgjnltP+ue8r9v4Zpqo7g1qp1jbCLnA0WHA7sPx4cJLUTUyMsq+edHC+Swa4JKbGtMvxQLHnPn3/NGS03mpVQgW9KM+vdrBG6TBYRRSm/dgprBWi3PnPvifLoZhUhZl+yzRkQl1iJbWua+QTsdUp2zULQLEwdVSwgF1Xt4w+daR48ycBPuhNrTMNKiUYtooHr4vBJxP10smZBs1AuhkCky/ZFc/ghLzGo8IGev2Cj8dA7rlMGzEm0Jr89hvX7gcnM4wEwKh6fuVOganNKeMmHYhkSrnXGaa4yIfLTBRAcxWVc/D0ui5ihBb8G6wnXJ4usbmeZ3mjw0PeI0Upq+AsuoTTytXDMg2sVno7C40Si69P7B70rIAK5DbePAjvZQE2X2ivWQGbDU2bOqlmY4F9k3EBq2tWxd+kxCnsfjWCY/sf5WR39P4ZlAtxPxiBCr5umDFLW3YiDH/weW1UAJfd0HyNBmbAw6KZwYB6l+kYXD9vUSne7WYx0PCMFD15el99EaQvKD3/1MTQI3FxITNtIz5LALKPpYJqHcfET6GCGtNxlLFL7TxLr/8xvjQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(346002)(39850400004)(366004)(376002)(451199018)(8676002)(6916009)(66946007)(66556008)(66476007)(6486002)(316002)(52116002)(8936002)(5660300002)(41300700001)(86362001)(36756003)(478600001)(6666004)(38350700002)(38100700002)(6512007)(6506007)(1076003)(26005)(186003)(2616005)(4744005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nMUw5HCZxGx497nWXtiB7gYRd1VuQvM1OhS1QWMccnhUy2DSP56GXDXw5t3N?=
 =?us-ascii?Q?aEHDJPQQbhyIqz90t/TG0ZY+Ngri4sF3nMgp6ltZYvRAuZ2fhoVlX8FEU3lM?=
 =?us-ascii?Q?DsIw3o8Xojl0XfiUjfzyNfr2IonPycHsEtRA8IvAxCoFoCWvNLnshhM0F/CD?=
 =?us-ascii?Q?7d9+VUq1/QHuSsotWNCGvfJXvpqlDdzrl6Buurf06o6Y0tlKKOi5X6AS7MhL?=
 =?us-ascii?Q?n+Z8XArioSuHLMtNtwGg1C5JpZKTfpsW+yOfWZ8i3QN7NF3wMUCkdkwhAmMS?=
 =?us-ascii?Q?1ndru7Wwbbei8+fcvWvDsWIIcsT6XCK/2C2bXtMCA47+OVP+3kr/JQxvICaT?=
 =?us-ascii?Q?Rc1lI+rG2ClF1fchJJstAf81gCrMe69aFAfMzug4BMHBS+oEc42jNPNkcnon?=
 =?us-ascii?Q?lEW+ei7+20rlfJb1f5NK2sHh4xRxa/wJzj++EMZPIyhEOUs4UBHBYLEm9TQ2?=
 =?us-ascii?Q?SMyQAwthw7lCLy/oq2/0/andrd6V2luhXNxVA/9EViaTNzPsIMbGbVH+Gmnp?=
 =?us-ascii?Q?Iz63A38Kaus+q85YEGeB5cd7lwtCrj3twBDmdIt/65xsDFsqTNMq5kvCQknK?=
 =?us-ascii?Q?M3zM+Gif4pAgNtULpKjcISc7/nQrOxC1BiY5qqj/cOlVzn/9pKBeTNuZ/knb?=
 =?us-ascii?Q?t9DFwdD18EdMr5zinRHZW4N27Yxo2tCoG1E6g4C/vVDOKtai/XdLDLoYSDYc?=
 =?us-ascii?Q?3gY0StDPFDLSaxd8MkIn7kKPeZ0dVSVjylOrNwAdTrOTMFn4hw00EcI36xnT?=
 =?us-ascii?Q?dVwTAOZ39typfSJXc1gcnq2S0GGHiowVMrHDmnjtwMhhD4CZmxBZro7XN0je?=
 =?us-ascii?Q?44DVIPLUgPYlq6Ody/E1cuh2P3EsBR0LZoJVKmP6toDYIwZ8hXoJp2QVsJ53?=
 =?us-ascii?Q?F/gDtEVY2mUDJux2OOKCGOO4Ha398sXq238AnlEa+LiYskCPoYGez0dcl9SZ?=
 =?us-ascii?Q?VJABD45VGgFM034KLxJQ//CH0hIRGEXoYjGza46gCAiarW91OX55vf38HRam?=
 =?us-ascii?Q?eoc1vZ1QQ5BZ7Wq7RmaIk4XelUpWnl+aqgQMNPRkROnBKNz3kN8x4egC3AG9?=
 =?us-ascii?Q?FQAxuqrpoNV1fiGo1ta0G1as6qt+bsGNTstg9YtaNlHG30qPvqJ4JgdRD816?=
 =?us-ascii?Q?dnJ0PnY7vgix4C/QCLpwujgSTQQ3Yl+XvIWGM9JcaCniwEp0VyKbSKM6MH41?=
 =?us-ascii?Q?pha0D7Rcob7/dBFLnW3kcbV4Co1/MGBs5YKPz71MdexD9XeWXe6w1Xnj6Ds3?=
 =?us-ascii?Q?JGTBqPe0ud63J6+I4W9FV7cPv5iCoDaH9IgMx3WG6nzjHnvXFdIXBsttqYry?=
 =?us-ascii?Q?/Z5L4gfgJAhINHkaPeFD8GfRGRKcWdqmMJ1zBmVhbN+4XasjUeGt2z6wLFoS?=
 =?us-ascii?Q?RDPdjbMAuertGz1P42Xb46+em4tfAQe5Yi6PQ1bUZu/6MP6xSlrjbTQUnHyK?=
 =?us-ascii?Q?IkN6FCelQ9ERR1a9nthF1glmNYsLY9Xgr/z+uDXLgD+Q6YudkB1kIRlxUC6G?=
 =?us-ascii?Q?A32qiZtmZTP+xozAW5mH//jNcd8jjLmJRDjJKDj73s6CYSIl1RHtce5qiHD6?=
 =?us-ascii?Q?bNh2sqrhwTAqvNZtkMXChRYJJctcXIKNRGUVvza2SOwKj+E5OWoGsfLiOWOt?=
 =?us-ascii?Q?4g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 556682a0-6c20-4728-f4be-08db12fe9124
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 04:54:37.0418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6cDOmgBRjSYnP6lz9R/uXiE21hNhtMsbzVnorSd9+jiZsBlaxgypHoefVtNBj95/4bwgateddbDw1EIV1EeRag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6794
X-Proofpoint-ORIG-GUID: atZZOGTcGniUgKXYMFtsTP6yPQWYtCC0
X-Proofpoint-GUID: atZZOGTcGniUgKXYMFtsTP6yPQWYtCC0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_02,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302200044
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Feb 2023 04:54:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7882

skopeo rdepends on it, and skopeo has been extended to native and
nativesdk, so container-host-config needs also be extended.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../container-host-config/container-host-config.bb              | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-containers/container-host-config/container-host-config.bb b/recipes-containers/container-host-config/container-host-config.bb
index c2f17bf..80abddf 100644
--- a/recipes-containers/container-host-config/container-host-config.bb
+++ b/recipes-containers/container-host-config/container-host-config.bb
@@ -18,3 +18,5 @@ do_install() {
 	install ${WORKDIR}/registries.conf ${D}/${sysconfdir}/containers/registries.conf
 	install ${WORKDIR}/policy.json ${D}/${sysconfdir}/containers/policy.json
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.37.1


