Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.68])
 by mx.groups.io with SMTP id smtpd.web12.8595.1619451326722471854
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Apr 2021 08:35:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=cgNaeLJb;
 spf=pass (domain: windriver.com, ip: 40.107.100.68, mailfrom: saul.wold@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ArNtJBu/Y3WZjv5tZaMOJtMBd7HbqO8KTQ0zkJrln0YX6K8XBaaLquqjXrBxjdkI1RgsqRGK1p1bGg9K6dO2OxgMbnmcN5IJiEe+GgEp9fO9L2BiAJAVTb3ubav9zPpIvF7x1t0wy1rs5Vygh3bWtbxlLN8PI4SN9Hn0TMINMxG2Qs9VybNFgu4U99OcpBsvFmAJjwHyhgH1V6OrM/jiWHTPJktjKyOek3Gqu8ut4BHAZfnUSVBm8xZ+LsaQw7q2EhFuNclNUNFc2opcdqP8lY8mhkoaflrnUhDpdqEmKebeYUOOrvQwV0livkYOgrwWDNfc/H3Nrh8DO8OKTTxIsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T53mbloXzxLfjTY6UdAVY2DH18HvvQefXo/B+uhDeFI=;
 b=QV+IXr/pfpgTvBYoJQStI/e/PFfpgsrlCiLUnZbLNcz86ciENaIoR5yoap0hjr+CFcqpUdeK2CbuqakkZ59pwfpQig+M7gg930oVcihw9Wn8l9LkC+kwx7p3pP60izCL4r3qf/0HGCuMMFic2mYUs87fcv81lJwyWwTZEPge2y61N61+Ce+lhG844dKUEXWtrECZTcd2pskfXC+1Ia7oU/kLbtcsAb/5M2q5EsxAvgP78V/xei351UH3F0NyglRM2r+yPZIg6+UlCUggQ8oqk9+6fypgGY5l5EyBPcAa6Sx0zqfe3ON6b4YMziWpechiePaEgVPaBghQzpnub9l3Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T53mbloXzxLfjTY6UdAVY2DH18HvvQefXo/B+uhDeFI=;
 b=cgNaeLJbpSo9xYvM1/uDkRDtQEdZbzjHdUz92HjegE3rnUDPgu1Eg8vbbMygoHv/zpJEqt8V1PqTTXR8sTVdudECf4ajJGkFIX26LD+FG/GANwPGHp4jUapgh1wejXL5Fxsk80ImL0LQB5UgPfHOxp1/Ex8lPgdBrQfeCdgsoek=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CO1PR11MB4883.namprd11.prod.outlook.com (2603:10b6:303:9b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Mon, 26 Apr
 2021 15:35:24 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::351e:20b5:1ef6:48f7%6]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 15:35:24 +0000
Subject: Re: [meta-virtualization] [PATCH] ceph: Upgrade to 16.2.1
To: meta-virtualization@lists.yoctoproject.org
References: <20210423170139.605545-1-saul.wold@windriver.com>
 <CADkTA4MnLEGR-86R7UZEp7ViiMN3T2Lu=qYw-YSGxuiuPNq5vA@mail.gmail.com>
 <CADkTA4PRejMdUQnAEK_oubrLBAT4ZSYS9O5mFq0+RHrfL19rZg@mail.gmail.com>
From: "Saul Wold" <Saul.Wold@windriver.com>
Message-ID: <1505b245-2a24-b1de-3925-54c573778b7e@windriver.com>
Date: Mon, 26 Apr 2021 08:35:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CADkTA4PRejMdUQnAEK_oubrLBAT4ZSYS9O5mFq0+RHrfL19rZg@mail.gmail.com>
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: CO2PR18CA0051.namprd18.prod.outlook.com
 (2603:10b6:104:2::19) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
Return-Path: Saul.Wold@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.23.90.211] (71.238.119.71) by CO2PR18CA0051.namprd18.prod.outlook.com (2603:10b6:104:2::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend Transport; Mon, 26 Apr 2021 15:35:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5d3cc18-30cc-451f-e5b9-08d908c8e8f9
X-MS-TrafficTypeDiagnostic: CO1PR11MB4883:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB488378CF55DC22C7CBFDAF44EE429@CO1PR11MB4883.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kZJbWcPXXXOcbVMMIL29gaSnAQnTl9w3OOv4DoQMQTzRzlBc0kq7Ji2cK/4+c594xDsjhPTkd/yGdd+kdi19uBvqz6eL3FDv4dqQXVRpDn39dBWVZHiaQJuuvgP5ZhCQwu1pu5KpKPxGlbUjLxcja9GmQuFw+WoGhNJdhIy5LD4JLpOSoIdvT1JswJo48EAYxSeOFMMuIij2D6jemQ1WVSk7tjKbo4XuH2RRRKQX18TGwh1k980rbWYCEd74Inm36DGzQ+FJrEzZWT4DlKSw4GGD2sCor6Vc7zizjaWK4wACACaBhi1vHIdi7MdbaoV8yoceNBho0UafcbD2xGEPBIXq83zgaL6XF6aUxyOTVidI2+NvMPOR2lTeRjM+K+FvPF867SKNTeNGF1N+UWI3nxFb7Ct5/BsI3SpQ1hgWd+i06FIVZbM8Ln+9nFNleNCRlYrviRpMLRIv0k1jLB17bc9HJw4ztdOxPESRPX1k0hjIi9/uCd5mM3iRN9uxy0JqHrw/wQZkz6Np9dS9Ox6hvu5K/zz5/f46wUPJ73QbCMJF7OPON2ip5CTD+knLcWV24mAPPlZzgWvVtKCexOQzcu2MgLZLn6gnLdI2bOaOK+DSY/O206k9vDOkd5A4t4WPHmgEz4kfsOpvXpdCeW867r2+Lrc5ZXP5urpg8ojDNlzZmIW9X7HWsz6q2THnY2qrBHsNmq68En+8RLjqkcfqykQu7GDlZoEX8BfBdgdkbfxWO5ceMkDXjHXqJgxT+pU5ZFeQzBRzkdIqZas5Xh0MbmVnYtQf2dQs9GJ8nmo4fPO1rMKy6bLF7HVP0YODCXnzcUFdJZCUnK4l5jVIx+xf8w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(136003)(376002)(396003)(346002)(956004)(8936002)(83380400001)(36756003)(2616005)(66946007)(6916009)(8676002)(66476007)(66556008)(26005)(6486002)(2906002)(38100700002)(186003)(16576012)(30864003)(31686004)(38350700002)(478600001)(53546011)(966005)(86362001)(5660300002)(31696002)(52116002)(316002)(16526019)(45980500001)(43740500002)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?cmR6d1gzSUErOXBDRnZya1NTK3hQa2ZHdW1lM1hNZVpLb2FFcDMycWMrbXlx?=
 =?utf-8?B?YURDR2JmQVI5em9tQzdmSXRUVENXMDVKRzdXSFRZb0l3S05iRVR2T0pjeFFp?=
 =?utf-8?B?T3AwTENXV0dYVGhkL2VEenNuZ0p1dlVaRElTcTBuTXBDMTNYdUFaeHd1M2lt?=
 =?utf-8?B?di9PN0dBSm0rR1BHdGZNazBveVhIQS8xTnU1MENtb2t3aUo3Q1RScWhpMlhM?=
 =?utf-8?B?NERlblZqVlJoQXp0NlYrYVkzSUcrOHV1UnJZdEEvZkwwVVFqZlhmemJpZTBZ?=
 =?utf-8?B?WERUVEFCWGkza2UrTVBrUUlSbWZmbml5b2dtQ01DZlZIc2F6YmwvSUNvVWow?=
 =?utf-8?B?WStKNlIxUlpWc1JSVXp1WENVbE5MVFVPK05OdGRrNjR4VlE4TGJkNzdpKzhy?=
 =?utf-8?B?Y3NqcWVtL0w1WEV0QkRBeVVBK0FKRDV5cFhyMDNSNFpKQXIvdHUxd0Q0WjJ4?=
 =?utf-8?B?N0FXZjl3ZEVNMzROUkRqd2JXejJFTVgyODczTXdFcm9mWmZwMEE0b2duNHlB?=
 =?utf-8?B?SitKS3Erd3BqTHlyaXNkZms0ZWhObTlSVHVlUW1ZbGhpWlZFZEhoenR1dWdV?=
 =?utf-8?B?c3JQV3FHQXprMkhOMDVYVm80R2pFWllTUG1FUUkvUVlHd0tkQk1adEl1ckVP?=
 =?utf-8?B?bWlZNERFalZrR0NvdzdKZzB0c2hpR2R4SEN2SEpQQ3pEUGluRlljZnFxMjhr?=
 =?utf-8?B?b1RqSW42YzFhSjVXVzBUa2JxckFibWFOeHJJbGtsQTVYeEtQc2tHb1VxR1g2?=
 =?utf-8?B?UENRaFBFZkRYVDVIQVNOeFkzeExSeSt2NWtBMXRGVDhiNkw0SDhZRFlMTUho?=
 =?utf-8?B?QUh4Y2R2NVBaeUVmYVJJZkNyRTNOUXQ3QkVVd2l3ZlE1UGkyVEM4anc3MHkr?=
 =?utf-8?B?WWdsWU5VSFZCWW41RnpBaW9ocHZsckk4NmlkVU00QjIweWFURGdINlhFOFZQ?=
 =?utf-8?B?WjFWMGQyNUF1SWRVK28yWXFSNW1HT0NTd2RxUWxzOFlLdW9NVjhuRWt5OGZy?=
 =?utf-8?B?ZlpSRlRSbHRXZndUdkRpU1BCaTJmMzhEODR2WXJFYk93YnkzdDdaRUtpakNa?=
 =?utf-8?B?SzlhZ0xkV1ZmM0pyUjB3dDJQaU1DeXBmdm5IV09rY1JQbVNaM2prdHpuRDh0?=
 =?utf-8?B?clQ1cGd6aXNYQnMzSXNrN0RmWE1MbGxsbGVEd0dXZGFZdW1DUzJBa1ZOcEU3?=
 =?utf-8?B?NENiRitwNUZJYnJURnlpVnJwNVV4RDV3VUFvRXVnejFJVXdKTTIwejlsSFc4?=
 =?utf-8?B?aklNMmIycW4wMHN4QUg1REhGM2NseGdOQm1adlBWc0FKeXg1Qm1TcjRyL2Rt?=
 =?utf-8?B?VlZmaGwxSmtVeXNjRE5TbkZmQUJJMGVVbVdMWGVNWlFkeVlaaTBSZE95ZWd5?=
 =?utf-8?B?bXd3OVMyYWFsQWRpeGpRckNrZVVMNE96L2tITDFYcWIyU1dHL1h2YmJVd2xl?=
 =?utf-8?B?ZEtKaEJxQ20wUW15YW5KdC9qS09PaVpKcVhoeFgzVUhKbEUrWC9JWXloaEt0?=
 =?utf-8?B?d3VYQXJpRCt3RHBlWWxLNmU3akl0RnRPWEJtaU5HYnVqbHJHNzhqMytRUm5l?=
 =?utf-8?B?eDlrM2hEK3hXajdrVWlRNlV5ZlM5aDdaR0pDemxmL0xEdUExRVpRQ1pyZ3Jq?=
 =?utf-8?B?dXowQzk1M2szQnJwM0dhS3VkWVR0eDhRUXBuYWVjK3BDN21EMVpSUkdGbTlE?=
 =?utf-8?B?dFBXazF6d2F0YnZlOHg4NDZXYmpoNndkYUhjUFBsS1ArSFFKNFcxNGZLdUpu?=
 =?utf-8?Q?LafPunmoNgrSs1bWmp6yzHqOkuOAe6yCvngaiYk?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d3cc18-30cc-451f-e5b9-08d908c8e8f9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 15:35:24.5913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CkXL4yj2aBw3ZSvZPwjD7+cK7QCjuJ4C155R9GSA3IPA15U17e1Mwrl3vCl+BP2VJYN0gd1ZSLMqmeEoorgbPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4883
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4/25/21 12:44 PM, Bruce Ashfield wrote:
> On Sun, Apr 25, 2021 at 3:43 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>>
>> I had to adjust the hashes to get this to download, and once I did
>> that, I had to limit the build to avoid OOM, and then ran into this:
>>
Dang, I thought I took care of that. Maybe something happened with 
Devtool, strange.

Ok, I figured out what happened, Version 2 coming, there is some other 
missing change.

>> 24 -Wpessimizing-move -Wredundant-move -Wstrict-null-sentinel
>> -Woverloaded-virtual -fno-new-ttp-matching -fstack-protector-strong
>> -fdiagnostics-color=auto -std=c++17 -o
>> CMakeFiles/rgw_common.dir/rgw_string.cc.o -c
>> /opt/poky/build/tmp/work/core2-64-poky-
>>
>> linux/ceph/16.2.1-r0/ceph-16.2.1/src/rgw/rgw_string.cc
>>
>> | In file included from
>> /opt/poky/build/tmp/work/core2-64-poky-linux/ceph/16.2.1-r0/ceph-16.2.1/src/rgw/rgw_string.cc:4:
>>
>> | /opt/poky/build/tmp/work/core2-64-poky-linux/ceph/16.2.1-r0/ceph-16.2.1/src/rgw/rgw_string.h:
>> In member function 'bool ltstr_nocase::operator()(const string&, const
>> string&) const':
>>
>> | /opt/poky/build/tmp/work/core2-64-poky-linux/ceph/16.2.1-r0/ceph-16.2.1/src/rgw/rgw_string.h:18:23:
>> error: invalid use of incomplete type 'const string' {aka 'const class
>> std::__cxx11::basic_string<char>'}
>>
>> |    18 |     return strcasecmp(s1.c_str(), s2.c_str()) < 0;
>>
>> |       |                       ^~
>>
>> | In file included from
>> /opt/poky/build/tmp/work/core2-64-poky-linux/ceph/16.2.1-r0/recipe-sysroot/usr/include/c++/10.3.0/iosfwd:39,
>>
>> |                  from
>> /opt/poky/build/tmp/work/core2-64-poky-linux/ceph/16.2.1-r0/recipe-sysroot/usr/include/c++/10.3.0/string_view:40,
>>
>> |                  from
>> /opt/poky/build/tmp/work/core2-64-poky-linux/ceph/16.2.1-r0/ceph-16.2.1/src/rgw/rgw_string.h:10,
>>
>> |                  from
>> /opt/poky/build/tmp/work/core2-64-poky-linux/ceph/16.2.1-r0/ceph-16.2.1/src/rgw/rgw_string.cc:4:
>>
>> | /opt/poky/build/tmp/work/core2-64-poky-linux/ceph/16.2.1-r0/recipe-sysroot/usr/include/c++/10.3.0/bits/stringfwd.h:74:11:
>> note: declaration of 'std::string' {aka 'class
>> std::__cxx11::basic_string<char>'}
>>
>> It still may be the OOM kicking in, but this looked like a legit issue.
>>
I did not see this, I will do a full cleanall rebuild with V2 before 
sending it.  V2 is rebased against your master-ceph.

Sau!

>> I pushed my staging branch to meta-virtualization master/ceph so you
>> can have a look.
> 
> argh.  My bad, that should be "master-ceph"
> 
> Bruce
> 
>>
>> Bruce
>>
>> On Fri, Apr 23, 2021 at 1:01 PM Saul Wold <Saul.Wold@windriver.com> wrote:
>>>
>>> This updates the Ceph version to 16.2.1 which required a couple
>>> changes to base code via a rebased patch which also disabled the
>>> sanity check due to it not working correctly, but the actual
>>> compile worked.  Also added a new patch to add soversion information
>>> for the new libcephsqlite library so it would be packaged correctly
>>>
>>> Added fixex for new python script to adjust #! from the native path
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
>>>   .../ceph/{ceph_15.2.9.bb => ceph_16.2.1.bb}   |  84 +++++++++---
>>>   6 files changed, 211 insertions(+), 142 deletions(-)
>>>   delete mode 100644 recipes-extended/ceph/ceph/0001-add-missing-include-for-atomic-bool.patch
>>>   delete mode 100644 recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.9.patch
>>>   create mode 100644 recipes-extended/ceph/ceph/0001-libcephsqlite-Add-library-soversion-properties.patch
>>>   rename recipes-extended/ceph/{ceph_15.2.9.bb => ceph_16.2.1.bb} (64%)
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
>>> similarity index 64%
>>> rename from recipes-extended/ceph/ceph_15.2.9.bb
>>> rename to recipes-extended/ceph/ceph_16.2.1.bb
>>> index 0d821f0..ec62c7b 100644
>>> --- a/recipes-extended/ceph/ceph_15.2.9.bb
>>> +++ b/recipes-extended/ceph/ceph_16.2.1.bb
>>> @@ -1,26 +1,80 @@
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
>>> +#inherit cmake setuptools3 systemd
>>> +inherit cmake distutils3-base systemd
>>> +
>>>   # Disable python pybind support for ceph temporary, when corss compiling pybind,
>>>   # pybind mix cmake and python setup environment, would case a lot of errors.
>>>
>>> +SRC_URI[sha256sum] = "30ff943287361b4c3f0a9bf8bcd4399751b91434eec7d602ce6e93c42c741be3"
>>>   SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
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
>>> +SRC_URI[sha1sum] = "f8cc85e4cc519d7e469a0c3c8327bd1675f0b287"
>>> +SRC_URI[sha384sum] = "29a75a733e5ae8039a5ad603558a9707e36b8c337419039ee97351cdbad57875fa57a365fcde29124cee72734608e245"
>>> +SRC_URI[sha512sum] = "aeb9a91c33221c64ea24603dc88cab346bf0abdf0d41ff85c2e1cf134130737ec1fab1246be0a2fa3af8a655ae1dabb69688855f229f54438e60cb8098175b8e"
>>>
>>>   DEPENDS = "boost bzip2 curl expat gperf-native \
>>>              keyutils libaio libibverbs lz4 \
>>> @@ -28,6 +82,7 @@ DEPENDS = "boost bzip2 curl expat gperf-native \
>>>              oath openldap openssl \
>>>              python3 python3-cython-native rabbitmq-c rocksdb snappy udev \
>>>              valgrind xfsprogs zlib \
>>> +           lua cryptsetup \
>>>   "
>>>   SYSTEMD_SERVICE_${PN} = " \
>>>           ceph-radosgw@.service \
>>> @@ -116,7 +171,7 @@ FILES_${PN} += "\
>>>                  ${libdir}/rados-classes/*.so.* \
>>>                  ${libdir}/ceph/compressor/*.so \
>>>                  ${libdir}/rados-classes/*.so \
>>> -               ${libdir}/ceph/*.so \
>>> +               ${libdir}/ceph/*.so \
>>>   "
>>>
>>>   FILES_${PN} += " \
>>> @@ -133,11 +188,10 @@ RDEPENDS_${PN} += "\
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
> 
> 
> 
> 

-- 
Sau!
