Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF0F7C48BF6
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 07:42:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.8318.1708501335181264897
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 20 Feb 2024 23:42:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2781ad8f55=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41L47nr2032213;
	Wed, 21 Feb 2024 07:42:14 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wd2178gv2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 07:42:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iPtp/hIpGTX+CEUPcpe+0zVyT9Ak4721IXmh1ocNeAgDr+UrfAS69q9un966uDgvHHrxlLwrz0SKMPDK856Z3+qP8ZeXby+BX2jtyuJF+WF8C9a13sHiIE96sFzbySTQ9cIvwpEKmvBU0h5GPAo0vFvb460jzPcGXGOTut+L0N7ENg8+VBYNsGMAOjmppte9D4PnpUICPs18b00rq1pXB5Y7tRCW/5juFY0YDVVtmQugBZg9cQdHOtShj0CXwlNqyBIMUi+DSopjJy5nmOZXdVik0vvo9K1MAGqxVKys1L4i290ersvBKKGFHiArKvzE7GN/BZPLvxyKATyLQ0G9zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=us/2xwQNHM8lwneFbZGnbvFwT6IfP530T1Rx0vIo6Os=;
 b=ajM+hgfHDztgpE1BDZcwgDCxNFO9ywVMOOW1enF4mvHEW7fMTyw8/wH80DrVIiCZ1ll+FfN7S5UlQ1PnxFvG0F8RR59eWpLZW641EyEAxYy2fkKXmPBjnhlraFjPecsbc8APWSl6Zx2TlGq7xMKDjOWovfehBdEKxQ0YisJKYdNS9lr1DYgMWOuarRCOSSC/B4RXYtU2WyjJ3m95gfoHeYhvSgXcADbCpATj4jhpMXEPc33n6nHGuKKv4iGHHm368vk++loatDtFWIS0ofQl+B/2LAcJmslJ0Z4PWczpsLRUXDW9lJ78UrnfmxInkLHjQHmLqDHtd2uVSp2KLcbzzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by MW4PR11MB6984.namprd11.prod.outlook.com (2603:10b6:303:22e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Wed, 21 Feb
 2024 07:42:09 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f816:c534:1377:b673]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f816:c534:1377:b673%4]) with mapi id 15.20.7316.018; Wed, 21 Feb 2024
 07:42:08 +0000
Message-ID: <ad2f14cf-1bcf-45cf-91e6-09e381b8b318@eng.windriver.com>
Date: Wed, 21 Feb 2024 15:42:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization][PATCH] libvirt: fix postinstall scriptlets
 failure
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <17B13F840D848DD8.26550@lists.yoctoproject.org>
Cc: meta-virtualization@lists.yoctoproject.org
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <17B13F840D848DD8.26550@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2P153CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::12) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|MW4PR11MB6984:EE_
X-MS-Office365-Filtering-Correlation-Id: 092f6087-986f-4cca-7688-08dc32b09b78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9G2GVEqYPf2LRvnX+98dIZWzNKac9YYv7zpUkiTEy45rRm2tJYfJjeYN8NfMe9qZNDeppZxOS6YW5eZAEklmBVJNf+Z4/t0kXbWO2inG2nmH4IziQGS5+21jv3ZovaQgjMmO1GliZ3PTpGMRYXWM2372xBD9z+YoPp/Q+1aufVHIIZRPZbVPWqyazQDAGsNk0tJ3vFUDw8hiZXLrWJrK9pwu+ACkURi9f5U5Grofn+EmOnCZVLalGOf3glbCBQAOXrlbhni3u9HkgU7VTI789lctFK/MfrHTwmKMDapelhaMNcdUWc/z4m/C22RJxhy6FYHixBToSGR2P1kMg/nt0SiXZVQymnazEkbhFGW2jN1KkGYCIKIjopIbjuW2dTZ9OJnFpdkh21mSyN+ClI2Vs6VHmF2Efy0+hUnMh6yGeC3omz9UU48md5kd+CqQWxC+y3yYhETwyp8V/bUTsbVxQygTZU5kl7FRssVZU9d4Pf+GwR1D5vxCzAx6NX4czyYDn+6fGvkvwByMOFTtWEin8Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SFd6NCtqK1lQUnJaUEVhUjhMdStMUzcxWEFieEFwTE93cExpa0FOTlU3c0JC?=
 =?utf-8?B?YUFnalFPSUlIVjZOOGhYM2ZnMGVvNWkxOG1MYVBuNlE1L3JZTGU0UWcxS254?=
 =?utf-8?B?NVZSMExNaTRadWF3WjRPeVhhTU1DTU5yOUVxbDJVRW9SRTZlMlZsNXZ3SWJn?=
 =?utf-8?B?VFJvNGs0VUhjMEdZTTVXcmxRa0QzUm9qbXNnWk5wMEpHR0ZYSExxQmd0bE1S?=
 =?utf-8?B?Zy9oYm5tN200UEUxSGNOQWJ1d3pGdHQvZ0pKdlRLYURDWjNLTHhtNjg1R0RW?=
 =?utf-8?B?VC9HS3Q1aTVLVENhU1JNNDFPd3AzUWZabVdaUndtMTNKWDY4aE11eHN2V25V?=
 =?utf-8?B?VzZqdTVzU3lkWkFZOWtIanFqNXRESDFnSVpQaWN1dThXU2ZOL2tsRnAxQW1O?=
 =?utf-8?B?dzQvWXhPbXNiVFNRZkd6RVVyNC9hVXNpVXVmZm53V1laMGJKaERFOTB3SEhL?=
 =?utf-8?B?Z2VPVmhMOGsvOXBRSDVITUFmODN0ODliazRYZDhUek8xaWMyRXZiT25HMWFU?=
 =?utf-8?B?bERqdkRtRDNTSDlNd2s0U2JTZWl5eHk5OHRKaHdwbjQzVkMxMTd0NXlmTmxa?=
 =?utf-8?B?Z0dpNVZaUVkvaHhkcnR0Rm9zRnRRcmdIemNkaXJhUDdjeTJGLy9ZdGx2OXln?=
 =?utf-8?B?NE1tdW9Fa2UvS3NJYWxqN0twQ0JCUmQ3a1FlejdCMSt1UUxmUUUwYmFVYS8z?=
 =?utf-8?B?UVkySE9lclpLa1VTUHhkemNlM0pzazF0TkIxemNRKzhTTDNDalc5bkdaZDNT?=
 =?utf-8?B?NXRRU2IzNkRjbnlLMEc0M2hEUTc4SWI4NHZQZFJTd1JKUjlYS0FyWGRPVnI2?=
 =?utf-8?B?eW5hTE5FZU0rUmE5cTllQ1NNU2hkdGQ5N3c2M3FvdzRUYkFtd3pIWEliZnNp?=
 =?utf-8?B?NXNjc25kWm52TXkrLzkycXl4aFlWV081cW5kVkVXU3FYSVU4ckVGRHlyZW81?=
 =?utf-8?B?R0U5NVY1a3BiU2JjNCtraUhsYlJvdGlCWkJZOFpsOW5LNWpHZHhzZnJKRjlI?=
 =?utf-8?B?ZTRFR2tVMGh2Z1Nob2ZsOVdvN1BnaW5RbTU2YkIzVjgrcjFRR1VlVFRueEt1?=
 =?utf-8?B?UnlSZFd1OElqMDFnRWpOTHRvaldVNmRwZ2diTkRYenY0WmxOaVhNb1dkMGli?=
 =?utf-8?B?SzlxcHF3WHkzZ2N1WDZqa0JyV0FCSmNDZUNOcW5ZVW9DSXZFVjZPZmtjeWVL?=
 =?utf-8?B?Q1FiQmRuRFdqRUlFWUdVa2FoK2E5VFZSRFppT09YaXJTNFI5RzNlM1hGaXNT?=
 =?utf-8?B?dzkraGY0Y0JlbkFEdHdFSXlETHRQKy9ZSC9DNlBPN24yaW43MGhJZWdjbnZP?=
 =?utf-8?B?WWZocFRrNXFoaGJJdHgwN1FSaGd5eURaTHFKSWovcnZTMUE1WUUveDlaWlRU?=
 =?utf-8?B?eDQreURHTW9qNUNZRXRTSmFtKzcxdmVtWHVkRzNnZ1lyUnlxd01aVU1XckxH?=
 =?utf-8?B?UWc4d1BJVnlCUFhBWVRhSjgrRmZHbGhnVTd0QjlJZDYzSDdreEptemNWdUpI?=
 =?utf-8?B?aDQrVWg2MW9SbkZRVFlmRFZNRGdLUnZXRmRpQTV2MWJMYndBSTIzd0RoUnkv?=
 =?utf-8?B?UkY3OG1LUnlnMU9PbTB6RmJGUXJnMWZLdlJwZWFxa25xdnk5anY1ZGVab25E?=
 =?utf-8?B?Z3lmS3RiQU9iTWlYOXFuSjkyQktHSERmd0pyTFZjakNnOHRXdFQzMjVUSHVN?=
 =?utf-8?B?YWlsa0pwSS9ZS3BMRm1uZkpEMGxYWHdRSS93NUNKNkdDY1h0ZUVjMjdMdXZX?=
 =?utf-8?B?L0p3WDNtVjUydmFSTEZGSDdtcFVvRDN5SnVMTWNWUzUrcW0vMlJMRWtDeWFi?=
 =?utf-8?B?djd1K3hFUUkxSU9kNGlTak5TY3VFQzFTSWp3cENXSXFwQjJkWEF4VkZHMzZn?=
 =?utf-8?B?ZXo1ZSs5M3NnUmh5bEJsVFhWYTIxVWprNFdLSDJJUk00TzB5dlkvYnJWclhN?=
 =?utf-8?B?cG1WM3BuNmErUUs1eGQyZlRHN3M0Tm9GbjVObm9mS2tZd1NVT1Q2VlE2cDMx?=
 =?utf-8?B?a1NQTGhER0NmUEVGUXBIMVRncGloV3h1NXA5MU1hRU05UUhIaG9rQmwrWkVn?=
 =?utf-8?B?b0NnOVcyNUtYeG1hU3dFM2xDQ1BMRDg1TGIrQlBpTW1yWjlORFo5ajUwd3oy?=
 =?utf-8?B?dC9IVlB2SnZxNWFVTENsR3UxUWJyNUlKVHdGSjNheFo2Z0gybHM4anU2Y1pa?=
 =?utf-8?B?eXc9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 092f6087-986f-4cca-7688-08dc32b09b78
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 07:42:08.6019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cnWTgDmC1jn4LbEPk1dPYWZ29NbCdhPwPRWjRICGd8rZiu4CCwcusgt2RI7wow6NizQW7do6Qh6SEzbxOSonJcaQIVyr5YZYALKe9BYFkcU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6984
X-Proofpoint-GUID: UxcCOkMEXochfBYFAs6zbV_7tGlkao0k
X-Proofpoint-ORIG-GUID: UxcCOkMEXochfBYFAs6zbV_7tGlkao0k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1015 adultscore=0 mlxlogscore=833 lowpriorityscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402210058
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 41L47nr2032213
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 21 Feb 2024 07:42:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8568

Hi Bruce,


As the comment mentioned,=C2=A0 this issue root cause is service A ...=20
service N enable each other caused oe-core's systemctl trap into a dead=20
loop. To simply revert a commit in libvirt is masking the truth, other=20
package might meet this issue,=C2=A0 so a fix using a filter in systemctl=
 to=20
against duplicates has been sent to oe-core mail=20
list(https://lists.openembedded.org/g/openembedded-core/message/195958).


So please ignore this patch and help to remove it from=20
meta-virtualization master-next (commit:=20
79c82358f322983e101e238695a9a77f56a675ab)


Thanks=C2=A0 :)


Br,

Xiangyu

On 2/6/24 19:11, Xiangyu Chen wrote:
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> libvirt upstream has added all sockets for a service being enabled when=
 a
> single one of them is[1], it likes serviceA enable serviceB, serviceB e=
nable
> serviceA, that cause our systemctl script[2] trap into a dead loop in p=
ostinstall
> stage, the error message as below:
>
> Traceback (most recent call last):
>    File "/usr/lib/python3.8/pathlib.py", line 722, in __str__
>      return self._str
> AttributeError: _str
>
> During handling of the above exception, another exception occurred:
> Traceback (most recent call last):
>    File "recipe-sysroot-native/usr/bin/systemctl", line 255, in enable
>      SystemdUnit(self.root, also).enable(unit)
>    File "recipe-sysroot-native/usr/bin/systemctl", line 255, in enable
>      SystemdUnit(self.root, also).enable(unit)
>    File "recipe-sysroot-native/usr/bin/systemctl", line 255, in enable
>      SystemdUnit(self.root, also).enable(unit)
>    [Previous line repeated 988 more times]
> ......
> RecursionError: maximum recursion depth exceeded while calling a Python=
 object
>
> Since we are using systemctl script to process the dependency, so rever=
t that
> commit from upstream.
>
> [1] https://github.com/libvirt/libvirt/commit/826931e95a38af8322f8ad069=
dc89117c6404a00
> [2] https://git.openembedded.org/openembedded-core/tree/meta/recipes-co=
re/systemd/systemd-systemctl/systemctl
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>   ...ert-systemd-Add-Also-between-sockets.patch | 143 +++++++++++++++++=
+
>   recipes-extended/libvirt/libvirt_10.0.0.bb    |   1 +
>   2 files changed, 144 insertions(+)
>   create mode 100644 recipes-extended/libvirt/libvirt/0001-Revert-syste=
md-Add-Also-between-sockets.patch
>
> diff --git a/recipes-extended/libvirt/libvirt/0001-Revert-systemd-Add-A=
lso-between-sockets.patch b/recipes-extended/libvirt/libvirt/0001-Revert-=
systemd-Add-Also-between-sockets.patch
> new file mode 100644
> index 00000000..84367fc3
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/0001-Revert-systemd-Add-Also-bet=
ween-sockets.patch
> @@ -0,0 +1,143 @@
> +From 66aa101abb639c64f71a2867424fb58a39a3bd21 Mon Sep 17 00:00:00 2001
> +From: Xiangyu Chen <xiangyu.chen@windriver.com>
> +Date: Tue, 6 Feb 2024 18:45:53 +0800
> +Subject: [PATCH] Revert "systemd: Add Also between sockets"
> +
> +This reverts commit 826931e95a38af8322f8ad069dc89117c6404a00.
> +
> +We have systemctl script to process the service dependency, this cause=
 our oe-core systemctl script
> +trap into a dead loop.
> +
> +Error as below:
> +Traceback (most recent call last):
> +  File "/usr/lib/python3.8/pathlib.py", line 722, in __str__
> +    return self._str
> +AttributeError: _str
> +
> +During handling of the above exception, another exception occurred:
> +Traceback (most recent call last):
> +  File "recipe-sysroot-native/usr/bin/systemctl", line 255, in enable
> +    SystemdUnit(self.root, also).enable(unit)
> +  File "recipe-sysroot-native/usr/bin/systemctl", line 255, in enable
> +    SystemdUnit(self.root, also).enable(unit)
> +  File "recipe-sysroot-native/usr/bin/systemctl", line 255, in enable
> +    SystemdUnit(self.root, also).enable(unit)
> +  [Previous line repeated 988 more times]
> +......
> +RecursionError: maximum recursion depth exceeded while calling a Pytho=
n object
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> +---
> + src/locking/virtlockd-admin.socket.in | 1 -
> + src/locking/virtlockd.socket.in       | 1 -
> + src/logging/virtlogd-admin.socket.in  | 1 -
> + src/logging/virtlogd.socket.in        | 1 -
> + src/remote/libvirtd-admin.socket.in   | 2 --
> + src/remote/libvirtd-ro.socket.in      | 2 --
> + src/remote/libvirtd.socket.in         | 2 --
> + src/virtd-admin.socket.in             | 2 --
> + src/virtd-ro.socket.in                | 2 --
> + src/virtd.socket.in                   | 2 --
> + 10 files changed, 16 deletions(-)
> +
> +diff --git a/src/locking/virtlockd-admin.socket.in b/src/locking/virtl=
ockd-admin.socket.in
> +index ed5b94edba..8902ae4225 100644
> +--- a/src/locking/virtlockd-admin.socket.in
> ++++ b/src/locking/virtlockd-admin.socket.in
> +@@ -11,4 +11,3 @@ RemoveOnStop=3Dyes
> +
> + [Install]
> + WantedBy=3Dsockets.target
> +-Also=3Dvirtlockd.socket
> +diff --git a/src/locking/virtlockd.socket.in b/src/locking/virtlockd.s=
ocket.in
> +index 4eec90a95e..afd42d124e 100644
> +--- a/src/locking/virtlockd.socket.in
> ++++ b/src/locking/virtlockd.socket.in
> +@@ -9,4 +9,3 @@ RemoveOnStop=3Dyes
> +
> + [Install]
> + WantedBy=3Dsockets.target
> +-Also=3Dvirtlockd-admin.socket
> +diff --git a/src/logging/virtlogd-admin.socket.in b/src/logging/virtlo=
gd-admin.socket.in
> +index 7207878008..a634af8942 100644
> +--- a/src/logging/virtlogd-admin.socket.in
> ++++ b/src/logging/virtlogd-admin.socket.in
> +@@ -11,4 +11,3 @@ RemoveOnStop=3Dyes
> +
> + [Install]
> + WantedBy=3Dsockets.target
> +-Also=3Dvirtlogd.socket
> +diff --git a/src/logging/virtlogd.socket.in b/src/logging/virtlogd.soc=
ket.in
> +index e1d6e30e4d..7c14d03ce4 100644
> +--- a/src/logging/virtlogd.socket.in
> ++++ b/src/logging/virtlogd.socket.in
> +@@ -9,4 +9,3 @@ RemoveOnStop=3Dyes
> +
> + [Install]
> + WantedBy=3Dsockets.target
> +-Also=3Dvirtlogd-admin.socket
> +diff --git a/src/remote/libvirtd-admin.socket.in b/src/remote/libvirtd=
-admin.socket.in
> +index 37efc11357..5cbb83deaa 100644
> +--- a/src/remote/libvirtd-admin.socket.in
> ++++ b/src/remote/libvirtd-admin.socket.in
> +@@ -11,5 +11,3 @@ RemoveOnStop=3Dyes
> +
> + [Install]
> + WantedBy=3Dsockets.target
> +-Also=3Dlibvirtd.socket
> +-Also=3Dlibvirtd-ro.socket
> +diff --git a/src/remote/libvirtd-ro.socket.in b/src/remote/libvirtd-ro=
.socket.in
> +index 6e1fad2272..7e25498728 100644
> +--- a/src/remote/libvirtd-ro.socket.in
> ++++ b/src/remote/libvirtd-ro.socket.in
> +@@ -11,5 +11,3 @@ RemoveOnStop=3Dyes
> +
> + [Install]
> + WantedBy=3Dsockets.target
> +-Also=3Dlibvirtd.socket
> +-Also=3Dlibvirtd-admin.socket
> +diff --git a/src/remote/libvirtd.socket.in b/src/remote/libvirtd.socke=
t.in
> +index 9cd37dc766..919b874acd 100644
> +--- a/src/remote/libvirtd.socket.in
> ++++ b/src/remote/libvirtd.socket.in
> +@@ -9,5 +9,3 @@ RemoveOnStop=3Dyes
> +
> + [Install]
> + WantedBy=3Dsockets.target
> +-Also=3Dlibvirtd-ro.socket
> +-Also=3Dlibvirtd-admin.socket
> +diff --git a/src/virtd-admin.socket.in b/src/virtd-admin.socket.in
> +index 63eabd70f8..d3b260e5b1 100644
> +--- a/src/virtd-admin.socket.in
> ++++ b/src/virtd-admin.socket.in
> +@@ -13,5 +13,3 @@ RemoveOnStop=3Dyes
> +
> + [Install]
> + WantedBy=3Dsockets.target
> +-Also=3D@service@.socket
> +-Also=3D@service@-ro.socket
> +diff --git a/src/virtd-ro.socket.in b/src/virtd-ro.socket.in
> +index 3284af5a4a..2f701c8adb 100644
> +--- a/src/virtd-ro.socket.in
> ++++ b/src/virtd-ro.socket.in
> +@@ -13,5 +13,3 @@ RemoveOnStop=3Dyes
> +
> + [Install]
> + WantedBy=3Dsockets.target
> +-Also=3D@service@.socket
> +-Also=3D@service@-admin.socket
> +diff --git a/src/virtd.socket.in b/src/virtd.socket.in
> +index 502c792e7d..3605b0103e 100644
> +--- a/src/virtd.socket.in
> ++++ b/src/virtd.socket.in
> +@@ -11,5 +11,3 @@ RemoveOnStop=3Dyes
> +
> + [Install]
> + WantedBy=3Dsockets.target
> +-Also=3D@service@-ro.socket
> +-Also=3D@service@-admin.socket
> +--
> +2.25.1
> +
> diff --git a/recipes-extended/libvirt/libvirt_10.0.0.bb b/recipes-exten=
ded/libvirt/libvirt_10.0.0.bb
> index 6b19b700..412fb67b 100644
> --- a/recipes-extended/libvirt/libvirt_10.0.0.bb
> +++ b/recipes-extended/libvirt/libvirt_10.0.0.bb
> @@ -32,6 +32,7 @@ SRC_URI =3D "http://libvirt.org/sources/libvirt-${PV}=
.tar.xz;name=3Dlibvirt \
>              file://gnutls-helper.py \
>              file://0001-prevent-gendispatch.pl-generating-build-path-i=
n-code.patch \
>              file://0001-messon.build-remove-build-path-information-to-=
avoid-.patch \
> +           file://0001-Revert-systemd-Add-Also-between-sockets.patch \
>             "
>  =20
>   SRC_URI[libvirt.sha256sum] =3D "8ba2e72ec8bdd2418554a1474c42c35704c30=
174b7611eaf9a16544b71bcf00a"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8562): https://lists.yoctoproject.org/g/meta-virtua=
lization/message/8562
> Mute This Topic: https://lists.yoctoproject.org/mt/104195353/7175143
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub=
 [xiangyu.chen@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

