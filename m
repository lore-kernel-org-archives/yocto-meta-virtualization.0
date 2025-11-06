Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A811CCFA03
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 13:07:38 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15007.1762434451651296452
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 06 Nov 2025 05:07:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=Lo3EOM1o;
 spf=pass (domain: oss.nxp.com, ip: 52.101.83.19, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KGHW4+YUFlLBnseizauQnt9Gs7SWVAiyx3LWnIIQ8v/TBjilSX8IZH+RqHL9PwYn31iJVl3U3isjz+78LOHuH7z6ailo/WVebZJCzA16ThjvT/gnqfNEts425AAn+yNcMtByt00q47EONN8yNUWKkX2EDhSSfDB1VrTBmjuHpbrPy5/mdJ/OiEgYQ32CcXQoJLKI00mXlgsQb3PhuKd1aJMltjB88BvCjdFQ5uhgo47DtYqwSL8kNi8+ErOdNpdGWiearcGXLdkVRvBM5cc/cx6zivizD/N6OvSKngLU1yY3QTaUpf8hygCEgF0CftgzHrLHgOB/3v15ROHjCWfi3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqKbzUdDyvQyhsccHvZE0bbHI1edgyBj7QjuWxzrZHU=;
 b=tU6gq46OH54rhBUZKrqQ4A6DYuAZroMW1+ZPy/qA1WniY9wNsUnW2fC5MEPUeT/blrNT3Pm50Q7195PVoG4xjZ0t0OLLLpguEJcDqde48sbDazQKUqLUC4jDmZpbwa+dHrcb61JCOPLVdbQCeU16+G/BensG4nXdeGuWGK5cAHuFFMjHilgpnzATpf5YvvQmYbqeWQD+qNaZvzQRtu5cykQ4jBjFtYuI7Uh/Sa9V5Zs8r+xHgRgCp0GsHtb9k+6I8Oqgzfr3ehwL295aeXNDL4D458kzYin4TU8MiPuwmzhlgudc+rw5AK7Cw4INbbwh1dylC23xEJUmXhGiK22h9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iqKbzUdDyvQyhsccHvZE0bbHI1edgyBj7QjuWxzrZHU=;
 b=Lo3EOM1odnxVCTnrs0C4kXLpd1IPNw3scey+uhrZ7nwlmq7hL+Tj0F9gs89R+cx2UsABeLpal6X4Z6WHd/qeb/62tPScG9fAXuBiv1wkwn47i8OHOIVpdbiWO8HboKRkx8weVrO4SXNriMVk/FiYIGvt2w1avcOkoZvD8BWhErFiH8beMtVPCzeaiVBrXksZgsuJpjAyCndri8P2yXJLKdMFzGcU0GGIMJnXQdUveCDy2U8Ef3gEsgVXsSpWSSV8s0czSjTLKy29eJNId+sevbZOoX8o9TVnrxQhRr3Ycwlput0gJoQdAV0OhnbUwNWlGcyjmiJ3+oiJCfEmFzxZVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM0PR04MB6980.eurprd04.prod.outlook.com (2603:10a6:208:17e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Thu, 6 Nov
 2025 13:07:27 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::302e:686:61a4:e237]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::302e:686:61a4:e237%3]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 13:07:27 +0000
Content-Type: multipart/alternative;
 boundary="------------FH7dTdSTUwq846s60wfz2Chb"
Message-ID: <518aeb51-780f-4115-9b31-4ef7d25a3675@oss.nxp.com>
Date: Thu, 6 Nov 2025 07:07:21 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][PATCH] libvirt: Fix missing libvirt-python
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20251105201525.288881-1-tom.hochstein@oss.nxp.com>
 <aQwl4Wli3oqH6ZgV@gmail.com>
Content-Language: en-US
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
In-Reply-To: <aQwl4Wli3oqH6ZgV@gmail.com>
X-ClientProxiedBy: PH8PR22CA0018.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::24) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM0PR04MB6980:EE_
X-MS-Office365-Filtering-Correlation-Id: f1685ff8-ae28-4899-217b-08de1d356f36
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|19092799006|4022899009|1800799024|376014|366016|7053199007|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dnI4V01uSU14ZU9NMUluRUlVQ1Urc3A5L1o2WjRmZ3lkMXVnVTl1NkxZYXVa?=
 =?utf-8?B?anh4Z2tvZUxDLzBOM25zdUY2Y2d1Z2o0NmxBSU42OTZLbHBDVnRaZDZZZC81?=
 =?utf-8?B?c0lmTlQ1V0prVkZkTkF5bEhKcWhtRW9ZcXk5VzRtaThsd2I1a2dheDdxcFVy?=
 =?utf-8?B?WGhCRUZhU08zOE1QcDZYeCtBaGF0Uit5dUpjU1c1dVMwTE5remt4b3RLYmp3?=
 =?utf-8?B?M2MxYWVmY01TV3h0bjNCd2x1M2Q5K1Y2UmJheXVZWktKR2hDSXV6ZFdkQ2dk?=
 =?utf-8?B?WlZudEpTRU5HckpKU1AvaSszaXUrNEZZSFdsUDMyNVp3NWJKSVI2NU1aaDZi?=
 =?utf-8?B?aHZwRDREdSsvMFprWE5Vc0piS2dPb1VWSUhPZ290WlFhU2F3UjYrRWZtc2FI?=
 =?utf-8?B?dHFCYnlHc243SmpvWHZhaDkwTlNQejNQcjVzVFIrWEU4S2VZcHd6TWNFeFVQ?=
 =?utf-8?B?WjUzWkpZQnM5N1QySzlyZ0pKNDdZdSswcDJRd2VOMDRvcjBIMlpjNFJ6a1BQ?=
 =?utf-8?B?QlN2UTByTEY3S3oxVGRLWXRHQkhyOTlsb3lNZmhqai9UUlgvZWFSUUI3UDhG?=
 =?utf-8?B?UnpQUFdHZC96Mnd4MnRMU3c3VzVKVWlkTFFtUlhWVGxXbU1DOElkOThFN3Ry?=
 =?utf-8?B?V3hwRXVzakZLbVFTVXJ4L3hCSEFHc3diTXFTTDB3MXBaSGhoK1RVUjRaU1VW?=
 =?utf-8?B?cjE3ZVhWaGZlRTlSZ0RXR1phMDZHNFc2ci9qYjJrYzBtcTI3dGJvY2Z3MFNv?=
 =?utf-8?B?WU9IK0MzclljWXVkUFVxK0NaK1NBak1pTGFjZVVhYThlTzdsby9qOHdmZ25Y?=
 =?utf-8?B?VEk1bUVXakk4UEZZcEFMWDFUb1Y0UHQyaEMyMHNmemE3RkxJZVRFWGJTakxu?=
 =?utf-8?B?TGllUTBpdjJreWtheWhJYWJTSzh1d1Fid2t0ZkYvckU4RE0wRTFyRGo3ZlUr?=
 =?utf-8?B?S2x2cEswamJEY2EvcTdZbVdYNUpiS2VWYitmRDMvRDVuV1FjUmZVUjBEWE9i?=
 =?utf-8?B?dXhKbUI5dEVYQ3daMHhZdFlWdlpFd0VaaDdxOTJjRW5pTzlsYm9jc25Lendq?=
 =?utf-8?B?Q3JObUJveWpMMmkvNHVrcVlnQzJIb2dMNWQza3JmbE1OQnBMZXV2dFphNDcr?=
 =?utf-8?B?YisvUlVvRmFCa3FyNzhwMXZOc3N5MjhRVEdKYkY2Vi9aeHh2YkVCd0kyWHZp?=
 =?utf-8?B?aUFrei94NUxNbjZVNGJMcEkyeXdFS1l0bVcvWXd3NEd6b2hXV1lqVExjYnBL?=
 =?utf-8?B?ZDhjeFFlSHBXUU9FaGRtaXhQWEpYbEs3Q0g0eFU1ZE4vaktLUWpBVHV5OFJL?=
 =?utf-8?B?TktLTHdCUkUzWFk1QmtHaGhSWlBNQWdQYVBoOHpqWFAzcmJUL1FDL1k5UTR1?=
 =?utf-8?B?Qm5TRXdXT2lIMlBpandkcWN4bUhjdkRjSlNrREdwZFcyK24wQ1ZDYVIvWndS?=
 =?utf-8?B?by9ienpsVmo1ci95ZWFzNENTemQ1d25sZDM0VVRFekpjdXV0NmovdGlxSk5T?=
 =?utf-8?B?azZKUUFkN0p5NS9lMEg3SGYzK0p4MDBiMkc4cFdPNzN4RWtoZ1pWeGozSVUz?=
 =?utf-8?B?USs1Sk9XeDAyRkViNkRBRDZjRC9XeDNPNkJaeXFGTGk0Q01rUEc4OEhzZWRI?=
 =?utf-8?B?aTdHZ3pPZDBJWWFtcWJGelhoVmhLd0pPaWNFUzk0QTJFclcwWDlIdExxWlY3?=
 =?utf-8?B?RmVFQ2ljb1I1Ull6SzlDNlptaDVXTk5VemMzVjJSRTZMUUtOR01ScDlLZWZS?=
 =?utf-8?B?S1ZxanBlTy9zQVlhT3lOVmdoSnNmMHBHWUtaM0ZLVTdDbEVHYjIrS1U5ank1?=
 =?utf-8?B?VjZBTS9tY3oyUjNIbmVMVXhiZ2MxclhNZUJ3UUErOG50RHp6aWhWMnVKbkFH?=
 =?utf-8?B?aGcyVGI1WlJZVHFDcWVKVGtNb29KM092Zm56OGxrRXJ5Y2c9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(4022899009)(1800799024)(376014)(366016)(7053199007)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SXdZckV3NzkzZlM5YmZDR1F5TWNxbmMydjJhWXdkbld5OFVJZURkSWp6SE9P?=
 =?utf-8?B?WFVvcytVelpxTStlUDFhNUU3RjF0VTJldDVtY3RQZHE1aGhvT3RKMkVjZjFu?=
 =?utf-8?B?alBHOTRqNGFnenY5UEN0Vkk5eTFzSEtFVUM1UDVTRTJIOUN2ellmYjQ0M3R3?=
 =?utf-8?B?R2dIeVZmZ1ArM3U5cFJSaXY3WTltRVZ0TDV4UnJMUTI5RmVKNWFnTVozQjM4?=
 =?utf-8?B?VzdmWXhrcXVtdEFqYVMzdjFMdk0vOStPL21IdUhkNzZ1NXdVNUdSV1hzTW5i?=
 =?utf-8?B?Z0xMMzB0KzZoTHZMUTBxYXJsdEFBK2dDUmRoQzF1Vm5mMW50ZFpqVWl3TUow?=
 =?utf-8?B?dDlWVld1TkdjdGRkNzJXU0p5Y3NJbTdHWDNPTEorZURlSDhJTEpDM0sxcEx6?=
 =?utf-8?B?NFRiOXorZzF3OEQ4YWh0ZlpwSFRGbU1jVDZYMTNzRnd2RDlPYkN4dFNEUTly?=
 =?utf-8?B?SE9NK3hVRmpGYm9UK1gzb2plcWp4dGQwR09FSGhhbTdFUnVwNUxuYkZUZmQ4?=
 =?utf-8?B?WEFTSDliakY4YWw0N1FWMm9qY0liak1YZEViVkZraVVFK2dWeXhla1oxcnhI?=
 =?utf-8?B?R2U4Zk85Z2VBRU9QL3lacDJ3ZWNkb0U4YmVuT1htbjNQWTEvUkdLYmh0emJX?=
 =?utf-8?B?emQ5TFp0RjFGbnFQLzd5aG53VEprQ3h5Y3BKbjVaQUtDU2RFdnRSaFluSGwy?=
 =?utf-8?B?RFJYd2E1WG84WlhrRzBxZVoyZFdKR2g4c0lJSlJuT2NyMEJYUmJ3Z0NMTHRi?=
 =?utf-8?B?VFhrd1NzMTg3eUhCbS8rT1k0K3Y0bWl3LzhnOEEySlN6UGR0ZkNoWDllanNV?=
 =?utf-8?B?SzRkczB3VmFEZWFwUVZkUDlSYmpUZlZtRk5yVFZKbW0vcVhCdDg3RFFZUEZQ?=
 =?utf-8?B?dU9VM3ZhaFF6cEFpSmJkTU1ORWkzY29yZkpEVzVPUTluT3J0a2MvZHVrTFIw?=
 =?utf-8?B?akUyVzFIM1lkNzAvWTJLNWRpa0lHSXMzdHlTd29haEdJcnhSWDZiV2JtemUx?=
 =?utf-8?B?ckVDQnhhVk9PcUE3azhVRURSSmxGVlhON2tYUGFLRUR5OWh3VnBnRXR4cTJk?=
 =?utf-8?B?WGxwQS96NEFPMkdaSnVDOE5GdUhKendaNGF4b1VKZFRlN25DK0ZSaURhT21r?=
 =?utf-8?B?NGdUQ2FpRFJQVGg4YklRcTk1N2krdEM3KzZGeUNLeVFURnpDNG5YbWRhTDUx?=
 =?utf-8?B?VFZVU1BTNnRDQTBFNVVhbzBLSlkzWWxVRVRtQUdTdjBWamhNWEFrT2VBeDFK?=
 =?utf-8?B?VFpaS01OeG9IRVdHNGdPV2VBWjZnM3dQZk1Eam1UV0xjWXdRZHJrUG5aa2cv?=
 =?utf-8?B?WXJIZjlEZEMreDE5dE9RTDlhTFR0ODZvMTF1eUhGNWZvQy8ra2w0VWcxc1VT?=
 =?utf-8?B?a01QSHg5U0JaV3R1djFDMnBwKzRIMmFzZWsrb3hXSlJmT2lWZTVHWUZyU0FL?=
 =?utf-8?B?Tk1Ea3ZxNTU0MGVUYm96bTN5Q0tSVXRpeTlqT25JVkNWd05ZZ0pMbXQyOWw2?=
 =?utf-8?B?ODh5TDBsUGN4dGxiRkxyblpMT3RGc1kxdGlNSzFPdEplYk9NWWEyWWpvZnBk?=
 =?utf-8?B?OWNab1pqZlpiOWtkeS9YMnNJaVk2V1k0ZkxTU3oxR25KOHYrcXdBZGppamVY?=
 =?utf-8?B?S1d1M3lIVEhpLys1TTlmWk9RQStEOE1VN1BkaGVJeGdxbjlEd04yamhtdjlK?=
 =?utf-8?B?OUdhV0t1bnFyQVVFRCsvQzNMOUsrZUN1SFZMRHE1VDEzcjhuZkp0T1o5aGFk?=
 =?utf-8?B?anZhOWpweG5NeXRibHNDVFZKNTIwRGM4ZHZhNkxScWl1NW1SRE9JRyt6SWl2?=
 =?utf-8?B?bFhOcGRSeGNNQ3l0Y3dvTnRZVko0Zm04MGxadXdHcEMrdmcyWUdBVmtPZTA0?=
 =?utf-8?B?VmpWcURkMVB3MXFVL1FyOWlqNHk0aExwdHNJUEE5VlkvZXAyc3pSSFFNTDZm?=
 =?utf-8?B?dm1yQm1HTjNmOVpIb0VtSVcwdUNkZGlxZW1uSjZGMGVHb3dQaGI1VElCSlFI?=
 =?utf-8?B?NUZRbXBubE5LdGs4Vmk3R0lGZTJoVHpDVUhGS1NnU0hDWXJ6YnJtcE9Wci9r?=
 =?utf-8?B?bDRZSmRYV25VZ1Jsc0E3MzUzZ2UvMm1uVFQ0ZS9UdndZa3Nyd0ZhZHZ6a1Q2?=
 =?utf-8?B?VkJZMjhib1hBVllCQ2hEd3Jwa0NXRWk3V1N4cWZCcy9NdXAvYXJLUFNiUmpX?=
 =?utf-8?B?Znc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1685ff8-ae28-4899-217b-08de1d356f36
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 13:07:27.3088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2StMN4AUtDmLnCiZ1CXH+xC5KEJCKCmPD1GQB0c7HRijpLm+5yV7tr1QZOniodpGEb5tO1XOCM3FOo8bygk5Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6980
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 06 Nov 2025 13:07:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9428

--------------FH7dTdSTUwq846s60wfz2Chb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/5/2025 10:36 PM, Bruce Ashfield wrote:
> In message: [meta-virtualization][PATCH] libvirt: Fix missing libvirt-python
> on 05/11/2025 Tom Hochstein via lists.yoctoproject.org wrote:
>
>> @@ -46,8 +46,8 @@ do_compile:append() {
>>                # the syroot staged pkgconfig entries. So we clear the sysroot
>>                # for just this portion.
>>                export PKG_CONFIG_SYSROOT_DIR=
>> -             cd ${UNPACKDIR}/${BP}/${BPN}-python-${LIBVIRT_VERSION} && \
>> -               ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py build
>> +             cd ${UNPACKDIR}/${BP}/${LIBVIRT_PYTHON_ARCHIVE_NAME}
>> +             ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py build
> If the cd in it's own command fails, so should have the one in
> the &&
>
> If one is failing and the other isn't when the directory doesn't
> exist, something strange is up with set -e in the routines, or
> am I not seeing something that change more than the new variable
> and the removal of the && ?
>
> Bruce

The cd with the && does fail, and it prevents the command on the 
right-hand-side. The problem is the && causes the same behavior as when 
using if, which is to assume that the logic is aware of the failure 
possibility and does not need the engine to perform the automatic 
exit-on-error. The script continues to the end, finds no other failure, 
and returns good status.

Tom

>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#9426):https://lists.yoctoproject.org/g/meta-virtualization/message/9426
>> Mute This Topic:https://lists.yoctoproject.org/mt/116141416/1050810
>> Group Owner:meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe:https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
--------------FH7dTdSTUwq846s60wfz2Chb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/5/2025 10:36 PM, Bruce Ashfield
      wrote:<span style="white-space: pre-wrap">
</span></div>
    <blockquote type="cite" cite="mid:aQwl4Wli3oqH6ZgV@gmail.com">
      <pre wrap="" class="moz-quote-pre">In message: [meta-virtualization][PATCH] libvirt: Fix missing libvirt-python
on 05/11/2025 Tom Hochstein via lists.yoctoproject.org wrote:

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -46,8 +46,8 @@ do_compile:append() {
              # the syroot staged pkgconfig entries. So we clear the sysroot
              # for just this portion.
              export PKG_CONFIG_SYSROOT_DIR=
-             cd ${UNPACKDIR}/${BP}/${BPN}-python-${LIBVIRT_VERSION} &amp;&amp; \
-               ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py build
+             cd ${UNPACKDIR}/${BP}/${LIBVIRT_PYTHON_ARCHIVE_NAME}
+             ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py build
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
If the cd in it's own command fails, so should have the one in
the &amp;&amp;

If one is failing and the other isn't when the directory doesn't
exist, something strange is up with set -e in the routines, or
am I not seeing something that change more than the new variable
and the removal of the &amp;&amp; ?

Bruce
</pre>
    </blockquote>
    <p>The cd with the &amp;&amp; does fail, and it prevents the command
      on the right-hand-side. The problem is the &amp;&amp; causes the
      same behavior as when using if, which is to assume that the logic
      is aware of the failure possibility and does not need the engine
      to perform the automatic exit-on-error. The script continues to
      the end, finds no other failure, and returns good status.&nbsp;</p>
    <p>Tom</p>
    <blockquote type="cite" cite="mid:aQwl4Wli3oqH6ZgV@gmail.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#9426): <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/message/9426">https://lists.yoctoproject.org/g/meta-virtualization/message/9426</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/mt/116141416/1050810">https://lists.yoctoproject.org/mt/116141416/1050810</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:meta-virtualization+owner@lists.yoctoproject.org">meta-virtualization+owner@lists.yoctoproject.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/unsub">https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------FH7dTdSTUwq846s60wfz2Chb--

