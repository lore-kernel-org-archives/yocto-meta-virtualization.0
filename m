Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD55FCE7D1C
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 20:30:52 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.40])
 by mx.groups.io with SMTP id smtpd.web10.92226.1727814646499865267
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Oct 2024 13:30:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=sV6Deqhi;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.92.40, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DclHh6j6F2kwziBHevgEL/NoaBS/wycH1a4sINAnRQEWM9Og43naAW6DMEdZ2Ft3MZnHFLB3FUotc/HMCSFXKt8jWIrDoRQykj/LyJZXbdY5FQ1+RDjEXVHi1lcibYW9bdn9tji/VSgK2MOJH+0u50LtLkDPcvxj7vdEYH7ErwcvfUq0I4ssGGDnpzCK5QLuBxBAyKsRcZ8KRqo8kyADn4bjbsL15bLM63a8BApPEv1hTO2IgrJbtOuHvBC8l1BtEewiczJwF+qZTKJd8/whzWjeDhDHUQMV6Q3v+H4+8ixC+Bc6hGxGn9NDp+aiGgMf05OSFYOLgehf4/syH9/uTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jcED3AO7YYtijXAqzvEyVBaxozt2flSWbjSugcU/rKM=;
 b=kn2QiZ5fv8x74sdvRPdqmh69Rk+lFr68EVlSy9kTcCnJvOXrMO/G9yROiGzgIE35KKEjxYdIoDwaH0n/eJ65Ywi07mRPlky+8zci2BH/L/Vc7ONT3hNjP7/YVZ2yNm+K8I1gnL5tuyMcl5iVnC2uNFlnmQ1Oi6kP4VL53gETFHxDG6AV6cFNcMpDe7g5nbnwAEjZ2Ppx4YNUaV3WYrRZ591TgiIIlq2KczPvd0fB3QvKu3ARVdWp2bUi7A72eiDkF7gUxa1VKQ0QlgJGSSgV/xyyH7L8qTSyX1Z35iDdQM945EHB/FOyfKvxicj2Mo/edmSMdaUr1Yu/BaGcPBV3pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jcED3AO7YYtijXAqzvEyVBaxozt2flSWbjSugcU/rKM=;
 b=sV6DeqhizofuqF6uic0P6cK1LVk8tPOoRZcvTzO29g40uRmSF0eFekyIJhaTgRdkd5s++DGVxcgJI9tbCuTWBqNKaSYQaS7C1aERQYVrHtjY7KCglcNYXw41uFDAasrv27+gsh4+uF0FYiVxfO7X0s8Dy2niKvMOumESpsSpQnI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by IA1PR12MB8079.namprd12.prod.outlook.com (2603:10b6:208:3fb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Tue, 1 Oct
 2024 20:30:43 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76%4]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 20:30:43 +0000
Message-ID: <eacbe5f9-c12d-48fa-a6e4-acdfd2bba35a@amd.com>
Date: Tue, 1 Oct 2024 14:30:41 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][master][scathgap][PATCH] device-tree:
 Rename EXTRA_OVERLAYS to EXTRA_DT_INCLUDE_FILES
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: meta-virtualization@lists.yoctoproject.org
References: <20240928000622.586832-1-sandeep.gundlupet-raju@amd.com>
 <ZvrxRiQoiRmJCVmx@gmail.com> <969828a4-706a-4377-9de6-8c2d7d3b7297@amd.com>
 <CADkTA4OFw6g6AivmyweQ_1vhkUvDZuPXDEyeWQ+30iKazf+6rA@mail.gmail.com>
Content-Language: en-US
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <CADkTA4OFw6g6AivmyweQ_1vhkUvDZuPXDEyeWQ+30iKazf+6rA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: CH2PR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:610:52::30) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|IA1PR12MB8079:EE_
X-MS-Office365-Filtering-Correlation-Id: ab0abebe-f66a-4233-a5dd-08dce257ec5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?k8hTkCaeymViU9zykzR3Ck7nLifTjEGGoln3ML6+jAk2Dy1ZVWK9ln62f46g?=
 =?us-ascii?Q?kGiqWdRMmliexMwMndWghGXLN7QFN8O3jHSBwQNPs0//W3KXAh3OMDkfnEQ1?=
 =?us-ascii?Q?BDH0ibBIt9wRCp9pUjvQuUJ8QZUX3t4+veUGClcuOLL1TfLYR8Roo3WRzfjD?=
 =?us-ascii?Q?Qx5ZlJnmqq8BEvRbd2DG53ZmjBY3izZDPNIacoU/S0J3shFVZtJUJo3HYvzm?=
 =?us-ascii?Q?Jyo/F5XCYQ0qTmXmuHieKLKHOvrcnM6ucs+2yDMRyTbwUJMDU+mUCrTrpB1x?=
 =?us-ascii?Q?cJR61tm96X4rurZoavDRS+1V38ycyYOTuw70AakkHTA7/5P8nUgZVRABHqS4?=
 =?us-ascii?Q?VHXhDjcNYr9uayG+YVgeHvDBWoogbO7uiONSccE42zAkw9zx3AEwVjB3jaEH?=
 =?us-ascii?Q?ZxU7w7dSgLY+J+3eXx3t7YQPR9eil3nxNWPPPaCR9hBOJhd885LJSv08Vave?=
 =?us-ascii?Q?jMw5/R3dcdqiKKrRFeyik8yq64KpaqRi0p2a5+pwm+P9kW+wjCx2XFyiTkba?=
 =?us-ascii?Q?iWSUP4v2VwlRUY8mBII4RocZ9Ms5XwUxLKhVBtArqkVRoABJvwDAS1yMg1hJ?=
 =?us-ascii?Q?UPHb5jE+OmGdfeWWsrvVn2lYy1orgwPr86oJzqDffaxgaqh6JxSu9vfYBdsn?=
 =?us-ascii?Q?V8dBoAwWMbqBa0Gq9P9d6GbC4M2iy75VuOJTgYlEaG3u53Je7kTy+0VwC009?=
 =?us-ascii?Q?Xg81kF+SDbnJHV01aMUAz9fGyr9HC0OdVjMdGJvrpQstmncfJaTSs0xhKyZk?=
 =?us-ascii?Q?m1m1Gcv619HOGfbQDM3Xso3IPAwaiFLnxzslt6T06mtnxK7t43DyrhF6vn8q?=
 =?us-ascii?Q?IBYsB8Lhqkobd1V2qG0M3Oprm9TShjPKGbd4vA2iBZivEd5QQit85iAuZlF+?=
 =?us-ascii?Q?TZ3kNsNYSyRc+Vd6ZKMhoxMeA3tMDXbw/GT8VpRbYzIW1KUp7C82cZUdmWsx?=
 =?us-ascii?Q?Z5JcaR7LOSHHov2ixiLwGYVlJt5wzWjfXor9yI5m1ZhvBg7vasFp+/q+m4h8?=
 =?us-ascii?Q?S1bKS7YGTrShcYQ5bASiYvAZACMHBYpI5WfzBLyDEJl4GniKZeQw7397ivQg?=
 =?us-ascii?Q?/TbC2vcfktbo15vjvTaXgLgmk5+If9ZtKv41Ljdxnb5wVMtE51UyMnuELJ0j?=
 =?us-ascii?Q?H9LacxVk0x96jskAZpaJa+BBrTUBixOw6lcmu0aoomX7h6l38ICRO6BP+BlC?=
 =?us-ascii?Q?9hHFQ2486VPjY9G04JxldT/CQRkNtbNf9H0ZLWoxTq2cOvlS4x/6WIe4d/s?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lpT02qz1ABrxqYQeHwq7/RCt5g9aLx0hams8ixxYjA5JWXOIp0XcpqirhuuJ?=
 =?us-ascii?Q?btlAweHI5GPt5YBBxfcambr+nIEbzqKjp2nOoHa5vFtVrDmm0pWci6stHMDj?=
 =?us-ascii?Q?VcHuNUZ9jPc+PV2reGG8UhZ2X9iIamojxNoZ2A8iogECm1fiLwDqpimJXYYl?=
 =?us-ascii?Q?Vmtf09LZu6XUDsIal7JgaSnjgB30/hJQIjkQmyEYicLT+EjTP60O/47b49cF?=
 =?us-ascii?Q?YDTW/VJGngdZKjn/Evb382e6BcMBFJVLFfi6NUgtvQEtONrQzUZdhC/Nxx3p?=
 =?us-ascii?Q?Zc2A5Ux88+SURMhlNlmZMuAE+QfSUwml1zvzmVzdX2JoMz7VPBxJfAqtBOdR?=
 =?us-ascii?Q?4cVPaJa23jdQrBtLEalDXKyG8btMi52WHwlWGkjktsttEf+qQrvn5/ItoUID?=
 =?us-ascii?Q?gi1VP7GDk0xePHIx+eLIjy/mnrF1CE1G34oOBHkpr3+Z94TGsXhuiXpv+eRj?=
 =?us-ascii?Q?Ax3W0BNmWgDwouA2MzQVfgvojQ/Txvq8hvLCiTy0/FDtsOOSGZFIFM494YJ1?=
 =?us-ascii?Q?7o0NygfddaQpjN4rUciQYVVTCjyo1iPC1awxe8Nu1LYa77UQb7bBoxKJKUxF?=
 =?us-ascii?Q?65ao31PduSQTAg05OVd5BwUr10lhE6UFlv12gn517JfyRXr4YXlnrLPqbKZw?=
 =?us-ascii?Q?75rhdoLz+udvjGiL/uAXxuEm94jtizNa9sY4zRKdlQStzWvKlbP1UN1XPfyY?=
 =?us-ascii?Q?dN65AwYatAZGf7teuOEPK48/TDGvblmEh55ND2PZUpMTBDIqe02yp7SmoNAq?=
 =?us-ascii?Q?VfAk3MSYjiJN01aBUBvij6BhTMfMv9y+C1DI6cGUaCo3Ulu0AqUBNJJzw2Hi?=
 =?us-ascii?Q?qTiBDFb54rZWVp0gRAEBZ3gdBdBVtRz4nc0rCg6Vr/BibV7I91aNcLFms/0i?=
 =?us-ascii?Q?SrBT9yhWh2Hjyl0kecIH96wix9W9PhsHhbDvzrj0jHmgWXaBapcz4OEq6ta9?=
 =?us-ascii?Q?MDh9vc/JzQPqeo6XbhpVxqN4sb4foKMxhmeFGmQCw8CjqD2ihVidU97HUQ/H?=
 =?us-ascii?Q?l0J02qoMkYDqlVHz4gCbCBFI/Cpubr7DYn5qePnHP1A9QB9Pedj6eeuRhi3D?=
 =?us-ascii?Q?oNRM1JzCu93AIC8HPTqUH/Tx3DFrY8ocUeHeweMh4VN8fiIHfzcD+AFPTRi+?=
 =?us-ascii?Q?5JYFFGJUGig0frb+RH+k12ATNETsO1dieBYA8MHuvj+McxNQC2+5h4AYXpaf?=
 =?us-ascii?Q?+bWNQMiVvLZAzjnFf5/pOFkb4p4VfV5bFDIfvi61ftYh30njwPIpRPo0NzAi?=
 =?us-ascii?Q?6FT00gSCu6RUL0hZfH9vY6BrbynyFRLU9PNnJ8YkbXn5bN811+Sb/3KSbkjZ?=
 =?us-ascii?Q?UY5C+dDnyEZdvQe9fo0mqj5/Rwxip1YRePQqbWo9M9futwEbiX7MhC+O7X7s?=
 =?us-ascii?Q?L85iSOBkSyZYLgAqtqa/xI6wSpWBmkdbn5k0v+YV+1S+QYME4hdHb2DvdKr0?=
 =?us-ascii?Q?l6UO7S8Fnp5wJu9JkTKBjHvb3rbc6SReOQpQp+4FvgusKuE+BGau6nUMczhW?=
 =?us-ascii?Q?qWTTZ3X2gnY5AJiaURRgEb87QfN4zIQH9A4QqpjI1y6mB78ldHqCwlRvsuEF?=
 =?us-ascii?Q?ku+UHomemjcqMIS3zTiv5f4UY23VPPNaWKVgUDaD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab0abebe-f66a-4233-a5dd-08dce257ec5d
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 20:30:43.6236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JNok1F3lRA/rxN/bdooAydFN1Ste1UNZ9g5JaumpiSytesKm+4hUsWkuDfYiEyNGFegkrie/eTlVariZ3+bcpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8079
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Oct 2024 20:30:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8907


On 10/1/2024 2:29 PM, Bruce Ashfield wrote:
> On Tue, Oct 1, 2024 at 3:45=E2=80=AFPM Sandeep Gundlupet Raju via
> lists.yoctoproject.org
> <sandeep.gundlupet-raju=3Damd.com@lists.yoctoproject.org> wrote:
>>
>> On 9/30/2024 12:43 PM, Bruce Ashfield via lists.yoctoproject.org wrote:
>>> In message: [meta-virtualization][master][scathgap][PATCH] device-tree:=
 Rename EXTRA_OVERLAYS to EXTRA_DT_INCLUDE_FILES
>>> on 27/09/2024 Sandeep Gundlupet Raju wrote:
>>>
>>>> Rename EXTRA_OVERLAYS to EXTRA_DT_INCLUDE_FILES as these variables
>>>> are renamed in device-tree recipe.
>>> Which device tree recipe is that ? We should include a link to that
>>> base recipe in this commit, so that others will know which one we
>>> are tracking.
>>>
>>> I checked meta-virt and OE-core and didn't see any variable renames.
>> [Sandeep]: device-tree recipe is in meta-xilinx
>> https://github.com/Xilinx/meta-xilinx/blob/master/meta-xilinx-core/recip=
es-bsp/device-tree/device-tree.bb
> Sure, but my point is that needs to be explained in the commit
> message, and be resent as a v2 of the patch.
Yes I will send a v2 patch.
>
> Bruce
>
>>> Other than that, no concerns with this patch.
>>>
>>> Bruce
>>>
>>>> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
>>>> ---
>>>>    .../device-tree/device-tree.bbappend          | 20 +++++++++-------=
---
>>>>    1 file changed, 10 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree=
.bbappend b/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbapp=
end
>>>> index e235826..813c08f 100644
>>>> --- a/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbappe=
nd
>>>> +++ b/dynamic-layers/xilinx/recipes-bsp/device-tree/device-tree.bbappe=
nd
>>>> @@ -3,17 +3,17 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
>>>>    ENABLE_XEN_DTSI ?=3D ""
>>>>    ENABLE_XEN_QEMU_DTSI ?=3D ""
>>>>
>>>> -XEN_EXTRA_OVERLAYS =3D ""
>>>> -XEN_EXTRA_QEMU_OVERLAYS =3D ""
>>>> +XEN_EXTRA_DT_INCLUDE_FILES =3D ""
>>>> +XEN_EXTRA_QEMU_DT_INCLUDE_FILES =3D ""
>>>>
>>>> -XEN_EXTRA_OVERLAYS:zynqmp =3D "zynqmp-xen.dtsi"
>>>> -XEN_EXTRA_QEMU_OVERLAYS:zynqmp =3D "zynqmp-xen.dtsi zynqmp-xen-qemu.d=
tsi"
>>>> +XEN_EXTRA_DT_INCLUDE_FILES:zynqmp =3D "zynqmp-xen.dtsi"
>>>> +XEN_EXTRA_QEMU_DT_INCLUDE_FILES:zynqmp =3D "zynqmp-xen.dtsi zynqmp-xe=
n-qemu.dtsi"
>>>>
>>>> -XEN_EXTRA_OVERLAYS:versal =3D "versal-xen.dtsi"
>>>> -XEN_EXTRA_QEMU_OVERLAYS:versal =3D "versal-xen.dtsi versal-xen-qemu.d=
tsi"
>>>> +XEN_EXTRA_DT_INCLUDE_FILES:versal =3D "versal-xen.dtsi"
>>>> +XEN_EXTRA_QEMU_DT_INCLUDE_FILES:versal =3D "versal-xen.dtsi versal-xe=
n-qemu.dtsi"
>>>>
>>>> -XEN_EXTRA_OVERLAYS:versal-net =3D "versal-net-xen.dtsi"
>>>> -XEN_EXTRA_QEMU_OVERLAYS:versal-net =3D "versal-net-xen.dtsi versal-ne=
t-xen-qemu.dtsi"
>>>> +XEN_EXTRA_DT_INCLUDE_FILES:versal-net =3D "versal-net-xen.dtsi"
>>>> +XEN_EXTRA_QEMU_DT_INCLUDE_FILES:versal-net =3D "versal-net-xen.dtsi v=
ersal-net-xen-qemu.dtsi"
>>>>
>>>> -EXTRA_OVERLAYS:append =3D "${@' ${XEN_EXTRA_OVERLAYS}' if d.getVar('E=
NABLE_XEN_DTSI') =3D=3D '1' else ''}"
>>>> -EXTRA_OVERLAYS:append =3D "${@' ${XEN_EXTRA_QEMU_OVERLAYS}' if d.getV=
ar('ENABLE_XEN_QEMU_DTSI') =3D=3D '1' else ''}"
>>>> +EXTRA_DT_INCLUDE_FILES:append =3D "${@' ${XEN_EXTRA_DT_INCLUDE_FILES}=
' if d.getVar('ENABLE_XEN_DTSI') =3D=3D '1' else ''}"
>>>> +EXTRA_DT_INCLUDE_FILES:append =3D "${@' ${XEN_EXTRA_QEMU_DT_INCLUDE_F=
ILES}' if d.getVar('ENABLE_XEN_QEMU_DTSI') =3D=3D '1' else ''}"
>>>> --
>>>> 2.34.1
>>>>
>>>>
>>>>
>>>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#8905): https://lists.yoctoproject.org/g/meta-virtual=
ization/message/8905
>> Mute This Topic: https://lists.yoctoproject.org/mt/108696924/1050810
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub =
[bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>

