Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.54])
 by mx.groups.io with SMTP id smtpd.web10.2782.1586404387276945800
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Apr 2020 20:53:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=iDouGqXI;
 spf=pass (domain: windriver.com, ip: 40.107.237.54, mailfrom: yanfei.xu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obyBrWqNxWQxbmiWrZhS8WqhKvNPquOv7xn14+woeZw2vjcq+TuHoUrvXnf5aUbCr3PHpQw/2QNbQxyEVZPLhl2SGV+MsbXn0DXKTWgqt4Zn2eCuUt9SkRviK5Z1dK50mlZCWObeVksmFBa7VDzJXDgT5n7qFmZBwmgnNkyWPl4/GxVMxzhAori230HzJVYPgj0Q34O7KncpPqX+I9k5toxbsI7rLg5sI1MiGIyZaI80rQu7u31HGRTqB+qTEeWHJ27cK32AW8wTvKmnbuEi587zV4s1eI+WTbXOF8HXUEcwoVWh0RJvH6WdXCXmEB4nUDfaUSFwWEvR6W4CdPhj5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RRGE2kD1HbZEfoTUyRKVjyhg5jB9dM9xqBQVgpHDF4=;
 b=QdTQ6ai3PBvm23i957Z0pBt9hRX5PIosiuKCfs45ciieunT7I2r8KvhNTFBSYvKulkVM6QTGEKqa0FEpKs9FRoK7HwhtkHVB9DTGLU9HIUAXzbUDiqR+IatBnh6BhaVA7uTF8y4JgSltz37lS+0hkHL1Y7/rcQ0sd5fSLiUr+gk9j2vmq7HAQMrTKYHkDtWbnqALKlLj31B8RGkY7pR8kez3dV9ELhcDaMNaim6R+lHSpCEpDYuY7CHgfUgGCcvcjWBqPHmgyMzbnd391Juego+Mplrf2BISFtF4YxxAbk6WD3uWKAUizf9u9K1y5iIce09CPYiaYNOgoRkLzdi+MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RRGE2kD1HbZEfoTUyRKVjyhg5jB9dM9xqBQVgpHDF4=;
 b=iDouGqXIdV/OEiqinMi80i+wYMc9gM1vThDgG2XRupkzqkc+FyGpcZG5sD0lZf7X0tHmG8HgZObuQz9tTXgK1rRHTXFBhX0Y11sJH//lGtCAsRgcsAA7PY82DJrLiBK2Nbmk0HIgS+/1aQtzEBa2V9ot1us/mJVWQJZPIZpZM5M=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yanfei.Xu@windriver.com; 
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by BY5PR11MB4418.namprd11.prod.outlook.com (2603:10b6:a03:1cc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.19; Thu, 9 Apr
 2020 03:53:04 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::80a8:667c:426b:6917]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::80a8:667c:426b:6917%7]) with mapi id 15.20.2878.022; Thu, 9 Apr 2020
 03:53:03 +0000
Subject: Re: [meta-virtualization][PATCH] lxc: Fix containers failed to start with LXC 3.2.1
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20200406042049.28540-1-yanfei.xu@windriver.com>
 <CADkTA4PNF2NoigLJrt1cTFQKoV76Feb27fPzPK+1pGgh7v4vOw@mail.gmail.com>
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
Message-ID: <5db5f565-39b0-1161-85b1-af636de91584@windriver.com>
Date: Thu, 9 Apr 2020 11:52:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
In-Reply-To: <CADkTA4PNF2NoigLJrt1cTFQKoV76Feb27fPzPK+1pGgh7v4vOw@mail.gmail.com>
X-ClientProxiedBy: BYAPR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:74::33) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
Return-Path: yanfei.xu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.160] (60.247.85.82) by BYAPR05CA0056.namprd05.prod.outlook.com (2603:10b6:a03:74::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.6 via Frontend Transport; Thu, 9 Apr 2020 03:53:02 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 043d8ba4-8efb-43f5-b52c-08d7dc39813e
X-MS-TrafficTypeDiagnostic: BY5PR11MB4418:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB441808AA9532F89AF67347BBE4C10@BY5PR11MB4418.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0368E78B5B
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(376002)(346002)(39850400004)(396003)(136003)(366004)(8936002)(6666004)(36756003)(6486002)(5660300002)(31686004)(66476007)(81156014)(8676002)(6706004)(66946007)(86362001)(966005)(478600001)(31696002)(81166007)(6916009)(26005)(2616005)(16576012)(2906002)(4326008)(53546011)(956004)(316002)(66556008)(16526019)(52116002)(186003)(78286006);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: windriver.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ze27qMe45pDxK+tCUtGvVpZQDfwE8iarB0QcBv/q0sfmvaRdzCZS+Rids5n4aTBj6nzMwuX2RnQa750o4wu5ttzhQ8IL1mNH+y+g16i+TTku/oS+5TU1C7QXYbDmC9C8+N4bjTtsg0+0rBxNUoOdMex98ROYNnYp1D5rKrh7TvIfPTJoHjGEzgQvrW7ffQGIvQrCbghjCTtSzOIrq0CB/Bm/N2FfrKesCh5lqdegWSeAAltaGBxf+Dln34XpIV7LpVTn9nGK+7Cp5PagNSEhi3ntkLMHxtsGOD3i6lqa84YS8CiWfkUC8QojaTcf9unJr1vPypXxbIKVaf11o4aYJJix/BfXFfkp1CYzqypV8AjSnsHBwizobtO2ktpakCvD7Gx2euqqJ/1AvNBYCQ5ZpyiakbFJRN2P9hvEx90Wfu405TFXTHOwn59MSq1nT8hTVY+Bckvxq09YJh2DIT4U4wJyBGyOrI/Vj+meQbIxNUSIkdnTcp06J3gFox4xaaYQpJ+YCLqqBBrbI3/id64Tvb1U9BfXHXxYy9B8PQlesDl6/EZ1cnifZZZAlEiu0k/JWSunUrIfxznMtTmmyFy0fx4U0anfbUSVlWm3qhooisg=
X-MS-Exchange-AntiSpam-MessageData: 
	ms3Z1uFe2tDX6Fl4Qd/uvU5MFcXYB5i73msPvfLaQdfZM76Oc2nejWpfJsLqxQLO5kkcOmP2MzsKEV4il4spfynH28EMgUo7BC6hv45k9pVHIfF7qX74RntRYpJ3UO5sOgDZQPZ4z48bvZhisgZfJg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 043d8ba4-8efb-43f5-b52c-08d7dc39813e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2020 03:53:03.7680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N9XmdAbI2GbVsKNAmkfMKklp/H104fs3r0NSIGAinhscSoDP1/TzoGQrauS0/N/219UIQgdPHACoE0XhCuyt+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4418
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Of course yes, I'd like to uprev the lxc. But it may be a few days later.

: )

Thanks,

Yanfei

On 4/9/20 11:04 AM, Bruce Ashfield wrote:
> As of April 6th, LXC 4.0 has been released.
>
> Given that it is a LTS release, I'd prefer to jump to that for the
> dunfell branch .. even if it is just recently released by LXC.
>
> Can you try and uprev ? If not, I'll get to it in the next few weeks,
> but I'll hold on merging this patch in preference for the uprev.
>
> Bruce
>
> On Mon, Apr 6, 2020 at 12:21 AM Xu, Yanfei <yanfei.xu@windriver.com> wrote:
>> From: Yanfei Xu <yanfei.xu@windriver.com>
>>
>> LXC 3.2.1 has a bug that containers may start failed in some cases, and
>> this patch from upstream fix it.
>>
>> -------error message------
>> lxc-start vc0 20200323102154.497 ERROR    cgfsng -
>> cgfsng.c:__do_cgroup_enter:1500 - No space left on device - Failed to
>> enter cgroup "/sys/fs/cgroup/cpuset//lxc.monitor/vc0-4/cgroup.procs"
>> lxc-start vc0 20200323102154.497 ERROR    start -
>> start.c:__lxc_start:2009 - Failed to enter monitor cgroup
>> lxc-start vc0 20200323102154.497 ERROR    lxccontainer -
>> lxccontainer.c:wait_on_daemonized_start:872 - Received container state
>> "STOPPING" instead of "RUNNING"
>> lxc-start vc0 20200323102154.497 ERROR    lxc_start -
>> lxc_start.c:main:329 - The container failed to start
>> lxc-start vc0 20200323102154.497 ERROR    lxc_start -
>> lxc_start.c:main:332 - To get more details, run the container in
>> foreground mode
>> -------------------------
>>
>> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
>> ---
>>   ...1-cgroups-initialize-cpuset-properly.patch | 40 +++++++++++++++++++
>>   recipes-containers/lxc/lxc_3.2.1.bb           |  1 +
>>   2 files changed, 41 insertions(+)
>>   create mode 100644 recipes-containers/lxc/files/0001-cgroups-initialize-cpuset-properly.patch
>>
>> diff --git a/recipes-containers/lxc/files/0001-cgroups-initialize-cpuset-properly.patch b/recipes-containers/lxc/files/0001-cgroups-initialize-cpuset-properly.patch
>> new file mode 100644
>> index 0000000..9d0c2ae
>> --- /dev/null
>> +++ b/recipes-containers/lxc/files/0001-cgroups-initialize-cpuset-properly.patch
>> @@ -0,0 +1,40 @@
>> +From b31d62b847a3ee013613795094cce4acc12345ef Mon Sep 17 00:00:00 2001
>> +From: Christian Brauner <christian.brauner@ubuntu.com>
>> +Date: Sun, 28 Jul 2019 23:13:26 +0200
>> +Subject: [PATCH] cgroups: initialize cpuset properly
>> +
>> +Closes #3108.
>> +Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
>> +
>> +Upstream-Status: Backport[https://github.com/lxc/lxc/pull/3108]
>> +
>> +Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
>> +---
>> + src/lxc/cgroups/cgfsng.c | 10 +++++-----
>> + 1 file changed, 5 insertions(+), 5 deletions(-)
>> +
>> +diff --git a/src/lxc/cgroups/cgfsng.c b/src/lxc/cgroups/cgfsng.c
>> +index 7b8fe6736..c29c0958e 100644
>> +--- a/src/lxc/cgroups/cgfsng.c
>> ++++ b/src/lxc/cgroups/cgfsng.c
>> +@@ -496,12 +496,12 @@ static bool cg_legacy_filter_and_set_cpus(char *path, bool am_initialized)
>> +       }
>> +
>> +       if (!flipped_bit) {
>> +-              DEBUG("No isolated or offline cpus present in cpuset");
>> +-              return true;
>> ++              cpulist = lxc_cpumask_to_cpulist(possmask, maxposs);
>> ++              TRACE("No isolated or offline cpus present in cpuset");
>> ++      } else {
>> ++              cpulist = move_ptr(posscpus);
>> ++              TRACE("Removed isolated or offline cpus from cpuset");
>> +       }
>> +-      DEBUG("Removed isolated or offline cpus from cpuset");
>> +-
>> +-      cpulist = lxc_cpumask_to_cpulist(possmask, maxposs);
>> +       if (!cpulist) {
>> +               ERROR("Failed to create cpu list");
>> +               return false;
>> +--
>> +2.18.2
>> +
>> diff --git a/recipes-containers/lxc/lxc_3.2.1.bb b/recipes-containers/lxc/lxc_3.2.1.bb
>> index 9592dd9..57e48c1 100644
>> --- a/recipes-containers/lxc/lxc_3.2.1.bb
>> +++ b/recipes-containers/lxc/lxc_3.2.1.bb
>> @@ -50,6 +50,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>>          file://dnsmasq.conf \
>>          file://lxc-net \
>>          file://0001-syscall_wrappers-rename-internal-memfd_create-to-mem.patch \
>> +       file://0001-cgroups-initialize-cpuset-properly.patch \
>>          "
>>
>>   SRC_URI[md5sum] = "4886c8d1c8e221fe526eefcb47857b85"
>> --
>> 2.24.1
>>
>> 
>
>
