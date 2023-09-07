Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52251EE14D3
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 06:11:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7166.1694067094004704102
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 06 Sep 2023 23:11:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hpviHsO0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=76149ecaf6=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3875puKn027880
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 7 Sep 2023 06:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=Sz8M12wi2xBTn31PTm
	xd9k6rI3o9oBo+DPNoTy/dj5M=; b=hpviHsO0vUIp8taJQ1GPC2CsWn2qPyDGUb
	+lNFrojdllcHf+ZcTOmTaC43O7UIGTulZ13k/wF5dcSd8Cf6+iqBqDVeHI7O1Sz1
	o6N8Gh6wMFcd5KK/hslPEUNoezD8JxiAVCia1xnifyT9xx4h2chGcdCgofaa9t0m
	KPJ5H7V+rdrVD3YOJpv57w+Em+/lkEvXEcBbApkxu9cvE8XuNS8ZolZ6PWdrkWzg
	I+iA2/b30Qo08Y/6JVl11BiYd9E9d9AEF3yduQroC1gb00A0o1hzNO7ek813Hzy7
	Of+QuIDCID+5lXRd3eqVoVhXtknPkvyhgs51uwOIlmnFoFliQtAg==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sw33k3544-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 07 Sep 2023 06:11:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IMXOmpbbJr1MeLXGRBIO6kgcRAUHHqMsooeqH2wyDeKYWgrKelJO82Rbyl+UBgQsLEcpw73t83070YBsbLKt/CbHpZc8nBndTmu2OpYR3q//fCpTmYh5P/3dDnRXOkZkNgevUR29k5g8ZewFmzoW3QWimSaQtZcwDS7ekbhmPDfgrmGvh8zOV9+XQ49JY0nLBANckk4XQftwLWT9HENGTXV2ON76g74ZTrrf+Nvd6VP/lVRsxLMUZmcYmPSpymAbSJm1F1zw8y1ZUNDf+UAu+w8ac3sj2EQ60AmtaZLxXBcenldPaPDl+JpHd6oJq3m7bmqdUcJasHr+OIs+4O0WMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sz8M12wi2xBTn31PTmxd9k6rI3o9oBo+DPNoTy/dj5M=;
 b=WvJiLQeHFQyUncTG3tRkIMtW0bMdr0thoGn3aaljZlr7bc2Ge0/nEF/fHd5fJ6cYoOxc1jkJCqTCaNyO35JtXsKa3IW234+59Br3Bkzr1UIZMU/GUgR9MqJfrrNZRaYHn5eWlPyIMhMFWKoO5fMHv30S0q8wcpOqF2Ijz+qBVqE6OYg2hbzS4jilwXfD3hohlNcXgGoG2T4fULlEDzvzrLYEYet8rToMjtVcQoDRCNhss2bcJx+TpJ/9OI0CN9ujsLGe6ywOUFdrM4P9IhUbdibvgyn0lkw3WD998IWZtvC96ttsMH7CtvZcPeT7yxwPCb4ccgyvmjcYZC9oD4uuOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by LV8PR11MB8509.namprd11.prod.outlook.com (2603:10b6:408:1e6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Thu, 7 Sep
 2023 06:11:28 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d%6]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 06:11:28 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] docker-compose: fix installation location for multilib
Date: Wed,  6 Sep 2023 23:11:14 -0700
Message-Id: <20230907061114.35142-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0296.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::31) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|LV8PR11MB8509:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b832f8a-f370-4ddd-8aa5-08dbaf694574
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yfXKU9TIgKIy9hZyMI4PMRxRMDtpJ4KQ3HoVTN7kDhEkhkV0cLYqquJPzDM+ixQ6hkJUYxv5LH4JAV5M8PFOQ93BWoRFAKZfSf529ioNjeC3uW80i0SdeifAr2GzGF7wpKP3C4IMfNH9wgm+0o7Rjd9WAw+EAjgqB3gRGTij5rYIxo9tiGcXiFpMRyZHD15MN5RSFbzcYI1vq8fE12lpwf5Rq8DySgyK7Eq3gV67z2n6MRKzzIyHRtyf6TGACp1T5Aau1GjFl0NFBkzaeSch6xaBkrhWyefGXz2Y4NZTmCVtTNxtYDddVGbco6xfsMiyqH5KnhaOTuSMoYs6Bsh63mQNhkdWdT+NRNPc5Gyxgzc+mONBs5OLKR1J7iT7kgJ4s00sT4F/x0G4Rt2xy/WIhMxAlQMOI/h4E5/0LPnhxNEqqs9AZQKpU9RAEVYTG53owmLAlIMLEiU5BDVepaghZJPpQUQ/3otKFQjjuX99BKCqqUuCSeNNKk/iJtATdKCFikRIsFWdBaYjYKlWEH52AclqjbkZyVsf4J+VHpiqjoH6ikEsjevZqJDKBRZVHuxs3HP/Zw3cwGUJLjX7LRzq0DO8EFLhXaDrI3Gghj7/Js7mg3gXaOVeUaL0CCs3SGF2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39850400004)(396003)(346002)(136003)(376002)(451199024)(186009)(1800799009)(6506007)(52116002)(6486002)(6666004)(86362001)(38100700002)(38350700002)(1076003)(478600001)(26005)(83380400001)(9686003)(6512007)(2616005)(41300700001)(6916009)(66476007)(66556008)(316002)(66946007)(5660300002)(2906002)(36756003)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PGkwsrmM+0qheymzRsH+d0LX4SCsgBgAsLSurxZPnRm3CYdyyh9q//UJFvHF?=
 =?us-ascii?Q?p1xndmAsShXEgIkhltyjwkblI6NMRBRtkNWlqneqZKAS7MqnbccBV4gabwMw?=
 =?us-ascii?Q?YA3qj3jVt4e5CtKbXIq89q6vMgtsv6Ncx6OZ1ZbZzHOS/PUNpO1Ako5RdK+r?=
 =?us-ascii?Q?5mGmRgudv4cT7BJfG4Axcgbt+STCVI7Wk2BCw0yN6pwP+KmhiCZNqED6Kt4C?=
 =?us-ascii?Q?kvyq8xdfzEx05zrg9kLQkdIZNINxtfxkS8yUXQ55c7k+9e3KRQrl9M0LjQsB?=
 =?us-ascii?Q?vlBfaqFyXeq6F+C6vq38BrFxU5VlD0i5emTXyem6jwpHCCmzk12cN0MiubcA?=
 =?us-ascii?Q?63XQLsqSjprSf1tOEoYPELvJF76M0PEPuZ1BZmtCOx+9PWID2h2ccnuiejMi?=
 =?us-ascii?Q?JxkAaNdb4d7Bitac23rs1+Aw2m0bqFvsfxZ5kdKcG2qRMOgUiE0k5mgStaAa?=
 =?us-ascii?Q?QMrCcDB32HIilTkqxe9srmPDmdccHy7APtP1dmFOTnK2dpTQ7DXGREf02JQT?=
 =?us-ascii?Q?RQpplXUwaEvSmHsZSNXxO2LgvTWZ0g36uw0qPJgeaB3dNLN9RXhLx5Hmm4G4?=
 =?us-ascii?Q?b0TawQvAPHCYj0Z2DlxFMn9bm6+/2+aW+mutLdAFztfw/Y/wvkhbdQGnmqGJ?=
 =?us-ascii?Q?tqYL+FVq5FclK/aDwIWIqYdutY4Yx4RrxX+T+63i8J46uT19wj/H9l14Ew5e?=
 =?us-ascii?Q?wdWJOoEr3dTu/Zcu4+H6ZpdOuYgP/CflD1eraLUUhhXsMCOCmX7wysS5S8Q9?=
 =?us-ascii?Q?UucHHtjW2xEa9nHv0E98kPcAIHHUekQ1tQgHryeYCxMzFyY/iP16Qnv90AYV?=
 =?us-ascii?Q?2pWsuCC6sk7jAkd/hoCYqoRniQXe89hYW/1vi+k851kKTYUpNfHduapd/b3H?=
 =?us-ascii?Q?mwZIb6wqVMpAKfo0yTHxjvadtfFxNMlXakRmphIsuPYSEPSad0e6VVxqk0CW?=
 =?us-ascii?Q?Li3x53UqM6ayR7LXSvS9I29iUEzo8E4KJkBlWbdXFCOj8Q/r1ycYd+ClCqUS?=
 =?us-ascii?Q?rV+TApIb42TgclFyUgihWaNCcailpCl0G0mfc7CYXVm7UuSLFLLUmUGJckh4?=
 =?us-ascii?Q?bz8oqzKFBSY3UVlq0G8Wmf2NZMX6HiQWpXBHV602f38gH1EUZ9AK5obzXimX?=
 =?us-ascii?Q?e4D8T7Ws2Spetz9G2M4CPGOINwzy1MlMWOWqDi4C2Ktx2JQ7U2rzUKakfUiY?=
 =?us-ascii?Q?1KH3IYnnopvNmn1Y2d5Kt4EJMLaNPmQYyFlOEUVQVlX/4xxjq+8gZDd0zh/3?=
 =?us-ascii?Q?nVmQjjuw6CSzP32RypcWmn0uGxTlRnslGa1RLkH0QloHDu5MxbeviFDlpIH4?=
 =?us-ascii?Q?e887zwYjuKG0OCer9QbVA0BDbmK8+ZP65tvcWQ7LbCOPFN/YbPRVwIUV91Wv?=
 =?us-ascii?Q?eaDeS4fZrG+FiFUjI+ZbZ67N9KDS2aYxpUsxI5dyE7yB0e1sFsjT7agh29BS?=
 =?us-ascii?Q?qtSP09GAYD9WepSAGeT6MVBG92CSChHZyoVzp2h1pHdPUZimpN1BSu7AQMnm?=
 =?us-ascii?Q?CANp7uTi/cd39H5pPmOEzsWpsmnauJ6jAvjDxrpCwPybWi+fo2ck3b9Wx24a?=
 =?us-ascii?Q?ADO8stLWd+ukVQxvAUTCqovmIN3Srxx3gbEb3r3a?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b832f8a-f370-4ddd-8aa5-08dbaf694574
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 06:11:27.6589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EjMd1sLXtJOSSJ3imq/JiwTHNJ/sH5nKdJpHHq+RNec4MRp5bfUA2bE9qZZTcY45EHCDoP92c+ICy4nJ1O5mFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8509
X-Proofpoint-GUID: TgSFv-pgNpkkWnMBpvzOOasZceoGrkNK
X-Proofpoint-ORIG-GUID: TgSFv-pgNpkkWnMBpvzOOasZceoGrkNK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-06_12,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=750
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309070054
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 07 Sep 2023 06:11:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8282

From: Chen Qi <Qi.Chen@windriver.com>

In case of multilib, the location is /usr/lib64/docker/cli-plugins,
which cannot be recognized by docker. We should use nonarch_libdir
instead.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/docker-compose/docker-compose_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/docker-compose/docker-compose_git.bb b/recipes-containers/docker-compose/docker-compose_git.bb
index 5777eeba..ab85a103 100644
--- a/recipes-containers/docker-compose/docker-compose_git.bb
+++ b/recipes-containers/docker-compose/docker-compose_git.bb
@@ -66,14 +66,14 @@ do_install() {
         #install -m 755 "${S}/src/import/bin/docker-compose" "${D}${BIN_PREFIX}/bin"
 
 	# commonly installed to: /usr/lib/docker/cli-plugins/
-	install -d "${D}${libdir}/docker/cli-plugins/"
-	install -m 755 "${S}/src/import/bin/docker-compose" "${D}${libdir}/docker/cli-plugins/"
+	install -d "${D}${nonarch_libdir}/docker/cli-plugins/"
+	install -m 755 "${S}/src/import/bin/docker-compose" "${D}${nonarch_libdir}/docker/cli-plugins/"
 
 }
 
 RDEPENDS:${PN} += " docker"
 
-FILES:${PN} += " ${libdir}/docker/cli-plugins/"
+FILES:${PN} += " ${nonarch_libdir}/docker/cli-plugins/"
 
 INHIBIT_PACKAGE_STRIP = "1"
 INSANE_SKIP:${PN} += "ldflags already-stripped"
-- 
2.40.0


