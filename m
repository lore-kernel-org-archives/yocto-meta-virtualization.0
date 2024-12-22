Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 241F5E77188
	for <webhook@archiver.kernel.org>; Sun, 22 Dec 2024 18:29:49 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.79])
 by mx.groups.io with SMTP id smtpd.web11.28938.1734892183641652225
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Dec 2024 10:29:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amd.com header.s=selector1 header.b=1r/8omnf;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.243.79, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=meaZDJ0HP69iSS8zKA/YhRVuYxQ9YCQKnJewVC4I99YCOfNekTpS+1TORHPCxTc1WMqn3s8N76t2NUxNeEW0yOvCPUy4/8ImgOSS12QOI3S/sHS6Y7jGdmVmQNHbOmdelbvyrXofp03fHRIIaK5ff1/SDPmuSWcMFYCmmIjNlkEulYAqgB2nvzPli2gM4IHu1wpx6KaOJ8i8xAyhgNUhzfsNZIeZze5e8XRgaIP66KiasfpM8MD2RFNJL2Dr48hJO+rjb/uhi99rNgB/fPqSb5c6LSMlSN1J/L77qrYQXp0eifEKLmkHfyEd2yW4o0G/DtEEvZhnc/197FIAZE9wsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OIdlm5gtD57npKzeB1IHlhaOJAl3YjIeDvHYgw4uPNc=;
 b=cJ3uJ9UkIYJ4pRsXQ46iYQNxmTSZHsLSa1MtIi1hODgCXhWnks/F1ieJXfQkBZzAqbDbNd7LpHqX2lkdfZeu4lBW7yOs4a6y0exVNhX9DJVS/wYH4Hqa1lCdiLL/tEOZTAgQNRXgpTr9fKlNF3OQEpmjYD8fLdEAEcWo8xV0DQd5eIwRSFjIClQlopStsaZdLS1/GWQOj+HHn493GYMSyykaWrjESNVEq3tfpDMpAny5fnnO/83JJeFpUa213jWy3UuxdGgkTlanRNq6VaQ+TQmSmNeuxg7r79jrsBDMxQdador0KK8T7duQ/5QXfYatYItiGIrcAcbGpDKduV8AiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OIdlm5gtD57npKzeB1IHlhaOJAl3YjIeDvHYgw4uPNc=;
 b=1r/8omnfTnMslj6ofV4iXneLfl6pSHrO2i/ekh7+nrj0oKLUM5h1iJ09zQGslDnqVgFeAFYJgX4zao6YHZWitWz3jBlska4in88rLtzXHmAa2iVRbChLxQyco5AtVfcJgiltsxeb1HpXLUJI7v/o7xMzIdJdMhUPLRlMV8MQZzc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.17; Sun, 22 Dec
 2024 18:29:22 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76%5]) with mapi id 15.20.8272.013; Sun, 22 Dec 2024
 18:29:22 +0000
Content-Type: multipart/alternative;
 boundary="------------0ACu0z95Nm00XWxIYPUfamJ9"
Message-ID: <df9a99fd-3fdc-43b7-bf8b-396aa6c72d27@amd.com>
Date: Sun, 22 Dec 2024 11:29:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][master][styhead][PATCH v5 0/5] Add bbclass
 for xen launch config variables
To: christopher.w.clark@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org, bruce.ashfield@gmail.com,
 mark.hatle@kernel.crashing.org
References: <180F89FA56BC204A.19074@lists.yoctoproject.org>
 <29aae416-4352-4fc9-ad55-32f76f69a555@amd.com>
 <CACMJ4GZGjm0MA1ewwB_1OeU2XJ6LBzduKUF6wSQ13HHSuiOSOA@mail.gmail.com>
Content-Language: en-US
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <CACMJ4GZGjm0MA1ewwB_1OeU2XJ6LBzduKUF6wSQ13HHSuiOSOA@mail.gmail.com>
X-ClientProxiedBy: SA0PR12CA0001.namprd12.prod.outlook.com
 (2603:10b6:806:6f::6) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|IA1PR12MB6435:EE_
X-MS-Office365-Filtering-Correlation-Id: 24f5c164-1bff-4471-fc73-08dd22b68e61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|4022899009|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aDNqbm9MZXQvSlArOW9zeHhTdlIzdmFqRFJYOFNtL291dk1BTjVUclFPb2g5?=
 =?utf-8?B?M2h2eFJWS04zTkhvcXRkWmtsSWFKRXlaN3VVYXVuM0ZZUFdsRVBWYXhXYTVj?=
 =?utf-8?B?WFlHVEZyYTlIdCt6N0FoZGNMK3NFOU91YWxlVzlZbTNRa1dhQkZhUXl4aGF0?=
 =?utf-8?B?MDNUQjNwbXhtaENJVXh6MTZuMGV5RTRqejFIZlQ0Z2hibUZjcjhvSVZRY1RO?=
 =?utf-8?B?b1p4elgwR1hJWVFkeU1CWW5YMDQycUtXRFpWaHZIbk9UeldJRFVhRjg4dzMr?=
 =?utf-8?B?Q1I4dUJkdUlMa2lBWGRxUXJyL1NSVW5CRU1CNlVmb0xKanNBc1JQcmp2cXVZ?=
 =?utf-8?B?c2s4U1JjSkx1dHJhUVVrYzltaC9LMFNkOU5kSzZ1Y1pzRGdiRVBvRXFrWHUy?=
 =?utf-8?B?SDVyLzlVSmp2bm1SbkxTcnZmZ0dOVUF5UDBJejJHcnVIQUdrSHV1cG1SMlJF?=
 =?utf-8?B?WGl2UitlS2VuWDVPNVE0RXU2MjY0NUp6V3hOcS9QeE9oUmU0VVp3VnNWZzNX?=
 =?utf-8?B?S1BDck0xbXJlMC9kdEVLOVkycDVqbDlONFNMQUdnVTNaYmdYeFVlR1FNRURo?=
 =?utf-8?B?MTN5VjNNN2MvQ2xYb2srT3RVK1ZDZ0dZWkRuSHBCc2x0TVJmWmtYSXVKU1Zu?=
 =?utf-8?B?WFUyMmhRZVNhOC9RbXpBZXVvZlJHYmF0NE9UN2JSZm1HOWNQRDJkcHpHWG5E?=
 =?utf-8?B?UEhVeU5VQ2tRZjlhT3JVUk5qWno2cUlISE85OFVHVU95S01tbGFPeGhWYlE4?=
 =?utf-8?B?QXBEZGZrU2ZLRHhVUytzbXFld0FZeERrWTBielJxNHgyTWJvUmlZZ0gzd3la?=
 =?utf-8?B?RGpYSmlaUlRsSnJPeTlkNitpODU1eHlVaTZjWkN1ZjlrRzdUbGtwYUk0ZW9G?=
 =?utf-8?B?M2RPbXY5MjhHR0lTeXFMQm5UM3g4QnFNMmIrMU41WjhvdDlIODdWQVRwcW1U?=
 =?utf-8?B?RUFQaVpvcXo4NWhxdTU5RnZEeGF0VU84VHp3MDJXZC9qSkhSZ1VacTFJQmR4?=
 =?utf-8?B?dUxOcFg2Q0JPMXdNNGUwYUdrTGlaYXZ3TlpmdUgyRUYxZFprblprRHdMcWRo?=
 =?utf-8?B?TXdtQktaOFVjVkg5NWJiZnp1aTRQSENuT1JhTWFnN2NlVmlwQklsVG9PV1pF?=
 =?utf-8?B?U0JJeEk5bkNvWFg0UnZ0aEVOdWxERzNpNXhENTY1ZlhhVGRYc2Jwc0Vkbzlh?=
 =?utf-8?B?MTQwdGk2c0VKUE1PU1VsUUp3eTJ1cnNUMlJ1ZXA0cU1QUFZXRDFpbEFhVC9u?=
 =?utf-8?B?R0EzZm1PUzJDWUd6QytZUUtRTnRJakorcm5nNmVOeGRUQk9FSHRqOG04c2xU?=
 =?utf-8?B?anJ4UlFvU0FCUEkrYTdGa1VGdXR1a29tbE12MzY4WHpPWFF1RDZ4TStEeE1w?=
 =?utf-8?B?NWNsbCtkUnZIQTZBVnROTTVnaGlmOUFuYXU4dmJibE1xZXBPelQwRVViNmJy?=
 =?utf-8?B?UzFBdEdhY3VZQUh4YnVUUU9XTUprZG9QdVo0QXNYTEpaeGJMSXhIcG9EUkEz?=
 =?utf-8?B?SFNkczBxWk1ZNFZ0OXpGVkpvYVIwaDlmTnlTL0xNekUvajljYXRDY2gzekhC?=
 =?utf-8?B?MFpYQnJoQURIMFpVMzlOM05NOHBTV0hjT0ZQZXlnYTJKVmFVbzFyc25EY2hq?=
 =?utf-8?B?QzBCdmZLQ0Y0V2c3c2gxcFFqbFN4R1BPb3p0RzdPc2F4MFRGeGkvVjhDVlZO?=
 =?utf-8?B?OEF2dklqSXcxaGpmeXVxYTRaREhuZXJtMFk2dGtIb2xueHp2SW5iZzJEZUtR?=
 =?utf-8?Q?gLjHWj0h8kiZd0E2mirt+r4zj7Mlvs+tCMj01kY?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UVV5TS9XUW9nS2xnbml1WUNSY2lhNlBtdURnbEtYbngvdmVGS3hjck9iUjJN?=
 =?utf-8?B?NW5KMURJaVpoU0ZHTkxVR0I3UTFncnl4SkYxNVpYR1Q3RXBHTEQ1OXVIT2Z0?=
 =?utf-8?B?QWU4akFBeklqeFZTbVFkazVrQ29EbityZXB5TjhjVENET0RBYUVQRENNdHpp?=
 =?utf-8?B?Z0hhbUJFT0VINC8vRmpWVFVJa2lKUFhLUlIrakgxcC91WEpOUTBIYlpmeVJ6?=
 =?utf-8?B?bm5QSGEyWU54TkdSUVZOQ0NXOWtXcVhwblpwZ3QzS0RiMDVHRms5ZVJqVU9l?=
 =?utf-8?B?Vm9NdW12L1FLMTVjdnArT3dnQ2puRWJqbUZUaDhlUnZod0VLZVQ3ZVpMV2lV?=
 =?utf-8?B?NG9wdWhiU084L2N4ZHdKdHBiNjJzWFduUHVRSXpZaGVHMjFwR3dEb1dJaHFB?=
 =?utf-8?B?M3dOa3ZXRjBLQkdmbEl4MHZPWDhUOUF4NWY1Z2RkUE5SY3crb3ZyUHhRN1VZ?=
 =?utf-8?B?MmF4UGpEUUc2ZmUxUHZyNDFxZmlFaFo1MjZBWFFWM0tiYUpCMTEwbWZ0TW5X?=
 =?utf-8?B?WlZHR3F3ZXh4NXpsOTdjcmNuZi9ncDVJUE8wTVdQaE5UTFQ5VlpjYmNMTS9X?=
 =?utf-8?B?VjdHZGYvNHgrNTJZYllnZ2s2U1BleUxIUEtGOG5tQUJOamhGU0IzNEcrYVEw?=
 =?utf-8?B?cEZJbzhVTlp4Z2tabmhFM2NBRytDNTgxZHdnYjFXekdZblpxbDlBejU4RWFB?=
 =?utf-8?B?WTk4ZklDZ0NRMHlRUVozSkN2REJyNXpnbjBRY2ErWU9BMTJmMXJyVEVrQkhC?=
 =?utf-8?B?K0UxOFFXMFErVXRrSXZQczZGaCtIUzZwbkZVaE15Zm9lZVcvM01UNzUzVVJS?=
 =?utf-8?B?UTJsN21uaGhrZUg5YlNFR0UrUG9kRWZiZ1lNeCtEdzZFc2lRcnJaTFFkN0RH?=
 =?utf-8?B?YXlhTmRETk5JbkNvNmJjWXJXaDBNT3Q1MWJaMDdBd1c1ZFZoUm55L2RXMjF3?=
 =?utf-8?B?a2EwK0dmR2d5QWJhdWxUclYzNktnamVmeEZOK3J2Y0tNV3FmNkFpM2VUNHhw?=
 =?utf-8?B?azZCR21qVEF5QSs5RDZFdGxnVElRRFZ1U2NIUTFSUGlUVVl4Z3pMamp3T3N5?=
 =?utf-8?B?K2txbnQ4RkoxVEdlbjBSUW9CVVE0OFZzT3JIbG5xZWtWc2tYY2hpTnBBSXZF?=
 =?utf-8?B?VHdscFNyKy9aaGFnVnhZcm5YNWdLYUVxa3lBb3hwQktsQ2NvbU9hU2NvWXRz?=
 =?utf-8?B?aW5BNXZXMG1RYmtNMDdNUzIvVzY5djhVeFJnR1ZKWU1HbDBNMHQ4bllwZGhG?=
 =?utf-8?B?Qkd6MHpHUUgyNjNXZWJzS25rb0VUK0dld2pjdHhDdkxISHJwZWR1QjB1bWg0?=
 =?utf-8?B?WnI4NTFBbG1Hdml3dVFqck52S2lXUko4VmdKTVErMGdUTFR3QlRnQTJGWmV0?=
 =?utf-8?B?bjVtZFpEbDJSSWJ2am9aTTY1Z3ZVQ0gySFRCSHhJTS9EZXowOGVWSXlwVldh?=
 =?utf-8?B?OVlreVdkMVBXMnBtMktlUll4RGgxUDdpNzJFY3pEdXpoczFpc3JiK1pRRm9B?=
 =?utf-8?B?RjlhZGN5QnI1czVWeWxtWk1JaTVzai9qYnA2M2pIS2RHclVRZWkzWkJza1dJ?=
 =?utf-8?B?ZGZwdFNBK0Jya2hYcndMSS9Hd1p0SlkyKzB2UkhETmFIT0JTRHdTN3lJbXY5?=
 =?utf-8?B?dG9zS1ZvZE95cE5pbXBsc25ob1hjaDk1K0pUSnMvMFNUd01iSUg1WitGR2lz?=
 =?utf-8?B?Ylh6ZVFNN2ZCTTRXRW5UMWFXQ0VJTFgreEFsNndSNXhhTWFiaksvSGxwZFNK?=
 =?utf-8?B?bnRadkZLSno5Z1VjaTMzQlpoWHA1cjBtdGM1VmVrVnJsdWJBNm0rQXNETERR?=
 =?utf-8?B?M2l6TDV3Y21icHFaSWxQNlBqMTIvMlpKeERVUFY2T0tNRXFDOTVJdmRHbGtX?=
 =?utf-8?B?TUJrQzJCbnVkZ05ENi9ZQTF1bHhYRHpseDNxT2hWYTRkcExSWXliSmdweG5G?=
 =?utf-8?B?Q0RtRkI1NHkyWkg4c3UxdkFNRUxlZi83SnFZOUFHYkpMK3dEYWcyZ3NSbE5T?=
 =?utf-8?B?SzU2Zkx2MWdNMkNPZE5QYVlWYWdLYVZ1WTEwL1Fxa1FNaUp2RXBjNGp0aVJL?=
 =?utf-8?B?YnVwcUIzeU5aZllIbEQ2VkdVVjVHQlB2R2QyN3RXMlZLRG5DNHhGcWRpQjhy?=
 =?utf-8?Q?Ph3WCXRnN8hOPx/vMzgsqsK2A?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f5c164-1bff-4471-fc73-08dd22b68e61
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2024 18:29:22.5872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YpbkPbeDrO2zTUhgKPauhtDkxamCuecy/K6RuVqmYgcJIEZM/SdM1GbEal7XbXVxc9dg1DK2yMp1nB0rpLUr/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6435
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 22 Dec 2024 18:29:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9062

--------------0ACu0z95Nm00XWxIYPUfamJ9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/17/2024 5:06 PM, Christopher Clark via lists.yoctoproject.org wrote:
>
>
> On Tue, Dec 17, 2024 at 5:53 PM Sandeep Gundlupet Raju via 
> lists.yoctoproject.org <http://lists.yoctoproject.org> 
> <sandeep.gundlupet-raju=amd.com@lists.yoctoproject.org> wrote:
>
>     Hi Bruce, Chris,
>
>     Any more comments on patches?
>
>
> Sorry I haven’t had chance to look at this series again yet - am 
> aiming to get to it before New Year. Thanks for iterating on the last 
> feedback.
Sounds good.
>
> Christopher
>
>
>
>     Thanks,
>     Sandeep
>
>     On 12/9/2024 7:54 AM, Sandeep Gundlupet Raju via
>     lists.yoctoproject.org <http://lists.yoctoproject.org>
>     wrote:
>     > Changes in v5:
>     >     - Merge below 2 patches into single patch.
>     >         - xen-boot-env: Move xen variables to inc file
>     >         - u-boot-xlnx-scr: Include xen-boot-env if BOOTMODE is xen
>     >
>     > Changes in v4:
>     >     - Fix xen-boot-env.inc by inheriting xen-lauch-config bbclass
>     >
>     > Changes in v3:
>     >     - Rename xen-u-boot-scr-configuration.bbclass to
>     xen-launch-config.bbclass
>     >       as suggested by Christopher Clark as this is not u-boot
>     specific.
>     >
>     > Changes in V2:
>     >     - Rename xen-u-boot-scr.bbclass to
>     xen-u-boot-scr-configuration.bbclass
>     >     - Add comment in u-boot-xlnx-scr.bbappend to specify where
>     BOOTMODE
>     >       variable is defined.
>     >
>     > 1. Add xen-lauch-config.bbclass for generic xen launch config
>     >     variables use by any soc devices.
>     > 2. Inherit xen-launch-config.bbclass in xen-rpi-u-boot-scr.
>     > 3. Move xen variables to xen-boot-env.inc file in xilinx
>     >     dynamic layers.
>     > 4. Include xen-boot-env if BOOTMODE = "xen" switch is enabled.
>     > 5. Add load address to boot.cmd.xen script echo messages.
>     > 6. Inherit xen-launch-config bbclass in xen-boot-env.inc.
>     > 7. If user brings in their own boot.cmd.xxx file they can just
>     >     inherit xen-launch-config bbclass and use the generic
>     >     xen boot script variables.
>     >
>     > Sandeep Gundlupet Raju (5):
>     >    xen-launch-config: Add bbclass for xen launch config variables
>     >    xen-rpi-u-boot-scr: Inherit xen-launch-config bbclass
>     >    u-boot-xlnx-scr: Include xen-boot-env if BOOTMODE is xen
>     >    boot.cmd.xen: Add load address to echo messages
>     >    xen-boot-env.inc: Inherit xen-launch-config bbclass
>     >
>     >   classes-recipe/xen-launch-config.bbclass      | 43
>     +++++++++++++++++++
>     >   .../xen-rpi-u-boot-scr/files/boot.cmd.xen.in
>     <http://boot.cmd.xen.in> | 10 ++---
>     >   .../xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb
>     <http://xen-rpi-u-boot-scr.bb> | 13 +++---
>     >   .../u-boot/u-boot-xlnx-scr.bbappend           | 13 +++++-
>     >   .../u-boot/u-boot-xlnx-scr/boot.cmd.xen       |  8 ++--
>     >   .../recipes-bsp/u-boot/xen-boot-cmd.inc       | 35 ---------------
>     >   .../recipes-bsp/u-boot/xen-boot-env.inc       | 31 +++++++++++++
>     >   7 files changed, 103 insertions(+), 50 deletions(-)
>     >   create mode 100644 classes-recipe/xen-launch-config.bbclass
>     >   create mode 100644
>     dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-env.inc
>     >
>     >
>     >
>     >
>
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9060):https://lists.yoctoproject.org/g/meta-virtualization/message/9060
> Mute This Topic:https://lists.yoctoproject.org/mt/110006797/3619217
> Group Owner:meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe:https://lists.yoctoproject.org/g/meta-virtualization/unsub [sandeep.gundlupet-raju@amd.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------0ACu0z95Nm00XWxIYPUfamJ9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/17/2024 5:06 PM, Christopher
      Clark via lists.yoctoproject.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CACMJ4GZGjm0MA1ewwB_1OeU2XJ6LBzduKUF6wSQ13HHSuiOSOA@mail.gmail.com">
      
      <div><br>
      </div>
      <div><br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Tue, Dec 17, 2024 at
            5:53 PM Sandeep Gundlupet Raju via <a href="http://lists.yoctoproject.org" moz-do-not-send="true">lists.yoctoproject.org</a>
            &lt;sandeep.gundlupet-raju=<a href="mailto:amd.com@lists.yoctoproject.org" moz-do-not-send="true" class="moz-txt-link-freetext">amd.com@lists.yoctoproject.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">Hi
            Bruce, Chris,<br>
            <br>
            Any more comments on patches?</blockquote>
          <div dir="auto"><br>
          </div>
          <div dir="auto">Sorry I haven’t had chance to look at this
            series again yet - am aiming to get to it before New Year.
            Thanks for iterating on the last feedback.</div>
        </div>
      </div>
    </blockquote>
    Sounds good.<br>
    <blockquote type="cite" cite="mid:CACMJ4GZGjm0MA1ewwB_1OeU2XJ6LBzduKUF6wSQ13HHSuiOSOA@mail.gmail.com">
      <div>
        <div class="gmail_quote">
          <div dir="auto"><br>
          </div>
          <div dir="auto">Christopher</div>
          <div dir="auto"><br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir="auto"><br>
            <br>
            Thanks,<br>
            Sandeep<br>
            <br>
            On 12/9/2024 7:54 AM, Sandeep Gundlupet Raju via <a href="http://lists.yoctoproject.org" rel="noreferrer" target="_blank" moz-do-not-send="true">lists.yoctoproject.org</a>
            <br>
            wrote:<br>
            &gt; Changes in v5:<br>
            &gt;&nbsp; &nbsp; &nbsp;- Merge below 2 patches into single patch.<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;- xen-boot-env: Move xen variables to inc file<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;- u-boot-xlnx-scr: Include xen-boot-env if
            BOOTMODE is xen<br>
            &gt;<br>
            &gt; Changes in v4:<br>
            &gt;&nbsp; &nbsp; &nbsp;- Fix xen-boot-env.inc by inheriting
            xen-lauch-config bbclass<br>
            &gt;<br>
            &gt; Changes in v3:<br>
            &gt;&nbsp; &nbsp; &nbsp;- Rename xen-u-boot-scr-configuration.bbclass to
            xen-launch-config.bbclass<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;as suggested by Christopher Clark as this is not
            u-boot specific.<br>
            &gt;<br>
            &gt; Changes in V2:<br>
            &gt;&nbsp; &nbsp; &nbsp;- Rename xen-u-boot-scr.bbclass to
            xen-u-boot-scr-configuration.bbclass<br>
            &gt;&nbsp; &nbsp; &nbsp;- Add comment in u-boot-xlnx-scr.bbappend to
            specify where BOOTMODE<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;variable is defined.<br>
            &gt;<br>
            &gt; 1. Add xen-lauch-config.bbclass for generic xen launch
            config<br>
            &gt;&nbsp; &nbsp; &nbsp;variables use by any soc devices.<br>
            &gt; 2. Inherit xen-launch-config.bbclass in
            xen-rpi-u-boot-scr.<br>
            &gt; 3. Move xen variables to xen-boot-env.inc file in
            xilinx<br>
            &gt;&nbsp; &nbsp; &nbsp;dynamic layers.<br>
            &gt; 4. Include xen-boot-env if BOOTMODE = &quot;xen&quot; switch is
            enabled.<br>
            &gt; 5. Add load address to boot.cmd.xen script echo
            messages.<br>
            &gt; 6. Inherit xen-launch-config bbclass in
            xen-boot-env.inc.<br>
            &gt; 7. If user brings in their own boot.cmd.xxx file they
            can just<br>
            &gt;&nbsp; &nbsp; &nbsp;inherit xen-launch-config bbclass and use the
            generic<br>
            &gt;&nbsp; &nbsp; &nbsp;xen boot script variables.<br>
            &gt;<br>
            &gt; Sandeep Gundlupet Raju (5):<br>
            &gt;&nbsp; &nbsp; xen-launch-config: Add bbclass for xen launch config
            variables<br>
            &gt;&nbsp; &nbsp; xen-rpi-u-boot-scr: Inherit xen-launch-config
            bbclass<br>
            &gt;&nbsp; &nbsp; u-boot-xlnx-scr: Include xen-boot-env if BOOTMODE is
            xen<br>
            &gt;&nbsp; &nbsp; boot.cmd.xen: Add load address to echo messages<br>
            &gt;&nbsp; &nbsp; xen-boot-env.inc: Inherit xen-launch-config bbclass<br>
            &gt;<br>
            &gt;&nbsp; &nbsp;classes-recipe/xen-launch-config.bbclass&nbsp; &nbsp; &nbsp; | 43
            +++++++++++++++++++<br>
            &gt;&nbsp; &nbsp;.../xen-rpi-u-boot-scr/files/<a href="http://boot.cmd.xen.in" rel="noreferrer" target="_blank" moz-do-not-send="true">boot.cmd.xen.in</a>&nbsp;
            | 10 ++---<br>
            &gt;&nbsp; &nbsp;.../xen-rpi-u-boot-scr/<a href="http://xen-rpi-u-boot-scr.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">xen-rpi-u-boot-scr.bb</a>&nbsp;
            | 13 +++---<br>
            &gt;&nbsp; &nbsp;.../u-boot/u-boot-xlnx-scr.bbappend&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 13
            +++++-<br>
            &gt;&nbsp; &nbsp;.../u-boot/u-boot-xlnx-scr/boot.cmd.xen&nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 8
            ++--<br>
            &gt;&nbsp; &nbsp;.../recipes-bsp/u-boot/xen-boot-cmd.inc&nbsp; &nbsp; &nbsp; &nbsp;| 35
            ---------------<br>
            &gt;&nbsp; &nbsp;.../recipes-bsp/u-boot/xen-boot-env.inc&nbsp; &nbsp; &nbsp; &nbsp;| 31
            +++++++++++++<br>
            &gt;&nbsp; &nbsp;7 files changed, 103 insertions(+), 50 deletions(-)<br>
            &gt;&nbsp; &nbsp;create mode 100644
            classes-recipe/xen-launch-config.bbclass<br>
            &gt;&nbsp; &nbsp;create mode 100644
            dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-env.inc<br>
            &gt;<br>
            &gt;<br>
            &gt; <br>
            &gt;<br>
            <br>
            <br>
            <br>
          </blockquote>
        </div>
      </div>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#9060): <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/message/9060">https://lists.yoctoproject.org/g/meta-virtualization/message/9060</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/mt/110006797/3619217">https://lists.yoctoproject.org/mt/110006797/3619217</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:meta-virtualization+owner@lists.yoctoproject.org">meta-virtualization+owner@lists.yoctoproject.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-virtualization/unsub">https://lists.yoctoproject.org/g/meta-virtualization/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:sandeep.gundlupet-raju@amd.com">sandeep.gundlupet-raju@amd.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------0ACu0z95Nm00XWxIYPUfamJ9--

