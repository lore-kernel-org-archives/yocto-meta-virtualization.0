Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B7AEE77170
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 19:24:06 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.73])
 by mx.groups.io with SMTP id smtpd.web10.23679.1733340241218986491
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Dec 2024 11:24:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amd.com header.s=selector1 header.b=34+LyI+U;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.236.73, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MlLfe6rBYlXKbM77CBbX0eqVj3Q85h6+cbwLPPJIT3AR8SIB45iTpvjMvVa4bPQLN6YYoQp0QobT8jVmgQLb80WdZBrNJq0LInRoWBTpUdwWfu4sxx1Y242NRIHbnS3rNpXhWf1tFMw+61VpggGaeO+u5iUM7MlbORTvEh0GRwX/CetUkzu8Ec8/mGSFsZB0ovGabr8YnGPFgyihs8SJpZ45UfbJVw6YLxaO4IIxrdvHyhAh/PZAftr0D7NIJ9h8OBg+yCTq+vwCylijluKlYNRL/hF5Wrz0op+gmxhv0zdG+X0qQDZfR/6hHiJkvcL/0PlK8ENtzD7H8WFvgmbtLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ovwJiS64qpFKqpRY29FTncclIBP1gpIBBb9Y6wKsrk=;
 b=L7VmEYWInV5YtJW+xTKvvi40w8KsGBGxYU0YWxwWMUJeZMpra1b43FDsLymA2uX45m2lyF3wmIXtyxGPb4O8liZuKNSv/zfPA0U9pIwBnC5cjNhQI5b+1jVfzfv4NPmQUbcg968Ib2UybX26UBYu4CliLzQa4qMaWH2xscdXEJLB9O9a+WvTum4dkGS/N1VjSlhtbhO9vWw75miB8kbIQD1sUU/STBwI11keCNcW+UX5leA9xIDlY7jXRvpqzyWL3lZy3eXU3cdS9Dg2H72n+riZtHrmUfAMi2coSFE3VOySVv+finQ4nXNyk37Qt81XbBgaEcC/rjW8yysw8xOuwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ovwJiS64qpFKqpRY29FTncclIBP1gpIBBb9Y6wKsrk=;
 b=34+LyI+U7B97slhQ1Bn2wIr9vAzAnI0WYYoaT5LmDryQQ6xuocdFx0XzoLMYduwU6g0ezOzGE341GNUUW4PcRyLF2h4w0Q2T1r88TJEUV4IN2N7jZDl8yF+mqsLLH8z4qqzUgd09DycJj7n6K2gesi7POz8JGMbaRS7jJt2PgV4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.15; Wed, 4 Dec
 2024 19:23:56 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::dfc2:2c4:b68b:3f76%5]) with mapi id 15.20.8230.010; Wed, 4 Dec 2024
 19:23:56 +0000
Content-Type: multipart/alternative;
 boundary="------------M0EcEUxje211WHkjxcD9f8n0"
Message-ID: <44c32fcb-4e93-47b7-80e0-c48355e84ec5@amd.com>
Date: Wed, 4 Dec 2024 12:23:54 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][master][scarthgap][styhead][PATCH v4 0/6]
 Add bbclass for xen launch config variables
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
 Christopher Clark <christopher.w.clark@gmail.com>,
 mark.hatle@kernel.crashing.org
References: <20241129222931.1300310-1-sandeep.gundlupet-raju@amd.com>
 <aa7326cf-be86-4d68-83dc-925907007b1a@amd.com>
 <CADkTA4PWP4xjFh7fWpWFae3Q9Bc4NWb+ENRxK7hJsKcGB6WYxg@mail.gmail.com>
Content-Language: en-US
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <CADkTA4PWP4xjFh7fWpWFae3Q9Bc4NWb+ENRxK7hJsKcGB6WYxg@mail.gmail.com>
X-ClientProxiedBy: CH0P223CA0026.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:610:116::27) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|DM6PR12MB4123:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b057ccf-fdd2-4282-48b8-08dd14993253
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|4022899009|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dSt2TEpzTlNlc2VJd01LSC9GOGNZbW9zaStSdy9BdDJkLzZ3TURmV0JtZXpX?=
 =?utf-8?B?U0dvKzN4NGJ0cEg3VEpwQ0NZV2w5d0U2ODlyenpRUFVGNWNYQWc5bmNQOEtW?=
 =?utf-8?B?U3IzcHZmL3h2UWwxY0NHTU5xR1BFQ1ZSZTV5OUhvanE4QVZneldXZDkyK3lE?=
 =?utf-8?B?NElsSkRaUG5sc0RJM1d1UVJZcnNkd21yeFQxZHpxM3IrQStFWStSMEpaQ3VZ?=
 =?utf-8?B?NUs5Z3p2QW56MkE0dkFqZ1BzRmFqYUpVNUlJV015MW9KK3hsQStGZmk3L09l?=
 =?utf-8?B?WmtoU1U2eTZTYXNiV0Z0d1YvVVduL2RCV0lRa0Vya1VWcldkZjhXd2dNRGhK?=
 =?utf-8?B?NzJkMHIwL2VSbERXNTlzODVrSlkzYjNlYm01eXc4R0NuNDBFa1BCYm1ocE9I?=
 =?utf-8?B?YWlYWExOa2dOQ09JWmhGSnA4c3l2c09TSUpORE5XdkhzTC9xWENTNGZnTC9Y?=
 =?utf-8?B?K3licEIyQmVTZ1JLYXMwR3FHQXlSZS9aMUZQUVE2dGQvU1dNMzZYUWdtSHcz?=
 =?utf-8?B?a0M4SHNTOW11bE1UWjI1WFpQN1gyR21ESDUyTFIzYWtVN3VjQ1FuUHA2bUIw?=
 =?utf-8?B?N3dPNXhIa2xwQzU4SUpWc0lJdGswRCtJYnpBVVB3bWlxcmwxSDc1K0doSXpx?=
 =?utf-8?B?d0Z1VUFJOFhXdWZJT1pmeTBhK3U2bjZINTB1bUpnVUFzV0dScVpTTllwOVg1?=
 =?utf-8?B?cjBNbklOc1pjM3l6WFBCWnhocktxVjhaaHRMVTdIM3lXKzNMVyt2TUN5Uzg0?=
 =?utf-8?B?Mm1YWFVGV0NUS3pGUDFMM1hGNDEvUHlwREdzOG8ycmVpb2svVjYwVkttaTNO?=
 =?utf-8?B?UnVXejFEQ1ZBYW1vTC9SaWVsaEZkKzUyaWlvMlRwTnhqRDFpdlJuclZjdUhJ?=
 =?utf-8?B?UFVsSkRWM3pkKzVkdjliQUhKb3hHNzVZZFF3UXA4Q2QvZHRJVmhEUUJBSkZF?=
 =?utf-8?B?Z0FkYUIvUnhrWHIrbldUclZudnlDdS94eTllc3VMWG9pUm1lb2hiTURpekd5?=
 =?utf-8?B?aDR1dTB2ZEZyOWEwV3JOQVcyVEZZZTRFOUliazg5YUhaNWF2RU1kZXhSOHFK?=
 =?utf-8?B?VFNvbFROSXU1TFRQYUtHV0VWNDVrbmJoNG5haUNIaU1SbnBjajFyTm9XTjB2?=
 =?utf-8?B?Mm50Yk1zWE5RQUcySGJOVGgyOHhyNjB5K2hTeUFsQjB6ZWJnNEhEaTFhQ01t?=
 =?utf-8?B?eFFvemJQYS8wcnY2WWNkdmFKQWMvSVRrSjFZeDRLTHZobFFSTU1vNHU4NzVx?=
 =?utf-8?B?VjMrUlIydEVPS01SdzFXVWE4T05VdzM3dUY3U3ZzOUJmZnl4c3gwczh3RU10?=
 =?utf-8?B?Z04vd1h0Vi9mVHVxVmgxZmllMS81SUxZNGtSVG10RVRWaGJuK25icEJIL3pS?=
 =?utf-8?B?N3gzRTVMNzJNSmlOUm5PZCtOWUkvREJjT2lTTHBraVVRektrVkswYlJvQ3Ux?=
 =?utf-8?B?OXBjSHNsQnY4Zm5HSVlYcmVWbXRFcGk1dURkaVVJNGtQQW9pejBJbTVFWGx4?=
 =?utf-8?B?Q2ZCUzZsV0lOcmpVRlFRMjIyZFBxWVIyK2xNbTBoWFBTNWRCMTRMenhDNCsw?=
 =?utf-8?B?TW5YRXQzVVdIcHF5MFpKLzFGdFB3Sk1SRWdXODU5RlUrWC9QWGw2blhQaFFF?=
 =?utf-8?B?ZU5qRUVhRHB3eGw2bXJNbzluQnBTczdRQVYzclZDblNxbHRmRlpZVzBZYjRx?=
 =?utf-8?B?MHI1eW9oTDlGT0s4ekQ4SW9iL05ldTdveFk2WHkyci9taGlOa3U4L2JIQjBF?=
 =?utf-8?Q?/LG9zJP9HzCiBTx4mQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aW9yVm0wZy9HRDFGQW80Y3hjVmhwbmJ3a2pZdjYxdWlUeWtqWTFXRmZPWUhl?=
 =?utf-8?B?R2xBMEoxOWhvSCt1TnhyS01sRkVlVkQ4V2dOWVhpaEhNWStTZzFMckdjNzZq?=
 =?utf-8?B?SlFiU2Q4cUliT3ZYRlVaeHh1ajluVG1TNUVSdlNaTU1tY1ZtRW15ZkNFU1hu?=
 =?utf-8?B?V2U1Q093dklFQjY1SC9FZGZ3cEFLb1pFZENOeHJiamlGS2drZkt4TzdqWG1h?=
 =?utf-8?B?Y1BzdlZNNG1kblRCT25wZGUvUlF2M2hORTZLR05Xd3FYUS9lbDFsY1AvTW5Q?=
 =?utf-8?B?NmRsUlVmN2Q1amk5Z0h1MWZDeGl5S0RKRDF1UHdRa3BtR3pxN0ErdDR4ZFNF?=
 =?utf-8?B?Ukp1QUp4eUVsL1F6bGxlV05zTmZscVN4bzdHU2RsVzRoRUxhVUs3T0pWTE0x?=
 =?utf-8?B?YWQ1KzVQUXFSVGYrMTlvWktKVzkvckdya0xOR3Y4OG45Q1R3bm1JaUVtS2Iy?=
 =?utf-8?B?UDR0K0Q4aDZNUHFIVndLSGlFY05USitkQndyWTM2eERCaFg5NzdLazYvMEVh?=
 =?utf-8?B?OFMwUEJPVmVBS1hlbllGZ21palRmRkZ2ZWpTNWVHTmQ3dlJCUks0V3N3ZjdU?=
 =?utf-8?B?RTVxT2dGbHNSbk9IRldRZDF4L0U2RE1Rc0NSQnpPRm1uSFhiUVEyVnl5V21R?=
 =?utf-8?B?TUhvdW9KOGYxc0VXeC9ZaUcxNGZ5QmUzK0J4QjZ6Z2x2VmRUYWhLcTgvd1hq?=
 =?utf-8?B?WWRuR0tTNTg5b2Q5WEs1SGZJb3pzZElPWG5zQWRyVmRYcTF2OWxiNUg0UWRJ?=
 =?utf-8?B?SndubXhVWks5QXJPSTc3WGhkaW9Da2lhSmh1NWNURUhvREJHaEp5MTB4S1Na?=
 =?utf-8?B?T1haTGNHdnUweE8yT2V2TWVmaXZZdGNreDNrcm12K0oveURKdnpQVmtNVzZ3?=
 =?utf-8?B?WFdNVG1EN1BzaXVrMXJaL3lXanF3MWlBYjZQc2RsTUFUdGpLR3NOUDBBcVlJ?=
 =?utf-8?B?N09oSmlwdk1neWJEWDJoQUlQa3JKUXNlZWEyQk9tUDVKb3RpdzYzQVlQY2xV?=
 =?utf-8?B?U1I3WjgrVHJVUUNlV1pZc0lNc0Jsa1F6b2RVbG16a0tSYWhIWkhweHFzV3N6?=
 =?utf-8?B?azJtSnR4ZlUyR2ZhVVRoK0wrMFVxTzRqcG5mQ3U2bzdqSDZWZVViNGl5QTd3?=
 =?utf-8?B?MEFpcjd0RTg5eW41Rk9zL0pLQjV0eW5GRDFaeUFVYzZMQks5VEJsQmJCVTNs?=
 =?utf-8?B?M1lyVTJpUklEa0Q2NldoN2I5RC9zK01vQ2EyYmRLVG5XbVZVR0x6ekRXcWZw?=
 =?utf-8?B?N3BLdVBCNWVFNFl6Y2FiT2N3Y055ckd5VjhxcmpBUldLT2VsZ2Y4TURxdGE1?=
 =?utf-8?B?K1dMNExXb08yN0hjcy8rbnF2aldLK1VOQlVVUmtDYWxzOUQzUE81cUlxR2pO?=
 =?utf-8?B?elJkc3JpUU9hNU5xTlYwOEhQUTgxai9oNlN0aTZ2NlZoU0FlZE1WcHRqTlNO?=
 =?utf-8?B?Z1c0Uk5JSlZOUmpyV3Q1L0tseXN6cG1aOUpGZnhqUG5haFpCSTE2aGp3WFM4?=
 =?utf-8?B?Yy9BSmhLaDJXUGlsTFdlOVFHQ3h0UU0xTklZVW40ZlFsc2RpR0Q3T0FCeDQv?=
 =?utf-8?B?ZzZmK3NENVNRMEYrQUl0OWk5cEUyN1VjRHc5VUFJNzF5a0ozUDJjYm53Uy9M?=
 =?utf-8?B?UjRhbWNUOFFTcHllcjlTWlZhY1VyUkt1dTRIVFJLSmpuUm5GNkFIYytFY3ow?=
 =?utf-8?B?bitXMTArR21PT1YyRnNRVmhaZGduS3htMVNUMWFNbXZIeDhqRmxGa1hvVlVj?=
 =?utf-8?B?NUluVFlYTXozS3daZUpHYUtSdnl1VHpwMmViQTUxSnlyR3cxWjFCODEyUjQv?=
 =?utf-8?B?VGZQY2Z2NGZxSGFzdmkvQmlsWGRvTVpLWUM4ak5lVDVrWGlURXdRcnQ3aUYr?=
 =?utf-8?B?TUNKM29ZKzBTK0hmbEYwMWs4TXB2YlZTYUlrVkcxNXV4ZEJNYVNLNTJaMG5P?=
 =?utf-8?B?c0M0QytqSWdteXJYRGVrUGd5K2FVbnJYdWxVUy82R3pvREVGYWlwMW5OSEs3?=
 =?utf-8?B?cDBHVlN5YXlMVmtneTlKbGtINmpKd0x5UHZMcW9jT28vb1M4bWhPWENyWEph?=
 =?utf-8?B?QlJRL1hOemNWbEZGU1EwR2NTZEJrNVFRVm9NdTIyRnFwTUFjc0JzQ3pGU0hi?=
 =?utf-8?Q?NL/WzFKuaHKTFATmF66d1JsR0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b057ccf-fdd2-4282-48b8-08dd14993253
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 19:23:56.5381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ZkvNK73yBNlGw1+MX+nWiv6c1sUXe+fO6y8OAo9BsDju6mzuar2FledPSOvNM9XT+gB6TAq1opXezQDj/1FbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4123
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 04 Dec 2024 19:24:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9040

--------------M0EcEUxje211WHkjxcD9f8n0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/4/2024 11:35 AM, Bruce Ashfield wrote:
>
>
> On Wed, Dec 4, 2024 at 1:07 PM Gundlupet Raju, Sandeep 
> <sandeep.gundlupet-raju@amd.com> wrote:
>
>     Hi Bruce, Chris,
>
>     Do you have any more comments on patches? If there are no comments
>     can
>     we get this patches merged?
>
>
> I haven't reviewed them yet and probably won't until next week.
>
> Generally speaking it isn't wise to attempt to rush a merge, in 
> particular when it has been 5 days with an extended weekend in the middle.
Ok sounds good.
>
> Cheers,
>
> Bruce
>
>
>     Thanks,
>
>     Sandeep
>
>     On 11/29/2024 3:29 PM, Sandeep Gundlupet Raju via
>     lists.yoctoproject.org <http://lists.yoctoproject.org>
>     wrote:
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
>     > Sandeep Gundlupet Raju (6):
>     >    xen-launch-config: Add bbclass for xen launch config variables
>     >    xen-rpi-u-boot-scr: Inherit xen-launch-config bbclass
>     >    xen-boot-env: Move xen variables to inc file
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
>     > -=-=-=-=-=-=-=-=-=-=-=-
>     > Links: You receive all messages sent to this group.
>     > View/Reply Online (#9026):
>     https://lists.yoctoproject.org/g/meta-virtualization/message/9026
>     > Mute This Topic: https://lists.yoctoproject.org/mt/109841154/8188369
>     > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>     <mailto:meta-virtualization%2Bowner@lists.yoctoproject.org>
>     > Unsubscribe:
>     https://lists.yoctoproject.org/g/meta-virtualization/unsub
>     [santraju@amd.com]
>     > -=-=-=-=-=-=-=-=-=-=-=-
>     >
>
>
>
> -- 
> - Thou shalt not follow the NULL pointer, for chaos and madness await 
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
--------------M0EcEUxje211WHkjxcD9f8n0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/4/2024 11:35 AM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CADkTA4PWP4xjFh7fWpWFae3Q9Bc4NWb+ENRxK7hJsKcGB6WYxg@mail.gmail.com">
      
      <div dir="ltr">
        <div dir="ltr">
          <div class="gmail_default" style="font-size:small"><br>
          </div>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Wed, Dec 4, 2024 at
            1:07 PM Gundlupet Raju, Sandeep &lt;<a href="mailto:sandeep.gundlupet-raju@amd.com" moz-do-not-send="true" class="moz-txt-link-freetext">sandeep.gundlupet-raju@amd.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi
            Bruce, Chris,<br>
            <br>
            Do you have any more comments on patches? If there are no
            comments can <br>
            we get this patches merged?<br>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class="gmail_default" style="font-size:small">I haven't
              reviewed them yet and probably won't until next week.</div>
            <div class="gmail_default" style="font-size:small"><br>
            </div>
            <div class="gmail_default" style="font-size:small">Generally
              speaking it isn't wise to attempt to rush a merge, in
              particular when it has been 5 days with an extended
              weekend in the middle.</div>
          </div>
        </div>
      </div>
    </blockquote>
    Ok sounds good.<br>
    <blockquote type="cite" cite="mid:CADkTA4PWP4xjFh7fWpWFae3Q9Bc4NWb+ENRxK7hJsKcGB6WYxg@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div>
            <div class="gmail_default" style="font-size:small"><br>
            </div>
            <div class="gmail_default" style="font-size:small">Cheers,</div>
            <div class="gmail_default" style="font-size:small"><br>
            </div>
            <div class="gmail_default" style="font-size:small">Bruce</div>
          </div>
          <div>&nbsp;</div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <br>
            Thanks,<br>
            <br>
            Sandeep<br>
            <br>
            On 11/29/2024 3:29 PM, Sandeep Gundlupet Raju via <a href="http://lists.yoctoproject.org" rel="noreferrer" target="_blank" moz-do-not-send="true">lists.yoctoproject.org</a>
            <br>
            wrote:<br>
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
            &gt; Sandeep Gundlupet Raju (6):<br>
            &gt;&nbsp; &nbsp; xen-launch-config: Add bbclass for xen launch config
            variables<br>
            &gt;&nbsp; &nbsp; xen-rpi-u-boot-scr: Inherit xen-launch-config
            bbclass<br>
            &gt;&nbsp; &nbsp; xen-boot-env: Move xen variables to inc file<br>
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
            &gt; -=-=-=-=-=-=-=-=-=-=-=-<br>
            &gt; Links: You receive all messages sent to this group.<br>
            &gt; View/Reply Online (#9026): <a href="https://lists.yoctoproject.org/g/meta-virtualization/message/9026" rel="noreferrer" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">https://lists.yoctoproject.org/g/meta-virtualization/message/9026</a><br>
            &gt; Mute This Topic: <a href="https://lists.yoctoproject.org/mt/109841154/8188369" rel="noreferrer" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">https://lists.yoctoproject.org/mt/109841154/8188369</a><br>
            &gt; Group Owner: <a href="mailto:meta-virtualization%2Bowner@lists.yoctoproject.org" target="_blank" moz-do-not-send="true">meta-virtualization+owner@lists.yoctoproject.org</a><br>
            &gt; Unsubscribe: <a href="https://lists.yoctoproject.org/g/meta-virtualization/unsub" rel="noreferrer" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">https://lists.yoctoproject.org/g/meta-virtualization/unsub</a>
            [<a href="mailto:santraju@amd.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">santraju@amd.com</a>]<br>
            &gt; -=-=-=-=-=-=-=-=-=-=-=-<br>
            &gt;<br>
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
    </blockquote>
  </body>
</html>

--------------M0EcEUxje211WHkjxcD9f8n0--

