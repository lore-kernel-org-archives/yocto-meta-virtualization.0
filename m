Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF69ECAAA2
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 03:41:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.66510.1661744468925726046
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 28 Aug 2022 20:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=jxfP7oCU;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6240f7db0e=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27T3WQgU030042
	for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 29 Aug 2022 03:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=nk89LKuB/wJ/pxPqU8kbt1xg6AIJQEFWn6cjPAkF3mE=;
 b=jxfP7oCUgpoD8S4ZnfvcTQkZ/gh9IMgIlKnHUNA1Drn+Ahpfz5XlaMqoTrdRy3sWJmSI
 jkKWnDpjp6cG/Fc4SwsH4ZpWf1LFP68VC7WM1Xhve3D8KAIDSpaUAhTt8lmPqi7Gw+9f
 NfToH4h5CPNOdg7wz0h5rmU2KHhdjWITIIT+kbYTN1VZYucYZRtabbvNM8mBCTO0NBSM
 mm1/783Odx+r2xFRNVbiUnIeK7WAj7WNtjQv1wdM9444/q5QLTik+XtQ1WY4pBvKwO8R
 4uDlNAdFHjVfR/f0SS7ykN7Mj2JvxG9+9uRUiREBf3NOEE7kOdXQ1mm9BVH3vCuwnIQb OA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j7a89ham0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 29 Aug 2022 03:41:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NqknrfHgVdQY5O8TCaJdoyXnLLhq+PlMCKtxIfc2WZRgogz2qOUBWp3dDLjjSwLdm84CbwTx4gV4boHcj00LePh70Jy2mPhyer4AVUXK05OaH4coUPizApWD5qQQfqulPQyNBDDEoUK1NXqIuUfxmlznUVGXkZBj6MQ6RL7dHf5VfZxHlycytHcZrhxVMxJKkiuke5BgBQRM9bAnnKHiwiAD3nRwoZ7k9cxR7y1jf+253hPzBVttF+TNRTGVCHAX5E9+6DDFE2qn6PaLAB20mzrMgCMkRccaUG9XiafoAijj8gIQMpA6esaVaDrB9Z2Nys4WbHZwxzXCmPmBjA9LLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nk89LKuB/wJ/pxPqU8kbt1xg6AIJQEFWn6cjPAkF3mE=;
 b=Ehhr6omFGcxy8nv0MmtLOuLbgScphP9zKpjeNj8HFANVH4JDg5TWQ5BDe2+1+FN7KXKXH1K6HpdG/jpGIOLH/b973eHl91qcsNrBYI1Sv2MFvDpA3jxIbQuL8xonqLbFtF6hmOtnltZvI2ijJYwgT/Zwh4qWilIONZ8Nl6YOm9X2DQHzr+5ymbw6oFJ2QBz1JB4qaNRFG/VtDBGf5nxSRYEmNf5b9OMUuPtGBObym0RdtoZEBNWKXvdM1AS3qGCFCfWqsbasQtXi8sesohHyaX20YfbEOVCIF6Iatk1v4RaFL2tN5cL5OVCXHuiEpDQX/DayxFgraYAmGvGM+eV1yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS7PR11MB5989.namprd11.prod.outlook.com (2603:10b6:8:70::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Mon, 29 Aug
 2022 03:41:05 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c112:6e86:1bdf:66ed]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c112:6e86:1bdf:66ed%3]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 03:41:05 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] nerdctl: add -trimpath build flag
Date: Sun, 28 Aug 2022 20:40:54 -0700
Message-Id: <20220829034054.12730-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::20) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 739179a8-683d-4554-c7cd-08da89704d77
X-MS-TrafficTypeDiagnostic: DS7PR11MB5989:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JhdimUK2uVdRow8fe4RWjQaiDjlwFNRTeKpbVu/wN25Gzgl1zSNzDLfbhCAXozFEKsDiHSLQwx0Y+K0e8ngZZObS+880MYN7bNLZN/sNgP6rXX+zpL8q8AFc99ny0ZUOMTBKc70Mt9TgdpKiGP0ZdT4LlqTssQUrmpVuVVnwoFWnTG56KDHpyZPn8x+gTfWdVuUh2mlbztMs5A6TqlkZ5XnDsQszCU72c19jt0ZrwtjhL8wxUcPVhSWPHvbF76+WR/eMmoLWBdgn5jSHAjzbwV8makAM9BybJOsWnyFwFaK99r0GSLXIvbs2hMv8mda+7/AZxQtlc38eOplLWo0sWTpdFXl8JmZQGPVdaf3+l5dwsiuK5RETRIXBcNUYZFIgjYbCl/c4/mIXgy+B4+gTFfKARX87anTPihQposA+Z0wAtYKmuquFLVQO1vru+ZL9btUK1eEHAbj3CqCc3YmmkPBnrJD4xmXz60W+0W/4whNfZHwqsvP7TXPPvKN8oWXWB721u+p0G5gcf6XyX1yM87M/tOvpUgmLbMVnkmYEHXtYwcb+PnFPBlKZP5Gcg0xXPAe6D6h/+5H/ExOibhCaabTNMwrNon+dLEFyTJ88VLZyZpFCkUSOylp/0QJ/8ZLt+foArllscaKTgjLrm3TG6A810c3ay7XFdv8K0GRXMnIJ4DMKXeatccTRxa7R0KMN2xwAP1DGFHUKxogkQEpb2vpVDN7bq7f1t/j7dwWj+t/diXmjXvDDpcLDyqpH4o9kAR8+mOHvOwsv6aEUo4zB8A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39840400004)(396003)(376002)(136003)(366004)(38350700002)(38100700002)(6512007)(2616005)(1076003)(186003)(2906002)(26005)(316002)(36756003)(6916009)(6486002)(8936002)(6666004)(41300700001)(52116002)(5660300002)(8676002)(66476007)(66556008)(478600001)(66946007)(6506007)(83380400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4lSpgxpAWkLve8SGKMpR9/s4HZ2/2upGRTYaKKoUqUXhNkmQgON7Zj4S1nRH?=
 =?us-ascii?Q?sgMzgmECLb/23CWY4i2gdIHj+RADGVRtJdM8ErMMbE+B1dCu4IrzNV6NVJnU?=
 =?us-ascii?Q?k07xIMjLHT8jyeLpOGDMhwe66IMEfqmALppZKhT7Nddqwm/H3XbUMKvPJdv2?=
 =?us-ascii?Q?8jPRBoIscY6jMhbKI4FVHB/W0j/GoKhapz/blaXvNpd5+U5tTW7NLyamozCU?=
 =?us-ascii?Q?nlV7R2QFMEg97yT1DuxsTbXykKx8PDV5a47tCdCNtNFuGsqcEQFnVviyPTuR?=
 =?us-ascii?Q?YrVneJysKM5ryxClTsCfKatDRzhhwA5a+cQZEQ6u2QZ1rious5HTPJ7PzSrh?=
 =?us-ascii?Q?BYZE8zeiEwCU5BH8zg7ITE3Y/8Cn/9c9ZYCPA8UZafXWGuUcHl6NCA0fsgC+?=
 =?us-ascii?Q?U3zvUcVIispEngajzmbmA+KoiE+PAZcWDZMbTqdJW0CtvSEX9p4Etb+dS4zY?=
 =?us-ascii?Q?4/jdXeD2PuNCZrHTCbdzKDTZtaqB/A0EAMDt+CDwU5aVspDNZE59TWQfJ8Je?=
 =?us-ascii?Q?hEtnPhrLWSIqysrsV0vIsZQBFQU2vMSzmaoV+sP/vYLidNdyp62AfaWt0QV6?=
 =?us-ascii?Q?p0bkidzF4pMGwjo9iP+viHWGQ9y3E4+Z9mfysGB9CfA/155tx3lQYz6XRuf1?=
 =?us-ascii?Q?cwMfZyqTkqdeXvhKLHK9hcUEKMNSQWEM3MPaOuNdiq/WxvfxseEsV+q3XeRW?=
 =?us-ascii?Q?RdqFuNsNftaNlfK43Bgj4VJotoMfjGhm93dzEDGz5tq3ug6GWInrlNx0SE55?=
 =?us-ascii?Q?eMtMr15h+1d5IKXm09YBE/q4cRU+EGsx7SBRQyhE5OFnGcns0zoqJ2BzshZJ?=
 =?us-ascii?Q?iGoCiFtmCD7ZNFO4149kdV4vbvbZZgo5TE8ePxpAIOkq80QojWM0XZuXNj3+?=
 =?us-ascii?Q?lWP0SAz9a8GJ1/ydPA1ZrRSnQkQ0qf08/G6h4ZTDstRiq8BpDVnkg2SHtcHv?=
 =?us-ascii?Q?hBBsCY1QJK0Psv5oeZnf1hzHuLZc3IN0EadYVnJu1BCw/wRfrH4JKSvwEmV5?=
 =?us-ascii?Q?+0+uL7sXB/SqLdoZZ7T95Qm8xLWeynoJ5gXQlvxHrjgg2sqFDbgNxn+XmOrp?=
 =?us-ascii?Q?rk/uckdfnLYFMK3r7gbx/qDnoMA8tbKfIQgLh5mqJ7tNIklt0zJxKlFeMnwN?=
 =?us-ascii?Q?3M+nHyTYWSUfe5CMUgZ472OpV81I32FgAn+SerqP8CP22U4dx+3ei9LR/wNZ?=
 =?us-ascii?Q?3NNpkVE+nEz8HS55P5N+/mlI/JgojDA0vICAAm8zxFGLHAWIsWtNriVaHPM1?=
 =?us-ascii?Q?wcET0MCqS7klDnnJhSovvKN5/iwrFPVZZM/yFtdCp77nEi329w6Is+UJG1TR?=
 =?us-ascii?Q?2kf3jgypl2K/fKxsv53W3HQSiSSMa2o1W+uyaOoIjvMLACTLi+Zy9xVxdfmu?=
 =?us-ascii?Q?Towqp7t5w/aL/NlUBwBLNRZ8b1Ss2aJxE+7wsZAx/BUpE2ufsJdhMOhmvuy6?=
 =?us-ascii?Q?vvFt1f/aALG5M2w1F1MDzcb5eUW3sOygxHRq8pepv7sGtuLuxIX+AtiN2+8u?=
 =?us-ascii?Q?4kO9Bh/WNUpx8QS46WEfMcR95/64LKevzgglgtyp8yp/T2G+EWiqDpNdBpbI?=
 =?us-ascii?Q?s5m4Bbqi464hB/lsdpL2T8w/oS7IREz4wPWMsdE8TJockTaQyGONICqDGPH9?=
 =?us-ascii?Q?Pw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 739179a8-683d-4554-c7cd-08da89704d77
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 03:41:05.6790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 S9Lh50z7ZGPBdtuMzw1CRdHOMbknUE1Cq7ohhuxca0QB/jo1L2pvA3LV0slXAgLUaFBKWUABhEXZh/gSLlVy6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5989
X-Proofpoint-ORIG-GUID: fhCMF_jOBPtSSnmZyFvhDZ0ghV5wM2BE
X-Proofpoint-GUID: fhCMF_jOBPtSSnmZyFvhDZ0ghV5wM2BE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_01,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=728
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 phishscore=0 adultscore=0 spamscore=0 mlxscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208290017
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 29 Aug 2022 03:41:13 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7577

We are get 'buldpaths' QA issue for nerdctl. We need to add
'-trimpath' build option to it. As the docs (go help build) says:

"""
-trimpath
  remove all file system paths from the resulting executable.
  Instead of absolute file system paths, the recorded file names
  will begin with either "go" (for the standard library),
  or a module path@version (when using modules),
  or a plain import path (when using GOPATH).
"""

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...1-Makefile-allow-external-specification-of-build-setti.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specification-of-build-setti.patch b/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specification-of-build-setti.patch
index 0661dd8..fd9c8eb 100644
--- a/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specification-of-build-setti.patch
+++ b/recipes-containers/nerdctl/nerdctl/0001-Makefile-allow-external-specification-of-build-setti.patch
@@ -18,7 +18,7 @@ Index: nerdctl-v0.17.0/src/import/Makefile
  
 -export GO_BUILD=GO111MODULE=on CGO_ENABLED=0 GOOS=$(GOOS) $(GO) build -ldflags "-s -w -X $(PACKAGE)/pkg/version.Version=$(VERSION) -X $(PACKAGE)/pkg/version.Revision=$(REVISION)"
 +#export GO_BUILD=GO111MODULE=on CGO_ENABLED=0 GOOS=$(GOOS) $(GO) build -ldflags "-s -w -X $(PACKAGE)/pkg/version.Version=$(VERSION) -X $(PACKAGE)/pkg/version.Revision=$(REVISION)"
-+export GO_BUILD=$(GO) build -ldflags "-s -w -X $(PACKAGE)/pkg/version.Version=$(VERSION) -X $(PACKAGE)/pkg/version.Revision=$(REVISION)"
++export GO_BUILD=$(GO) build -ldflags "-s -w -X $(PACKAGE)/pkg/version.Version=$(VERSION) -X $(PACKAGE)/pkg/version.Revision=$(REVISION)" -trimpath
  
  ifdef VERBOSE
  	VERBOSE_FLAG := -v
-- 
2.37.1


