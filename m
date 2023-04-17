Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC0DC77B73
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 02:15:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.45379.1681697747802041356
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 16 Apr 2023 19:15:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=347115525b=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33H1wQEU028011;
	Sun, 16 Apr 2023 19:15:46 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pyq76hwxp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 16 Apr 2023 19:15:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eN98WjbpfWSEmwxhUvAGMbh8Lb61ScHKg4XqCQrWCHE93uxNhNieJoyNZdvWx3nGd8Dp5FN454qVzaiBSUZhfCjwF561hpBfcK+qfzW2t7lnAjSoBQVA2tEYuRH7FFw7UOpgX5fTu1kJQTX9ahjfeNPm6lJqEdd9Y9MfjvKopqYFchgq2GWTO8OSRdExoHLjfeu+NiNTLXbIP39dWaAK3qSkg9/gC8KRP0MR+enWJKvG+s0p5kSb7vPH/5oOxS5tmxtPK28MgsQ7Z2P5L7Js4Vs4mvtoThHSfQ/7cfNbwMaVi7+ip5kqjjv+CbN8ZXWzWzRH/0CYr6WIZbcdDXJs+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPhaWP/rc0MumSZTzsAnRDPuYoFS1vavRJKVzR4sfVs=;
 b=jSRZ+G9mSD0HEA3WiL0qVNDjNZ82qEGaMEpC4r7Hx9HwEZT148s799aWJ9yScsbQbx1wvLx3CADQLXKkLcHn+8a1N5u7x3ZjnZd8uAqROSGKQHTVATjrjrfx52fRiG74q5Li+WCjKr7fuxHS1ri5twOoF4rdv+QrGNu8WFC7i7bWbbYlfYYKQ96676LQf/DIkk3ju1JXPpFMvL3q/eYQhDETjpYLHPR3jzi7DWdeDTjgLdSJRyhyBWHa461g/sWeBioYz8xttHGuErP2Bi+NqJQkLP7HaRbxlO5kuUZnJafEC+Sx/cnb6aX/0P0oO8dNhmXw0oNOaJyt1bLCYGNkpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by DS0PR11MB7405.namprd11.prod.outlook.com (2603:10b6:8:134::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.49; Mon, 17 Apr
 2023 02:15:44 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::631b:404:cc4e:8008]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::631b:404:cc4e:8008%8]) with mapi id 15.20.6298.030; Mon, 17 Apr 2023
 02:15:43 +0000
Message-ID: <21a0b758-1be5-86a3-4267-c3eecbfe1c67@windriver.com>
Date: Mon, 17 Apr 2023 10:15:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [meta-virtualization][PATCH] ovs: Uprev from 3.0.3 to 3.0.4
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20230414070800.381040-1-xiangyu.chen@eng.windriver.com>
 <CADkTA4P8ZJ-wCoJdx8BfXbsQ+9-ixQDYKFmr8oa5FG4105imJg@mail.gmail.com>
From: xiangyu.chen@eng.windriver.com
In-Reply-To: <CADkTA4P8ZJ-wCoJdx8BfXbsQ+9-ixQDYKFmr8oa5FG4105imJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:3:17::34) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|DS0PR11MB7405:EE_
X-MS-Office365-Filtering-Correlation-Id: 2404f08d-b40b-4120-22c4-08db3ee9a5c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rwhlAs232diT8QHRd8iTlycakyme4TFeOeM8Sjt8sEiy9xYZK1gaY1ARu9+nIrhkbjVK7eNXE/T/2HhShjhyekuq+955NN/TUyjL8l0ru3skjKXZ35CEnjVOMygmU9kAMo9DidxaturVZ7ZpEfsaao3tw/utWFtUk45sykMrF6Uuz5wafLxkY+oX4imFCmsFg28pmHaGmaOPOLGPbE/b1eltdp+d4DJydZZXCbvOde70WC66r8hNnQEgRd+v8T8LW0r1cWNVFt19LNsogeY0agFQQbNU4zYTULBZBb2OJX8uxgDmhU+QyjUIgKNce5AhxEv3mrrpcpLz4YDCnSZSvw4e9qn6ECbSYlTSri1slHhwHHPPqNVOaIFTlzfgc/b97a+kQtOm84Fn5GfxGOcbqvLnCCZATZaDSRu/k8c8zT0JdXGmWfwgb32oiZJrCGNxtYpBQIuv6bsqH0mqASO8yudl8Yfx27X9CBWhqZb7wPyatnB3E9t2rzwLpMoq7nZqNbz4SXRG2IZNs8wsVZd/5CpK7hVC4WJvMHDlyCLMaHnQ4/RxpheeEOgZ/wgjmckY40gzALU+RiZm2BuKqcT44qoPnR9NY+9j61FwYhaR1lRB87+hBTbkQZBs9ywxgBNozlEKQ1TxXEttBfXK0rlBbQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(346002)(39840400004)(136003)(451199021)(6666004)(31686004)(8936002)(966005)(83380400001)(6486002)(316002)(186003)(83170400001)(4326008)(8676002)(6916009)(31696002)(66476007)(66946007)(41300700001)(36756003)(66556008)(66899021)(2906002)(478600001)(53546011)(5660300002)(6512007)(9686003)(6506007)(26005)(38100700002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NTFaeUsyajV3WVFwQkhkK0JuTzFpMUdtWm4xdjFLZmJpOUhJRlhuL08vTDZa?=
 =?utf-8?B?VE52aXVzN2w3YWt0VFJCVStmM0pPZXEremNlMWVYMEpqQUNETytabmdUbEV2?=
 =?utf-8?B?NWJwK1FXOEYzbWNETmpsbUhGRW1HTVYzdXh1T1JQeHRLQ1Y5S25xUGVWbWVj?=
 =?utf-8?B?QS8xMllvcXZzeExubVp3VkI1d0UrU0xXanNEbTFqNXZHMk0xU20ydHJFMENX?=
 =?utf-8?B?azBJMDJ1K1FrOFpnVXRxazJXbldxQjAwYUgzL0dxVDRhSXp4V2d1VDBaNmxP?=
 =?utf-8?B?NURZTEJVelZpV1E3RjVON05hd3BMTE55WUlRdWxjVGN2Mnd0TXZqR0Vla1hV?=
 =?utf-8?B?akxzbDNpTmpZdkJzNXBTQWllREh2Q2pETkU5RGJZcGcxcVkzR200dVhZTkFs?=
 =?utf-8?B?WHZtYmxBdWRuMVc5UWxKU0hwbktURXhCTlJ0SkFCNmpiYXNyRFZoQU9yQmpQ?=
 =?utf-8?B?bDVhY0xHSVpHQUVxUWNFbWErSm9qaEpDSWIyVEx1N09FOWNGQUMyRGw4RlAw?=
 =?utf-8?B?ZFBCQUF4REVIbU1ad1NEUmFlQnBZUjNYSnlMZ1g5Qm5iMzg2SCs0WFF2QTZh?=
 =?utf-8?B?eTQxMUVHZCtVT2F6SDNQUnZ1Tk9tU3FWREJRTDFpSnpZbU9oUTc1TWRLV1Rj?=
 =?utf-8?B?b1IwTFk4c2UydVF2S1FQRkxNSmN5cDluMmRoZzNYSkVXOVE4dFBmenJSRVk4?=
 =?utf-8?B?aHg2Wksvd3BXbzU3Wkt5Qm9NWXFXL2VEMTFBY0lpWFFvU2tvdXlGemNQU1Ez?=
 =?utf-8?B?c3ZyZHIzRGI4NXdTakJHcmNVV1pjNHdJbU1jOVRRSlBhMUw4MU1BNDZlMGoz?=
 =?utf-8?B?L1lBeDRzbzdsaW5pek5vWkpzcWZDSjRPQms2MWtQR3BjOERjVXBiWldkRzJF?=
 =?utf-8?B?dWkrc2pHb200R0haczk5L3A2MXNyQ2NlTWlyemRUT0NIOC9MYVJKclExOW83?=
 =?utf-8?B?RGVONVhCMkZScDBFNE40bCtIYWVzeml2N3NSY1FOQnU0R3VUeWtndm5mSldw?=
 =?utf-8?B?c2xLeDA4UmdPdDg3cW5UcU8vbExDb1BTT3RSd21MMFJWb0dBUmxQbmt0SHlj?=
 =?utf-8?B?ejRScStDeWZ6ZzFITDNUQXI4K2E3Vk55VWRKZ0pmK2htazRmV1F5UWFVZUpF?=
 =?utf-8?B?SzMvaEF0dCtNZHRBZ2MvTUNaV1ZUOFF2OHh2dWh0bFNQWHNtVlMvcllrZHZR?=
 =?utf-8?B?UU1icFU3N2szVW5COHliUTBQZFJ6OVFVYkFRbm5Tbkk4Q2I3MWlMdEJnMkRT?=
 =?utf-8?B?R0MwcHBuck92TUhRUjdySnlUN2FTRVA5NUIyOGgwSlN5QkEwelYvK1dyU25V?=
 =?utf-8?B?ZlBQVnNmWFdyMzhycGQrTWFMQ2tFMEFkLzJYbjBnNmRJb0FRaEVxYWNCclVX?=
 =?utf-8?B?VklKRVJMVzBzZlJRRjUyNnJGUzk4dGVPeDFTRWlYbE1PSjY3akpzRCtiTGw0?=
 =?utf-8?B?QW92RHd6dDdHUnh3WjFZcVhmZXJPMlYvOExZd2dFeDI4ckJuclNHNSthVkxp?=
 =?utf-8?B?TEc4Qk1JYzc5QWU5YU1sQnlGT2lObnc1RmFYd1lUZzVOMnNlcDBKNDA0WmR3?=
 =?utf-8?B?cE54KzQxVCtnSk9YR3o1RWlMbXNUcTdORXd5blZsYVllS0E1WHBzS0tPVUc1?=
 =?utf-8?B?eHZpcFR4ZjMzSDc1VUR5cWMvU1ZRdzR0ZUlwZU4zZ0w3aUlYVWVabXBlUVN4?=
 =?utf-8?B?N1A4NDlMRFJ5bU5lSkZCSytQRzlwNkl6ZDZFR05rMVJna0puQmxaZTF5bVll?=
 =?utf-8?B?NURxRDFINS9saTB6QmVieUd0NzZvL254bWxPeWhHZGpqbTRYMjZ3YXV0c1JM?=
 =?utf-8?B?UFJLT0pFVmNGZTVaRndsZ3ZSb2I0ekR6MFZ1bmUxWHpENG8rVGtQSzR6UGk1?=
 =?utf-8?B?WkNyR3ovczlXcGN2STJ1dTB5RUlDaE1veHBYQkMzR21kU1lETWkrendNN09k?=
 =?utf-8?B?T1VjVGNXNFJkM0JVRlNRRVJpNmxxQVpBODRuVlVjMDhMYnlTUXh6ejJYaXBZ?=
 =?utf-8?B?aEljSkE4bWszNWx4VFA3Q2pNSXl6c3AzNGpGMUFzSXJIU3FjNUhWT291NWdT?=
 =?utf-8?B?SHhlY0RZaENjclBOYzZYaVJXdUZDMHZEL0ltNFFwS0R5SUYyY2FEbHZORkE0?=
 =?utf-8?B?R21qTERvR1hHclArRW9KY3NXWVNwOGNYdTVjZk4ybnl2MHl2UGJyN1ZITVBC?=
 =?utf-8?B?eVE9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2404f08d-b40b-4120-22c4-08db3ee9a5c8
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 02:15:43.5664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cs6fYvK0IKhGVzUePV0iY6PzE7YxHLClVaSDxO04Fsl8QynM0PCAWFz+87hpiAVwAKXyYsNCWeA8TIivGcKc6epdaK3o2tbZLuCMSGnun9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7405
X-Proofpoint-ORIG-GUID: iC3SUPtikFe5tlzUP9ptKmu9q6iri5ip
X-Proofpoint-GUID: iC3SUPtikFe5tlzUP9ptKmu9q6iri5ip
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-16_16,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=967 spamscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0 impostorscore=0
 clxscore=1011 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304170019
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 33H1wQEU028011
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Apr 2023 02:15:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7994


On 4/14/23 21:00, Bruce Ashfield wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> Note that I have a 3.1.x uprev for OVS prepared for post mickledore rel=
ease.
>
> But I'll stage this for now, pending the results of my testing.
>
> I'll also regenerate the commit message, as we should be capturing the
> shortlogs of commits that are part of a release.

Hi Bruce,

Thanks for your response,=C2=A0 this small version bump is fixing=20
CVE-2023-1668 which was found recently, so I bump the latest 3.0.x=20
version directly :p.

Regarding "capturing the shortlogs of commit", may I refer to this=20
commit as an example so that I will follow the rule in next patch?

https://git.yoctoproject.org/meta-virtualization/commit/?h=3Dmaster-next&=
id=3D28491d29ed5b77114822924b0a3c48a4573c9762


Br,

Xiangyu


> Bruce
>
>
> On Fri, Apr 14, 2023 at 3:09=E2=80=AFAM Xiangyu Chen
> <xiangyu.chen@eng.windriver.com> wrote:
>> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>>
>> Pickup the latest security and bug fixes for the ovs.
>>
>> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>> ---
>>   recipes-networking/openvswitch/openvswitch_git.bb | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recip=
es-networking/openvswitch/openvswitch_git.bb
>> index 1ad3e57..798c7be 100644
>> --- a/recipes-networking/openvswitch/openvswitch_git.bb
>> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
>> @@ -14,12 +14,12 @@ RDEPENDS:${PN}-ptest +=3D "\
>>          "
>>
>>   S =3D "${WORKDIR}/git"
>> -PV =3D "3.0.3+${SRCPV}"
>> -CVE_VERSION =3D "3.0.3"
>> +PV =3D "3.0.4+${SRCPV}"
>> +CVE_VERSION =3D "3.0.4"
>>
>>   FILESEXTRAPATHS:append :=3D "${THISDIR}/${PN}-git:"
>>
>> -SRCREV =3D "7b5c4240c1ed5f38e476cf08819869dc14f55e8a"
>> +SRCREV =3D "2a98be5adaa6b3bd6c71a0ee01fc2782c67e7c78"
>>   SRC_URI +=3D "git://github.com/openvswitch/ovs.git;protocol=3Dhttps;=
branch=3Dbranch-3.0 \
>>               file://openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fba=
f5a2ae34de2f3.patch \
>>               file://run-ptest \
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#7991): https://lists.yoctoproject.org/g/meta-virtu=
alization/message/7991
>> Mute This Topic: https://lists.yoctoproject.org/mt/98257376/1050810
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsu=
b [bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

