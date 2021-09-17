Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12185.1631883667241840636
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Sep 2021 06:01:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=V24IfNDY;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4894613b8e=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18HALqhB009330;
	Fri, 17 Sep 2021 06:01:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=T1ENZKi+DDudZ15e+DbR6GedVo0M/wbce6nzhe+vzeU=;
 b=V24IfNDY+gMRkYMfKdd8/N8csLbOMM1ggcHrpgRFX3Dhxg6S0kRNSrrrygFfAbMiArJ7
 hqSSzn6F0fgYn5UrJ+Qdj6xef47IWaUrdMINB/VRJsZtCbT/7TKUC0xr9KbLp6TI89lP
 GHOQl0bP9QPmz+uPCYU8U0RP0CkByKreoeHWKSOuwdHsJ46r6xz31SGuKT8RJQk2dIUC
 SjvpvUG0fI2WR1svxuGd/6XfPu6tUWKtmwPVbPR0OcVhoxkVQ2YGqJmjbQlUERzHggGH
 lFxDqRlv+/ZI3s1pgtAEfoyqbOesP2agxpjrbJsevFQeQ57A5v5HMJRRClbisj3XLt+B bw== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
	by mx0a-0064b401.pphosted.com with ESMTP id 3b4awn8nk4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Sep 2021 06:01:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SzD+m6pDtdb3tiOeQC8cPJkexP8xDI3n1MDKE6D5XQleBntDMh3Olq9G0QfuY0ZyicO+QqNOylrBpA3ZU1fkmWR6CZVdyGfBlkXifp8564KjYOeuTJrUewe8PA1aSag4Lwu7kqBYBcqdsock44mZjMByOc2Eci7OVNGNGqJUt8oigDZnKdETrEafDhDPxiBvAokLNZpBsnr5FURIwYBGGuAZv6U7h+dj84kbZHEvFGSMyltxbO3ix22+nKCSDlrUwb4UuFOlMHt3nhnXMMOPUjT/L3OMFBgN9uTTJItG4LKQbSuf+2sVZSsNQqAkSIB+W3KSmrlpaHnoG3Ft4YsNzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=T1ENZKi+DDudZ15e+DbR6GedVo0M/wbce6nzhe+vzeU=;
 b=X/rjMHsDslo0Rh6Y7HawkP967CDzfhGEHR1UwFlkVrB+PX2XcC72OLPnNyfmajnEyx/9CSLnbCRYqBU5TfKmfvxP1w16vcFT3/LxyXlLibRE12lyzq5nbY6kHf61M1/nPjz5zn2XTCe6Vus/Pv/N4OjWZVNV9hFI1dgPdhkF76pKnXCY6DiSGbn6Bsl1bJWUrtGTMcmiQwcyGBqQWdUgCoB6Qnw8YJR6+7Eox9LkAYcdyhAEM9l1BvuejHn5zPWUci0CimfleYHqMdGJMCFVo5O7y3o0sHM/j5bas/62NTSMD3oDQbmNsahHvoMLkfcqxzRDRGMfN457U08IrAy1CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by CO6PR11MB5666.namprd11.prod.outlook.com (2603:10b6:303:13a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 13:00:55 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::d92:b64a:8b59:cf4a]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::d92:b64a:8b59:cf4a%9]) with mapi id 15.20.4523.017; Fri, 17 Sep 2021
 13:00:54 +0000
Subject: Re: [meta-virtualization] [meta-cloud-services][PATCH] libibverbs: add back from meta-virtualization
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20210917074838.90843-1-kai.kang@windriver.com>
 <CADkTA4NaH5w_qXu4W+PoBOf6kej4Ts4ZkuAn3ivq4hjkPbRaXg@mail.gmail.com>
From: "kai" <kai.kang@windriver.com>
Message-ID: <cd708bfc-c48c-7ecc-316a-4b00b6ccf9cc@windriver.com>
Date: Fri, 17 Sep 2021 21:00:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CADkTA4NaH5w_qXu4W+PoBOf6kej4Ts4ZkuAn3ivq4hjkPbRaXg@mail.gmail.com>
X-ClientProxiedBy: HK2PR0401CA0005.apcprd04.prod.outlook.com
 (2603:1096:202:2::15) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
Received: from [128.224.163.141] (60.247.85.82) by HK2PR0401CA0005.apcprd04.prod.outlook.com (2603:1096:202:2::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 13:00:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72482aaa-2cf6-4df2-ecfd-08d979db2ee8
X-MS-TrafficTypeDiagnostic: CO6PR11MB5666:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB5666625D6345AC2022CB8E5795DD9@CO6PR11MB5666.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NF/uDd8ab8fEQ3GOM8gl792ZE5TmQ/5KhKoyRelwWrv27lGSJcI9wA4UWwCTOU6i5I/GUu6JzYhmoprFr5PV0TvF0cJBtxYlQC7QsuWVxjAMgMPekYF1t/jlkUasMKEAs1j/LozT1bM8bCv2VCqvNnhlGGYzxeLqltxsiYwft7LCClB1pO6E4bu9qqxccuDcpSe4iypTQJlvwj/raUWCjUYJyKCWiwQn8pigokyZ3nki4bSOBotZRN4GXY6urE0/dG3MrtDUm+fX50ZUEZwXlqBC7SxzdjHegI72QmgR9OK+As165JGVucQIF6w9T/WzlrBZZAGB6DICJMhGrPc1X5pm116wKIA4kqLu2N/yOpC6Uh9lWTrH74RE3I5LJ1FqS7nNBqPxQ18uFlOJo5COBh4riC2ZybxDgtJndS/OtJ2QLqLqIO8RYbwJgz1om+QsYg1Obkps4vOV3HDdPQezlbSZNzWRNYuZ8g3hTgy7JcQPG4tGbKATfbYo+UINMaRaM6Qss89/CQlzIOspPPt+KO9VKtPzzyGo1s1vbm8s+61dM/rDcQhJ0/J4BwoxAfyEGseOuXuVs4FYLGpzwQ/oabXJImVI0CNr7FnTbzXRAaLPOe3IrT12YfqMuR7a2c7ABr6BhL3xBTJGqFONVHH7w1Vlt0Xl56WwLC/rxdav1WkyTi62OVc8Fm85rnuSZy+26wFKFyYjZFlHlzFV7r6IGUjtvc+FPd8vbnx3bw40AcIogPkDyoSetmvoEk0+p4CVtshW49kHxfre8t4oYlkTVSg3hm82qV1c/1t5xJ5Xxrx+Y8J+7O2nuLLjiIg6K2TeJ3vDHzLy/V0bQ6vCIi6P9pcrll7EtjT8kXjXTGggpH6pg/ZF0oabk98Ofjbc82kiSR6urag7bOXxHIESyJyQrw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39850400004)(6666004)(186003)(26005)(956004)(6916009)(86362001)(52116002)(6706004)(5660300002)(31686004)(31696002)(36756003)(16576012)(966005)(478600001)(6486002)(316002)(4326008)(66476007)(53546011)(2906002)(2616005)(8676002)(83380400001)(38100700002)(8936002)(38350700002)(66946007)(66556008)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aE1LVHcybkF2d0dLb1RsSmpYZW9yRmdzbnU5cDc4RWxuU09qV2JqdmVFMExu?=
 =?utf-8?B?K2JUQ3duWVVYV3ZwejRzQ0dYZ200bjY2bHZkc1dkajdLbmJRTnBEYnM3UGEy?=
 =?utf-8?B?bndDbWVtand4RmUrWkV0VWJHZmVTc2M0V0V6VzdZeWhaeElOYUN4TEIrZjFS?=
 =?utf-8?B?ZG1LM09JcVY0U0FaWE9kT05TV0lvQjFEeUkyL2ZRZ2lLeTNtYzJURDVpZjJU?=
 =?utf-8?B?cWZCRGM4ZWtOU2NYUjh3QzZZTW1NdlFGclZtT1MzU3BKNVVwbTE2T3o5U3NG?=
 =?utf-8?B?NklOeHFqTm40K0dqZ1VqZjBPc1hwbyt5VmR3ekhSWmFVRTUyK2FhTzBpaG5s?=
 =?utf-8?B?YkhkQTB1elJQYWpDUytqdHEyYmVoRVBHS0VoSkJPQklHZzV1cEJsMGVUQXd6?=
 =?utf-8?B?WC9TU1RaemcyTFZJMUVxSzVaSG1ZUnNHT1B3TFo4djZYdk9iakEwK1NDSVc5?=
 =?utf-8?B?UzUzUlVsSmFDMzBZNkRjck1QNzc0YkdWUjB2WEIwNDloY2JIUy9BVm9LdlFT?=
 =?utf-8?B?aS9FaEdIbWprbEJ6ZUk1YURUV0xqbGJVWkk4RDZMc0pSZ0ZJL3FPOHU5N3Vj?=
 =?utf-8?B?eU1YMXdzbll2S0FtY1FvWUdVWWUvMjZYMU5KdWR2b3pDMU15NUpzczhHLzUz?=
 =?utf-8?B?MVJaVHlZZXB5UlB6bk51ekJ0ZlVLVk0xVkhEU1BkWE1qYjdwMGIrWWJVbXEx?=
 =?utf-8?B?b0RjcS9wSDZ3bzc2RURhL1YrYVpKbjJxN1Bqd1cvZ1ZFanlkcGgvYWVwQnJv?=
 =?utf-8?B?L2t4OWNLNlRuOFFYeDRNamFTTHF6MTZteWVHc0daRWxIRE1GanZ2QjZUdTh2?=
 =?utf-8?B?UC84TFRvcXcrNU5NR0c2ekxWV1ZCcUg4TFAwVkFkOXVsT0J3Qjk4ejB5WEVa?=
 =?utf-8?B?cFkwa1B0bVFCdGpDVlJLTmNNZXp6SStLTFpxekNRMUxuakMxOFZRV3R2U1lJ?=
 =?utf-8?B?cUtyU0tTM2g2QWpFZVNhaHU5NlgrdE05OWExQ2VWRVhwa1YxNUFSVWZTUk43?=
 =?utf-8?B?NG4xd2E2QnhSSWRZckNjK3hucmxLMnJHVStxVCtoNEdkQ1VzY2h5T3VLTi8z?=
 =?utf-8?B?akVES0U0bUV0SFlqSHJFNU9yWUpZMkRsNXcyeUdsWVJKcVpHZmVsQ0dpSi8z?=
 =?utf-8?B?amtKNkcvWmQveG43dEIxM0dKYm4vUldiY1RrWjVsWm9vMG9JQ1YxeEQ0a1lu?=
 =?utf-8?B?L2x1NldxSllqTjcwb0JSZGp2enZEWUJOb3RCdUVuQUp6TzJBTlJsMGhuUEF3?=
 =?utf-8?B?dkxDMm9TQmk4T0dmai8yaXVVRE1FbFU3ZjRzd1prN3VDd3dWd2g2VlVIUFNU?=
 =?utf-8?B?NVh4a0FiWTAyZS9hVS9rQkRBaitBQ2RBWVhLMmFNV0FaMC9DM2FibGVNS25B?=
 =?utf-8?B?R2YyeEl6SjN0NU1sWlhhcXpBTUxHSy8xL25XdFRMbHVOS3NtdTBMSHRsblVj?=
 =?utf-8?B?MmtwUzg1cmxaTVZhY3YrMzlwbktrTkhNcmd6cDBvWmJCaWxDQWdSZFl6RlV6?=
 =?utf-8?B?Yis2OGVXWlROS2I2V2Y0cFFldmNiVkcyQm9PcGhDTWxMQ3ZaTnZNZGlUdGVy?=
 =?utf-8?B?LzRqVWJ2dWdIR3ltVWVUTkRpNHdqVGVpQkJmVE5uVE02ckdtY3NnU2lKM0xp?=
 =?utf-8?B?eUNXYXE4RVJvOUpNazhsL3c0Vjljc0V3eTRORDB0aksvSTV2Mi9NRWNsU1JG?=
 =?utf-8?B?WGVqMWVFU1NpZ3BYdnhFK0krSUJxTS80N3Vtck05UUVOTjU0NGx4K21HNWZK?=
 =?utf-8?Q?Vdf1drmv23PiS3+uQt2nH1En8BFwMyOqh2Ckg97?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72482aaa-2cf6-4df2-ecfd-08d979db2ee8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 13:00:54.5653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wh2MShSap1XoBMgyo7TMAfYg11yESDNiuSSoSUiwi775xQk5XiCOq9t946pLIDWZ9xRXht4KY5uf0zjq1CjR0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5666
X-Proofpoint-GUID: reUCWxswhlygmel-XcfViKbcbxaI97QE
X-Proofpoint-ORIG-GUID: reUCWxswhlygmel-XcfViKbcbxaI97QE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-17_05,2021-09-17_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1011 mlxlogscore=999
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109170084
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 9/17/21 8:26 PM, Bruce Ashfield wrote:
> On Fri, Sep 17, 2021 at 3:48 AM kai <kai.kang@windriver.com> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> libibverbs has been removed from meta-virtualization but it is still required
>> by librdmacm and glusterfs. So add it back from meta-virtualization.
> My bad, I can revert the drop in meta-virtualization to keep the churn
> to a minimum.
>
> We should look into replacing this recipe with rdma-core (which was on
> my list, but I didn't want to do that replacement this late in the
> cycle).
I check the configure.ac file of librdmacm and no configure option for 
rdma-core. That's why add it back.

And revert is better.

Regards,
Kai

>
> As is obvious from the page:
> http://www.openfabrics.org/downloads/verbs/, there won't be any more
> releases of this package, and we are going to eventually run into
> trouble maintaining it.
>
> Bruce
>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   .../libibverbs/libibverbs_1.2.1.bb            | 34 +++++++++++++++++++
>>   1 file changed, 34 insertions(+)
>>   create mode 100644 recipes-extended/libibverbs/libibverbs_1.2.1.bb
>>
>> diff --git a/recipes-extended/libibverbs/libibverbs_1.2.1.bb b/recipes-extended/libibverbs/libibverbs_1.2.1.bb
>> new file mode 100644
>> index 00000000..90c424ec
>> --- /dev/null
>> +++ b/recipes-extended/libibverbs/libibverbs_1.2.1.bb
>> @@ -0,0 +1,34 @@
>> +SUMMARY = "Support InfiniBand verbs"
>> +DESCRIPTION = "Libibverbs is a library that allows userspace processes to use InfiniBand/RDMA 'verbs' directly."
>> +HOMEPAGE = "http://www.openfabrics.org/downloads/verbs/"
>> +SECTION = "libs/devel"
>> +
>> +LICENSE = "BSD"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=7c557f27dd795ba77cc419dddc656b51"
>> +
>> +# Official repo is at git://git.kernel.org/pub/scm/libs/infiniband/libibverbs.git
>> +SRC_URI = "https://www.openfabrics.org/downloads/verbs/${BPN}-${PV}.tar.gz"
>> +
>> +SRC_URI[md5sum] = "1544ebb89d861ce84057ab43dfcd22a0"
>> +SRC_URI[sha256sum] = "c352a7f24e9a9d30ea74faa35d1b721d78d770506a0c03732e3132b7c85ac330"
>> +
>> +inherit autotools
>> +
>> +DEPENDS = "libnl pkgconfig-native"
>> +PACKAGES += "${PN}-utils"
>> +FILES:${PN} = "${sysconfdir} ${libdir}/*.so.*"
>> +FILES:${PN}-utils = "${bindir}"
>> +
>> +PACKAGECONFIG ??= ""
>> +PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind,"
>> +
>> +do_install:append() {
>> +        mkdir -p ${D}${sysconfdir}/libibverbs.d
>> +        rm -f ${D}${libdir}/libibverbs.la
>> +}
>> +
>> +PROVIDES = "virtual/libibverbs"
>> +RPROVIDES:${PN} = "virtual-libibverbs"
>> +
>> +COMPATIBLE_HOST:mipsarch = "none"
>> +COMPATIBLE_HOST:arm = "none"
>> --
>> 2.33.0
>>
>>
>> 
>>
>

-- 
Kai Kang
Wind River Linux

