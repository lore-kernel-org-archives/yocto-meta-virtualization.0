Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 091EEC678D4
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 01:17:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.12048.1677806251352327760
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 02 Mar 2023 17:17:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2426ff5603=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3230v0fl015701;
	Thu, 2 Mar 2023 17:17:30 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nyeg8e7j2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Mar 2023 17:17:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lE1g52C6WVJhsj4B7+KM7Y8iJmFLDl7KKrona73oID8xdswzn94p6pjkrXW+e5i9IBb6/Ot4RaNhGDbq4wbFeo7jqnNG4tfKMRT2NUOnF3BPnxZ+xijip4/LIt0IJOqqxyYuRsxVQ8l8fsN/U8J6t3S55It1jBipGvWQf0hlj/eyZle8qAMWyx5mPXHlawCL8r7Adjixau6Vm4rZ1Zo6kYkKrXeQLuWtCaagW1LYsrbcHGDd4J9qXOX9/+YhZdNw+rN7OFQAE6c3PHWUcHXjGluaAwptZRhz/792kxw6ukSx1AYKT4oL/eCxg8gEriUao0kOebS2Rs58uMHem1j/qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0bUgtCLnJwhO2m5VJKOIlG29PSsoaxZkWK2vz/MBfo=;
 b=hbwPYmX4T9sKxLbC5JY1wLO4nWh77T/zJ7qhKDyrJQsTsmCYHCviWUthJ8lmy/j59p8n8S5T02UqdO3b5GhwkFzpkLVgirnNL5r/WVJiNpAdHHDcCLN3Gonb4r33paKII0H0Os0WN9dn2ll+X2FNNRf2bFGpdRmmt7yasyKdVz68a8e9zAeBxLDNQFyisDN5b3sbCnoTgyHtcamOT3TtSAlZMZ1Z+E3mS+mlHE2imD4VleQRHMoaftucciLEVKRSL+3bcytwurpgwKki7t/TFW9F+k2zS81/BVO98rQFP+qRPxOl3OAGqDokfY7dJdb4nevl8to+pSgsXn2BfXjjoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Fri, 3 Mar
 2023 01:17:27 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68%4]) with mapi id 15.20.6156.019; Fri, 3 Mar 2023
 01:17:26 +0000
Message-ID: <83fefae9-c822-bdd9-488e-b237c033fa38@windriver.com>
Date: Fri, 3 Mar 2023 09:17:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-virtualization][PATCH 0/1] lxc: templates/lxc-busybox.in:
 if busybox contains init then use it
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
        Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20230301023825.124974-1-xiangyu.chen@eng.windriver.com>
 <ZAEUIxX+2N+Xt6Ez@gmail.com>
Content-Language: en-US
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <ZAEUIxX+2N+Xt6Ez@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::23) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|DS0PR11MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: c0c3ad0b-65bd-4188-62cd-08db1b850d0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mYf1FyqLKzk5ek03hxxDQIGN4fbXwH5YVJaLcX3ZQJU0rMhBQf+GmLJ+AI+S5aJc62Yl9vyWnEzUtT86/nlW8L729vNguA2CUJZyS4kQBQMHN4c0ziioPw3FEjIQoyLzhBaJROwX4uixwfgHVzJgwUR/kBStsk8sjf6YZpKsUh6Hgf6dKotJx1Kh7yBLgmejZSmA1SCaeYwXdV2psrfAIHY8wfr1+qt1wV0IRUZv9QsGc45MRCZra1iY4DwEmzNCZ7iOm9eF6j5aYgy1m6jdvtyEfxQmBhDlMOrMWf/P9XwsCSgFbOm60fEwjCBmJCe9s/XhaW4EOEDHsRR/IWLUsaqU0lT3bp/9bpNHx1/DdDYmzBWm0MQWAFUvtrBCoW/hLfJYEW7OI+kh9ArDZX9TZOweZxeW2VoDfQxweZxUHLxetLWDXmxq2+smZ9ipICfsupakbMxY1kiqrb3KuZeZrIb/n2LMndw8Jqb2MQBbEf/WKnV/v+mOZ2vd3YudT8ZJX6uUKEViJuCeKOespQ9HW5EOhlfMNqNFYoD7PTCKHjqqGvtTW6hh9A1zH1tg8hZj5otV+akRrTTReYlGZvO/7PKXnwtmX5Na/oU8Aua06/Uw2KAr/NSv2xEGCWXWzjFpnq5Un30CjPyWvef7ToslRnyEnzr5+Rw57LC9QLJIf4JagODxH3TeBdBqBq6ObdVKiWtUpCmkP5fYBdC9ftSZoZOYl9TZA5tyDsyHnrOx/fw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(39850400004)(346002)(366004)(396003)(376002)(451199018)(36756003)(6666004)(53546011)(9686003)(6506007)(6512007)(966005)(26005)(6486002)(186003)(4326008)(316002)(41300700001)(18074004)(110136005)(66476007)(66556008)(2906002)(8676002)(44832011)(478600001)(8936002)(5660300002)(38100700002)(31696002)(83170400001)(66946007)(83380400001)(66899018)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZlhEUGVlSlpaN256TmtSb0tEd0ZPYkRFYTRZTlpENjdhTHFCcG83Y0plQ1Bv?=
 =?utf-8?B?NWNFN2FxSFBGVlB2SkgyOFA2WEhCNDQyZzVwU0haMGI2My94dm5PQ08xTlRM?=
 =?utf-8?B?Y2R3ZkJyM2poVW1KSW1FY0NPeEZIOUpwU0cxWW4wWTc5NmJpRXhBa0ZaMGwx?=
 =?utf-8?B?dCtFQk5nTGRMTUdaU1g5alhBNWV4Q1RRUXVoYUFoYlR2NDdlaUl2L1p0ek54?=
 =?utf-8?B?MlVlNTlYU21wVk9nSDFHQXFLYlZWOEJQeVRWc2JCUVljUkZsemU2ZXY1aXA4?=
 =?utf-8?B?NkZUdll2T3lIdTdiTkdKQzJGZzFlVExqcXhmUjlyWWhXUFNxb0xDS3pMOVlX?=
 =?utf-8?B?ZWlydmdMTVVzVHlLbmREOXVQSTZxcGlZc1hZaXUyRzFuZ0RGbThFblFUdW8r?=
 =?utf-8?B?REJXQSsxT3c1QmZtRDJuOVQ4RlI0QVhkK2F1M2l4VDdMMUVDZFY4TjZYRGF3?=
 =?utf-8?B?d0YvTnNueTJ1UTU1RVJuTVFFejBkSmxVejl4aUI0VnJvd3RyTTVoRzRzTTlX?=
 =?utf-8?B?OXhZU1FhRG8xNFcyWi9YYXR4TDNQV0VUbjBXa3k4Vm5keEZzTk9TUlVTc0tp?=
 =?utf-8?B?ck90MFFMT0thQ2ZoNktxblNkRnZLMnlzMlh5OWdoS3J3MXdpeUZuTnFnZ1FL?=
 =?utf-8?B?Z0JNckIwWjVpRUdqTHV4NjZBZVByRWhwdGdYQlBFMWZoa1JKelN1dDV1eGgw?=
 =?utf-8?B?dnBnZEpPTkhtSmNnMnhrYTFzUUJ5U3M2eEJpSmFhUzIyUjRtSGZlMmlkWm80?=
 =?utf-8?B?YXFXUXNBL3M3ZlVaRGZxSnA5WXVQVU1rdnFhRFlCL2IzM3QrZVVqOFFHREh4?=
 =?utf-8?B?eHZ1QW1UWkZHSTIxdnFvcXliNlV2L05QbjdtZzFlYzkyM0RDMGhWSXVCcXo1?=
 =?utf-8?B?UERpc1hXcWR4UEg3ZFh3TE9zdTBxcUxhd0lMdzJTd1h2ZXBZVWRPTmRIMzd1?=
 =?utf-8?B?aTc0R1lqdTg5Vzc0YWorODN4QysrTjM4dCtZUURJRWxPaEs0dm8rZ1A5NkxQ?=
 =?utf-8?B?Um01WGFoNGdzQ0VBTlQ2cHJueTJtRXNoRms0SGZockdTdy90WlZSNjVsWjBv?=
 =?utf-8?B?M0JHWHRhOGJmRnVwc0FFN29jY2pOSWxBOThZMTNxRHNhYXE2Y0t6eWVQN3E3?=
 =?utf-8?B?aDBKYnkyR3hDN25hRXlPM2llc0VEV3NnZEZ5WURLRXJSMDUycHZISDJlYUwy?=
 =?utf-8?B?ajgxa05sZ09zNXExT1dYbVlyd1o2VEJTeWdkOWNTS3hET0RrZmxHK3NUVG9O?=
 =?utf-8?B?UXljS0dMQURRQkx5cE1hWlQrNzlhSFBKN0liVGRrV0c5NDhYYndRTGFhb1Ri?=
 =?utf-8?B?RW9aMGVOMVN1S3Y2cmx1UDhjblNtZFdvYzBQWC9UL0V6bnFqMHViK0c4VXlJ?=
 =?utf-8?B?UDFqY05OVUJBaDZ1TlZtK3VzeHN2L25WYXFWbUgybUEyTzBEa1hGOTBZYUJs?=
 =?utf-8?B?MG51a1BIdWxlMWFpNGFTREQyK3VtdHp5dDkwTlVpK3Z5ZEpIRENMMHppdXBx?=
 =?utf-8?B?MzJsRndydFFveHVSZjlFWXYwby8yejJLbVk5Q0oxRDRkVjY5OURjT0w5QXZw?=
 =?utf-8?B?Qjc3NFlrMFpFZHVMR0trNUthMXJwOGhCSXIyTUJtN0NramJjNTBOc1o2QkZw?=
 =?utf-8?B?UU1ObFFadkhUOFh5S1U2bURuNFpSdWNVdmZxbndDODRyYXcvVGF4SE5YWE10?=
 =?utf-8?B?dnQyZi9MZFhWLzZzbXhuRkFUeXQzRzU1RDQ2QnpnMDR4cWNlUHpzUXdkSk53?=
 =?utf-8?B?RGdYK1F0NmtBNExvZEdtZlFXSWIySVYvYThicUMyNXVCTGRIQUtrSjAzNkJB?=
 =?utf-8?B?MFJuZUM4ZkZQOThSY0F6VTZ2aTdLVE8renROcTNjR0ZJSmM5NWhWZ0x2U2VD?=
 =?utf-8?B?UEhrQ05tL2o2QkVHd2k3RVlENnY4cGdwRzJIcVc4MlVBWXZPeWNldEFlbEt0?=
 =?utf-8?B?MzdlaDJ2dnk4d0l3d3FUNXdseTNMZFpoTTFsUlk5YXNNeHZJMUVhdkg3endT?=
 =?utf-8?B?Tkw2aXd5bDd6NldiZTdRZ2srRS9XeXlpVERva293cDN0L3RwK3piT2Jrb1Mw?=
 =?utf-8?B?VjV5ekEvSlJxazFvZkhZZ1BwdFNBTWduZTlYS3ZFMEMrN05SQXN2ekY3NjNy?=
 =?utf-8?B?K3YrVlBmd3VlVnBvZ0wvYjUvMFhKWGZMT3QxVUNSb2xoL3E0dDBaUHUwY0Zq?=
 =?utf-8?B?amc9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c3ad0b-65bd-4188-62cd-08db1b850d0b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 01:17:26.7757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xEFRep52mqwI0ey0bgl9o2op8OecaTfMzKOpI7UdiXrgYEjpj8L/ZYNa+xMG6wOCYKBaDWx3Ir5iXp+DrTLgbLQJ+LovR3X/5OlolkBKlqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7925
X-Proofpoint-GUID: Yqcq8NhIlYuqh2ohwTZgomRPvRgbQhij
X-Proofpoint-ORIG-GUID: Yqcq8NhIlYuqh2ohwTZgomRPvRgbQhij
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_16,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303030008
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Mar 2023 01:17:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7928

Hi Bruce,


On 3/3/23 05:24, Bruce Ashfield wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> In message: [meta-virtualization][PATCH 0/1] lxc: templates/lxc-busybox.in: if busybox contains init then use it
> on 01/03/2023 Xiangyu Chen wrote:
>
>> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>>
>> Hi Bruce,
>>
>> Recently we found that the lxc ptest has lots of failure cases as below log-1, after checking the
>> code, some cases failed due to related the init progess. For example, lxc-test-exit-code need to
>> start container as daemon, but if using bash as init, the container cannot start correctly.
> Is there an indication of what busybox is providing that bash isn't ?

In my local setup, when using bash as container init, the container 
doesn't support "reboot" and cannot start correctly in a daemon mode, 
test step as below:

lxc-create -t busybox -n t

lxc-start -n t -d

lxc-ls -f

the container "t" status still in "STOPPED", but when we use a busybox 
init instead of bash, the container status is correct in daemon mode.


>
> I don't like to force this in the ptest, while for actual lxc containers
> we still allow bash, which means it may not be functional.

This is a common template for lxc, but I am not sure whether others 
still need bash as lxc container init, so I based the patch

"template-make-busybox-template-compatible-with-core-.patch" to add the 
busybox back.


>
> There are other init options in meta-virt, like the docker tini, if we
> had to enforce something, I'd rather that than busybox.

Good to hear the tini :)

Indeed, enable the busybox-init might need lots of additional effort to 
take care of system which using systemd, otherwise, /sbin/init always to 
be covered by busybox.

>
> Bruce


Br,

Xiangyu


>> So added a busybox init utils checking in lxc-busybox template, if current system busybox contains
>> init then use it, after applying this patch, the ptest result as log-2.
>>
>>
>> ######## 1og-1: ptest without patch #######
>>
>> Starting LXC ptest ###
>> FAIL: lxc-test-api-reboot
>> SKIPPED: lxc-test-apparmor
>> PASS: lxc-test-apparmor-generated
>> FAIL: lxc-test-apparmor-mount
>> PASS: lxc-test-arch-parse
>> FAIL: lxc-test-attach
>> PASS: lxc-test-automount
>> FAIL: lxc-test-autostart
>> PASS: lxc-test-basic
>> FAIL: lxc-test-capabilities
>> FAIL: lxc-test-cgpath
>> PASS: lxc-test-checkpoint-restore
>> FAIL: lxc-test-cloneconfig
>> FAIL: lxc-test-clonetest
>> FAIL: lxc-test-concurrent
>> PASS: lxc-test-config-jump-table
>> FAIL: lxc-test-console
>> FAIL: lxc-test-console-log
>> FAIL: lxc-test-containertests
>> FAIL: lxc-test-createconfig
>> FAIL: lxc-test-createtest
>> PASS: lxc-test-criu-check-feature
>> FAIL: lxc-test-cve-2019-5736
>> FAIL: lxc-test-destroytest
>> FAIL: lxc-test-device-add-remove
>> FAIL: lxc-test-exit-code
>> FAIL: lxc-test-get_item
>> PASS: lxc-test-getkeys
>> PASS: lxc-test-list
>> PASS: lxc-test-locktests
>> FAIL: lxc-test-lxc-attach
>> PASS: lxc-test-lxcpath
>> PASS: lxc-test-may-control
>> FAIL: lxc-test-mount-injection
>> FAIL: lxc-test-no-new-privs
>> PASS: lxc-test-parse-config-file
>> FAIL: lxc-test-proc-pid
>> FAIL: lxc-test-procsys
>> PASS: lxc-test-raw-clone
>> PASS: lxc-test-reboot
>> FAIL: lxc-test-rootfs
>> FAIL: lxc-test-rootfs-options
>> FAIL: lxc-test-saveconfig
>> FAIL: lxc-test-share-ns
>> FAIL: lxc-test-shortlived
>> SKIPPED: lxc-test-shutdowntest
>> FAIL: lxc-test-snapdeps
>> FAIL: lxc-test-snapshot
>> FAIL: lxc-test-startone
>> SKIPPED: lxc-test-state-server
>> FAIL: lxc-test-symlink
>> FAIL: lxc-test-sys-mixed
>> FAIL: lxc-test-sysctls
>> FAIL: lxc-test-unpriv
>> FAIL: lxc-test-usernic
>> PASS: lxc-test-usernsexec
>> PASS: lxc-test-utils
>>
>>
>>
>>
>>
>> Results:
>>      PASSED = 17
>>      FAILED = 37
>>      SKIPPED = 3
>> (for details check individual test log in ./logs directory)
>>
>>
>> ###########log-2: ptest with patch ###################
>> root@intel-x86-64:/usr/lib64/lxc/ptest# ./run-ptest
>> ### Starting LXC ptest ###
>> PASS: lxc-test-api-reboot
>> SKIPPED: lxc-test-apparmor
>> PASS: lxc-test-apparmor-generated
>> FAIL: lxc-test-apparmor-mount
>> PASS: lxc-test-arch-parse
>> PASS: lxc-test-attach
>> PASS: lxc-test-automount
>> PASS: lxc-test-autostart
>> PASS: lxc-test-basic
>> PASS: lxc-test-capabilities
>> PASS: lxc-test-cgpath
>> PASS: lxc-test-checkpoint-restore
>> FAIL: lxc-test-cloneconfig
>> PASS: lxc-test-clonetest
>> PASS: lxc-test-concurrent
>> PASS: lxc-test-config-jump-table
>> PASS: lxc-test-console
>> PASS: lxc-test-console-log
>> PASS: lxc-test-containertests
>> PASS: lxc-test-createconfig
>> PASS: lxc-test-createtest
>> PASS: lxc-test-criu-check-feature
>> PASS: lxc-test-cve-2019-5736
>> PASS: lxc-test-destroytest
>> PASS: lxc-test-device-add-remove
>> PASS: lxc-test-exit-code
>> FAIL: lxc-test-get_item
>> PASS: lxc-test-getkeys
>> PASS: lxc-test-list
>> PASS: lxc-test-locktests
>> PASS: lxc-test-lxc-attach
>> PASS: lxc-test-lxcpath
>> PASS: lxc-test-may-control
>> PASS: lxc-test-mount-injection
>> FAIL: lxc-test-no-new-privs
>> PASS: lxc-test-parse-config-file
>> PASS: lxc-test-proc-pid
>> PASS: lxc-test-procsys
>> PASS: lxc-test-raw-clone
>> PASS: lxc-test-reboot
>> PASS: lxc-test-rootfs
>> PASS: lxc-test-rootfs-options
>> PASS: lxc-test-saveconfig
>> PASS: lxc-test-share-ns
>> PASS: lxc-test-shortlived
>> SKIPPED: lxc-test-shutdowntest
>> FAIL: lxc-test-snapdeps
>> PASS: lxc-test-snapshot
>> PASS: lxc-test-startone
>> SKIPPED: lxc-test-state-server
>> PASS: lxc-test-symlink
>> PASS: lxc-test-sys-mixed
>> PASS: lxc-test-sysctls
>> FAIL: lxc-test-unpriv
>> FAIL: lxc-test-usernic
>> PASS: lxc-test-usernsexec
>> PASS: lxc-test-utils
>>
>> Results:
>>      PASSED = 47
>>      FAILED = 7
>>      SKIPPED = 3
>> (for details check individual test log in ./logs directory)
>>
>>
>>
>>
>> Xiangyu Chen (1):
>>    lxc: templates/lxc-busybox.in: if busybox contains init then use it
>>
>>   ...box-contains-init-use-it-in-containe.patch | 45 +++++++++++++++++++
>>   recipes-containers/lxc/lxc_git.bb             |  1 +
>>   2 files changed, 46 insertions(+)
>>   create mode 100644 recipes-containers/lxc/files/0001-template-if-busybox-contains-init-use-it-in-containe.patch
>>
>> --
>> 2.34.1
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#7908): https://lists.yoctoproject.org/g/meta-virtualization/message/7908
>> Mute This Topic: https://lists.yoctoproject.org/mt/97306618/1050810
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

