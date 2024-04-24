Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96095C4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:58:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11996.1713949078781239704
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 24 Apr 2024 01:57:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=opfldUWL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4844322108=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43O6U2Es024726;
	Wed, 24 Apr 2024 01:57:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=VPoKWwBqXhFm6WYKldHQHottQW9W0KagaInSsP3CoTw=; b=
	opfldUWLSFnzHJzzV0Z4S7PIIjN43y8Um9GwzfkXZC+onR7BpgaAsgrb6NFoJt/q
	N+/LYUKaFiltvEO6X4o0TzdgcGOKE72VhVJpyW3BwS8YA/ZoaWm0renLAziZGutb
	uozB7alfS6CYZ1lqQ0pFoo3Jb6dikClUpAA0famirAgZTURMDxOLi0/us0pN0Kyv
	P1pQBxWjna9YVS40TeW/Uw21DBeieYzmAy4bC4/z/I/nmqvfZCBJx8OAm44FEX0i
	W5WMweWcLkNiX1+JinOdDICsE3KNM+hHbpftL9CHspHpPj9ptVp7tIdSKLL6A6kB
	CK3lR3xMIFhwlcnIgWZTtw==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xmd7gkkch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Apr 2024 01:57:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FyIHMTEmt9/FX85UtaqLE14lta+5IB5o6M0T8cVjoqTUGEoZs0qfwwe0hJnl1fznrCyXL0qEjVk2lvGsLgjYptzpRTQ2eTAwCUvWUAS/hWJbLKR2/kJpYEDD296SBsWiG8gEhODIVS7L93a7TRdy6JlWXGx+1NqPNvuKPstvzHkirXhg7JoLRYThI0DGGlbg2DHEPAxuq57TENNRd45RhJvubjHx5dmFj48CWYLF5x8kC+GwS2IS1lJIWDlua4Ko4rHHh2sM6bOEBxdq71s79zH/4ZKWzcZAU5JATt1zgxasoPlQQTI6L2TmMFLhA0LoLJNB4jqo/6HYk4ofxcCEGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VPoKWwBqXhFm6WYKldHQHottQW9W0KagaInSsP3CoTw=;
 b=LoFUs+Pr66PLo9PCn3n6qUqMLIwZN+yL6JCHhWDiJRaaCylmr8hXmkQSAjt2tNz27vAmKQ1v3/cBRtPj7gt2EcFKqK40dkLYscjI6KyA+pRmP9X0Id+jcvDBiXZFiTJIkOtvQ5HcAsi1/IJ8hbk1kawjx2mC/SPabTYfMyRC8Jdp/5rmHGARlUb/jfOQoCWRqnwiI9EgOGrvsRIf5BYqL7ir1PXYmfAK4EsHJBY9UNZX02N1DOdirQNnssuQdEL0gZD/1Zu+nBThL32AIevxLB7C0j8ib/2gR6W3tCEoaMFadFMB9ooutwKduKkuGH0zX0on8jA1ciBPG7D2/VGOUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CH0PR11MB8086.namprd11.prod.outlook.com (2603:10b6:610:190::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Wed, 24 Apr
 2024 08:57:54 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b792:3207:f838:98a1]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b792:3207:f838:98a1%4]) with mapi id 15.20.7519.021; Wed, 24 Apr 2024
 08:57:53 +0000
Message-ID: <aeab5ac4-2f68-4271-881c-bd52a14d7a71@windriver.com>
Date: Wed, 24 Apr 2024 16:57:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][PATCH 2/2] netavark: skip plugins in ptest
To: patrick@subset.ch, meta-virtualization@lists.yoctoproject.org
Cc: Patrick Wicki <patrick.wicki@siemens.com>
References: <20230825145148.234559-1-patrick@subset.ch>
 <20230825145148.234559-2-patrick@subset.ch>
Content-Language: en-US
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <20230825145148.234559-2-patrick@subset.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0123.apcprd02.prod.outlook.com
 (2603:1096:4:188::22) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|CH0PR11MB8086:EE_
X-MS-Office365-Filtering-Correlation-Id: f3095562-b177-460f-0093-08dc643ca06a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SVM1LzgwaTdJYUlEaC9EcEVXUnltdE54U1FiVGZUNDBDTWcxcy9lRmV5TDVT?=
 =?utf-8?B?b0Zjck1HaDFCd1dybERmS255VlR0SitmdVl3Si9vNk9RSzlHQk1VN2d4bzRI?=
 =?utf-8?B?TGluRzJ2cHAzWjVZc2pRY0FhTk1ZZFkrbG5DeXM0UUNET1pXSWpRVC9Qa0cx?=
 =?utf-8?B?VGJ0TjZXdWdxd25JdmVZa3pEazgyZFFhK2Z4S2pycFViZ1N1OUNZZnFWay9D?=
 =?utf-8?B?dzVNdlFvWHpsb0NkMTMwY2NYdUQ0cEVUeHZIa2d2ZVlsL29iRkxrTmcxcXdq?=
 =?utf-8?B?dXNkWTgxT2tCVGJHTER6ZEoyVlUwY1o4L0JIRFJPa3hiWWFhelFqS20wMThN?=
 =?utf-8?B?Zmd4ZURaMDUxQm82VGdxeEd2L3VZY1hyUk9RRDlVVk1IUFJRSFpncFhVRmxo?=
 =?utf-8?B?U1NNOHlHYlBmQnYzWmtzTHhDSGM0YWFnZXVLejhjZWVNZWM3a3ZuMjVqMlFL?=
 =?utf-8?B?cGNNZmFPRm1BYTAxRGlENFNhYW12SHV2QmxBbFQzTG5pMzhjNnJad2wzTllB?=
 =?utf-8?B?Tmp4aWVsVThLMEtrNDBmbCtraG54dFpjWjJibGljL0VCcjdaZGM1elFrR3Zw?=
 =?utf-8?B?MzVrOHFCRE1JcGxoMUk5eFNaeWZCZG1QZ293ZWhPb05iUGd3TkEvMVQwSjdR?=
 =?utf-8?B?S3pYVzZOTlFNM2xmSGVXendFSDFITW00UmhmcnVzTUJMOUh2Q1BqNGRYV3da?=
 =?utf-8?B?UHBkRk9jcHVIbnR6bW9XdWRwZUJTL0tzNG9zTkduK2FmOHF2dzFrOEYvd1di?=
 =?utf-8?B?V0FEL2NIcHRIYVpsUnIvbnNZajNDVXdWU3BidXZYWmxTTGZ5TDMxMTNpM3RO?=
 =?utf-8?B?UUZQSzIvbExweHllVEYvQU9SaXFwQVU5YXNsOGhwVk9GL1NTdlQ1VkZ5WXUw?=
 =?utf-8?B?QWFYY2diNE9rRFpXUnUrSE9WOC9MekQzR0xQdHEvWmJMczByWG9kdC9lcG9s?=
 =?utf-8?B?cW1vaWRNNEE0cVdUaXVveTFyYVlMQWdoa0J0bGtCLy9FcDZMclNNVUhnZUlZ?=
 =?utf-8?B?Q0pJVUV2V0wvdlNoRlNSY1pGVUs2UmxaZEFXc2VOUEtyekp2NHFwOS8rSmZn?=
 =?utf-8?B?a3IxS21MSktxVk9jc2NpK3Fnbm5xUW5vTk9IVmVVRmJkc3BJck1WOEM3VUJr?=
 =?utf-8?B?TncyV3RxKzlZN0tnSXVJVEdmcXE0L1g0ZWRvNVNOcjVOcmZnTXF6WHI4UzJS?=
 =?utf-8?B?REdPeWRLcDdYamt1M0g3R2MvS0g5ZU1CbW9UVk1uN3RSQkxidlM3R0JnWDBx?=
 =?utf-8?B?QUpjTHliM21VSDRCSGU2L0RxdzBWTjRKQzRVVkl4Q3RqREUrREJmMm5lbnpG?=
 =?utf-8?B?bUtZcEZKd1dZM0ZDUlpwelN6N1crRnRoUEdXSG5GYWhDTHFyUGNUY1Mxa2pW?=
 =?utf-8?B?SFNVNHB2ci9wQ3lBQ1M5elcrZVZWWWtjeWY4VmFOU2lyK001ZkNWMDFEbmNI?=
 =?utf-8?B?T01kV28yTXBFMTduN0JRVEZGZ2hnWFVGQzU0QmhMQ3NiQWpkeTNKakdTZk5x?=
 =?utf-8?B?cEZCYmhVUkN5eUxyK2pUWWs5WFdvQnEyUVlHVklYVDZuMUlhNFZCall4Yjdq?=
 =?utf-8?B?aStBWC8xUldUS3J4cHY2cUlxWG5vUUJUREZGQnI1Y3lMSjFoQVNKMzBsUFYv?=
 =?utf-8?Q?Qgw9x9XYBy+H201PSQyzCI8+YY76vKV3iMfSh82wG2aM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OXo5SndJQldTOVh6Vjk0M3lSRnRvcE9TWmFYbkZyWTZKL1d5cWpQZXIvZnRw?=
 =?utf-8?B?QnVjQW10WE9ISFVsSHRtZnN5WTRLTlJjT0J1Y1lmMWtFb0dzM1dTemp4Z3dJ?=
 =?utf-8?B?OWxTdGZWOVpRbzJsQ25kOUxxYkppMktQV0drcEc0L2hDZHY4YkpET1ltSjJE?=
 =?utf-8?B?Z2JJaW5KR2sxNlVJRHVNYUd1MUNqUGFoRkN2QUN5ZVRjTTBKK01UU0x1WFRD?=
 =?utf-8?B?Rm80R0Zoa2VEUEx0VkRjUWRTMGg4dmpTWW5iNCtWU2RseXBTSEw3V3pnOW1h?=
 =?utf-8?B?YlRoSzhkcW9TYTNSd1dUbitPaElISzJlRzV0R3JmWFNwOG0rK0hsS2l6dGor?=
 =?utf-8?B?OFNrUDZQZ3Q3QlhYOUc0cnRtamQrdUo5UW1FTmpuN1FuT21FNWxFalY4S3Np?=
 =?utf-8?B?S29xSnRIazhMU09UMnptY1J1WEJPNkVJckhWcnRjTVdZZHh6WktJTzN2N2hU?=
 =?utf-8?B?Tkd2dkk2TUFxbW5yYVlmLy9aaHZBMm4zR0tMRGFSQUhDaW9udDVUTEI0OEJz?=
 =?utf-8?B?VkFXQUcvSG9HcWdtbjBjZW9xOCtLbDZiWkExLzh4WlgxR3JuRGZZK3p4QjZi?=
 =?utf-8?B?MEdvc3lIck1FeTFVMVVTa3RzcmNSWjErN0tQQ21OKy94WGN3QUVxYmkwNzN4?=
 =?utf-8?B?MTRvbU5tZFUyVEJPYW5DbTZWbWcvNHMxb1N0UmZlb2ViVStjbGUvSCtRREtO?=
 =?utf-8?B?VGp2VXVUOXNxTzZRWGRQb3pVbm1jUHRha0UxT0xrUHRqRWxyd0tPRWJKb3gy?=
 =?utf-8?B?Y0l3eEE0N0RoSkNVQzNFSnRkZmFrbWhSazhWZHdZUDJNSTdZTk5NVTBFaEZu?=
 =?utf-8?B?Tk1tU0RkNkFTTVlJSHFtTy9URW9tN2JnQ2p6QVlxZFltcmhZN0g0YS94aHlX?=
 =?utf-8?B?ZCtOTnh0MGUrbG5mUXA4Ykc2c2duTEc1b3N6M2VHeW4xNVZzOGlYYUpaV2hs?=
 =?utf-8?B?SW5kRkdTM1VsbG16QmI2VkJyZGJQcmRXNHB2S3J2blJNZFh6QlduZVZ0TXdW?=
 =?utf-8?B?T1UxTnZxUWFwOHNuK29OVHl5Y3ZKWjBEcXJEeTNJdFNlcE1acE03NkhTb3h4?=
 =?utf-8?B?UUtBZ0ZOV2gxclFpMmVnRVB0aEFoTG8yenk2emN0ci8vVERydFJvaGxwVyt3?=
 =?utf-8?B?MVU3VXVqY2pZQWMyalVjV3V1R1QvNmcyeUdQYjQya3A2dVJqVlQvSFVaRjRV?=
 =?utf-8?B?R3NBVDdiaTc0Yis1ZWt1dTQydkVMZmM3dEZOZzFhYTRUWlFGTGMwN0dRejZM?=
 =?utf-8?B?NkttclM2WkZrV1hid0k5V2Y2U0JxREtLL0M2eUNGRnBqeGRzZWU1MnpHZzBI?=
 =?utf-8?B?QklXU1E0bU1ZL1p3bjFXZjFOdXhwZFJ5S0ZpSmZXdm1aZVhXa2dVM1RLNzVD?=
 =?utf-8?B?TUlkT0pmdjVmYnFkdGhJQUtlNStvaVNzNHFMT1p2RlhOakUyaTJ1emZlMUpR?=
 =?utf-8?B?ZE1PaTZPSVBBS3NvWlZIL0tsd2x3TGcrMVFRMFVhdzY4ZHRUQzhHZWx5MGFW?=
 =?utf-8?B?WjNPZWYwWlhuc3lGOGswcmtwbnJWTWRVY3hRNFhRZWZ5dHpIMktScVNsNnpq?=
 =?utf-8?B?TnJ0bXVHMmhtMzVPNkNLcytaR2MxTEpJR1oydSs1ZEM0MGh5bXZ4Slhpb3dw?=
 =?utf-8?B?bWw1YjY2RmtzeENxeWJ2UlNPcTYvOXgwSGFkWU1qak5ERUxsUzNrSmNic0gw?=
 =?utf-8?B?WkM4MHdZaUg4YmxsYXZjU00weHZwS0FmNEs5UlhOdUl1dEJITnRzSWczQzdT?=
 =?utf-8?B?RW5ldFNaUEQwTzBQODBqUTljWERJN01mc2JLcjRwd0lwNFpLTFI4cUhKbjRj?=
 =?utf-8?B?VzhCSTRvcTU0YkJDTjRsYXFLYVVwclprcGc5dU5RRTBwMDg1NndJYlRrS09N?=
 =?utf-8?B?VVBMcXhxTzN3c2M0M3pVQ0tLbEdleUUxeVFjcTJnSHVnbEljSmdLUzY2eTZn?=
 =?utf-8?B?Y0ZjUzlXUHRjOC8vaXFQWFFTTmlpSEt2WXFGM3h6UUR6RDVJQ0dUUjh0am52?=
 =?utf-8?B?T3ljUlZuaFZVKzRTd2p0NlE2dWtZQmVCSmw1ZDBPZ0krckhnZmxiR3dQdXJW?=
 =?utf-8?B?ZHk3dEE3cTVjek56MHl6T2Vwb2dReWxQQ1BQNlRwekNmYzZoZFAzTnM1N1VB?=
 =?utf-8?Q?Rjsk7wrvmVu0KOZ6xCoxEygDE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3095562-b177-460f-0093-08dc643ca06a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 08:57:53.4469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LFBYPtC8NglgDdmvclr39Qt1nZWHUtUZadwKD0MsnQzolGt0yaE/y1V2RhIcPK5A6UckjYogPSwYLf/vFekOrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8086
X-Proofpoint-ORIG-GUID: n1tR_Zojep9Ld20fVHcKuykUh4s9vAep
X-Proofpoint-GUID: n1tR_Zojep9Ld20fVHcKuykUh4s9vAep
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-24_06,2024-04-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 clxscore=1011 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404240038
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Apr 2024 08:58:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8700

The ptest fails as below:

# ./run-ptest
/tmp/bats-run-ELGGaA/bats.18820.src: line 5: To: command not found
1..1
not ok 1 bats-gather-tests
# (in test file test/README.md, line 5)
#   `To run the tests locally in your sandbox, you can use one of these 
methods:' failed with status 127

Thanks,

On 8/25/23 22:51, patrick@subset.ch wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> From: Patrick Wicki <patrick.wicki@siemens.com>
> 
> Skip the plugin tests that were introduced in 1.6.0 and lead to ptest
> failure.
> 
> Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
> ---
>   recipes-containers/netavark/files/run-ptest | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-containers/netavark/files/run-ptest b/recipes-containers/netavark/files/run-ptest
> index 41a37dce..7e017ae2 100644
> --- a/recipes-containers/netavark/files/run-ptest
> +++ b/recipes-containers/netavark/files/run-ptest
> @@ -1,3 +1,8 @@
>   #!/bin/bash
> 
> -NETAVARK=/usr/libexec/podman/netavark bats ./test/
> +shopt -s extglob
> +
> +# Skip the plugin tests because those example plugins are built only while
> +# running cargo test and for this to work as a ptest they would need to be cross
> +# compiled and installed as part of the ptest.
> +NETAVARK=/usr/libexec/podman/netavark bats test/!(*-plugin.bats)
> --
> 2.41.0
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8232): https://lists.yoctoproject.org/g/meta-virtualization/message/8232
> Mute This Topic: https://lists.yoctoproject.org/mt/100956965/3618448
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [mingli.yu@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

