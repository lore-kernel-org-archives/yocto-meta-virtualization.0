Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC22EB8FD9
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 14:25:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10445.1694010302098096212
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 06 Sep 2023 07:25:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DdLrT+HT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7613f548c4=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 386BioHQ022549;
	Wed, 6 Sep 2023 07:24:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=7KYLO4TlvWFXgF87ANw
	A6BL2iWpiaNs8wGx+kRWBk1w=; b=DdLrT+HTnhHlAAjW1Kny3f2c5D/JEHtYbH8
	eeZO6/vbx8b+J36KRnc8ujKKslFMB9sCWz9a+bvhJ8BFSDs6wz1tvf+15ZDWmw0B
	rWftC9f/iks3PjCHQ5xvMCZRmaKkPUiFTKhJyy7Deod57NBHBjtuLHowcm/B/Nix
	y8jF6gDttYLfQMal550m9xD0HkxRPMyyoGsZmIBrdgDWJ63fLjB5yvBWiJ/H/ZMr
	LQRSfJU85PtzGFTHZqR/1ayIHhzZSMhCoNXE91wludl39k+0cnopCDM3hRCBlmFz
	3vk9VoB/ypafpEQlyZxQHdW71SSveOkIxUCnGwiTi44eWDZW8jw==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sv0b03h11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Sep 2023 07:24:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kcbP/utUtSIenvgAhrB1QcEoyFB5nqJr3EMFXJMj5Wb8o7/VSShc9KwdOOoKBnSkwdU8EW5SZ6VG6BAqTWQEvSpSWexWjrKyh1owFkpB6cuL2Pltfnk1DhjtDzUaxh+vtkPSWV7DqYLxOhNJDJmEtGU7iH8KCjZ++P92r3BZskgg5JjjOkzL7G91YRqTHneFIfYg9KhEyDWjuptnb/tPAA8YKbwVUSu8lJhIXOrTaDI50OjbXt48IGUOLeYiI/lg3TlnUKRbVXfaJ6Eau3BeEoagE5uJHYKthoqyT+D93dT+E2FcSmy9qpfWktUl14HFO0XQFbyDtonS4WXU/pKduw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7KYLO4TlvWFXgF87ANwA6BL2iWpiaNs8wGx+kRWBk1w=;
 b=ILYhhBkFFP7OsklfHZnXEqHl9XiaokHmS0bF6mvdECasG63183xn6qNBrV8MgaaTuiULYmwLWKn2eNhRGMj2HRMLpsHUTQIv/ju/SbMyXe0FMIgMdmOFftbu+YFy/HlyRTemPhW9f3rHPGkhkVEbpHzREfuCubNvn52/rTTHr7MfLVAfA1TLtDwY2JDZog+37ppSdAVhVs6Lg9QiMwcCpgPAo0QBDAiP7xeMLVcgmsAWAZjuFRjfIdBsPeklFXAaxuBJJoKSz5oPG8noa1fe+AOHmW5YupaIvWyNCfJ7D6K2cFOMyz0qUN7Mc5yowJQf6nk4eXN47KrwACKjndBeVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM4PR11MB6096.namprd11.prod.outlook.com (2603:10b6:8:af::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 14:24:54 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::d2d8:3f97:b35:ee7d]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::d2d8:3f97:b35:ee7d%3]) with mapi id 15.20.6745.030; Wed, 6 Sep 2023
 14:24:54 +0000
Content-Type: multipart/alternative;
 boundary="------------5fHW8dEFvyo5P617qcjM0k8m"
Message-ID: <9c5a6ba1-f1c0-2aa0-9143-e40e4285b828@windriver.com>
Date: Wed, 6 Sep 2023 10:24:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [meta-virtualization] [PATCH] oci-image-tools: don't build for
 riscv64
Content-Language: en-CA
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org, bruce.ashfield@gmail.com
References: <20230901090308.3242531-1-changqing.li@windriver.com>
 <ZPVJdC6MVeoKurB+@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <ZPVJdC6MVeoKurB+@gmail.com>
X-ClientProxiedBy: BY5PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:a03:180::19) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|DM4PR11MB6096:EE_
X-MS-Office365-Filtering-Correlation-Id: 54f1b1af-b816-403b-f40f-08dbaee509e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MSASDJUfrlJn2ra+BNPAmUJgRTJNB2qXJu7eZ/NmLEUNaysxIZgj+sXzZ1WVTRMsWtvh1fgGWXHZdGY9Ia56RSXz9/CI3YBoq/Fngmf/qsAAVljMkLnj8ivOLrGVLoDaiQOtS4fVxi4T43uJ9Iu9+liT5mS8S/SGThghUKT8OdplFkaFmAZlM0HfYS2B18H9v0BJV5ikTfzDZwDGcdBjl/gRRxb2sBxgX1poeYmG24AOFuUs+2qCGeyes8hz3CLXwL7rVurwuoncZyWrCxkVU4GXkcelul0upvJaoeCU8s9z5l7S6tWNepu/NXMdCvtYRG/5/PInQI19HzoXOTTvySgo4wyJ9qq1DVuUqEyKkoCO4rtByr8UBVXenjqwH/szzbJ8DO6pfKxIQd18Oqx5hNwF4RWDOzHDhnP89UnqGjXIez3PVpVQbI2eviuShDHlTcGUKNZ0SdCUtmjqVxWCpbYaW5jUAk53c7pFcEJkm2HxQum4JzghvSIZq7Qk9ctuVeFo+BQUXLkInsNBQBP3yM3OOIvyAr4G2uhq8oiQto+blGcxOZ1MlpBQ1zDc1+KFbuAv04fKZhj1iAV1P1rUu5agzOfQ0+JoA+wgMiZOakHqLv2R3/G+ke4RmlrPcR5Hmv8Wvwv4zCyvnhZK8/u4eg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(366004)(346002)(39840400004)(451199024)(1800799009)(186009)(53546011)(6486002)(6666004)(33964004)(6506007)(6512007)(966005)(478600001)(83380400001)(2616005)(2906002)(26005)(316002)(66556008)(66946007)(66476007)(41300700001)(6862004)(5660300002)(4326008)(8936002)(8676002)(31696002)(36756003)(86362001)(166002)(38100700002)(31686004)(66899024)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U09TRG0vdkd0QVBvSFJ1aWw3QWxNSGkwNGNtd1gyKzJnblVzdm4yTzg2RWNV?=
 =?utf-8?B?b3lPbitsL0xzWWtrYTV1S3YvMnJ5TzVJUTMvbThGZS9EWFNhS0RBT0NGcm9W?=
 =?utf-8?B?MGZvRVArWEFYOWhET0NSVC91blFoRWg1SjM5bjFlaEJXVllyS3NVL0cxTVN3?=
 =?utf-8?B?TW1reCtPQzlreUdkU1h5bXV0d0tEbDJNOFRKK2VpdDhSajhFNldvVTlCdDYy?=
 =?utf-8?B?VWUvblVIakFxYnI2RnNXaTVEVkEyUHlZUEJZMHE4ZEkvendnUkdnaGhOZ3dG?=
 =?utf-8?B?dVR3U0pOejU5QldiQUZYQlJPbTV0Slh3NERWTXZtWGE5RURLNzBMSEx3L0ps?=
 =?utf-8?B?RTBlNmdJSkM4UjQ5M1JkVWlaOVJXamJjTEdCSmVsbFNhTk8rRUdrUkp5TEwr?=
 =?utf-8?B?c1JoSk5JK1ZHQmtXYVlvZ3VGYTk0NWpuMnNqYzlIMDlnbUpuUXJHdTBGRkJN?=
 =?utf-8?B?Zmc0cnJRVHhwY3VaYUNHTDdiekdhQUlrcndhcFpXaGZHaG90RkN5Sy9EWE5n?=
 =?utf-8?B?ckJQNGdJVEl4SFRjTUdjdjJnc1kzVnJZcGJRTUFOVmVlTmZOSnZNUjlSWmRH?=
 =?utf-8?B?bkIzejB0VnpXRkJkUkdyZUYvY2I0aENlOXNrT2hmTFpLYTRnais3eERJUkln?=
 =?utf-8?B?L084QWFKdmtyQTR3UFNyM0hZUjdhRnI0MXh0SGt3elFYQVB5S2hrcjMwZ09q?=
 =?utf-8?B?bExhWjdGaDBBYWovYzZWYm5KZkVPNi9xWWR3T1BUMlpDcnFXSlFkT2NvLy9t?=
 =?utf-8?B?YjJWaksxcWNSVWdaclZwK1Bsay9LNVh5RkJXZS9raTJEaDdRc0NEK3VCUG5p?=
 =?utf-8?B?NkgwakFyTHRqWVY2ZTdoWmN1dnlZczJnVzVaclNlSGNZUXNrUjlLVTBKQlNh?=
 =?utf-8?B?WjB0SHY3aWpXMEplZ2xPNG11UkVkaHJSVG4rVFF0YkRXOWlrUHBZVDZOWlNT?=
 =?utf-8?B?SjFQVmdaSGN3d0kzYUhoMEM4U29aUzJPeGkwKzg4cUlyNFYxWnNFeEQ2cGk0?=
 =?utf-8?B?WUc1WEhSK1o1ZUs0REJMR2RBN0tvQ2oxVWVjditoTXdORVFZSXo5RmE5elJm?=
 =?utf-8?B?YitJVGNiakM4ZzVMc1B0NTdaRjhUNkVIR1IvaWY2UnREelNSckFtVXVWbDg2?=
 =?utf-8?B?RjBCbkFDOHRyemZKbmlTS1ZEN3lVUW5iNWtFb0J4Q1BkRGtPdzBRRFc4TDlQ?=
 =?utf-8?B?cWk5aDZXOFFMYmtuWEMwSkhaY3VDUzg1alBpRmxmcXFqaVR2Y1JSN3Ryakpt?=
 =?utf-8?B?Um8za0lsYWlGTHZmTE5FK3pmbzJoMS9hbXFxalpjWS9pa1owam5tUVRzV2FZ?=
 =?utf-8?B?cUIzV2gzTEU5RUliU051V2lqSUVCN0p1UmhSZktJemZCZHBPLzI5NHdESFp6?=
 =?utf-8?B?Y2RPaUdETVMyd1l4dGQycTFJMm80MDJxaEpVY3AwWkVldy92SjkyY1N6R0pu?=
 =?utf-8?B?ZlJ0eWVHY2x6ZUd5MC9kczhqSm01TXFzcEwyMkg3dGEyZjllK1VkQm1jcEZT?=
 =?utf-8?B?VEt0ZTBmVDJCcnV2WU5FUzN2UEVCenRxNE9lenBiK0o2V3hXSmphd0FFY3F3?=
 =?utf-8?B?ZFBNR1AxUkN4bEF1MmJRVGQwNXZVZUR2dTNyWUNIVW16cGNKSXByWE4vMjlD?=
 =?utf-8?B?VENZZVI2ZkFwdkdLQWUzY3VrMGN2MXZqZzRFb0pmMFdVWnZ3NnBoK056dVda?=
 =?utf-8?B?MTBzZWM5M0RFamFmOGMzNHJrcktNVVBwYkUrSnhNSGtPUC9WMUxjcVBDR1p0?=
 =?utf-8?B?eSs2RjB3UTJwMTE4ZjYyZ0xTNXhBNCtRaWpGVVk2TW0vY1plWDRNcUZwNGYv?=
 =?utf-8?B?TDVFclhaL1RuMkNZRXF6QUZJdHBNQWtVVDlTdDk0NkJUZWJzL1djWFkwNGN0?=
 =?utf-8?B?cUFXWjJ3SzRRbHprNFM4MzNTdXJJczZXWDc1NU5VVWR4alhjNUdvQlczd1dh?=
 =?utf-8?B?aS9DV3pVWWd2WjgwbktDRE9FU3Y3Y3pUZ20zaFptQ1h3MkIvckZQdkdscTdH?=
 =?utf-8?B?T3RJRFFWSDljaFEvZk1jWlFOWkt2UFJZempEcERFNjhXOVYzeklEODJvUFFH?=
 =?utf-8?B?SkdJTExpTmNCejhHbWJmWGdiM3QxSEhkRDJveFFyUGNtZ0tocitzMnh2d2VP?=
 =?utf-8?B?djlCS1QxVzlLK2hsQlRiK1BtQUpvT255cXNuRVY5UlNWNjJxakxpckkyT0Mz?=
 =?utf-8?B?SUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f1b1af-b816-403b-f40f-08dbaee509e5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 14:24:54.1614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X2jTayLo+QO3QkTE2gAY2vgv6Wm29IqVZN36D+6CZBasyFpHd+Vud1Ot8mc4gX4vyq4GF6Tg1TQSbzlCEFTU9ZCBXaWq0mKGPBVrmsb4ZtI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6096
X-Proofpoint-ORIG-GUID: SyhqXzMJ8IhvbdCUvXkv_pZYawfU0K1Y
X-Proofpoint-GUID: SyhqXzMJ8IhvbdCUvXkv_pZYawfU0K1Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-06_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxlogscore=889
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309060124
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 06 Sep 2023 14:25:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8280

--------------5fHW8dEFvyo5P617qcjM0k8m
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-09-03 11:05 p.m., Bruce Ashfield via lists.yoctoproject.org wrote:
> Since riscv isn't tested with meta-virt at all, this isn't
> the only recipe that has either build or runtime issues.
>
> This is staged to master-next.
>
> Bruce

Changqing,

Should we report the issue to the upstream maintainers so that
should riscv64 actually become well-supported in meta-virt
over the coming years, this particular issue stands a chance
of being resolved or are 'go' packages just not there yet for riscv64 ?


Thanks,

../Randy


> In message: [meta-virtualization] [PATCH] oci-image-tools: don't build for riscv64
> on 01/09/2023 Changqing Li wrote:
>
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> Currently oci-image-tools has a do_compile error for riscv64. The
>> problem could be reproduced by:
>>      MACHINE=qemuriscv64 bitbake oci-image-tools
>>
>> So explicitly set COMPATIBLE_HOST here to avoid it building for riscv64.
>> When someone interested in using this recipe for riscv64 fixes the
>> compile issue, this setting could be removed.
>>
>> Also don't build packagegroup-container/packagegroup-kubernetes since
>> they depends on oci-image-tools
>>
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ---
>>   recipes-containers/oci-image-tools/oci-image-tools_git.bb | 2 ++
>>   recipes-core/packagegroups/packagegroup-container.bb      | 2 ++
>>   recipes-core/packagegroups/packagegroup-kubernetes.bb     | 2 ++
>>   3 files changed, 6 insertions(+)
>>
>> diff --git a/recipes-containers/oci-image-tools/oci-image-tools_git.bb b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
>> index 4beb3a63..8c5020b3 100644
>> --- a/recipes-containers/oci-image-tools/oci-image-tools_git.bb
>> +++ b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
>> @@ -29,6 +29,8 @@ EXTRA_OEMAKE="BUILDTAGS=''"
>>   
>>   S = "${WORKDIR}/git/src/github.com/opencontainers/image-tools"
>>   
>> +COMPATIBLE_HOST:riscv64 = "null"
>> +
>>   do_compile() {
>>   	export GOARCH="${TARGET_GOARCH}"
>>   	export GOROOT="${STAGING_LIBDIR}/go"
>> diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/recipes-core/packagegroups/packagegroup-container.bb
>> index 8d418e95..c41576a3 100644
>> --- a/recipes-core/packagegroups/packagegroup-container.bb
>> +++ b/recipes-core/packagegroups/packagegroup-container.bb
>> @@ -4,6 +4,8 @@ LIC_FILES_CHKSUM ="file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda inherit 
>> packagegroup +COMPATIBLE_HOST:riscv64 = "null"
>> +
>>   PACKAGES = "\
>>       packagegroup-container \
>>       packagegroup-lxc \
>> diff --git a/recipes-core/packagegroups/packagegroup-kubernetes.bb b/recipes-core/packagegroups/packagegroup-kubernetes.bb
>> index 70dc9713..7e6937b1 100644
>> --- a/recipes-core/packagegroups/packagegroup-kubernetes.bb
>> +++ b/recipes-core/packagegroups/packagegroup-kubernetes.bb
>> @@ -4,6 +4,8 @@ LIC_FILES_CHKSUM ="file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda inherit 
>> packagegroup +COMPATIBLE_HOST:riscv64 = "null"
>> +
>>   # k3s has this restriction
>>   inherit features_check
>>   REQUIRED_DISTRO_FEATURES ?= "seccomp"
>> -- 
>> 2.25.1
>>
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8267):https://lists.yoctoproject.org/g/meta-virtualization/message/8267
> Mute This Topic:https://lists.yoctoproject.org/mt/101090972/3616765
> Group Owner:meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe:https://lists.yoctoproject.org/g/meta-virtualization/leave/6693109/3616765/950573401/xyzzy  [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------5fHW8dEFvyo5P617qcjM0k8m
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-09-03 11:05 p.m., Bruce
      Ashfield via lists.yoctoproject.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:ZPVJdC6MVeoKurB+@gmail.com">
      <pre class="moz-quote-pre" wrap="">Since riscv isn't tested with meta-virt at all, this isn't
the only recipe that has either build or runtime issues.

This is staged to master-next.

Bruce</pre>
    </blockquote>
    <p>Changqing,</p>
    <p>Should we report the issue to the upstream maintainers so that<br>
      should riscv64 actually become well-supported in meta-virt<br>
      over the coming years, this particular issue stands a chance<br>
      of being resolved or are 'go' packages just not there yet for
      riscv64 ?<br>
    </p>
    <p><br>
      Thanks,</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:ZPVJdC6MVeoKurB+@gmail.com">
      <pre class="moz-quote-pre" wrap="">
In message: [meta-virtualization] [PATCH] oci-image-tools: don't build for riscv64
on 01/09/2023 Changqing Li wrote:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Currently oci-image-tools has a do_compile error for riscv64. The
problem could be reproduced by:
    MACHINE=qemuriscv64 bitbake oci-image-tools

So explicitly set COMPATIBLE_HOST here to avoid it building for riscv64.
When someone interested in using this recipe for riscv64 fixes the
compile issue, this setting could be removed.

Also don't build packagegroup-container/packagegroup-kubernetes since
they depends on oci-image-tools

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 recipes-containers/oci-image-tools/oci-image-tools_git.bb | 2 ++
 recipes-core/packagegroups/packagegroup-container.bb      | 2 ++
 recipes-core/packagegroups/packagegroup-kubernetes.bb     | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/recipes-containers/oci-image-tools/oci-image-tools_git.bb b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
index 4beb3a63..8c5020b3 100644
--- a/recipes-containers/oci-image-tools/oci-image-tools_git.bb
+++ b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
@@ -29,6 +29,8 @@ EXTRA_OEMAKE=&quot;BUILDTAGS=''&quot;
 
 S = &quot;${WORKDIR}/git/src/github.com/opencontainers/image-tools&quot;
 
+COMPATIBLE_HOST:riscv64 = &quot;null&quot;
+
 do_compile() {
 	export GOARCH=&quot;${TARGET_GOARCH}&quot;
 	export GOROOT=&quot;${STAGING_LIBDIR}/go&quot;
diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/recipes-core/packagegroups/packagegroup-container.bb
index 8d418e95..c41576a3 100644
--- a/recipes-core/packagegroups/packagegroup-container.bb
+++ b/recipes-core/packagegroups/packagegroup-container.bb
@@ -4,6 +4,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecdainheritpackagegroup+COMPATIBLE_HOST:riscv64=">&quot;file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 inherit packagegroup
 
+COMPATIBLE_HOST:riscv64 = &quot;</a>null&quot;
+
 PACKAGES = &quot;\
     packagegroup-container \
     packagegroup-lxc \
diff --git a/recipes-core/packagegroups/packagegroup-kubernetes.bb b/recipes-core/packagegroups/packagegroup-kubernetes.bb
index 70dc9713..7e6937b1 100644
--- a/recipes-core/packagegroups/packagegroup-kubernetes.bb
+++ b/recipes-core/packagegroups/packagegroup-kubernetes.bb
@@ -4,6 +4,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecdainheritpackagegroup+COMPATIBLE_HOST:riscv64=">&quot;file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 inherit packagegroup
 
+COMPATIBLE_HOST:riscv64 = &quot;</a>null&quot;
+
 # k3s has this restriction
 inherit features_check
 REQUIRED_DISTRO_FEATURES ?= &quot;seccomp&quot;
-- 
2.25.1

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap=""></pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap=""></pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#8267): <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/message/8267">https://lists.yoctoproject.org/g/meta-virtualization/message/8267</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/mt/101090972/3616765">https://lists.yoctoproject.org/mt/101090972/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:meta-virtualization+owner@lists.yoctoproject.org">meta-virtualization+owner@lists.yoctoproject.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/leave/6693109/3616765/950573401/xyzzy">https://lists.yoctoproject.org/g/meta-virtualization/leave/6693109/3616765/950573401/xyzzy</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------5fHW8dEFvyo5P617qcjM0k8m--

