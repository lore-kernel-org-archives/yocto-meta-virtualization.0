Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.11495.1601345141761325886
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Sep 2020 19:05:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DGicsWT1;
 spf=softfail (domain: windriver.com, ip: 198.145.29.25, mailfrom: mingli.yu@windriver.com)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 2364638C132B
	for <meta-virtualization@yoctoproject.org>; Mon, 28 Sep 2020 19:05:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hCiBSLS4T+tr+97vFDuThqzezi74NBx3qHTkZd9dsUwfQ/GZ1nGIu1IlPstumuKQAW4unPrRgkl07rQStJKV0GAuUxBwU5uzjsuKWbctPBcl7dHT+ZTAyJVYifdm2S52oYZXm3t8fEDxH0O9uBBQvt4Mlu7BvpQOGR68cdR3DW9lhLc2DdqBnP3wsoa7cBBE2ou/XFrZpyPy6wtnPAgxFs29ZydLY9mp8B2tlXJ6pFyfJGZs0BSt6IO4LtmAG6RU3bUr71JJdp8rIweI3ID2YI+mofnaTyNVHK8pXzazt98FYmSN4bMJ5in5vtbQMcyF8v+uO/IGcSBW5x4frBe2wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xp0MJ1ox0+zfFYeIviLLELeuyJnAuOt7R7nchls7fA0=;
 b=MRhS5ZvA0XrJ/hoO89FpmF9g/uLJ6NV0+u/H0BsUGA22fdKT14s7g83EjAnAtvTRRb71z/KDPRBFyISBS2+G1xxQQyeRFk8KatLL88+13tW6q/7ASGsnbvZBj5zz/1jS5zE4BP9zDpvUsc81q6h4QjsMY9xafD8Kw8lkUjCqrnD/P91tfq/n8PJZ2GW6EevopdQ5MVdvU4+SGH4ur+SIoeMKCjuvf6pZ34L2Vbk0dryfSGQw28fNoRZ8Br3cybvZVe14LeU7+bGJqXwOaZaByL/W7DVkB5TcIqR4PyPpon5i9aQ81r1FcqRMjGf40pKxUXec/ZyRaGiH2F8BKLr4Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xp0MJ1ox0+zfFYeIviLLELeuyJnAuOt7R7nchls7fA0=;
 b=DGicsWT1Pv85rMgKrDK3lWentfeteY+m4DSvoMCB03yUkvVYBixL2JY3ZR9Yt3jPGWs6XkLCiiMcANXDSAxLS11MP+HB7q2a0iB81t/G8j/gWjIsBKpDzprZtquxKlwexTlu/sUfnkhl4JaVwMU2wI3jZ6X/+pKj7r0uMaa0vtQ=
Authentication-Results: yoctoproject.org; dkim=none (message not signed)
 header.d=none;yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BYAPR11MB2919.namprd11.prod.outlook.com (2603:10b6:a03:8d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.29; Tue, 29 Sep
 2020 02:05:39 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::9425:b061:32a:a98b]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::9425:b061:32a:a98b%7]) with mapi id 15.20.3412.028; Tue, 29 Sep 2020
 02:05:39 +0000
Subject: Re: [meta-virtualization] [PATCH v2] lxc: remove deprecated options in lxc*.service
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
References: <16370E1C8879D0E3.12779@lists.yoctoproject.org>
 <20200923075309.46978-1-mingli.yu@windriver.com>
 <CADkTA4NfOEhuR1JWWkJPAZvNKU6kk_Prz9kejRwBYefqxsFo_g@mail.gmail.com>
 <e3483726-1d87-f7f6-0ff2-515e94ba4ff1@windriver.com>
 <CADkTA4MWs1Bd2Yn-QEkUbn4rzNuCK-D9pUu=AzQdWRO7omw1xA@mail.gmail.com>
 <65e4ab88-8bc0-ea50-42e1-8a46c7c8f839@windriver.com>
 <CADkTA4MmW6TApw7z+SOPxcC7_VaAZjtKLQeX-_rEoWjMOu+OgQ@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <7bff6791-b6b7-15b8-7163-3ec35ac563ed@windriver.com>
Date: Tue, 29 Sep 2020 10:04:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CADkTA4MmW6TApw7z+SOPxcC7_VaAZjtKLQeX-_rEoWjMOu+OgQ@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: YTOPR0101CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::38) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.138] (60.247.85.82) by YTOPR0101CA0025.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Tue, 29 Sep 2020 02:05:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50ad97e0-ab54-4c63-aaeb-08d8641c29c7
X-MS-TrafficTypeDiagnostic: BYAPR11MB2919:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB29195805A2699D9551AA3852F1320@BYAPR11MB2919.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MjCNDEdcYXJGPh1ZUD+5zJiy3b5p5/NbDsfSXbUoG5rCEXXT/nx4RAVVXpq4BNHq8mSdeUFzZyS/wpDagbW5ml/FdoZT6lsE/xljg+gc9sCWroHaBrbJU//Ns/u6i8r1Ddfxghf32YsuQpw/VHTgTQOb0V+9Ru4xiQffgsIBhTRDw/avMZSItt7qlZJBQC2gMQ+B3u5lAQ6B0qu0wPSGxsdvR7VoXpO5i9TEkfrwUC0JJpzU5acAIAnRYBaXDnueVbIQNW9jhwFe/DflgouU3n16Ey46AcgJEAVWuv1jhvWf41r15iU3DJ1DUrDacIQWpgJGSGVWlrgD5Poe+bK11ppZQ2jCSjKOoIcljgp4omRJyU2jdOeQXxYfHh9d5RqbUQn9R7iSnSeJJhCoBHRJXP2DVfmTAgaZsBPCaJjKsMau01Ku/DmbDl0v4K6Rutq9G34+Yh2sIh3q+9IEVwzRr4x2uJQqJEVgQlstEqfN38+aM6BuQwuwxem97XRUuvfBqf138n6VdXgQiwQEw9aYYA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39850400004)(396003)(376002)(136003)(16526019)(186003)(26005)(6916009)(478600001)(6706004)(53546011)(5660300002)(66556008)(31686004)(6486002)(52116002)(966005)(8676002)(8936002)(66476007)(2906002)(16576012)(316002)(86362001)(956004)(31696002)(2616005)(83380400001)(36756003)(6666004)(4326008)(66946007)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	mTOYfGOcG7IJlKZ8CMSfJCNgVb+0PSG900A4vTlGSSYuWEHqjMmmiNZn1Xl5JU3dP9PX8QCmodkRaxLREj4ah2XoGsX9b2EnCnyVrQLOt0eXbNnUheAV979MXEHxW7wRpmJaX25DRkTZpyn0XpQ0o9fEIquihGpOW58D6YdWJgSarKtIUavvpcSCYcOEthyX4EdMbK5X/thcy/rSJWsGkCLrS4mjdhxfJf+w/z7GWR0VHvdumsb2rvi9NQxBS7Gvl7mpQiGOgdqF2QehcUdSK7YrDnmmLgCzrHQLN133979ntCu99MHGPxuK5BfM/fFjLBppAk1lirFjOxb/KeUgs4HBaEz5lIJonBmQkO5ocn2vBJLTRZHuji2T7fzoZfl9qXuDZAKVtYiLMHZ8jiUvaqv9LxhpkPFmn1rmbcL3OiIGlBBwd/4ehW9JlWRW7t8SHVP/Qb/6sRAlBOIGXM26mP97W51ljDv7qfpyqBhY+q6s8Ch55jsWVQlDKijKB7XyFbToEvdROo6V4mO4M/XXuM1SM01YouFs5cyAZXUwA8mNwOT5QtLKUMyibcK+/1aCD0vCWxtckE9MT29yFvgFV1lU1MV9XUYEbfSzOZ12waXNG0O6LbY3NNZIqG4Irx+RHamDkcqmvjVHk1YXuh414w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50ad97e0-ab54-4c63-aaeb-08d8641c29c7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2020 02:05:39.7627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hMW9zighhwTNQBO1kLkc2g9JuFbth6hFmJc+pxW+r3UzJ6g7+QfAL0ozNV+cprSEz2Rpf7b/EWGDWfsQ2eNrnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2919
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 9/28/20 8:44 PM, Bruce Ashfield wrote:
> On Mon, Sep 28, 2020 at 1:52 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>>
>> Hi Bruce,
>>
>> On 9/28/20 10:42 AM, Bruce Ashfield wrote:
>>> On Wed, Sep 23, 2020 at 9:40 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>>>>
>>>> Hi Bruce,
>>>>
>>>> On 9/23/20 8:40 PM, Bruce Ashfield wrote:
>>>>> On Wed, Sep 23, 2020 at 3:54 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>>>>>>
>>>>>> From: Mingli Yu <mingli.yu@windriver.com>
>>>>>>
>>>>>> Remove deprecated options in lxc*.service to silence below warning:
>>>>>>     # systemctl status lxc
>>>>>>     [snip]
>>>>>>     /usr/lib/systemd/system/lxc.service:17: Standard output type syslog is obsolete, automatically updating to journal. Please update your unit file, and consider removing the setting altogether.
>>>>>>     /usr/lib/systemd/system/lxc.service:18: Standard output type syslog is obsolete, automatically updating to journal. Please update your unit file, and consider removing the setting altogether.
>>>>>
>>>>> What's the delta to v1 ?
>>>>
>>>
>>> This should be logged in the temporary section of the patch, that way
>>> I can track what is changing through a series.
>>>
>>> That being said, I went to apply this patch, and it isn't against the
>>> lxc version that we have in master.
>>>
>>> Can you update and resubmit ?
>>
>> No problem, I can update the patch if need.
>>
>> But the patch is created against the latest code on master for lxc after
>> I checked. I don't quite understand what problem you encounter when
>> merge this patch.
> 
> In v2, I see:
> 
> diff --git a/recipes-containers/lxc/lxc_4.0.2.bb
> b/recipes-containers/lxc/lxc_4.0.2.bb
> index d0ead81..ead6bb2 100644
> --- a/recipes-containers/lxc/lxc_4.0.2.bb
> +++ b/recipes-containers/lxc/lxc_4.0.2.bb
> 
> Are you not seeing lxc_4.0.4.bb in your master checkout ?
> 
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/recipes-containers/lxc/lxc_4.0.4.bb

Hi Bruce,

Thanks for your pointing, v3 is incoming.

Thanks,

> 
> Bruce
> 
>>
>> Thanks,
>>
>>>
>>> Bruce
>>>
>>>> The v1 only have one patch
>>>>      file://0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch
>>>>
>>>>
>>>> And the v2 have the below two patch files.
>>>>     file://0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch
>>>>     file://0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
>>>>
>>>> Thanks,
>>>>
>>>>>
>>>>> Bruce
>>>>>
>>>>>>
>>>>>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>>>>> ---
>>>>>>     ...setting-regarding-the-Standard-Outpu.patch | 35 +++++++++++++++++++
>>>>>>     ...ed-options-in-lxc.service-fixes-3527.patch | 31 ++++++++++++++++
>>>>>>     recipes-containers/lxc/lxc_4.0.2.bb           |  2 ++
>>>>>>     3 files changed, 68 insertions(+)
>>>>>>     create mode 100644 recipes-containers/lxc/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
>>>>>>     create mode 100644 recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch
>>>>>>
>>>>>> diff --git a/recipes-containers/lxc/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch b/recipes-containers/lxc/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
>>>>>> new file mode 100644
>>>>>> index 0000000..ab97422
>>>>>> --- /dev/null
>>>>>> +++ b/recipes-containers/lxc/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
>>>>>> @@ -0,0 +1,35 @@
>>>>>> +From a7a92a06a47322dee45664db5c7bfa68b2b95edb Mon Sep 17 00:00:00 2001
>>>>>> +From: Mingli Yu <mingli.yu@windriver.com>
>>>>>> +Date: Wed, 23 Sep 2020 07:03:02 +0000
>>>>>> +Subject: [PATCH] Remove obsolete setting regarding the Standard Output
>>>>>> +
>>>>>> +The Standard output type "syslog" is obsolete, causing a warning since systemd
>>>>>> +version 246 [1].
>>>>>> +
>>>>>> +Please consider using "journal" or "journal+console"
>>>>>> +
>>>>>> +[1] https://github.com/systemd/systemd/blob/master/NEWS#L202
>>>>>> +
>>>>>> +Upstream-Status: Submitted [https://github.com/lxc/lxc/pull/3541]
>>>>>> +
>>>>>> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>>>>> +---
>>>>>> + config/init/systemd/lxc@.service.in         | 2 --
>>>>>> + 1 files changed, 2 deletions(-)
>>>>>> +
>>>>>> +diff --git a/config/init/systemd/lxc@.service.in b/config/init/systemd/lxc@.service.in
>>>>>> +index a2aa2211f..21ce64aef 100644
>>>>>> +--- a/config/init/systemd/lxc@.service.in
>>>>>> ++++ b/config/init/systemd/lxc@.service.in
>>>>>> +@@ -14,8 +14,6 @@ ExecStop=@BINDIR@/lxc-stop -n %i
>>>>>> + # Environment=BOOTUP=serial
>>>>>> + # Environment=CONSOLETYPE=serial
>>>>>> + Delegate=yes
>>>>>> +-StandardOutput=syslog
>>>>>> +-StandardError=syslog
>>>>>> +
>>>>>> + [Install]
>>>>>> + WantedBy=multi-user.target
>>>>>> +--
>>>>>> +2.26.2
>>>>>> +
>>>>>> diff --git a/recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch b/recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch
>>>>>> new file mode 100644
>>>>>> index 0000000..2957680
>>>>>> --- /dev/null
>>>>>> +++ b/recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch
>>>>>> @@ -0,0 +1,31 @@
>>>>>> +From 0c4cd88d4a19d27ba9b5d2c8fa4d482d78211c35 Mon Sep 17 00:00:00 2001
>>>>>> +From: graysky <graysky@archlinux.us>
>>>>>> +Date: Fri, 21 Aug 2020 06:33:49 -0400
>>>>>> +Subject: [PATCH] remove deprecated options in lxc.service fixes #3527
>>>>>> +
>>>>>> +Remove deprecated options in lxc.service fixes #3527
>>>>>> +
>>>>>> +Upstream-Status: Backport
>>>>>> +
>>>>>> +Signed-off-by: graysky <graysky@archlinux.us>
>>>>>> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>>>>> +---
>>>>>> + config/init/systemd/lxc.service.in | 2 --
>>>>>> + 1 file changed, 2 deletions(-)
>>>>>> +
>>>>>> +diff --git a/config/init/systemd/lxc.service.in b/config/init/systemd/lxc.service.in
>>>>>> +index e3745dc2d..397a6c4d0 100644
>>>>>> +--- a/config/init/systemd/lxc.service.in
>>>>>> ++++ b/config/init/systemd/lxc.service.in
>>>>>> +@@ -14,8 +14,6 @@ ExecReload=@LIBEXECDIR@/lxc/lxc-apparmor-load
>>>>>> + # Environment=BOOTUP=serial
>>>>>> + # Environment=CONSOLETYPE=serial
>>>>>> + Delegate=yes
>>>>>> +-StandardOutput=syslog
>>>>>> +-StandardError=syslog
>>>>>> +
>>>>>> + [Install]
>>>>>> + WantedBy=multi-user.target
>>>>>> +--
>>>>>> +2.26.2
>>>>>> +
>>>>>> diff --git a/recipes-containers/lxc/lxc_4.0.2.bb b/recipes-containers/lxc/lxc_4.0.2.bb
>>>>>> index d0ead81..ead6bb2 100644
>>>>>> --- a/recipes-containers/lxc/lxc_4.0.2.bb
>>>>>> +++ b/recipes-containers/lxc/lxc_4.0.2.bb
>>>>>> @@ -47,6 +47,8 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>>>>>>            file://templates-use-curl-instead-of-wget.patch \
>>>>>>            file://tests-our-init-is-not-busybox.patch \
>>>>>>            file://tests-add-no-validate-when-using-download-template.patch \
>>>>>> +       file://0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch \
>>>>>> +       file://0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch \
>>>>>>            file://dnsmasq.conf \
>>>>>>            file://lxc-net \
>>>>>>            "
>>>>>> --
>>>>>> 2.26.2
>>>>>>
>>>>>>
>>>>>> 
>>>>>>
>>>>>
>>>>>
>>>
>>>
>>>
> 
> 
> 
