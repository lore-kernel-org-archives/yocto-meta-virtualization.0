Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A492C636CD
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 03:19:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.125.1675826369274471396
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Feb 2023 19:19:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=oYB15OuW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1403b0ce2d=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3182eH1F012248;
	Wed, 8 Feb 2023 03:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=qJl1QP99zyOfpEsHVeRC28TgH2xGVAJ8y6xFFjWKls0=;
 b=oYB15OuWik6lI7idIqNScwn+J9S3LBx9y23lC3uQ01dYC9ICiXXZPrsEZI6VqJdICIBD
 xXqJol5g+Lwk8D47kG8aBJf4lgPOEewEVNQcMZht0pRGeYI3OoFyHgOacwKsWCLvUGoV
 HQzdTUN8kRZNV3uRrjfvEH18FCjemRA0NKKibHcdToYxFRa84mIGaO1IYaPQ/q+mByoG
 J+pYIUNKwhoFLJpPXKofX4aga2fffpoynWKVkYzvMfxWMnPo2fhUZFx1iU3mVs1Loroo
 yVH5Ji6vdRxQUUCc9blQOQIkECBoOVdW4rm9j85NoIRXhe7HMfLJXTJ8x8ngUsIMgRJc Pg== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nhck33p6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 03:19:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dD/xHQgTknIlXhPG7dCUJ50Mo1CieysnyrGhwuseqTgTR13wDM9uFVMsrqKtFHpiNqebDKDPe/VG47JyZ9VXnT+0tvItY95HHVpRGkfk/BZkfKkmkz1RR6bqbC/PEvZX52ymqdR1AddwpqJcyraYlkHAJ2tZVDkACRljKT8hItb3SQvXY3YVN2bBximYaUZrrCeFKd4A0b30hQvP0t4MLNHjUt3rJ70kfk5Hhp4UYQSM9GBTKoloY+t3GVQcwLbb3sGyKOgzmMrD64x9NvEcGCq89NSljugAutDg9FeTNvoiWaktLDoZYuUFm1MUxyYgAZjhN/XEAZbVILJkFiC5pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJl1QP99zyOfpEsHVeRC28TgH2xGVAJ8y6xFFjWKls0=;
 b=QqjZQxhnpsKN5yMuoBLSq3DKFlgPdh3y8l2F+eNPfLe8QnQVPmGUQSFfD65YEjzq/rRPJW3po+A0RPKmj0PCjkRdOxERwiA9fk4RiA/TjCW8ujrLGSwVo/4M3z2jVJgFJzFfUH5ctiexHGneAPgP0dUZcZbASnOV3hOiAWhwJ6Rd0NHhGRjkWFjlALExi8jhoP9ZTlVBo87bnCPYI15ICz7tLvxVdaaJj2rsVvtO03YmB/g7FJceZ0R+IQrxt/h7dR5ecijmL7VUij9bayp5lUEwY7Iopica8xy/mAZ1ag3+7lCqQ/NpHbukVO7NeYSPL/eG/Mf6nOh4XfPenubwpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by DM6PR11MB4628.namprd11.prod.outlook.com (2603:10b6:5:28f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Wed, 8 Feb
 2023 03:19:24 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::d5f2:3e09:17f6:34df]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::d5f2:3e09:17f6:34df%7]) with mapi id 15.20.6086.017; Wed, 8 Feb 2023
 03:19:24 +0000
Message-ID: <b8fa36be-5437-3a45-edda-e37f26d7adc0@windriver.com>
Date: Wed, 8 Feb 2023 11:19:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [meta-virtualization] [PATCH 2/3] yq: Upgrade to 4.30.8
Content-Language: en-US
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>, bruce.ashfield@gmail.com,
        meta-virtualization@lists.yoctoproject.org
References: <20230131072907.193332-1-mingli.yu@eng.windriver.com>
 <173F54303363EB50.28029@lists.yoctoproject.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <173F54303363EB50.28029@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0232.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::27) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|DM6PR11MB4628:EE_
X-MS-Office365-Filtering-Correlation-Id: ea8cc1e8-a1a6-4632-2621-08db09834702
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AFq9KRMjevYr01FJwi4jwqgbEqHwfB2/QUrUNDz46lZERZe75vkzHG5s/+oBlEK4svH7zjZXkbrCZxdrofPpzes1qg/I63ErMtt9k9bq3aKb2pGZsfG2cMhFYGmNrqvc1aB7pu0DykSFxIzlM7LOxYFo/KN2fe83zNeMZ6pKq8XPjnp0MznGrj6zWuMGovjgd8/lCblvtoi3oiZqsbPi61t01JpoZUk0/wRHVQdZ8CRbkQj68iUIG7WYYUxV9w3f6dq9RQJpoIRXYg8ruEUvR29Q9STnnAYA4ATvvks54TudsAnrpsoITPGPiubzoTMQzlsdsZ9DxPOdYJmlUzaHO1kG4UCYiC8EyBzEFI7FEX4vLULaaX3meRB9P/NS+zedRkYQlhISDlauaJtSAsZPRt4SX4qIz6P7qr3ZxPrMZinB02hGiaKeMceArEjJ5XJH0dc1RGy+fsleFdt/ecZ2Ty4Dkufqd1MnKkLcGkGxLg++75CCbvS9Qa+SrdLfW9AwFbwBtjF/2HIc++7WMtrnl8qvWJJSF4cPuHde2y4AT+fZ+OFjlTpN/TcYuHV3LFCq1KM7/HfC7d3swmLICrTYFdnrvnQYgLWkZKtL623mSuwvFlkBpj6Q0Edj36Br7q4hDxhZsUyMCo4M8lmsaTFx7LhmkjKJ/G75zEzXZOWSp5AlWTEeti2jTD7t3qFiFd/gWofHWQe7hvpGDkBtEKVvsMc2oS2yCtU644Fdt6HF5UKsyYaQy5mQAKGIwud6m9PseBJgekoOq6UQ6EISpJC5tk5Qb/8bFJK+01H3ppMjV3E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(366004)(136003)(376002)(346002)(39850400004)(451199018)(31686004)(66899018)(66556008)(66476007)(66946007)(6486002)(41300700001)(316002)(478600001)(31696002)(83380400001)(966005)(38100700002)(186003)(8676002)(2906002)(2616005)(6512007)(86362001)(26005)(6666004)(8936002)(5660300002)(53546011)(6506007)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TUd1ZzlES3FpNEZVNGp6THFtL1JCMk5kdXEvZW5NbzlUQkRHcE5iWEhmUDZw?=
 =?utf-8?B?a0I5L0dGQXNEaC9KY0tvRTJoYW90S3EyeUZ6RGlpbG51UEhhRVdSdUpwQzJr?=
 =?utf-8?B?N3JuY1pCMkdlNlowcUxYTXFQZ2dicVZ5YURHRTBjWWdrUVV4amQ1YWtxOGUv?=
 =?utf-8?B?dnJFSnd1TTBCYVFWWHpCc3BKMkhaT1g4eDFVSUY5bGJ3VUtXWDJZZGFjZ0E4?=
 =?utf-8?B?Sk5TbFRJMGFveUFDa0JxUG5FSndvZE1Lc2dOMkl1RENJcTV4MXAxYmcwamw5?=
 =?utf-8?B?bGdrUEZaU3kwOTMwZ1lEYUVRQm03M1hKcWJkSDNBdXUwTWZwak1MNU03ODBC?=
 =?utf-8?B?TU1OS2RPN25oMmJCOVBIR05vSHM4MUxibEpOeWpYTGVhWkxXMllPSms2dm9n?=
 =?utf-8?B?LzBhb01VOEQ0SUpoMC9iaWROdS9YUFZEbGkwYk04Q2RRVUNoZnRUZjNrdk5G?=
 =?utf-8?B?NVo3YW9IN21QU0p5c0x4bEJRWU9DcjUrSmFacm1yaFJjTTIxc3U5Wi9pWkc4?=
 =?utf-8?B?TERuM0lEM2dYRXI2dmJDVFd1K3JQTWRHTmN6cHhHQXVuRFZtNG9aeEEvTWhq?=
 =?utf-8?B?S0g5SG54ZW0zVzVSeEdYY0ovVXZaMk9PWCtLK2NhVmJFRmIybGNPWkZrQWJQ?=
 =?utf-8?B?aWlSVk9CdTY3dW8yQ0VmK1AwK1ZORzh1OVBqSzVqeWFlQTVxUmJhZHBVS2oy?=
 =?utf-8?B?ZFJVUGNFVHF2UzBxTHQvMUIwZG40TUozV2pXMkYyS1hoVDQyRG9MQ2VBSThI?=
 =?utf-8?B?eG1EL0NGNXY5RDExZGNxNGgvd1NZVVQwRkxRcVF6cFQ5LzdkbThISXJVb0pB?=
 =?utf-8?B?ZElaTGtoOHNTU05WcDFsUjkwZDFUSkhmdzM0UktEck91RFhtc2FpdmQ5S0NB?=
 =?utf-8?B?VjBLMGRKUGtCUFU0dW41WGhDakJoeGtTcklWVFlhWXhScjNIK2picTNxVUJ3?=
 =?utf-8?B?aGxId1RVT3dRWDNFcDlsZ0hjS05GK1FkZTRLVTJvK0g3UEE0cnNhQ3BiYW5Y?=
 =?utf-8?B?Ym9jNzhMb2VuWnJscVNoWmZrTFc1eGxkdE5NTHRLblA0Ty85Yk16ZTdlbWtO?=
 =?utf-8?B?d1hzMENGRnpwRStlSTNraElnTWpaQU5rNXRCNG9Zcjg4VWFXRmkyZG9lNDVz?=
 =?utf-8?B?bWdjcnVNRHJkOCtwdWU3dURGR3RPc1dtcU4vaWJaR1hINGpFZXBUTHk5SjVr?=
 =?utf-8?B?NU5mekRpREVtcmQ1SUExZ25pUEtzYTRkK0VnNHBrUlBJZHkrSW02ak01bjN1?=
 =?utf-8?B?MDR1RkFkUk1VYS9BVktKd0M2dzlQdUxERVZDQVhjMUhZdkd3R2psZ3gzTU5u?=
 =?utf-8?B?dUVEK1hYT2J3K2RBaFNJejFNUGVjbFR6a0NoQkJmdXZLdFR0N3Y0eWNib0Jm?=
 =?utf-8?B?eDNQYzFBZm1JejlvUjdMQVJwYnVKSGlURk5HTWJ3dFBiZGVGc1pYYkVNcFhH?=
 =?utf-8?B?c1gvZlpON1JNaGhDeEtRdmNMYkJiWWZYRjdaZTJRTDNQRU5xMlkyZEJZc3gy?=
 =?utf-8?B?cy9odEJqMytiby9pcUlpdTlON0Z4U3pDcWFSSFNxNC8rL0w5MHJtVWNERTVy?=
 =?utf-8?B?cjEvZ2IyZ1E4dGhmcXJVNGdzUXlCSWpNeDlIb0FVWFlFamhHb0Vuajh3MkV4?=
 =?utf-8?B?dUZMWHNIUnloYkVpbjBPd0RwWkZJUWVDS1podUJyMXVFOURrTDdkOFZGT3FS?=
 =?utf-8?B?YVlhd3c0QkJnT0tGWWV6OURpWHJSUFlVaExaMWU2VkJUang0NSsxbTJISDV3?=
 =?utf-8?B?ditFcDk3U1NJRFhOVEdnUE1zL1Jsa0lqU0l3N2Flb3U0UGpockxKanpDWGQ3?=
 =?utf-8?B?dTRxVmduWDlXK00zUFpXNXhtc2NLZ2xFeXlXcHlDNjhyTllNcWVBYjJYMzVN?=
 =?utf-8?B?b0gxSTI5WEV2Qi9lMTJWeVlOMjVCQm13dW0xNW9zUDBJVUJKWEdJbUtrMVF4?=
 =?utf-8?B?MlMxNCtLQnNMelFuaGhoUUJjOUV2bHZaRS8zcDYwVUFWZ25HM2ozNjRZTjFY?=
 =?utf-8?B?dTlSMVZ1Z1lzL1pWZ2dzOFpLSy9UamE1S29GKzFDY1puc2N1YmtpV3QzKzQ5?=
 =?utf-8?B?V3RTWjlGT09xdmQ2YnZXcHVxekcyVzRuSC9YU2lKR3h1YnoyOEFvODFZSi9Z?=
 =?utf-8?B?Mlh6RnJZdnVEMTRGUWtyMGRuRG1HKzUxVzZKT2EvU1U4cC8rNGFYUENGUHdh?=
 =?utf-8?B?Wmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea8cc1e8-a1a6-4632-2621-08db09834702
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 03:19:24.0995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AcB8S3BGxT8cDPT0rld/9H99LqUlNoLI6XpY4tN4leFBMRgK9NsvS5auaTKAbDwGcJP6EoD574XZB5m0/84yBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4628
X-Proofpoint-ORIG-GUID: hLiV4nGpL3LZHjUaYrXqJNe5sV5FQDt8
X-Proofpoint-GUID: hLiV4nGpL3LZHjUaYrXqJNe5sV5FQDt8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_15,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302080028
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Feb 2023 03:19:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7847

Ping.

Thanks,

On 1/31/23 15:29, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Upgrade yq to 4.30.8 [1].
> 
> [1] https://github.com/mikefarah/yq/releases/tag/v4.30.8
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   recipes-devtools/yq/yq_git.bb | 50 +++++++++++++++++++++++------------
>   1 file changed, 33 insertions(+), 17 deletions(-)
> 
> diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/yq_git.bb
> index daa9ab8f..867bfccf 100644
> --- a/recipes-devtools/yq/yq_git.bb
> +++ b/recipes-devtools/yq/yq_git.bb
> @@ -2,33 +2,49 @@ SUMMARY = "a lightweight and portable command-line YAML processor "
>   HOMEPAGE = "https://github.com/mikefarah/yq"
>   
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=090d381b4b3eb93194e8cbff4aaae2de"
> +LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=e40a0dcd62f8269b9bff37fe9aa7dcc2"
>   
> -SRCREV_yq = "e0f5cb3c5958e57c7f250a7030e92c768c1b2b19"
> +SRCREV_yq = "dd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1"
>   SRCREV_color = "daf2830f2741ebb735b21709a520c5f37d642d85"
> -SRCREV_lexer = "81f720df2c51e9f1e1d387b17a0af386ed2b257d"
> -SRCREV_debug = "fa7b53cdfc9105c70f134574002f406232921437"
> -SRCREV_errors = "614d223910a179a466c1767a985424175c39b465"
> -SRCREV_cobra = "b97b5ead31f7d34f764ac8666e40c214bb8e06dc"
> -SRCREV_pflag = "6971c29c4a22981adeaee7f4b437c0cffe08c031"
> +SRCREV_lexer = "6cdefc42e112ac71cbe316e1eed264ea62f58e25"
> +SRCREV_cobra = "b43be995ebb4bee335a787bd44498b91aef7619c"
> +SRCREV_pflag = "2e9d26c8c37aae03e3f9d4e90b7116f5accb7cab"
>   SRCREV_logging = "b2cb9fa56473e98db8caba80237377e83fe44db5"
> -SRCREV_yaml = "eeeca48fe7764f320e4870d231902bf9c1be2c08"
> -SRCREV_xerrors="5ec99f83aff198f5fbd629d6c8d8eb38a04218ca"
> +SRCREV_yaml = "f6f7691b1fdeb513f56608cd2c32c51f8194bf51"
> +SRCREV_xerrors="65e65417b02f28de84b55f16b46a1e789149973a"
> +SRCREV_envsubst = "16035fe3571ad42c7796bf554f978bb2df64231b"
> +SRCREV_participle = "49f4822ed012d9818c80ca4fcdeb7e2d55c04806"
> +SRCREV_utfbom = "6ae8f945ca96f30defc7e8ab12ec5d10cf86ded4"
> +SRCREV_orderedmap = "1e43e194ff533a346bab5f9b66b738256f199c8a"
> +SRCREV_go-json = "5efc7d07eeeba186df630d9ab4ac78c761938c27"
> +SRCREV_copier = "d132b069fe1a77d09e4c260852b389a730bbe9ba"
> +SRCREV_properties = "c9a06e8f8f0164e4e16c0d5c4793cbed4ac90264"
> +SRCREV_net = "f3363e06e74cdc304618bf31d898b78590103527"
> +SRCREV_text = "434eadcdbc3b0256971992e8c70027278364c72c"
> +SRCREV_diff = "20ebb0f2a09e612109b224b32f79370409108bcc"
>   
>   SRCREV_FORMAT = "yq_color"
>   SRC_URI = "git://${GO_IMPORT};name=yq;branch=master;protocol=https \
>              git://github.com/fatih/color;name=color;destsuffix=build/vendor/src/github.com/fatih/color;branch=main;protocol=https \
>              git://github.com/goccy/go-yaml;name=lexer;destsuffix=build/vendor/src/github.com/goccy/go-yaml/;branch=master;protocol=https \
> -           git://github.com/kylelemons/godebug;name=debug;destsuffix=build/vendor/src/github.com/kylelemons/godebug/;branch=master;protocol=https \
> -	   git://github.com/pkg/errors;name=errors;destsuffix=build/vendor/src/github.com/pkg/errors/;branch=master;protocol=https \
> -	   git://github.com/spf13/cobra;name=cobra;destsuffix=build/vendor/src/github.com/spf13/cobra;branch=main;protocol=https \
> -	   git://github.com/spf13/pflag;name=pflag;destsuffix=build/vendor/src/github.com/spf13/pflag;branch=master;protocol=https \
> -	   git://github.com/op/go-logging.git;name=logging;destsuffix=build/vendor/src/gopkg.in/op/go-logging.v1;branch=master;protocol=https \
> -	   git://github.com/go-yaml/yaml.git;name=yaml;branch=v3;destsuffix=build/vendor/src/gopkg.in/yaml.v3;protocol=https \
> +	       git://github.com/spf13/cobra.git;name=cobra;nobranch=1;destsuffix=build/vendor/src/github.com/spf13/cobra;branch=main;protocol=https \
> +	       git://github.com/spf13/pflag;name=pflag;destsuffix=build/vendor/src/github.com/spf13/pflag;branch=master;protocol=https \
> +	       git://github.com/op/go-logging.git;name=logging;destsuffix=build/vendor/src/gopkg.in/op/go-logging.v1;branch=master;protocol=https \
> +	       git://github.com/go-yaml/yaml.git;name=yaml;branch=v3;destsuffix=build/vendor/src/gopkg.in/yaml.v3;protocol=https \
>              git://github.com/golang/xerrors;name=xerrors;protocol=https;nobranch=1;destsuffix=build/vendor/src/golang.org/x/xerrors \
> +           git://github.com/a8m/envsubst;name=envsubst;destsuffix=build/vendor/src/github.com/a8m/envsubst;branch=master;protocol=https \
> +           git://github.com/alecthomas/participle;name=participle;destsuffix=build/vendor/src/github.com/alecthomas/participle;branch=master;protocol=https \
> +           git://github.com/dimchansky/utfbom;name=utfbom;destsuffix=build/vendor/src/github.com/dimchansky/utfbom;branch=master;protocol=https \
> +           git://github.com/elliotchance/orderedmap;name=orderedmap;destsuffix=build/vendor/src/github.com/elliotchance/orderedmap;branch=master;protocol=https \
> +           git://github.com/goccy/go-json;name=go-json;destsuffix=build/vendor/src/github.com/goccy/go-json;branch=master;protocol=https \
> +           git://github.com/jinzhu/copier;name=copier;destsuffix=build/vendor/src/github.com/jinzhu/copier;branch=master;protocol=https \
> +           git://github.com/magiconair/properties;name=properties;destsuffix=build/vendor/src/github.com/magiconair/properties;branch=main;protocol=https \
> +           git://github.com/golang/net;name=net;destsuffix=build/vendor/src/golang.org/x/net;branch=master;protocol=https \
> +           git://github.com/golang/text;name=text;destsuffix=build/vendor/src/golang.org/x/text;branch=master;protocol=https \
> +           git://github.com/pkg/diff;name=diff;destsuffix=build/vendor/src/github.com/pkg/diff;branch=main;protocol=https \
>              "
>   
> -PV = "1.13.1+git${SRCREV_yq}"
> +PV = "4.30.8+git${SRCREV_yq}"
>   GO_IMPORT = "github.com/mikefarah/yq"
>   
>   inherit go
> @@ -45,12 +61,12 @@ do_compile:prepend() {
>       export GO111MODULE=off
>   }
>   
> -
>   do_install:append() {
>       # these bring in dependencies for the -dev package on bash, and we don't
>       # need them .. so we remove them to avoid needing that rdepends
>       rm -rf ${D}/${libdir}/go/src/${GO_IMPORT}/debian/rules
>       rm -rf ${D}/${libdir}/go/src/${GO_IMPORT}/scripts
> +    rm -rf ${D}/${libdir}/go/src/${GO_IMPORT}/acceptance_tests
>   }
>   
>   BBCLASSEXTEND = "native"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7839): https://lists.yoctoproject.org/g/meta-virtualization/message/7839
> Mute This Topic: https://lists.yoctoproject.org/mt/96648196/3618448
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [mingli.yu@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

