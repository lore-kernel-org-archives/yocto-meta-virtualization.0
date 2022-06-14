Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA70C43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 20:14:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.1708.1655237691908520481
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 13:14:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Z8hEhzdK;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=31641ef6c1=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25EK66rR015512;
	Tue, 14 Jun 2022 20:14:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=xsXPgm0U1Ld3gD33qCM71P1X48Hg7wmMBYZYR7QeHFk=;
 b=Z8hEhzdKdxu/2YOgcTQ2iNyOvgIVBKjvUXnQuG+vhZ9f9hkUrF45bs+KDSuV6UB0piZr
 T/FwWuE0w4J85102777+7XXRaDxvk/sI73uiG97Ic6eIJq7yISkAQ94vOHNCkcPpWRYg
 +t0eOj6AZdC+C9KTWRPKwfrjsesU71CloMp+EpkCE1GJbTFX3YHPDpvW+24GJeNyls+H
 iRt/JwmuqwPBBwoy90mzlTRZRg//WBqwePYp6Nrjm+n74aEXPWBoIDYvr8X+DyULCG2Y
 zUkwtoTrPbAKUv3QTXdsbFIQ+qVKP6t4BN3ZyDi6x+9E2+JaZ5YKXPwNNXDwHtlJ6ukl iA==
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2045.outbound.protection.outlook.com [104.47.74.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gmj19aqgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jun 2022 20:14:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=csLcyIeUh1Zas9OnhsY8l1HoYfB8ATyCi3HMPsStJxJXvl7rDRaW2wwmZrVHrbU0MldUjE9SOiNTZTVs/FQxoFM05XoRRG0ujF0TbZGj8TcPq+3AapZr6Cu1qEsYUmB6kZ0856zNN++eiOttC0QaeG0/aClTVEcfVTBL5dQVUn+UxKOhfVGJ84bdlq6DPvEAw+EISJk9+t3A8hwMqFUS/y3eZMbMkAB/ZMZRcioKH0CChl216G6yN80hx9JAIFgM8yHrqAeoPoZdENLwqKsVh6lmU9N60LRS63c8u9mDSTmKFdbIVycp0erw1ZcsVVAZWyHYvLO3er5DzCmFrW8k6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xsXPgm0U1Ld3gD33qCM71P1X48Hg7wmMBYZYR7QeHFk=;
 b=BK/B/1jdJUkIi5r09BG26IfktP/LHtrSSJKlqoEd3x8+49Usfw0bgFfExC7pAX96q0qAiWR5PlDRUQdL1xTu3WMBtXvcFw9UMcnZ1EkUQN4m8ld3ISqd6fRhvGdoJ91GtfIGJtIMU5BA//YtvXKKHCeirePC1ZZ62WryEOiqEmnnIxtL1tLCgFzxij7coEP3X2co5R7YY0AVs2i9Bex3kslxRUjwDG481No5P2e9RekZceBcPwI04OOlu/8uTNB7oJUEA4pdjQgDrgnz1pFXyPoWoU7hIKhpdYqSVT+SGS5VgYFdMQH3XxpOCeWOx7JgEU3Wm32oUbfELVkhG4lSvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 BYAPR11MB3750.namprd11.prod.outlook.com (2603:10b6:a03:f9::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.16; Tue, 14 Jun 2022 20:14:46 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::a807:4bee:8e08:3053]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::a807:4bee:8e08:3053%7]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 20:14:46 +0000
Message-ID: <06eb81d3-8daf-1685-52f1-45370d6ed973@windriver.com>
Date: Tue, 14 Jun 2022 16:14:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [meta-virtualization][PATCH V2] buildah: add recipe for buildah
 v1.26
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20220525234347.3799-1-sakib.sajal@windriver.com>
 <CADkTA4PJT5HwekzjTQsCg3dt=N25fwzAaRpXGQkH7a=SUDaMkA@mail.gmail.com>
 <e25f93e4-3512-eb34-aa57-c691f8e169d7@windriver.com>
 <CADkTA4PU0=TE3TruN9_kWZWpmKeHRyMf7g0mpESeWWpU8GyEEw@mail.gmail.com>
From: Sakib Sajal <sakib.sajal@windriver.com>
In-Reply-To: 
 <CADkTA4PU0=TE3TruN9_kWZWpmKeHRyMf7g0mpESeWWpU8GyEEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0155.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::18) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7687467b-67c8-42a4-1ae7-08da4e428693
X-MS-TrafficTypeDiagnostic: BYAPR11MB3750:EE_
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3750A354518569AB10D12714F2AA9@BYAPR11MB3750.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kSxIta9blxTPnqn3lhiLFLV20AYNz8h7A6CBJ1Ogj61NVVRMsi6LpTNTUkLObRawsrqFxsrVVyulId5xCywCW5vTxTHFr5ERFtpAQxDSr/k1VXf+pfs+qgMU6/9qSxgsN7h2k7SS74SUHXQM2YcvEajfosPm4ilqubknypcw/9uQErWq9T8/qtNiSZ5hjN79FszcbzfGFc0vt1gygCJDNWl3M3ntUkuljE+pW+PnbTgf8GgXl+kNYPUlBQa+uNSEIeuLGg2ZF1mmSlpED0GYdbihH7n8pUvpxbEij3VLRVE0+fZnLQgVlM3FvhgweK+6x1vLy4wETcrNS14POMJlBwZ5N44A721WUkkqeZzY0975e5akBVhNDg3edZIplCOLqOgrZCCdFhLDueYfNjbN9PMMJNAqJyuJCN8ahmiuvx83VNH3s4cZ47v4I7+Ha6sqnTsOG8tZWDhAmNXn2yUu1zgNYTLeAqTiwWnwsC/GiQR+Xdzb5eXXTWiAm90IH7ZR3y7OCKlXTeq0UZvvgO2samEP8ZkPYD5Vm4EYkT4IRJeKg9/c5BnaNmPJvXo7XTdiYMlAh8PFbJvdFKT33CP0ZKteBLISUaTwFTM6lgeouiApVEMlv+h3RXz4yyNR01PVLK/Q0dwDk6gsZmyn83lkpMCi1KtySrf3czZhdbq51fFIaYdF9x42Hs8GpwUefPfvrcJUVg6wx2wKqPEcablnY5pwv7+dYZXsXscWeCD1MGEGYG6EZDdVM9uS6FGItnBNNdA2DrLWvPUmAAXvK47mZZrL+DUlLQ7YFItczXq3B8h5mpQtiI0gRWf8G8iiZMdwHFPZwq+s5MCcF1oO39iWuGRKqGPx9d8gM9OSSDIeVaNeES/sn9nihaF8bbApzGTo
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(6486002)(4326008)(966005)(508600001)(8936002)(86362001)(31696002)(186003)(8676002)(66476007)(2616005)(38350700002)(66946007)(38100700002)(66556008)(31686004)(6506007)(52116002)(316002)(53546011)(83380400001)(6666004)(6512007)(5660300002)(44832011)(2906002)(6916009)(26005)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NXVCaExGV3RJYU9jUitjekxWM1RYaGRzOENuZFUzaVhQK1ZoQ253QXQzcWNi?=
 =?utf-8?B?YTZHT1NtRS9pdzBPM0I5WitQRlFxWlhQV0d4Qm5tSXhMWFFlU003MENvaUhC?=
 =?utf-8?B?KzlVejJ0ZzRHeGVJVEVtdThSOWJ2STZvT3NHUUdLU3Z4SEFweGtGV1VHcmRi?=
 =?utf-8?B?MmZ5ZXJuYk9vSmRHV3Z0Q2pZb1hQaEJmbXgwbHZHMnFFd29tTDB4LzYwWi8w?=
 =?utf-8?B?V1hnVkxhTXJxd2tlUmRLT1RTb3VYODBYYk9RNDZEb0FSTlVXSHB1dGlOalpK?=
 =?utf-8?B?Ny9ibjlvTTI5RHh1Z0kwYVJoWCtROWRTRVVpM0dxb0ZRVXBpOTJCRnE0VGR3?=
 =?utf-8?B?anR4R3F4dmk1MEJuOTN3V3VlMzdqS0pjaisvYXdrM2JGZFIwQlNrcUIzd3BC?=
 =?utf-8?B?Y2lPUjNlcEZQYzlyZ0dORlNkRHNwd044NlA0RVoyOHJHM0VucEVBNDR1TEtj?=
 =?utf-8?B?SGc4R3BLVXVjN1FzNEFYMmtEL3JTZkNSTHdOUjhrdVA0QXdxemRhZjJVNGtT?=
 =?utf-8?B?MzhYb3BpMERDdEMzYzZRSm9KVWlUSy9wUWJmTFRPUnNIYmhWazRmd0RkK0hO?=
 =?utf-8?B?bi9kaVdCZmorR3FvZmpweldGZFRSaDNXV1JhN1lBaEI5VndkRDJiVHk3eGh3?=
 =?utf-8?B?VC9UMU05Z25IajRqei93NDlNTXo3UC81WWlhc09yNmVCSm8yc3UvbjJDdzNC?=
 =?utf-8?B?c1hkbGY1VUNQVzlqN1lCM2hIdWR2M2NUK3plTEU5TG1raVpsVkxtOEFqTUNo?=
 =?utf-8?B?MzdFK25VVytGMzlBNEZCVVQyck9VNTRCWHBlQ2RCamxEdkdMcEg0QWx5TVZR?=
 =?utf-8?B?YmltWW5RVkdzakd3WWFCb3kwTlMwd1U0ZG41dit3TTN0TThaSWpUMTFabkk4?=
 =?utf-8?B?aUg4TUNUN2ZPYlJ3VzcrMytaVjBOQWc3WWIvYXptQ05PQlRhdkJYd2RiNTR4?=
 =?utf-8?B?RnZ6MjJ5YTBDSUR4SGJLZ2t4V05VTzVUZmR4VDFJNUhJaER5bkcwZkMyM2M0?=
 =?utf-8?B?UWx1cWRlN0VGRFg1ZDcwaU5pVzBOdHQxaFZZc2UzTUtkYnBTVzNFMncrQWdL?=
 =?utf-8?B?dFRjQXNlNFh2UlJ6VytKSGxEc2w0Q2dkNEYzT25iMkdZK0xXcDNnd0MvSHla?=
 =?utf-8?B?bHZZVU5WMXN0cGxXWS93OTFKaDkzb1hkaTRDLzExQXArQ2tjMERjN3ZSUU5z?=
 =?utf-8?B?MmxYV05NQjFPM0JPREhONExxdmd2Vy9pcndGbzdaUjZuTVgvcHRhaGphTVBx?=
 =?utf-8?B?UlZMdHpjeDdObEVMQUhsV1ljbUNYWmt3d0puTXZVdDlIUVJMeDhDNVJobUZh?=
 =?utf-8?B?WlNXc244eURMSE5TYnl4bFlRYTRUdzZicGY5OGZFNk9KeURVQjA5Z0s0d09v?=
 =?utf-8?B?Q0dCcFdFbDdLVm41dHR3b1JkS3JySzBUbVhFSXZNVkpxakxNS0EwNGJUZzdo?=
 =?utf-8?B?WlpRNmh6QlBIVzZKS2tWeHh4eXFrSU1Yc1diM0UxdjA1bmJSbUpoV1A0c1FC?=
 =?utf-8?B?a0xsUDRXeHRUNjdiby84MS9DeE52ZjRQQndBZlZJaWVIN2VxNGdrRUo0ckhv?=
 =?utf-8?B?em84QVJteEJ1TGRLdWluaENmcXVnc3pyTWZVbkpsY3pDRmVjRW55a0dvZmcr?=
 =?utf-8?B?VTRyU1VpVFQ5cld1aXpXTFg2bVBiZCtZNDdzcDZITU1aRUpSamU3YkdyNDcr?=
 =?utf-8?B?bU9Cazk4aFhDMzFyem0rVUtoUGlBM1N6Vkt2RU93RFZ6Umlrdk1tc2UzaXhU?=
 =?utf-8?B?bnFNa0lHVHdmMUNHYmhudTlPS3hsMUwxcUFrejQrbkVxZlhOZ0UvRllTaHlH?=
 =?utf-8?B?NGpSZGpWam1JOFBvZDNGZm9YM1NpcCtqd0c3UkFSVElnZDhIN282b0RSK2RY?=
 =?utf-8?B?d0RGUTFxem5hcE1hSjlTRlByUjROb1V5YjIwRHNiZVBBejF1UmVCTEsrSnRq?=
 =?utf-8?B?amlPaU0xYXpPdTVoN242YU9HVkhEb25vUDJsWEFGVG9lVElXdVV4aGxxUTN1?=
 =?utf-8?B?Y0lWSE0wQ0FEdGIyejUrUG9EYU5zS0g5c2orcHJhZjQ1dnFrc1JBZlROeGZZ?=
 =?utf-8?B?aXU2VjE3bFFzWHVCTnptM3VybE9GM0dFY0tHeWZVMkdVN2lHeG1kK2dlUXRS?=
 =?utf-8?B?am9CRHNkQ3R6WVdJQ2tZMlRjNXFMV0dNWU1SMDVGMTNKUEY1bUFRbEdwaWhO?=
 =?utf-8?B?Zm9CMHM0ZWZ2UjlmUEpXZ2h0emF0S1FsRlhyS1JaZDdjenpmNTBMWVZJMzcw?=
 =?utf-8?B?TVZ3NWtZbENMa3FSR2NsWlBIVzdIUXJJMHZKN0ZZWGFJSU12ZmlOY0Nid0U4?=
 =?utf-8?B?bDJiS2ZmWk5MbHNVbVFHV3Y1S3loNzR4SUFwdkU3NWl3Z1V6cjNubHM2Tjlz?=
 =?utf-8?Q?5434jyIoe61HSeu0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7687467b-67c8-42a4-1ae7-08da4e428693
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 20:14:46.0660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 4maCaWlc1MioMbg9XPjX4eX1gDAFUs2TpYTcds2fj95OjccvJk1vKF5MDuu/IEcM6scJdeLMCb1SafRxqesd3h6ZDFkR4ehLLdBIXZQW9ew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3750
X-Proofpoint-GUID: -orXDHs0EaSd43mUO51viD-EkY2uabrH
X-Proofpoint-ORIG-GUID: -orXDHs0EaSd43mUO51viD-EkY2uabrH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-14_08,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206140073
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 14 Jun 2022 20:14:56 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7385


On 2022-06-14 15:48, Bruce Ashfield wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Tue, Jun 7, 2022 at 9:50 AM Sakib Sajal <sakib.sajal@windriver.com> wrote:
>>
>> On 2022-06-07 08:59, Bruce Ashfield wrote:
>>> [Please note: This e-mail is from an EXTERNAL e-mail address]
>>>
>>> On Wed, May 25, 2022 at 7:43 PM <sakib.sajal@windriver.com> wrote:
>>>> buildah is a command line tool, to be installed and run on target,
>>>> that can be used to:
>>>>      - create a working container, either from scratch or using an image
>>>>        as a starting point
>>>>      - create an image, either from a working container or via the
>>>>        instructions in a Dockerfile
>>>>      - images can be built in either the OCI image format or the
>>>>        traditional upstream docker image format
>>>>      - mount a working container's root filesystem for manipulation
>>>>      - unmount a working container's root filesystem
>>>>      - use the updated contents of a container's root filesystem as a
>>>>        filesystem layer to create a new image
>>>>      - delete a working container or an image
>>>>      - rename a local container
>>>>
>>>> Testing:
>>>> Setup the build directory:
>>>>      $ . oe-init-build-env <build_dir>
>>>>
>>>> Add to local.conf:
>>>>      IMAGE_INSTALL:append = " buildah kernel-modules"
>>>>      KERNEL_FEATURES += "features/overlayfs/overlayfs.cfgi \
>>>>                          features/netfilter/netfilter.scc  \
>>>>                          features/lxc/lxc-enable.scc"
>>>>      IMAGE_ROOTFS_EXTRA_SPACE = "5242880"
>>>>
>>>> Build image:
>>>>      $ bitbake core-image-minimal
>>>>
>>>> Run the image:
>>>>      $ runqemu nographic kvm qemuparams="-m 4096"
>>>>
>>>> On target:
>>>> Pull an image:
>>>>      > cnt=$(buildah from fedora)
>>>>
>>>> Or build from Dockerfile
>>>>      > buildah bud -t <image_name>:<tag> .
>>>>
>>>> Mount the image:
>>>>      > mnt=$(buildah mount ${cnt})
>>>>
>>>> Install packages on the container rootfs:
>>>>      > dnf install --installroot $mnt <packages_to_install> -y
>>>>
>>>> Copy local files to the container:
>>>>      > buildah copy $cnt <local_file> <dest_on_container>
>>>>
>>>> Save the changes to an image
>>>>      > buildah commit --format docker $cnt <name>:<tag>
>>>>
>>>> Run the image using buildah:
>>>>      > buildah run $cnt /bin/sh
>>>>
>>>> Or using docker:
>>>>      > docker run -it <name>:<tag>
>>> I haven't forgotten about this, just with the storms and power outages
>>> here in Ottawa, I'm running way behind in my patch processing.
>>>
>>> Bruce
>> Thank you for the update, I was about to ping you regarding this.
> I've been held up with some larger system integration issues for the
> past week or so, I've got this staged locally and will get it tested
> and merged as soon as possible.
>
> Bruce
Thanks for the update. :)
>> Sakib
>>
>>>> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>>>> ---
>>>>    recipes-containers/buildah/buildah_git.bb | 57 +++++++++++++++++++++++
>>>>    1 file changed, 57 insertions(+)
>>>>    create mode 100644 recipes-containers/buildah/buildah_git.bb
>>>>
>>>> diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
>>>> new file mode 100644
>>>> index 0000000..024e82c
>>>> --- /dev/null
>>>> +++ b/recipes-containers/buildah/buildah_git.bb
>>>> @@ -0,0 +1,57 @@
>>>> +HOMEPAGE = "https://buildah.io"
>>>> +SUMMARY = "A tool that facilitates building OCI container images."
>>>> +DESCRIPTION = "A tool that facilitates building OCI container images."
>>>> +
>>>> +# Apache-2.0 for containerd
>>>> +LICENSE = "Apache-2.0"
>>>> +LIC_FILES_CHKSUM = "file://src/github.com/containers/buildah/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
>>>> +
>>>> +S = "${WORKDIR}/git"
>>>> +
>>>> +BUILDAH_VERSION = "1.26"
>>>> +SRCREV_buildah = "0a9d6e6eaef2e2e7936313d449a4e226022eb865"
>>>> +
>>>> +PV = "${BUILDAH_VERSION}"
>>>> +
>>>> +inherit go
>>>> +inherit goarch
>>>> +inherit pkgconfig
>>>> +
>>>> +GO_IMPORT = "github.com/containers/buildah"
>>>> +GO_INSTALL = "${GO_IMPORT}"
>>>> +GO_WORKDIR = "${GO_INSTALL}"
>>>> +GOBUILDFLAGS += "-mod vendor"
>>>> +
>>>> +SRC_URI = " \
>>>> +    git://github.com/containers/buildah;branch=release-${BUILDAH_VERSION};name=buildah;protocol=https \
>>>> +    "
>>>> +
>>>> +DEPENDS = "libdevmapper btrfs-tools gpgme"
>>>> +RDEPENDS:${PN} = "cgroup-lite fuse-overlayfs libdevmapper podman"
>>>> +RDEPENDS:${PN}-dev = "bash perl"
>>>> +
>>>> +do_compile:prepend() {
>>>> +    cd ${S}/src/github.com/containers/buildah
>>>> +}
>>>> +
>>>> +go_do_compile() {
>>>> +        export TMPDIR="${GOTMPDIR}"
>>>> +        if [ -n "${GO_INSTALL}" ]; then
>>>> +                if [ -n "${GO_LINKSHARED}" ]; then
>>>> +                        ${GO} install ${GOBUILDFLAGS} ./cmd/buildah
>>>> +                        ${GO} install ${GOBUILDFLAGS} ./tests/imgtype/imgtype.go
>>>> +                        ${GO} install ${GOBUILDFLAGS} ./tests/copy/copy.go
>>>> +                        rm -rf ${B}/bin
>>>> +                fi
>>>> +                ${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS} ./cmd/buildah
>>>> +                ${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS} ./tests/imgtype/imgtype.go
>>>> +                ${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS} ./tests/copy/copy.go
>>>> +        fi
>>>> +}
>>>> +
>>>> +do_install:append() {
>>>> +    dest_dir=${D}/${sysconfdir}/containers
>>>> +    mkdir -p ${dest_dir}
>>>> +    install -m 666 ${S}/src/github.com/containers/buildah/docs/samples/registries.conf ${dest_dir}/buildah.registries.conf.sample
>>>> +    install -m 666 ${S}/src/github.com/containers/buildah/tests/policy.json ${dest_dir}/buildah.policy.json.sample
>>>> +}
>>>> --
>>>> 2.33.0
>>>>
>>>>
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#7324): https://lists.yoctoproject.org/g/meta-virtualization/message/7324
>>>> Mute This Topic: https://lists.yoctoproject.org/mt/91344690/1050810
>>>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>
>>> --
>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end
>>> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

