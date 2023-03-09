Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C1AC61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 03:49:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5502.1678333747011127354
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Mar 2023 19:49:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=243279499e=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3293n5V6011539;
	Thu, 9 Mar 2023 03:49:05 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p76amr1vf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Mar 2023 03:49:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWusJf9xkn/YcHexTzsQYSKq261zd3E+dQtomgE1WhbWWdpiEQQWKOuU11eWsRK6kXza1xgTSeM+DEAkiJ0eH8f5byPaRi9+MnmTC8AiXsdGuUh3VSIL2w0cLB7YNGAL8+kP1hh4gI2zf0cBci4phNobLvTBGNWbDSAi3PulKtmZ4VUJ7KWeOrwDnOs1CHQ6m7SPdt1U+1kgdqcTw1W4GUVfRHVlpzzIcJSQmNYROtMtmwmnFmEOFqWu9muSNegi04n32aCZJh9kuWO+Gs8rD5IcGzG85ep8qznRNZ5CwqUt3TTBoBsuGh3Od6hUxLOk/lE+mux1Yr5ARtMoRmCC4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDZoKvp/QYOgBPRQdAWY9PxyO0SHB8bnN0JT32H1hkA=;
 b=Sso6MgmaEloIUieDe2aq9gaf7Qrg/+GXANv10kKkbtGwxhkwSo5UtwZXcGlOcgH2OOKUUjCsgUMcOfb5WK3xFC69c4LHnbu4LVyykDS2yocYAzx56eABMr78Hia7uGdKzPEFzjl8LOuYwsEKh+T3lbg8ntCF0P0IwC0SFDG+yY0oRWUWT4PJpTafXM13NYsL+BovSRCf2aMmMPnoVoKz8jViugbGgMHKkMuRH25/e3QNsf21K6urWSN20nRSRvFH9x0ONdo9b5LwW+oBJp7QIDt6X1Vb6kbby3WQswweicbObG35S6F10GhQaQzg1LPwDiNxiJrfxa8CJkvRiYRHRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Thu, 9 Mar
 2023 03:49:02 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68%4]) with mapi id 15.20.6156.028; Thu, 9 Mar 2023
 03:49:02 +0000
Message-ID: <fdac15fe-933b-c765-33a1-5973df90f920@windriver.com>
Date: Thu, 9 Mar 2023 11:48:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-virtualization][PATCH 0/1] lxc: templates/lxc-busybox.in:
 if busybox contains init then use it
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20230301023825.124974-1-xiangyu.chen@eng.windriver.com>
 <ZAEUIxX+2N+Xt6Ez@gmail.com>
 <83fefae9-c822-bdd9-488e-b237c033fa38@windriver.com>
 <CADkTA4OjL+XfzVK5nKb3JfXfa++ifhgfwp2SOxNweRXrX99FNQ@mail.gmail.com>
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <CADkTA4OjL+XfzVK5nKb3JfXfa++ifhgfwp2SOxNweRXrX99FNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0006.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::14) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|DS0PR11MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: 6765b2b7-0ed0-44b8-48d7-08db2051389a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Elgz8DVvCZcsyWe1/95ttZ6q0IqGhvF5O8aE1qpK8S1BDBuagkzP74ztPSujedZFc62GJ2+baGJk6uEY7zGuRKrf8vxg6DNCFOJxoWW97NKaMsBXS2tw5dcX+xaxB2ratUsBVXKYrom1lwHs8bGrd2BypNFevEWBtcqeJspvlIL+J4zrlm5P4kMkSWhLsqSkHkOe8vv76KgocERAwdbdN2caKEhrrDrBVQgkOcbibeGI19Oy5BKkF8qsqmTUTlcmkg7+dkb36Roqv0moWNvUAccFJuwWhz03riD3hnwubjYeswZ8X/Go98k4aYKU7VAEtOtCc1vFlWQm0itT07AgOy7Yz74hr2EjJ/PxTViZGtOYJPQ971CuBmAo0fhLfeq9U2VRxeR8miIx7fFbetFutYsuJ95J7l8OB3pHDEWpaF6aR5ZvVsNCPGU6QU7t2ILk3U2Hcm7qQso+OvainvTau0QmRHfKfJWp4tdJcRPObIO83KqlZjEEb0uXMhiRgpyBmErYan0c/mcC7KcvmAt3D656CkAUAAyarxszstJH99/6M72KbOWFXGBawrQRQxS0zMRGRg7dgW9aqBRu5pUGpmXVicRLD0vl9jvMjzVdBOYpbDBEUqGO+UEvp86LVnTVa28oRKyZM+sy8WvPoGdZv2r3PQwiTMxB6oMOiFPCVL3qkBRV+dPuL/qFnq57VbmKWrxT5b4+qVdg/chBEfZFjxK9LgykwuPDEwi3ukd5qvI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(366004)(39850400004)(136003)(376002)(346002)(451199018)(83380400001)(31686004)(66899018)(44832011)(30864003)(66476007)(6916009)(66946007)(66556008)(5660300002)(186003)(9686003)(41300700001)(8676002)(38100700002)(36756003)(478600001)(8936002)(2906002)(6666004)(53546011)(26005)(6486002)(31696002)(18074004)(83170400001)(6506007)(4326008)(966005)(6512007)(316002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YjVycTVXRGxuajNhOTc5T0Y4ZkJoWWo1bG1uaEdib2NRcXBrM1JRc2ttL2tm?=
 =?utf-8?B?WnlRVUMyeGxHNkNTZ2NFR2dpOVNkalV2UjQ1MnZxUm4yYlREdFJzUFROcnE1?=
 =?utf-8?B?M2RzSEsrbkFxMDZKeW5oYVhKdWpjSEpsMllWRFUxZVlLWHMvZzdwdm5WU0sw?=
 =?utf-8?B?V0pqZGdaUjMzVnNZT3JSekZpTjFkYXI5ZmRhZDVIeDFXUEtTV0xTZExnd0gz?=
 =?utf-8?B?V2EyamxlMk9Yc2VzWVRsMW5wOXM2YmVxZmJ5SU5MejVVeDFMVXJDRHJBeGtC?=
 =?utf-8?B?dFliMThQSTVMSEdNMnhjVTdicVJZa3BiNFRUQWlYcEt1WVZxcFNVdXlwRzJL?=
 =?utf-8?B?Z3FxM3JxZWM5WHYrenhUZlBqMHAxUzJmZDl3ZTlhQkNSbEpBRTBZdnhtWlNo?=
 =?utf-8?B?UWdSWWRiQTIvTFFrSUJYTFBhRWFKdmpqL21EdkFBc3ZUVFpjMHNRSHZMY2lD?=
 =?utf-8?B?WVM2N1RETDZWbURTNVBFOHdnY0dzblZJdW5uaVMxckduUVRBNFhmV1ZXSGo1?=
 =?utf-8?B?OW5FM1VqNVc0WVpQdlpjUnVGUGM3a2x6V2tmb21hbDRtMjJDWGhMK2xLaW90?=
 =?utf-8?B?SmpDaVEvbkNMN1g2QXJST1hUODlwbm9BU3hqcm5pN1hPay9Ub3FnNWpRQmpB?=
 =?utf-8?B?Z1VnRjVPQkFOTTgxTkdJSythbVV4UTZrMXJnQ21oSWNVTk0rQlh3VExKTC9u?=
 =?utf-8?B?bGVZNzBYMjRnei9uaHloa254VUR0Z1BpS0lzZGhucGhVQ1RrajcxcGkwdmlp?=
 =?utf-8?B?SmZ5OWZZSEFuQWVHYjU5QXRwU0dvZUwvVk40c0JmZ1ZrSWw2aHJyTytoYlRW?=
 =?utf-8?B?Q3dndzdFTm1WSUVtTG5sU0ZPUGJTSnBDejdkS2gyMTYrazRFR3VlaG5xbnQz?=
 =?utf-8?B?WWhjT3dpMEZDS0YwZERPN1RJMndRdHlFSUJNUWJYbXBRWE90L3BxN3labWlP?=
 =?utf-8?B?RHJBY2JCUEVrZTJwbzAxUDYxZXVDUDRNWCtZc1lESmNTY2ZrODRWK1JnYU96?=
 =?utf-8?B?cy9YOVg0R1VJWllSN2dLa2NPMUZuc3JxMjJZaGxaa1VNQzV4TnRvQ3gyZ2dT?=
 =?utf-8?B?YnZiUHZrS3NPcllob01LM0hCbmpNcnB3cEJuQ2NQMnlWdHU1N0wzNURNRlZx?=
 =?utf-8?B?OGlDMU02VC96Z2lVSU9WbGltL0UvUWxkb3hSYWw0ejd5NnUyamtQZXIraWcx?=
 =?utf-8?B?NjloTkpFZmN0Vm1pTmYrMUw5cUUvOGlzVjNzQnR0ZVNGclZXZXZOdGpjR3Fx?=
 =?utf-8?B?bWxaMS9uc000MmlSQzVTUlZ1MmNIZ0ZQNkYybk9NNGkrUGJpeUJ2R1dZRS9l?=
 =?utf-8?B?RTJpOHNGcmVSZ2FkN3BKQ0x2ZDZOb3lJWUEyVHRqYmlHL29IZGR4a1g1ZmYy?=
 =?utf-8?B?bFU1YkdpTEtzcGZseVVRTVlpcksyNll4OHY0SHJFRE5IQVN4VUdlMDJscUhD?=
 =?utf-8?B?dGhqWWw4RnMvVlM5eWdTMzZ2TFFySWM4aTNLOXQ2WWpXeUc5UFpYL29jb3RO?=
 =?utf-8?B?S0RqUVdmL0p4RlZ6OEVPTFBNdXA0a2FyZm5oaDdWQ1Yrd2srNUJmZ3pUUmpq?=
 =?utf-8?B?SHdQVlNJVW94Ujc1d0lNYVpFd2dvRjBHakMwY0diTjMzRFhPaEJEWEhZZEN4?=
 =?utf-8?B?NGJibVp4Ungxa0daNzlMTjdYTWRiT0xlYkdxUWpPSU1uaTFwM1NkME95Zlpq?=
 =?utf-8?B?UkZveWxhWGZVQU9wY0JVYzU0dXcybVdYQUdQWHpVZDcrTUtQY01lRTZWMDk0?=
 =?utf-8?B?QnZuUU5odUZlUEd2UGlXbHdQTXBDOHpLWk4ybksraERWNFpHK2VkTk4wSHlN?=
 =?utf-8?B?M3JBT2xWTVZlTmVsclNXK1o5cEgzYTh0ZTNGcFFlUWUvWEJIbkFTcFBSTkNq?=
 =?utf-8?B?NDZqbCt5TEl2K3o0MkNDRk50U1ZHM2FndHJ6V2lvS3pRNW12RzZ4dWFMakc5?=
 =?utf-8?B?bHgxZy9hVkg4eGJkWExhSi9Zb21DbVZQYXo4cm5lREFvWHVvMWF5djMycHV2?=
 =?utf-8?B?U1EyV2ZpQURaU0EvU2w2Y0IrNUpqbjZlOVlvL3ZabDBkQlNpdlFDamZmT0FJ?=
 =?utf-8?B?ZW1mUFVTM09ObG81U0dIa2ptaUh4ejFDcXgxaklhMS9jbnFyc3RMekpUQllE?=
 =?utf-8?B?UEN3VlFuNzZ1WndXZkRGLzBxaFhXeGNIV002Y2NPaEI1UTNTYjRXN0tNeVFO?=
 =?utf-8?B?Q3c9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6765b2b7-0ed0-44b8-48d7-08db2051389a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 03:49:01.9319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PgkJwjDa2mo8mjuFSY/r3myCOU9cxk3URQwLdtb94iLf3GHL6uWu8bF2mRTwyIrRLRLJzdP731flAJEnp8S798YfQELsaJbe2KKn8MtcwWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7651
X-Proofpoint-GUID: o6PcJDx0prdKqNsA1i-w-w5vWcnH2WCo
X-Proofpoint-ORIG-GUID: o6PcJDx0prdKqNsA1i-w-w5vWcnH2WCo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_15,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303090028
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3293n5V6011539
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 09 Mar 2023 03:49:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7938

Hi Bruce,


Sorry for being late,

On 3/8/23 12:00, Bruce Ashfield wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Thu, Mar 2, 2023 at 8:17=E2=80=AFPM Xiangyu Chen
> <xiangyu.chen@eng.windriver.com> wrote:
>> Hi Bruce,
>>
>>
>> On 3/3/23 05:24, Bruce Ashfield wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
>>>
>>> In message: [meta-virtualization][PATCH 0/1] lxc: templates/lxc-busyb=
ox.in: if busybox contains init then use it
>>> on 01/03/2023 Xiangyu Chen wrote:
>>>
>>>> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>>>>
>>>> Hi Bruce,
>>>>
>>>> Recently we found that the lxc ptest has lots of failure cases as be=
low log-1, after checking the
>>>> code, some cases failed due to related the init progess. For example=
, lxc-test-exit-code need to
>>>> start container as daemon, but if using bash as init, the container =
cannot start correctly.
>>> Is there an indication of what busybox is providing that bash isn't ?
>> In my local setup, when using bash as container init, the container
>> doesn't support "reboot" and cannot start correctly in a daemon mode,
>> test step as below:
>>
>> lxc-create -t busybox -n t
>>
>> lxc-start -n t -d
>>
>> lxc-ls -f
>>
>> the container "t" status still in "STOPPED", but when we use a busybox
>> init instead of bash, the container status is correct in daemon mode.
>>
> I'm setting up to test this myself, but generally speaking we should
> include this detail in the commit log.

Thanks, if we find the final root cause, I'll add our discussion=20
information into the commit and send a v2 patch :p


>
>>> I don't like to force this in the ptest, while for actual lxc contain=
ers
>>> we still allow bash, which means it may not be functional.
>> This is a common template for lxc, but I am not sure whether others
>> still need bash as lxc container init, so I based the patch
>>
>> "template-make-busybox-template-compatible-with-core-.patch" to add th=
e
>> busybox back.
>>
> That's the part that concerns me. Why does our bash behave differently
> than in other lxc integrations and other distros ?
Currently, the behavior is when using lxc with busybox template in=20
daemon mode, the status still stay in "STOPPED", but it's working well=20
in foreground mode.

> Do you have the ability to run the same simple tests you have above on
> a desktop distro ?

I have setup a virtualbox today and did some test with trace, here is=20
something I was found:

As above mentioned,=C2=A0 lxc working well in foreground mode but somethi=
ng=20
wrong with daemon mode, according to manual of lxc-start, the foreground=20
mode attach the tty to /dev/console, but daemon mode doesn't.

I was enable the lxc debug trace as below when start a container with=20
daemon mode (part of init related log and remove timestamp and full=20
source code path)

##### lxc-start -n t -o /tmp/log.txt -l TRACE=C2=A0 -d #####

start - /src/lxc/start.c:post_start:2205 - Started "/sbin/init" with pid=20
"871"
start - /src/lxc/start.c:lxc_serve_state_clients:483 - Set container=20
state to RUNNING

<<<<<<<<< we can see the bash as init was starting, and lxc update mode

start - /src/lxc/start.c:lxc_serve_state_clients:486 - No state clients=20
registered
mainloop - /src/lxc/mainloop.c:__epoll_open:493 - Created epoll instance
mainloop - /mainloop.c:__epoll_open:493 - Created epoll instance
start - /src/lxc/start.c:lxc_poll:626 - Mainloop is ready
start - /src/lxc/start.c:signal_handler:396 - Received signal=20
ssi_signo(17) for ssi_pid(871), si_signo(17), si_pid(871)
start - /src/lxc/start.c:signal_handler:464 - Container init process 871=20
exited

<<<<<<<<<< seems something wrong with the init, it exited and lxc got=20
the exit signal.

start - /src/lxc/start.c:lxc_poll:643 - Closed console mainloop
start - /src/lxc/start.c:lxc_poll:648 - Closed mainloop
start - /src/lxc/start.c:lxc_poll:651 - Closed signal file descriptor 7
..... removed some networking teminating related trace .....
start - /src/lxc/start.c:lxc_serve_state_clients:483 - Set container=20
state to STOPPING

<<<<<<<<<<< now the lxc set container mode back to stop mode.

start - /src/lxc/start.c:lxc_serve_state_clients:486 - No state clients=20
registered
##### end of lxc-start -n t -o /tmp/log.txt -l TRACE=C2=A0 -d #####


Let's use strace to see what happens in container(part of init related lo=
g):

#####strace -s 1024 -f lxc-start -n t -d #####

[pid=C2=A0 1211] execve("/sbin/init", ["/sbin/init"], 0x55a07c90eb30 /* 1=
 var=20
*/ <unfinished ...>
......

[pid=C2=A0 1211] ioctl(2, TIOCGPGRP, 0x7fffe212610c) =3D -1 ENOTTY=20
(Inappropriate ioctl for device)
[pid=C2=A0 1211] rt_sigaction(SIGCHLD, {sa_handler=3D0x5632e07dcec0,=20
sa_mask=3D[], sa_flags=3DSA_RESTORER|SA_RESTART,=20
sa_restorer=3D0x7f1237db3190}, {sa_handler=3DSIG_DFL, sa_mask=3D[],=20
sa_flags=3DSA_RESTORER|SA_RESTART, sa_restorer=3D0x7f1237db3190}, 8) =3D =
0
[pid=C2=A0 1211] ioctl(2, TIOCGPGRP, 0x7fffe21260ec) =3D -1 ENOTTY=20
(Inappropriate ioctl for device)
[pid=C2=A0 1211] prlimit64(0, RLIMIT_NPROC, NULL, {rlim_cur=3D3818,=20
rlim_max=3D3818}) =3D 0
[pid=C2=A0 1211] rt_sigprocmask(SIG_BLOCK, NULL, [], 8) =3D 0
[pid=C2=A0 1211] fcntl(0, F_GETFL)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 =3D 0x8002 (flags O_RDWR|O_LARGEFILE)
[pid=C2=A0 1211] newfstatat(0, "", {st_mode=3DS_IFCHR|0666,=20
st_rdev=3Dmakedev(0x1, 0x3), ...}, AT_EMPTY_PATH) =3D 0
[pid=C2=A0 1211] lseek(0, 0, SEEK_CUR)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D 0
[pid=C2=A0 1211] read(0, "", 1)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 0
[pid=C2=A0 1211] rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) =3D 0
[pid=C2=A0 1211] rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D 0
[pid=C2=A0 1211] exit_group(0)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D ?
[pid=C2=A0 1211] +++ exited with 0 +++
#####end of strace -s 1024 -f lxc-start -n t -d #####

it looks that seems bash stdi/o/err cannot attach the available caused=20
this issue, right?


> I don't want to force this switch to busybox, without understanding if
> we are the only ones seeing this issue .. since that means we are
> simply hiding an issue, versus fixing it.

Yes indeed, if someone is using systemd as init, they need to add extra=20
configurations to setup busybox and keep default systemd init cannot be=20
replaced by busybox in local.conf .


Thanks,

Xiangyu

> Bruce
>>> There are other init options in meta-virt, like the docker tini, if w=
e
>>> had to enforce something, I'd rather that than busybox.
>> Good to hear the tini :)
>>
>> Indeed, enable the busybox-init might need lots of additional effort t=
o
>> take care of system which using systemd, otherwise, /sbin/init always =
to
>> be covered by busybox.
>>
>>> Bruce
>>
>> Br,
>>
>> Xiangyu
>>
>>
>>>> So added a busybox init utils checking in lxc-busybox template, if c=
urrent system busybox contains
>>>> init then use it, after applying this patch, the ptest result as log=
-2.
>>>>
>>>>
>>>> ######## 1og-1: ptest without patch #######
>>>>
>>>> Starting LXC ptest ###
>>>> FAIL: lxc-test-api-reboot
>>>> SKIPPED: lxc-test-apparmor
>>>> PASS: lxc-test-apparmor-generated
>>>> FAIL: lxc-test-apparmor-mount
>>>> PASS: lxc-test-arch-parse
>>>> FAIL: lxc-test-attach
>>>> PASS: lxc-test-automount
>>>> FAIL: lxc-test-autostart
>>>> PASS: lxc-test-basic
>>>> FAIL: lxc-test-capabilities
>>>> FAIL: lxc-test-cgpath
>>>> PASS: lxc-test-checkpoint-restore
>>>> FAIL: lxc-test-cloneconfig
>>>> FAIL: lxc-test-clonetest
>>>> FAIL: lxc-test-concurrent
>>>> PASS: lxc-test-config-jump-table
>>>> FAIL: lxc-test-console
>>>> FAIL: lxc-test-console-log
>>>> FAIL: lxc-test-containertests
>>>> FAIL: lxc-test-createconfig
>>>> FAIL: lxc-test-createtest
>>>> PASS: lxc-test-criu-check-feature
>>>> FAIL: lxc-test-cve-2019-5736
>>>> FAIL: lxc-test-destroytest
>>>> FAIL: lxc-test-device-add-remove
>>>> FAIL: lxc-test-exit-code
>>>> FAIL: lxc-test-get_item
>>>> PASS: lxc-test-getkeys
>>>> PASS: lxc-test-list
>>>> PASS: lxc-test-locktests
>>>> FAIL: lxc-test-lxc-attach
>>>> PASS: lxc-test-lxcpath
>>>> PASS: lxc-test-may-control
>>>> FAIL: lxc-test-mount-injection
>>>> FAIL: lxc-test-no-new-privs
>>>> PASS: lxc-test-parse-config-file
>>>> FAIL: lxc-test-proc-pid
>>>> FAIL: lxc-test-procsys
>>>> PASS: lxc-test-raw-clone
>>>> PASS: lxc-test-reboot
>>>> FAIL: lxc-test-rootfs
>>>> FAIL: lxc-test-rootfs-options
>>>> FAIL: lxc-test-saveconfig
>>>> FAIL: lxc-test-share-ns
>>>> FAIL: lxc-test-shortlived
>>>> SKIPPED: lxc-test-shutdowntest
>>>> FAIL: lxc-test-snapdeps
>>>> FAIL: lxc-test-snapshot
>>>> FAIL: lxc-test-startone
>>>> SKIPPED: lxc-test-state-server
>>>> FAIL: lxc-test-symlink
>>>> FAIL: lxc-test-sys-mixed
>>>> FAIL: lxc-test-sysctls
>>>> FAIL: lxc-test-unpriv
>>>> FAIL: lxc-test-usernic
>>>> PASS: lxc-test-usernsexec
>>>> PASS: lxc-test-utils
>>>>
>>>>
>>>>
>>>>
>>>>
>>>> Results:
>>>>       PASSED =3D 17
>>>>       FAILED =3D 37
>>>>       SKIPPED =3D 3
>>>> (for details check individual test log in ./logs directory)
>>>>
>>>>
>>>> ###########log-2: ptest with patch ###################
>>>> root@intel-x86-64:/usr/lib64/lxc/ptest# ./run-ptest
>>>> ### Starting LXC ptest ###
>>>> PASS: lxc-test-api-reboot
>>>> SKIPPED: lxc-test-apparmor
>>>> PASS: lxc-test-apparmor-generated
>>>> FAIL: lxc-test-apparmor-mount
>>>> PASS: lxc-test-arch-parse
>>>> PASS: lxc-test-attach
>>>> PASS: lxc-test-automount
>>>> PASS: lxc-test-autostart
>>>> PASS: lxc-test-basic
>>>> PASS: lxc-test-capabilities
>>>> PASS: lxc-test-cgpath
>>>> PASS: lxc-test-checkpoint-restore
>>>> FAIL: lxc-test-cloneconfig
>>>> PASS: lxc-test-clonetest
>>>> PASS: lxc-test-concurrent
>>>> PASS: lxc-test-config-jump-table
>>>> PASS: lxc-test-console
>>>> PASS: lxc-test-console-log
>>>> PASS: lxc-test-containertests
>>>> PASS: lxc-test-createconfig
>>>> PASS: lxc-test-createtest
>>>> PASS: lxc-test-criu-check-feature
>>>> PASS: lxc-test-cve-2019-5736
>>>> PASS: lxc-test-destroytest
>>>> PASS: lxc-test-device-add-remove
>>>> PASS: lxc-test-exit-code
>>>> FAIL: lxc-test-get_item
>>>> PASS: lxc-test-getkeys
>>>> PASS: lxc-test-list
>>>> PASS: lxc-test-locktests
>>>> PASS: lxc-test-lxc-attach
>>>> PASS: lxc-test-lxcpath
>>>> PASS: lxc-test-may-control
>>>> PASS: lxc-test-mount-injection
>>>> FAIL: lxc-test-no-new-privs
>>>> PASS: lxc-test-parse-config-file
>>>> PASS: lxc-test-proc-pid
>>>> PASS: lxc-test-procsys
>>>> PASS: lxc-test-raw-clone
>>>> PASS: lxc-test-reboot
>>>> PASS: lxc-test-rootfs
>>>> PASS: lxc-test-rootfs-options
>>>> PASS: lxc-test-saveconfig
>>>> PASS: lxc-test-share-ns
>>>> PASS: lxc-test-shortlived
>>>> SKIPPED: lxc-test-shutdowntest
>>>> FAIL: lxc-test-snapdeps
>>>> PASS: lxc-test-snapshot
>>>> PASS: lxc-test-startone
>>>> SKIPPED: lxc-test-state-server
>>>> PASS: lxc-test-symlink
>>>> PASS: lxc-test-sys-mixed
>>>> PASS: lxc-test-sysctls
>>>> FAIL: lxc-test-unpriv
>>>> FAIL: lxc-test-usernic
>>>> PASS: lxc-test-usernsexec
>>>> PASS: lxc-test-utils
>>>>
>>>> Results:
>>>>       PASSED =3D 47
>>>>       FAILED =3D 7
>>>>       SKIPPED =3D 3
>>>> (for details check individual test log in ./logs directory)
>>>>
>>>>
>>>>
>>>>
>>>> Xiangyu Chen (1):
>>>>     lxc: templates/lxc-busybox.in: if busybox contains init then use=
 it
>>>>
>>>>    ...box-contains-init-use-it-in-containe.patch | 45 ++++++++++++++=
+++++
>>>>    recipes-containers/lxc/lxc_git.bb             |  1 +
>>>>    2 files changed, 46 insertions(+)
>>>>    create mode 100644 recipes-containers/lxc/files/0001-template-if-=
busybox-contains-init-use-it-in-containe.patch
>>>>
>>>> --
>>>> 2.34.1
>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#7908): https://lists.yoctoproject.org/g/meta-vir=
tualization/message/7908
>>>> Mute This Topic: https://lists.yoctoproject.org/mt/97306618/1050810
>>>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/un=
sub [bruce.ashfield@gmail.com]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

