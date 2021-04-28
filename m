Received: from NAM04-MW2-obe.outbound.protection.outlook.com (NAM04-MW2-obe.outbound.protection.outlook.com [40.107.101.51])
 by mx.groups.io with SMTP id smtpd.web12.4795.1619568481295274002
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 Apr 2021 17:08:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=X5TEoLnQ;
 spf=pass (domain: windriver.com, ip: 40.107.101.51, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9PoDh1Bs3gNydyxQSo0/o9DNDf4pfYsYYdDseS/oN4u5F9h7cOAd5t+XLBbdtAhGYPUJpyn2xbL6mvoUFu8iptR8bxKkqNprsSRwIPtDo+T6HvmSnzwRoLlr6RA+A6Or4fT/TY0G+dktmqrWyDJxLREQ6QU53VqFWrlvPeAuMh8r8mbTkx6l5m8SuJyu2gj2wJC/yRTyxSLdjM+3siGp2qdIJR7NnFEkV54CI7sP64bnKqNJs+jPs820vn2MlnP+/QkdepFi/8HlURJqbJtnhe7MqgseFhDQiKUJ88JhP/u5hz4Cv5uIbTzsKOnQpa1W0XhgSkvPq+71Hz2PmS/Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fGiGvhMcHKNBhQ1gkwKm0aQDGxUD+OiLDUVCeQOSfoU=;
 b=hVD3j1CtVmdI07uGjN181pZaEOvhFJRRtOg5+l+OkTEZgCbGiBFc+ELnhARPAkzNdjOt7c7uN5T7u1qg+JmYvtigRlEr+4fBtSQ3ICHicutTkHom4rSfZKOiVjj3/y+u+UcBfQQ6PkO0b0dq7m20zam9L1kripqinWZu0WIz9mfftt7+bsDo9mdIW61KHvkPF/NnkwY++6G2ElpOwvZyHQrR4b4VfWlYP7BP6W/A5HYoQJMBqJl0C/eok/4RI1zuZpmdRiwJD5dUxqDEEOvD1545mfPKC8K/OZvPhpziinD5w8Ze/WtrA8HXK4FMlsl/KgwORwAO0dfzDuIkiaXZSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fGiGvhMcHKNBhQ1gkwKm0aQDGxUD+OiLDUVCeQOSfoU=;
 b=X5TEoLnQORqKHENTtgZeUK4MS97YPiMWOI2PnTsqwHD4PpGuTpUnYgJoTSSygygu2C2dY3Vy/6OH0limzzL9xOjrXYiLlgBb84ofiNObuj5tg3SXQzApS/5z6nbUoSHPAifWzplb4a4TnRdgpY1mjVQUAqj6UV8f1sakSn4W0zs=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CO1PR11MB4945.namprd11.prod.outlook.com (2603:10b6:303:9c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 00:07:58 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7%6]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 00:07:58 +0000
Subject: Re: [meta-virtualization] [PATCH v3] ceph: Upgrade to 16.2.1
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
 meta-virtualization@lists.yoctoproject.org
References: <20210426171944.1602352-1-saul.wold@windriver.com>
 <CADkTA4O2D8-z+z1bnH7mpsQf_hoUESWNnuhPsyBNWTHp+99XzA@mail.gmail.com>
 <CADkTA4O1qyKGRQB0xd2SBhKorEg+-YjRbZqHB0C1OnJuia9d0Q@mail.gmail.com>
From: "Saul Wold" <Saul.Wold@windriver.com>
Message-ID: <03ced9f1-c41d-bc76-344b-de46e3336745@windriver.com>
Date: Tue, 27 Apr 2021 17:07:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CADkTA4O1qyKGRQB0xd2SBhKorEg+-YjRbZqHB0C1OnJuia9d0Q@mail.gmail.com>
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MWHPR2201CA0042.namprd22.prod.outlook.com
 (2603:10b6:301:16::16) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
Return-Path: Saul.Wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.23.90.211] (71.238.119.71) by MWHPR2201CA0042.namprd22.prod.outlook.com (2603:10b6:301:16::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25 via Frontend Transport; Wed, 28 Apr 2021 00:07:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb95841a-254e-46e9-f419-08d909d9adf1
X-MS-TrafficTypeDiagnostic: CO1PR11MB4945:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4945E657D5FD288576E36A2BEE409@CO1PR11MB4945.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xjACs4uY+htU24biZXFtkLj3oSPEGajQu1C0mLespggIUJo+L//hqICXo6OKuuacQtRjHKvgXyl8TY+e7w/wvZTv8CZM/JwDYC3XfQPFooqr04SZEDONxygdRuke1poGj/8QIs063/uQhBgK4ZWeIuaL9U1ZwLs5wY1MK+kyMY7KUKeBq8jkRtGxEdWHQnCtYl9ciRm8p8vjlgzoOvCQnXUDl92dBu9a/KwK2R41MyOfrs4SktfM6xJaLPoYc7yUdVz51y35X6VrxWou/Lo9qJzAD8X7feV2twX2s/tK/WpXZ05AU+El+Oo6LWDtPP7/aGe24VYY+WVbYgF48WyscZ3w0Ms5anaawUq4BoPjWMEosRYuycB44Ceu8l/iP+XScpzk+KLr1OVKCmPXdZ4ifkiLCkQnaDuBlVkDAwUEf5SnjR7u8Zi7h+iBEaRkf/zg3iFMctOgX0lg26X8yn73E92leo3wTeEAoVOi/cI+5dgHL1ER50UIVqKXfbXXjpREaYrEZXIDMnsD1ojk7Tynd+QY19y66NLgC6vQtHwd0x+kJjcMlAOS1glptXaZLleonsqmSNDj4hrN/PBW6zSCEClAq/ez2gk7fJKIyF0XSH4gQp+99HVCRqIoo3oQkaZmj69rAe1lK/mpyanRyfKdt2t4/3W7EmSu7kCoPksx8sU2ahxq6ZJqNMXNSai9cvPiLDsN29t2gRSIm+AwW/dDCm3rRqtxHbSGXzmXUuMYoZsyiRvjUX8k7vvHaTyOqKU29XE/bB3QLaN8dbx9z0skpCCsrgjciKybYq1d3RFziloIq8yh4S04W3cTHuaQQm9ZBx/OIES7i7p5YsWo5y07YQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39850400004)(366004)(346002)(136003)(5660300002)(31686004)(53546011)(8936002)(66946007)(26005)(86362001)(16526019)(316002)(2616005)(6486002)(52116002)(31696002)(186003)(16576012)(66476007)(966005)(956004)(478600001)(36756003)(83380400001)(30864003)(38350700002)(38100700002)(2906002)(66556008)(8676002)(43740500002)(45980500001)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?SWU0eE9QVEpIN1lUSC9UODY3YmtoYkpSelR2RjlUUUN5SHRTOHM3UHNkTWE0?=
 =?utf-8?B?OU90YThmalpLK1N2WVU3Y3hFNllSZmZ4d1BXWVpmNVFlWTJEbjdTaUZTUlE5?=
 =?utf-8?B?RlFWWE95N2VDYWtiR05nVXR3VnlGVFM0MGVHVldZZHExK1NMWWdMa3NmZW1O?=
 =?utf-8?B?MXJLQ3V6T01vb3VXc1BQWjRtNjV4L0JFR21RZ0c4QTcwOTFXeEU4bW9ZcEtL?=
 =?utf-8?B?bngyUmZsaGxxVE1GcGtEWG9aZCtLMUtZVVRoSnVtUkg0bU9aWXJrWlVmTHh0?=
 =?utf-8?B?UEFIYThGL3hmVVVsTHkzbkRmQUNRUnFBZlYwYnJmSkxkRGt3c3FGQmJVaE0z?=
 =?utf-8?B?OVpsNVZXRWxLV1hvSitKcTR0L01kWnpVcS8zRHBSOEVQOWpqdFpZK0s2MnJu?=
 =?utf-8?B?b0tXK1BwZTRuUTdsdW9HdDl3QlgwbGVieVFKcWFoc3M4WmZ6MGhodHpiSFRq?=
 =?utf-8?B?VTVMNC9icDNweHBZSFJMdWFWR05WVWpSQzd1TUJzb0tXeXFkVGloSGZkcVBh?=
 =?utf-8?B?YXF0NXduVC9yaHVHNVpYSU5OT0s4Y2twVzYrdVdZUFRVZVVTNlVtVW5Wa0s1?=
 =?utf-8?B?WFhuRmpWL3VUaXBONmhBTk0vd0dWZHpZMG9TN0phNnc1bzBHaDR5cXFtRSt4?=
 =?utf-8?B?QkdiTWJjWnljR085Y1Q4d25lbEZoL3djbEtZK2RhZ3BDVXdKTHl5NkE2Vi9X?=
 =?utf-8?B?VllUN3FYOEdXdXpuNGlTSzRPMjJVQ1QzVk5HZFZIaTBIUm1MUDB0Q3FHUlRB?=
 =?utf-8?B?dmF2YTlSdld0Y050VUtVQVljcEJCVm5sSWtGcXRxVkJKSUljOGdOajJMQWdm?=
 =?utf-8?B?NzJWN2hMT1FidUFZU3Y1cnNEaStVN3JRazBlOTZMNk5qL09LQ1prQzFrZmsr?=
 =?utf-8?B?aVY0RFVIMmtFWUFVc2RtQk5leUtBNXZjNUdaM1FFUnIyMVhHRTVHSG83OTdF?=
 =?utf-8?B?c1ZBbjA3MjhUSzVBZGN2ZkdTa3d3cTJrMFFyejJHQWNoOEZFcy95YkwzUlJL?=
 =?utf-8?B?SlVGTVg4eDBUcERSbngzMFFFc01tQi8xSTdTb1J3ZTFORDVWV0ppdDNOQzNK?=
 =?utf-8?B?VjV4L1RHWGdESm5OQTUzREZMYVd3MlhDRU5zRzNWcTFtWkxFSkZNc2lrRjVX?=
 =?utf-8?B?SFRrOE1vMWZlRWNEVVJiS2JDL1c3MnhPa3g0c05UM1cwbEwrYWw3dWZvVXhB?=
 =?utf-8?B?QThEOE9nVC9yYVRSLy8wS2F3Y1M1dWgxNExyb1Z3bHU0bWhKZkMzbVQ1R1dV?=
 =?utf-8?B?YXJmZy9kNjRMZ09UdXRsTTk5dXpyVEhRUDk0aVEzSUNHTHFXRGRicHI2VnFz?=
 =?utf-8?B?T1VZdDJDY2QwRS95R1NHSy9aSGNTaW53a2R2dDdGbUNrb2dDSkJKTnBobXB2?=
 =?utf-8?B?SWlpdFBuaEd5Zm8zWGl4UHNDbitpZWs2WnBRMmEwbitkcmJaYXhDVlJIeEdN?=
 =?utf-8?B?QUNHSHAvSkJ4SlFBK1R2TkphSUtWOHplaVJOWCtJK0N1bVNrT085RytWejZr?=
 =?utf-8?B?ZzlRaGZ3TnNLRFVEQUNQUXBxVVNoZFdNL2xIZGdwUlpEWCtHTnE5VnhPbnd6?=
 =?utf-8?B?OFdiSXhSNmM1VXV5Yjc1RmZKamR6dmxvQWZrZ1MyR04wcE42Q1BqS2VHSlJH?=
 =?utf-8?B?RG9Ocy96NnhuekRBQmJJVGQ3Qm1LMzFxWkZ1T3lUZ1J0djRUVnYvbkJFcVM2?=
 =?utf-8?B?TXcxSC8zWVdOZC9BQnhMTndzc3JTSWtoSDhPYVVSaDRjeURvMHhOdDh5ais5?=
 =?utf-8?Q?jbfBK8qDO+zLrFX+BtE6w3XotgbKivJg9FHut9O?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb95841a-254e-46e9-f419-08d909d9adf1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 00:07:58.3112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dwLf+XxM0MLaCEVBu+VdakA8QIPBsP3sxXjbZibdxZkKKPJC/Wf3OjiQLDAE1Gtt8KmyVffuS7eEjsuvT+cBSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4945
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4/27/21 2:22 PM, Bruce Ashfield wrote:
> On Mon, Apr 26, 2021 at 10:16 PM Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
>>
>> I'm going to try building from my secondary builder, to see if
>> something is up with my primary.
>>
>> The patch did apply cleanly, but I'm still failing the compilation due to OOM.
>>
>> linux/ceph/16.2.1-r0/ceph-16.2.1/src/rgw/rgw_string.cc
>> | In file included from
>> /opt/poky/build/tmp/work/core2-64-poky-linux/ceph/16.2.1-r0/ceph-16.2.1/src/rgw/rgw_string.cc:4:
>> | /opt/poky/build/tmp/work/core2-64-poky-linux/ceph/16.2.1-r0/ceph-16.2.1/src/rgw/rgw_string.h:
>> In member function 'bool ltstr_nocase::operator()(const string&, const
>> string&) const':
>> | /opt/poky/build/tmp/work/core2-64-poky-linux/ceph/16.2.1-r0/ceph-16.2.1/src/rgw/rgw_string.h:18:23:
>> error: invalid use of incomplete type 'const string' {aka 'const class
>> std::__cxx11::basic_string<char>'}
>> |    18 |     return strcasecmp(s1.c_str(), s2.c_str()) < 0;
>> |       |                       ^~
>>
>> And in my dmesg:
>>
>> [518277.850155] Out of memory: Kill process 58857 (cc1plus) score 99
>> or sacrifice child
>> [518277.850268] Killed process 58857 (cc1plus) total-vm:1759572kB,
>> anon-rss:1634232kB, file-rss:0kB, shmem-rss:0kB
>>
>> Which I assume is that same process.
>>
>> I've tried a few things to control the parallel builds for the
>> package, but am still failing. If anyone knows any
>> ninja/cmake/whatever ways to limit the memory of this .. I'm all ears
>> :D
> 
> Apparently  I managed to not reply-all on my first followup. Adding
> meta-virt back into the mix.
> 
> I had a few kind souls help me out on #meta-virt and confirm that they
> can't build this update either. Same error in the same file. (I'm
> limiting parallel builds and can now avoid the OOM).
> 
> So now, we need to figure out why you can build this, and no one else can.
> 
Well that's just awesome, I was able to reproduce this on a different 
machine.  My machine is Ubuntu-20.04 and the failing machine is 
Ubuntu-18.04.  Clearly interesting reproducibility issue!

Can you and your crew chime in with Host distro info.  I will continue 
to track this down.

Sau!

> Bruce
> 
>>
>> Bruce
>>
>> On Mon, Apr 26, 2021 at 1:20 PM Saul Wold <Saul.Wold@windriver.com> wrote:
>>>
>>> From: Saul Wold <Saul.Wold@windriver.com>
>>>
>>> This updates the Ceph version to 16.2.1 which required a couple
>>> changes to base code via a rebased patch which also disabled the
>>> sanity check due to it not working correctly, but the actual
>>> compile worked.  Also added a new patch to add soversion information
>>> for the new libcephsqlite library so it would be packaged correctly
>>>
>>> Added fixed for new python script to adjust #! from the native path
>>> and moved the ceph-python package in order for it to get the correct
>>> set of files before the ceph package.
>>>
>>> Signed-off-by: Saul Wold <saul.wold@windriver.com>
>>> ---
>>>   ...-add-missing-include-for-atomic-bool.patch |  25 ----
>>>   ...h-fix-build-errors-for-cross-compile.patch | 125 ++++++++++++------
>>>   ...0001-cmake-add-support-for-python3.9.patch |  30 -----
>>>   ...001-fix-host-library-paths-were-used.patch |  58 ++++----
>>>   ...ite-Add-library-soversion-properties.patch |  31 +++++
>>>   .../ceph/{ceph_15.2.9.bb => ceph_16.2.1.bb}   |  91 ++++++++++---
>>>   6 files changed, 218 insertions(+), 142 deletions(-)
>>>   delete mode 100644 recipes-extended/ceph/ceph/0001-add-missing-include-for-atomic-bool.patch
>>>   delete mode 100644 recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.9.patch
>>>   create mode 100644 recipes-extended/ceph/ceph/0001-libcephsqlite-Add-library-soversion-properties.patch
>>>   rename recipes-extended/ceph/{ceph_15.2.9.bb => ceph_16.2.1.bb} (61%)
>>>
>>> diff --git a/recipes-extended/ceph/ceph/0001-add-missing-include-for-atomic-bool.patch b/recipes-extended/ceph/ceph/0001-add-missing-include-for-atomic-bool.patch
>>> deleted file mode 100644
>>> index ffcbc58..0000000
>>> --- a/recipes-extended/ceph/ceph/0001-add-missing-include-for-atomic-bool.patch
>>> +++ /dev/null
>>> @@ -1,25 +0,0 @@
>>> -From 502be73be3c3645094525aa552f5e53d8782a004 Mon Sep 17 00:00:00 2001
>>> -From: Sakib Sajal <sakib.sajal@windriver.com>
>>> -Date: Fri, 28 Aug 2020 19:36:19 -0400
>>> -Subject: [PATCH] add missing include for atomic<bool>
>>> -
>>> -Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>>> ----
>>> - src/tools/rbd/action/Bench.cc | 1 +
>>> - 1 file changed, 1 insertion(+)
>>> -
>>> -diff --git a/src/tools/rbd/action/Bench.cc b/src/tools/rbd/action/Bench.cc
>>> -index aa6edbc1..90c551c1 100644
>>> ---- a/src/tools/rbd/action/Bench.cc
>>> -+++ b/src/tools/rbd/action/Bench.cc
>>> -@@ -9,6 +9,7 @@
>>> - #include "common/ceph_mutex.h"
>>> - #include "include/types.h"
>>> - #include "global/signal_handler.h"
>>> -+#include <atomic>
>>> - #include <iostream>
>>> - #include <boost/accumulators/accumulators.hpp>
>>> - #include <boost/accumulators/statistics/stats.hpp>
>>> ---
>>> -2.27.0
>>> -
>>> diff --git a/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch b/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch
>>> index 4d54549..00c7e5b 100644
>>> --- a/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch
>>> +++ b/recipes-extended/ceph/ceph/0001-ceph-fix-build-errors-for-cross-compile.patch
>>> @@ -1,10 +1,15 @@
>>> -From 4712fe18405ffea31405308357a8e7fca358bcce Mon Sep 17 00:00:00 2001
>>> +From 2a3ccc8079040a7e783b8a9091618878e7cf0719 Mon Sep 17 00:00:00 2001
>>>   From: Dengke Du <dengke.du@windriver.com>
>>>   Date: Mon, 11 Mar 2019 09:14:09 +0800
>>>   Subject: [PATCH] ceph: fix build errors for cross compile
>>>
>>>   1. set the cross compile sysroot to find the rocksdb library
>>>   2. correct the install path for library in Distutils.cmake
>>> +3. remove / disable the sanity_check(), for some reasong the
>>> +   sanity check gets the wrong settings and will not link
>>> +   correctly, but the actual build works correctly, this needs
>>> +   more investigation later, earlier versions of the patch also
>>> +   removed it but no comment on why. (sgw)
>>>
>>>   Upstream-Status: Inappropriate [oe specific]
>>>
>>> @@ -14,18 +19,20 @@ Adjust context for v14.2.3
>>>
>>>   Signed-off-by: He Zhe <zhe.he@windriver.com>
>>>   Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>>> +Signed-off-by: Saul Wold <saul.wold@windriver.com>
>>> +
>>>   ---
>>>    cmake/modules/Distutils.cmake      | 25 +++++--------------------
>>>    cmake/modules/FindRocksDB.cmake    |  4 ++--
>>>    src/compressor/zstd/CMakeLists.txt |  2 +-
>>> - src/pybind/cephfs/setup.py         |  8 --------
>>> - src/pybind/rados/setup.py          |  8 --------
>>> - src/pybind/rbd/setup.py            |  8 --------
>>> - src/pybind/rgw/setup.py            |  8 --------
>>> - 7 files changed, 8 insertions(+), 55 deletions(-)
>>> + src/pybind/cephfs/setup.py         | 18 +++++-------------
>>> + src/pybind/rados/setup.py          | 11 ++---------
>>> + src/pybind/rbd/setup.py            | 18 +++++-------------
>>> + src/pybind/rgw/setup.py            | 18 +++++-------------
>>> + 7 files changed, 25 insertions(+), 71 deletions(-)
>>>
>>>   diff --git a/cmake/modules/Distutils.cmake b/cmake/modules/Distutils.cmake
>>> -index 5fe929499d..802eb37e32 100644
>>> +index ff01aaf81..18656c5a5 100644
>>>   --- a/cmake/modules/Distutils.cmake
>>>   +++ b/cmake/modules/Distutils.cmake
>>>   @@ -18,17 +18,8 @@ function(distutils_install_module name)
>>> @@ -39,9 +46,9 @@ index 5fe929499d..802eb37e32 100644
>>>   -      list(APPEND options
>>>   -        --root=\$ENV{DESTDIR}
>>>   -        --single-version-externally-managed)
>>> --      if(NOT \"${DU_INSTALL_SCRIPT}\" STREQUAL \"\")
>>> --        list(APPEND options --install-script=${DU_INSTALL_SCRIPT})
>>> --      endif()
>>> +-    endif()
>>> +-    if(NOT \"${DU_INSTALL_SCRIPT}\" STREQUAL \"\")
>>> +-      list(APPEND options --install-script=${DU_INSTALL_SCRIPT})
>>>   -    endif()
>>>   +    list(APPEND options --root=${CMAKE_DESTDIR})
>>>   +    list(APPEND options --install-lib=${PYTHON_SITEPACKAGES_DIR})
>>> @@ -51,7 +58,7 @@ index 5fe929499d..802eb37e32 100644
>>>   @@ -50,7 +41,7 @@ function(distutils_add_cython_module target name src)
>>>      # Note: no quotes, otherwise distutils will execute "/usr/bin/ccache gcc"
>>>      # CMake's implicit conversion between strings and lists is wonderful, isn't it?
>>> -   string(REPLACE " " ";" cflags ${CMAKE_C_FLAGS})
>>> +   set(cflags ${COMPILE_OPTIONS})
>>>   -  list(APPEND cflags -iquote${CMAKE_SOURCE_DIR}/src/include -w)
>>>   +  list(APPEND cflags -iquote${CMAKE_SOURCE_DIR}/src/include -w --sysroot=${CMAKE_SYSROOT})
>>>      # This little bit of magic wipes out __Pyx_check_single_interpreter()
>>> @@ -75,7 +82,7 @@ index 5fe929499d..802eb37e32 100644
>>>           COMMAND
>>>               ${Python3_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/setup.py
>>>   diff --git a/cmake/modules/FindRocksDB.cmake b/cmake/modules/FindRocksDB.cmake
>>> -index c5dd3dfaf6..be38597af2 100644
>>> +index c5dd3dfaf..be38597af 100644
>>>   --- a/cmake/modules/FindRocksDB.cmake
>>>   +++ b/cmake/modules/FindRocksDB.cmake
>>>   @@ -9,9 +9,9 @@
>>> @@ -91,7 +98,7 @@ index c5dd3dfaf6..be38597af2 100644
>>>    if(ROCKSDB_INCLUDE_DIR AND EXISTS "${ROCKSDB_INCLUDE_DIR}/rocksdb/version.h")
>>>      foreach(ver "MAJOR" "MINOR" "PATCH")
>>>   diff --git a/src/compressor/zstd/CMakeLists.txt b/src/compressor/zstd/CMakeLists.txt
>>> -index a5ebdaf538..a234068150 100644
>>> +index b53b0d944..4955711a9 100644
>>>   --- a/src/compressor/zstd/CMakeLists.txt
>>>   +++ b/src/compressor/zstd/CMakeLists.txt
>>>   @@ -9,7 +9,7 @@ ExternalProject_Add(zstd_ext
>>> @@ -104,81 +111,111 @@ index a5ebdaf538..a234068150 100644
>>>                 -G${CMAKE_GENERATOR}
>>>      BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/libzstd
>>>   diff --git a/src/pybind/cephfs/setup.py b/src/pybind/cephfs/setup.py
>>> -index 19ae6c329a..c9a25ccfff 100755
>>> +index c3d40df05..24c26c3ed 100755
>>>   --- a/src/pybind/cephfs/setup.py
>>>   +++ b/src/pybind/cephfs/setup.py
>>> -@@ -135,14 +135,6 @@ def check_sanity():
>>> +@@ -137,19 +137,11 @@ def check_sanity():
>>>        finally:
>>>            shutil.rmtree(tmp_dir)
>>>
>>>   -
>>> --if 'BUILD_DOC' in os.environ.keys():
>>> --    pass
>>> +-if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
>>> +-    ext_args = {}
>>> +-    cython_constants = dict(BUILD_DOC=True)
>>> +-    cythonize_args = dict(compile_time_env=cython_constants)
>>>   -elif check_sanity():
>>> --    pass
>>> +-    ext_args = get_python_flags(['cephfs'])
>>> +-    cython_constants = dict(BUILD_DOC=False)
>>> +-    include_path = [os.path.join(os.path.dirname(__file__), "..", "rados")]
>>> +-    cythonize_args = dict(compile_time_env=cython_constants,
>>> +-                          include_path=include_path)
>>>   -else:
>>>   -    sys.exit(1)
>>> --
>>> ++ext_args = get_python_flags(['cephfs'])
>>> ++cython_constants = dict(BUILD_DOC=False)
>>> ++include_path = [os.path.join(os.path.dirname(__file__), "..", "rados")]
>>> ++cythonize_args = dict(compile_time_env=cython_constants,
>>> ++                      include_path=include_path)
>>> +
>>>    cmdclass = {}
>>>    try:
>>> -     from Cython.Build import cythonize
>>>   diff --git a/src/pybind/rados/setup.py b/src/pybind/rados/setup.py
>>> -index e2c5696404..4e99d26721 100755
>>> +index 0d1047825..cff85a063 100755
>>>   --- a/src/pybind/rados/setup.py
>>>   +++ b/src/pybind/rados/setup.py
>>> -@@ -134,14 +134,6 @@ def check_sanity():
>>> +@@ -131,15 +131,8 @@ def check_sanity():
>>>        finally:
>>>            shutil.rmtree(tmp_dir)
>>>
>>>   -
>>> --if 'BUILD_DOC' in os.environ.keys():
>>> --    pass
>>> +-if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
>>> +-    ext_args = {}
>>> +-    cython_constants = dict(BUILD_DOC=True)
>>>   -elif check_sanity():
>>> --    pass
>>> +-    ext_args = get_python_flags(['rados'])
>>> +-    cython_constants = dict(BUILD_DOC=False)
>>>   -else:
>>>   -    sys.exit(1)
>>> --
>>> ++ext_args = get_python_flags(['rados'])
>>> ++cython_constants = dict(BUILD_DOC=False)
>>> +
>>>    cmdclass = {}
>>>    try:
>>> -     from Cython.Build import cythonize
>>>   diff --git a/src/pybind/rbd/setup.py b/src/pybind/rbd/setup.py
>>> -index 634484f140..f5bbbdab4f 100755
>>> +index 73ea4555f..e7f57ddb5 100755
>>>   --- a/src/pybind/rbd/setup.py
>>>   +++ b/src/pybind/rbd/setup.py
>>> -@@ -133,14 +133,6 @@ def check_sanity():
>>> +@@ -135,19 +135,11 @@ def check_sanity():
>>>        finally:
>>>            shutil.rmtree(tmp_dir)
>>>
>>>   -
>>> --if 'BUILD_DOC' in os.environ.keys():
>>> --    pass
>>> +-if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
>>> +-    ext_args = {}
>>> +-    cython_constants = dict(BUILD_DOC=True)
>>> +-    cythonize_args = dict(compile_time_env=cython_constants)
>>>   -elif check_sanity():
>>> --    pass
>>> +-    ext_args = get_python_flags(['rados', 'rbd'])
>>> +-    cython_constants = dict(BUILD_DOC=False)
>>> +-    include_path = [os.path.join(os.path.dirname(__file__), "..", "rados")]
>>> +-    cythonize_args = dict(compile_time_env=cython_constants,
>>> +-                          include_path=include_path)
>>>   -else:
>>>   -    sys.exit(1)
>>> --
>>> ++ext_args = get_python_flags(['rados', 'rbd'])
>>> ++cython_constants = dict(BUILD_DOC=False)
>>> ++include_path = [os.path.join(os.path.dirname(__file__), "..", "rados")]
>>> ++cythonize_args = dict(compile_time_env=cython_constants,
>>> ++                      include_path=include_path)
>>> +
>>>    cmdclass = {}
>>>    try:
>>> -     from Cython.Build import cythonize
>>>   diff --git a/src/pybind/rgw/setup.py b/src/pybind/rgw/setup.py
>>> -index eb1591a460..b9f2428cf9 100755
>>> +index 663604e8f..489c9ba1f 100755
>>>   --- a/src/pybind/rgw/setup.py
>>>   +++ b/src/pybind/rgw/setup.py
>>> -@@ -134,14 +134,6 @@ def check_sanity():
>>> +@@ -135,19 +135,11 @@ def check_sanity():
>>>        finally:
>>>            shutil.rmtree(tmp_dir)
>>>
>>>   -
>>> --if 'BUILD_DOC' in os.environ.keys():
>>> --    pass
>>> +-if 'BUILD_DOC' in os.environ or 'READTHEDOCS' in os.environ:
>>> +-    ext_args = {}
>>> +-    cython_constants = dict(BUILD_DOC=True)
>>> +-    cythonize_args = dict(compile_time_env=cython_constants)
>>>   -elif check_sanity():
>>> --    pass
>>> +-    ext_args = get_python_flags(['rados', 'rgw'])
>>> +-    cython_constants = dict(BUILD_DOC=False)
>>> +-    include_path = [os.path.join(os.path.dirname(__file__), "..", "rados")]
>>> +-    cythonize_args = dict(compile_time_env=cython_constants,
>>> +-                          include_path=include_path)
>>>   -else:
>>>   -    sys.exit(1)
>>> --
>>> ++ext_args = get_python_flags(['rados', 'rgw'])
>>> ++cython_constants = dict(BUILD_DOC=False)
>>> ++include_path = [os.path.join(os.path.dirname(__file__), "..", "rados")]
>>> ++cythonize_args = dict(compile_time_env=cython_constants,
>>> ++                      include_path=include_path)
>>> +
>>>    cmdclass = {}
>>>    try:
>>> -     from Cython.Build import cythonize
>>> ---
>>> -2.20.1
>>> -
>>> diff --git a/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.9.patch b/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.9.patch
>>> deleted file mode 100644
>>> index d9116c4..0000000
>>> --- a/recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.9.patch
>>> +++ /dev/null
>>> @@ -1,30 +0,0 @@
>>> -From 1060f2e4362ebd6db23870d442dcd158d219ee92 Mon Sep 17 00:00:00 2001
>>> -From: Yanfei Xu <yanfei.xu@windriver.com>
>>> -Date: Tue, 10 Nov 2020 17:17:30 +0800
>>> -Subject: [PATCH] cmake: add support for python3.9
>>> -
>>> -add support for python3.9.
>>> -
>>> -Upstream-Status: Pending
>>> -
>>> -Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
>>> ----
>>> - cmake/modules/FindPython/Support.cmake | 2 +-
>>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>>> -
>>> -diff --git a/cmake/modules/FindPython/Support.cmake b/cmake/modules/FindPython/Support.cmake
>>> -index 6584699b79..c05bbe3306 100644
>>> ---- a/cmake/modules/FindPython/Support.cmake
>>> -+++ b/cmake/modules/FindPython/Support.cmake
>>> -@@ -17,7 +17,7 @@ if (NOT DEFINED _${_PYTHON_PREFIX}_REQUIRED_VERSION_MAJOR)
>>> -   message (FATAL_ERROR "FindPython: INTERNAL ERROR")
>>> - endif()
>>> - if (_${_PYTHON_PREFIX}_REQUIRED_VERSION_MAJOR EQUAL 3)
>>> --  set(_${_PYTHON_PREFIX}_VERSIONS 3.8 3.7 3.6 3.5 3.4 3.3 3.2 3.1 3.0)
>>> -+  set(_${_PYTHON_PREFIX}_VERSIONS 3.9 3.8 3.7 3.6 3.5 3.4 3.3 3.2 3.1 3.0)
>>> - elseif (_${_PYTHON_PREFIX}_REQUIRED_VERSION_MAJOR EQUAL 2)
>>> -   set(_${_PYTHON_PREFIX}_VERSIONS 2.7 2.6 2.5 2.4 2.3 2.2 2.1 2.0)
>>> - else()
>>> ---
>>> -2.18.2
>>> -
>>> diff --git a/recipes-extended/ceph/ceph/0001-fix-host-library-paths-were-used.patch b/recipes-extended/ceph/ceph/0001-fix-host-library-paths-were-used.patch
>>> index 310bfa4..1062ae7 100644
>>> --- a/recipes-extended/ceph/ceph/0001-fix-host-library-paths-were-used.patch
>>> +++ b/recipes-extended/ceph/ceph/0001-fix-host-library-paths-were-used.patch
>>> @@ -1,4 +1,4 @@
>>> -From bbf1cba8feb0e43492a1f6a6b31d024117cad262 Mon Sep 17 00:00:00 2001
>>> +From a7f56278dd4762c56cccd559e260e51092763cac Mon Sep 17 00:00:00 2001
>>>   From: Hongxu Jia <hongxu.jia@windriver.com>
>>>   Date: Mon, 13 Apr 2020 23:35:41 -0700
>>>   Subject: [PATCH] fix host library paths were used
>>> @@ -8,6 +8,7 @@ Test the existence of recipe-sysrooot, add it back if lost
>>>   Upstream-Status: Inappropriate [oe specific]
>>>
>>>   Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>> +
>>>   ---
>>>    src/pybind/cephfs/setup.py | 6 +++++-
>>>    src/pybind/rados/setup.py  | 6 +++++-
>>> @@ -16,11 +17,11 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>>    4 files changed, 20 insertions(+), 4 deletions(-)
>>>
>>>   diff --git a/src/pybind/cephfs/setup.py b/src/pybind/cephfs/setup.py
>>> -index c9a25ccf..972f936c 100755
>>> +index 87cdeb473..5144c8441 100755
>>>   --- a/src/pybind/cephfs/setup.py
>>>   +++ b/src/pybind/cephfs/setup.py
>>> -@@ -63,9 +63,13 @@ def get_python_flags(libs):
>>> -                    distutils.sysconfig.get_config_vars('LIBS', 'SYSLIBS')), [])
>>> +@@ -65,10 +65,14 @@ def get_python_flags(libs):
>>> +                filter(lambda lib: lib.startswith('-l'), py_libs)]
>>>        compiler = new_compiler()
>>>        distutils.sysconfig.customize_compiler(compiler)
>>>   +    libpl = distutils.sysconfig.get_config_var('LIBPL')
>>> @@ -29,17 +30,18 @@ index c9a25ccf..972f936c 100755
>>>   +        libpl = sysroot + libpl
>>>        return dict(
>>>            include_dirs=[distutils.sysconfig.get_python_inc()],
>>> --        library_dirs=distutils.sysconfig.get_config_vars('LIBDIR', 'LIBPL'),
>>> -+        library_dirs=[distutils.sysconfig.get_config_var('LIBDIR'), libpl],
>>> -         libraries=libs + [lib.replace('-l', '') for lib in py_libs],
>>> +         library_dirs=distutils.sysconfig.get_config_vars('LIBDIR', 'LIBPL'),
>>> +-        libraries=libs + py_libs,
>>> ++        libraries=libs + [lib.replace('-l', '') for lib in py_libs],
>>>            extra_compile_args=filter_unsupported_flags(
>>>                compiler.compiler[0],
>>> +             compiler.compiler[1:] + distutils.sysconfig.get_config_var('CFLAGS').split()),
>>>   diff --git a/src/pybind/rados/setup.py b/src/pybind/rados/setup.py
>>> -index 4e99d267..de24f766 100755
>>> +index feafb605d..82aff5154 100755
>>>   --- a/src/pybind/rados/setup.py
>>>   +++ b/src/pybind/rados/setup.py
>>> -@@ -66,9 +66,13 @@ def get_python_flags(libs):
>>> -                    distutils.sysconfig.get_config_vars('LIBS', 'SYSLIBS')), [])
>>> +@@ -63,10 +63,14 @@ def get_python_flags(libs):
>>> +                filter(lambda lib: lib.startswith('-l'), py_libs)]
>>>        compiler = new_compiler()
>>>        distutils.sysconfig.customize_compiler(compiler)
>>>   +    libpl = distutils.sysconfig.get_config_var('LIBPL')
>>> @@ -48,17 +50,18 @@ index 4e99d267..de24f766 100755
>>>   +        libpl = sysroot + libpl
>>>        return dict(
>>>            include_dirs=[distutils.sysconfig.get_python_inc()],
>>> --        library_dirs=distutils.sysconfig.get_config_vars('LIBDIR', 'LIBPL'),
>>> -+        library_dirs=[distutils.sysconfig.get_config_var('LIBDIR'), libpl],
>>> -         libraries=libs + [lib.replace('-l', '') for lib in py_libs],
>>> +         library_dirs=distutils.sysconfig.get_config_vars('LIBDIR', 'LIBPL'),
>>> +-        libraries=libs + py_libs,
>>> ++        libraries=libs + [lib.replace('-l', '') for lib in py_libs],
>>>            extra_compile_args=filter_unsupported_flags(
>>>                compiler.compiler[0],
>>> +             compiler.compiler[1:] + distutils.sysconfig.get_config_var('CFLAGS').split()),
>>>   diff --git a/src/pybind/rbd/setup.py b/src/pybind/rbd/setup.py
>>> -index f5bbbdab..a1f70e1d 100755
>>> +index b9c6a78d2..4ef714f8d 100755
>>>   --- a/src/pybind/rbd/setup.py
>>>   +++ b/src/pybind/rbd/setup.py
>>> -@@ -63,9 +63,13 @@ def get_python_flags(libs):
>>> -                    distutils.sysconfig.get_config_vars('LIBS', 'SYSLIBS')), [])
>>> +@@ -65,10 +65,14 @@ def get_python_flags(libs):
>>> +                filter(lambda lib: lib.startswith('-l'), py_libs)]
>>>        compiler = new_compiler()
>>>        distutils.sysconfig.customize_compiler(compiler)
>>>   +    libpl = distutils.sysconfig.get_config_var('LIBPL')
>>> @@ -67,17 +70,18 @@ index f5bbbdab..a1f70e1d 100755
>>>   +        libpl = sysroot + libpl
>>>        return dict(
>>>            include_dirs=[distutils.sysconfig.get_python_inc()],
>>> --        library_dirs=distutils.sysconfig.get_config_vars('LIBDIR', 'LIBPL'),
>>> -+        library_dirs=[distutils.sysconfig.get_config_var('LIBDIR'), libpl],
>>> -         libraries=libs + [lib.replace('-l', '') for lib in py_libs],
>>> +         library_dirs=distutils.sysconfig.get_config_vars('LIBDIR', 'LIBPL'),
>>> +-        libraries=libs + py_libs,
>>> ++        libraries=libs + [lib.replace('-l', '') for lib in py_libs],
>>>            extra_compile_args=filter_unsupported_flags(
>>>                compiler.compiler[0],
>>> +             compiler.compiler[1:] + distutils.sysconfig.get_config_var('CFLAGS').split()),
>>>   diff --git a/src/pybind/rgw/setup.py b/src/pybind/rgw/setup.py
>>> -index b9f2428c..f5119f73 100755
>>> +index 695038c0e..2521f0cbb 100755
>>>   --- a/src/pybind/rgw/setup.py
>>>   +++ b/src/pybind/rgw/setup.py
>>> -@@ -64,9 +64,13 @@ def get_python_flags(libs):
>>> -                    distutils.sysconfig.get_config_vars('LIBS', 'SYSLIBS')), [])
>>> +@@ -65,10 +65,14 @@ def get_python_flags(libs):
>>> +                filter(lambda lib: lib.startswith('-l'), py_libs)]
>>>        compiler = new_compiler()
>>>        distutils.sysconfig.customize_compiler(compiler)
>>>   +    libpl = distutils.sysconfig.get_config_var('LIBPL')
>>> @@ -86,11 +90,9 @@ index b9f2428c..f5119f73 100755
>>>   +        libpl = sysroot + libpl
>>>        return dict(
>>>            include_dirs=[distutils.sysconfig.get_python_inc()],
>>> --        library_dirs=distutils.sysconfig.get_config_vars('LIBDIR', 'LIBPL'),
>>> -+        library_dirs=[distutils.sysconfig.get_config_var('LIBDIR'), libpl],
>>> -         libraries=libs + [lib.replace('-l', '') for lib in py_libs],
>>> +         library_dirs=distutils.sysconfig.get_config_vars('LIBDIR', 'LIBPL'),
>>> +-        libraries=libs + py_libs,
>>> ++        libraries=libs + [lib.replace('-l', '') for lib in py_libs],
>>>            extra_compile_args=filter_unsupported_flags(
>>>                compiler.compiler[0],
>>> ---
>>> -2.21.0
>>> -
>>> +             compiler.compiler[1:] + distutils.sysconfig.get_config_var('CFLAGS').split()),
>>> diff --git a/recipes-extended/ceph/ceph/0001-libcephsqlite-Add-library-soversion-properties.patch b/recipes-extended/ceph/ceph/0001-libcephsqlite-Add-library-soversion-properties.patch
>>> new file mode 100644
>>> index 0000000..2c9cd11
>>> --- /dev/null
>>> +++ b/recipes-extended/ceph/ceph/0001-libcephsqlite-Add-library-soversion-properties.patch
>>> @@ -0,0 +1,31 @@
>>> +From ce36ce7d1c0f954d1532a759f4d7b09d87287dac Mon Sep 17 00:00:00 2001
>>> +From: Saul Wold <saul.wold@windriver.com>
>>> +Date: Thu, 22 Apr 2021 08:05:57 -0700
>>> +Subject: [PATCH] libcephsqlite: Add library soversion properties
>>> +
>>> +This additional properties are needed to ensure the library
>>> +is installed with an soversion so that when the library is
>>> +packaged it gets packaged corectly in the ceph package and
>>> +ceph-dev package as the link.
>>> +
>>> +Upstream-Status: pending
>>> +Signed-off-by: Saul Wold <saul.wold@windriver.com>
>>> +---
>>> + src/CMakeLists.txt | 4 ++++
>>> + 1 file changed, 4 insertions(+)
>>> +
>>> +diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
>>> +index 37db48f86..8dc7bdb56 100644
>>> +--- a/src/CMakeLists.txt
>>> ++++ b/src/CMakeLists.txt
>>> +@@ -804,6 +804,10 @@ if(WITH_LIBCEPHSQLITE)
>>> +   set(cephsqlite_srcs libcephsqlite.cc SimpleRADOSStriper.cc)
>>> +   add_library(cephsqlite ${CEPH_SHARED} ${cephsqlite_srcs})
>>> +   target_link_libraries(cephsqlite PRIVATE cls_lock_client librados ceph-common SQLite3::SQLite3 ${EXTRALIBS})
>>> ++  set_target_properties(cephsqlite PROPERTIES
>>> ++    OUTPUT_NAME cephsqlite
>>> ++    VERSION 1.0.0
>>> ++    SOVERSION 1)
>>> +   install(TARGETS cephsqlite DESTINATION ${CMAKE_INSTALL_LIBDIR})
>>> + endif(WITH_LIBCEPHSQLITE)
>>> +
>>> diff --git a/recipes-extended/ceph/ceph_15.2.9.bb b/recipes-extended/ceph/ceph_16.2.1.bb
>>> similarity index 61%
>>> rename from recipes-extended/ceph/ceph_15.2.9.bb
>>> rename to recipes-extended/ceph/ceph_16.2.1.bb
>>> index 0d821f0..2771c29 100644
>>> --- a/recipes-extended/ceph/ceph_15.2.9.bb
>>> +++ b/recipes-extended/ceph/ceph_16.2.1.bb
>>> @@ -1,10 +1,65 @@
>>> +# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
>>> +# The following is the difference between the old and the new license text.
>>> +# Please update the LICENSE value if needed, and summarize the changes in
>>> +# the commit message via 'License-Update:' tag.
>>> +# (example: 'License-Update: copyright years updated.')
>>> +#
>>> +# The changes:
>>> +#
>>> +# --- COPYING
>>> +# +++ COPYING
>>> +# @@ -7,6 +7,11 @@
>>> +#  Copyright: (c) 2004-2010 by Sage Weil <sage@newdream.net>
>>> +#  License: LGPL-2.1 or LGPL-3 (see COPYING-LGPL2.1 and COPYING-LGPL3)
>>> +#
>>> +# +Files: cmake/modules/FindPython*
>>> +# +Copyright:
>>> +# +    Copyright 2000-2020 Kitware, Inc. and Contributors
>>> +# +License: BSD 3-clause
>>> +# +
>>> +#  Files: cmake/modules/FindLTTngUST.cmake
>>> +#  Copyright:
>>> +#      Copyright 2016 Kitware, Inc.
>>> +# @@ -31,6 +36,10 @@
>>> +#  Files: src/include/ceph_hash.cc
>>> +#  Copyright: None
>>> +#  License: Public domain
>>> +# +
>>> +# +Files: src/include/rados.h, except ceph_stable_mod(), which is public domain
>>> +# +Copyright: the authors
>>> +# +License: LGPL-2.1 or LGPL-3 (see COPYING-LGPL2.1 and COPYING-LGPL3)
>>> +#
>>> +#  Files: src/common/bloom_filter.hpp
>>> +#  Copyright: Copyright (C) 2000 Arash Partow <arash@partow.net>
>>> +# @@ -191,4 +200,17 @@
>>> +#
>>> +#  Files: src/include/function2.hpp
>>> +#  Copyright: 2015-2018, Denis Blank
>>> +# -License: Boost Software License, Version 1.0+License: Boost Software License, Version 1.0
>>> +# +
>>> +# +Files: src/include/expected.hpp
>>> +# +Copyright: 2017, Simon Brand
>>> +# +License: CC0
>>> +# +
>>> +# +Files: src/include/uses_allocator.h
>>> +# +Copyright: 2016, Pablo Halpern <phalpern@halpernwightsoftware.com>
>>> +# +License: Boost Software License, Version 1.0
>>> +# +
>>> +# +Files: src/common/async/bind_allocator.h
>>> +# +Copyright: 2020 Red Hat <contact@redhat.com>
>>> +# +           2003-2019 Christopher M. Kohlhoff <chris@kohlhoff.com>
>>> +# +License: Boost Software License, Version 1.0
>>> +#
>>> +#
>>> +
>>>   SUMMARY = "User space components of the Ceph file system"
>>>   LICENSE = "LGPLv2.1 & GPLv2 & Apache-2.0 & MIT"
>>>   LIC_FILES_CHKSUM = "file://COPYING-LGPL2.1;md5=fbc093901857fcd118f065f900982c24 \
>>>                       file://COPYING-GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>>> -                    file://COPYING;md5=4eb012c221c5fd4b760029a2981a6754 \
>>> -"
>>> -inherit cmake python3native python3-dir systemd
>>> +                    file://COPYING;md5=d140fb1fedb53047f0d0830883e7af9f \
>>> +                    "
>>> +inherit cmake distutils3-base systemd
>>> +
>>>   # Disable python pybind support for ceph temporary, when corss compiling pybind,
>>>   # pybind mix cmake and python setup environment, would case a lot of errors.
>>>
>>> @@ -12,15 +67,13 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
>>>              file://0001-ceph-fix-build-errors-for-cross-compile.patch \
>>>              file://0001-fix-host-library-paths-were-used.patch \
>>>              file://ceph.conf \
>>> -           file://0001-add-missing-include-for-atomic-bool.patch \
>>> -           file://0001-cmake-add-support-for-python3.9.patch \
>>> -"
>>> +           file://0001-libcephsqlite-Add-library-soversion-properties.patch \
>>> +           "
>>>
>>> -SRC_URI[md5sum] = "5a949b91199efe130bfe2e57f200eacd"
>>> -SRC_URI[sha256sum] = "ea7fa2be68b3570c5c3aa02774dca27de20b6f20a8498f65e5c4ef375a209ace"
>>> -SRC_URI[sha1sum] = "0503649d7c7d9268cb61b03bbe839106988f87d7"
>>> -SRC_URI[sha384sum] = "57208c126ea8e640c3979073fd64ce58606f17b4b7ed2e005b0792bdfd51b13391af325658d0f68f961f94175d93e891"
>>> -SRC_URI[sha512sum] = "1f55b0a13bf06df782831d0c9d5f8617c22442ab97fb186e6ccb08183e02bf1756caf8633fa6b1cf156c3fb7b1bdff90a60a1249adfad0b9450036e2329bf8ff"
>>> +SRC_URI[sha1sum] = "2a977307df2e054361e2c20e378ecc50b399b1ee"
>>> +SRC_URI[sha256sum] = "30ff943287361b4c3f0a9bf8bcd4399751b91434eec7d602ce6e93c42c741be3"
>>> +SRC_URI[sha384sum] = "1974cd6877afcc8d90aa389326f9462174f47260d26066b7b6e09d4218622226d504c9d5405fea5b295bf68364c1990b"
>>> +SRC_URI[sha512sum] = "42e404aa41565485dc4c08b66efb3de719adee72cfc535586992e15ab4601bfbd909ef61abf412badbbfa7ef13bf91a7c0576fbbf3f9f687bc7b465b21a8c416"
>>>
>>>   DEPENDS = "boost bzip2 curl expat gperf-native \
>>>              keyutils libaio libibverbs lz4 \
>>> @@ -28,6 +81,7 @@ DEPENDS = "boost bzip2 curl expat gperf-native \
>>>              oath openldap openssl \
>>>              python3 python3-cython-native rabbitmq-c rocksdb snappy udev \
>>>              valgrind xfsprogs zlib \
>>> +           lua cryptsetup \
>>>   "
>>>   SYSTEMD_SERVICE_${PN} = " \
>>>           ceph-radosgw@.service \
>>> @@ -92,6 +146,14 @@ do_install_append () {
>>>          mv ${D}${libexecdir}/ceph/ceph_common.sh ${D}${libdir}/ceph
>>>          # WITH_FUSE is set to OFF, remove ceph-fuse related units
>>>          rm ${D}${systemd_unitdir}/system/ceph-fuse.target ${D}${systemd_unitdir}/system/ceph-fuse@.service
>>> +        # Fix up cehpfs-top and any other python installed with wrong #!
>>> +        for i in ${D}${bindir}/* ${D}${sbindir}/*; do
>>> +            if [ -f "$i" ]; then
>>> +                sed -i -e s:${PYTHON}:${USRBINPATH}/env\ ${DISTUTILS_PYTHON}:g $i
>>> +                sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
>>> +            fi
>>> +        done
>>> +
>>>   }
>>>
>>>   do_install_append_class-target () {
>>> @@ -116,7 +178,7 @@ FILES_${PN} += "\
>>>                  ${libdir}/rados-classes/*.so.* \
>>>                  ${libdir}/ceph/compressor/*.so \
>>>                  ${libdir}/rados-classes/*.so \
>>> -               ${libdir}/ceph/*.so \
>>> +               ${libdir}/ceph/*.so \
>>>   "
>>>
>>>   FILES_${PN} += " \
>>> @@ -133,11 +195,10 @@ RDEPENDS_${PN} += "\
>>>                  python3-modules \
>>>                  python3-prettytable \
>>>                  ${PN}-python \
>>> +                gawk \
>>>   "
>>>   COMPATIBLE_HOST = "(x86_64).*"
>>> -PACKAGES += " \
>>> -       ${PN}-python \
>>> -"
>>> +PACKAGE_BEFORE_PN += "${PN}-python"
>>>   INSANE_SKIP_${PN}-python += "ldflags"
>>>   INSANE_SKIP_${PN} += "dev-so"
>>>   CCACHE_DISABLE = "1"
>>> --
>>> 2.25.1
>>>
>>>
>>> 
>>>
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
> 
> 
> 

-- 
Sau!
