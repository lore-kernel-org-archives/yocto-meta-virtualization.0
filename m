Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95217C7EE31
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 09:52:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.18344.1677664369931036877
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 01 Mar 2023 01:52:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=QlnEUd7x;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2424f77153=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3219DswT023627
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 1 Mar 2023 09:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=cl+dNoHoq6D5BICbMTAc8YQIHsfnbIZcFdoES9el+9E=;
 b=QlnEUd7xzqMabQVhch4SvCCh+Jz5R2zVBmuF9HuaaaQye75Jkvl0yIL1JcpUlXJBvatR
 MxLQLnUVIdbx5l4R3rQw14ZukIBYD+Wkf0+pYmRSaQe5H/vcLcL0s5f847+mUChEYz/z
 Jn4TDS1WV8bXpTr++naDzDTwWY/6mwF9QIp1qAWAcgboK62NGuQf6zVJwWwqpQ7Zlcdb
 v1RauJUisTAouzxgXZaqjNr4xouKxP8P/DWV+n2jHPjTo1fhinuAqLRwdA5uTdQZo0Ma
 uhBiG1jYIZJCAHzM18qTl1culqxxeT7RWaKm24q9h53CLFIBZQD9PHA7ut6D4G+A8lxD dw== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nybnwm1vf-10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Mar 2023 09:52:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XkFwB/wNzQqm6HTR4SdqTTuONYxgyFyIfP1enm3hhP4XgSqab7nlAeHPUixMCKtYVTtyxqhwWqnW2JSlJuvJZ1ta+y1Qr/pneGdiwFlsJi7phr98Xo3HDCPRxC4rKNq1DwlXF5YjfzX+xf8S3swVjeZuLgGEd1cKO2h3pF5VYlJFjAn+ThVa6oTSKl5PAbaUQWMIYtbBhV6LIvJV2YKhop6qdF4gryDtOsJn4V8CIV3FJuJcXpjRXnB39vgMbfK5+C2QaAd5MCOq6N0pCVbPLw1WSTX6xCa+hqT7p9sZWMlMoQxLgCIMBPfcWc2keWKFqmjvZR4q9TQALXHih/3McA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cl+dNoHoq6D5BICbMTAc8YQIHsfnbIZcFdoES9el+9E=;
 b=XX/c7pL1c7+MVs8RFRzUIfvqFwdGdE6II0S43aaSLch420HPWhnv1icUG7O6QDAZ+GcWOft5O02BHB2MNUP4JH7Ht/0D2K/o04A+IQ4wXXf4DNIJfCuYLPMx9ss2kTHIJD7xz0TY+WNLl/cRHyGxS1egCwVhpgn31l6G2Fgga0diRg7GgbMcO7Z4FWxT8SozUw0fQ9qiFQFsOV2Fd+9jk/mn4GZWj2HX2l1ZpYPhqpN8a8QZNvF0g1XxTW9kdx22BL3NYnz+soL8no8GQcc2541CCDqjHbGfm7a44XvIfeJ7oggo8cJHZPHwDimHvSs4ZDGMT6hDD3InoE0PF/tWxA==
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
Subject: [meta-virtualization][kirkstone][PATCH 10/10] container-host-config: extend to native and nativesdk
Date: Wed,  1 Mar 2023 01:52:28 -0800
Message-Id: <20230301095228.122562-10-Qi.Chen@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 28f008bc-23b7-4252-7d73-08db1a3ab4e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0fEGUjL2rc27tKqtGvg6aIoOJdS6RKMnhzxTttm122OtrHyQUE79USTE96LZYJnI5zB2PDBjQHk3VsFwQC11egQFlCrsoJm/Py16jTYvhkR//Ti6/zCkgZMrWlHYkkgL1MM9FT4vIcNdcrQIdgHEo4/+Qt/llz90za6j9cHbNuo4O+XH9KQOXLTbUJ1lX+juTu/JbjMXMlMwJNckX5jCfM3LsbLrsHkXjPMff+uQqtSOHfWrt0usyiUM30ElNt+2ZN+7LfwvU20GZ4EPeJYHfam3QQYifOiJ7CdtyTQQ9B39otUiKgit5UDHQdglHWy6Yq6HEsCqxO/Kk/n3A/dQtCYQtv7/nE81mLCP+H7+k2ATJyIyIUY6nroESLg6FkXsD0SrB/RMJlb4tJ0agnNu7eYZqP0v4mmCTovVUrYUFs77Zuiw4gks01yq6D4Wco5neSs9vWokCzvNOLx3pN21lrQE9ARHMCjpJZJd6tIS3C/4VqAMVGnMscY/gcAa6zFj97q1X4nFxymvmdo9RHfDzOm9YO3s/I1uSI4vpfTpZ9wRGx40euMtUCLM95v2to2UuTBO8opnGbYOonOU5B+q1vL/+cukZb1R9cFxhoOM1g+bzZ7vC8eL0kUPZuFAQXfa2A+qWdb/VY5z6uBhP2ycraktd5nayDOYKPX61+7f/wp6pAuoRDg2rTybFDwpwE4KuxVml6Vj8ldfEAG5nr856g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39850400004)(366004)(346002)(376002)(136003)(396003)(451199018)(5660300002)(478600001)(4744005)(186003)(26005)(1076003)(6506007)(6512007)(6666004)(2616005)(86362001)(6486002)(52116002)(36756003)(2906002)(41300700001)(316002)(38100700002)(38350700002)(6916009)(8676002)(66476007)(66556008)(8936002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2s+900eQXUVudjQ5rCGX2RNzQzzboyKjAgS0JJn39J76At5hR+STHFxdE/60?=
 =?us-ascii?Q?I9KXyTeWNLjbTGSW2opdj2kU6RWjCqUg5BpmgQHmdNs26/bPmSRG6J8XwAQg?=
 =?us-ascii?Q?HPyMcWVMh7yn+CIVM47+Nz/5BZEwXsXB1MbUPXwtch2PwJfHpxHlyTZJIo7/?=
 =?us-ascii?Q?DsjhBjow9B0Glq/qrgBwvGKRfRYZvOsb2fxDKR+5KKhM2DLCt9e9QJZFaQqU?=
 =?us-ascii?Q?mAKd7hgGvxl3VKzpIFc9fOxJsx0tN2aX+hFdiZWisn2mi38V7wH1Gx+gKE2P?=
 =?us-ascii?Q?rDQNeImO7/klxaPIV6VJQC1zvzs+N/2sjOTWXWTeVOcsKxiHgTUKnTGykVU/?=
 =?us-ascii?Q?jkp7LGT1DfAZxy+AAcJMbLJ8qI2+FKrkMj4uq2W/ULNH75OYIHCgz3eUtChh?=
 =?us-ascii?Q?e3yMGypYrhgYj3Kv9h5qCIE4P8CuxOZWUICg2KlAKb1fLqtidFQlzL6pMyjl?=
 =?us-ascii?Q?ULF1fVDQofVIPNHU2m+AqGVLLXdsltRYkie78nFPsWxP+xkzFtmKJxZua7aM?=
 =?us-ascii?Q?5NNU1o3oRiBA897lV/5VOSdygKY8SKQMi5Ov4ZVedxb0F7Fvlk0bXbMeaWWW?=
 =?us-ascii?Q?OVn9l4yq4Oz4IfKNhzvGJN5tzTrkfHdLfNo71kexTVKlM5TIGAP/hw/sATYL?=
 =?us-ascii?Q?c3isZlSDgkHLoiKi0uTRw7+QO3WwqvavL3Omnp/mXsyn1ur+t6+WsmlhzLXc?=
 =?us-ascii?Q?9T/H7RMdyq/5Gz9vAV3vcLn78hHpSddQrAgaROPgPFzrzcK1dRQzUwY5O1hm?=
 =?us-ascii?Q?hrmcr+2kC1Mub6GYINvU4LRcYAPpr3qBdoFet+BzCRK2PKnZdmk1Fj0vOAln?=
 =?us-ascii?Q?JSsTqO8kAj93i/vA3aMaMKYsdZ1hwmMPcdwedLlNQsqRweb14drVxfe/yMyZ?=
 =?us-ascii?Q?rVDnm9g6njlnY5+i+CYxpjmAWql2dMqugB4yWPv/6C9EhFR65OnC7fcUhinI?=
 =?us-ascii?Q?/QUns0ynoQAHnHw5hmTnuekkxbzkwej/O9hB0jbUV4bk00jR3gMQ+vJ/bpUH?=
 =?us-ascii?Q?lzq+K926jW2GzHccpT2+9FgtDW3KiExrhAPQvyNEawLa5aMdg8B8jinXqPcH?=
 =?us-ascii?Q?H6tRhoUxiI0C65TlE/kISkKH/5KGZfZeLiIA+CZA5S9rgtIvGJ65yaE+yXlD?=
 =?us-ascii?Q?44nvOOiRqTQ0dEdFWdTD13Fi+tp2zd3Jb9zJLN859SBGZyLIaJRZyBinrZPO?=
 =?us-ascii?Q?91RU0ngvVBl8NrqdOoj7yLpGo7O0PzIMlydrHzZtS3/20S98XRQNkkfCnxKc?=
 =?us-ascii?Q?5DZwC9zjNzUzGbn19rIWFLsgXzOwewW8XMULqNChtZPitKuwjFGx7oWU8eBk?=
 =?us-ascii?Q?dtH82NAbvgiDS4+QWNMAnPWZGZTMDgCWcOkf9tlJIDEG/S3OLxpaA2R7kCFs?=
 =?us-ascii?Q?mwC5Nll8UCrODKlfJWgpeV4CKXSmVDlFEwVeBEdel865JibEMa6F/5rh4nUl?=
 =?us-ascii?Q?Z1/EAFHEPUJbKj95yvwEC3o4eblJpSudHdnNiCnvksrz1FgXWJdkFKAyNG9C?=
 =?us-ascii?Q?ksYcrp9YF5sFSFXzQ2+crfs08WZ/deVZaxfX22NTFJSt9zaPNBXEnHbqEsPB?=
 =?us-ascii?Q?r16z/pyyNgqotAIjPRJvp7cEkwPEAUZzv46BsBWM7OCSJHpI5oRJjZDIo0mg?=
 =?us-ascii?Q?JA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f008bc-23b7-4252-7d73-08db1a3ab4e9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2023 09:52:45.0107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vQIPaI3VZgmXz3S9q1D9v98mDxum2MiGqp5h4u+6G+Hiq8Dc/X3AMuUvTlu1lxmVwEdYHpbKYT7PBWGQMtPmbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7160
X-Proofpoint-ORIG-GUID: MwCyrdLGj7t-65B3yEHqniKLtJsqkuMP
X-Proofpoint-GUID: MwCyrdLGj7t-65B3yEHqniKLtJsqkuMP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-01_04,2023-02-28_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 mlxlogscore=922 mlxscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303010081
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 01 Mar 2023 09:52:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7920

skopeo rdepends on it, and skopeo has been extended to native and
nativesdk, so container-host-config needs also be extended.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
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


