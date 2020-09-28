Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.30095.1601272357497376674
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 27 Sep 2020 22:52:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bkJKCvrp;
 spf=softfail (domain: windriver.com, ip: 198.145.29.25, mailfrom: mingli.yu@windriver.com)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2088.outbound.protection.outlook.com [40.107.243.88])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 7DB8A38C087A
	for <meta-virtualization@yoctoproject.org>; Sun, 27 Sep 2020 22:52:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJLHRA8IBsQLJAY+G3qhHGBZQRS75zucZ+SY2b4kog4AmZBPv5A7vk9x/sTWTxeq7qk/pHXkfS3NyaPN3ZCUCyU7TRfUTSjGUYUI5b5Ovmi+vs6bZ8XBREE1OnAJzu+pctf1IBpp4k9CYSFsenP964LmzI/S2KjyFU61yNp/g71z0MhlWh0GALqwntZQ1DnXvK4U7OQRUxTMY9fsZcpuPH7q6lJwa7jkcsO+KeP3lR7ewzf290eM/n0vEvI81AwhROZtPOPZ3xu7MDvY/IwOlYlgAEUpnmj4SMRsFySuTOCf1lzohnja6ryQzQ1vufmsJ+FVh8C36ZDrkGah6ET8pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3zIxhK0simGXU52hgv6xesQLKoh6lHKT4PUCD8pwJo=;
 b=A4Gp+/IgQfgIwSNdTjFYhWvYf9ehdg1x6YOqnno9KImLzOmPogew5mO7UIVxRBAM3V8WJ9fR9CybxPUGtsEa4Xh/scft0MsSDYMjNnkaLaWrF4yOCis62rfWUmc1nVXORBtQx+HY3B5UM7dzrYaCF2yn15XlhLvztJ8YcCpoo1fALO3Izwg+pWWzc+XICF5S9roVJn/czVLtspmLG5AYsjyBQ7KTtO06DGjyBMFiTwKlt3EtAJruz+tO2+zYQEkWkXxi2Fr8cIwi5WwLZLbU07IGmr7ezTlsXqrLV4pkVcVlubclMkOxv3JbNcqiyocu+JYD3i6PJH0TR3px7jj1yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3zIxhK0simGXU52hgv6xesQLKoh6lHKT4PUCD8pwJo=;
 b=bkJKCvrp3Xr5Cv/rey/D/BLvK2P9cJHU3QeqpFZfxXgo3LLtqpfIfjEH3/P77kRZmWdCaGadID49eFCxAhZVUafETYw8DaVqK3Id474zxFTPgOUob83AB5xG3mlP0Nx1itZTJsDvhjgARsTbglfcSPYF9xuafRYUFQVu7FvD7og=
Authentication-Results: yoctoproject.org; dkim=none (message not signed)
 header.d=none;yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BYAPR11MB3720.namprd11.prod.outlook.com (2603:10b6:a03:fc::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Mon, 28 Sep
 2020 05:52:33 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::9425:b061:32a:a98b]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::9425:b061:32a:a98b%7]) with mapi id 15.20.3412.028; Mon, 28 Sep 2020
 05:52:33 +0000
Subject: Re: [meta-virtualization] [PATCH v2] lxc: remove deprecated options in lxc*.service
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
References: <16370E1C8879D0E3.12779@lists.yoctoproject.org>
 <20200923075309.46978-1-mingli.yu@windriver.com>
 <CADkTA4NfOEhuR1JWWkJPAZvNKU6kk_Prz9kejRwBYefqxsFo_g@mail.gmail.com>
 <e3483726-1d87-f7f6-0ff2-515e94ba4ff1@windriver.com>
 <CADkTA4MWs1Bd2Yn-QEkUbn4rzNuCK-D9pUu=AzQdWRO7omw1xA@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <65e4ab88-8bc0-ea50-42e1-8a46c7c8f839@windriver.com>
Date: Mon, 28 Sep 2020 13:50:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CADkTA4MWs1Bd2Yn-QEkUbn4rzNuCK-D9pUu=AzQdWRO7omw1xA@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: YT1PR01CA0110.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::19) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.138] (60.247.85.82) by YT1PR01CA0110.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Mon, 28 Sep 2020 05:52:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 189a49da-0bbf-47a5-fed7-08d86372b197
X-MS-TrafficTypeDiagnostic: BYAPR11MB3720:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3720CE9A13CA585A710DB791F1350@BYAPR11MB3720.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	paHiFeviD50ERNLoCBNlrOXUn5PCNmLTjsRzxDqAPElBQ4yFi3ncgUcNuivxkCbgfc81YDjcj4c2aGQHm2jtwMJvsGxQ8bVr4HQ6wqsBJHuab9GSzQp4rDZRmWJIfiX64b2v9ih3efJdXHqYaUYryjr9RA80/tjRQBFoxVcaaeGfXN/kxX28ehxcj6hR++e9bCbFbr5rN3OQynG8EjQn5wN68Um76D0qH2tnzQ6zRzZ+vWWo9/FgS3CZ5kNMLL5G2eRDYzPoxjQj0g/MWa25sHEcpgRAADX4JiZXJlrGaAalxHlI4gwNwyu9DNvqwa3DcZB3UX+kAUvadq1SlWggi9Xm8wBNBm1PCuVqdWfjsxELZF4E/SnxQI0oMc8fwBQljB/nF/iNYo67lJgj0V0k9k76W/hknPFfEjvYlekcTHueOZ04+/JPcIlnLvf8n+RvoLLyuh3LUPXuX5GqrHonOzdfRO0PfzKUinFbkbi2Hij/I7Y2bcZlzu6xz+iJCg6FP259qsWdD/3Qoqjd92yDTA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39840400004)(346002)(376002)(396003)(366004)(5660300002)(8936002)(2906002)(36756003)(2616005)(6666004)(52116002)(31686004)(6916009)(6706004)(4326008)(16526019)(186003)(26005)(53546011)(956004)(6486002)(16576012)(316002)(478600001)(8676002)(31696002)(66946007)(66556008)(66476007)(966005)(83380400001)(86362001)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	FDEaU9T7aODtsNU66jjlhKuHjg/llrCLTX0iC1rlHWjaSUQYy78MUbkABLX9ogzdNRfbN5NTCtf7ourJ1pgI2VFYZMr34KdvkLSe/p10+4RrKEt4LEIcFJHIM7Vhvu5oT8qpMOr9oSrMIaQWXUJ7br4gLHuoxssg7971vOkc9yJ9G524NI4J3zFVyDvvNpjBh8qimoc+4L9Mqi0ytuqSL5+AExOODrZTNuxvvBmE2aUCt30VpswhJ6xw7EIsZMLECfZnod0MmIwIkhizvP4XwMVhcoYz/ypNx4TavBW685HF65aWiO2yWH8aiNyK/JxASVRILmk+S4pJV97+ff/slndgxYN86sGfVtBlDtqZ+7JFQXA4dBUqqgkZg1ewiFwMXf/5n65qagxI2ewjj1QxVRFrQw0d3XzkgR3vIGUdXjpPFg64veFiqI5XAp6Jdfq0O3/h9gLXsD0eiaNnfAxMVkdArjAELmD6/U2R3ls9UIX5FBV60pA+iX5xapj2oskXo4gxO3icl3oqwdMBvaeLvyf/KOLV+6/MhU3WNoGbZ/PS4PXog+9eS8mNdLJhXAjKoPGrkLta1pL30NstWseddrn1p5Pviazpd11C9gX0OAey8a4kf8Jbix1u0i6RHuu0uDvgLsayisxgwelAvUKLug==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 189a49da-0bbf-47a5-fed7-08d86372b197
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2020 05:52:33.2933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TMObiofdn/VL2ERZvVwk7CialkUVz8/fOycbm/852xVKRr0ZNaayXAoFuCI3C8BKGKRfPae+HsXKuXA05PPAug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3720
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Bruce,

On 9/28/20 10:42 AM, Bruce Ashfield wrote:
> On Wed, Sep 23, 2020 at 9:40 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>>
>> Hi Bruce,
>>
>> On 9/23/20 8:40 PM, Bruce Ashfield wrote:
>>> On Wed, Sep 23, 2020 at 3:54 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>>>>
>>>> From: Mingli Yu <mingli.yu@windriver.com>
>>>>
>>>> Remove deprecated options in lxc*.service to silence below warning:
>>>>    # systemctl status lxc
>>>>    [snip]
>>>>    /usr/lib/systemd/system/lxc.service:17: Standard output type syslog is obsolete, automatically updating to journal. Please update your unit file, and consider removing the setting altogether.
>>>>    /usr/lib/systemd/system/lxc.service:18: Standard output type syslog is obsolete, automatically updating to journal. Please update your unit file, and consider removing the setting altogether.
>>>
>>> What's the delta to v1 ?
>>
> 
> This should be logged in the temporary section of the patch, that way
> I can track what is changing through a series.
> 
> That being said, I went to apply this patch, and it isn't against the
> lxc version that we have in master.
> 
> Can you update and resubmit ?

No problem, I can update the patch if need.

But the patch is created against the latest code on master for lxc after 
I checked. I don't quite understand what problem you encounter when 
merge this patch.

Thanks,

> 
> Bruce
> 
>> The v1 only have one patch
>>     file://0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch
>>
>>
>> And the v2 have the below two patch files.
>>    file://0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch
>>    file://0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
>>
>> Thanks,
>>
>>>
>>> Bruce
>>>
>>>>
>>>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>>> ---
>>>>    ...setting-regarding-the-Standard-Outpu.patch | 35 +++++++++++++++++++
>>>>    ...ed-options-in-lxc.service-fixes-3527.patch | 31 ++++++++++++++++
>>>>    recipes-containers/lxc/lxc_4.0.2.bb           |  2 ++
>>>>    3 files changed, 68 insertions(+)
>>>>    create mode 100644 recipes-containers/lxc/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
>>>>    create mode 100644 recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch
>>>>
>>>> diff --git a/recipes-containers/lxc/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch b/recipes-containers/lxc/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
>>>> new file mode 100644
>>>> index 0000000..ab97422
>>>> --- /dev/null
>>>> +++ b/recipes-containers/lxc/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
>>>> @@ -0,0 +1,35 @@
>>>> +From a7a92a06a47322dee45664db5c7bfa68b2b95edb Mon Sep 17 00:00:00 2001
>>>> +From: Mingli Yu <mingli.yu@windriver.com>
>>>> +Date: Wed, 23 Sep 2020 07:03:02 +0000
>>>> +Subject: [PATCH] Remove obsolete setting regarding the Standard Output
>>>> +
>>>> +The Standard output type "syslog" is obsolete, causing a warning since systemd
>>>> +version 246 [1].
>>>> +
>>>> +Please consider using "journal" or "journal+console"
>>>> +
>>>> +[1] https://github.com/systemd/systemd/blob/master/NEWS#L202
>>>> +
>>>> +Upstream-Status: Submitted [https://github.com/lxc/lxc/pull/3541]
>>>> +
>>>> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>>> +---
>>>> + config/init/systemd/lxc@.service.in         | 2 --
>>>> + 1 files changed, 2 deletions(-)
>>>> +
>>>> +diff --git a/config/init/systemd/lxc@.service.in b/config/init/systemd/lxc@.service.in
>>>> +index a2aa2211f..21ce64aef 100644
>>>> +--- a/config/init/systemd/lxc@.service.in
>>>> ++++ b/config/init/systemd/lxc@.service.in
>>>> +@@ -14,8 +14,6 @@ ExecStop=@BINDIR@/lxc-stop -n %i
>>>> + # Environment=BOOTUP=serial
>>>> + # Environment=CONSOLETYPE=serial
>>>> + Delegate=yes
>>>> +-StandardOutput=syslog
>>>> +-StandardError=syslog
>>>> +
>>>> + [Install]
>>>> + WantedBy=multi-user.target
>>>> +--
>>>> +2.26.2
>>>> +
>>>> diff --git a/recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch b/recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch
>>>> new file mode 100644
>>>> index 0000000..2957680
>>>> --- /dev/null
>>>> +++ b/recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch
>>>> @@ -0,0 +1,31 @@
>>>> +From 0c4cd88d4a19d27ba9b5d2c8fa4d482d78211c35 Mon Sep 17 00:00:00 2001
>>>> +From: graysky <graysky@archlinux.us>
>>>> +Date: Fri, 21 Aug 2020 06:33:49 -0400
>>>> +Subject: [PATCH] remove deprecated options in lxc.service fixes #3527
>>>> +
>>>> +Remove deprecated options in lxc.service fixes #3527
>>>> +
>>>> +Upstream-Status: Backport
>>>> +
>>>> +Signed-off-by: graysky <graysky@archlinux.us>
>>>> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>>> +---
>>>> + config/init/systemd/lxc.service.in | 2 --
>>>> + 1 file changed, 2 deletions(-)
>>>> +
>>>> +diff --git a/config/init/systemd/lxc.service.in b/config/init/systemd/lxc.service.in
>>>> +index e3745dc2d..397a6c4d0 100644
>>>> +--- a/config/init/systemd/lxc.service.in
>>>> ++++ b/config/init/systemd/lxc.service.in
>>>> +@@ -14,8 +14,6 @@ ExecReload=@LIBEXECDIR@/lxc/lxc-apparmor-load
>>>> + # Environment=BOOTUP=serial
>>>> + # Environment=CONSOLETYPE=serial
>>>> + Delegate=yes
>>>> +-StandardOutput=syslog
>>>> +-StandardError=syslog
>>>> +
>>>> + [Install]
>>>> + WantedBy=multi-user.target
>>>> +--
>>>> +2.26.2
>>>> +
>>>> diff --git a/recipes-containers/lxc/lxc_4.0.2.bb b/recipes-containers/lxc/lxc_4.0.2.bb
>>>> index d0ead81..ead6bb2 100644
>>>> --- a/recipes-containers/lxc/lxc_4.0.2.bb
>>>> +++ b/recipes-containers/lxc/lxc_4.0.2.bb
>>>> @@ -47,6 +47,8 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>>>>           file://templates-use-curl-instead-of-wget.patch \
>>>>           file://tests-our-init-is-not-busybox.patch \
>>>>           file://tests-add-no-validate-when-using-download-template.patch \
>>>> +       file://0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch \
>>>> +       file://0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch \
>>>>           file://dnsmasq.conf \
>>>>           file://lxc-net \
>>>>           "
>>>> --
>>>> 2.26.2
>>>>
>>>>
>>>> 
>>>>
>>>
>>>
> 
> 
> 
