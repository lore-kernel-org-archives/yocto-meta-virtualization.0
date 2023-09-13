Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C75CA5510
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 08:46:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7139.1694594810415336275
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Sep 2023 01:46:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Iv9f/tdT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7620fdf48a=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38D8Oe6k005229
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Sep 2023 01:46:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=DsRCFo7aBJWx4KATduiZQoO2MH/V2pPRQRzUAgcFbZ4=; b=
	Iv9f/tdTsNxy7tm6swCcQs/lj96xyG/71/pSLgZwoF02Xlz+Z2Xtijg2J1j/yVFL
	AyJu359XGru1tcPiE4ErF6Cr1r4EE+Y9JwyYY0bbQKwF0o42RdP1x7xaWx19R+oR
	7LdpGWU5C5tijlzUMTwKEwRc3UdWu4VAOJmJgRy7jFeds/YAHyGUVVvAhfxmM0lO
	bRrc/9hju3CfKBbrwC6TIVAnU650f4V5NqNBaj3iyvNL5bhhS9mb3aSnbSxOeAmL
	S01y8LmN40TMD2kae48SNZ2W8wDNL2wlYCADfbCrZgoMJmOl8qoRgLL6PxkM0FQ9
	dTOcd31tLK1e/FQ7sFSQtw==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t2y828ejv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Sep 2023 01:46:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z4u2dtuLkA9WzFN9sNxHkjF5wdhgsU5fkhk2Ta/fFL7Hm1L4l6gC/O+xIyUpQ5cnLNJiK7ZtqY8J4NmKeD4qQbXBeNF1E/FygvEQSjw5WimciX9QHhhvnXr0ypNrFZhnU7cEV4aoowmq5XGYL6vbzjEvyygFDz4369N24p24uDet6psXgbzCMfPEdEhzmeooNkaaZGV1YbxV3yP0N8yu5No5Id1JQQB86cRt7swDm33NO8Cu1bgKF5uop7VNXJcCQpeLY7NhqbquhR/AwdR7Ya2cGHhQWskKn3fOgRg2s6JWLb6y96DNlLl/72CMR8SBEhTph0EnZOzLPeZqfe/Fvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DsRCFo7aBJWx4KATduiZQoO2MH/V2pPRQRzUAgcFbZ4=;
 b=FR2UR3LYF5ZevuHt+icsHUMhHBShmh6hSSXRM5uwi4JQsWyj+aRIDHmOIng3JTuHvVAFIMatvGA272spzUz9yinsWaeEBXjnLVbpY0zCQZ6g6zwvIIpxD0HFOaEuz+rYiWwv/hevttCwL/S9RCyQfEUyM0Y169MIk+Zgfvb62zY1N5f64AHVXQO2Z3DUtjpCUupG6raW4ZoP4TINdPSDxZ3N+Ncnc4p2gkn9WdX2qSOB7CRD7OBWgRnHOO72w6oZYJiS9cPIOmxGTmyLv8BPFMvxgFCpxzAmQ1inUlw8pQRporby9QgYpmicJc178sfJ9ChB00yRZdTfigJwwnVRPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 SA1PR11MB8373.namprd11.prod.outlook.com (2603:10b6:806:38d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Wed, 13 Sep
 2023 08:46:46 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::68d7:380d:8386:a34a]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::68d7:380d:8386:a34a%5]) with mapi id 15.20.6768.036; Wed, 13 Sep 2023
 08:46:46 +0000
Message-ID: <8c80a74e-3202-ecd0-2c3a-efc9d4b263b8@windriver.com>
Date: Wed, 13 Sep 2023 16:46:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-virtualization] [PATCH] packagegroup-container: not
 compatible with mips and riscv
Content-Language: en-US
To: meta-virtualization@lists.yoctoproject.org
References: <17845F4D8355758C.23873@lists.yoctoproject.org>
From: Kai <kai.kang@windriver.com>
In-Reply-To: <17845F4D8355758C.23873@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:4:197::7) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|SA1PR11MB8373:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c52e5f0-592c-420c-778a-08dbb435f5e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3NnlfrGgkBiICHP3vA00IcWsGat+bTBZCSRSE1ulWlokpTHIKRmaYGKE914GHcFuFVMucOFH870F/mPu6p/J6F6/6nYE9LUceUlK3YQ9jhLrIrNzw9hNaGDJRLRLp+N+NuepEaAiwgu3n4ohpA+yMrVfiExucLi2WEsilQ90f2neN8eLpz9jqGO/OM3D0eNyLSXn/5HXyZe7/T72CsQGFWwg6x+kgAKri/zjUdZ8bcHmlexjOYeZLdtvqvOsoWacL39FeKBjemYrM4LGKsIcaL+Qic1GJVjZfww3Q/clP1hFQ1motHBDMyqhX36sFc+E/YvEu6XjJcE5R0z2ECFqWWoIvypJOGBN0oLYpb2Bxk14r4fqORFLRayosTjlH/EE74WwIN38P9+e+pmxW371VS93wBS8HgrmdjbQlIgyWPE/xGljrTw3A7aRPXPVgIvQ/rjQ6H0qYFIdzg41Uq4DDYoKoAk6zkayyVhNbfZH5sbjLdhhGVc501EsxFHrFKt5qNVDxK2RZ1CKV+8QAhgjFqX1/74NSEgDP0S8F4Q/i8BXLnVnSv6JrlrEyqaqaDCqoXceRisltkNAENKurLsGe4LBy303F2W/zRAfVrENZNblPgGDC6TbXlmOuT3fA2gSxrO5gEoVyM/2Y5BBmZ6dAQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(39850400004)(396003)(346002)(1800799009)(186009)(451199024)(31686004)(66899024)(6666004)(6506007)(53546011)(6486002)(36756003)(86362001)(31696002)(38100700002)(2616005)(26005)(2906002)(6512007)(966005)(478600001)(83380400001)(5660300002)(8676002)(41300700001)(8936002)(6916009)(66476007)(316002)(66556008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UENGZ0pNRWY5bFAxdzAwZk5zOG9RcmFFV0Ztdi92R3d1RU5wZjJMUVNXZFY2?=
 =?utf-8?B?WTJBQWlqYXZqQmJzWm1EcE1nV0J3YW55UTJBNkR5RUI2U0I0cUlLSjFXNzla?=
 =?utf-8?B?YU84dnJ4LzMwUnBVcmRxaFo3QmFQL0hZYkY3R2lNd0ZTZCtPbFRzd2FWWWZ1?=
 =?utf-8?B?OGRRbDVoTVRmR1UvU3pXdVVEajJibi9FTmQrLzRacVp1V3hCVDdCYm9UUHVQ?=
 =?utf-8?B?N25xcXV4ZXBDbmtUYmlGbGdlNmNMUTAzYkdkYWF3U0x5RVpFcDIvbFN6TWl2?=
 =?utf-8?B?VENPTzIyY256Ujd2elM5U0hIaDFBTWV3WUN6MGVwbERaVis2SUQvakF2Z3Bt?=
 =?utf-8?B?OU16cFM3d3hWQ1VZVDBMT2MyODR0WjBxV25UZy9zc0pFaE51YS9sYmNTZFVP?=
 =?utf-8?B?VHRuRWkrUXJ5bnRJZ3p5MDdhMGdqYWF6blE5QW1KUGhldEc4cXhETkF5bTZP?=
 =?utf-8?B?U0RZc3hlZk5YejlIaVhwODczaGRIbzNDdWJ1VlE0Z3hOcXFvdE82Q29nZjd2?=
 =?utf-8?B?UFFCQ1NHaTIzWkdQZnYwVkFCWU9pb3JLWlcxdjhiVWJFc3N4cjV4KzAyck1D?=
 =?utf-8?B?dTlBeTlkODFOZ1BjRHh5WWc1Y0M3WnRXNWI3dGQ5VTlCbUVVdE5wWnRQcDhH?=
 =?utf-8?B?RzJlTElRK2orclNkNTA2Z1NNWHlkb1VsN2o2cWNwc3c3SHRsRnFqRjl5amVu?=
 =?utf-8?B?S014dS9kcHdSbWFSamtsM3V2Sk1kb0psS0lhYXBlVndFYTg1M3hmYStsVjRH?=
 =?utf-8?B?aVEyVmhtVkxYd0V4S0hZRnJobVlFK1NjQ1ozRXd2cmtCWHR3M1luYWRUTVJq?=
 =?utf-8?B?Zndxa1MxL3lTMFhQN2hPQlBoUHJMblhQdkNneFZ4MS9INENCS3NmT0xRbnY4?=
 =?utf-8?B?SENuZ3JxWUdoNVh3U0w0K2R4Q2xpZmRjTFp6RGRSM0FQeSs4MURHNE1EbTc2?=
 =?utf-8?B?bDVvZll2SFZvK3V2L0xOOHpweHVvSDFJSU5jOGV6L0VGd3ZVZWg5Q1BDQXN3?=
 =?utf-8?B?ZjM3RnE3Tk9lZTlYSEVoTFVXa01hckhiOFNvWG1HVVBCeWdLL3lWVFMzYkVM?=
 =?utf-8?B?ZWdSM0cvVmNaVTVjMmtFNS9Oei9LZzZnVnhFWnBJNXZBNGF5WmdkLzhJSmVR?=
 =?utf-8?B?UDFnUFVCeUhmTkNaQ01LaUEzM01FdnhaZWgxQVBnaG43MCtXUytTU21ZS1Ux?=
 =?utf-8?B?Zk93a243Mzg0ancxMDVGMUFuTVk4ME1LRDNFZWZFcW84Ym1TVThGTzUxT1Y0?=
 =?utf-8?B?Ri9kRWxDYUlXVjZJNDNWMGJYckZkdWpMa210M2FleEw1NEJ5c200cnJWQVJx?=
 =?utf-8?B?UDBkT3lsaGNoVWxGdVRsT2c1SUhNVkJvQjJwTGt0MWpUSi9pbUN3S3h5K0Vl?=
 =?utf-8?B?bStWcXJkeUFYS2ZQaG9NY1BUblVDdDBPc2Z3bDY3WDR6SVZ5VXZKOXQvM3la?=
 =?utf-8?B?TnhzOHdWUWRJVVhoaUlYTGlrYm8vb2VhVy9hVFpZSjdoTFREUkRkWDY5UTl5?=
 =?utf-8?B?WnBIVTA0TGgyMDNHYWUrQjBGMW0yYng2Z01WbEsyM0VFY2tRNHdGREZVQ3pW?=
 =?utf-8?B?a0pqT3haTmNRT1d4amVaT1YrekRkSGhSaDlHVVg0NXV5ZEcremFrUkVVbTgy?=
 =?utf-8?B?R3pzbmxYSkxOdVNuS2RMc0REcU5mcjR0R2Z6Q2d0Z0haOVpYSjAxc1VIVVU4?=
 =?utf-8?B?WE5ldEprcU4vRk5sRyt4TVlTVmUzTkk1S3pOaHhVTTlaL2tuaU5YM2dsSjBa?=
 =?utf-8?B?ZURkZ1J3bEJwSS8rOFVWUndUZFU2dExjbjgrSWV3cDlWUXgzTkptSmthWW1F?=
 =?utf-8?B?dXplT1NkbTk3bENmSkNaYUZ6QjJzUFpCQ3Y5YWVjQ21GN3JndmQveXd6TUhP?=
 =?utf-8?B?Y0JLb3h2YXhNazlhODFFYkhocGpLdE53b011a3dTMlJ2U0dtSFYrcCtyU2dH?=
 =?utf-8?B?ZHJBWkxYY20xWC9YWlcwYTRZL05YQ3gxbVRHVlVlV0FpRTcyVk9xd0hZYVR0?=
 =?utf-8?B?eitkL2d1bFdNUjFhWTQwN0hvYWtFSDZXSTZEVHpWcHcxN0lDVDlNbys4Yjgz?=
 =?utf-8?B?WnR1YW9iZE5rMG0vQnZ0R205YnRaOUY2Z2dZSG12ZnlVanJKV1BRamdFcWRs?=
 =?utf-8?Q?D8aj8eU96DzD2/E/nVHmSRNd1?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c52e5f0-592c-420c-778a-08dbb435f5e4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 08:46:45.8421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BPX8v08kfeUReOccxxra7smaW4+ot5RG8MKy+4f82e5Fg6IdMO67M5JDr32b9O42lzTRksOoD9rowJxtpkXqzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8373
X-Proofpoint-GUID: gj-ZPgOzFPgLzr-FujkoegQD4M4mHkcN
X-Proofpoint-ORIG-GUID: gj-ZPgOzFPgLzr-FujkoegQD4M4mHkcN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-13_02,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=418 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2308100000
 definitions=main-2309130070
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Sep 2023 08:46:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8300

On 9/13/23 13:49, Kai Kang wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> The recipes which are rdepended by packagegroup-container, such as
> docker-moby, containerd-opencontainers etc, are not compatible with mips
> and riscv32. So update COMPATIBLE_HOST for packagegroup-container.

Please ignore this it. v2 will be sent.

Regards,
Kai

>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   recipes-core/packagegroups/packagegroup-container.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/recipes-core/packagegroups/packagegroup-container.bb
> index c41576a3..11a02d74 100644
> --- a/recipes-core/packagegroups/packagegroup-container.bb
> +++ b/recipes-core/packagegroups/packagegroup-container.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
>   
>   inherit packagegroup
>   
> -COMPATIBLE_HOST:riscv64 = "null"
> +COMPATIBLE_HOST = "^(?!(qemu)?(mips|riscv)).*"
>   
>   PACKAGES = "\
>       packagegroup-container \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8299): https://lists.yoctoproject.org/g/meta-virtualization/message/8299
> Mute This Topic: https://lists.yoctoproject.org/mt/101331760/3616933
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [kai.kang@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
Kai Kang
Wind River Linux


