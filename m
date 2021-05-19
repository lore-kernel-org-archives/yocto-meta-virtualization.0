Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.331.1621462709599771031
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 May 2021 15:18:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=C+5vP9Qe;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=077372f3ab=saul.wold@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14JMG7M6004529
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 May 2021 15:18:29 -0700
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2042.outbound.protection.outlook.com [104.47.57.42])
	by mx0a-0064b401.pphosted.com with ESMTP id 38mctd8x3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 May 2021 15:18:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y7a4MwZB8W1URaQTp8AHoq0IiPmkd+xLeMLiX/iCYk28Ll7KeA/60Q9NjOSWNnFt2X989saKJ0UY4AGXYnVxC/Iw6St7VL/jLAIICk4JPVdRDvpk1vXny+2s5a4PLQppSd/Ge9XG9xGAGeyWl2ue08pRe2OCo43Pqq65XEBGIOvxgK4p4BovNtE9IuayzMJXAdP1YxxtDom78IV4m+/JAjxEyvPZz/4qcwVsQrFwk5zn6l1ofy4M8T8sHRKh7LA2iT6vMREcx8r/vVt3smKB+sQTq6SO24t8bTt9RIvtMn5lTZCKuGXJkEBELbDwAFG/hfVdLfaAyA0YlcJ1GW4skg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKuKsHC+9/1PIBNIo8eh60xW96pUNCMx8Eu+85x0A5Y=;
 b=OV/4/KUN5b1IyO8WA6AYie4vAM6P2r9eWZf8oOlkZo9cw2Jy/I429dmzyFJWp0W6HvqHwheg94HOalLyOF2+nZwYDOw3JfJ6PkQWr+vJko3Wr3olpUTJd3F/qBAB2emJGG92KvFfMs8dhGKa9sZqRlrsQnZ+TZFoDNC0CNsAq0YDitjWHlX6GUg2gSrO4CvIfLgG6ZFcRwkMnprRuC0gyMWKhbPM9Pr7l/zf2jHFAL0umIzsSljgEZMM8SDHQj0nXFuYMLaOCi6/clZKeexjnCMb8rYxNGjIoknESpgDyre04Ncu5y9zPtQCHtQTr7ycVTrj96omplBirY01A4XvGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKuKsHC+9/1PIBNIo8eh60xW96pUNCMx8Eu+85x0A5Y=;
 b=C+5vP9QehsX0hGeHiP5FPXUnEr9k05GZ7yl4vctDxQD3Kbo0ZCSLV+JZQbPzfbyOREZ/xuedHV9xxZ6LZUuv8kz5QPZNWzYGGB/uU62GdkTCfMOztZKscpzAqcU/JaLLx/M3VQudcOt55lSPA8Y9EyFRKQMf92zgsZ+v+HJxOvU=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MW3PR11MB4538.namprd11.prod.outlook.com (2603:10b6:303:57::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 19 May
 2021 22:18:25 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::fda5:ca87:9468:ad8]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::fda5:ca87:9468:ad8%7]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 22:18:25 +0000
Subject: Re: [meta-virtualization] [PATCH] crun: switch branch to main
To: meta-virtualization@lists.yoctoproject.org
References: <20210519221332.289403-1-saul.wold@windriver.com>
 <1680979B33D1FA7C.31082@lists.yoctoproject.org>
From: "Saul Wold" <Saul.Wold@windriver.com>
Message-ID: <8214e527-cf76-88e9-1ee5-4e2f22b622fb@windriver.com>
Date: Wed, 19 May 2021 15:18:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <1680979B33D1FA7C.31082@lists.yoctoproject.org>
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MWHPR14CA0029.namprd14.prod.outlook.com
 (2603:10b6:300:12b::15) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.23.90.211] (71.238.119.71) by MWHPR14CA0029.namprd14.prod.outlook.com (2603:10b6:300:12b::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.32 via Frontend Transport; Wed, 19 May 2021 22:18:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f59e943-4231-46a4-9672-08d91b140575
X-MS-TrafficTypeDiagnostic: MW3PR11MB4538:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB45385F76A42DA47AA8C2DA7CEE2B9@MW3PR11MB4538.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:494;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rPXroQgUHSw4ksPpmn8r4dW5mzc3rBRQUq7S+OtiOht/QWMelC7bIMxyotGHjx2eJW9kvCM657NK/KSpfaDIvfTt9BpAQ/vOjP1Bjb2wxF33kETP8M7AHU3TK5iPDdfxGgHq9CtKCPROm3WL97kzTTLatHLPAORrYKbYFU6Bbxtq5MtYkrRUK7P88laFwoVYfp9UYoO57FIHoG67qLoEYLHaOn7ewi6DN30IJClM+ALyYlfigIHD/oEAmubxkxSc9bZLWqZhNaYWMwmLNuJe8dXo3v26JcDYs13KoDnypxZBVkcsq98fTXZ1MZWC9Fniq+uK/4PDto4AUhqeLk/RnIYyXKVAI83sdRsfsrRYrolaAol2/LpmLX9cebMrC5i9vpiCv/gGlzCCZPXD57tM8nKs70MsqGtNZeIVOqPlboRb/kCybNURLgJZxHC9tUfOwlTAsA+gawUfYQJtTYoXvt/7rCbNRSqmJXJfrlGaUXZnEEfXnwadMsk8M4harAXBuSEjiRGe3/TsVkcnMEKm57bFd2xhL46l7oRKcHi3b1sCGH7Le7I7SvLynpKJi1AvmErDBruwTiAqYcGLJdfarX0RBdNjx+bteo2cURkDkYZg3KfyLa67LBYLQDzKbq2chwrFXM0coMm40QecByHN3PzRMphWzp8HuTaLa5DC0i2N9KfirZQOTCBGTn+/wgCjTjrEhVlsPbStkafwROZ1HQODKGr2qamTvP+TX90/gw6Ubd3mKWoWJ0zB+9NKgkyMvbIPedHKAxBgWCI5H76uW+saiH/bDyT6sUNfvHMt57k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(396003)(39850400004)(376002)(38350700002)(478600001)(8936002)(66476007)(6916009)(966005)(2906002)(38100700002)(6486002)(16576012)(8676002)(186003)(16526019)(36756003)(5660300002)(66556008)(956004)(2616005)(66946007)(316002)(86362001)(26005)(52116002)(53546011)(83380400001)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?NkttNTJRTTQ5UXc0bXlhVzFCUE5NVjNWdFBDbVBOcEMwSnhSM3AyRHRWNGxj?=
 =?utf-8?B?U05ZMEd0NmRBYkdEeE1UTFU4T1ZnYlNSUHlnQW10RWdyZllFSGhOcXJBN3ZE?=
 =?utf-8?B?ZVBsZ0ZwZXAzY2VxeXorY01ZazZpcXVWTjRVODRMc2NwaVRxem1kY3hMUTBt?=
 =?utf-8?B?NFU4OFlZM3BLa2NYMmgwOW1JUmQ3ZE82dUVKRU9pVnBJeW5xR0YxNGRGU0Zp?=
 =?utf-8?B?cHJZZHUzUFpEOURQdHNCWHpTM1BUZWpLU2g0ODNDZTBGTEZvUGZ2VUR6aURh?=
 =?utf-8?B?a1laY2U4b3dIVDFzUldhK0RlSTlrMy9zNi9qR0RZTzk4YzcrazVoOHBwelo2?=
 =?utf-8?B?ZGZ6Y3RYWUE5eUFxWHBISHVrWFgzT1NVdEdLNnJ4ekdxbWtTTVFsKy9OdFpx?=
 =?utf-8?B?VEcrWWVtd215RW1HMDR2M0p2VGJyeHdkYUpDMmpZT1lUZ0tLZVk0N0pTZzU0?=
 =?utf-8?B?UlRTL2IyZTdaSFA3WDRFK25tM0pmZHdXZ1pzTzNVeVU1UUJENmFmWmR0aWxx?=
 =?utf-8?B?Vkt4RkV5Q1BEdGdBdk5aY3lDZzVBQmtLU2d3RkpEaWs1eVZvRGFxSWcydjZK?=
 =?utf-8?B?WEt0TTQ3RkdoU2dEd0NldTQ0ZVh3bHJ2QVlVOFVieTJPeTFCVS9QK1NjVzdO?=
 =?utf-8?B?N3kxZko3cHJucjBPRkNvZUVNbDJRSnhLQnF4aDJUdmNVbmcyRUpBeXlOZnEx?=
 =?utf-8?B?NXc4Ly9PVkw1bmIzNUlKYW9veU1WWXloTDErUXVMSXZWNUhNSUFNNlBqR3F0?=
 =?utf-8?B?aEZzakt5cjZLR2dZSjNNWGd4RkErZzBFc0paNXY0VGxlYjZWdVVveHhSTndz?=
 =?utf-8?B?K25LWGVmRXd0TFRETXh3ZVF1ajF3TDdBQ3U3UWJrVzVMNlhCOEZIQmF2WStZ?=
 =?utf-8?B?dVorYy9zTWQ4TDAxaTgvV1dwVWhkanE3TWVJOGhQa09MNmtDYWpUeGZiY3gw?=
 =?utf-8?B?OHNXODJsSThLN0JGaHczNExsd3VHMjlYcHJ5Y3p3OUVKUVVMbHNGTEtjUk1q?=
 =?utf-8?B?Vlo1Yi91WDlwb2ROWWxMVWl2d2VvcEFBbEhMeEkzMkx4S1ZOUC9LMTBxZzgv?=
 =?utf-8?B?TTVTTjRUVFlDTWY4VGFKbUMyT1k4YThhdDV6TFJjd0plbE4zdnhXNVdIOGxt?=
 =?utf-8?B?ODNmcjBrRVdsR2RwNlRxb2VCbVJtK29tK3V4azlLUHMrYU9HcVNpVFEvbDdW?=
 =?utf-8?B?Snl1YmxleC9HeHVtV3d1ZXNmR2ZvdTIzcDU0YWVRRGhMdmsvOTRickQzRlJL?=
 =?utf-8?B?ZVRZM1Z5bGtFMll1UXdVM01TTVVmajl3L3Y5UVB2SXNKVHlFNzN2MElNM2lP?=
 =?utf-8?B?MFFFbFpFWlVPNGE3KzMxUXdKWHNNUDNKTDJYbmlZazBhalhZOURXVnR3RzVz?=
 =?utf-8?B?NTNNS2dUbVVKcFYyWUx4TER2dSsyZGNiVUJaZkVIakFjUXJKTHZyNjdXeDRX?=
 =?utf-8?B?MGo2NDdUVUFsS1RhK2padkFJcVdIditjckMyazA0ejIrQnFpaDVUbVRqVW1n?=
 =?utf-8?B?QVNyTXJKdEJMMDNSbDArZFpmU242SnovQSsxVEY5N1Rtc3JhWGdqR1IxMFNn?=
 =?utf-8?B?TkdPVG5wSkowY1hQQm5sM1RITitRUUlHTHFjelR0Sko5YVQyK3p0RVpwMzc1?=
 =?utf-8?B?YlhFVHpHVzMwSWUrSHlFUG9LQkpPN25HbVFLcHl0RytSRVIwbTR3d3MzWkZ0?=
 =?utf-8?B?Tmw3V0ptajFjZksvbmRlUG1ZS2VWQzcrR1JFMTlPU2xsMjRLOUpwdmVJZTFW?=
 =?utf-8?Q?VWUwpmbG4gxAgikoqmdHQ4WKQnK8y9rJkOI3OUf?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f59e943-4231-46a4-9672-08d91b140575
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 22:18:25.5599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WirV9X1ETd2qG1sa4tWIH+9+2A6q4mrqUosM7OMP/o6vPfxbhudSwbZixi8CQYmyqfqNbB7y1k7P5v7vfN9xkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4538
X-Proofpoint-GUID: bg2ty9RZQS6KRIBoroq1JV4C904SUH_n
X-Proofpoint-ORIG-GUID: bg2ty9RZQS6KRIBoroq1JV4C904SUH_n
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-19_10:2021-05-19,2021-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105190135
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Not sure why this got sent with my ceph update, please ignore.

Sau!


On 5/19/21 3:13 PM, Saul Wold wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> crun has renamed master -> main, so we adjust our fetching to
> match.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>   recipes-containers/crun/https://urldefense.com/v3/__http://crun_git.bb__;!!AjveYdw8EvQ!OCRGNoG4f6X3bpZyySnG2Fkc8WxVOZFhI8bn44kOLk7EzQjWB1H0zT25i-1FiPfJV3g$  | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/crun/https://urldefense.com/v3/__http://crun_git.bb__;!!AjveYdw8EvQ!OCRGNoG4f6X3bpZyySnG2Fkc8WxVOZFhI8bn44kOLk7EzQjWB1H0zT25i-1FiPfJV3g$  b/recipes-containers/crun/https://urldefense.com/v3/__http://crun_git.bb__;!!AjveYdw8EvQ!OCRGNoG4f6X3bpZyySnG2Fkc8WxVOZFhI8bn44kOLk7EzQjWB1H0zT25i-1FiPfJV3g$
> index 549f609..e463a20 100644
> --- a/recipes-containers/crun/https://urldefense.com/v3/__http://crun_git.bb__;!!AjveYdw8EvQ!OCRGNoG4f6X3bpZyySnG2Fkc8WxVOZFhI8bn44kOLk7EzQjWB1H0zT25i-1FiPfJV3g$
> +++ b/recipes-containers/crun/https://urldefense.com/v3/__http://crun_git.bb__;!!AjveYdw8EvQ!OCRGNoG4f6X3bpZyySnG2Fkc8WxVOZFhI8bn44kOLk7EzQjWB1H0zT25i-1FiPfJV3g$
> @@ -10,7 +10,7 @@ SRCREV_rspec = "7413a7f753e1bd9a6a9c6dc7f96f55888cbbd476"
>   
>   SRCREV_FORMAT = "crun_rspec"
>   SRC_URI = "git://github.com/containers/crun.git;branch=master;name=crun \
> -           git://github.com/containers/libocispec.git;branch=master;name=libocispec;destsuffix=git/libocispec \
> +           git://github.com/containers/libocispec.git;branch=main;name=libocispec;destsuffix=git/libocispec \
>              git://github.com/opencontainers/runtime-spec.git;branch=master;name=rspec;destsuffix=git/libocispec/runtime-spec \
>              git://github.com/opencontainers/image-spec.git;branch=master;name=ispec;destsuffix=git/libocispec/image-spec \
>             "
> 
> 
> 
> 
> 

-- 
Sau!
