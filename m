Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.5659.1608775533793181970
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 23 Dec 2020 18:05:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=cVREBuif;
 spf=softfail (domain: windriver.com, ip: 198.145.29.25, mailfrom: mingli.yu@windriver.com)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
	by mail.yoctoproject.org (Postfix) with ESMTPS id E9A5038C0851
	for <meta-virtualization@yoctoproject.org>; Thu, 24 Dec 2020 02:05:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oeEp8ng8q7wD2G7B7aK/Rj0cqQRwBwHFNcZq5ewYxaALM5R6ebq2LOIJ2VRg2SP+YT3GSycPf9+UHUDYp1nDTw2Tachc0ePCEXazDHBtgS705fmIy9HAHVzYJkjPbyBF1N9m2HI1tfDduWus8BIUxT/1jkHEqsEMpYMHLO+e0g3ngSFHJCm9SNuHUQGQUVEWe/yDBKTiS5zcPoJ/CcJORSgBEzuwm06Yqb0kCVjanp+SlpYJjgU5R5q2R1D//6fZCAuGgrYcYQunSvDlKEaWOBGctNRTkZhn9/0KBHsT1gzys8YH2KqCCcw6k5/Va5ucTngpftlf2LylbvvamkXI3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVGsu/JZuS3+X+6NbaLuD9ncyU3Ct8O+HmxfZVyvrak=;
 b=Lpx+Ksvr0nbEBtSdSo9RQvNT05TiA6Cy2GtvwUAv3JjrzjtpKBX6vruC+uwjXxtFb6LUsIfy2rFugxQBzf7euTsbqS2NcIykkH4fAmZN9EVyNDbHwWZVLiCCeroWu/5p5x1XEQa/vWPQI47p59EZ19Nl7zf74HZX0tcjJ/FnGdPRE/ZoWpK/7+SyfQxj1FQuiYiAmlSeUvaLxnwsRsvgFWdlbMelcOklwpOpiBLejv7RhAO1iUGz9mRsEI/Xci+BZZwrN4Cu2fmbTB6xzyhCevOPsfp32e0U6vvyu65Q8MTcH274auONqrNSQG0cUl+hQx6aWuawLe0qXmCbHnpEsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVGsu/JZuS3+X+6NbaLuD9ncyU3Ct8O+HmxfZVyvrak=;
 b=cVREBuifhPTGvKgXWS5ZhWX0svjPvQOq1B4f5dDzBeaSjdBAwQDxqO3RMJCTnJJKYQLLWWUxMGLL4HgF4qAzGce5ju8osaxRuvdRSCYvyhEZHC40Vr4SkVUl255qnWYbFmsFRmnw21iy4G0dNSNOi67R/CxxIdvyRWplu8oZUV4=
Authentication-Results: yoctoproject.org; dkim=none (message not signed)
 header.d=none;yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR11MB1744.namprd11.prod.outlook.com (2603:10b6:300:10e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Thu, 24 Dec
 2020 02:05:30 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f%7]) with mapi id 15.20.3676.033; Thu, 24 Dec 2020
 02:05:30 +0000
Subject: Re: [meta-virtualization] [PATCH] containerd-docker: remove the recipe
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
References: <20201223033751.3553-1-mingli.yu@windriver.com>
 <CADkTA4PA6X0GZ4AbAugRvANHtb2udteZ6nTjj+OW5V+rMyiYsA@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <438711e7-96e6-5aee-2027-977fa9b2b114@windriver.com>
Date: Thu, 24 Dec 2020 10:03:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CADkTA4PA6X0GZ4AbAugRvANHtb2udteZ6nTjj+OW5V+rMyiYsA@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:203:d0::13) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.139] (60.247.85.82) by HKAPR04CA0003.apcprd04.prod.outlook.com (2603:1096:203:d0::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend Transport; Thu, 24 Dec 2020 02:05:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f7c7011-8fe5-454f-cd57-08d8a7b063f1
X-MS-TrafficTypeDiagnostic: MWHPR11MB1744:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1744572570FF4A513C74BEE8F1DD0@MWHPR11MB1744.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Hy4wdvsZRSQMUedWfVDD/Zw5bLFem+R+YXzTuVvknpkvTWIZMK+jer1D9eadtRF6K39GmmUTq4bArrake7DlSqOJhhyF3rpe+LTiwsYcwt6qFjFJ2GhtNkiTVE06iyUiBC1EMZeXlYJCDfus1+KXm+6dQPlHLqZDwRvsBpqdo2VjZfFBc8Dth4cA0PxXpyCWpQJmnNLYogr3pX+47TEFch9XS7lAYOX2V8zKK09T6Z4Fk3u2TYevbqezz82WyUxplby31ZBHqg9qSLhbrjxX5R+y7zRXqnpamkFGcHxTkJCcGT+AjGWfl14hIlKWo7SNGBUv9eAo3xgM3HSmXVARypP3im/M3uzLdjrcKcnF1qKTPwmUYzrdH064NMHmSfyH8R/+PtlaD7p3ol+YcYxnt3HuZiIny1LTKxIadVpfbPBBOsmcJF9/oXKrWeoIE4V5KEAaliQ3FyPTYEW/GIx4Fj7CVQqe6Sj9veBABsmKk5plKxFKEhl2T3ldLfnQzfxxM2FDjtpKbDnY18jAgNtkf6yXgK+AWuU/6ZZO45RSJ5pWhow9zLOt9tIm2MOrGfEcb4eImQATFcHPAAw8HdEAqQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(39850400004)(366004)(6666004)(966005)(31696002)(478600001)(8936002)(16576012)(316002)(6916009)(186003)(2906002)(53546011)(6486002)(16526019)(26005)(2616005)(36756003)(956004)(86362001)(6706004)(66946007)(52116002)(66556008)(31686004)(8676002)(66476007)(83380400001)(4326008)(5660300002)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?S2czMyt2UFlrcjFwOE9ud00rTGFSQnNaQnpUUmlTcWZBVDZ2QU1mWEFvVUhC?=
 =?utf-8?B?d0hqZnFPcmcvbFVDR1A1M1ZRbFg2ZE9kaytHaTBESGlQZlBPUjEzdFUzMDJw?=
 =?utf-8?B?YUc0MzkvUXAzT2p3WElhS2NNdFRiTHN6elVTU3lKOFB4R2NydGpxbldnNmZO?=
 =?utf-8?B?b0VQVWQ2VW1BK2k3T2crbEFQQXZsZ2UrNkNxKzdITHFxODR0SEk0UGpJYmJi?=
 =?utf-8?B?VUtBYitLQVVSSUE0VW80b0lycGtVRVQ2WVNjendpYmt0RExITkhhWmRTdGs0?=
 =?utf-8?B?N0pOMUVwc0hZVXBQZjJjemI3cWxOSkhlVDhLUnB2OGYzamh2NW1LVHA1YW16?=
 =?utf-8?B?dElQV1ArUG9lRmwzUGdTVk9ZajUyelIyc2Q2VTgvamthYms3TXVhUE1KTnl1?=
 =?utf-8?B?NVFBMktKbEVaSlJYTXJIeWR0SjBIaDNjVTQ1RmJ6VEFDaUFxalJpZnBCWWdF?=
 =?utf-8?B?Q2pESUdPWkpKWlRHVEE2Tk55QlNYald4dU9mSVhWK2dxSmxocjNJYTZKbFJk?=
 =?utf-8?B?Y04rU1ptVE41U1h2WnlnK1NrZlU0UGtkR0RVL3pBcldORkpxdUovVGJWRndv?=
 =?utf-8?B?YVdmYm4xY3FrWE1wc2U0K0c4UmswNU9hQXZna3UwNnVBdlA1RmdMNXU0OS8r?=
 =?utf-8?B?R1JOc0RYZmVNTU8wM0JkZkg1eXV5YUJnTm5sWkNmRm4rRTNCVjBZU1k1emYw?=
 =?utf-8?B?OWpXcWhlNEJ6V1p5cms4MW9hNW42WDgrdGN4Vjc4clpzNzlxb1NRZkxGdCtH?=
 =?utf-8?B?cktqcitQd090dnZnZytkNDluRndweHJuV0tXU0ZaR2w2VUVUbjNuQk9jcXE2?=
 =?utf-8?B?eE5xbEk3M0JDK29kVDFWQzRFeTNNNmRHcFNBMDdsTmJucUZxWUdvMGtTUnFQ?=
 =?utf-8?B?SldGY0ViQnRvYy9WV3FwU3ZBblVlVmc0M00wcEpuTW5kWW5aWWozS2lseU82?=
 =?utf-8?B?cUZtQkp0YVh4Rk4xR2pDam40UUJ4MGcySkpFd29HVG5ZZm9ieE1HeFdUVEJo?=
 =?utf-8?B?QmhUckVKZVRQQWdGUlZTUzVybC80WGwzaFdEN2RNdmYvWG5nVUdsMlpQQzBh?=
 =?utf-8?B?YlV3QnIxOExZakVWOU5HaXJmcFQwWFk5dGNGWEFiRHNCZ1l4cjNVQkNxcEt2?=
 =?utf-8?B?SXhFVm9xYWxEV0wxU2JpQklqYi9BK1lydGpPK3JNRzdwbVlWcnZMZWRTajFP?=
 =?utf-8?B?OTd4QXdqSitPYlBXZERuOXVKWHdIdk4zelBrd3Q2YU9WWlhmVjJlU3gyYTBo?=
 =?utf-8?B?TURrd0lQaG53Sm1FMDI3UTlUOWNCbnF2Y0l2R3JqOU83NTRGMlJWSjB4NVZ4?=
 =?utf-8?Q?WKFcXho/ttA7o=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2020 02:05:30.3877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f7c7011-8fe5-454f-cd57-08d8a7b063f1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zMy3Cv7bcQYvrpl96VP7rRkGlVHKEYmrYAd5AT1uFIOBKLngY/mRVuE7aXzkoJyCJpBg1sjEQ81kCxNWu4LA4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1744
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 12/23/20 9:42 PM, Bruce Ashfield wrote:
> On Tue, Dec 22, 2020 at 10:39 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>>
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> There is build failure for containerd-docker as the below logic in
>> containerd-docker recipe.
>> do_compile_prepend() {
>>          bberror "${PN} is depreciated and will be removed in the future"
>>          bbfatal "use container-opencontainers for a working configuration"
>> }
>>
>> So remove the containerd-docker recipe to avoid confusion.
>>
> 
> As per some of my previous email, this is going to stay around for one
> more release to go through the depreciation process.
> 
> And there's no confusion .. that message is very clear :D

Thanks Bruce for your explanation!
For the confusion, I mean the containerd-docker exists there, but cannot 
build actually.

Thanks,

> 
> Cheers,
> 
> bruce
> 
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   .../containerd/containerd-docker_git.bb       | 22 -------------------
>>   1 file changed, 22 deletions(-)
>>   delete mode 100644 recipes-containers/containerd/containerd-docker_git.bb
>>
>> diff --git a/recipes-containers/containerd/containerd-docker_git.bb b/recipes-containers/containerd/containerd-docker_git.bb
>> deleted file mode 100644
>> index 8d1a27a..0000000
>> --- a/recipes-containers/containerd/containerd-docker_git.bb
>> +++ /dev/null
>> @@ -1,22 +0,0 @@
>> -SRCREV = "3addd840653146c90a254301d6c3a663c7fd6429"
>> -SRC_URI = "\
>> -       git://github.com/docker/containerd.git;branch=v0.2.x;destsuffix=git/src/github.com/containerd/containerd \
>> -       "
>> -
>> -
>> -LIC_FILES_CHKSUM = "file://LICENSE.code;md5=aadc30f9c14d876ded7bedc0afd2d3d7"
>> -
>> -include containerd.inc
>> -
>> -CONTAINERD_VERSION = "v0.2.x"
>> -S = "${WORKDIR}/git/src/github.com/containerd/containerd"
>> -
>> -PROVIDES += "virtual/containerd"
>> -RPROVIDES_${PN} = "virtual/containerd"
>> -
>> -DEPENDS += "btrfs-tools"
>> -
>> -do_compile_prepend() {
>> -       bberror "${PN} is depreciated and will be removed in the future"
>> -       bbfatal "use container-opencontainers for a working configuration"
>> -}
>> --
>> 2.26.2
>>
>>
>> 
>>
> 
> 
