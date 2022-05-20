Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD6D0C433F5
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 04:06:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4871.1653019573550037270
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 May 2022 21:06:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=Q8u+44+n;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=21395d0781=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 24K3XKDD029476;
	Thu, 19 May 2022 21:06:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=Ykd0d1bumeBo+FElw0vmzpWiowbxhpDZDT0C/tjw1DQ=;
 b=Q8u+44+nMifR3Yh/89lA0yJcPg7eCKSoulqyt0PajGIGQ/7tpQso+pqAYT6gZVXU1QEt
 SB9qZoaiazv/xu+TcM/rDjZ4tap6EGKIWXMuK66YoDQ7jEzVnNsVyfP4wk8prz7xT9Df
 /kIokajg7z1fp1lToRzulfaRKdFmyDhSJyysCk97rmujmYEEkCg2/f0rzLYvshv32SE9
 FFvRpMc9bOe5X3RgovbJ7YRhUwbFKJjOmjQLaDEN2XyTSB1ygj9G8Hzp9jxDE6Pb3ZkG
 5RvXKdWqZfEuUvAy6FaPLrMS4F7kGaHSLMvPT+EgPhsC86I02mMtG1KLneaeuyDzrNXv /w==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3g2bxmvnx7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 May 2022 21:06:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+REm69YshVpNniMc/QObsx7gB13y0/bblVZRcy6ivXZ6gRm713UjfYK/fvUwj4SpL0vtX0A0WxZ3SB+7BMMVzadEFolkyIwBTfH5PdfGdScrraoPdgiYyH3EUEVmxjT3ppZG/yCuz0VT8OrThRK5Y+97E0bKeOJtG8SF1l9wqLFO8Vow8L3JkIoYJPeZRqiO7bLvmdSjbr5LgZRluDOnf7RYhXxXsnA9LYNK/yhs5kP/V3XUPiJgODmoScGAa58j97T3pnwjuo8fugRJU27B547/C6MEF9CHgqhTjBUnxcSFWiXXlbh0ruWwuxLxY0sTEaEiVyjulC1O+82jU7rqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ykd0d1bumeBo+FElw0vmzpWiowbxhpDZDT0C/tjw1DQ=;
 b=Wb5CGlnZR7G9MTNNQdYXLbKxTKazOIGwe+1qSahLkcW7tQ/Hnh3T/MTQ+WR94lXHIJrZNQ97d2p8hBet/aFM6ESukvkIiauyDqmhTR1Em+zDdiiAgIz8prvII5jHM4jotp9ygJ+KYniTN8D0DDSFNxJlXCiQYZpEQXfMXm39pmSkAs2MX4dqX7hlKFIGRsecxilHTjKrFi+FutJ0Xaajmnfj3wu6FslZHkTVesnLvYLpIri79Xag10JcVrtCGEYIzK8iMx7SbFIJH8X3eyhDkLluiNHhaqpdLVtDMXcgDMqnmHjf6QKRF0D/sqec+cBT0g/FGoKwf3WQkgvGRPz4KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 BN8PR11MB3585.namprd11.prod.outlook.com (2603:10b6:408:89::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.18; Fri, 20 May 2022 04:06:09 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::7cb0:dc6c:b2b3:b69b]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::7cb0:dc6c:b2b3:b69b%5]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 04:06:09 +0000
Message-ID: <9bfc9744-309c-d087-6f8f-d81bf46f1419@windriver.com>
Date: Fri, 20 May 2022 00:06:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [meta-virtualization][PATCH] podman: do not build or install docs
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20220519193936.39214-1-sakib.sajal@windriver.com>
 <CADkTA4PnUxAvrEYoMuiSBMK4mvwT+SVoX_j0AJ_aSm=Ne+09sw@mail.gmail.com>
From: Sakib Sajal <sakib.sajal@windriver.com>
In-Reply-To: 
 <CADkTA4PnUxAvrEYoMuiSBMK4mvwT+SVoX_j0AJ_aSm=Ne+09sw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: YT3PR01CA0003.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::23) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e5aa275-2b51-46a5-bf10-08da3a1611c4
X-MS-TrafficTypeDiagnostic: BN8PR11MB3585:EE_
X-Microsoft-Antispam-PRVS: 
	<BN8PR11MB35854C8E52DEFF02781315C8F2D39@BN8PR11MB3585.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TkP7FWHkGRXRLUOeeaLkWTGoGdTvuTisfAYGdInytAlGfsH2SIfM3EvN831SPDbl5pVLjRJcRqrpx++lJ1Tm6MjIcPjd6doZz2g3T0Xb6Lznzz+bM7vKqcasHLzGXtNcbYkrqUH/E9+lwYjMh8L9t1/tDvLmL/tLRpb84RCFCOWBKinxAak1//jj7q7fyFy9x0vc2gpMyrG710TWCYSWbdXBOiQFydvwUCaf0ml+NWnIkR9Gp+lAwcRyQK8k4bbnnltpjcXEYLMdv/8VjNpjA4u+UysrjJy+Md/HPPTdmcuneA+3B883myxa+T9v0bVMK4dw9xWn6Wu7MFw3IyRkHfxaKfloA6SXLMXvQIl+4ex44g3UHGr7HEYGWxJnvzhVmM8O1Abp3whKDH/TOvtMVRVfcnc6zSFR3t50lHZuXCbuYYDC2c1FDWayiZbZ6o9cP8J2HCzVcw9d8OM4lDMmlid0HZuIEhHmT1mWgfDf/Ms+UfHo4Lzulk0yE8Qg5NQlXmo/V67uhl6cQpcPQt9GGHP6P+gGffyR8m4lcPLZKad38Xda7FgnoL4ewyV5/Dxbh5JqxXxMPdc/d/7bDMGq4Ezfqh0+B4owx5ag5gVGHCuoTdMF8l5BXxIjn3iLM31gjtCj2K0IjsEr6Tec8T+Ywvz/Zsf1tZ6MARqiprzqxkakbqDqCajZiRlNp66BPdkmg9bO3PXaiGYM5b3zpaoezi5IwIYPKhzaRS/nryDC7wb1w7Bvb36k4pNDzZ1KdKJaAiWRz3txqh58Ea4B48cjOGehxxyl9plde2mA4P1KAMeVv0OU1vLA+saguNXYT7GPR0PIs0ePo8IzxPoJSfmd5jvQG6KAXACj1gPIg/eILS4UYr0aKrf5eefKqI9ESXPj
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(38100700002)(186003)(6666004)(53546011)(508600001)(52116002)(38350700002)(83380400001)(8936002)(6506007)(6916009)(966005)(4326008)(5660300002)(8676002)(66476007)(31696002)(66946007)(86362001)(66556008)(26005)(2906002)(31686004)(6486002)(6512007)(36756003)(316002)(44832011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SzIzKzc0cGEvZnM4b05Yb3dlaHgrUHF4eXdHb3dpNFZmV0c3dTBWKzFzc1FC?=
 =?utf-8?B?VVdabm1BdDNHaHBiakZLTE9DQTE4NzhvTm40T0N1S2hlMWZSSTBZNGdhVURp?=
 =?utf-8?B?T1Z1SXFYSWFMd2RKbXZNN1FIYmx4cUthdUVSUDRCQ0dWT2F6ZFFmY2RmYmkv?=
 =?utf-8?B?ejhwVytUbmpGV0R3bnE0VnJTc0JHcit0TjlEN0xWcXExWlNlN2xmaW95VmFB?=
 =?utf-8?B?bUNGckgrcTFXUWt0S0RUUm1nVEJVaGk4YU15R3lzbmswMGpUK21sQ3YrVVhN?=
 =?utf-8?B?ZDF4eGVPY1Y2NnlOKzg4RUpzNlhLMlJZUzlYL0JYdkppVGJGZGNEUEtCVmw3?=
 =?utf-8?B?cnRvdC9yM1E2eitQN1NCU2JpakZjd0ZyRlZNZWIvNlZRMWNQbW9tOGZoL2s4?=
 =?utf-8?B?MUxSYVpEL1gva3VmNDRteEZXWEFJTDlIYnloTElGSmVlTHJ2QjJnQzRHUE10?=
 =?utf-8?B?azV2YzFqZ29JMXBzTkpPazVDQzFSYWdzNFY2ZlJkWWhwcjhHSTdqUHh3NFdl?=
 =?utf-8?B?ejNSTE9zaEwyZDg3NmRCL0xTNEpQTEJibVlPaXVoaXNORDNXK1oxbmFGZlNh?=
 =?utf-8?B?YWN3ZmpMb2YrYkllQXZYanh3c2lsVE1sWTZaMmRBdWExZnlsd2RuZEhvazcy?=
 =?utf-8?B?WnFnVTBNei9CZEMwbEFGUEF1amp5aDQyR05jZ0ZLUDBNemJCdHQ0UzM3NXZz?=
 =?utf-8?B?YUdiUTExRFRaVmNTZFZsdE8yUmUzd1JReGNFeTBrN21JNEhHRlBrdEhhNzND?=
 =?utf-8?B?OGJ0QnNBbk1NRmEzNkpxdWpKM01Pd3NWYnh4WVp1QS8wVFpMQjBDcXJMSWZv?=
 =?utf-8?B?TnhBYnRlWEs1RzZZZXZXS0JWcjhTYllja3dtVnlad0xXbHhWbjRkdlAvMnVV?=
 =?utf-8?B?YnMvaW9hUlA0b2w1MnBPYTAwSTlLTUx2TnViZUdseHJROGpubGcyNE1jeGE4?=
 =?utf-8?B?UkV6VlNGeEdlMlY2aEROVFJHYXlFSUdnVUlVWVd0aWFlb3hValJTOTZtVlFU?=
 =?utf-8?B?ODZCMm9kLzRnamRvZXoycVpKQTRhb1pqdkhURFBCaHZQRVRBSFVtZVlWdlR6?=
 =?utf-8?B?WVdsMkgzd2dBMFJrK1dseDlCdmVvY0lhQlp6cnhPbVkvYll3azQ1Z3J0UytS?=
 =?utf-8?B?R2hiZTFtdFFPNERmVy8vanZ0My9OS3pRK3BQTTVSa0JiSVo4UGNMZVZBS0FH?=
 =?utf-8?B?QkFQbzZFWXBQckZpMmVqK2s0VHVPanprdjVYYmhXdWhjVXpVaDRaeTE1UFQ1?=
 =?utf-8?B?L0h4djJTckR4ZGFaa0pvRW91bktBUHBwOWZlbjNkTEw5N1VEVkVuOHR5RTdi?=
 =?utf-8?B?T1ZiNE5FdHBDdldzM21wQ0ZoUjFLSExsZHlXV3RCcjR0V1ZXeW1BUkRPd3dN?=
 =?utf-8?B?dTNrK3MzbjU0ckFWYW1BVUgybU01clZ2YnRGVnNSSlRrbkdhaU4xZUZ4Zlk2?=
 =?utf-8?B?TTlrajVINCtseVBCQ3BpTzJUVSs3eXNuUGVxT2QrbE5MK3ByaWlkVDB4NU9s?=
 =?utf-8?B?bFJycVEvU05GQm9haWQ4NzAvWXNJWTREVVRXV0tjSzRVZTNxMGduVWcyRTE2?=
 =?utf-8?B?ZjAra3FjRFhQTERMMVhoalVxRlg2U2ppZXdjRHVPeWpSRXo3Z00yUFh4azVu?=
 =?utf-8?B?aDkyZWpUUk1xaWJXdzJtMHRZdlRQMStDbEl4QVNSTnVPM2JCZGcrYmpFVk5P?=
 =?utf-8?B?d0tQM2QyQThGQWc0RitPeWpYUEdBU1FURFdMYXAvNGhzZzhLWGZSVHlXOFNo?=
 =?utf-8?B?WFJhcjlhK0dBNGROeEFQN0pSYi9zYmZKT0haaEZWMTZJT2ZRSWtRMnIzV0hZ?=
 =?utf-8?B?cFdERjlLb3Ira1BwYk8rTTh5cWl6dmZuQ3Zqb1duVnpyTi8zUTBOVHI5MEQz?=
 =?utf-8?B?T1FBNm9MREZlaDhHMDg1TmIwbW5JN2xkNXA1OTNBVGoyZlZtY0xVL25rYldQ?=
 =?utf-8?B?QVBmTjR6Y2RmRkpNMnZDa2tuY3dUMGN1UFhQWHFEd3hoVi9Ja1A3Q3IxVVZh?=
 =?utf-8?B?U2dlMGVRQm43dlJpNWV6dllXRWVwS0llM3ZBYWpHV3U3VFhwa3FMTWtyTVFn?=
 =?utf-8?B?NzNxclN5UDZNWC9NeXl4Z1FIcDZpK2ZTRW5zNi90Q3JiS1E2OHJtZXIvL1g0?=
 =?utf-8?B?am9vMUpwR0dpS1BMbERiNzNyVGFxVE9TeldNRUY0Wm9OOUcxUktCRFlScldF?=
 =?utf-8?B?QUZJN0RXa0JEYnNKNlRqeDEyRzJGZThvTlNXSGhobGNtVGgrVWtHRzZSbUxm?=
 =?utf-8?B?RHBsdmNWS1RtSXQwMFVMZzU3cFNTcFp4WEZZQWhWbVI3MUNlb3daUVk5T0Uz?=
 =?utf-8?B?M3pLbml2RE5CVnluTnMwZytjN21Kb2ZNZFprSmNMYm8zVHlHZllSZVg0SXBE?=
 =?utf-8?Q?qyP7CNre1FCCZ+XA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6e5aa275-2b51-46a5-bf10-08da3a1611c4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 04:06:08.9238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vbuM6KK9yDutRLOttbbWkA2L8iAbpeXPPn4PdhdnQQts2n3WJZLSpzOCtdau1J9x7Cqd5JW3K19SfWG5tQvQzKgwpTlR8m5CpZ4dzydOaBE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3585
X-Proofpoint-GUID: lWfMWWKHEUbxugTtoIPUxDXKI48cVicU
X-Proofpoint-ORIG-GUID: lWfMWWKHEUbxugTtoIPUxDXKI48cVicU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_01,2022-05-19_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205200028
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 24K3XKDD029476
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 20 May 2022 04:06:19 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7295


On 2022-05-19 16:34, Bruce Ashfield wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Thu, May 19, 2022 at 3:39 PM <sakib.sajal@windriver.com> wrote:
>> When using oe-core, podman do_compile fails with the error:
>>     .../podman/4.0.1+gitAUTOINC+717edd7b84-r0/recipe-sysroot-native/us=
r/bin/go-md2man:
>>     No such file or directory
>>     make: *** [Makefile:482: docs/source/markdown/podman-attach.1] Err=
or 127
>> Whereas when using poky, the build passes without issues.
>>
>> Investigating the native go-md2man binaries from both oe-core and poky
>> builds using ldd, it appears that the issue lies with how go-md2man is=
 linked.
>> On oe-core it is linked to the loader in recipe sysroot:
>>     tmp-glibc/work/x86_64-linux/go-md2man-native/1.0.10+gitAUTOINC+f79=
a8a8ca6-r0/recipe-sysroot-native/usr/lib/ld-linux-x86-64.so.2
>>     =3D> /lib64/ld-linux-x86-64.so.2 (0x00007f4da90f0000)
>>
>> whereas on poky its linked to sysroot-uninative:
>>     tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
>>     =3D> /lib64/ld-linux-x86-64.so.2 (0x00007f9c82c71000)
>>
>> I have confirmed that this issue exists on both Ubuntu 18.04 and
>> Fedora 35.
>>
>> Rather have this fail for people using only oe-core, skip generating t=
he
>> documentation for podman until the problem can be resolved.
> I'm building podman nightly without seeing this error.
>
> So your message about "people using only oe-core" doesn't make sense,
> can you clarify ?
>
> Bruce

Apologies for being vague.

podman fails to compile, on both Ubuntu 18.04 and Fedora 35, using the=20
latest master branch of bitbake, openembedded-core, meta-openembedded=20
and meta-virtualization.

Below are the steps to reproduce and bblayers.conf (default local.conf):

steps to reproduce:

. openembedded-core/oe-init-build-env <build_dir>

bitbake podman


bblayers.conf :

# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
# changes incompatibly
LCONF_VERSION =3D "7"

BBPATH =3D "${TOPDIR}"
BBFILES ?=3D ""

BBLAYERS ?=3D " \
 =C2=A0 ..../repos/openembedded-core/meta \
 =C2=A0 ..../repos/meta-openembedded/meta-oe \
 =C2=A0 ..../repos/meta-openembedded/meta-python \
 =C2=A0 ..../repos/meta-openembedded/meta-networking \
 =C2=A0 ..../repos/meta-openembedded/meta-filesystems \
 =C2=A0 ..../repos/meta-virtualization \


- Sakib


>
>
>> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> ---
>>   ...efile-do-not-compile-or-install-docs.patch | 35 +++++++++++++++++=
++
>>   recipes-containers/podman/podman_git.bb       |  1 +
>>   2 files changed, 36 insertions(+)
>>   create mode 100644 recipes-containers/podman/files/0001-Makefile-do-=
not-compile-or-install-docs.patch
>>
>> diff --git a/recipes-containers/podman/files/0001-Makefile-do-not-comp=
ile-or-install-docs.patch b/recipes-containers/podman/files/0001-Makefile=
-do-not-compile-or-install-docs.patch
>> new file mode 100644
>> index 0000000..1363ee8
>> --- /dev/null
>> +++ b/recipes-containers/podman/files/0001-Makefile-do-not-compile-or-=
install-docs.patch
>> @@ -0,0 +1,35 @@
>> +From 7913cac21842f56ae9752fb0c253f838bab04ae8 Mon Sep 17 00:00:00 200=
1
>> +From: Sakib Sajal <sakib.sajal@windriver.com>
>> +Date: Fri, 13 May 2022 13:06:29 -0400
>> +Subject: [PATCH] Makefile: do not compile or install docs
>> +
>> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> +---
>> + Makefile | 4 ++--
>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/src/import/Makefile b/src/import/Makefile
>> +index cb230d8e9..7e07ab61a 100644
>> +--- a/src/import/Makefile
>> ++++ b/src/import/Makefile
>> +@@ -202,7 +202,7 @@ GV_SHA=3De943b1806d94d387c4c38d96719432d50a84bbd0
>> + default: all
>> +
>> + .PHONY: all
>> +-all: binaries docs
>> ++all: binaries
>> +
>> + .PHONY: binaries
>> + binaries: podman podman-remote rootlessport ## Build podman, podman-=
remote and rootlessport binaries
>> +@@ -754,7 +754,7 @@ package-install: package  ## Install rpm packages
>> +       /usr/bin/podman info  # will catch a broken conmon
>> +
>> + .PHONY: install
>> +-install: .gopathok install.bin install.remote install.man install.sy=
stemd  ## Install binaries to system locations
>> ++install: .gopathok install.bin install.remote install.systemd  ## In=
stall binaries to system locations
>> +
>> + .PHONY: install.catatonit
>> + install.catatonit:
>> +--
>> +2.33.0
>> +
>> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-contain=
ers/podman/podman_git.bb
>> index f805cb6..8339a16 100644
>> --- a/recipes-containers/podman/podman_git.bb
>> +++ b/recipes-containers/podman/podman_git.bb
>> @@ -20,6 +20,7 @@ DEPENDS =3D " \
>>   SRCREV =3D "717edd7b844dcd66468f5d991991d87e9fc14c12"
>>   SRC_URI =3D " \
>>       git://github.com/containers/libpod.git;branch=3Dv4.0;protocol=3D=
https \
>> +    file://0001-Makefile-do-not-compile-or-install-docs.patch \
>>   "
>>
>>   LICENSE =3D "Apache-2.0"
>> --
>> 2.33.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#7290): https://lists.yoctoproject.org/g/meta-virtu=
alization/message/7290
>> Mute This Topic: https://lists.yoctoproject.org/mt/91216450/1050810
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

