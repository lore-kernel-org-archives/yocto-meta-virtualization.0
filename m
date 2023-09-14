Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A93DBEE0217
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 02:03:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3095.1694657012133861122
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Sep 2023 19:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=J7ScrN0B;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=762155788c=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38E1nvVI006806;
	Thu, 14 Sep 2023 02:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=4nctr4RJmUNRQKXAVusQxPBoVWP3Smk9wLTaEtMRb7c=; b=
	J7ScrN0B/8b5ceYJBtECEUo5GYCXISfwhPVTWB3bUXPFQoevE0YOA50hmcT+KcgS
	xK174CJIY3Eq3bsjbUVkq0omxKC+klGDYebTRYgV8k3HJmMPQtwPClGOeH5Ctl0Y
	c4A04DqXTW5JyREx9zlb2COBPpDcHTBm+xOTA71BfRcdlR1b4YBbssCGAPUjgoGT
	v6sWBDxWcovg68nHRk/69FLTiEJZVbmRV3bGixGZYpcDHmIYD9XM/SUj1Dj4l6d3
	3WZe89shfCUH2c7fMt2jAi5SPVd/4XVWMbcyQg3yeLCuRO0pe3zf0fcxtpUA+Fwa
	5VBlRayhnjrvu8CI5EstoA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t2y8m9aqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 02:03:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YULHve4r7vlPenlEq8BSZ8IT7qZV87QCbI3CJ3LEAUhh+VpTg/8Rsl1bdfL44n3Cld9P40+o8NgNU1wH1UF4+2BSph1xkI5ErJNviFVltNMzo4UonmvDhJixz4e7TKybWPyz5qJoa3QE53QTqu9m71KlyTSzrGA0Nf7fDtBW1cOjKHsTHu85+vF8hxPSdEhsMMUynnHNiZFwe3Q/1G6x/mnshWIRogBHaZR09ex8h+wstZJEwuRxPkYDrpdQ5cMrmz4/g6licVgUAbvq48qYLbsQZxh9iP69ZTwsxhZW4MCDV/WcylWCtbIiEen2kn1aKfgfPardp4geoiO5Xkz0Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4nctr4RJmUNRQKXAVusQxPBoVWP3Smk9wLTaEtMRb7c=;
 b=ippYrjhSpVHFzwHR/QxOXTR6LbH6ALY/Oid+D7ye2L1Q5v8S+5oqn8xqzYCTiCYHsBM6R56teBVFlzxMkjicvnHumPp8WGpxwWkKDQcUK8hpk88FPi1an2coAkVIwXXHBgtx4kwdb8uMf4CD9399JLiDx2mlpxvmWavxoniazUCIq6N3ETroAFFGEDHO/blLqPJKOQePmVCsRAy+SJERygToWUyPxPlJQybWAlyyRCC2nTNpfSeeKFGT2+Z0YBzmViVQoCvwO7ViDne/H4Lm3asWIQKkRc+Qvv0ukp1YoIW7SeTrgqe95PeqVGgWVJDHdArLPV7wrgdzczExuapQkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by PH8PR11MB6563.namprd11.prod.outlook.com (2603:10b6:510:1c2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 14 Sep
 2023 02:03:26 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::5446:efd2:e157:26b7]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::5446:efd2:e157:26b7%3]) with mapi id 15.20.6792.019; Thu, 14 Sep 2023
 02:03:26 +0000
Message-ID: <785ed89f-e9ec-7360-5e4a-1f460732a44a@windriver.com>
Date: Thu, 14 Sep 2023 10:03:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [meta-virtualization] [PATCH] oci-image-tools: don't build for
 riscv64
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
        Changqing Li <changqing.li@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20230901090308.3242531-1-changqing.li@windriver.com>
 <ZPVJdC6MVeoKurB+@gmail.com>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <ZPVJdC6MVeoKurB+@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0156.apcprd04.prod.outlook.com (2603:1096:4::18)
 To SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2557:EE_|PH8PR11MB6563:EE_
X-MS-Office365-Filtering-Correlation-Id: e9d25dfc-067b-4ff9-a11c-08dbb4c6c822
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	E2O4nj3Uc5Z8VtGPzVlg88aBcwPwyMFsxWhh2MlvUa85WuGEhF5YA1IYWbXIeEitW0BrFtlD8mrRejQW6FqjJai+qNpgUoCC1l0r0E76WkpULR1ZJrlj3YKfpzY8LpOrfUkzhZnSzRgrWlmNcmDfPDPG05WcocUg4c+RDVOT2zYpsCg04n2qOz1jaI5cDR2HUC7tmBFh3IX6OaBvPE2vQlIry8WG8aUJ0g3YgX5N+arFccIn0vwKZKmDzn09bRNxQFlO8/dqI0q/ljJaelNRqS7Edc1sJfGA6b5sR5dm4LOvlSoEIrHJutVnLCw8300DRWLhe75MghQkPr5nodaajPRWq4/D4Qre2Fdoq/W0I7evn+AFThcKKm2WH6L7Wk67k4s45JD8XUVemyFQxwJl9vRDOE5cM4GUSB6oniSk8qPvTwP0PsGct25AJI3gjaiTFBwkmEYUKekix9YSYUN3gIX+EzA+4KsRtjyr8uLWouOF2O0VAHpNittfboXYNZmiJqTf89WCC2yUgiR2dqsnC6mXgIWmXj3YfK3paWuoHZGBzfjhdwdYgpOtMnz9fghS0k6EgLoCWXrjDjsQHV0TXmcXXEQINu66Od8gkn17CviM/lzQwgZRFcbFQr8df04bmSQbY0NEHPcdYWSuINpm6g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(39850400004)(346002)(366004)(1800799009)(186009)(451199024)(31686004)(36756003)(66899024)(5660300002)(83380400001)(8936002)(4326008)(86362001)(8676002)(41300700001)(53546011)(6486002)(44832011)(6512007)(6666004)(6506007)(26005)(2616005)(31696002)(966005)(2906002)(110136005)(66946007)(38100700002)(66556008)(316002)(478600001)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QnJQTVVEVVdaVmxQazFxbU01RlhOSU5rNGlydmxHbWRZbmU0MUtZUUZxemV4?=
 =?utf-8?B?RFlJNUJhVUJSdUhsUWp3SldJV0s0NXhFbW1kMm0vTkIzdHRtVGNPOUFycU9v?=
 =?utf-8?B?QlQ5SWQwWTFuaWVJczI1NUpoMjRmOXlaQ2QwK25qUXk1V0NldnFPU0FsWlcz?=
 =?utf-8?B?dWJVREU5aWVSUjROU1VmbExCWm5IbTd0ZjhIWTJYTzloZDViUDB3QXhrK3R5?=
 =?utf-8?B?ZGUzeTRIck1LYVpVeTJoSzZadVBXM1BzR0tTVTZ3eFZ6STdBRjFhRXhzUG9l?=
 =?utf-8?B?OGZaVkxDYUZrMEpxUVNuV1RDaE9VVU5XdHcvejJpSGpqVjBVM2o0SzFqZmNU?=
 =?utf-8?B?aDFFL0Mwa25vbmpPM0dCM2w5bmdwR0dFckdEbkFrNWNING9iUnZCY2ZWaVE2?=
 =?utf-8?B?WUVIdVM2OUVUSUtvRjYwNDlNcHdUZFlvbW5LZVNVTGhZaEJ2VWVEWU0xWjRn?=
 =?utf-8?B?VGdwS1o4UXl3QXpDK01WMkwzN0M4TWZXSTZLcTJwL1kwa2o1YmxQYkhEbUNk?=
 =?utf-8?B?NWl3TFh5SGdZZ0FSYnRvT0pPQU9UdCs1QnlTNk5wSmpJRyszZ1dOdjV2ZUpZ?=
 =?utf-8?B?L2xHemtFZGlvczlmT0JJdDd3OU5YWm1GUHU1WHFoellVU1o4YmNUM0tza29K?=
 =?utf-8?B?OU53QlRvSTFXSUg4QXZHanNzREh0b0hCaW9kaXYyVGlyb1I4WVBUR3FKcFFm?=
 =?utf-8?B?OWNEWXNqZVFUR3d0TVZhc3NWWUpmc001V0tINFA2ajErQzZORWpRbUtLNk54?=
 =?utf-8?B?TG1ZMXBnUXV4YVAwek1lY1hhZ3dIMldyVjF5YWdEcDBjNWVPcTlGaDhFVXJW?=
 =?utf-8?B?UFZQQTFvMUVGWkRnbmI5L05mcDVvVkdiR0grUmVsREZNOHRvSjFvZHBrQ09B?=
 =?utf-8?B?eTl4SjZDd3dObWx1bzhqMVlpSUZCQ0Q5S0c5Znp5dFlXRTZLZnNiSEN1QWpv?=
 =?utf-8?B?YVpsMXExUEhpWiszYlF3WU54R1dpK2hobU9JZ2V2L2tQTDRxNXJtNDRxYkg3?=
 =?utf-8?B?UG8rT2FsazZEcnJkeWNINzkwdXh2ajhEYUxmUVdzaUQxc3ZqcUJwa1lQcnRw?=
 =?utf-8?B?TGFqdTFPRlBUWXdFNUVXWDMyRVBoUkxnZVgyTFYrL3J2cEhGZjIxZTRUZjUy?=
 =?utf-8?B?dnlEdHR2YTB1emxFSFVRZklXaitOUDJJYVlzc0FGWUQ1T01ZeXlHU0t3akpT?=
 =?utf-8?B?Rm45ZWZyNkRVOHJRMXJrODJtZmJMQ2d3RHJjT0tKTmdUNjB3UEdPMW1hYUwv?=
 =?utf-8?B?UGkzU1JEaE1nN3crenFFakk1c2MvMTRKS2JUeXYrUlBpTnc4U09LeENkQWJN?=
 =?utf-8?B?YVg3STM5UXM4dFFGaWtGQjV1YW1rcXI2bXpuQjREalNUY2xPZ2Q0Tm43UFFE?=
 =?utf-8?B?MzFoRERpdUpIbG5oN0prbXpmYlQxV3pPNlorWmpUZVAyUERuRE9PQmdvTFVn?=
 =?utf-8?B?VE9CaXhVOWpVOXVDS0hlL1pUblluK0MyVVAvRmVkVkc4U2U1U0ZtL281aDlH?=
 =?utf-8?B?K0pmMXJFL3VGYzdqTjYrVk9nWmw3NloyZlZNR1NuME9GUkdpeFgzaTVKZGx5?=
 =?utf-8?B?Q3o1MzlFUmF3b1NGT0NFbWFNeGxvQnlJdndOMktMS3dFVzlGZlJrbHRzOXJz?=
 =?utf-8?B?ZFhJYlNGVW9zWll0VnRhRThMb1NSQ2FsN09pTWM2N3ppSWhQMFh5UmY2V292?=
 =?utf-8?B?d0NyZXVRbFR6YTZ1NUMwb3RBVm95OFJoOUVjWFJmQUlmZ1RSUHh5Q1F3TDA5?=
 =?utf-8?B?MUVaQkF3Z0haQ2dpOEdZSWhYVnVHeFNUbVVHRW8wOUR2S1kvdzA0Qlo5SDdL?=
 =?utf-8?B?VThQSG5HNEYrNHRrL3VQMFB2RVZuQVJyVytDaWF2a3RyMUFpMzAwVHhBS3Fh?=
 =?utf-8?B?ejY3eFBpVmxDNENYaFRLTFdBUFozRitSUTJaYitiNXhRbGphSW56QWhyR1dY?=
 =?utf-8?B?aXloT2hvbHhXd0puQXF4bDlML2JHZlRadjdhUzluay9OeWIwWkNpMGFXaUF3?=
 =?utf-8?B?bUZYb3htL1VZOG9PSGt5Q1NHdU9GSjJuTm5QaEVTZHZoc2l0ZVB1aFdHQThG?=
 =?utf-8?B?dlZsYkVqZ1VqdkVZR3B5Tzc0b2doV1U2WlFlQVI2TkRsdEd4cFo0YTBSdGNz?=
 =?utf-8?B?WHJMbmhMa3ZmYW5wQ1NBcDNlS08yZkVVbXNCclRMSVJKaXpWWFU0WGNCZ09U?=
 =?utf-8?B?Unc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d25dfc-067b-4ff9-a11c-08dbb4c6c822
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 02:03:26.0590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wTHcBQtodlve1CmHcT339x1G1ZvA8YLu0um80nqLdneUKJ5u4ecbBQKDwaFsdRbVYSY1wJ2lYUHx+9s5H3xd0oU7C4KL5TmQ1shPMDeClG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6563
X-Proofpoint-ORIG-GUID: X_gHE_tg8mT2LSY0ExAnalfE_y4c7Tsw
X-Proofpoint-GUID: X_gHE_tg8mT2LSY0ExAnalfE_y4c7Tsw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-13_19,2023-09-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=645 spamscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309140016
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Sep 2023 02:03:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8303


On 9/4/23 11:05, Bruce Ashfield wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Since riscv isn't tested with meta-virt at all, this isn't
> the only recipe that has either build or runtime issues.
>
> This is staged to master-next.
>
> Bruce
>
> In message: [meta-virtualization] [PATCH] oci-image-tools: don't build for riscv64
> on 01/09/2023 Changqing Li wrote:

Hi, Bruce

Could you also merge this to mickledore branch, thanks.

//Changqing

>> From: Changqing Li <changqing.li@windriver.com>
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
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
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
>>        export GOARCH="${TARGET_GOARCH}"
>>        export GOROOT="${STAGING_LIBDIR}/go"
>> diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/recipes-core/packagegroups/packagegroup-container.bb
>> index 8d418e95..c41576a3 100644
>> --- a/recipes-core/packagegroups/packagegroup-container.bb
>> +++ b/recipes-core/packagegroups/packagegroup-container.bb
>> @@ -4,6 +4,8 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
>>
>>   inherit packagegroup
>>
>> +COMPATIBLE_HOST:riscv64 = "null"
>> +
>>   PACKAGES = "\
>>       packagegroup-container \
>>       packagegroup-lxc \
>> diff --git a/recipes-core/packagegroups/packagegroup-kubernetes.bb b/recipes-core/packagegroups/packagegroup-kubernetes.bb
>> index 70dc9713..7e6937b1 100644
>> --- a/recipes-core/packagegroups/packagegroup-kubernetes.bb
>> +++ b/recipes-core/packagegroups/packagegroup-kubernetes.bb
>> @@ -4,6 +4,8 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
>>
>>   inherit packagegroup
>>
>> +COMPATIBLE_HOST:riscv64 = "null"
>> +
>>   # k3s has this restriction
>>   inherit features_check
>>   REQUIRED_DISTRO_FEATURES ?= "seccomp"
>> --
>> 2.25.1
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#8263): https://lists.yoctoproject.org/g/meta-virtualization/message/8263
>> Mute This Topic: https://lists.yoctoproject.org/mt/101090972/1050810
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

