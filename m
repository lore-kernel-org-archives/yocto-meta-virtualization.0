Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60ADAC71153
	for <webhook@archiver.kernel.org>; Mon, 11 Sep 2023 03:12:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.50717.1694401945073026821
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 10 Sep 2023 20:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=H9idL6jn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=76185ee191=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38B2n6xi024782;
	Sun, 10 Sep 2023 20:12:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=9njbECuznke5tT1vDilZnyOzVKbKtGeSHAwkKb/Bctc=; b=
	H9idL6jndJbnG+vAAtm8QhiV923oiuw2pEaHLTp6bIXG17+uU1IWdy71JMRDATqX
	lLV628SctIMnJ4smH7z3cQnAPb0BnFfIVbzhNZxrh9VVTcWsLe05jWYcjSxklSj7
	2zxRGlF7zdMGiaYhCGfNvgiNrXFRTS4sDT236YrRr0VYt+4BXddCsC7HqIB2QQFb
	S8XgxImb++VQJfdGSESFAjCuz8mLP8SRC9jf1BjwjFlm5r5aum3RwSyzsAQe6spm
	BDbPLUtDrpURQI7zw3iTOLRf8XhrrTZBSBFXeaOMP6TUnnO/XIptvKoJFRZ5Wk+J
	uJAbBXJtrvOz5qEZ5fLY4A==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t0m00942s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 10 Sep 2023 20:12:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4z+S9oIiXT9rI3Qdk9CKKgPQGv17iTcx68V2njL1yJ0OKqHEol0991s1y8se/bUGFGYja7rcepqZ2J329Z/er7pyy3yYbtvDw9vVNex/k1Y1ZIl+bQUMrMGjhElturS0e/bHoKmoWXhIroarT/QBOloEAz2Gjc94l8kzbhnfn0EJOY0KR3LwjS0EwI14BtVFB90KiBAQvK9hucdIVFTas5/NPeCVxuqWjQaTiSEpQEu4eZhNjA+0FYA6ClOvfJSCJWptR8DB/nEJc5ohbJX0nIMFNo7bMEx/NpAfnF+bAbhXxDUbwaGL2/J7+PWgndzlXJlnTPOqJXR0+eh/fyRaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9njbECuznke5tT1vDilZnyOzVKbKtGeSHAwkKb/Bctc=;
 b=LgQd6E6i5gCncCrV86Q0EyRtBryA6xEJmR6FXPwW6C9XBBAsTGqIAYCJNoJSgJspfQ9mN0stXaAj2oGzQaTv3pdD5hCFMgLWyvRVUfg0t3MevVDmYGcxr3d1WvKy5o/xVceLL2nGE7UJLPwyp63BjSOyVMTuxCNTRpsfQOO1sSb66mvPYHFa7OtoKgRAzEk7O2smypW/xIuiQOqp/u7NhEUmYRwrxJYyWiBVf65KxBAkRXQ37zrWKR5C7MHO70WDIevWjZei6LvFKWKxoWrWCa3kkltPLPxlczpjNGisfY3R7mEm5B4O1CR+KlYnu5ZZwzbUWhl19b1nHsZMIULkPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM3PR11MB8735.namprd11.prod.outlook.com (2603:10b6:0:4b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Mon, 11 Sep
 2023 03:12:14 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d%6]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 03:12:14 +0000
Message-ID: <9dfa2d21-62b6-7e7a-bb94-f6b5f51df85a@windriver.com>
Date: Mon, 11 Sep 2023 11:12:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [meta-virtualization][PATCH 1/4] oe-go-mod-autogen.py: add script
 to help adding/upgrading go mod recipes
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20230905032203.1896328-1-Qi.Chen@windriver.com>
 <CADkTA4MoM3R7Nu1XgQE+ORYN+oJTa8ubimBrZoWCubk21U93dQ@mail.gmail.com>
 <6f6a39cb-488e-b4bb-4847-475fb29c517b@windriver.com>
 <17822F6A670423F9.2662@lists.yoctoproject.org>
 <CADkTA4NA-sZKYseM-qDKWPnLf4nUh-u=R1hyeJoV_VGjF3269Q@mail.gmail.com>
 <cf4bc1d7-a251-13c1-528c-8d0db2b6ef81@windriver.com>
 <CADkTA4N6eDpN4+ROR4FtbL=om5_TJFTHc7GG9WJ7t+ROAYdeUA@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CADkTA4N6eDpN4+ROR4FtbL=om5_TJFTHc7GG9WJ7t+ROAYdeUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR01CA0125.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::29) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DM3PR11MB8735:EE_
X-MS-Office365-Filtering-Correlation-Id: 866323bc-bfec-4e56-44bf-08dbb274e540
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hTcfXzmE7kL3mvyW7PYrmGdiZUU3NC9wFkh8N7swlN9D0X1RdG/zS6EtdAadnmxfuKpRruuqZAfgOIRcyRfl/3ca3pY0bnG/+Bf7dg1pNIrWNIchZzxlzg5nAw1V37oGKWG4YJBHzRgA78aC4KPXZaDjVMEH4qbt6DTvKApIrbahxUHmet/6QT0dh7mpiPU/ohLF1GLfvnSPniC+FzbirI2fttlaIpy0JpaVsD8jNgbeiWYZECMTSEgXII8B1IAaQxQP5SrMD4bCeDTojlhnhfHlniKR5Vn4V8SRLSFwG8z2MPKBzu8+SMQTGtV+OAH6i43clPCy+ytBJP7Q0alx9dRalBsRekdBRf7fSAaHIYE5C0SDBZCS8LP1zFoYzD5Jidvs7NUgjFiQicgQ++CXuUq2ZLxLqWp/lMz0eMboBPAkYShEQraYGNzOv2epXulN/j1FrjOzYRkXJMv1C36EXaB0z6etgCIZ3mxA1gz758FgyQHW6qWCoriPwtDkI8/LtEGj+0bJxXi2DXuGu3Azt2nWAOvTqwWbURFc1p5r4n2+m0dlrJx3ydfpoSndeu758SAukuEYTLjsNbhpRV+yDtDGjAsoCDxHJyJ4fmLzPNOnWn1C/PERT6NiixbKKiK3G1CRkAQXDSYufQnF+doawDTQb4wiUempz+9s+jIXSyc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(39840400004)(396003)(346002)(1800799009)(186009)(451199024)(6506007)(6486002)(53546011)(6666004)(6512007)(966005)(478600001)(83380400001)(2616005)(30864003)(2906002)(26005)(66476007)(66556008)(66946007)(6916009)(316002)(5660300002)(4326008)(8676002)(8936002)(31696002)(86362001)(36756003)(38100700002)(84970400001)(31686004)(41300700001)(66899024)(21314003)(45980500001)(43740500002)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M3NWNVN4dkJpcHlKc1lvcnc4cnJ1NlNuNUdZWWE5REtJdUlTb0FVa0JyaXhX?=
 =?utf-8?B?V0lQTjhSMDhEU0ZEY2pjU2p4YjRsTHp6UFBqZXJKdERKN1NncDNXd3JTNGg1?=
 =?utf-8?B?a3RRSlVEMnZKWTNRa0lFbEdJMUlLWXhPU016QWE4NW02R2FzSEl0S1RuSjI2?=
 =?utf-8?B?WTFZRXM0THFneHpmWXo4RWFpaHJJU0d6VmJPNitDSmZUUzhIZjBoUSsvdmtH?=
 =?utf-8?B?OXVUYWJKRi90bkY1YmNvTmh0elN3NXpiTzEzeUFJaE96dU1IaWhGWVMwMHV5?=
 =?utf-8?B?YkwybEx3YUNHSDhuZTdZUmRZUytXaDc0Q3N5SU1wKzY0RE10bzJNdWVRN2Z0?=
 =?utf-8?B?dG1jblh0cHRTdzFGLy9aalE3aVhNa1FjNnVIeW0zT3Z1SlI3ZXI4R1BvcUdB?=
 =?utf-8?B?eTY1WGRldUIrc2NFRzZmaU1FRzY5MzlQaWlvZjNjdlV3cWk3VWNzRHAvRTFJ?=
 =?utf-8?B?N2tiNWpBRlN5N3lqV3ZVRVVTVWdrWWpJZjVOWFVxM3Bkd05HNUFBVXB0eGdX?=
 =?utf-8?B?OHFkSy9YNUpjNmtZUEIxVFViYXl6Q3NLQy9LdlI0U2d1SERZbGZ4QWlLbEZ6?=
 =?utf-8?B?cEczS1d6MzdmQ2xlanRMVURsQkFCNFp2bTAxRU5kaVpRY3V0TGlqY3hzK2ph?=
 =?utf-8?B?SDdHenhqSDFUb2FJVEdkVzRvVVdyaVFKMGw5anZKd3ZzWEdwalJhWFlmYWFK?=
 =?utf-8?B?NjJMUmpZUU41blErWkF3cnJnKzFCcDc5ellwWVlRYW1jQ3FHVEpXOW0yVnFr?=
 =?utf-8?B?MTZZai9zQ3B4Y1VreU9lRm80c3JxUDdqN1E4QVRjMWRqOElOWURTM1hSRllv?=
 =?utf-8?B?UjNZdng1RWhOVzNSRVgrU1B6NmQwdU1BS2E3ZmJSVEdUNW5YbW1qQzJzQVZm?=
 =?utf-8?B?RVBpalZxZzJqdklueWZlQ3h5bnRTcC91RjdSR043OEh5TnJiSHIzMEp3RWhl?=
 =?utf-8?B?LzJleW5sQ3BUWjZValk2UElOOUppSFN6MHpWWVduMWloQmJ6NXE3L2hDdEtQ?=
 =?utf-8?B?ZkpnaVVub01oZDRIZHdtSkhQUm5LeXh3YW5GVE5FL2xDRjdyNjdFVnRwQnk5?=
 =?utf-8?B?TE1sWW1zL01ndi9JRXlzRnVVYkVGdDFPS2ZKV0hxcmxobXhabkVhNlYxOUUx?=
 =?utf-8?B?a09PelBkTWlxOWM2SUplMXEwSi9USHk4MmQrdlpIU0JtQXZicC9yVzZxU1pJ?=
 =?utf-8?B?WmU5UUFENGtrd0tjczB3NlhHRXNGbWxET3IzODVzcEpmdTNPYTlrUSttTEpY?=
 =?utf-8?B?d1NlanJjZkRyZHV0dkkwaFFKdEhqRWZZQmhYSnNIOSs5L2dVaGU2MHlqUHB3?=
 =?utf-8?B?S1IyUDVFbWc5S2dCdzVjR3pvZzQ3dkRDUGwyWWVxMDR3SnhTeUpQUjY4Yjln?=
 =?utf-8?B?OEpPRjZvZkM2MU9FU3E1RHpBSldKbHhhMkE2SU5pMVhIcGNiRTlCMlFzYXc5?=
 =?utf-8?B?emw1bmhIZ0xkRDJaVjk1V1ZOYkZoNklOMjgwSVVLOHFYUFNwS1FDM1RnUWhV?=
 =?utf-8?B?Q3pXTy95QjR2K2xIcElYTEloUWdYWXFMODNWVjZ1OTAySVpVL2JlR3VxUWpv?=
 =?utf-8?B?Mi9tOFRZQVFOYUxVdm5lRldXZXhDb0pwM2hVWGJ3VGZzTFdPQ20ySjJJVFBj?=
 =?utf-8?B?Y3ZkNDBHUUtyRjV5WENqVllxK2ZyeThDZnRkMkJ0N2cvdWQ3Tk9meTJVQWFl?=
 =?utf-8?B?dWFreDdkUnZhaEt2OVkrVjIwMWdORElVcmIxN1cxWjlwb29tb1Y4N2VRY0dy?=
 =?utf-8?B?cXRiUS82eU9MbU1OMG0zSW1HeDE4cXBWMk0wK2hLb2V0WEJ2SjVZcit1REF1?=
 =?utf-8?B?S1ByeEZzUHEzTi9BMTRYYytKM2lSWDViRSszdXRDSHNZL2tkcHdKdEFHMWk0?=
 =?utf-8?B?OUlmdVVZZlc1bWJpSVNLak11cEF5d2dUK3FBMzdzRmc0a3N5VmNXZkQvcUhj?=
 =?utf-8?B?cytsUGFFYzlJSHpETG9KdmlhYitHMDlENWtIQmhpZjd2djVQRmVQZWMyQjJY?=
 =?utf-8?B?cTh5Ui9sR1dJZkFpNGc4TWtYalNpM0gwdElmYXoyeVprczJic2hIVTc4NXJn?=
 =?utf-8?B?RWZGTzlLNUx2bStHTVV6V0U0VjNhY0NaTUR3T1E4Z1FWUWdackl1S25RVjMw?=
 =?utf-8?Q?Z99OK/a2t6kZAqCVofi4ZVMAh?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 866323bc-bfec-4e56-44bf-08dbb274e540
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 03:12:13.9665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xltHbXTK781rNWJtODDE2g9jPAJOY6Z3BisbYugVFBOEJULqVyOCA+3u4e0zwqlEhJR1SElWGd5QwMcvZEOJRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8735
X-Proofpoint-GUID: VpbppdvxEM2YZqof-2jzuPTSH1MgNhEi
X-Proofpoint-ORIG-GUID: VpbppdvxEM2YZqof-2jzuPTSH1MgNhEi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-10_18,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309110028
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 38B2n6xi024782
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Sep 2023 03:12:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8292

On 9/9/23 04:05, Bruce Ashfield wrote:
> Indeed.
>
> I've worked around the issues, and have ported a few of my changes to
> your script to make it work similarly to mine in my update environment.
>
> I have more changes to port, but this is enough for now.
>
> You'll see my documentation and --help updates on master-next.
>
> Bruce

Got it. Thanks.

Regards,

Qi

>
>
> On Thu, Sep 7, 2023 at 10:31=E2=80=AFPM ChenQi <Qi.Chen@windriver.com> =
wrote:
>> On 9/8/23 05:09, Bruce Ashfield wrote:
>>> On Tue, Sep 5, 2023 at 10:49=E2=80=AFPM Bruce Ashfield via
>>> lists.yoctoproject.org
>>> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>>>> On Tue, Sep 5, 2023 at 10:41=E2=80=AFPM ChenQi <Qi.Chen@windriver.co=
m> wrote:
>>>>> On 9/5/23 20:26, Bruce Ashfield wrote:
>>>>>> On Mon, Sep 4, 2023 at 11:22=E2=80=AFPM Chen Qi via lists.yoctopro=
ject.org
>>>>>> <Qi.Chen=3Dwindriver.com@lists.yoctoproject.org> wrote:
>>>>>>> From: Chen Qi <Qi.Chen@windriver.com>
>>>>>>>
>>>>>>> oe-go-mod-autogen.py is a helper script for go mod recipes. It fo=
llows
>>>>>>> Bruce's initiative about how to deal with go mod recipes in OE.
>>>>>>>
>>>>>> I thought the techniques looked familiar!
>>>>> Yes, indeed!
>>>>>
>>>>> With golang's current scheme, your approach is the only way to 1) m=
ake
>>>>> these non-vendored go recipes build without network connection at
>>>>> do_compile and 2) conform to OE's download mirroring mechanism. Thi=
s
>>>>> really helps a lot!
>>>>>
>>>>>> I was just working on my script before my holidays as my uprev cyc=
le had
>>>>>> taken me to the non-vendored go recipes and I was running into a f=
ew
>>>>>> corner cases.
>>>>>>
>>>>>> I've got a K3S upgrade already done locally with my tweaked script=
, but
>>>>>> I'll take this for a test run and see if I get the same results wi=
th this.
>>>>> I did use this script to upgrade k3s to 'v1.27.4+k3s1', only for th=
e
>>>>> purpose of verifying this script. Those three files were correctly
>>>>> generated and the build succeeded. Hope you'll get the same result.
>>>> I'm testing the k3s update now, and there are some differences, but
>>>> they are minor and the vendoring looks good.
>>>>
>>>> I'll follow up once I've done a bit more testing.
>>>>
>>>> I can take care of a draft README for the script, and I will likely
>>>> bring over a few of the elements of my script (the ability to do som=
e
>>>> module substitutions on the command line), but otherwise, I don't
>>>> see a lot of gaps .
>>> I've started on a README describing how to run the tool, and have
>>> spent quite a bit of time with the script now (I was using more
>>> heuristics to find the source repository, but using the go VCS
>>> information makes things work much simpler .. which is of course
>>> what you are doing).
>>>
>>> I've also ported some of my changes over (flags, and the ability
>>> to track a branch (which I now realize I probably don't really need).
>>>
>>> That being said, k3s is now failing during processing:
>>>
>>> WARNING: Revision (ec00e662324e) not in
>>> repo(/opt/bruce/poky/meta-virtualization/repos/nats.go)
>>> WARNING: Failed to get requiredrev, repo_url =3D
>>> https://github.com/nats-io/nats.go.git, rev =3D ec00e662324e,
>>> module_name =3D github.com/nats-io/nats.go
>>> WARNING: get_url_srcrev(github.com/nats-io/nats.go,
>>> v1.27.1-0.20230619112143-ec00e662324e) failed
>>>
>>> I'm looking into that issue now.
>>>
>>> I had a more complicated semver regex to pull out the revisions, but =
in this
>>> case, it does appear to be looking for the correct revision in the re=
pository.
>>>
>>> I'm out of time for it today, but will continue working with it tomor=
row.
>>>
>>> Bruce
>>>
>> Hi Bruce,
>>
>> Yes, I just double checked the https://github.com/nats-io/nats.go repo=
,
>> the resivion 'ec00e662324e' does not exist.
>>
>> In k3s master branch, there's a commit to bump its version.
>>
>> -       github.com/nats-io/nats.go v1.27.1-0.20230619112143-ec00e66232=
4e
>> // indirect
>> +       github.com/nats-io/nats.go v1.27.1 // indirect
>>
>> But for v1.27.5+k3s1, the go.mod file is using 'ec00e662324e'.
>>
>> I've filed an issue for k3s: https://github.com/k3s-io/k3s/issues/8320.
>> Let's see how k3s community responds to this.
>>
>> Regards,
>>
>> Qi
>>
>>
>>>> (I was doing things like generating the relocation and src_uri
>>>> information in one run, and the modules.txt in another, but these
>>>> aren't important features, so I'll won't worry about them
>>>> when consolidating the tools).
>>>>
>>>> Bruce
>>>>
>>>>> Regards,
>>>>>
>>>>> Qi
>>>>>
>>>>>> I just didn't have the time to clean mine up to make it presentabl=
e, so
>>>>>> I'm hopeful that this will work and I can take that off my TODO li=
st!
>>>>>>
>>>>>> Bruce
>>>>>>
>>>>>>> Example:
>>>>>>> cmd: <path_to>/meta-virtualization/scripts/oe-go-mod-autogen.py \
>>>>>>>         --repo https://github.com/docker/compose --rev v2.20.3
>>>>>>> output: src_uri.inc, relocation.inc, modules.txt
>>>>>>>
>>>>>>> Copy these three generated files to replace the original ones,
>>>>>>> then we only need update PV and SRCREV, and docker-compose is upg=
raded.
>>>>>>>
>>>>>>> Below are some technical details.
>>>>>>>
>>>>>>> * get module's repo from module name
>>>>>>>
>>>>>>>      This script checks the following two URLs to determine the m=
odule's repo.
>>>>>>>      1. https://<module_name_tweaked>?=3Dgo-get=3D1
>>>>>>>      2. https://pkg.go.dev/<module_name_tweaked>
>>>>>>>
>>>>>>>      The module_name_tweaked is derived from module_name, with th=
e last components
>>>>>>>      removed one by one. Let me use two examples to explain this.
>>>>>>>
>>>>>>>      For module_name sigs.k8s.io/json, the sigs.k8s.io/json is fi=
rst used as
>>>>>>>      module_name_tweaked for searching. And we can correctly get =
the repo URL, so
>>>>>>>      the search stops.
>>>>>>>
>>>>>>>      For module_name github.com/k3s-io/etcd/api/v3, the following=
 ones are used
>>>>>>>      as module_name_tweaked:
>>>>>>>      github.com/k3s-io/etcd/api/v3
>>>>>>>      github.com/k3s-io/etcd/api
>>>>>>>      github.com/k3s-io/etcd
>>>>>>>      And when searching 'github.com/k3s-io/etcd', we get the repo=
 URL, so the search
>>>>>>>      stops.
>>>>>>>
>>>>>>> * determine the srcdir:destdir mapping in 'vendor' creation
>>>>>>>
>>>>>>>      To correctly form the 'vendor' directory, the mapping is cri=
tical.
>>>>>>>      This script makes use of tag matching and path matching to d=
etermine
>>>>>>>      the subpath in the repo for the module.
>>>>>>>
>>>>>>> * avoid subpath being overriden by parent path
>>>>>>>
>>>>>>>      We need to avoid subpath being overriden by parent path. Thi=
s is needed
>>>>>>>      for both SRC_URI ordering in src_uri.inc and the sites mappi=
ng ordering
>>>>>>>      in relocation.inc. This script simply uses the length as the=
 ordering key,
>>>>>>>      simply for the reason that if a path is a subpath of another=
 path, it must
>>>>>>>      be longer.
>>>>>>>
>>>>>>> * the .git suffix is removed to sync with each other
>>>>>>>
>>>>>>>      Unlike normal recipes, go mod recipe usually have many SRC_U=
RIs. This script
>>>>>>>      remove the '.git' suffix from repo URL so that the repo URLs=
 are in sync
>>>>>>>      with each.
>>>>>>>
>>>>>>> * basic directory hierarchy and caching mechanism
>>>>>>>
>>>>>>>      <cwd>/repos: hold the repos downloaded and checked
>>>>>>>      <cwd>/wget-contents: hold the contents to determine the modu=
le's repo
>>>>>>>      <cwd>/wget-contents/<module_name>.repo_url.cache: the repo v=
alue cache
>>>>>>>      This is to avoid unnecessary URL fetching and repo cloning.
>>>>>>>
>>>>>>> * the ERROR_OUT_ON_FETCH_AND_CHECKOUT_FAILURE switch in script
>>>>>>>
>>>>>>>      The script must get the correct repo_url, fullsrc_rev and su=
bpath for
>>>>>>>      each required module in go.mod to correctly generate the src=
_uri.inc and
>>>>>>>      relocation.inc files. If this process fails for any required=
 module, this
>>>>>>>      script stop immediately, as I deliberately set ERROR_OUT_ON_=
FETCH_AND_CHECKOUT_FAILURE
>>>>>>>      to True in this script. The purpose is to encourage people t=
o report
>>>>>>>      problems to meta-virt so that we can improve this script acc=
ording to
>>>>>>>      these feedbacks. But this variable can set to False, then th=
e script
>>>>>>>      only records the failed modules in self.modules_unhandled wi=
th reasons
>>>>>>>      added, people can modify the generated src_uri.inc and reloc=
ation.inc
>>>>>>>      to manually handle these unhandled modules if they are urgen=
t to
>>>>>>>      add/upgrade some go mod recipes.
>>>>>>>
>>>>>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>>>>>> ---
>>>>>>>     scripts/oe-go-mod-autogen.py | 663 ++++++++++++++++++++++++++=
+++++++++
>>>>>>>     1 file changed, 663 insertions(+)
>>>>>>>     create mode 100755 scripts/oe-go-mod-autogen.py
>>>>>>>
>>>>>>> diff --git a/scripts/oe-go-mod-autogen.py b/scripts/oe-go-mod-aut=
ogen.py
>>>>>>> new file mode 100755
>>>>>>> index 00000000..09d6133b
>>>>>>> --- /dev/null
>>>>>>> +++ b/scripts/oe-go-mod-autogen.py
>>>>>>> @@ -0,0 +1,663 @@
>>>>>>> +#!/usr/bin/env python3
>>>>>>> +
>>>>>>> +import os
>>>>>>> +import sys
>>>>>>> +import logging
>>>>>>> +import argparse
>>>>>>> +from collections import OrderedDict
>>>>>>> +import subprocess
>>>>>>> +
>>>>>>> +# This switch is used to make this script error out ASAP, mainly=
 for debugging purpose
>>>>>>> +ERROR_OUT_ON_FETCH_AND_CHECKOUT_FAILURE =3D True
>>>>>>> +
>>>>>>> +logger =3D logging.getLogger('oe-go-mod-autogen')
>>>>>>> +loggerhandler =3D logging.StreamHandler()
>>>>>>> +loggerhandler.setFormatter(logging.Formatter("%(levelname)s: %(m=
essage)s"))
>>>>>>> +logger.addHandler(loggerhandler)
>>>>>>> +logger.setLevel(logging.INFO)
>>>>>>> +
>>>>>>> +class GoModTool(object):
>>>>>>> +    def __init__(self, repo, rev, workdir):
>>>>>>> +        self.repo =3D repo
>>>>>>> +        self.rev =3D rev
>>>>>>> +        self.workdir =3D workdir
>>>>>>> +
>>>>>>> +        # Stores the actual module name and its related informat=
ion
>>>>>>> +        # {module: (repo_url, repo_dest_dir, fullsrcrev)}
>>>>>>> +        self.modules_repoinfo =3D {}
>>>>>>> +
>>>>>>> +        # {module_name: (url, version, destdir, fullsrcrev)}
>>>>>>> +        #
>>>>>>> +        # url: place to get the source codes, we only support gi=
t repo
>>>>>>> +        # version: module version, git tag or git rev
>>>>>>> +        # destdir: place to put the fetched source codes
>>>>>>> +        # fullsrcrev: full src rev which is the value of SRC_REV
>>>>>>> +        #
>>>>>>> +        # e.g.
>>>>>>> +        # For 'github.com/Masterminds/semver/v3 v3.1.1' in go.mo=
d:
>>>>>>> +        # module_name =3D github.com/Masterminds/semver/v3
>>>>>>> +        # url =3D https://github.com/Masterminds/semver
>>>>>>> +        # version =3D v3.1.1
>>>>>>> +        # destdir =3D ${WORKDIR}/${BP}/src/${GO_IMPORT}/vendor/g=
ithub.com/Masterminds/semver/v3
>>>>>>> +        # fullsrcrev =3D d387ce7889a157b19ad7694dba39a562051f41b=
0
>>>>>>> +        self.modules_require =3D OrderedDict()
>>>>>>> +
>>>>>>> +        # {orig_module: (actual_module, actual_version)}
>>>>>>> +        self.modules_replace =3D OrderedDict()
>>>>>>> +
>>>>>>> +        # Unhandled modules
>>>>>>> +        self.modules_unhandled =3D OrderedDict()
>>>>>>> +
>>>>>>> +        # store subpaths used to form srcpath
>>>>>>> +        # {actual_module_name: subpath}
>>>>>>> +        self.modules_subpaths =3D OrderedDict()
>>>>>>> +
>>>>>>> +        # modules's actual source paths, record those that are n=
ot the same with the module itself
>>>>>>> +        self.modules_srcpaths =3D OrderedDict()
>>>>>>> +
>>>>>>> +        # store lines, comment removed
>>>>>>> +        self.require_lines =3D []
>>>>>>> +        self.replace_lines =3D []
>>>>>>> +
>>>>>>> +        # fetch repo
>>>>>>> +        self.fetch_and_checkout_repo(self.repo.split('://')[1], =
self.repo, self.rev, checkout=3DTrue, get_subpath=3DFalse)
>>>>>>> +
>>>>>>> +    def show_go_mod_info(self):
>>>>>>> +        # Print modules_require, modules_replace and modules_unh=
andled
>>>>>>> +        print("modules required:")
>>>>>>> +        for m in self.modules_require:
>>>>>>> +            url, version, destdir, fullrev =3D self.modules_requ=
ire[m]
>>>>>>> +            print("%s %s %s %s" % (m, version, url, fullrev))
>>>>>>> +
>>>>>>> +        print("modules replace:")
>>>>>>> +        for m in self.modules_replace:
>>>>>>> +            actual_module, actual_version =3D self.modules_repla=
ce[m]
>>>>>>> +            print("%s =3D> %s %s" % (m, actual_module, actual_ve=
rsion))
>>>>>>> +
>>>>>>> +        print("modules unhandled:")
>>>>>>> +        for m in self.modules_unhandled:
>>>>>>> +            reason =3D self.modules_unhandled[m]
>>>>>>> +            print("%s unhandled: %s" % (m, reason))
>>>>>>> +
>>>>>>> +    def parse(self):
>>>>>>> +        # check if this repo needs autogen
>>>>>>> +        repo_url, repo_dest_dir, repo_fullrev =3D self.modules_r=
epoinfo[self.repo.split('://')[1]]
>>>>>>> +        if os.path.isdir(os.path.join(repo_dest_dir, 'vendor')):
>>>>>>> +            logger.info("vendor direcotry has already existed fo=
r %s, no need to add other repos" % self.repo)
>>>>>>> +            return
>>>>>>> +        go_mod_file =3D os.path.join(repo_dest_dir, 'go.mod')
>>>>>>> +        if not os.path.exists(go_mod_file):
>>>>>>> +            logger.info("go.mod file does not exist for %s, no n=
eed to add otehr repos" % self.repo)
>>>>>>> +            return
>>>>>>> +        self.parse_go_mod(go_mod_file)
>>>>>>> +        self.show_go_mod_info()
>>>>>>> +
>>>>>>> +    def fetch_and_checkout_repo(self, module_name, repo_url, rev=
, default_protocol=3D'https://', checkout=3DFalse, get_subpath=3DTrue):
>>>>>>> +        """
>>>>>>> +        Fetch repo_url to <workdir>/repos/repo_base_name
>>>>>>> +        """
>>>>>>> +        protocol =3D default_protocol
>>>>>>> +        if '://' in repo_url:
>>>>>>> +            repo_url_final =3D repo_url
>>>>>>> +        else:
>>>>>>> +            repo_url_final =3D default_protocol + repo_url
>>>>>>> +        logger.debug("fetch and checkout %s %s" % (repo_url_fina=
l, rev))
>>>>>>> +        repos_dir =3D os.path.join(self.workdir, 'repos')
>>>>>>> +        if not os.path.exists(repos_dir):
>>>>>>> +            os.makedirs(repos_dir)
>>>>>>> +        repo_basename =3D repo_url.split('/')[-1].split('.git')[=
0]
>>>>>>> +        repo_dest_dir =3D os.path.join(repos_dir, repo_basename)
>>>>>>> +        module_last_name =3D module_name.split('/')[-1]
>>>>>>> +        git_action =3D "fetch"
>>>>>>> +        if os.path.exists(repo_dest_dir):
>>>>>>> +            if checkout:
>>>>>>> +                # check if current HEAD is rev
>>>>>>> +                try:
>>>>>>> +                    headrev =3D subprocess.check_output('git rev=
-list -1 HEAD', shell=3DTrue, cwd=3Drepo_dest_dir).decode('utf-8').strip(=
)
>>>>>>> +                    requiredrev =3D subprocess.check_output('git=
 rev-list -1 %s 2>/dev/null || git rev-list -1 %s/%s' % (rev, module_last=
_name, rev), shell=3DTrue, cwd=3Drepo_dest_dir).decode('utf-8').strip()
>>>>>>> +                    if headrev =3D=3D requiredrev:
>>>>>>> +                        logger.info("%s has already been fetched=
 and checked out as required, skipping" % repo_url)
>>>>>>> +                        self.modules_repoinfo[module_name] =3D (=
repo_url, repo_dest_dir, requiredrev)
>>>>>>> +                        return
>>>>>>> +                    else:
>>>>>>> +                        logger.info("HEAD of %s is not %s, will =
do a clean clone" % (repo_dest_dir, requiredrev))
>>>>>>> +                        git_action =3D "clone"
>>>>>>> +                except:
>>>>>>> +                    logger.info("'git rev-list' in %s failed, wi=
ll do a clean clone" % repo_dest_dir)
>>>>>>> +                    git_action =3D "clone"
>>>>>>> +            else:
>>>>>>> +                # determine if the current repo points to the de=
sired remote repo
>>>>>>> +                try:
>>>>>>> +                    remote_origin_url =3D subprocess.check_outpu=
t('git config --get remote.origin.url', shell=3DTrue, cwd=3Drepo_dest_dir=
).decode('utf-8').strip()
>>>>>>> +                    if remote_origin_url.endswith('.git'):
>>>>>>> +                        if not repo_url_final.endswith('.git'):
>>>>>>> +                            remote_origin_url =3D remote_origin_=
url[:-4]
>>>>>>> +                    else:
>>>>>>> +                        if repo_url_final.endswith('.git'):
>>>>>>> +                            remote_origin_url =3D remote_origin_=
url + '.git'
>>>>>>> +                    if remote_origin_url !=3D repo_url_final:
>>>>>>> +                        logger.info("remote.origin.url for %s is=
 not %s, will do a clean clone" % (repo_dest_dir, repo_url_final))
>>>>>>> +                        git_action =3D "clone"
>>>>>>> +                except:
>>>>>>> +                    logger.info("'git config --get remote.origin=
.url' in %s failed, will do a clean clone" % repo_dest_dir)
>>>>>>> +                    git_action =3D "clone"
>>>>>>> +        else:
>>>>>>> +            # No local repo, clone it.
>>>>>>> +            git_action =3D "clone"
>>>>>>> +
>>>>>>> +        if git_action =3D=3D "clone":
>>>>>>> +            logger.info("Removing %s" % repo_dest_dir)
>>>>>>> +            subprocess.check_call('rm -rf %s' % repo_dest_dir, s=
hell=3DTrue)
>>>>>>> +
>>>>>>> +        # clone/fetch repo
>>>>>>> +        try:
>>>>>>> +            git_cwd =3D repos_dir if git_action =3D=3D "clone" e=
lse repo_dest_dir
>>>>>>> +            logger.info("git %s %s in %s" % (git_action, repo_ur=
l_final, git_cwd))
>>>>>>> +            subprocess.check_call('git %s %s >/dev/null 2>&1' % =
(git_action, repo_url_final), shell=3DTrue, cwd=3Dgit_cwd)
>>>>>>> +        except:
>>>>>>> +            logger.warning("Failed to %s %s in %s" % (git_action=
, repo_url_final, git_cwd))
>>>>>>> +            return
>>>>>>> +
>>>>>>> +        def get_requiredrev(get_subpath):
>>>>>>> +            import re
>>>>>>> +            # check if rev is a revision or a version
>>>>>>> +            if len(rev) =3D=3D 12 and re.match('[0-9a-f]+', rev)=
:
>>>>>>> +                rev_is_version =3D False
>>>>>>> +            else:
>>>>>>> +                rev_is_version =3D True
>>>>>>> +
>>>>>>> +            # if rev is not a version, 'git rev-list -1 <rev>' s=
hould just succeed!
>>>>>>> +            if not rev_is_version:
>>>>>>> +                try:
>>>>>>> +                    rev_return =3D subprocess.check_output('git =
rev-list -1 %s 2>/dev/null' % rev, shell=3DTrue, cwd=3Drepo_dest_dir).dec=
ode('utf-8').strip()
>>>>>>> +                    if get_subpath:
>>>>>>> +                        cmd =3D 'git branch -M toremove && git c=
heckout -b check_subpath %s && git branch -D toremove' % rev_return
>>>>>>> +                        subprocess.check_call(cmd, shell=3DTrue,=
 cwd=3Drepo_dest_dir)
>>>>>>> +                        # try to get the subpath for this module
>>>>>>> +                        module_name_parts =3D module_name.split(=
'/')
>>>>>>> +                        while (len(module_name_parts) > 0):
>>>>>>> +                            subpath =3D '/'.join(module_name_par=
ts)
>>>>>>> +                            dir_to_check =3D repo_dest_dir + '/'=
 + '/'.join(module_name_parts)
>>>>>>> +                            if os.path.isdir(dir_to_check):
>>>>>>> +                                self.modules_subpaths[module_nam=
e] =3D subpath
>>>>>>> +                                break
>>>>>>> +                            else:
>>>>>>> +                                module_name_parts.pop(0)
>>>>>>> +                    return rev_return
>>>>>>> +                except:
>>>>>>> +                    logger.warning("Revision (%s) not in repo(%s=
)" % (rev, repo_dest_dir))
>>>>>>> +                    return None
>>>>>>> +
>>>>>>> +            # the following codes deals with case where rev is a=
 version
>>>>>>> +            # determine the longest match tag, in this way, we c=
an get the current srcpath to be used in relocation.inc
>>>>>>> +            # we first get the initial tag, which is formed from=
 module_name and rev
>>>>>>> +            module_parts =3D module_name.split('/')
>>>>>>> +            if rev.startswith(module_parts[-1] + '.'):
>>>>>>> +                tag =3D '/'.join(module_parts[:-1]) + '/' + rev
>>>>>>> +                last_module_part_replaced =3D True
>>>>>>> +            else:
>>>>>>> +                tag =3D '/'.join(module_parts) + '/' + rev
>>>>>>> +                last_module_part_replaced =3D False
>>>>>>> +            logger.debug("use %s as the initial tag for %s" % (t=
ag, module_name))
>>>>>>> +            tag_parts =3D tag.split('/')
>>>>>>> +            while(len(tag_parts) > 0):
>>>>>>> +                try:
>>>>>>> +                    rev_return =3D subprocess.check_output('git =
rev-list -1 %s 2>/dev/null' % tag, shell=3DTrue, cwd=3Drepo_dest_dir).dec=
ode('utf-8').strip()
>>>>>>> +                    if len(tag_parts) > 1:
>>>>>>> +                        # ensure that the subpath exists
>>>>>>> +                        if get_subpath:
>>>>>>> +                            cmd =3D 'git branch -M toremove && g=
it checkout -b check_subpath %s && git branch -D toremove' % rev_return
>>>>>>> +                            subprocess.check_call(cmd, shell=3DT=
rue, cwd=3Drepo_dest_dir)
>>>>>>> +                            # get subpath for the actual_module_=
name
>>>>>>> +                            if last_module_part_replaced:
>>>>>>> +                                subpath =3D '/'.join(tag_parts[:=
-1]) + '/' + module_parts[-1]
>>>>>>> +                                if not os.path.isdir(repo_dest_d=
ir + '/' + subpath):
>>>>>>> +                                    subpath =3D '/'.join(tag_par=
ts[:-1])
>>>>>>> +                            else:
>>>>>>> +                                subpath =3D '/'.join(tag_parts[:=
-1])
>>>>>>> +                            if not os.path.isdir(repo_dest_dir +=
 '/' + subpath):
>>>>>>> +                                logger.warning("subpath (%s) der=
ived from tag matching does not exist in %s" % (subpath, repo_dest_dir))
>>>>>>> +                                return None
>>>>>>> +                            self.modules_subpaths[module_name] =3D=
 subpath
>>>>>>> +                            logger.info("modules_subpath[%s] =3D=
 %s" % (module_name, subpath))
>>>>>>> +                    return rev_return
>>>>>>> +                except:
>>>>>>> +                    tag_parts.pop(0)
>>>>>>> +                    tag =3D '/'.join(tag_parts)
>>>>>>> +            logger.warning("No tag matching %s" % rev)
>>>>>>> +            return None
>>>>>>> +
>>>>>>> +        requiredrev =3D get_requiredrev(get_subpath)
>>>>>>> +        if requiredrev:
>>>>>>> +            logger.info("Got module(%s) requiredrev: %s" % (modu=
le_name, requiredrev))
>>>>>>> +            if checkout:
>>>>>>> +                subprocess.check_call('git checkout -b gomodauto=
gen %s' % requiredrev, shell=3DTrue, cwd=3Drepo_dest_dir)
>>>>>>> +            self.modules_repoinfo[module_name] =3D (repo_url, re=
po_dest_dir, requiredrev)
>>>>>>> +        else:
>>>>>>> +            logger.warning("Failed to get requiredrev, repo_url =
=3D %s, rev =3D %s, module_name =3D %s" % (repo_url, rev, module_name))
>>>>>>> +
>>>>>>> +    def parse_go_mod(self, go_mod_path):
>>>>>>> +        """
>>>>>>> +        Parse go.mod file to get the modules info
>>>>>>> +        """
>>>>>>> +        # First we get the require and replace lines
>>>>>>> +        # The parsing logic assumes the replace lines come *afte=
r* the require lines
>>>>>>> +        inrequire =3D False
>>>>>>> +        inreplace =3D False
>>>>>>> +        with open(go_mod_path, 'r') as f:
>>>>>>> +            lines =3D f.readlines()
>>>>>>> +            for line in lines:
>>>>>>> +                if line.startswith('require ('):
>>>>>>> +                    inrequire =3D True
>>>>>>> +                    continue
>>>>>>> +                if line.startswith(')'):
>>>>>>> +                    inrequire =3D False
>>>>>>> +                    continue
>>>>>>> +                if line.startswith('require ') or inrequire:
>>>>>>> +                    # we have one line require
>>>>>>> +                    require_line =3D line.lstrip('require ').spl=
it('//')[0].strip()
>>>>>>> +                    if require_line:
>>>>>>> +                        self.require_lines.append(require_line)
>>>>>>> +                    continue
>>>>>>> +                # we can deal with requires and replaces separat=
ely because go.mod always writes requires before replaces
>>>>>>> +                if line.startswith('replace ('):
>>>>>>> +                    inreplace =3D True
>>>>>>> +                    continue
>>>>>>> +                if line.startswith(')'):
>>>>>>> +                    inreplace =3D False
>>>>>>> +                    continue
>>>>>>> +                if line.startswith('replace ') or inreplace:
>>>>>>> +                    replace_line =3D line.lstrip('replace ').spl=
it('//')[0].strip()
>>>>>>> +                    if replace_line:
>>>>>>> +                        self.replace_lines.append(replace_line)
>>>>>>> +                    continue
>>>>>>> +        #
>>>>>>> +        # parse the require_lines and replace_lines to form self=
.modules_require and self.modules_replace
>>>>>>> +        #
>>>>>>> +        logger.debug("Parsing require_lines and replace_lines ..=
.")
>>>>>>> +        # A typical replace line is as below:
>>>>>>> +        #   github.com/hashicorp/golang-lru =3D> github.com/ktoc=
k/golang-lru v0.5.5-0.20211029085301-ec551be6f75c
>>>>>>> +        # It means that the github.com/hashicorp/golang-lru modu=
le is replaced by github.com/ktock/golang-lru
>>>>>>> +        # with the version 'v0.5.5-0.20211029085301-ec551be6f75c=
'.
>>>>>>> +        # So the destdir is vendor/github.com/hashicorp/golang-l=
ru while the contents are from github.com/ktock/golang-lru
>>>>>>> +        for line in self.replace_lines:
>>>>>>> +            orig_module, actual =3D line.split('=3D>')
>>>>>>> +            actual_module, actual_version =3D actual.split()
>>>>>>> +            orig_module =3D orig_module.strip()
>>>>>>> +            actual_module =3D actual_module.strip()
>>>>>>> +            actual_version =3D actual_version.strip()
>>>>>>> +            self.modules_replace[orig_module] =3D (actual_module=
, actual_version)
>>>>>>> +        #
>>>>>>> +        # Typical require lines are as below:
>>>>>>> +        #   github.com/Masterminds/semver/v3 v3.1.1
>>>>>>> +        #   golang.org/x/crypto v0.0.0-20220321153916-2c7772ba30=
64
>>>>>>> +        #
>>>>>>> +        # We need to first try https://<module_name>?=3Dgo-get=3D=
1 to see it contains
>>>>>>> +        # line starting with '<meta name=3D"go-import" content=3D=
'.
>>>>>>> +        #
>>>>>>> +        # If so, get root-path vcs repo-url from content. See ht=
tps://go.dev/ref/mod#vcs-find
>>>>>>> +        # For example, the above 'wget https://golang.org/x/cryp=
to?go-get=3D1' gives you
>>>>>>> +        # <meta name=3D"go-import" content=3D"golang.org/x/crypt=
o git https://go.googlesource.com/crypto">
>>>>>>> +        # In such case, the self.modules_require has the followi=
ng contents:
>>>>>>> +        # module_name: golang.org/x/crypto
>>>>>>> +        # url: https://go.googlesource.com/crypto
>>>>>>> +        # version: v0.0.0-20220321153916-2c7772ba3064
>>>>>>> +        # destdir: ${WORKDIR}/${BP}/src/import/vendor.fetch/gola=
ng.org/x/crypto
>>>>>>> +        # fullsrcrev: 2c7772ba30643b7a2026cbea938420dce7c6384d (=
git rev-list -1 2c7772ba3064)
>>>>>>> +        #
>>>>>>> +        # If not, try https://pkg.go.dev/<module_name>, and find=
 the 'Repository'.
>>>>>>> +        # For example, 'wget https://pkg.go.dev/github.com/Maste=
rminds/semver/v3' gives:
>>>>>>> +        # github.com/Masterminds/semver
>>>>>>> +        # In such case, the self.modules has the following conte=
nts:
>>>>>>> +        # module_name: github.com/Masterminds/semver/v3
>>>>>>> +        # url: https://github.com/Masterminds/semver
>>>>>>> +        # version: v3.1.1
>>>>>>> +        # destdir: ${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/Masterminds/semver/v3
>>>>>>> +        # fullsrcrev: 7bb0c843b53d6ad21a3f619cb22c4b442bb3ef3e (=
git rev-list -1 v3.1.1)
>>>>>>> +        #
>>>>>>> +        # As a last resort, if the last component of <module_nam=
e> matches 'v[0-9]+',
>>>>>>> +        # remove the last component and try wget https://<module=
_name_with_last_component_removed>?go-get=3D1,
>>>>>>> +        # then try using the above matching method.
>>>>>>> +        #
>>>>>>> +        for line in self.require_lines:
>>>>>>> +            module_name, version =3D line.strip().split()
>>>>>>> +            logger.debug("require line: %s" % line)
>>>>>>> +            logger.debug("module_name =3D %s; version =3D %s" % =
(module_name, version))
>>>>>>> +            # take the modules_replace into consideration to get=
 the actual version and actual module name
>>>>>>> +            # note that the module_name is used in destdir, and =
the actual_module_name and actual_version
>>>>>>> +            # are used to determine the url and fullsrcrev
>>>>>>> +            destdir =3D '${WORKDIR}/${BP}/src/import/vendor.fetc=
h/%s' % module_name
>>>>>>> +            actual_module_name =3D module_name
>>>>>>> +            actual_version =3D version
>>>>>>> +            if module_name in self.modules_replace:
>>>>>>> +                actual_module_name, actual_version =3D self.modu=
les_replace[module_name]
>>>>>>> +            logger.debug("actual_module_name =3D %s; actual_vers=
ion =3D %s" % (actual_module_name, actual_version))
>>>>>>> +            url, fullsrcrev =3D self.get_url_srcrev(actual_modul=
e_name, actual_version)
>>>>>>> +            logger.debug("url =3D %s; fullsrcrev =3D %s" % (url,=
 fullsrcrev))
>>>>>>> +            if url and fullsrcrev:
>>>>>>> +                self.modules_require[module_name] =3D (url, vers=
ion, destdir, fullsrcrev)
>>>>>>> +                # form srcpath, actual_module_name/<subpath>
>>>>>>> +                if actual_module_name in self.modules_subpaths:
>>>>>>> +                    subpath =3D self.modules_subpaths[actual_mod=
ule_name]
>>>>>>> +                    srcpath =3D '%s/%s' % (actual_module_name, s=
ubpath)
>>>>>>> +                    self.modules_srcpaths[module_name] =3D srcpa=
th
>>>>>>> +                    logger.info("self.modules_srcpaths[%s] =3D %=
s" % (module_name, srcpath))
>>>>>>> +                else:
>>>>>>> +                    self.modules_srcpaths[module_name] =3D actua=
l_module_name
>>>>>>> +            else:
>>>>>>> +                logger.warning("get_url_srcrev(%s, %s) failed" %=
 (actual_module_name, actual_version))
>>>>>>> +                if ERROR_OUT_ON_FETCH_AND_CHECKOUT_FAILURE:
>>>>>>> +                    sys.exit(1)
>>>>>>> +
>>>>>>> +    def use_wget_to_get_repo_url(self, wget_content_file, url_ca=
che_file, module_name):
>>>>>>> +        """
>>>>>>> +        Use wget to get repo_url for module_name, return None if=
 not found
>>>>>>> +        """
>>>>>>> +        try:
>>>>>>> +            logger.info("wget -O %s https://%s?=3Dgo-get=3D1" % =
(wget_content_file, module_name))
>>>>>>> +            subprocess.check_call('wget -O %s https://%s?=3Dgo-g=
et=3D1' % (wget_content_file, module_name), shell=3DTrue)
>>>>>>> +            with open(wget_content_file, 'r') as f:
>>>>>>> +                for line in f.readlines():
>>>>>>> +                    if '<meta name=3D"go-import" content=3D' in =
line:
>>>>>>> +                        logger.info("Succeed to find go-import c=
ontent for %s" % module_name)
>>>>>>> +                        logger.debug("The line is %s" % line)
>>>>>>> +                        root_path, vcs, repo_url =3D line.split(=
'content=3D')[1].split('"')[1].split()
>>>>>>> +                        logger.info("%s: %s %s %s" % (module_nam=
e, root_path, vcs, repo_url))
>>>>>>> +                        if vcs !=3D 'git':
>>>>>>> +                            logger.warning('%s unhandled as its =
vcs is %s which is not supported by this script.' % (module_name, vcs))
>>>>>>> +                            unhandled_reason =3D 'vcs %s is not =
supported by this script' % vcs
>>>>>>> +                            self.modules_unhandled[module_name] =
=3D unhandled_reason
>>>>>>> +                            return None
>>>>>>> +                        with open(url_cache_file, 'w') as f:
>>>>>>> +                            f.write(repo_url)
>>>>>>> +                        return repo_url
>>>>>>> +        except:
>>>>>>> +            logger.info("wget -O %s https://%s?=3Dgo-get=3D1 fai=
led" % (wget_content_file, module_name))
>>>>>>> +        # if we cannot find repo url from https://<module_name>?=
=3Dgo-get=3D1, try https://pkg.go/dev/<module_name>
>>>>>>> +        try:
>>>>>>> +            logger.info("wget -O %s https://pkg.go.dev/%s" % (wg=
et_content_file, module_name))
>>>>>>> +            subprocess.check_call("wget -O %s https://pkg.go.dev=
/%s" % (wget_content_file, module_name), shell=3DTrue)
>>>>>>> +            repo_url_found =3D False
>>>>>>> +            with open(wget_content_file, 'r') as f:
>>>>>>> +                in_repo_section =3D False
>>>>>>> +                for line in f.readlines():
>>>>>>> +                    if '>Repository<' in line:
>>>>>>> +                        in_repo_section =3D True
>>>>>>> +                        continue
>>>>>>> +                    if in_repo_section:
>>>>>>> +                        newline =3D line.strip()
>>>>>>> +                        if newline !=3D '' and not newline.start=
swith('<'):
>>>>>>> +                            repo_url =3D newline
>>>>>>> +                            repo_url_found =3D True
>>>>>>> +                            break
>>>>>>> +            if repo_url_found:
>>>>>>> +                logger.info("repo url for %s: %s" % (module_name=
, repo_url))
>>>>>>> +                with open(url_cache_file, 'w') as f:
>>>>>>> +                    f.write(repo_url)
>>>>>>> +                return repo_url
>>>>>>> +            else:
>>>>>>> +                unhandled_reason =3D 'cannot determine repo_url =
for %s' % module_name
>>>>>>> +                self.modules_unhandled[module_name] =3D unhandle=
d_reason
>>>>>>> +                return None
>>>>>>> +        except:
>>>>>>> +            logger.info("wget -O %s https://pkg.go.dev/%s failed=
" % (wget_content_file, module_name))
>>>>>>> +            return None
>>>>>>> +
>>>>>>> +
>>>>>>> +    def get_repo_url_rev(self, module_name, version):
>>>>>>> +        """
>>>>>>> +        Return (repo_url, rev)
>>>>>>> +        """
>>>>>>> +        import re
>>>>>>> +        # First get rev from version
>>>>>>> +        v =3D version.split('+incompatible')[0]
>>>>>>> +        version_components =3D v.split('-')
>>>>>>> +        if len(version_components) =3D=3D 1:
>>>>>>> +            rev =3D v
>>>>>>> +        elif len(version_components) =3D=3D 3:
>>>>>>> +            if len(version_components[2]) =3D=3D 12:
>>>>>>> +                rev =3D version_components[2]
>>>>>>> +            else:
>>>>>>> +                rev =3D v
>>>>>>> +        else:
>>>>>>> +            rev =3D v
>>>>>>> +
>>>>>>> +        #
>>>>>>> +        # Get repo_url
>>>>>>> +        # We put a cache mechanism here, <wget_content_file>.rep=
o_url.cache is used to store the repo url fetch before
>>>>>>> +        #
>>>>>>> +        wget_dir =3D os.path.join(self.workdir, 'wget-contents')
>>>>>>> +        if not os.path.exists(wget_dir):
>>>>>>> +            os.makedirs(wget_dir)
>>>>>>> +        wget_content_file =3D os.path.join(wget_dir, module_name=
.replace('/', '_'))
>>>>>>> +        url_cache_file =3D "%s.repo_url.cache" % wget_content_fi=
le
>>>>>>> +        if os.path.exists(url_cache_file):
>>>>>>> +            with open(url_cache_file, 'r') as f:
>>>>>>> +                repo_url =3D f.readline().strip()
>>>>>>> +                return (repo_url, rev)
>>>>>>> +        module_name_parts =3D module_name.split('/')
>>>>>>> +        while (len(module_name_parts) > 0):
>>>>>>> +            module_name_to_check =3D '/'.join(module_name_parts)
>>>>>>> +            logger.info("module_name_to_check: %s" % module_name=
_to_check)
>>>>>>> +            repo_url =3D self.use_wget_to_get_repo_url(wget_cont=
ent_file, url_cache_file, module_name_to_check)
>>>>>>> +            if repo_url:
>>>>>>> +                return (repo_url, rev)
>>>>>>> +            else:
>>>>>>> +                if module_name in self.modules_unhandled:
>>>>>>> +                    return (None, rev)
>>>>>>> +                else:
>>>>>>> +                    module_name_parts.pop(-1)
>>>>>>> +
>>>>>>> +        unhandled_reason =3D 'cannot determine the repo for %s' =
% module_name
>>>>>>> +        self.modules_unhandled[module_name] =3D unhandled_reason
>>>>>>> +        return (None, rev)
>>>>>>> +
>>>>>>> +    def get_url_srcrev(self, module_name, version):
>>>>>>> +        """
>>>>>>> +        Return url and fullsrcrev according to module_name and v=
ersion
>>>>>>> +        """
>>>>>>> +        repo_url, rev =3D self.get_repo_url_rev(module_name, ver=
sion)
>>>>>>> +        if not repo_url or not rev:
>>>>>>> +            return (None, None)
>>>>>>> +        self.fetch_and_checkout_repo(module_name, repo_url, rev)
>>>>>>> +        if module_name in self.modules_repoinfo:
>>>>>>> +            repo_url, repo_dest_dir, repo_fullrev =3D self.modul=
es_repoinfo[module_name]
>>>>>>> +            # remove the .git suffix to sync repos across module=
s with different versions and across recipes
>>>>>>> +            if repo_url.endswith('.git'):
>>>>>>> +                repo_url =3D repo_url[:-len('.git')]
>>>>>>> +            return (repo_url, repo_fullrev)
>>>>>>> +        else:
>>>>>>> +            unhandled_reason =3D 'fetch_and_checkout_repo(%s, %s=
, %s) failed' % (module_name, repo_url, rev)
>>>>>>> +            self.modules_unhandled[module_name] =3D unhandled_re=
ason
>>>>>>> +            return (None, None)
>>>>>>> +
>>>>>>> +    def gen_src_uri_inc(self):
>>>>>>> +        """
>>>>>>> +        Generate src_uri.inc file containing SRC_URIs
>>>>>>> +        """
>>>>>>> +        src_uri_inc_file =3D os.path.join(self.workdir, 'src_uri=
.inc')
>>>>>>> +        # record the <name> after writting SRCREV_<name>, this i=
s to avoid modules having the same basename resulting in same SRCREV_xxx
>>>>>>> +        srcrev_name_recorded =3D []
>>>>>>> +        template =3D """#       %s %s
>>>>>>> +# [1] git ls-remote %s %s
>>>>>>> +SRCREV_%s=3D"%s"
>>>>>>> +SRC_URI +=3D "git://%s;name=3D%s;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/%s"
>>>>>>> +
>>>>>>> +"""
>>>>>>> +        # We can't simply write SRC_URIs one by one in the order=
 that go.mod specify them.
>>>>>>> +        # Because the latter one might clean things up for the f=
ormer one if the former one is a subpath of the latter one.
>>>>>>> +        def take_first_len(elem):
>>>>>>> +            return len(elem[0])
>>>>>>> +
>>>>>>> +        src_uri_contents =3D []
>>>>>>> +        with open(src_uri_inc_file, 'w') as f:
>>>>>>> +            for module in self.modules_require:
>>>>>>> +                # {module_name: (url, version, destdir, fullsrcr=
ev)}
>>>>>>> +                repo_url, version, destdir, fullrev =3D self.mod=
ules_require[module]
>>>>>>> +                if module in self.modules_replace:
>>>>>>> +                    actual_module_name, actual_version =3D self.=
modules_replace[module]
>>>>>>> +                else:
>>>>>>> +                    actual_module_name, actual_version =3D (modu=
le, version)
>>>>>>> +                if '://' in repo_url:
>>>>>>> +                    repo_url_noprotocol =3D repo_url.split('://'=
)[1]
>>>>>>> +                else:
>>>>>>> +                    repo_url_noprotocol =3D repo_url
>>>>>>> +                if not repo_url.startswith('https://'):
>>>>>>> +                    repo_url =3D 'https://' + repo_url
>>>>>>> +                name =3D module.split('/')[-1]
>>>>>>> +                if name in srcrev_name_recorded:
>>>>>>> +                    name =3D '-'.join(module.split('/')[-2:])
>>>>>>> +                src_uri_contents.append((actual_module_name, act=
ual_version, repo_url, fullrev, name, fullrev, repo_url_noprotocol, name,=
 actual_module_name))
>>>>>>> +                srcrev_name_recorded.append(name)
>>>>>>> +            # sort the src_uri_contents and then write it
>>>>>>> +            src_uri_contents.sort(key=3Dtake_first_len)
>>>>>>> +            for content in src_uri_contents:
>>>>>>> +                f.write(template % content)
>>>>>>> +        logger.info("%s generated" % src_uri_inc_file)
>>>>>>> +
>>>>>>> +    def gen_relocation_inc(self):
>>>>>>> +        """
>>>>>>> +        Generate relocation.inc file
>>>>>>> +        """
>>>>>>> +        relocation_inc_file =3D os.path.join(self.workdir, 'relo=
cation.inc')
>>>>>>> +        template =3D """export sites=3D"%s"
>>>>>>> +
>>>>>>> +do_compile:prepend() {
>>>>>>> +    cd ${S}/src/import
>>>>>>> +    for s in $sites; do
>>>>>>> +        site_dest=3D$(echo $s | cut -d: -f1)
>>>>>>> +        site_source=3D$(echo $s | cut -d: -f2)
>>>>>>> +        force_flag=3D$(echo $s | cut -d: -f3)
>>>>>>> +        mkdir -p vendor.copy/$site_dest
>>>>>>> +        if [ -n "$force_flag" ]; then
>>>>>>> +           echo "[INFO] $site_dest: force copying .go files"
>>>>>>> +           rm -rf vendor.copy/$site_dest
>>>>>>> +           rsync -a --exclude=3D'vendor/' --exclude=3D'.git/' ve=
ndor.fetch/$site_source/ vendor.copy/$site_dest
>>>>>>> +        else
>>>>>>> +            [ -n "$(ls -A vendor.copy/$site_dest/*.go 2> /dev/nu=
ll)" ] && { echo "[INFO] vendor.fetch/$site_source -> $site_dest: go copy=
 skipped (files present)" ; true ; } || { echo "[INFO] $site_dest: copyin=
g .go files" ; rsync -a --exclude=3D'vendor/' --exclude=3D'.git/' vendor.=
fetch/$site_source/ vendor.copy/$site_dest ; }
>>>>>>> +        fi
>>>>>>> +    done
>>>>>>> +}
>>>>>>> +"""
>>>>>>> +        sites =3D []
>>>>>>> +        for module in self.modules_require:
>>>>>>> +            # <dest>:<source>[:force]
>>>>>>> +            if module in self.modules_srcpaths:
>>>>>>> +                srcpath =3D self.modules_srcpaths[module]
>>>>>>> +                logger.debug("Using %s as srcpath of module (%s)=
" % (srcpath, module))
>>>>>>> +            else:
>>>>>>> +                srcpath =3D module
>>>>>>> +            sites.append("%s:%s:force" % (module, srcpath))
>>>>>>> +        # To avoid the former one being overriden by the latter =
one when the former one is a subpath of the latter one, sort sites
>>>>>>> +        sites.sort(key=3Dlen)
>>>>>>> +        with open(relocation_inc_file, 'w') as f:
>>>>>>> +            sites_str =3D ' \\\n           '.join(sites)
>>>>>>> +            f.write(template % sites_str)
>>>>>>> +        logger.info("%s generated" % relocation_inc_file)
>>>>>>> +
>>>>>>> +    def gen_modules_txt(self):
>>>>>>> +        """
>>>>>>> +        Generate modules.txt file
>>>>>>> +        """
>>>>>>> +        modules_txt_file =3D os.path.join(self.workdir, 'modules=
.txt')
>>>>>>> +        with open(modules_txt_file, 'w') as f:
>>>>>>> +            for l in self.require_lines:
>>>>>>> +                f.write('# %s\n' % l)
>>>>>>> +                f.write('## explicit\n')
>>>>>>> +            for l in self.replace_lines:
>>>>>>> +                f.write('# %s\n' %l)
>>>>>>> +        logger.info("%s generated" % modules_txt_file)
>>>>>>> +
>>>>>>> +    def sanity_check(self):
>>>>>>> +        """
>>>>>>> +        Various anity checks
>>>>>>> +        """
>>>>>>> +        sanity_check_ok =3D True
>>>>>>> +        #
>>>>>>> +        # Sanity Check 1:
>>>>>>> +        #     For modules having the same repo, at most one is a=
llowed to not have subpath.
>>>>>>> +        #     This check operates on self.modules_repoinfo and s=
elf.modules_subpaths
>>>>>>> +        #
>>>>>>> +        repo_modules =3D {}
>>>>>>> +        for module in self.modules_repoinfo:
>>>>>>> +            # first form {repo: [module1, module2, ...]}
>>>>>>> +            repo_url, repo_dest_dir, fullsrcrev =3D self.modules=
_repoinfo[module]
>>>>>>> +            if repo_url not in repo_modules:
>>>>>>> +                repo_modules[repo_url] =3D [module]
>>>>>>> +            else:
>>>>>>> +                repo_modules[repo_url].append(module)
>>>>>>> +        for repo in repo_modules:
>>>>>>> +            modules =3D repo_modules[repo]
>>>>>>> +            if len(modules) =3D=3D 1:
>>>>>>> +                continue
>>>>>>> +            # for modules sharing the same repo, at most one is =
allowed to not have subpath
>>>>>>> +            nosubpath_modules =3D []
>>>>>>> +            for m in modules:
>>>>>>> +                if m not in self.modules_subpaths:
>>>>>>> +                    nosubpath_modules.append(m)
>>>>>>> +            if len(nosubpath_modules) =3D=3D 0:
>>>>>>> +                continue
>>>>>>> +            if len(nosubpath_modules) > 1:
>>>>>>> +                logger.warning("Multiple modules sharing %s, but=
 they don't have subpath: %s. Please double check." % (repo, nosubpath_mo=
dules))
>>>>>>> +            if len(nosubpath_modules) =3D=3D 1:
>>>>>>> +                # do further check, OK if the module is the pref=
ix for other modules sharing the same repo
>>>>>>> +                module_to_check =3D nosubpath_modules[0]
>>>>>>> +                for m in modules:
>>>>>>> +                    if module_to_check =3D=3D m:
>>>>>>> +                        continue
>>>>>>> +                    if not m.startswith('%s/' % module_to_check)=
:
>>>>>>> +                        logger.warning("%s is sharing repo (%s) =
with other modules, and it might need a subpath. Please double check" % (=
module_to_check, repo))
>>>>>>> +                        continue
>>>>>>> +
>>>>>>> +        #
>>>>>>> +        # End of Sanity Check
>>>>>>> +        #
>>>>>>> +        if not sanity_check_ok:
>>>>>>> +            sys.exit(1)
>>>>>>> +        return
>>>>>>> +
>>>>>>> +def main():
>>>>>>> +    parser =3D argparse.ArgumentParser(
>>>>>>> +        description=3D"oe-go-mod-autogen.py is used to generate =
src_uri.inc, relocation.inc and modules.txt to be used by go mod recipes"=
,
>>>>>>> +        epilog=3D"Use %(prog)s --help to get help")
>>>>>>> +    parser.add_argument("--repo", help =3D "Repo for the recipe.=
", required=3DTrue)
>>>>>>> +    parser.add_argument("--rev", help =3D "Revision for the reci=
pe.", required=3DTrue)
>>>>>>> +    parser.add_argument("--module", help =3D "Go module name. To=
 be used with '--test'")
>>>>>>> +    parser.add_argument("--version", help =3D "Go module version=
. To be used with '--test'")
>>>>>>> +    parser.add_argument("--test", help =3D "Test to get repo url=
 and fullsrcrev, used together with --module and --version.", action=3D"s=
tore_true")
>>>>>>> +    parser.add_argument("--workdir", help =3D "Working directory=
 to hold intermediate results and output.", default=3Dos.getcwd())
>>>>>>> +    parser.add_argument("-d", "--debug",
>>>>>>> +                        help =3D "Enable debug output",
>>>>>>> +                        action=3D"store_const", const=3Dlogging.=
DEBUG, dest=3D"loglevel", default=3Dlogging.INFO)
>>>>>>> +    parser.add_argument("-q", "--quiet",
>>>>>>> +                        help =3D "Hide all output except error m=
essages",
>>>>>>> +                        action=3D"store_const", const=3Dlogging.=
ERROR, dest=3D"loglevel")
>>>>>>> +    args =3D parser.parse_args()
>>>>>>> +
>>>>>>> +    logger.setLevel(args.loglevel)
>>>>>>> +    logger.debug("oe-go-mod-autogen.py running for %s:%s in %s" =
% (args.repo, args.rev, args.workdir))
>>>>>>> +    gomodtool =3D GoModTool(args.repo, args.rev, args.workdir)
>>>>>>> +    if args.test:
>>>>>>> +        if not args.module or not args.version:
>>>>>>> +            print("Please specify --module and --version")
>>>>>>> +            sys.exit(1)
>>>>>>> +        url, srcrev =3D gomodtool.get_url_srcrev(args.module, ar=
gs.version)
>>>>>>> +        print("url =3D %s, srcrev =3D %s" % (url, srcrev))
>>>>>>> +        if not url or not srcrev:
>>>>>>> +            print("Failed to get url & srcrev for %s:%s" % (args=
.module, args.version))
>>>>>>> +    else:
>>>>>>> +        gomodtool.parse()
>>>>>>> +        gomodtool.sanity_check()
>>>>>>> +        gomodtool.gen_src_uri_inc()
>>>>>>> +        gomodtool.gen_relocation_inc()
>>>>>>> +        gomodtool.gen_modules_txt()
>>>>>>> +
>>>>>>> +
>>>>>>> +if __name__ =3D=3D "__main__":
>>>>>>> +    try:
>>>>>>> +        ret =3D main()
>>>>>>> +    except Exception as esc:
>>>>>>> +        ret =3D 1
>>>>>>> +        import traceback
>>>>>>> +        traceback.print_exc()
>>>>>>> +    sys.exit(ret)
>>>>>>> --
>>>>>>> 2.40.0
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>> --
>>>> - Thou shalt not follow the NULL pointer, for chaos and madness awai=
t
>>>> thee at its end
>>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#8279): https://lists.yoctoproject.org/g/meta-vir=
tualization/message/8279
>>>> Mute This Topic: https://lists.yoctoproject.org/mt/101162746/1050810
>>>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/le=
ave/6693017/1050810/978058475/xyzzy [bruce.ashfield@gmail.com]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>
>


