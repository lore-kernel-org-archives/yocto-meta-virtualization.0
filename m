Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8110.1625473523389231979
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 05 Jul 2021 01:25:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=T1X2+iKg;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=28200a7cb7=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1658Hv7g024835;
	Mon, 5 Jul 2021 01:25:22 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
	by mx0a-0064b401.pphosted.com with ESMTP id 39khgvrb8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jul 2021 01:25:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mhy7ZPoreTy14WY1eGitbkNpyBhk44l0DToizCUHvOhQNj0rKrFzbiddR1sy5ib0XWeDCQp75Sdu3Wb12hscQv/51v5qjChcQAiy5oRxBVLZYeJrrpCn/vuq0g8hsF77GfvdDlfV4is1wqp+8AmHQbFV9mYC5yMybtUHqIcGZN7AzmVJpNgDWFpGW2Ug7rChAOiFqZo0kc7ZFSvDtBP7ZnegllyssJ30mJGFr4Q+n5hbNF/8TDqg+1jH428zZtLXMLQUo37qmvabGD0e6B1vl4rtc4kzjfk1+sbbwiYKwHDY5ehl4oI+SJOnwNtDWR8qNz7h2fss9G23FGEewEc6cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niwtXtY5sL+ymhXNT0RNO4lPjTXNbDrZRAKgDYIygks=;
 b=OwfWJRS6HzKrDjXnP+9NFraMpbej8ZVKuAsjY1n2GZX1Jyaqgn1FmzmM8vLMPD4NMD3vfV7OqtYhUmAljuz0fsGFYmDcjHjmRrKmplZOVq0Lz6Ym1LcwYbxtAcxYcD38RwMHUmuPDm27j33JiMKruyOrHMPlG1ML8X4XwfDRHqDqbFDI740+k7yXdEIIAQn/VBQ96KQdbultWwnLQe+AwQgktP93NKThiRxGHWTliYI5wiScpKVBiw4kkle18tVjDop2+ikw14/7ksd0XycQIG9lUlCY6Ekvg/a9DJuM66V0A7pbPA064EK5IbIEyHfPYHzLk77y34vT9DRM1B0MvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niwtXtY5sL+ymhXNT0RNO4lPjTXNbDrZRAKgDYIygks=;
 b=T1X2+iKgt13JX+RdmFzOOSt1ikNSP7SfvfUF1RJSq1ci+v7AeMDtKAheqAojbiqmwDW7nKpbHD2UZDBLkhaN631oUCgvOPqO4Q0McFIi5vRPVuxKesAVxY7iSlqFP/ZL4W4vFqpOF1hngOaZkaAPOHePfla+c77QpOlpeoVKRac=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR11MB1984.namprd11.prod.outlook.com (2603:10b6:300:110::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Mon, 5 Jul
 2021 08:25:19 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b9f0:8cd5:8e02:ec8e]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b9f0:8cd5:8e02:ec8e%4]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 08:25:19 +0000
Subject: Re: [meta-virtualization] [PATCH] conmon: switch to main branch
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20210621054046.15518-1-mingli.yu@windriver.com>
 <CADkTA4ONqYOzDL2qJZDR0Wt3o6U+VZAzPEUew9sVX9wz+XtXWg@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <71ba6591-ee91-45e7-e145-8567204bcdc5@windriver.com>
Date: Mon, 5 Jul 2021 16:32:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CADkTA4ONqYOzDL2qJZDR0Wt3o6U+VZAzPEUew9sVX9wz+XtXWg@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0065.apcprd04.prod.outlook.com
 (2603:1096:202:14::33) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.140] (60.247.85.82) by HK2PR04CA0065.apcprd04.prod.outlook.com (2603:1096:202:14::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 08:25:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f03a9d6f-f467-4856-98b6-08d93f8e6cad
X-MS-TrafficTypeDiagnostic: MWHPR11MB1984:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB19841664B43B81E33F64E18EF11C9@MWHPR11MB1984.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GSRQY/Fl0gPYBT1sx+O782nMMP/EdNnnIONLJSjzWPGbuWzkvLFHx4Sw2dptiZ8scC3t1IkQXBYhRmaWzukfURcJ4KkR8ccgS2MCmWD2bFruLSCT4+WIJRQFOfNkx4G6gTq6QK7seXDVLEFQuJEmCn5/5PNNle4oT7/p6lP6juko4lDjS2VozdrNymFluDB9k/2aRbfS7VGEek5zaKP9Z1d9ovfAl2bsJWIXtPm+7+5r5FUbnMbX9rHjL4Uu3r0fiYXaEVxmGtvW2PdBTy1vxeq9peSqOTAaL1ngXJRUcK/RW1X7TX/AZC5FJD0fT37IG8nC4KrUyL/6afVwYp7DQX1cvxhWrIuOWE/0/JRUlqRd2VNjfIUF1EhMSk6cVfS5pM79bvx4Z/RgqKZ2zU2hc3nw9AJq9iu1WKY+8GQB1FDIx8df1vUJHwKpmRSKdwPcqqG+iAPwNzuVcCNh1kLCTlZ/hPr8J6N1mQEFLfO8SDW6+iTSIWo+yRo8B/NUBOiN3H/KNdOkAAwMYd8F3aoFv9cYRjnrQXSldWLwlWbqbMA4qX2d6DQyqu6XmwC4T2iaKHu7UGSsEmgAtGHdIa9nWhJCtX/WmJuIFwqQDZKNNL84JHPmjpVTVDXJbXNvXYxJ5+wGKxSSw0mxxGDLGrMMJNa8S3brxA3uRtmpAF4kDsD4EHwqGjWNRDzM1mQgC4RPq6nOyW1ruazSPDxTsjsLfFaAJK1Ex67Fzwv8h6DCa0qZI0z9T+t+7BZSEmmPS3gF0TbEWTWQLgLpkJJh8XTqlDq3EEZUEM8/DvNUD5mzXRIgE6GH2EVELRC0JW9x5sM6IIQN+QublgJQBBHPTwhCCp0OLKUArl6sZ/+tCWBSQU5CF++26q/bJsRLgp+PljLEKgVpHhf2+djBelA+9/JjIA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39840400004)(396003)(366004)(376002)(4326008)(52116002)(186003)(8676002)(66946007)(31696002)(86362001)(316002)(16526019)(6666004)(16576012)(956004)(66556008)(2616005)(66476007)(38100700002)(8936002)(38350700002)(5660300002)(2906002)(6916009)(53546011)(6706004)(6486002)(36756003)(83380400001)(478600001)(966005)(31686004)(26005)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bFNLUFd3ZXFDYVV0d3lIajNvdDgwaDduNUM0Qlp6YW9NNWlPcGxoYURqQUpr?=
 =?utf-8?B?YkQyWEpMS0RSUmlhK3FTNDIyQ1NsV1huSHFBa2I1NmU0a1FsU0liYk5NdWVL?=
 =?utf-8?B?eTFYS0I0OHZnUGhqV0NZeWtyOFd5VGNGOUZjc0tHUW5udXlPL0ZYTFY1UGNR?=
 =?utf-8?B?aWZWMnVQNjVNV2h1ZmduV2FQWTNYVmhNRVNiSkQrTG1JY0NrS3NPZnNkVVFz?=
 =?utf-8?B?SWFDT2xVa3RNaU5QdTZVZkQ3V2JHVWVZQjBwQnp5SUFuNFlJb3VicmZWUklH?=
 =?utf-8?B?QmIzWWNnQUNkNnZ5c0ZTZVZkRS90WnVZc1podkNSR2xXU2lOZ1hTS2xTWVUv?=
 =?utf-8?B?anJLbFc2MitXd3R3eFhRUU9XV3ZhYzhYYTZtMDRnOXh0aVZRWWUyU0JESWtq?=
 =?utf-8?B?bUNjcXlVbjg3VXhwbHBXdlVHNFZIcDlIc2RrbCtiR0RUcnozUzd3QWhOQjdx?=
 =?utf-8?B?d2wxYWZzLy9uK3p0OGtEV1ZkbmhFWEw5QmM5V2xvaXA3QjBlVG5KdGlLc2xi?=
 =?utf-8?B?V1F2M0R6bmhxK09PV1cyY21oWE1JRE83TkZ1QS9ld21Kak5yQ3N2QUZTTW1y?=
 =?utf-8?B?ZEN2MGl2SUliQk9SY04yNlBsUlZoYnNnS0pzWlRSWlBvWmxBZDg5WVdGR0Rm?=
 =?utf-8?B?WFY4NktrZml0eUJWb1hUVzR1ZVUyeW9DdVI0VlhjMTVpUkhmWEtJSXRHazBl?=
 =?utf-8?B?Uy9ER0paY3NralhJVTRIdlZLd3BVaUhHNlJ4dEY1Mklvc1oxa1NBNUlYaXBI?=
 =?utf-8?B?WkNUNGZFaGZPcXVEVEZNWlIySFJaRHcrbnh6eU4xUG45L3lVZzV1VGw4cyth?=
 =?utf-8?B?YUszZC9RMUNQOU5ickhUcmczQm9ad3l4V1pxUCtFcWFLZThNb1NGU2xJbUdr?=
 =?utf-8?B?NlhwL3BhREVHM0ZKVWtJOEVZdWcvZ25IWDMvZlM4eWVzaTBnTG9MSVdCVGJo?=
 =?utf-8?B?V1FURUxnb2hESnBFODkrZldvZVAzbVV2dFVnQUZYZFk5QVkrSjNYZVU3blJU?=
 =?utf-8?B?U3JIZTh1RS9kajRqdlZtSkF5U2NpdjZOcVdkNjNhMG5IZDBvazhIMkF0MUNH?=
 =?utf-8?B?ZGRKcXZvVngyZm9CYWpRbW1FblJRTmtLSkZ6eFE1aEdtWXRxaloxQjBpU2Fq?=
 =?utf-8?B?dGd1MzFFUkYzLzBKNlFMNWJqTTdFekdLRGRlQ2p5ZFJxNjJKVlVTazlyQXdk?=
 =?utf-8?B?SmtZOHhLZ2ViN0pmSk5hdVZuUmdWZGY5OVArZHIyZE5OR3dZcTJvczFCbjRU?=
 =?utf-8?B?YjlHYWpJcDIyN0kxWnlmeEpFZk84cHY2MXNkMnhkbC9uWk1jTXZLcExnc0dl?=
 =?utf-8?B?Z1ZxMFo3Sy92dElKanUxSVdNbGI1U1N4TTcvcUVzSlFrYnA1ci9DU0pyS0xh?=
 =?utf-8?B?OElkcXQwVDVxZ2UrMW9WVXM4K1Q1R1RtWnJkeHgzeW9hWG5XVk0xcWUzVExp?=
 =?utf-8?B?dU9id3d3RFd5Qk5ZMmdjcU9lcFViRjBPb2NwODJVL01SRStyVk9qa01xUnlU?=
 =?utf-8?B?SWFnaGlxcXd1WUxZc1Zldm9uU2xmSzVDem83UiswbktTdk5sbmV3Zm9EWVd5?=
 =?utf-8?B?SzJVRFBxVHF1UzNwWUlKemZmQVBpc2hxejRJQUptTWg2aHYydWgwdlI4Qjg3?=
 =?utf-8?B?Y2JFYnhZMDk1MXFBZVgxMXR4em5wOXhCVWdxdkRyQ2dPWUNFd2FGVXA3YzhV?=
 =?utf-8?B?ZWU5clAvcHREcjFrUXpTdWhjbHRDaFBDcUhwSmhxaldyY3JwcTRtdmt4N0pE?=
 =?utf-8?Q?UuxS2PlwKJPVBvqJvliFpD+VdX8wYuNEn7jUMrj?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f03a9d6f-f467-4856-98b6-08d93f8e6cad
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 08:25:19.2271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kpk6AN8We4QNbnaqzv53ATUErHrl1SiXt7GVmWkwMSpJfFTvHMHSGX8ojeWf3vXxL7EwygLGSzIUrBYQwwMgQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1984
X-Proofpoint-ORIG-GUID: QYHoI5S_QXesfjbfvWzVwxjzQ592QgkY
X-Proofpoint-GUID: QYHoI5S_QXesfjbfvWzVwxjzQ592QgkY
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-05_04:2021-07-02,2021-07-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 mlxscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107050044
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/21/21 8:58 PM, Bruce Ashfield wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> Thanks for the change.
> 
> I had done the same myself over the weekend, but was still doing a few tests.
> 
> I pushed the change this morning, and have also cherry picked it to
> older releases.

Thanks Bruce!
BTW is this change merged?

Thanks,

> 
> Bruce
> 
> On Mon, Jun 21, 2021 at 1:41 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>>
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> Switch to main branch to fix do_fetch error.
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   recipes-containers/conmon/conmon_git.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-containers/conmon/conmon_git.bb b/recipes-containers/conmon/conmon_git.bb
>> index 74f5bfa..974eb07 100644
>> --- a/recipes-containers/conmon/conmon_git.bb
>> +++ b/recipes-containers/conmon/conmon_git.bb
>> @@ -8,7 +8,7 @@ DEPENDS = "glib-2.0 go-md2man-native"
>>
>>   SRCREV = "31614525ebc5fd9668a6e084b5638d71b903bf6d"
>>   SRC_URI = "\
>> -    git://github.com/containers/conmon.git \
>> +    git://github.com/containers/conmon.git;branch=main \
>>   "
>>
>>   PV = "2.0.28+git${SRCPV}"
>> --
>> 2.29.2
>>
>>
>> 
>>
> 
> 
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> 
