Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB20EEE0219
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 02:00:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3013.1694656818286025385
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Sep 2023 19:00:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Ii87N5ev;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=762155788c=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38E1eb3c010080;
	Wed, 13 Sep 2023 19:00:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=r5fl31Tsx7Jj42vsOEytRbwctWf2mZSLSq02gJ7p7tQ=; b=
	Ii87N5evYPjXX3/tGcXz0sveYnXVHy2me5qLuVwROZR57/1sAi9EWyceUeHhkP/v
	ssWSmYbqN46VNSxP5ejbAJize5Y4BKmR3SGRWWCz+3GoQfb4nRp+oIcMptu/7VGw
	jiWcsXyfgy7XAuPTjXvdd5wsHxaetK1VhmR1khtmSDmBndujJL9GkjlCGZGLbhX9
	njwP8o7XmiRKfI+bmfgpVZBYk4nimzHVUDGkpkQLTP7ud9usJh+PUJSUvED9K013
	xCk67u7p7aIMURk/Z0wUFhJ5hzzV+7dchkbrKouRSKrgKU8teCRZU4cYYw5Pz010
	cOzeuOHrVci8pbzIy2SCNw==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t2yafh9hw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Sep 2023 19:00:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kefap530m5MhQdgmKtJHoeoGhXjryRRb7Vdsl21zAJP+ibyHmPlZFGoOWY+PWx65Hc0SOQLPNn1lv55j0peOtJDkvKGYkJ5RT4FctleHt9Spx1cDY0hk5bRMes/zHMe1nVsjRfbqdVimJrPg7h8aXmgV0WQoHxnS42TH9F2HaO+9GZ2gH8/ijQJOg8neeSdyO4lLO84usJq5/bize4PL47QDM1HqINw5MxJ9D7kYM4X+0cy9lXmRof0AnfinrFHX6ZQs/4rSCDTLxhphiNUGRJy6nhO+gHimVPeGLUQOhA1TR6k5gPXMdej4wzLZFzyZgJzXZAw5CbH9ZVrbpMiXag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5fl31Tsx7Jj42vsOEytRbwctWf2mZSLSq02gJ7p7tQ=;
 b=MnFi+QRg/T2+g785G3A80fh9ljxjerGn55Ma545YLOO/OtxTpC8TIsNY5nGqhPL2BhqpIzYFmMwKN6oRAkqn2MGtLAfzIDlZRHw0tnbVj2KZVXcZmA0XXbzmpFc1KFZ35FmNdmlTfS1kVCEwOoJTAKZ3fuuX6JVE+GQiFXod53O19Gf19N4LJvRjanCg4oYzrCpPkk4KzFMAzVqWfK7+HNa3c1m4344PQcmsMmbQnavcQoHBPmaPqP4sTm9vO1hnDx7qk/kGEpka1uLozmmvOfMnYBagde0MJIuXRkCi3wT1T0X+6g/XohMbtb7L08wrN7z7t/tBjGm38gvaZQhzrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SJ0PR11MB4813.namprd11.prod.outlook.com (2603:10b6:a03:2df::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Thu, 14 Sep
 2023 01:59:55 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::5446:efd2:e157:26b7]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::5446:efd2:e157:26b7%3]) with mapi id 15.20.6792.019; Thu, 14 Sep 2023
 01:59:55 +0000
Message-ID: <ea054f53-8255-07fa-517a-2236dc5d785f@windriver.com>
Date: Thu, 14 Sep 2023 09:59:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [meta-virtualization] [PATCH] oci-image-tools: don't build for
 riscv64
To: Randy MacLeod <randy.macleod@windriver.com>,
        Changqing Li <changqing.li@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org, bruce.ashfield@gmail.com
References: <20230901090308.3242531-1-changqing.li@windriver.com>
 <ZPVJdC6MVeoKurB+@gmail.com>
 <9c5a6ba1-f1c0-2aa0-9143-e40e4285b828@windriver.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <9c5a6ba1-f1c0-2aa0-9143-e40e4285b828@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:4:197::11) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2557:EE_|SJ0PR11MB4813:EE_
X-MS-Office365-Filtering-Correlation-Id: 313064d1-d153-46d5-1472-08dbb4c64aad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KD/YOvZF0aui2/vbq2GrQqUpXKUGrl+RefW+/VNf4tVUk3WaQriO590AQkJOpkkSwYRj4ZE7ZmFImj+k7IT5y12Wsx3Xs89EoiSh1tkj9NWG9M8DOligCHDApte4JIPLDTyPgZmPxnqq9VKEaKVasNTIrgl07Z+jPkf7m26pl2SYaWF4YfG0gPj/wL/nhPkakoKbyRUsCbqZY5KQ6r3E0V4eywZ1FcAYzIt6a5jYxDNTXgpbO+2uvF8yHsDzn4LTp8gsWh7GyfdfOMv7cPX9m0n5rgot9PmlNLbQ60LicqZ6jnaXWdZz8sJp/bNJiH5kLb6G2OgdszD5bFGiqqSZZKxltELdGNmw+/BsBBy4dwsnLH1KtCORxio/vxUG9Gl3WBpNlJAtDQ5ZZu+lFgj6rduk8TgRqoM8rDprpSeQZ+P3GA0uJnkc29HAt16ADZJpfwtZ+FwYRjRwZr4hKFmPbErlBexmAuFNhQQYZFj0xowH4mmKoZS8hFxCIBt9NHJd5wAX39MKMvM8adY0RkP1PU+c5707gIKzTSH+lK9I+kUPdK5uhB8swXpBxjYWj0A4wIznXCJZSBayDCgnvk62lUaypUeHlc26n0mWWmQXmMgXYTXBpSFAV/TrE39JAmW1ng1gW3iMqU031mncYnAzgA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(39850400004)(396003)(346002)(186009)(1800799009)(451199024)(66899024)(478600001)(6512007)(2616005)(53546011)(6486002)(26005)(6666004)(6506007)(83380400001)(5660300002)(44832011)(110136005)(2906002)(8676002)(8936002)(41300700001)(66476007)(316002)(66556008)(66946007)(4326008)(38100700002)(31696002)(86362001)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MlBKZWxhTExKejJ1YXdDZkdzNlNRaHFoSGczY3R1ZnJKdUo1K2ZBR1RBRFpW?=
 =?utf-8?B?bTh4ZmFZODdZSHl3dmNHQnRZWjVJa3lNamRoSnNYaFFFd0xaZXlEeVlJTjRz?=
 =?utf-8?B?L3FtTURUTnJnQTVlaVZtV1Q4VFR2Qmhob2hoZDROa2JVVGw0UGZvQlBGTXli?=
 =?utf-8?B?c2xPbzVBbkFJMWtKSVZSNDliN0ZxR0RUWFMyZ3RSVDlFV0xvRUFsdmJFRkZq?=
 =?utf-8?B?R0lWdGpvQlNPeFE2NzRGNnJoc2ZmZ1F5VWxiU1haMmZnVDRCNDdCQ0txUFpq?=
 =?utf-8?B?d3M2ZE5QVDM0bDBSL1JLVUtvczgvWncxcmFHU0dNNmRTSVBlQnVJbmYrNyt5?=
 =?utf-8?B?M1VWNkRVQ0E3TmJjU3ViZzEvZllvRUYxV2EvblVxN0dNYUNWeHIzZXBZczFK?=
 =?utf-8?B?OWQ2WW11UUg4OU5MQ3ZYd056dzV0S0ppWUhFZG9sMVhwVzhuNFllTE1CdzJG?=
 =?utf-8?B?bm1IMUVkRklWRnkvR3FXSG9zZ1dpNGxQMnMvUTRPaGc2TWZYUG9iQjRncXpB?=
 =?utf-8?B?TFZBUENIZjQyQnRrUCtYVHlJTzJCQnBHYzFvSzI5MCtMUnhjcHpMZ0JPNWov?=
 =?utf-8?B?eTViUmp5ZUlNMVRiRnRSLzZzdTVMaEhhWjlvNHhuNXovQlVuR282RldndHgv?=
 =?utf-8?B?RGxvcXR3K3l1NHpPSk1sOU8xckVDOWdRTk1INTZSbENKcENUU1dVM1llM3dl?=
 =?utf-8?B?S25FQmpoc29lUWhPbkZYTDFmRmQwTjh1anB2OE9FSi9rZnZabmllNVM4aWFN?=
 =?utf-8?B?NUREY2JMUGxOMWpHU1FkU2pDay80RDJySjZTWFpBckdYVjRtTEFYWmFLbGpB?=
 =?utf-8?B?N3k2VlpYRy9ZSkxiQkdoUzc1UmdPc3VmVjErQVUra0NvV2ZURnhsMS8zajJX?=
 =?utf-8?B?Z25jNDB0U3ROay93bDQ0SXJNa1VjYUpQcHNaQTVoamJBbmw2c05Kak9pQkQ0?=
 =?utf-8?B?YjN5TitrOWtKaDVIRTVzMDNkczhXdEFaT2g4aU5NY0xlNnNGNDU3TWtOWjA1?=
 =?utf-8?B?dkI1R1h3Z1ExYmdlK1ZEOWVSSUFFMjU3dU5PT2FRdWEvdkhKaFhzazl0TUhr?=
 =?utf-8?B?bkJKNEd2eU9IVkQxS2tTc0R5MmpOWGpCSCtndE1DV2o4WXBrVWhjMk5rcEpK?=
 =?utf-8?B?OWxNb3Bxenp2M3lBRkI3Rng4ZWZkNk5BY1pGQ0NvY3o5cUlhVVV5WXVVeWts?=
 =?utf-8?B?Y0xnRHlBMk5NUHVUSGFCZnkyQzYwZzJ6MHpWajUrSHZtVzd3enlodGMzWVhP?=
 =?utf-8?B?MXdQckF5bkRCOHpWbDlEdm5oTFNWZG5oa3B0dnk2em1LbzBkY3l0Ym5oY0pH?=
 =?utf-8?B?TXZkemhIOFExN1EwZHI3TlJqZExYTzRDQ1BPOVoyT2RvRmpiSDMxQVE0VDUx?=
 =?utf-8?B?bHZsOU5GMHR4dEViRkdZNHp2Z00vaDZjVVlpRmFVM0VjRVZGOXNKZGpNenlM?=
 =?utf-8?B?UmJQRTdxMGxHRnBCZEFMT0ZpVk5CMUdoZWg2cTRwVkFubVIzSm4xRVJjMzQx?=
 =?utf-8?B?Z01zU0ZzbXJ5SXNDRmJTN29VZGZnVG1OeDBTQUFHcEwrU1puclYxM2RiczZ2?=
 =?utf-8?B?M2IxdkhtVU1YU0pOQnB6Z2U2TWIzNlJtejRTd25TWXVpaWtNNy91WThkVU1m?=
 =?utf-8?B?emp3aFA4TDdTWmtpdVZFeVpobzRnb0QwOVZtUUp1Z3RrK1VRUUpxUGpUTDd3?=
 =?utf-8?B?aG9pZUNKbGl4c01pcTNLMnhJZnl1bnhiYVZJWUxVNy9hbnJkanFtTWdON0pk?=
 =?utf-8?B?UUE5M2J0eGNPMkdwRy9GdFBoMTZPK1JvSzNCbEdUKzU3VWtlODUyUjYwbzZw?=
 =?utf-8?B?cy9sTGp1cWZoVHZ3S01wQnV0QTNtaytDOFoyS0k4a28zV0FPWE9sV3dqNWI1?=
 =?utf-8?B?NXZYWmhvdHBOTVhHc01VVUw0dTViL0grMzRlUTAxSUNzVCtuWVdtanVOUCtV?=
 =?utf-8?B?cFp2ZnFoY2F2d25vQWFjR01YVGlKMEdheUpvNFNldmV1ajA3bThVT1FZSnhy?=
 =?utf-8?B?czNBK3hoL1BZNW5UVklGZTBaZE1HVjN5TlpST00rUWg0NnU3WUdBcWF5NHUr?=
 =?utf-8?B?aGc5SDl1cTNkaTd1OVlscU5yYmUrRmJGWWVjOE5WbFArKzhVSDZXS2d1SlBQ?=
 =?utf-8?B?WGJnamJtbHZFK1p5WGxDd016L2FFZEx6SDRpN09SdlZyZGR0a2lBc1paTUdO?=
 =?utf-8?B?Y0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 313064d1-d153-46d5-1472-08dbb4c64aad
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 01:59:55.4465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mIKUcbXa9aY7HFg7U1s0YPfN5Wx6c0pPZTyI/gv+d+PYjHVBv6xeEt2HQueZFf1g+NvwrcRD0Ueu7xJRW8K5NaeLYVvyavFIJlL3TgTITN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4813
X-Proofpoint-GUID: 3hh8hTV-wkc9zZGwgC282vmxerW0l7HQ
X-Proofpoint-ORIG-GUID: 3hh8hTV-wkc9zZGwgC282vmxerW0l7HQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-13_19,2023-09-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0
 mlxlogscore=722 priorityscore=1501 impostorscore=0 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309140016
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Sep 2023 02:00:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8302


On 9/6/23 22:24, Randy MacLeod wrote:
> On 2023-09-03 11:05 p.m., Bruce Ashfield via lists.yoctoproject.org wrote:
>> Since riscv isn't tested with meta-virt at all, this isn't
>> the only recipe that has either build or runtime issues.
>>
>> This is staged to master-next.
>>
>> Bruce
>
> Changqing,
>
> Should we report the issue to the upstream maintainers so that
> should riscv64 actually become well-supported in meta-virt
> over the coming years, this particular issue stands a chance
> of being resolved or are 'go' packages just not there yet for riscv64 ?
>
>
yes, I will report this upstream.

//Changqing

> Thanks,
>
> ../Randy
>
>
>> In message: [meta-virtualization] [PATCH] oci-image-tools: don't build for riscv64
>> on 01/09/2023 Changqing Li wrote:
>>
>>> From: Changqing Li<changqing.li@windriver.com>
>>>
>>> Currently oci-image-tools has a do_compile error for riscv64. The
>>> problem could be reproduced by:
>>>      MACHINE=qemuriscv64 bitbake oci-image-tools
>>>
>>> So explicitly set COMPATIBLE_HOST here to avoid it building for riscv64.
>>> When someone interested in using this recipe for riscv64 fixes the
>>> compile issue, this setting could be removed.
>>>
>>> Also don't build packagegroup-container/packagegroup-kubernetes since
>>> they depends on oci-image-tools
>>>
>>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>>> ---
>>>   recipes-containers/oci-image-tools/oci-image-tools_git.bb | 2 ++
>>>   recipes-core/packagegroups/packagegroup-container.bb      | 2 ++
>>>   recipes-core/packagegroups/packagegroup-kubernetes.bb     | 2 ++
>>>   3 files changed, 6 insertions(+)
>>>
>>> diff --git a/recipes-containers/oci-image-tools/oci-image-tools_git.bb b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
>>> index 4beb3a63..8c5020b3 100644
>>> --- a/recipes-containers/oci-image-tools/oci-image-tools_git.bb
>>> +++ b/recipes-containers/oci-image-tools/oci-image-tools_git.bb
>>> @@ -29,6 +29,8 @@ EXTRA_OEMAKE="BUILDTAGS=''"
>>>   
>>>   S = "${WORKDIR}/git/src/github.com/opencontainers/image-tools"
>>>   
>>> +COMPATIBLE_HOST:riscv64 = "null"
>>> +
>>>   do_compile() {
>>>   	export GOARCH="${TARGET_GOARCH}"
>>>   	export GOROOT="${STAGING_LIBDIR}/go"
>>> diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/recipes-core/packagegroups/packagegroup-container.bb
>>> index 8d418e95..c41576a3 100644
>>> --- a/recipes-core/packagegroups/packagegroup-container.bb
>>> +++ b/recipes-core/packagegroups/packagegroup-container.bb
>>> @@ -4,6 +4,8 @@ LIC_FILES_CHKSUM ="file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda 
>>> inherit packagegroup +COMPATIBLE_HOST:riscv64 = "null"
>>> +
>>>   PACKAGES = "\
>>>       packagegroup-container \
>>>       packagegroup-lxc \
>>> diff --git a/recipes-core/packagegroups/packagegroup-kubernetes.bb b/recipes-core/packagegroups/packagegroup-kubernetes.bb
>>> index 70dc9713..7e6937b1 100644
>>> --- a/recipes-core/packagegroups/packagegroup-kubernetes.bb
>>> +++ b/recipes-core/packagegroups/packagegroup-kubernetes.bb
>>> @@ -4,6 +4,8 @@ LIC_FILES_CHKSUM ="file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda 
>>> inherit packagegroup +COMPATIBLE_HOST:riscv64 = "null"
>>> +
>>>   # k3s has this restriction
>>>   inherit features_check
>>>   REQUIRED_DISTRO_FEATURES ?= "seccomp"
>>> -- 
>>> 2.25.1
>>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#8267):https://lists.yoctoproject.org/g/meta-virtualization/message/8267
>> Mute This Topic:https://lists.yoctoproject.org/mt/101090972/3616765
>> Group Owner:meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe:https://lists.yoctoproject.org/g/meta-virtualization/leave/6693109/3616765/950573401/xyzzy  [randy.macleod@windriver.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>
> -- 
> # Randy MacLeod
> # Wind River Linux

