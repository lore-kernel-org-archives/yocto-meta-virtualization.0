Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FBDBC433EF
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 07:07:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8657.1642662476749899627
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 23:07:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=jY0uEep9;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=8019647b9b=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20K6vsKZ017054;
	Thu, 20 Jan 2022 07:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=ipcPm0GjMrSBejZvXQM5XViC8pZyDWqpXFH4m3Zxp0I=;
 b=jY0uEep9VtLT6EX3NSKx6nIWo8g5nWVD6V2tE7Ryw9SR/9dE99WSzzu3wFPJPuPQaohM
 kkH32G6nUMBQeJFde8SXaUbW0J9ZhG/OVfKeozpP4yC03Y/6Q4Xe4ELybvOqdLHwV2q+
 sQS8oo1iWHbG1nhUO2zbi9JlqrWDGKnKzGzfThExc+/CYU3m1xeiJc5clws/wvMQRT4v
 dUAXv6qcNXDfWMVNsD5IIdlFDLbgrZNMXbUH3kCq04etQvsrjizOYaa04ALelTpj4qB9
 jevOdkaQD53a21E7WoR8OP7QgxVQww+/fBn7Jnibrx8X6AofSA8jU0lXzCFleATvfwmr oA==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dpsfk89pf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jan 2022 07:07:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vsu9/Vb/UDcl5jMDLrOaypGV6kUsYYkThDFOJUsdaqE4iukouMTTKkzz765A6Omi6qIm+wvne+OGvV5gqnPaaw5LyJ9HI1d1aXWuK/IvbRtPRNMggZqvO+JTf6sJuxEKLg6n/u2J/e9h5lU/J08lqsb4T+pdp7Rxlb9Zks9AV1jDIk2k6N0OTsGJc6AHZu7S+JuNLLGFQP+OvAcl+w27rSqmwlHoH+18UuIbS/ZdK3RCPo9ksPhJPZqjqx64qg7L1qC/h5tGUzK8fAuNG93DmYsY8JTpqM3cEDR6Z85+5q121IkuPbdmLXc95kp5iHUKDl+iUJe7ZoIlxNXjb5v0fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipcPm0GjMrSBejZvXQM5XViC8pZyDWqpXFH4m3Zxp0I=;
 b=i4ZRV43dDqOavx7B/oG83PR8REq6G283vgvDlFNNjCLL/Yl1mMTBHJyPLngGyWFNloZ+c/vSfPrJRoFclDfkBkfFhVcNB4ewmjfL6R4w0i/BlI09TWoZ7vQtkZRy5JsZQehg6FnHMI9FNINMMuGnfi7VwuHsQrpqJ6Kh0hT0s40qJLBuAjuSKgguGOeknIHqvlU2gEmLp7ta06jtFcbzqnzS7MtD1rE1TGVfX71sz7tCjRUfZ0cVywIwjBoTgCB3/S7z/Ux7lams2SFx853mSH2pBn20D39pKVQini4cyl+/0j3lD1n8nsmY9zO+0Lz+5ixNH2IPAdkv7aok+Efxrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BYAPR11MB2789.namprd11.prod.outlook.com (2603:10b6:a02:cc::11)
 by CH0PR11MB5428.namprd11.prod.outlook.com (2603:10b6:610:d3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Thu, 20 Jan
 2022 07:07:52 +0000
Received: from BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::5cb5:e426:2e48:17ed]) by BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::5cb5:e426:2e48:17ed%5]) with mapi id 15.20.4909.010; Thu, 20 Jan 2022
 07:07:52 +0000
Subject: Re: [meta-virtualization][PATCH] docker: Add kernel-module-xt-nat to
 RRECOMMENDS
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20220119115956.1104692-1-liezhi.yang@windriver.com>
 <CADkTA4M3L97amNq62TyRGUnkSn7LDHzJkL2vz4cDJxW+AtBtUQ@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <a78a7025-154a-c71d-cad9-9bb0d8787ec2@windriver.com>
Date: Thu, 20 Jan 2022 15:07:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <CADkTA4M3L97amNq62TyRGUnkSn7LDHzJkL2vz4cDJxW+AtBtUQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK0PR03CA0100.apcprd03.prod.outlook.com
 (2603:1096:203:b0::16) To BYAPR11MB2789.namprd11.prod.outlook.com
 (2603:10b6:a02:cc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3862b473-eb79-4194-28a0-08d9dbe39319
X-MS-TrafficTypeDiagnostic: CH0PR11MB5428:EE_
X-Microsoft-Antispam-PRVS: 
	<CH0PR11MB5428BD3DD6570788F08BBC6BFF5A9@CH0PR11MB5428.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	37JmtdB8DiMMvdZr2NvsrheT3wIB8LAXlF1ddQ5S+S4NFv8xsiVnUmg6zX/A+J1e2n6TF7Pqv6UMcnt5ZKR/06yAe0XwaZk96YXjc4mJIYbpCXpQNtSq6M8Md1QiMyPySwSHrKZ/z1e+V3etZrC1yNQ7UQ+RPcJJKbavA3JeAJIjLS5Efwug+TD3o40M89ycn0o3uwPlymyQTDk7Ed7gD6jYiHN2/VtYm5q0zzKzUDyLXNOC6y51VJSQJDUMh0kEPg+XnTpNWoXNY44a9XlN53ikVCe5NtUMlAxcUoW49t+35iO56SDeX8qhgn7oyZuzKZYRX7t7yyOTC1MeTTb+1h88pvSFfRINp3IVCMkKBQfut6Q/nSrU6xYGoSvF0MIKwPgaZgePYOv/UfI1AenZXQbJtATTxHjik8K/TgsjMDrgAfKWsKxbyR/ifKoh41B5ODyhj7olj9QG4TkeF+P2mW3Y9poq89lVbrn6KEO234Srw7jkOQ7N69SNOL+lmGeNOyK9EYD+Jbvq5HgrjWJvx4TU+NlS0j4yydX+6/j2JbVsnrFpTDi7BaDG0iYV0Pf0XTnhrgOcVijQObuRcUTqTjGX8jBbGhsRp7H2cYVdAWgYNPftIuFJPJVzcAqNdCD/qY18jGIOpoiqQOud4yzrrNet4P6E9EkdrgD1PP/bPvWrtgIKBf9utwFauMlegvNyZUl8xzCvr+rE1JWR6UtJ33XROfL1oKB1M3YUbhFHsd4Bo/XppaSDXFmwvRHvOh+vEurzPwhKHaiQIxlnTiJUNA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2789.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(316002)(6506007)(83380400001)(31686004)(38100700002)(53546011)(6916009)(36756003)(26005)(2616005)(31696002)(186003)(52116002)(86362001)(6486002)(4326008)(38350700002)(66476007)(66946007)(6666004)(8936002)(508600001)(66556008)(6512007)(2906002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d3U0cHRiSkMvQXl6ZHRROGhSQmZ1SXFmNVY5SldySUQyRnZIblowT01MeGli?=
 =?utf-8?B?NHNrZUg1WHBUNW1ta2hjbEVoSzJIZVlBUGRwakRhVE1mVWhzMzVXSTgyejJx?=
 =?utf-8?B?ZVZadVlsdkZlTEFOL0w5R25VRlp1ZTYyRmtPdlVMcUh1NlBTaEZSNk1vd080?=
 =?utf-8?B?dTYvN0tCZTRTblU3NUJZdmRaY01TY2p6QStNRnNjVGdwTk5RNU9jcmEvYytj?=
 =?utf-8?B?VDllSWJxWXZQS3JZOGVUMGRzbzhZbTE1OXJxM0wvdFZjRE1vcHcvazIrRmNr?=
 =?utf-8?B?Tjg3VmFyMnJEbnIvVTRqbmNVSmlNdUhOV2svOWE3Sll0NXZ4YWRkK0VWZnBx?=
 =?utf-8?B?YUNuZmlzdlZ3R2JhTXlvVWRCL0VlL1RySDlTQlhXRHdVVFhlb2NNcE40TGRi?=
 =?utf-8?B?VnZ2emlkcWRHZ2lON3NEbHlpZXRtTmFFdG5Cc05BazVVU0EvbHNVQ3F6VXhQ?=
 =?utf-8?B?SkJOTVNsaEdzRnAvdE1aNkJEYTFqZFFFb1dZbURnaXEyMnFxQVl1aUpFMlVy?=
 =?utf-8?B?UmR5Si9qakttMW1HZVBOM2tVbExaVkd2UXBVR3dzRGtEbFlXMUVNWTJsNkJw?=
 =?utf-8?B?Mk9zdVdSM2Y1UlZHRkU2NkhFeVVFZTNEMG42Q2xJYm1QQWh2cTNzd2VzQjVP?=
 =?utf-8?B?YVJ3cktaUXBGSkY5MWExZ1ZCUFRaVytaRmY3R2tWbnZ1MEQwazlEbkVZWmFE?=
 =?utf-8?B?Z2JWQ2N2SFFWaklpZVlhcWFTMDhmazkzb2ZWL0dpT3FPM1cwS3lyWjNsTGt1?=
 =?utf-8?B?U1Y4WDBsNEVqUElhQVAvWkdiSU1NU1A0aW9tbktDOFJCU1Y3ZnRQU05tUk1h?=
 =?utf-8?B?NjJ1VkFCVGRHSnBaR1UxWXVJQW5rZEcwbzNSUWkwNGxzVFZNeGQwU1hKVUJP?=
 =?utf-8?B?U1F0MjJkckhwd0xrNDY2YUdTVmpXLzFEcmhxZCtuNjF4ZmxmMzBCSm1FUTNO?=
 =?utf-8?B?OXdBc3U2RUpteHVMV3hoY2ZzQldXQlJBNFhFcEdQb1RadHNvNlEwZXJYcGFi?=
 =?utf-8?B?Y1FvZEE5aktJNUlaRTdrd2c3R0lJNE1jT0hxQ2pLMHdlRnBhT0xnbHJkSm9J?=
 =?utf-8?B?TEF5YWNjUC9MWnB2ZkxTbnllbGx6cEUxcHVMZEY0dXl1R08rUkNDbTQxQXZR?=
 =?utf-8?B?M0FTd25DSWFOVUxjQlhvYS8xUDFBZWR3Z3NLR0xyNjVwQWM3NEkvZmVwQ0Zs?=
 =?utf-8?B?elE0d28xaUwzN3hWQkMrcXhiT21CcHNZNThlWGpXdzlNMHdFeExTZmFmT3Rz?=
 =?utf-8?B?RmFiZ21GVnlUcTNDWnQ4WEU3dVg3ZmlmemkyVTZwcTkyWE80OXZIdm1hdnY0?=
 =?utf-8?B?WUNpVEtxc25HNFl5TDMxTlVmNFhrRlIySUY3WDE4bjFacmNpNVdETCs0Z0Z3?=
 =?utf-8?B?Zm5JaUw5bmtqTE1XVDBYLysydHNWSTlwSzhmQWp3cjFUYmRqd3UzYjBYeFN1?=
 =?utf-8?B?bHRkNTRPQTAxN0pTUkl0aHpZSXF4YTdzYjFhTllEaFBBVkZpeERxbG1La2JZ?=
 =?utf-8?B?Y1ppRnFRTGZLYVkrTldtb1J4YURXK2UwQWRTV2l0ZW9meHkyYnZpOEJ3SkhD?=
 =?utf-8?B?WmdJQzJmM0xCdHIySXlRTml4WTJLeVFsZ0J3cEdpbFQzSlpidDdzaTk1U2th?=
 =?utf-8?B?ZmNVUnZBaDhpdDlDZy9yQ2tXcWlqVGhlMHVNZFpROGJ0YVp1VzlxYVRMN3pW?=
 =?utf-8?B?NzdsYS9aNlAwYWtPVTFiM2dGZWJQcUxoUG1SbThmak1sdzYwbDhQVDVtcU9h?=
 =?utf-8?B?SVphNHN3TUtiNFpiN2tlU3dEcVBZQ0RoTzBleEJvZkRBN0J4ZkhmUGFuYVh3?=
 =?utf-8?B?Z2h5ZlRqSGpCQmlOLzE5ZDI0WmtibXk2clQyZnE5SjJTU3NyQWVYOHU5aDVK?=
 =?utf-8?B?VXFwWmRud043TkdEWVQwWHIzQyt1aDhBWTBHbEFHc1RCZU54Q3FsbHVNTTht?=
 =?utf-8?B?Y3ozOEppdWd5SFd6QU5kVUg4SFl5c0lVS2xMVUhFbkxEcHp4VC9wdXFuWVlL?=
 =?utf-8?B?V1lHZVFMQ24zYjFUSks5ZFEwNnNrVWdaT05ON1pRWXI4dTdtNFE0TjdVUXRR?=
 =?utf-8?B?bHdIem1ScytiOGROYVdlNjBtWjFDM01zWVNLSnlIZ1BBV2FsOFZ3TjJIai91?=
 =?utf-8?B?SHNIRU5FZW1sV2FEdVMwUzc2OVRjUHZFMnJ0YVI4SlFOaVZFbWRkcGc5Q0Np?=
 =?utf-8?B?STZOamwvdVFmd25DZTcwSW9JM0lsdXhBNGVZQlRkakJlVzVZV2JqYVp2WE1u?=
 =?utf-8?B?ZHJVdko0NzlXTm00ekFBeGk0NXNBPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3862b473-eb79-4194-28a0-08d9dbe39319
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 07:07:52.3156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 79BPKE5mVvbqT/SUSmYAzAe3KpjL3ccl6+1zUH9sh7PNbZaEzxHLpFURuptpSuFUnWWh+qxJCsSe6fIiDGer44jYEKzfnkEMfBfg42LTTa0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5428
X-Proofpoint-GUID: 00W97jGDF_cti0bNadlZ5loyQG5I3ym-
X-Proofpoint-ORIG-GUID: 00W97jGDF_cti0bNadlZ5loyQG5I3ym-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-20_02,2022-01-19_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=949
 spamscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201200036
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Jan 2022 07:07:58 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7030

Hi Bruce,

On 1/19/22 9:34 PM, Bruce Ashfield wrote:
> On Wed, Jan 19, 2022 at 7:00 AM Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>> Fixed when kernel-module-xt-nat is not installed:
>> $ docker run --rm -it -p 80:80 alpine
>>
>> docker: Error response from daemon: driver failed programming external connectivity on endpoint elated_cori
>> Try `iptables -h' or 'iptables --help' for more information.
>>   (exit status 2)).
>>
> 
> There's already a pending patch for similar changes, I'm still
> working through the unification of the meta-virt fragments and the
> kernel-cache fragments, so I'm not doing any of the RRECOMMENDS
> changes at the moment, until I have that unified.
> 
> Since we can recommend all we want, but it can't fix a bad
> configuration, and that's the issue.

Yes, makes sense, do you have a clue on how to figure out all of them, please?

// Robert

> 
> Bruce
> 
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   recipes-containers/docker/docker.inc | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/docker/docker.inc
>> index 40a3642c..e7bdc388 100644
>> --- a/recipes-containers/docker/docker.inc
>> +++ b/recipes-containers/docker/docker.inc
>> @@ -29,7 +29,13 @@ RDEPENDS:${PN} = "util-linux util-linux-unshare iptables \
>>                    "
>>   RDEPENDS:${PN} += "virtual-containerd virtual-runc"
>>
>> -RRECOMMENDS:${PN} = "kernel-module-dm-thin-pool kernel-module-nf-nat kernel-module-nf-conntrack-netlink kernel-module-xt-addrtype kernel-module-xt-masquerade"
>> +RRECOMMENDS:${PN} = "kernel-module-dm-thin-pool \
>> +    kernel-module-nf-nat \
>> +    kernel-module-nf-conntrack-netlink \
>> +    kernel-module-xt-addrtype \
>> +    kernel-module-xt-masquerade \
>> +    kernel-module-xt-nat \
>> +    "
>>
>>   PROVIDES += "virtual/docker"
>>
>> --
>> 2.17.1
>>
> 
> 
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> 

