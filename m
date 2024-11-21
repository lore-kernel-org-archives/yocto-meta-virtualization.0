Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA599D743FD
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 17:44:29 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.43])
 by mx.groups.io with SMTP id smtpd.web11.4737.1732211060377021959
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 09:44:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amd.com header.s=selector1 header.b=05YQrBYK;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.220.43, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ijLMb8wFHxjs+EEhMIkf0IE1LNtNbRiSDHqswhR32KXxgkSgott214J7SWwZJSvCz0JToMTt/2aH3bANYxpBGWfxDtDHCLyG45Zz0ePX2XVD+AVpYGh3NNpavh5xMV/2nIAMXridteXLMH5gWBRxTTILB8hA2E9ZURcfx1guc+y037TVxb0TvHABKir7KhVX+sfy99JlSjdZ/1Us66IIpDAaatqtCm1QldcK8CbgpJf98IJSbvXtqsBqA911evrABC2V0cuzpx96QeJ6ClFAsFyAvjZ7zx3j6mIrdhTuCuqYDqCITtUBBlokFJ8EzgHYqY69WGySI9XK6zvT/BlnYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XEndyEEdDrkmqGAT5pkSbp3B5cEAz2945BZ1+7ZCwl8=;
 b=WBXfyWKb6m8D98loi7/Z4kX+GLB2WR89WbDOvfFsAdmqDhxehAHJvlCoN4OdEKUH2TVJhhyrrD+noCttLrtJBHk9l9If2c6ZIPf5SF45ocv0ZbzRiYHTmaZPrYJpCCbH1NSKUFXUJ74LFVXT2bZ3PXhSwKS3NEfR6rCNkhITVAszSEo+6S2Nm2CfNvutWo1uINU5j3E/Czko1RQg18k4Dg9aShspgJLE16G455yP0kULFC7Pt+bk+zYa6esv5uYGaIOo58fNCOSvK2hHiMVYIiehi4ubtrrYLYCCVih3qmAcFRLLkYf/Wm3T4yaVmF3ddivYh6pzOpq3CkfpoYiGyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XEndyEEdDrkmqGAT5pkSbp3B5cEAz2945BZ1+7ZCwl8=;
 b=05YQrBYK6AcPJqkhiYnrteMF1UBv2M7jtdUa7WQsiDMtYl1eFEzXjJzk3xbKxuA78/heBPxINbQJFnC1lU/cD2/y0JexjfEcEPniNPkLsXClBOC9P0T+EAolkewk/ztgUXDswm/eQr36KIPjuYteDkWS4zmHbptf+BOLB2afSHg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by DS0PR12MB8343.namprd12.prod.outlook.com (2603:10b6:8:fd::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.23; Thu, 21 Nov 2024 17:44:16 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76%5]) with mapi id 15.20.8182.014; Thu, 21 Nov 2024
 17:44:16 +0000
Content-Type: multipart/alternative;
 boundary="------------3nDu3oGFSp9cAevMWTondOWN"
Message-ID: <ed246c68-de62-447c-a75b-1ab5a6c52413@amd.com>
Date: Thu, 21 Nov 2024 10:44:14 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][master][scarthgap][styhead][PATCH 4/6]
 u-boot-xlnx-scr: Include xen-boot-env if BOOTMODE is xen
To: bruce.ashfield@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
References: <20241119051203.3841577-1-sandeep.gundlupet-raju@amd.com>
 <20241119051203.3841577-5-sandeep.gundlupet-raju@amd.com>
 <Zz66Tw7AuYZ5eTpC@gmail.com> <3a52f570-ec67-40f3-aa13-7be24ba2b229@amd.com>
 <CADkTA4O22sge3xC__qvd_e0=0c3XtR0mktAaiJUTXB6EgL3DNQ@mail.gmail.com>
Content-Language: en-US
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <CADkTA4O22sge3xC__qvd_e0=0c3XtR0mktAaiJUTXB6EgL3DNQ@mail.gmail.com>
X-ClientProxiedBy: CH2PR07CA0043.namprd07.prod.outlook.com
 (2603:10b6:610:5b::17) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|DS0PR12MB8343:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c170d3e-2d6e-4b1f-71d6-08dd0a541eca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MEwzcHpXWXBScDMvNGRHc0RYbEdHWkZZd3JndE12QjJxQVV0OTVFbkczVmI0?=
 =?utf-8?B?Mm1qbG9CMmhRQ0ZkOUxGTGlEWnhsS0M4WUJSSEZNQkNwYUI1cGlZcklOMHVI?=
 =?utf-8?B?S0VycFBNSFl2UzVrUzhhcWZRNVg2QStIMW4zZUhHblRUMFFJMHJ6YjE0RnJL?=
 =?utf-8?B?MjFtcjJQbVhnWFVraWFEWFJ6NldrQXplT01lN0s2bDVUQUlOandYR2pWZ3dC?=
 =?utf-8?B?NFUxRFBiMWdJcDFiNUpseXhUamFlM3RRZ2pNSndTTHVROHBsL285SHVTbzN2?=
 =?utf-8?B?OTg5RVFQdGN1dnRKcGk1SmkvQ0poYmgrekNDTHNaZkF4bmhZRjhXMTVPTzVn?=
 =?utf-8?B?dTZTcnh3Q3I5RThZN292dktnTTFybE1meko1dUlqQmhCSTZUVFpnNjI3NHZ1?=
 =?utf-8?B?NGJSWmdyS2NlZmFoZFo0VlRvMlFuVjRidG1vTGMwajJUSjFpNHhNZ0FHdkpK?=
 =?utf-8?B?dUNMMzlCMDAvYTMxclJqL1pWbkFuRWRESkFnVFAvZWZGamxCOSthNkdiQ215?=
 =?utf-8?B?TEx5V2QyZktrNFEySEFQZW13VUQ2ZUcvaEtIY0xFMWFudkEvazlOb04zQW9H?=
 =?utf-8?B?RmVRckgrR21TRS9TQVQ1NlQ0Z1B5RUh2NlVlRWZhcnhsNG5hUklYTGEwOUZJ?=
 =?utf-8?B?N1VrOVdZR0F1TlJKRTJpTExkVFo0di9EUHN0TzRDRCtXSWVmVGVqNkgrdVRH?=
 =?utf-8?B?SXhTc0YrbnVuOGF0VnpNdy9PL3ZVK2FQOUFzZW1ZS2RXR2UyTkZYZzhqSHdC?=
 =?utf-8?B?MUFTL0JVcWd6aUJqcW1nTVREcTVNN2c1YVRzMlArdE5Ic1lHSjYyR0IwWDZr?=
 =?utf-8?B?ODlzNUNGaFlMUStXVm95WVZ0RkhGb0wxaUlQOTdoTkFGdm5IbFFmTjlDQ2tG?=
 =?utf-8?B?MHAxL3dnWDBoMzlFVE5UME9YZ3F3eXZyMVBHUW1qd09xbERPK3Fvd3RaU3Y3?=
 =?utf-8?B?N2svVmIrMzFBa1FOV1U2VjJwT05TZGVKUnJ4VVkwdEY5UWhEU3lFNmd6ZWR3?=
 =?utf-8?B?OXkzd005azMzMWtBQmU1S0R6S2tMMGcrdERBM3NGbHJkWXp4SWhqbzZmVVov?=
 =?utf-8?B?TXNiWjdaUExjRlRhMXF3WWM3dXZ0Umw1RUpIaXZKUEE0TG9OK05BUzhQR0FO?=
 =?utf-8?B?dm05R2tjcmpyWlpFVitrc3BrV2RXTFl6UllFeFlRMnNJK2d2N2hoWitUdkV2?=
 =?utf-8?B?RVJ0MllIZ3JuZXhtdkNwczlEbHRiZVhBa09aVXpJQW1nbndLcEhveTRlYU5k?=
 =?utf-8?B?NEtDTTF1dzhwNWNKVERRSW4ydEhGUEthS2d5SXMrZFpPRUgxUGJmTFhFTDJB?=
 =?utf-8?B?VFZTRHZWL0xpTU5tMEkydGp2Z3IvenpwbWJ2SWVzaFMxQWUyUTA1eGk4aFdh?=
 =?utf-8?B?SWdDdzBQSWFFRmszWDlqV05BQ2UrUS96WVhtK0ltSW9kK0N5SWRSUXB6bVVi?=
 =?utf-8?B?U29GOHFaUkZkSHBJSFljRXdhSk4vRUhUMmpNVnFKUGhpMFV5ZFZqWTZzRUNh?=
 =?utf-8?B?OFhzTDNwb0d0UDdQTjVia0FyZVpOcE5jKzFkQzIxNFB3Ylg1ck51c25DRlZC?=
 =?utf-8?B?Uk5VR3p3NkVvRzdwbTVHY1NieDVxS1VOZ2FKZUNJZlo3ditYMEd4Zm1iL3d0?=
 =?utf-8?B?bkY4aENPM3lqZ0FsL2tpMFRaMkl1VFRmdk41akNQZGdpQjZNdkJrUlZrQW9r?=
 =?utf-8?B?NU5Bek5KQzh5Wjg1dGJ6a09QY09RMVQ4R0U2R1pyLzhzNHFhYWxuMW5nPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VDVlZ2NqQkd6ZzIwVzRXU1BmcldHb1RYKy8vSUNtT2pXa2FLSjlhTjhlNDR1?=
 =?utf-8?B?dFpsekljYkRUTnRKQmgvUmVxS0VwUW4xdmsvVGMrYXhJWlowaGlnYjd0bDZJ?=
 =?utf-8?B?YUNGQzBmOHE4cGtwNnRuUGhJTE51Sm9xWDdrQjlhR2hwdXNpNUoydmJXTm1l?=
 =?utf-8?B?L2NXSnRZazcrZjNYc0l3dEh6dEI1dFRKUkdadVN4bDRkZDZvam5nVi9iQTZS?=
 =?utf-8?B?ZDlVQVo5ZFdDV0tOUzR3dVZzc2xrN2xlWGdQRlFudjdWVit5NWF5cWlmT3VG?=
 =?utf-8?B?ZVVPTUt3Uit2Q3lKYjFIanRha29xMlJrMU14c0g1N1BhYjRUTUE3dkpmaDUz?=
 =?utf-8?B?RDZXZjlKS3V2ZkdLOENxUUNkRnFNU25oQnNaaHJCMjBrY2JpMEZrajY5b3M4?=
 =?utf-8?B?ZGt2VS95M3JJTzdTVU9CVHFKWjBtWVllZXMzd0tKZXFJWm14S01aT0p4TGZo?=
 =?utf-8?B?Ly9vRXBoci9RYStsazVDanNvV3dPWUM5bENJMHRSdHp4amRUanVWQTUyZDRN?=
 =?utf-8?B?Tlg0enllM2U5cEdoK1dYTUlwUHAza3E4TzhqYndkeU90dUZmMXZzTzJIWk1n?=
 =?utf-8?B?emJ6OVU2cmlPTDFLMUxKL1Y4Tytjc2ZRUVcvMndaOHliNE1YMEdQR3F0VjhN?=
 =?utf-8?B?eXZNWFZVY01kSTZjT0U0cDhqTlJ1S1ljb2FsOXluS3oxbXQwMEpScnZuU1pj?=
 =?utf-8?B?ZE5BdkhiZk1pS2JqR1E5SG5nQ1VibzkxcEVtTWRWMzZGK0tzRnlsUmxNTE5K?=
 =?utf-8?B?UUxKL3pFMkFhbU9RdXA3cHhMR2dVQjFhSDFpY3pRUStJdndUbDlNR0tGekZI?=
 =?utf-8?B?dGFpYzZGWk5OQndQTnlUY2lTNEFhd014QmlGZE5DMFVXKzZsbFpxS0c4bExp?=
 =?utf-8?B?bXNYUmpFUVBNU1lVaEFVb2pHaXgvWm5ZTmtZZy9VYmY0bEEyZ2g5Wng4Z2NK?=
 =?utf-8?B?bnM5ekJaYjlXN25La25oQm1SOVc4aGxUSFgzempmbmduRkR5MVUzdVR6UFpY?=
 =?utf-8?B?M0ZjN0U1b0RjUGI2dEw5ajVqUC9IYldMdml1K0gzcUEvQTNLQUJ2TU5UNXF5?=
 =?utf-8?B?Q25YUXo0VUp1STNUVXE2TEZiVGN2THZjbjlyYmRsVDl5Z2ZKSXJLYVN1R2tw?=
 =?utf-8?B?Q0h2VzBnT0ZFZ2ZQajJpZC9IMTFhQU53VVorNjFXTXk3YUlQU3NIeWJ5a1dq?=
 =?utf-8?B?NkNkZnQ4STVnVUVlQWdvVU9ueEhlY0RDOXM2dGRiQUhQMWIxaU1jaGdZTHFs?=
 =?utf-8?B?SWd1RjdaY2Z0M3F5OFFYMWJMQWpJQzhkb0pPem1SWUZDUWZLenNoREpWOGs0?=
 =?utf-8?B?VHpQUSs4UXdRK1RKSkRyaEhMeHhLSStaNUJFNkUyM0IrdEozbHNEcllKNGJZ?=
 =?utf-8?B?Tk1wUVo5Z1kza0ZiSFNnNUgxWUM2bnhMQ0xuMHFTZHc2c3NlV3c0VkV4YWF2?=
 =?utf-8?B?NndTT25tV0dja3BxM3VxbmJtVWVxL0NhcVR2OFZXREh5QWM3dWRVL0krMm12?=
 =?utf-8?B?SnIxa01mUyswTkVGb3RvVUdKdllJSWVaRTlpOVNUV3RUVUxUaXBwdzF2WVp0?=
 =?utf-8?B?ZC9tY1QweWpuM1QvUHhGRXUvV241ai9rOUpWbEZoMS9qSVdPZmVFM080UEYv?=
 =?utf-8?B?ZmM2bmhnY3E2a2RHVXJVT1dxUEF4ZThJTmlVWVhLbk12ZVBKWHZDZzhVem5S?=
 =?utf-8?B?NVl6UmRjNmFwWGpoREdscjdtVVNUSjFVajFtQnhiV0xzM3JrRjBNSldFL1I5?=
 =?utf-8?B?OG5wbTU0bjJVYXZTM2lsZ21odUJFcGJ3ckdaeXpkSjd5Z0tzd3pJOVRLY3Q5?=
 =?utf-8?B?SGxuWEowUGo3N0tqdmpEL1hFenFac3YxeHA5T0FVbjVIMWkvd3p1eG4zb3Y0?=
 =?utf-8?B?NXBZdzgwUU1SUkhrcGhjeVE5elF1QWZrVURjSmFDOHhraVNiaytYWElpc0kw?=
 =?utf-8?B?RnhkUWY1TWoza25QUVpJU016dXRZbFpqaS9oS2U5ckxlUHVpSXpGQkh0bXMw?=
 =?utf-8?B?MmZSVnFQbUFJRHFZZ0pkQ3RCOFNLMlJ2b0xKaWFoWHdURWN2K0lJd0YyZXA2?=
 =?utf-8?B?L09uUzhMTy9leEdWZUorZGxPc3ZQeTVtMVZ1NU44VGtGemZpeVdhcUU2TkVx?=
 =?utf-8?Q?YMnC8L4X+4s3yuCIxxRPArGeU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c170d3e-2d6e-4b1f-71d6-08dd0a541eca
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 17:44:16.7814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JZLVRgLKLMchGj6Uh5ticoZouZ6I+/BQZ98P0He0gONK7YUsXC4WVZoUowkR1mqHsmMiolK3GxWIjKnYGh06zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8343
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Nov 2024 17:44:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9000

--------------3nDu3oGFSp9cAevMWTondOWN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/21/2024 9:46 AM, Bruce Ashfield via lists.yoctoproject.org wrote:
>
>
> On Thu, Nov 21, 2024 at 11:28 AM Sandeep Gundlupet Raju via 
> lists.yoctoproject.org <http://lists.yoctoproject.org> 
> <sandeep.gundlupet-raju=amd.com@lists.yoctoproject.org> wrote:
>
>
>     On 11/20/2024 9:42 PM, Bruce Ashfield via lists.yoctoproject.org
>     <http://lists.yoctoproject.org> wrote:
>     > In message:
>     [meta-virtualization][master][scarthgap][styhead][PATCH 4/6]
>     u-boot-xlnx-scr: Include xen-boot-env if BOOTMODE is xen
>     > on 18/11/2024 Sandeep Gundlupet Raju wrote:
>     >
>     >> Include xen-boot-env.inc file if BOOTMODE="xen" and also remove xen
>     >> u-boot boot script variables from xen-boot-cmd.inc.
>     > Is the BOOMODE variable documented somewhere ? In the main
>     > uboot recipes ?
>     [Sandeep]: Bruce, Variable is defined in
>     https://github.com/Xilinx/meta-xilinx/blob/master/meta-xilinx-core/recipes-bsp/u-boot/u-boot-xlnx-scr.bb#L32-L33
>
>     to support multiple u-boot boot target
>     https://github.com/Xilinx/u-boot-xlnx/blob/master/include/configs/xilinx_versal.h#L124-L132
>
>     for u-boot distro boot. I don't think we have a documentation
>     defining
>     all the variables.
>
>
> Can we just put a comment above the line in the file ? so someone can 
> lookup the definition if they are wondering.
[Sandeep]: Sure will do.
>
> Bruce
>
>     >
>     > Bruce
>     >
>     >> Signed-off-by: Sandeep Gundlupet Raju
>     <sandeep.gundlupet-raju@amd.com>
>     >> ---
>     >>   .../u-boot/u-boot-xlnx-scr.bbappend           | 7 +++-
>     >>   .../recipes-bsp/u-boot/xen-boot-cmd.inc       | 35
>     -------------------
>     >>   2 files changed, 6 insertions(+), 36 deletions(-)
>     >>
>     >> diff --git
>     a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
>     b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
>     >> index ec64d246..4e39c316 100644
>     >> ---
>     a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
>     >> +++
>     b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
>     >> @@ -1,4 +1,9 @@
>     >> -# Include xen-boot-cmd.inc only if ENABLE_XEN_UBOOT_SCR is set
>     from configuration
>     >> +# Include xen-boot-cmd.inc only if BOOTMODE = "xen" is set
>     from configuration
>     >>   # file and xen enabled in DISTRO_FEATURES.
>     >> +include ${@'xen-boot-env.inc' if d.getVar('BOOTMODE') == 'xen'
>     and bb.utils.contains('DISTRO_FEATURES', 'xen', True, False, d)
>     else ''}
>     >> +
>     >> +# Include xen-boot-cmd.inc only if ENABLE_XEN_UBOOT_SCR is set
>     from configuration
>     >> +# file and xen enabled in DISTRO_FEATURES. xen-boot-cmd.inc is
>     supports multiple
>     >> +# boot modes such as JTAG and SD(ext4 and ramdisk).
>     >>   ENABLE_XEN_UBOOT_SCR ?= ""
>     >>   include ${@'xen-boot-cmd.inc' if
>     d.getVar('ENABLE_XEN_UBOOT_SCR') == '1' and
>     bb.utils.contains('DISTRO_FEATURES', 'xen', True, False, d) else ''}
>     >> diff --git
>     a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
>     b/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
>     >> index 7a4e41a6..6fccc7b4 100644
>     >> --- a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
>     >> +++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
>     >> @@ -1,38 +1,3 @@
>     >>   FILESEXTRAPATHS:append := ":${THISDIR}/u-boot-xlnx-scr"
>     >>
>     >>   SRC_URI += "file://boot.cmd.xen"
>     >> -
>     >> -# Image offsets for Xen boot
>     >> -KERNEL_OFFSET:zynqmp ?= "0xE00000"
>     >> -KERNEL_OFFSET:versal ?= "0xE00000"
>     >> -
>     >> -DEVICETREE_OFFSET:zynqmp ?= "0xC000000"
>     >> -DEVICETREE_OFFSET:versal ?= "0xC000000"
>     >> -
>     >> -RAMDISK_OFFSET:zynqmp ?= "0x2600000"
>     >> -RAMDISK_OFFSET:versal ?= "0x2600000"
>     >> -
>     >> -XEN_OFFSET:zynqmp ?= "0xBA00000"
>     >> -XEN_OFFSET:versal ?= "0xBA00000"
>     >> -XEN_LOAD_ADDRESS ?=
>     "${@append_baseaddr(d,d.getVar('XEN_OFFSET'))}"
>     >> -
>     >> -# If dom0-ramdisk is used for Xen boot then set RAMDISK image
>     to cpio.gz
>     >> -XEN_IMAGE_NAME ?= "xen"
>     >> -RAMDISK_IMAGE ?= "rootfs.cpio.gz"
>     >> -
>     >> -# Set the amount of memory for dom0 depending on total
>     available memory size(DDR).
>     >> -DOM0_MEM ?= "1500M"
>     >> -
>     >> -# Specify which UART console Xen should use. You can sepecify
>     the devicetree
>     >> -# alias or full path to a node in the devicetree
>     >> -# XEN_SERIAL_CONSOLES ?= "serial0" or XEN_SERIAL_CONSOLES ?=
>     "/axi/serial@ff000000"
>     >> -XEN_SERIAL_CONSOLES ?= "serial0"
>     >> -
>     >> -# Specify additional Xen paramaters which will be appended to
>     xen-bootargs
>     >> -# This can alos be used for debugging purposes.
>     >> -# Examples: XEN_CMDLINE_APPEND ?= "sched=credit loglvl=all
>     guest_loglvl=debug"
>     >> -XEN_CMDLINE_APPEND ?= ""
>     >> -
>     >> -# Specify the max number of vcpus for dom0
>     >> -# Example usage: DOM0_MAX_VCPUS = "2" or DOM0_MAX_VCPUS = "2-4"
>     >> -DOM0_MAX_VCPUS ?= "1"
>     >> --
>     >> 2.34.1
>     >>
>     >>
>     >>
>     >>
>
>
>
>
>
> -- 
> - Thou shalt not follow the NULL pointer, for chaos and madness await 
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8998):https://lists.yoctoproject.org/g/meta-virtualization/message/8998
> Mute This Topic:https://lists.yoctoproject.org/mt/109660021/8188369
> Group Owner:meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe:https://lists.yoctoproject.org/g/meta-virtualization/unsub [santraju@amd.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------3nDu3oGFSp9cAevMWTondOWN
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/21/2024 9:46 AM, Bruce Ashfield
      via lists.yoctoproject.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CADkTA4O22sge3xC__qvd_e0=0c3XtR0mktAaiJUTXB6EgL3DNQ@mail.gmail.com">
      
      <div dir="ltr">
        <div dir="ltr">
          <div class="gmail_default" style="font-size:small"><br>
          </div>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Thu, Nov 21, 2024 at
            11:28 AM Sandeep Gundlupet Raju via <a href="http://lists.yoctoproject.org" moz-do-not-send="true">lists.yoctoproject.org</a>
            &lt;sandeep.gundlupet-raju=<a href="mailto:amd.com@lists.yoctoproject.org" moz-do-not-send="true" class="moz-txt-link-freetext">amd.com@lists.yoctoproject.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
            On 11/20/2024 9:42 PM, Bruce Ashfield via <a href="http://lists.yoctoproject.org" rel="noreferrer" target="_blank" moz-do-not-send="true">lists.yoctoproject.org</a>
            wrote:<br>
            &gt; In message:
            [meta-virtualization][master][scarthgap][styhead][PATCH 4/6]
            u-boot-xlnx-scr: Include xen-boot-env if BOOTMODE is xen<br>
            &gt; on 18/11/2024 Sandeep Gundlupet Raju wrote:<br>
            &gt;<br>
            &gt;&gt; Include xen-boot-env.inc file if BOOTMODE=&quot;xen&quot; and
            also remove xen<br>
            &gt;&gt; u-boot boot script variables from xen-boot-cmd.inc.<br>
            &gt; Is the BOOMODE variable documented somewhere ? In the
            main<br>
            &gt; uboot recipes ?<br>
            [Sandeep]: Bruce, Variable is defined in <br>
            <a href="https://github.com/Xilinx/meta-xilinx/blob/master/meta-xilinx-core/recipes-bsp/u-boot/u-boot-xlnx-scr.bb#L32-L33" rel="noreferrer" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">https://github.com/Xilinx/meta-xilinx/blob/master/meta-xilinx-core/recipes-bsp/u-boot/u-boot-xlnx-scr.bb#L32-L33</a>
            <br>
            to support multiple u-boot boot target <br>
            <a href="https://github.com/Xilinx/u-boot-xlnx/blob/master/include/configs/xilinx_versal.h#L124-L132" rel="noreferrer" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">https://github.com/Xilinx/u-boot-xlnx/blob/master/include/configs/xilinx_versal.h#L124-L132</a>
            <br>
            for u-boot distro boot. I don't think we have a
            documentation defining <br>
            all the variables.<br>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class="gmail_default" style="font-size:small">Can we
              just put a comment above the line in the file ? so someone
              can lookup the definition if they are wondering.</div>
          </div>
        </div>
      </div>
    </blockquote>
    [Sandeep]: Sure will do.<br>
    <blockquote type="cite" cite="mid:CADkTA4O22sge3xC__qvd_e0=0c3XtR0mktAaiJUTXB6EgL3DNQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div>
            <div class="gmail_default" style="font-size:small"><br>
            </div>
            <div class="gmail_default" style="font-size:small">Bruce</div>
            <br>
          </div>
          <div>&nbsp;</div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            &gt;<br>
            &gt; Bruce<br>
            &gt;<br>
            &gt;&gt; Signed-off-by: Sandeep Gundlupet Raju &lt;<a href="mailto:sandeep.gundlupet-raju@amd.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">sandeep.gundlupet-raju@amd.com</a>&gt;<br>
            &gt;&gt; ---<br>
            &gt;&gt;&nbsp; &nbsp;.../u-boot/u-boot-xlnx-scr.bbappend&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp;
            7 +++-<br>
            &gt;&gt;&nbsp; &nbsp;.../recipes-bsp/u-boot/xen-boot-cmd.inc&nbsp; &nbsp; &nbsp; &nbsp;|
            35 -------------------<br>
            &gt;&gt;&nbsp; &nbsp;2 files changed, 6 insertions(+), 36 deletions(-)<br>
            &gt;&gt;<br>
            &gt;&gt; diff --git
            a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend
b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend<br>
            &gt;&gt; index ec64d246..4e39c316 100644<br>
            &gt;&gt; ---
            a/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend<br>
            &gt;&gt; +++
            b/dynamic-layers/xilinx/recipes-bsp/u-boot/u-boot-xlnx-scr.bbappend<br>
            &gt;&gt; @@ -1,4 +1,9 @@<br>
            &gt;&gt; -# Include xen-boot-cmd.inc only if
            ENABLE_XEN_UBOOT_SCR is set from configuration<br>
            &gt;&gt; +# Include xen-boot-cmd.inc only if BOOTMODE =
            &quot;xen&quot; is set from configuration<br>
            &gt;&gt;&nbsp; &nbsp;# file and xen enabled in DISTRO_FEATURES.<br>
            &gt;&gt; +include ${@'xen-boot-env.inc' if
            d.getVar('BOOTMODE') == 'xen' and
            bb.utils.contains('DISTRO_FEATURES', 'xen', True, False, d)
            else ''}<br>
            &gt;&gt; +<br>
            &gt;&gt; +# Include xen-boot-cmd.inc only if
            ENABLE_XEN_UBOOT_SCR is set from configuration<br>
            &gt;&gt; +# file and xen enabled in DISTRO_FEATURES.
            xen-boot-cmd.inc is supports multiple<br>
            &gt;&gt; +# boot modes such as JTAG and SD(ext4 and
            ramdisk).<br>
            &gt;&gt;&nbsp; &nbsp;ENABLE_XEN_UBOOT_SCR ?= &quot;&quot;<br>
            &gt;&gt;&nbsp; &nbsp;include ${@'xen-boot-cmd.inc' if
            d.getVar('ENABLE_XEN_UBOOT_SCR') == '1' and
            bb.utils.contains('DISTRO_FEATURES', 'xen', True, False, d)
            else ''}<br>
            &gt;&gt; diff --git
            a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
            b/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc<br>
            &gt;&gt; index 7a4e41a6..6fccc7b4 100644<br>
            &gt;&gt; ---
            a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc<br>
            &gt;&gt; +++
            b/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc<br>
            &gt;&gt; @@ -1,38 +1,3 @@<br>
            &gt;&gt;&nbsp; &nbsp;FILESEXTRAPATHS:append :=
            &quot;:${THISDIR}/u-boot-xlnx-scr&quot;<br>
            &gt;&gt;&nbsp; &nbsp;<br>
            &gt;&gt;&nbsp; &nbsp;SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://boot.cmd.xen">&quot;file://boot.cmd.xen&quot;</a><br>
            &gt;&gt; -<br>
            &gt;&gt; -# Image offsets for Xen boot<br>
            &gt;&gt; -KERNEL_OFFSET:zynqmp ?= &quot;0xE00000&quot;<br>
            &gt;&gt; -KERNEL_OFFSET:versal ?= &quot;0xE00000&quot;<br>
            &gt;&gt; -<br>
            &gt;&gt; -DEVICETREE_OFFSET:zynqmp ?= &quot;0xC000000&quot;<br>
            &gt;&gt; -DEVICETREE_OFFSET:versal ?= &quot;0xC000000&quot;<br>
            &gt;&gt; -<br>
            &gt;&gt; -RAMDISK_OFFSET:zynqmp ?= &quot;0x2600000&quot;<br>
            &gt;&gt; -RAMDISK_OFFSET:versal ?= &quot;0x2600000&quot;<br>
            &gt;&gt; -<br>
            &gt;&gt; -XEN_OFFSET:zynqmp ?= &quot;0xBA00000&quot;<br>
            &gt;&gt; -XEN_OFFSET:versal ?= &quot;0xBA00000&quot;<br>
            &gt;&gt; -XEN_LOAD_ADDRESS ?=
            <a class="moz-txt-link-rfc2396E" href="mailto:${@append_baseaddr(d,d.getVar('XEN_OFFSET'))}">&quot;${@append_baseaddr(d,d.getVar('XEN_OFFSET'))}&quot;</a><br>
            &gt;&gt; -<br>
            &gt;&gt; -# If dom0-ramdisk is used for Xen boot then set
            RAMDISK image to cpio.gz<br>
            &gt;&gt; -XEN_IMAGE_NAME ?= &quot;xen&quot;<br>
            &gt;&gt; -RAMDISK_IMAGE ?= &quot;rootfs.cpio.gz&quot;<br>
            &gt;&gt; -<br>
            &gt;&gt; -# Set the amount of memory for dom0 depending on
            total available memory size(DDR).<br>
            &gt;&gt; -DOM0_MEM ?= &quot;1500M&quot;<br>
            &gt;&gt; -<br>
            &gt;&gt; -# Specify which UART console Xen should use. You
            can sepecify the devicetree<br>
            &gt;&gt; -# alias or full path to a node in the devicetree<br>
            &gt;&gt; -# XEN_SERIAL_CONSOLES ?= &quot;serial0&quot; or
            XEN_SERIAL_CONSOLES ?= &quot;/axi/serial@ff000000&quot;<br>
            &gt;&gt; -XEN_SERIAL_CONSOLES ?= &quot;serial0&quot;<br>
            &gt;&gt; -<br>
            &gt;&gt; -# Specify additional Xen paramaters which will be
            appended to xen-bootargs<br>
            &gt;&gt; -# This can alos be used for debugging purposes.<br>
            &gt;&gt; -# Examples: XEN_CMDLINE_APPEND ?= &quot;sched=credit
            loglvl=all guest_loglvl=debug&quot;<br>
            &gt;&gt; -XEN_CMDLINE_APPEND ?= &quot;&quot;<br>
            &gt;&gt; -<br>
            &gt;&gt; -# Specify the max number of vcpus for dom0<br>
            &gt;&gt; -# Example usage: DOM0_MAX_VCPUS = &quot;2&quot; or
            DOM0_MAX_VCPUS = &quot;2-4&quot;<br>
            &gt;&gt; -DOM0_MAX_VCPUS ?= &quot;1&quot;<br>
            &gt;&gt; -- <br>
            &gt;&gt; 2.34.1<br>
            &gt;&gt;<br>
            &gt;&gt;<br>
            &gt;&gt; <br>
            &gt;&gt;<br>
            <br>
            <br>
            <br>
          </blockquote>
        </div>
        <div><br clear="all">
        </div>
        <div><br>
        </div>
        <span class="gmail_signature_prefix">-- </span><br>
        <div dir="ltr" class="gmail_signature">- Thou shalt not follow
          the NULL pointer, for chaos and madness await thee at its end<br>
          - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
          <br>
        </div>
      </div>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#8998): <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/message/8998">https://lists.yoctoproject.org/g/meta-virtualization/message/8998</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/mt/109660021/8188369">https://lists.yoctoproject.org/mt/109660021/8188369</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:meta-virtualization+owner@lists.yoctoproject.org">meta-virtualization+owner@lists.yoctoproject.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/unsub">https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:santraju@amd.com">santraju@amd.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------3nDu3oGFSp9cAevMWTondOWN--

