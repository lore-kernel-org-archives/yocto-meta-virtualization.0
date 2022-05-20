Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1010C433EF
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 14:18:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9346.1653056330329234005
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 20 May 2022 07:18:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Qplldmnr;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=21395d0781=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 24KBMxwp008105;
	Fri, 20 May 2022 07:18:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=IZmdOWqIDIqxvSEsDcqwLhKpMZapI7IbZIJYrbaEo0E=;
 b=QplldmnrtKY14ef4GANWo2AGsfA97sXzfaGoKc0ZkwsysQz9HbrI5/UOKpe9yQXNx+iB
 6DWyFMwRSTrK9sE8gJ0nIygyVWm23QwWYsZFhnd26IEa1uS3Uc8UjuZ6GA8m2f3dRWCK
 sNYL6KcdxLpUwJMKcOP2OycC3cTniEfB4UgT8+4BxBUjPN6Pl7s3TbkoNGz/DcRIu8B2
 kQiXNAefyszitcFKm9Y2/2Z3RSzcFYoyssbtw0vWhOc0gUrsKZVqGlybDou8YoNKSDzh
 pWk6JsSe3T4+i5q3pnUYHs9GuIy21ZEqNtVw+9yWyJIPAGs9TNCF7Eiv2WDeubyY63oz Mw==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3g2bxmw1gw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 May 2022 07:18:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BlpBozGauvwEnuOuOZhKF5JsPABq8tMRmMIi8V1kD94SnO/wd6vPWm7vAkjFGFpGvSCCD1q/3TfYLSYwDqN1GbdVLb7URroBOmMcK5x3cXrX0LzpkxxfQK6EOuyL7HRRJiv3x596Hfphci6CNvQzb8+NKhzoZq3LJUlIzLNOhdPfg6b4ii84EloHwGplxl6TblewRQvuzudcXz0zXbz1f8u99p0uGJMrl5/TfMKssN2SK4Dp6dnYmbB9QXkdcgRTV1UAz/7Q0jNt5ZzuOmvRwefM04Rjo1MHQgU95wHCyCmhm+5pBUsRNAY46K32h4fliTPKbW3KHD0T6grvnYY9dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZmdOWqIDIqxvSEsDcqwLhKpMZapI7IbZIJYrbaEo0E=;
 b=nLjaYbPzWAZ5mPAVuJ9hVPT+/81b29NhiLA+0Op0QNeJ0ROvyP4J0uPhGFXh/Wn7tAdxcF2rjIIzyiID17U9HFPJCxHHUIF/Eb6g9NkNzL/O4d1DMBozvl7GgbX/3Nssl06gYsRHYmfkCqP/Ielfs3nLd2R78g6UsfhGGA+iijbTOxuWWM2DBMf7qSg4d926fo5C4zkzh4+A9ZKLHjln5EYTipiqNFM12ShJYQpWgWBMuN8Z1rKzsaC/mnDfZ9GiM5Wm9a4kWxt1qyjU9zBsgbFjaxPXca9wT87xUJ4hwwzbMZoivBNkffxvmGCbYcbMrhwbwyRTNO1VnrYZFk6lbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM5PR1101MB2156.namprd11.prod.outlook.com (2603:10b6:4:51::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.16; Fri, 20 May 2022 14:18:45 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::7cb0:dc6c:b2b3:b69b]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::7cb0:dc6c:b2b3:b69b%5]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 14:18:45 +0000
Message-ID: <3a07d165-90bd-b9ae-d99d-6cbb79d9e75f@windriver.com>
Date: Fri, 20 May 2022 10:18:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [meta-virtualization][PATCH] podman: do not build or install docs
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20220519193936.39214-1-sakib.sajal@windriver.com>
 <CADkTA4PnUxAvrEYoMuiSBMK4mvwT+SVoX_j0AJ_aSm=Ne+09sw@mail.gmail.com>
 <9bfc9744-309c-d087-6f8f-d81bf46f1419@windriver.com>
 <CADkTA4PhqOSn=s9E+N4wQKy=GFAY2yBTzBs41p4KJ6CbWP_wuQ@mail.gmail.com>
From: Sakib Sajal <sakib.sajal@windriver.com>
In-Reply-To: 
 <CADkTA4PhqOSn=s9E+N4wQKy=GFAY2yBTzBs41p4KJ6CbWP_wuQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0074.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::32) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 622513d6-5b1c-4ba1-e720-08da3a6ba63d
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2156:EE_
X-Microsoft-Antispam-PRVS: 
	<DM5PR1101MB21563601B9027FEC68100545F2D39@DM5PR1101MB2156.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yq93iE3hsUp3Tk68vhmbKS+TGZuFUKGfyAmFmJAo/Wusci3IdtLUB2A/FjoezaWf/HHyP3RXCLilGQ2znKAjG6lS9Jf6p8y4HIRxb91j09a3kTRdroZ+vpPXfuXPr6nR0tbem4GnHVC/9hZW/vLbFy/rRzFZhBrVQVBcywiAr6T0y4zIA4pyc3F+/Yd3Hu+5rtu5jjd1mnOGTwVVhPyAG+51q7UwwNXhGrsaS91T9/of5EkxOkjqtfVI5goI1+4Y9E91+PnxMArKWTaKwdGBaIw6e8uZqVJvb1MxgsgPGsCA6R+omhMeOhkB2Ulcdn63rE6Lmc1fk22sBbOTfgou0KeN5d8tyC7aJqWv7J2uM1+bKpfey+tOIXVzqcw98oRIpCdkldlHE+jF93d/JxbK4yVTXEcOKQ+qG9qhWZjMGUBwLicGuon5OrGGt9vj7jR+fHqhsyGczSbM/dvGjnI7+Zyb2teTHaIsRQYpLol90d6m2TiaGt2WQkW8KykiGGnBJuHOv4PuHS0EfFo4EloMtEqTrpxzrJ7rTIlTadl/0COu48mErcxPLMyLUoOLTLVaPK7pkYF/IiWKCNe3lFltfDbMcvM5e1Tv5gRLWPO1XOi8QINGPoNu1WF4Sh5yV1Rct/0eO60yeBqeGsQGPHHkjQhhXH+7Rfv3fyDbnqePwUYjbfQKIMCyn5GQ8tAaj9zf0ou3buOj3jRDtzF25/ChmuSHedi3mbE/jNVf+awqNPwH+eGYQzAfIFb+tamcT6/OVDT9jARe9BLxULa1lFVB64WEd0/FRx0szotbSprv0NDMMNH94y7tOzkWTnK2Q/HqI3cEPsHt9BQr0B0H+0Gu/q5GYXTbVpCw3fLdFXukPHcG2KqRns5FNSfGNNdJsJ94
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(86362001)(52116002)(966005)(38100700002)(36756003)(508600001)(6916009)(53546011)(316002)(44832011)(26005)(6666004)(6512007)(6506007)(8936002)(66476007)(66946007)(31696002)(31686004)(5660300002)(186003)(2616005)(38350700002)(4326008)(2906002)(66556008)(8676002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MDhIWStiRldTOU1yMEFMYXgyaktLbGY0RmNVSE5GQU41T2djTGVjbEVsQnJm?=
 =?utf-8?B?dFQ2SWRPeGVXZDlrV1dzVHJISHEzK3dxOHFHMjNvTGJoZituV08wSmJmWmhF?=
 =?utf-8?B?QzhHaUNVMEFpYUdPVm9PZW5XYVd5RjVZOC83SjlPMkFuNUMzRVZxTVdlOEsr?=
 =?utf-8?B?ekRka0ZTSmdnMGQwVW5oamNWTm5TbU9ZeWZiZW90RW5aU1lRdnJRcklOUElu?=
 =?utf-8?B?TWRtbTl6MVQvOVBrRWhzSE1KT1duTlRYSGE0VE5ac1FONlQ3alcyOG9OK0Fq?=
 =?utf-8?B?SlVObjVKUXpxOENTNEdqbk10NlcwNzFuU1ZMZEY4TWNnc3I5Q2p5QzVGUHpu?=
 =?utf-8?B?cnNvMCtldWk4S1NNOUJYMllqQ1JoNnRVQ0twTDhmaFdtNWh1N1lBcWtlMFk5?=
 =?utf-8?B?YmIyU3V2ZGJFZnFTVUd5TWZPT1V2MU5vRTdGSUphUWVzaVJ1Y2VjYnN0WCt4?=
 =?utf-8?B?aXNUTzIwUTBBRm9XUEJ5ZlBQUTlEV0FQL0hCM3l0T1FhZHpLNVlFWXJrWm9a?=
 =?utf-8?B?QmkvNlpjVTl6bTlURlVKTWNmdHBkOUFHUGdRRG1rRHhiSVY3R3gveFYwQkhS?=
 =?utf-8?B?cWlSTE1kekxHdGtzbGFPYXozbnZDTDZSeWs1Y3cvSWNyamI3SUNvaDlwT3hG?=
 =?utf-8?B?cFZ0MjNVcVFPRVl2ZWYya2t5TnkvWnlmTGZTczBVWDgrbTVZclBMYktKNUVy?=
 =?utf-8?B?VHRiaFFVb1VoR1FKVkdybjJNdmhlMTJ3bFNobTYvLzFhbmJDbXdLZ2hLMVBq?=
 =?utf-8?B?aXhiVnpRcDRHVHZjYjcrNWtqbjlpWmlvN2x1K1JISFA1Q1ZpVGF6TmIrem0x?=
 =?utf-8?B?OGVuRUNsTHFMT1JsNWRkbEdEQXFiWWtMVXdKUEJVWkJrMGZQRXJ2QmJDaTkx?=
 =?utf-8?B?dmVFRTkzdVFLTVYxdEZoWlRBWExhWEpBbFVkQ2YramJVcVpNQlEzdFdQSHA3?=
 =?utf-8?B?Wnhkem40YjRwbjEydDhTV1hnenFhci81ODFtamdBbGg3K29NSCtRRE5vZU1H?=
 =?utf-8?B?T0R6OWZoUmhFVXhWL05kNXdlUnhxOFhSTkI1L1dNL0thNFQ3WE5oZkNKNjhY?=
 =?utf-8?B?KzNDSEhNdzVJby9QeHo3UlJVWjYxelRnaWtBVkxWWmd5NU4xQ2xydDJQZzE3?=
 =?utf-8?B?bnlzTUNnUCtWOUNTWVZFOXpwYkwrRno4OVN2ZWhKcW5ZZUNYajBmM2Y0RDlR?=
 =?utf-8?B?dmpORjRGeEdXZzNBUXdkTjNPbUp1YnNCcytteTgxUnNXaE5ldEU3Zk56WURo?=
 =?utf-8?B?MUhOMm8vaWxMdU1CdDRVOU94WlFFM2VrY0tObVhjSFIrTDJGdm9vb2tQMENS?=
 =?utf-8?B?Sk1KWGYwYkM0VytvTnNrTndCbU91RTlPQnlWUVZxNG5ZWlJRNkRvUm5RV2Va?=
 =?utf-8?B?R3lUSVNKNkx1dEVSbks5MDIwSTB6b3h0N09DaVA3RWdEWTg0MzNTNUJKOFFW?=
 =?utf-8?B?NWJxRHZaUHZpZWE3NkZYVzNOdWV5ZTZ0Y2RsemJHbVlRRlRiaUZtdkJQYmdx?=
 =?utf-8?B?MHNhTDZTaFlIYkkybU5GSk5YL2gwZkV0aXgwcXdIT0lvTWZnWXp4NHczdC9D?=
 =?utf-8?B?ZTZWNk91Q1RYN21zanhFSitlUE82eDlJV1lWVU1qWDdvdWJhQ0VacWtsdEZs?=
 =?utf-8?B?TENBVjNMR2pUTjVCYTc1K1NSUDN1YVJ5b3BiQzB2SjJLUko3dXRYenVaWmh3?=
 =?utf-8?B?dEZJTi92Rm91SkNlcXlUeXFiamR5MDl1TEFKNVlGWlFqYk01amphRlR0eE9W?=
 =?utf-8?B?VlhuNXVaZ0ZZQ0p5TWt1THAyb1YvMU9pdHV1L1MyemdmMGpVNE1ackc0dzFo?=
 =?utf-8?B?WnpvN0k0R3pLRVBOV3VXandrWHdLSENwNjBSZ1dwaGhUbzk1aGR3dkZOeHF0?=
 =?utf-8?B?R3R6UlkxaVhVNkVQa0tkKzJqRnA3MzBTNG1UQW14TXowNmRUZ2tNaGR6bjUr?=
 =?utf-8?B?eDYxSFg4NksvdFd2Wm5QS3V4L01rUjhWR1c2dkRZRU9GZ0ZnRVQ1bGx4N09D?=
 =?utf-8?B?OWgwNmZFeXJGeDFSRm1DcVlsVzhOVUQ4UDAvYnBPMVpKVGVFWWVjOHF6SHBq?=
 =?utf-8?B?Nmw5c3FPQ0tEdEFqZ2o3TzRGZzIvSXhOMDdHZHRBVkF1ait5WnQrYUpRUEVw?=
 =?utf-8?B?REFRSFZqd1U0cDN1YXdqZWk2ckFWY1lRQ2VIWmlITDdZcDhHZ1pJNE9wM2hh?=
 =?utf-8?B?SnZuclJXeDZ0UHdKSzRsR2hCYVVFQjczaFhoZkZVbjJ1RjkxWFNMSm1kV0Fj?=
 =?utf-8?B?czQ3dHBoUFBRS1VmSTRNTjVFQ3pjNmpSdXlqRTc2aVYxczRGZXZhU29yamVz?=
 =?utf-8?B?ZThwM01KVFFNaGxRbFFSbi9BTk1WS0dOZ3J6cWtEcXNvTVAxMFNZdzhNVExy?=
 =?utf-8?Q?cSe/mzdjMoToLIrQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 622513d6-5b1c-4ba1-e720-08da3a6ba63d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 14:18:45.3520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 zV8F62HDe2msqwRpMNVELtx0+36+xIMA2RTMmjFaiyG+i+O4RYbAdaMM8r/Uo/8zeBHVGRgSxZrDiMdiVDzGVQ4fp5MPf6+GDHvYrXxYXoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2156
X-Proofpoint-GUID: N0AlThbhWB1AzzAAgf9aAv0VkroJ6_n1
X-Proofpoint-ORIG-GUID: N0AlThbhWB1AzzAAgf9aAv0VkroJ6_n1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_04,2022-05-20_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205200100
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 20 May 2022 14:18:52 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7297


On 2022-05-20 08:55, Bruce Ashfield wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Fri, May 20, 2022 at 12:06 AM Sakib Sajal <sakib.sajal@windriver.com> wrote:
>>
>> On 2022-05-19 16:34, Bruce Ashfield wrote:
>>> [Please note: This e-mail is from an EXTERNAL e-mail address]
>>>
>>> On Thu, May 19, 2022 at 3:39 PM <sakib.sajal@windriver.com> wrote:
>>>> When using oe-core, podman do_compile fails with the error:
>>>>      .../podman/4.0.1+gitAUTOINC+717edd7b84-r0/recipe-sysroot-native/usr/bin/go-md2man:
>>>>      No such file or directory
>>>>      make: *** [Makefile:482: docs/source/markdown/podman-attach.1] Error 127
>>>> Whereas when using poky, the build passes without issues.
>>>>
>>>> Investigating the native go-md2man binaries from both oe-core and poky
>>>> builds using ldd, it appears that the issue lies with how go-md2man is linked.
>>>> On oe-core it is linked to the loader in recipe sysroot:
>>>>      tmp-glibc/work/x86_64-linux/go-md2man-native/1.0.10+gitAUTOINC+f79a8a8ca6-r0/recipe-sysroot-native/usr/lib/ld-linux-x86-64.so.2
>>>>      => /lib64/ld-linux-x86-64.so.2 (0x00007f4da90f0000)
>>>>
>>>> whereas on poky its linked to sysroot-uninative:
>>>>      tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
>>>>      => /lib64/ld-linux-x86-64.so.2 (0x00007f9c82c71000)
>>>>
>>>> I have confirmed that this issue exists on both Ubuntu 18.04 and
>>>> Fedora 35.
>>>>
>>>> Rather have this fail for people using only oe-core, skip generating the
>>>> documentation for podman until the problem can be resolved.
>>> I'm building podman nightly without seeing this error.
>>>
>>> So your message about "people using only oe-core" doesn't make sense,
>>> can you clarify ?
>>>
>>> Bruce
>> Apologies for being vague.
>>
>> podman fails to compile, on both Ubuntu 18.04 and Fedora 35, using the
>> latest master branch of bitbake, openembedded-core, meta-openembedded
>> and meta-virtualization.
> ok, so this is specific to those distros. Since there are quite a few
> different CI pipelines, and my own local builds that aren't seeing the
> error.
>
>> Below are the steps to reproduce and bblayers.conf (default local.conf):
>>
>> steps to reproduce:
>>
>> . openembedded-core/oe-init-build-env <build_dir>
>>
>> bitbake podman
>>
>>
>> bblayers.conf :
>>
>> # LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
>> # changes incompatibly
>> LCONF_VERSION = "7"
>>
>> BBPATH = "${TOPDIR}"
>> BBFILES ?= ""
>>
>> BBLAYERS ?= " \
>>     ..../repos/openembedded-core/meta \
>>     ..../repos/meta-openembedded/meta-oe \
>>     ..../repos/meta-openembedded/meta-python \
>>     ..../repos/meta-openembedded/meta-networking \
>>     ..../repos/meta-openembedded/meta-filesystems \
>>     ..../repos/meta-virtualization \
>>
> ok, cool. Nothing strange in that configuration.
>
> At this point, I'll suggest you carry that patch locally while you
> work through the dependent recipe, since I'd rather not merge the
> patch that disables the documentation for all distros.
>
> I'll see if I can get myself a containerized environment and reproduce
> the issue.
>
> Bruce
Sounds good, thank you for taking a look!
>
>> - Sakib
>>
>>
>>>
>>>> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>>>> ---
>>>>    ...efile-do-not-compile-or-install-docs.patch | 35 +++++++++++++++++++
>>>>    recipes-containers/podman/podman_git.bb       |  1 +
>>>>    2 files changed, 36 insertions(+)
>>>>    create mode 100644 recipes-containers/podman/files/0001-Makefile-do-not-compile-or-install-docs.patch
>>>>
>>>> diff --git a/recipes-containers/podman/files/0001-Makefile-do-not-compile-or-install-docs.patch b/recipes-containers/podman/files/0001-Makefile-do-not-compile-or-install-docs.patch
>>>> new file mode 100644
>>>> index 0000000..1363ee8
>>>> --- /dev/null
>>>> +++ b/recipes-containers/podman/files/0001-Makefile-do-not-compile-or-install-docs.patch
>>>> @@ -0,0 +1,35 @@
>>>> +From 7913cac21842f56ae9752fb0c253f838bab04ae8 Mon Sep 17 00:00:00 2001
>>>> +From: Sakib Sajal <sakib.sajal@windriver.com>
>>>> +Date: Fri, 13 May 2022 13:06:29 -0400
>>>> +Subject: [PATCH] Makefile: do not compile or install docs
>>>> +
>>>> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>>>> +---
>>>> + Makefile | 4 ++--
>>>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>>>> +
>>>> +diff --git a/src/import/Makefile b/src/import/Makefile
>>>> +index cb230d8e9..7e07ab61a 100644
>>>> +--- a/src/import/Makefile
>>>> ++++ b/src/import/Makefile
>>>> +@@ -202,7 +202,7 @@ GV_SHA=e943b1806d94d387c4c38d96719432d50a84bbd0
>>>> + default: all
>>>> +
>>>> + .PHONY: all
>>>> +-all: binaries docs
>>>> ++all: binaries
>>>> +
>>>> + .PHONY: binaries
>>>> + binaries: podman podman-remote rootlessport ## Build podman, podman-remote and rootlessport binaries
>>>> +@@ -754,7 +754,7 @@ package-install: package  ## Install rpm packages
>>>> +       /usr/bin/podman info  # will catch a broken conmon
>>>> +
>>>> + .PHONY: install
>>>> +-install: .gopathok install.bin install.remote install.man install.systemd  ## Install binaries to system locations
>>>> ++install: .gopathok install.bin install.remote install.systemd  ## Install binaries to system locations
>>>> +
>>>> + .PHONY: install.catatonit
>>>> + install.catatonit:
>>>> +--
>>>> +2.33.0
>>>> +
>>>> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
>>>> index f805cb6..8339a16 100644
>>>> --- a/recipes-containers/podman/podman_git.bb
>>>> +++ b/recipes-containers/podman/podman_git.bb
>>>> @@ -20,6 +20,7 @@ DEPENDS = " \
>>>>    SRCREV = "717edd7b844dcd66468f5d991991d87e9fc14c12"
>>>>    SRC_URI = " \
>>>>        git://github.com/containers/libpod.git;branch=v4.0;protocol=https \
>>>> +    file://0001-Makefile-do-not-compile-or-install-docs.patch \
>>>>    "
>>>>
>>>>    LICENSE = "Apache-2.0"
>>>> --
>>>> 2.33.0
>>>>
>>>>
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#7290): https://lists.yoctoproject.org/g/meta-virtualization/message/7290
>>>> Mute This Topic: https://lists.yoctoproject.org/mt/91216450/1050810
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

