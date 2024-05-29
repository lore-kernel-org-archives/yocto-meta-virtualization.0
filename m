Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB1B6C25B75
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 09:34:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9634.1716975293093500819
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 May 2024 02:34:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6879a5a475=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T4ErO9029707;
	Wed, 29 May 2024 02:34:52 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ybb90buns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 02:34:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CtbEn5QbgDPXnad5CN7OTcFVg2pojSjXjbiI4bBNMw2u9qsjLn3WsvR5q21g3CkTnvlbTL84qCR0BmtWJazi7PCSzY2Jq6aRR/K/3JtKoeo1jUOJkZW3GHqlL7gKcfuehbF+warzfmwkeoIP4BvKKbBl/C1vYbU98ufZNzvguMTZPizDlnx05VwKQSVzXkTjFjl9ENOg55nXmsdhOIxHi5tVBmCkuoG1WfLERH82T6zQtqbJ7W5aA48igHfwopI6b7+2GUDkg2r+q2lFT/uz6G1sHA7ARyjJVvVPnNUHGUJLBt+ANRvc6Qir64sh0V2NNRF1wWSZhwUj2yUSvPvp3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ey6/Zizb5d16TahX7+dF0gK3CpEHX80IGzxy2pgneaI=;
 b=ke8FiOIbgArtWsV03gUcSxiH1apCjB6lLE2jbOIHm3oupWaspk2lkMVcyEU11fjhYcvVbTffUk4Jyij8P536XFwtSeGaNjIZlZ7Q586jo5I8XuSSPZaXifiIgnfE1wEgCZQUKxf7GkjzgmrRL8xyjHQUqnJa0tb3IPaaX+gJuAvXl0PlcOIbedxULisVtl0kEhcYg+KRVI0mzO2DnhJFHFBdNqhV4UfQuNSqCZWRBix2oEgeJKOg0c42VoZt3qfJEbgDUXHjrN4UIqfcRfXZ83tWdXmdWKwjPyUdI3E/8OD4iG102aO0hiVfpd4iBvVmFDPGD60WEwCk6u+WOaBgcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Wed, 29 May
 2024 09:34:49 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 09:34:49 +0000
Message-ID: <3da1f706-e892-aff5-0577-8e91b6c3e58f@windriver.com>
Date: Wed, 29 May 2024 17:34:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [meta-virtualization] [RFC][PATCH 2/3] cni: use
 GO_SRCURI_DESTSUFFIX
Content-Language: en-US
To: bruce.ashfield@gmail.com, Martin Jansa <martin.jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20240524190915.1241716-1-martin.jansa@gmail.com>
 <20240524190915.1241716-2-martin.jansa@gmail.com>
 <CADkTA4MJRMzVBZ7vksRw_+oHusHvGJhu9dQaL3HbwNKTvfaNJA@mail.gmail.com>
 <CA+chaQeNR23+LHGka=cyQzkE-2s5+Fo7qjrPKp_8QTb64F1rSw@mail.gmail.com>
 <CADkTA4Pnpohs_L7_fyu+XLKZLNPF6j=YW+5GHb-duPR__5M7Yg@mail.gmail.com>
 <CA+chaQe9dY205PvWwyPBHe0cYJs7it1OrL25F7+xhtoW42Z=4g@mail.gmail.com>
 <CADkTA4OVX8p1bU5nRKT3LBUvfHJ3aCA1ZbAcUpEbFXQwMBYY=w@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CADkTA4OVX8p1bU5nRKT3LBUvfHJ3aCA1ZbAcUpEbFXQwMBYY=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0327.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::20) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH0PR11MB7424:EE_
X-MS-Office365-Filtering-Correlation-Id: 88d2016f-ba45-4ae7-f289-08dc7fc295ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dnViaXBKenhkVVU4bjdneTQxaFBEcXhZbS9SR0pHRmhwT3p4NGpwOWEwLytC?=
 =?utf-8?B?NlZvTWJIcW0xcG93cThlUFlSaEVyL0dBdXVSZHZjZXowdTVHREtlZXdjbTFR?=
 =?utf-8?B?VEl3TThkY2lCZU5ZTXYwUHpLdUdjUlBYNzBJWlZLTTVwdy9ZMElKaXU0MGhv?=
 =?utf-8?B?aFFqVzJOZ3R5Mzg3SjNkWE9UbGozR3phbW4zbXRSbUxPNjRFbEtKdjdmSVE2?=
 =?utf-8?B?Ym5VTVBib2YyWDJtcGh4RDdhTCtWTFlJQVEreUgxWk9VYkRYU1J1Wi9DSHF2?=
 =?utf-8?B?UEdhTDNMMU1CNGYwM1E1RnB2NkszSDdXdHpNQUZNajFGcDU2ODlJemN5bUpG?=
 =?utf-8?B?dUZySTlFcUtuTnZlcFp2aGc3dVIrUlRuaU1HZTFkTVViNnFvdTlMZ2w0VTlS?=
 =?utf-8?B?cG1qSTN2c1RwWW4zUlEvWHNEenZLUEthSlk3NFk1QVprQjBodzlJOHhPRWpL?=
 =?utf-8?B?eFZ4UkhpOUZPR3lxWGh2WHhjY0M0NG11VVM1ckJaSDFTU2VMRkRJZkUwZ04v?=
 =?utf-8?B?RGZreFc0UklydTlwUW13UHhKWVl1WDNnd1VkLzJvWXFDTVBmUEVEOUJhb3lX?=
 =?utf-8?B?UGFGSklvZ2IyK09JU2k2clJqQWMxWlJtd1h6cThWM2R2OVNIRkNKWTMyQVVF?=
 =?utf-8?B?cm5Yc1JUZUlFd0JTN1ZMVEp1UEwwc3RZNXgrUm9PanlQVHYveUk3ejNXV0lv?=
 =?utf-8?B?U0c3SE1oeXFGNk82MVR5NVRta29CQi9xNnhLYlozRUNsOEo3cnRCTy8ydGMy?=
 =?utf-8?B?Y2xHUWtwblV5cG1abTVoNTlkNXBoLytENmNMVlRLdU5WeFNWMmpHOG5vblRU?=
 =?utf-8?B?Q3BnRFFoZUp0bTBIS2sxbkF1YzFJcXBBcGM1Vnd4MlBEOXM0SzJjVmcvekdK?=
 =?utf-8?B?dU5SOTR5RnRwZHFFckFmN2NpbUlVT2daZ3IwemFzRzNjQmRGRDZEdkJwd0d5?=
 =?utf-8?B?Q3k5OG41Q3BXSm5OL2RRT0gvQis5eTA4QWxFdDVja1Q5bUxNQldOVVd1cStB?=
 =?utf-8?B?THJpbjNPOGlIMlVSM2svakdBVW5NQ3FrWDRIUlVOWXNiK3htTlNEVm53Z0NF?=
 =?utf-8?B?MkhmYmVLME9IaDUwYyt5TklYOGl1akhSNmM4OWFIWEVrbXhuZ3R2YmFiZUpF?=
 =?utf-8?B?Sklqa3RjSFB3TS9MR0licTNxa1NMRnpKRlQ2aDVDanE2QnAxQ0ZNZ3NYVW4r?=
 =?utf-8?B?OHRINi9ubDUxU0pxeGtDckpRWklzL0NPTGNNZkMyZWpaUk4zaVczU2lYcDRr?=
 =?utf-8?B?dDVsVytFS2NlZnBTOXlwUHVuNEJTYjRXc3RNMWxJSk9ZN0dhV0xOQTBVV0Ju?=
 =?utf-8?B?NVBvVytBcXRwUWhYMHhVL3FWVWU0SmhtMUlSSjdyeDRkMEI1UGJqdHpNWkU3?=
 =?utf-8?B?cVF0Z0RIR2lYMFBhTTg5eHNMUnlNcmJTV1ZwTW1EQXp5NU1qSFJoeWc4VmpP?=
 =?utf-8?B?NVN0VnhqUnZWcVRRcFIvVHdFb09aWXlEWEx2K1RzWjhIL0ZCbUE0aWtQOVMz?=
 =?utf-8?B?MFZFSW5zWjc5Q3lWWmxBeE16ckhRUTdLRTZLSERzTEhacTBSMHY1ak1xallj?=
 =?utf-8?B?aTZRK3FVM1FCZ2J2cjR1QVlGY1dvWUVMeXVDMEt6Sld3anYrRllsNGxUWk9r?=
 =?utf-8?Q?a3511Zd0B6S2DQm+v+iYCtC+oFJQLmnjNnOV7s8qjnBI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RVFwd0hCY2phQ1BtQ2JLeFRETmNnTkJsV0c3V0xlZnlVMWd5dlFTUkE2dWU1?=
 =?utf-8?B?SCtGSDlBdHNWUUpPRWVxcm9wYUJ1SXMwaW9XZkJJSWxHV2NUSnV5alBtOVZB?=
 =?utf-8?B?UGIxQnlzUUZwTEplNk5YdTh0Ym43SnNDVkNlUWxzOXZQRVBVVHNjSlVicFYr?=
 =?utf-8?B?NGNVaEJBUTFVeUE3UjlxM0xJdzExZnNHTHc3Y1pYTGJkcTVPMHhLSy9oQlZj?=
 =?utf-8?B?T0dOTHptbWpyVk9YZTZMMjBNTkpSbkFyYW54OXhpcmRvTWh2L1FTOWtnTU03?=
 =?utf-8?B?UDVkdGVJRHk5Zi9SaWxheE1kZ2NPUlFDZG5HQkNhRlFoV3d3eXdEZEx0SFFX?=
 =?utf-8?B?OTNkT09GaitYYXRBUi9IdzdSV1ZLMlBoTlZGMTNheUxGOG5QY0JIRGxZWjdx?=
 =?utf-8?B?b2k3NnNBWDh0QzNXL2lsZVdVL0ovZ3ZaR1J6dDRiSEdyTE5sNUdPeHFuSmY0?=
 =?utf-8?B?Qk90azZBbnhpcXN5YkxTQmxQaG8vWTJraC9Sc2xRZ1FsWEdNOWV4WmJvTkp2?=
 =?utf-8?B?VkFVcG82N05ZVG0zeXFidkhRc1VpcVRXb0o4cWpOUzVobldFZEovWW1pTy9a?=
 =?utf-8?B?VEw1eDQ5V3lLdnBCc1BGZEhPUVpsRHAvbG5KaFVVT3dwb1dFSXlSMWREU3pU?=
 =?utf-8?B?Nk9EQUg0T0FXdkY5N3NFdzJGNnZHMlNSRm5WaWhzaTZsUGV3eXJ3d0J6L0Ja?=
 =?utf-8?B?eDhDVXF6ZXllaEVJUE5YVDdPbSs1Tk9rZzZjVWJobXNNQm5EM0tBaUNST3No?=
 =?utf-8?B?OVAzN1dEdVBBUjJCc0x6cW5SYnNKL0QrUFFVS0lIR1B2cWxlTWYwTUYwVkE4?=
 =?utf-8?B?RXFack5UUDc2bXI1Z2dUczNuYW1aQ0hmNEg1cEpvdzhwZ1NtMGdCUEhSeWUw?=
 =?utf-8?B?YXYrQ3RzNGc0TjZLNVlYU0pCMkw5NCtVd3dkWGFMOVFNQkZXRXl1YTJYM1JQ?=
 =?utf-8?B?NWUwaWJQTEJHbE10MURXbC90RmhQSE5xLzBsTEVNLzdnTVNNVVZJVjlEOVBX?=
 =?utf-8?B?RzZSVzJ5dUhsdVJ2c21ZNFdCemQ2VGR3cXFLNmFvV3U1Yk55SjRkalNjdk5s?=
 =?utf-8?B?aVowNzZBWXB3eEdrREVRVG9wUTBPNmszdjJsMW9meTJqRmkrY0VCOHl3czJ4?=
 =?utf-8?B?WC9lNjBVQmhvVUR5dUdqbEh4TWQ3NncwTlcvUnExdGx0cHhMak9zaVlGNFNG?=
 =?utf-8?B?bWJENWhFK25ibGs2bTd2WjZ3QWtRdlk2NWszb0QzeUxIYklBbnBoTTNuQnFQ?=
 =?utf-8?B?WkVrU1YvdVZqWGRrWjhyLzRBQ3NKZU5MOExBQkVuaDUydDBydmFVck8xYzhs?=
 =?utf-8?B?WkZtYjFUeC9vdjU5U0J2UE1WWmtvODVXTjNCT3ZHdzRmcnZaeU8xNFBoYjdw?=
 =?utf-8?B?WWkwaExMaWt3NkI0NHgvdTNRRmdIL1kyMnh0TzBWaCtIZW1QSnRsRVdJUnBM?=
 =?utf-8?B?YWUrY0ZCWklySzY2MmpleWhGZUVmS2hMV0RnZEtIWFNvb3lWenp2NXAySCtD?=
 =?utf-8?B?aStSYXZCdERDdEREQnBRZ1BMVEFSalNSb00wc0sySDJtd09MQ2N3c2QwZ0x1?=
 =?utf-8?B?L05DSXNHK3lyTlYvTUJYVkF5RmFnK3R0MXhHVDhibDkzZ09XVmdSZ2NlT3Vv?=
 =?utf-8?B?VEtFUUoyOFVKL0lYSmc4OGs2bVBDU3VPRUZkSWE1Vi83QTFyOXEzdkFaZGoz?=
 =?utf-8?B?bExGbEJEM1dBQlNPblN6NmIxUDZiWnpIb3dSWTg4YjNnVC9nQzV6Rm1ycmV1?=
 =?utf-8?B?UUV3VzM4ME9GZUx6bktFVXVoWDdVK0Z1djZHcWlvbi9IMzJleGl6NU5SbWxv?=
 =?utf-8?B?RERtTkZZTkJ0S1UyNU8ranIvRy9ybVVNbHczc2FYb1hwbEd3UTdPZWQ3UzdC?=
 =?utf-8?B?OU9BMlNvUi8zMThraEdoYzJycHBpRExRS2I1WHBPWTFGTzMwaHhvb3JXVnJn?=
 =?utf-8?B?Q0tRVU5CTXBGWnk2WUp3TmIva0d4RTFmc1Y1a1F4clFqVUM1anhKN0Y2NndK?=
 =?utf-8?B?K3FzR2JXVGo0cTNZeDlWTXVuTEFpcjRyVmwzRERRbG5MaWJjSHVKV1YvenN2?=
 =?utf-8?B?MW4yYllkakxTY2M3VjQyR1dwRDBmWkovcXBxQkxoZmEwSnVOQVh3MTJ2VzZH?=
 =?utf-8?Q?E7SNx5emnr0AP5zToQXIlWuo/?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d2016f-ba45-4ae7-f289-08dc7fc295ee
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 09:34:49.7672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lJaYAtstJOq/eO4jp52cpaStjig0RID+1rUaXonFHwkS1gJsQK5qAXnYHVybcU7ejgEpoY2jIArnHG4+YuNIMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7424
X-Proofpoint-ORIG-GUID: ujoGPnZZN-HItxJO5mFO-8MfOlIM1CvN
X-Proofpoint-GUID: ujoGPnZZN-HItxJO5mFO-8MfOlIM1CvN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_14,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 clxscore=1011 impostorscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290064
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 44T4ErO9029707
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 29 May 2024 09:34:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8778

Hi Bruce,

I did some investigation this afternoon. A patch series has been sent,=20
which mostly comes from 'grep + sed', and also includes a patch from Mart=
in.
I did build tests, the result looks good to me. I think the only=20
remaining recipes that need to be dealt with are: yq and possibly runv.=20
I'll need to do something else tomorrow. Hope you or someone else could=20
check more.
Hope this would help a little bit.

Regards,
Qi

On 5/28/24 04:37, Bruce Ashfield via lists.yoctoproject.org wrote:
> As an update. My patience is wearing thin.
>
> The posted patches don't build for me, my changes don't build for me,
> if I hack things, the runtime is broken.
>
> I'm seeing different fetching and source management based on the
> number of git repositories in the SCR_URI, which means I'm running
> into everything from missing source to license checksum failures when
> I reorganize the code.
>
> I'm stubborn about this sort of thing, there's no sense in me just
> merging patches that don't build on my machines, and/or patches that I
> don't understand how they fix issues, since I'll never be able to
> maintain things afterwards.
>
> I am still working on this, but I'm no debugging oe-core code to try
> and understand what is happening and why the behaviour is changing, so
> everything is extremely hacked up and I'm not even near a RFT branch
> yet.
>
> Summary: it will be quite some time before I have meta-virt working
> again, since I feel like I've had a bag of rocks dumped right on top
> of me and changes to core that I don't have straight in my head yet.
>
> Bruce
>
> On Fri, May 24, 2024 at 3:40=E2=80=AFPM Martin Jansa <martin.jansa@gmai=
l.com> wrote:
>> On Fri, May 24, 2024 at 9:32=E2=80=AFPM Bruce Ashfield <bruce.ashfield=
@gmail.com> wrote:
>>> Interesting.
>>>
>>> I've been through the layer now and have done all the simple semantic
>>> changes to adjust things.
>>>
>>> I'm almost to runtime testing, but expect that by Monday I'll have
>>> everything sorted.
>> OK, looking forward to the master-next update (and kirkstone update)
>> to have a bit greener world builds again :).
>>
>>> Bruce
>>>
>>> On Fri, May 24, 2024 at 3:26=E2=80=AFPM Martin Jansa <martin.jansa@gm=
ail.com> wrote:
>>>> It was failing yesterday, but today it built OK, I didn't do any
>>>> runtime testing (only checked buildhistory-diff).
>>>>
>>>> Have similar change for nerdctl cri-tools, only yq and docker-moby a=
re
>>>> still failing for me.
>>>>
>>>> On Fri, May 24, 2024 at 9:22=E2=80=AFPM Bruce Ashfield <bruce.ashfie=
ld@gmail.com> wrote:
>>>>> Did you get this to build with just that change ?
>>>>>
>>>>> My patches to cni are significantly larger to get it to build and
>>>>> create binaries.
>>>>>
>>>>> Bruce
>>>>>
>>>>> On Fri, May 24, 2024 at 3:09=E2=80=AFPM Martin Jansa via
>>>>> lists.yoctoproject.org <martin.jansa=3Dgmail.com@lists.yoctoproject=
.org>
>>>>> wrote:
>>>>>> * see:
>>>>>>    https://lists.openembedded.org/g/openembedded-architecture/mess=
age/2007
>>>>>>    https://git.openembedded.org/openembedded-core/commit/?id=3Dcc4=
ec43a2b657fb4c58429ab14f1edc2473c1327
>>>>>>
>>>>>> * fixes:
>>>>>>    http://errors.yoctoproject.org/Errors/Details/772691/
>>>>>>    ERROR: QA Issue: cni: LIC_FILES_CHKSUM points to an invalid fil=
e: TOPDIR/tmp-glibc/work/core2-64-oe-linux/cni/v1.2.0-rc0+gitb62753aa2bfa=
365c1ceaff6f25774a8047c896b5/cni-v1.2.0-rc0+gitb62753aa2bfa365c1ceaff6f25=
774a8047c896b5/src/import/LICENSE [license-checksum]
>>>>>>
>>>>>> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>>>>>> ---
>>>>>>   recipes-networking/cni/cni_git.bb | 2 +-
>>>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networkin=
g/cni/cni_git.bb
>>>>>> index b41b47cf..c0f316ec 100644
>>>>>> --- a/recipes-networking/cni/cni_git.bb
>>>>>> +++ b/recipes-networking/cni/cni_git.bb
>>>>>> @@ -14,7 +14,7 @@ SRCREV_plugins =3D "b6a0e0bc96906f0d3bd6bfcaab0b=
5ae72292f46c"
>>>>>>   SRCREV_flannel_plugin =3D "6464faacf5c00e25321573225d74638455ef0=
3a0"
>>>>>>   SRCREV_FORMAT =3D "cni_plugins"
>>>>>>   SRC_URI =3D "\
>>>>>> -       git://github.com/containernetworking/cni.git;branch=3Dmain=
;name=3Dcni;protocol=3Dhttps \
>>>>>> +       git://github.com/containernetworking/cni.git;branch=3Dmain=
;name=3Dcni;protocol=3Dhttps;destsuffix=3D${GO_SRCURI_DESTSUFFIX} \
>>>>>>           git://github.com/containernetworking/plugins.git;branch=3D=
main;destsuffix=3D${S}/src/github.com/containernetworking/plugins;name=3D=
plugins;protocol=3Dhttps \
>>>>>>           git://github.com/flannel-io/cni-plugin;branch=3Dmain;nam=
e=3Dflannel_plugin;protocol=3Dhttps;destsuffix=3D${S}/src/github.com/cont=
ainernetworking/plugins/plugins/meta/flannel \
>>>>>>           file://modules.txt \
>>>>>> --
>>>>>> 2.45.1
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>
>>>>> --
>>>>> - Thou shalt not follow the NULL pointer, for chaos and madness awa=
it
>>>>> thee at its end
>>>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>
>>>
>>> --
>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end
>>> - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8769): https://lists.yoctoproject.org/g/meta-virtua=
lization/message/8769
> Mute This Topic: https://lists.yoctoproject.org/mt/106287452/3618072
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub=
 [Qi.Chen@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


