Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47272C5478C
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 02:23:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4341.1709087003901515908
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 Feb 2024 18:23:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=prCHUT43;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2788efe6f1=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41S1EbjU015122;
	Tue, 27 Feb 2024 18:23:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=hfm64g4M4jP3m/KlfbZn9Ksqe+YNSsrwVuB8KhmjTCA=; b=
	prCHUT43Yhq5Wgn6vF9oowt1Qi8TMULoRA/G0yOpg7I0FLTdRdwEEGcIYBBD5GpG
	U3iCa0qZvi7zPXWVujibWl3Y3Hg31hON3ki7Z9eeT3bRMbw9nDzlPpf5JUu/HQvR
	U+R16yQzONta97MObR+CPbYP+NYbVdTtQ0YJiIW7TxQKq9gSrsfe8GBek4hRw6qj
	Q0s0B52AcKxO2yClnzeApIyYFypzz2xHMkPKBS71YhG1Rx8P0piPXauLs9QkK/wT
	FCDskktLCFCky2g1n96Eo+m2V6ymbGvX/NKooKGOu8hZz0f6WZvTHctcYxDVxEH0
	8hIf8ZfN7QhGYdNlnky43A==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wfcm43mrb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 18:23:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lYmljrimfBzWTWHCwCfZtWxN736UAON4ZPonCK6fopCU99EORdAalnrQRZw1Visfj6mEdLfM9/fCgwOKrU5gdPvHc/qtaQ2NGN3RwTqocBBw03teL8w9JJRGHH1tktKHfg2UTxJddYSlIdCFy8EwrrEGRqVIzbprOtPJSeWmjqtxcn1j434KLb+HNyTj0JlHz+WsETq/xv9tu24YTKA/gW3tLeaJhDS2+mBdmsuLM7lpIYDYA/ySlxeBFcjQheRJE97Ic7MKvy7IAvj+wxW4WdJnJadWXTZXFwotm0j0U4nwMIvv4fHZSRlu+m2+yUBjM5/kWrbp57Er0KotFKcQ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfm64g4M4jP3m/KlfbZn9Ksqe+YNSsrwVuB8KhmjTCA=;
 b=I+pBoQi1ENAQZzKs72haJ0gcXunf6yYWKPuhMdsnzxkQSoH6qdB4Wy+TZqCPsj6v4z9j3z+O0WhlObWAimFoYRiKrTCjyKPuyzUDENTJ8MuJ/1EUw4lLHAODSebmRWq63Q9Xf+vfkX/DGA21wAQgeV6bcdSDF7rAKsHJUaLhxXcvOtwu3FPPzLnwdCsgMMvN35ohjnvKlfnPUkFpl2cpMEC5o0HjhihpRfcjPmgstJ62z1wrgMF0IvrBE0D9okBmLCBhdXN/Vpq87KCBqdF5jdwc7Y5IKDmFjjlHXBQzBRKKJqa3qRfFyGJcWZxjkKX1BpBifwzMfsB7CkjelDXQGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB7786.namprd11.prod.outlook.com (2603:10b6:8:f2::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7339.25; Wed, 28 Feb 2024 02:23:18 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0%4]) with mapi id 15.20.7339.024; Wed, 28 Feb 2024
 02:23:18 +0000
Message-ID: <f7e670b7-fe67-db1b-2c58-81af9f6c869b@windriver.com>
Date: Wed, 28 Feb 2024 10:23:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [meta-virtualization][PATCH 3/4] meta-virt: remove pure go source
 packages
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20240227051211.3390256-1-Qi.Chen@windriver.com>
 <20240227051211.3390256-3-Qi.Chen@windriver.com>
 <CADkTA4OioNcWGk4uvASJP4ugUDEb0Z9cKfL9eeUMoXf3PfWZXw@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CADkTA4OioNcWGk4uvASJP4ugUDEb0Z9cKfL9eeUMoXf3PfWZXw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG3P274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::14)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS0PR11MB7786:EE_
X-MS-Office365-Filtering-Correlation-Id: 76138e2d-afc3-4a56-412b-08dc380439a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	J7u5f0cBqqqRiCTUOtNNINByx0WQuLbjmHo4jtkoiwjO41KvUuecBMn7JVpnK3leqWAUjScMXkBVFgmC0/Z5MuDSHkwHiLM5P2Ykhy5dP8wU9jlP8nFy7aHZQW4kpNAIf2LMM9/8OosabITKNKaniARbaWJa2M/n4wbvJjs4CJp5RxzwYbB+S5spYAe6KqVGHhBjupOPmTkxMrbGVxrGSAj2ESwkoXXm52FrXHp1lejk/sZewadJP6siMtSfICcaiODiWtl2XnFUdZI02o5wL2MTxyTMEuGsGnyuISKxBOqVAaAPYaAJN+9+NCGzGZU+l17jhXygWWmz0hsMHencRD2dXWLDfS3SmWGp4TijRYId8F+bndoAD/B18tlDCW33fqiuw9l7ia+gSCddof3anmC/Tl1UtqlaK7a1NEiQOD1a/MlWGitnrV+d/0k4UAteMwvC6Umwu+Kn45HiORlfs0XAG9FWdz1PoUVwubfU2S0Gcx0n9/atG+jt343w0xoMyxn24p/fluutFGg9cMy3q/dGd6yLptXPi+M7SyGCv4plLKh81NRt+lGR0orOprsz1Dv7hbESdprP7iBZatw/eUvdkTPaWduGYMio56ISlQ69NBlOXT3/gYTWt02VRGT+ELIH01uE/cUHkZOJl167aw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230273577357003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bGFhdDRQaEhyV1FYclZGZm5QUVRzTjBQQ1JsVnFueDFtdmlreVZja2VHbExR?=
 =?utf-8?B?ODUzcWFXL055ckZ1L2FHNEZDcVc2K0FERXlLazNhM2VUelhwRndBRnY4dHFu?=
 =?utf-8?B?OURkd1pPbUp1ZDBMd09CcW5DZTRZQUFDMjVWcGxjUnJQLzdMVUxPNDB1T0Qw?=
 =?utf-8?B?Ym9ZMmhIb3RZQU1mRnUvTmUxcEVwbVNUZmZwQ253T0IzdCtxWnNYUHVSWWZN?=
 =?utf-8?B?cVFtc0hZT0grVEJJUFNjczI1b1F0MU8zeTdCOVFUV0hOaTB5TEZiSC84dG9F?=
 =?utf-8?B?UXRyaDg3RHkwVUxnbzByTmlKTWJzV2drSVUwWXBwL1JJcWtBVUZrK2thUlRB?=
 =?utf-8?B?c01tWEdzankxWk14RHlmR0I3QVdjWHFSTDlJY0dUN2hQRGw2UnNIbG04dkxa?=
 =?utf-8?B?RkQ0RFJiSWptRzJpS09GeDJZeVlkOVFDSUNDckp3V2JldmxnbDVtR1BvN1dM?=
 =?utf-8?B?ZkhoSkFhdUFMcFRITmFTTnYrVVh1RVF0K3BKU3YvdlMwbU1jWVhZMDZpQWww?=
 =?utf-8?B?Z3lVcE4vazFYMm4rS0NnS2Z3R053VytjUFlhNEVuNExoZk1Kd1FkbVJVOXpQ?=
 =?utf-8?B?Q1pBOGdoUEpBMzdzTDdXVi9BTXNGMmtZQ2VaL0xkRlp2RTI5dHZUTUZwMm9p?=
 =?utf-8?B?d2gyVmQ3QXN4eThaajVhL3RYVTQ0ZUtwM1FWalJ0SW8waWNTU1BFQWxYb2dy?=
 =?utf-8?B?aWF0L3YxSTBaanpERGpYTnVScFQ1cTFaMXdyNDBsSm9jNkxPSE1QZCtEL1JT?=
 =?utf-8?B?VXRRQjhNcmRFb1JPTUJwTFlRVTVlYkVhaHlMZnhEY1NSeUh4U0N1UC9FdU1S?=
 =?utf-8?B?Rkd2bzVIUTFwVUZrL2k4OU5LdFE5RFZwUVRWRTdOTTUzS243SE9ydk9nQlpJ?=
 =?utf-8?B?L3Ayd21MZk9SQ1VkNDBSRXR6TktYaVJvT3BTUVRvYUNYUnQyQmw1UGZFL1BU?=
 =?utf-8?B?T2RiTFZ3V0trWUx2amd6K0g1cld3eUJDV0hRWTdCa1AzTkhEbjNnMnVBdkxu?=
 =?utf-8?B?Y3ZzbFRjTVMyYjB6NFZyd3RoNXgrQmo5Tk5VR2RXZmUyZWlMNnBLNFkrV0F5?=
 =?utf-8?B?RzcrTzlzOGg0MnhHN3B6YjBwZU55UFg3UnF2Qm5BbzJSZHN3b01TSk5RZHlj?=
 =?utf-8?B?cnJBVVhyc0ZWMjVCTStjMXpZYS83dHpHTE1QQWFGMjB3cDVPUW5nSmo5c1k0?=
 =?utf-8?B?L0lxL1R0b0s2T0xBTXA3d00xYmZrMW9FQUVjZklZNVN4RHRLSHVNbkFnZkQ0?=
 =?utf-8?B?OTBzR0Z6cDhIekRvTi9PMEtzL2xrTjVsODNoRlVabEtPbXdVc2trT1J4ZTEx?=
 =?utf-8?B?UDF3c25jUWs3REV1cXQvRE9MQkhySEVXTG0wUGZBN1Q4b0V2MHk3dkZWVmpm?=
 =?utf-8?B?NSt2THpTY0pjZmxNZ2ovd2djZ3ZsMitrY1QrY1QyNTlPcDFnYm1zWDgwejN6?=
 =?utf-8?B?dlJNYVF2OStDU2xQZ3k3NUdQUkRxTWJZcEZmZUI2UXJ6cGNONUlLNzlpK0tr?=
 =?utf-8?B?ZkdlZWlUZXlsWnBWK2xFUGg1dUxLZ0dzY1NGZmhKakg3NzZyU2QyV1ZjUGtn?=
 =?utf-8?B?LzFFeWYxdS9YcTF0aDJTZUJoYlB3NXZ2Nk0vNW5uNUhKVTY5LzJnTkJVT21u?=
 =?utf-8?B?TFJjeFdzY1FoMjNmbmlrb05mTDFyL0k5cXZsN1ZFVnNOYUVMdXY2TldJelZr?=
 =?utf-8?B?RzlPZURjNFRyUkI5N3JBZ2x4L3pGZ1JHVUhFNm1HNWdIaXF1cS9QWm5sZ3NF?=
 =?utf-8?B?d0I0cjRUVm9Jai84VU5HYzhXeEQ1eHpyNUVidXlJWmcwNEMyTXI1SllEak9P?=
 =?utf-8?B?dFA0WVV5WEJTYThZRzdEVXdZdXNyQ0dLTnV5TVc0TDVOb1EzNjdmY2F1WW1o?=
 =?utf-8?B?SW91LzZwTHpESkMxZGxJV29RVWMwOHpuOFJCR1RxTXJ5b3UwUUNLT3lSZFBP?=
 =?utf-8?B?SHd6bWV3NU54bjRwbmFpeC9RajFhNXZBbzdwbEVUSEFlMUhkamt1SFBiYUhu?=
 =?utf-8?B?SGROUU40QWlvMzZKUUpqcDh1Y1lYLzFaSlpxTG1VVVZxM0ZzdW1xQnFSMVcw?=
 =?utf-8?B?UXMwZzRYL3ErQTZXOTYwRHNiUnlUbVM0QWFqMnE0WDdOSW9JejFJK3Z6Rytn?=
 =?utf-8?Q?/WyKr8DzML1NxHI5zfaPbMCLB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76138e2d-afc3-4a56-412b-08dc380439a3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 02:23:18.0997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Pp92SbzcGvV1yC1oSdLQ1CtgybAne2hA/EI0G6i21eo6CJ8nEtYAUkjj6a8RraGXieIV6qTeOdz9Ha445ftnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7786
X-Proofpoint-ORIG-GUID: yOwuaGDJLcEmI12dDz5GI3XYsArVVeRh
X-Proofpoint-GUID: yOwuaGDJLcEmI12dDz5GI3XYsArVVeRh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_01,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 clxscore=1011 adultscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402280017
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 41S1EbjU015122
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 28 Feb 2024 02:23:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8592

On 2/27/24 21:48, Bruce Ashfield wrote:
> On Tue, Feb 27, 2024 at 12:12=E2=80=AFAM Chen Qi via lists.yoctoproject=
.org
> <Qi.Chen=3Dwindriver.com@lists.yoctoproject.org> wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> These pure go source packages are no longer needed. They were added
>> to satisfy build dependency. But we now have another way for the go
>> mod vendoring, we don't need them any more. There recipes are also
>> not depended upon by any recipe in meta-virt.
> I'm actually going to mark them as depreciated and generate a build
> warning if they are used.
>
> The plan was to remove them in the 2nd half of this year.
>
> Bruce

Got it. Thanks.

Regards,

Qi


>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   recipes-containers/go-digest/go-digest_git.bb | 41 -----------------
>>   recipes-containers/go-errors/go-errors_git.bb | 41 -----------------
>>   .../go-spf13-cobra/spf13-cobra_git.bb         | 41 -----------------
>>   .../go-spf13-pflag/spf13-pflag_git.bb         | 41 -----------------
>>   recipes-devtools/go/compose-file_git.bb       | 41 -----------------
>>   recipes-devtools/go/go-capability_git.bb      | 29 ------------
>>   recipes-devtools/go/go-cli_git.bb             | 29 ------------
>>   recipes-devtools/go/go-connections_git.bb     | 39 ----------------
>>   recipes-devtools/go/go-context_git.bb         | 34 --------------
>>   recipes-devtools/go/go-dbus_git.bb            | 29 ------------
>>   recipes-devtools/go/go-distribution_git.bb    | 39 ----------------
>>   recipes-devtools/go/go-fsnotify_git.bb        | 29 ------------
>>   recipes-devtools/go/go-libtrust_git.bb        | 29 ------------
>>   recipes-devtools/go/go-logrus_git.bb          | 29 ------------
>>   recipes-devtools/go/go-mux_git.bb             | 31 -------------
>>   recipes-devtools/go/go-patricia_git.bb        | 29 ------------
>>   recipes-devtools/go/go-pty_git.bb             | 28 ------------
>>   recipes-devtools/go/go-systemd_git.bb         | 31 -------------
>>   recipes-devtools/go/grpc-go_git.bb            | 45 -----------------=
--
>>   recipes-devtools/go/notary_git.bb             | 39 ----------------
>>   20 files changed, 694 deletions(-)
>>   delete mode 100644 recipes-containers/go-digest/go-digest_git.bb
>>   delete mode 100644 recipes-containers/go-errors/go-errors_git.bb
>>   delete mode 100644 recipes-containers/go-spf13-cobra/spf13-cobra_git=
.bb
>>   delete mode 100644 recipes-containers/go-spf13-pflag/spf13-pflag_git=
.bb
>>   delete mode 100644 recipes-devtools/go/compose-file_git.bb
>>   delete mode 100644 recipes-devtools/go/go-capability_git.bb
>>   delete mode 100644 recipes-devtools/go/go-cli_git.bb
>>   delete mode 100644 recipes-devtools/go/go-connections_git.bb
>>   delete mode 100644 recipes-devtools/go/go-context_git.bb
>>   delete mode 100644 recipes-devtools/go/go-dbus_git.bb
>>   delete mode 100644 recipes-devtools/go/go-distribution_git.bb
>>   delete mode 100644 recipes-devtools/go/go-fsnotify_git.bb
>>   delete mode 100644 recipes-devtools/go/go-libtrust_git.bb
>>   delete mode 100644 recipes-devtools/go/go-logrus_git.bb
>>   delete mode 100644 recipes-devtools/go/go-mux_git.bb
>>   delete mode 100644 recipes-devtools/go/go-patricia_git.bb
>>   delete mode 100644 recipes-devtools/go/go-pty_git.bb
>>   delete mode 100644 recipes-devtools/go/go-systemd_git.bb
>>   delete mode 100644 recipes-devtools/go/grpc-go_git.bb
>>   delete mode 100644 recipes-devtools/go/notary_git.bb
>>
>> diff --git a/recipes-containers/go-digest/go-digest_git.bb b/recipes-c=
ontainers/go-digest/go-digest_git.bb
>> deleted file mode 100644
>> index a231cf7b..00000000
>> --- a/recipes-containers/go-digest/go-digest_git.bb
>> +++ /dev/null
>> @@ -1,41 +0,0 @@
>> -DESCRIPTION =3D "Common digest package used across the container ecos=
ystem."
>> -HOMEPAGE =3D "https://github.com/opencontainers/go-digest.git"
>> -SECTION =3D "devel/go"
>> -LICENSE =3D "Apache-2.0"
>> -LIC_FILES_CHKSUM =3D "file://src/${PKG_NAME}/LICENSE;md5=3D2d6fc0e85c=
3f118af64c85a78d56d3cf"
>> -
>> -SRCNAME =3D "go-digest"
>> -
>> -PKG_NAME =3D "github.com/opencontainers/${SRCNAME}"
>> -SRC_URI =3D "git://${PKG_NAME};destsuffix=3Dgit/src/${PKG_NAME};branc=
h=3Dmaster;protocol=3Dhttps"
>> -
>> -SRCREV =3D "65fac7b55eb714642e9359458656939349dcb766"
>> -PV =3D "v1.0.0-rc0+git"
>> -
>> -S =3D "${WORKDIR}/git"
>> -
>> -# NO-OP the do compile rule because this recipe is source only.
>> -do_compile() {
>> -}
>> -
>> -do_install() {
>> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
>> -       for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
>> -           if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
>> -               mkdir -p ${D}${prefix}/local/go/$(dirname $j)
>> -           fi
>> -           cp $j ${D}${prefix}/local/go/$j
>> -       done
>> -       cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/=
${PKG_NAME}/
>> -}
>> -
>> -SYSROOT_PREPROCESS_FUNCS +=3D "go_digest_file_sysroot_preprocess"
>> -
>> -go_digest_file_sysroot_preprocess () {
>> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${=
prefix}/local/go/src/$(dirname ${PKG_NAME})
>> -}
>> -
>> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
>> -
>> -CLEANBROKEN =3D "1"
>> diff --git a/recipes-containers/go-errors/go-errors_git.bb b/recipes-c=
ontainers/go-errors/go-errors_git.bb
>> deleted file mode 100644
>> index 87486358..00000000
>> --- a/recipes-containers/go-errors/go-errors_git.bb
>> +++ /dev/null
>> @@ -1,41 +0,0 @@
>> -DESCRIPTION =3D "Simple error handling primitives"
>> -HOMEPAGE =3D "https://github.com/pkg/errors"
>> -SECTION =3D "devel/go"
>> -LICENSE =3D "BSD-2-Clause"
>> -LIC_FILES_CHKSUM =3D "file://src/${PKG_NAME}/LICENSE;md5=3D6fe682a02d=
f52c6653f33bd0f7126b5a"
>> -
>> -SRCNAME =3D "errors"
>> -
>> -PKG_NAME =3D "github.com/pkg/${SRCNAME}"
>> -SRC_URI =3D "git://${PKG_NAME};destsuffix=3Dgit/src/${PKG_NAME};branc=
h=3Dmaster;protocol=3Dhttps"
>> -
>> -SRCREV =3D "5dd12d0cfe7f152f80558d591504ce685299311e"
>> -PV =3D "v0.8.1+git"
>> -
>> -S =3D "${WORKDIR}/git"
>> -
>> -# NO-OP the do compile rule because this recipe is source only.
>> -do_compile() {
>> -}
>> -
>> -do_install() {
>> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
>> -       for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go" -not -=
path "*/.tool/*"); do
>> -           if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
>> -               mkdir -p ${D}${prefix}/local/go/$(dirname $j)
>> -           fi
>> -           cp $j ${D}${prefix}/local/go/$j
>> -       done
>> -       cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/=
${PKG_NAME}/
>> -}
>> -
>> -SYSROOT_PREPROCESS_FUNCS +=3D "go_errors_file_sysroot_preprocess"
>> -
>> -go_errors_file_sysroot_preprocess () {
>> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${=
prefix}/local/go/src/$(dirname ${PKG_NAME})
>> -}
>> -
>> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
>> -
>> -CLEANBROKEN =3D "1"
>> diff --git a/recipes-containers/go-spf13-cobra/spf13-cobra_git.bb b/re=
cipes-containers/go-spf13-cobra/spf13-cobra_git.bb
>> deleted file mode 100644
>> index c6629014..00000000
>> --- a/recipes-containers/go-spf13-cobra/spf13-cobra_git.bb
>> +++ /dev/null
>> @@ -1,41 +0,0 @@
>> -DESCRIPTION =3D "A Commander for modern Go CLI interactions"
>> -HOMEPAGE =3D "https://github.com/spf13/cobra"
>> -SECTION =3D "devel/go"
>> -LICENSE =3D "Apache-2.0"
>> -LIC_FILES_CHKSUM =3D "file://src/${PKG_NAME}/LICENSE.txt;md5=3D920d76=
114a32b0fb75b3f2718c5a91be"
>> -
>> -SRCNAME =3D "cobra"
>> -
>> -PKG_NAME =3D "github.com/spf13/${SRCNAME}"
>> -SRC_URI =3D "git://${PKG_NAME};destsuffix=3Dgit/src/${PKG_NAME};branc=
h=3Dmain;protocol=3Dhttps"
>> -
>> -SRCREV =3D "4dd4b25de38418174a6e859e8a32eaccca32dccc"
>> -PV =3D "v1.6.0+git"
>> -
>> -S =3D "${WORKDIR}/git"
>> -
>> -# NO-OP the do compile rule because this recipe is source only.
>> -do_compile() {
>> -}
>> -
>> -do_install() {
>> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
>> -       for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go" -not -=
path "*/.tool/*"); do
>> -           if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
>> -               mkdir -p ${D}${prefix}/local/go/$(dirname $j)
>> -           fi
>> -           cp $j ${D}${prefix}/local/go/$j
>> -       done
>> -       cp -r ${S}/src/${PKG_NAME}/LICENSE.txt ${D}${prefix}/local/go/=
src/${PKG_NAME}/
>> -}
>> -
>> -SYSROOT_PREPROCESS_FUNCS +=3D "cobra_file_sysroot_preprocess"
>> -
>> -cobra_file_sysroot_preprocess () {
>> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${=
prefix}/local/go/src/$(dirname ${PKG_NAME})
>> -}
>> -
>> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
>> -
>> -CLEANBROKEN =3D "1"
>> diff --git a/recipes-containers/go-spf13-pflag/spf13-pflag_git.bb b/re=
cipes-containers/go-spf13-pflag/spf13-pflag_git.bb
>> deleted file mode 100644
>> index 201f183a..00000000
>> --- a/recipes-containers/go-spf13-pflag/spf13-pflag_git.bb
>> +++ /dev/null
>> @@ -1,41 +0,0 @@
>> -DESCRIPTION =3D "Drop-in replacement for Go's flag package, implement=
ing POSIX/GNU-style --flags."
>> -HOMEPAGE =3D "https://github.com/spf13/pflag"
>> -SECTION =3D "devel/go"
>> -LICENSE =3D "BSD-3-Clause"
>> -LIC_FILES_CHKSUM =3D "file://src/${PKG_NAME}/LICENSE;md5=3D1e8b7dc8b9=
06737639131047a590f21d"
>> -
>> -SRCNAME =3D "pflag"
>> -
>> -PKG_NAME =3D "github.com/spf13/${SRCNAME}"
>> -SRC_URI =3D "git://${PKG_NAME};destsuffix=3Dgit/src/${PKG_NAME};branc=
h=3Dmaster;protocol=3Dhttps"
>> -
>> -SRCREV =3D "d5e0c0615acee7028e1e2740a11102313be88de1"
>> -PV =3D "v1.0.5+git"
>> -
>> -S =3D "${WORKDIR}/git"
>> -
>> -# NO-OP the do compile rule because this recipe is source only.
>> -do_compile() {
>> -}
>> -
>> -do_install() {
>> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
>> -       for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go" -not -=
path "*/.tool/*"); do
>> -           if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
>> -               mkdir -p ${D}${prefix}/local/go/$(dirname $j)
>> -           fi
>> -           cp $j ${D}${prefix}/local/go/$j
>> -       done
>> -       cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/=
${PKG_NAME}/
>> -}
>> -
>> -SYSROOT_PREPROCESS_FUNCS +=3D "pflag_file_sysroot_preprocess"
>> -
>> -pflag_file_sysroot_preprocess () {
>> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${=
prefix}/local/go/src/$(dirname ${PKG_NAME})
>> -}
>> -
>> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
>> -
>> -CLEANBROKEN =3D "1"
>> diff --git a/recipes-devtools/go/compose-file_git.bb b/recipes-devtool=
s/go/compose-file_git.bb
>> deleted file mode 100644
>> index 7fedc407..00000000
>> --- a/recipes-devtools/go/compose-file_git.bb
>> +++ /dev/null
>> @@ -1,41 +0,0 @@
>> -DESCRIPTION =3D "Parser for the Compose file format (version 3)"
>> -HOMEPAGE =3D "https://github.com/aanand/compose-file"
>> -SECTION =3D "devel/go"
>> -LICENSE =3D "Apache-2.0"
>> -LIC_FILES_CHKSUM =3D "file://src/${PKG_NAME}/LICENSE;md5=3D9cd86830b5=
57232ce55e2a6b47387471"
>> -
>> -SRCNAME =3D "compose-file"
>> -
>> -PKG_NAME =3D "github.com/aanand/${SRCNAME}"
>> -SRC_URI =3D "git://${PKG_NAME}.git;destsuffix=3Dgit/src/${PKG_NAME};b=
ranch=3Dmaster;protocol=3Dhttps"
>> -
>> -SRCREV =3D "a3e58764f50597b6217fec07e9bff7225c4a1719"
>> -PV =3D "3.0+git"
>> -
>> -S =3D "${WORKDIR}/git"
>> -
>> -# NO-OP the do compile rule because this recipe is source only.
>> -do_compile() {
>> -}
>> -
>> -do_install() {
>> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
>> -       for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
>> -           if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
>> -               mkdir -p ${D}${prefix}/local/go/$(dirname $j)
>> -           fi
>> -           cp $j ${D}${prefix}/local/go/$j
>> -       done
>> -       cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/=
${PKG_NAME}/
>> -}
>> -
>> -SYSROOT_PREPROCESS_FUNCS +=3D "go_compose_file_sysroot_preprocess"
>> -
>> -go_compose_file_sysroot_preprocess () {
>> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${=
prefix}/local/go/src/$(dirname ${PKG_NAME})
>> -}
>> -
>> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
>> -
>> -CLEANBROKEN =3D "1"
>> diff --git a/recipes-devtools/go/go-capability_git.bb b/recipes-devtoo=
ls/go/go-capability_git.bb
>> deleted file mode 100644
>> index e01a83d1..00000000
>> --- a/recipes-devtools/go/go-capability_git.bb
>> +++ /dev/null
>> @@ -1,29 +0,0 @@
>> -DESCRIPTION =3D "Utilities for manipulating POSIX capabilities in Go.=
"
>> -HOMEPAGE =3D "https://github.com/syndtr/gocapability"
>> -SECTION =3D "devel/go"
>> -LICENSE =3D "BSD-2-Clause"
>> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da7304f5073e7be4ba7bffabbf9=
f2bbca"
>> -
>> -SRCNAME =3D "gocapability"
>> -
>> -PKG_NAME =3D "github.com/syndtr/${SRCNAME}"
>> -SRC_URI =3D "git://${PKG_NAME}.git;branch=3Dmaster;protocol=3Dhttps"
>> -
>> -SRCREV =3D "2c00daeb6c3b45114c80ac44119e7b8801fdd852"
>> -PV =3D "0.0+git"
>> -
>> -S =3D "${WORKDIR}/git"
>> -
>> -do_install() {
>> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
>> -       cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
>> -}
>> -
>> -SYSROOT_PREPROCESS_FUNCS +=3D "go_capability_sysroot_preprocess"
>> -
>> -go_capability_sysroot_preprocess () {
>> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${=
prefix}/local/go/src/$(dirname ${PKG_NAME})
>> -}
>> -
>> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
>> diff --git a/recipes-devtools/go/go-cli_git.bb b/recipes-devtools/go/g=
o-cli_git.bb
>> deleted file mode 100644
>> index affe38ec..00000000
>> --- a/recipes-devtools/go/go-cli_git.bb
>> +++ /dev/null
>> @@ -1,29 +0,0 @@
>> -DESCRIPTION =3D "A small package for building command line apps in Go=
"
>> -HOMEPAGE =3D "https://github.com/codegangsta/cli"
>> -SECTION =3D "devel/go"
>> -LICENSE =3D "MIT"
>> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ded9b539ed65d73926f30ff1f15=
87dc44"
>> -
>> -SRCNAME =3D "cli"
>> -
>> -PKG_NAME =3D "github.com/codegangsta/${SRCNAME}"
>> -SRC_URI =3D "git://${PKG_NAME}.git;branch=3Dmaster;protocol=3Dhttps"
>> -
>> -SRCREV =3D "27ecc97192df1bf053a22b04463f2b51b8b8373e"
>> -PV =3D "1.1.0+git"
>> -
>> -S =3D "${WORKDIR}/git"
>> -
>> -do_install() {
>> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
>> -       cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
>> -}
>> -
>> -SYSROOT_PREPROCESS_FUNCS +=3D "go_cli_sysroot_preprocess"
>> -
>> -go_cli_sysroot_preprocess () {
>> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${=
prefix}/local/go/src/$(dirname ${PKG_NAME})
>> -}
>> -
>> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
>> diff --git a/recipes-devtools/go/go-connections_git.bb b/recipes-devto=
ols/go/go-connections_git.bb
>> deleted file mode 100644
>> index 7e8f020d..00000000
>> --- a/recipes-devtools/go/go-connections_git.bb
>> +++ /dev/null
>> @@ -1,39 +0,0 @@
>> -DESCRIPTION =3D "Utility package to work with network connections"
>> -HOMEPAGE =3D "https://github.com/docker/connections"
>> -SECTION =3D "devel/go"
>> -LICENSE =3D "Apache-2.0"
>> -LIC_FILES_CHKSUM =3D "file://src/${PKG_NAME}/LICENSE;md5=3D04424bc6f5=
a5be60691b9824d65c2ad8"
>> -
>> -SRCNAME =3D "go-connections"
>> -
>> -PKG_NAME =3D "github.com/docker/${SRCNAME}"
>> -SRC_URI =3D "git://${PKG_NAME}.git;destsuffix=3Dgit/src/${PKG_NAME};b=
ranch=3Dmaster;protocol=3Dhttps"
>> -
>> -SRCREV =3D "4ccf312bf1d35e5dbda654e57a9be4c3f3cd0366"
>> -PV =3D "0.2.1+git"
>> -
>> -S =3D "${WORKDIR}/git"
>> -
>> -# NO-OP the do compile rule because this recipe is source only.
>> -do_compile() {
>> -}
>> -
>> -do_install() {
>> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
>> -       for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
>> -           if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
>> -               mkdir -p ${D}${prefix}/local/go/$(dirname $j)
>> -           fi
>> -           cp $j ${D}${prefix}/local/go/$j
>> -       done
>> -       cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/=
${PKG_NAME}/
>> -}
>> -
>> -SYSROOT_PREPROCESS_FUNCS +=3D "go_connections_sysroot_preprocess"
>> -
>> -go_connections_sysroot_preprocess () {
>> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${=
prefix}/local/go/src/$(dirname ${PKG_NAME})
>> -}
>> -
>> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
>> diff --git a/recipes-devtools/go/go-context_git.bb b/recipes-devtools/=
go/go-context_git.bb
>> deleted file mode 100644
>> index 580463d3..00000000
>> --- a/recipes-devtools/go/go-context_git.bb
>> +++ /dev/null
>> @@ -1,34 +0,0 @@
>> -DESCRIPTION =3D "A golang registry for global request variables."
>> -HOMEPAGE =3D "https://github.com/gorilla/context"
>> -SECTION =3D "devel/go"
>> -LICENSE =3D "BSD-3-Clause"
>> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc30eee78985cf2584cded5f89b=
a3d787"
>> -
>> -SRCNAME =3D "context"
>> -
>> -PKG_NAME =3D "github.com/gorilla/${SRCNAME}"
>> -SRC_URI =3D "git://${PKG_NAME}.git;branch=3Dmain;protocol=3Dhttps"
>> -
>> -SRCREV =3D "1cbd4c16de64273a6e63fc710b0d89bfad72cd32"
>> -
>> -S =3D "${WORKDIR}/git"
>> -
>> -do_compile() {
>> -    true
>> -}
>> -
>> -do_install() {
>> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
>> -       cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
>> -}
>> -
>> -SYSROOT_PREPROCESS_FUNCS +=3D "go_context_sysroot_preprocess"
>> -
>> -go_context_sysroot_preprocess () {
>> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${=
prefix}/local/go/src/$(dirname ${PKG_NAME})
>> -}
>> -
>> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
>> -
>> -CLEANBROKEN =3D "1"
>> diff --git a/recipes-devtools/go/go-dbus_git.bb b/recipes-devtools/go/=
go-dbus_git.bb
>> deleted file mode 100644
>> index 49b2de3b..00000000
>> --- a/recipes-devtools/go/go-dbus_git.bb
>> +++ /dev/null
>> @@ -1,29 +0,0 @@
>> -DESCRIPTION =3D "Native Go bindings for D-Bus"
>> -HOMEPAGE =3D "https://github.com/godbus/dbus"
>> -SECTION =3D "devel/go"
>> -LICENSE =3D "BSD-2-Clause"
>> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D09042bd5c6c96a2b9e45ddf1bc=
517eed"
>> -
>> -SRCNAME =3D "dbus"
>> -
>> -PKG_NAME =3D "github.com/godbus/${SRCNAME}"
>> -SRC_URI =3D "git://${PKG_NAME}.git;branch=3Dmaster;protocol=3Dhttps"
>> -
>> -SRCREV =3D "5f6efc7ef2759c81b7ba876593971bfce311eab3"
>> -PV =3D "4.0.0+git"
>> -
>> -S =3D "${WORKDIR}/git"
>> -
>> -do_install() {
>> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
>> -       cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
>> -}
>> -
>> -SYSROOT_PREPROCESS_FUNCS +=3D "go_dbus_sysroot_preprocess"
>> -
>> -go_dbus_sysroot_preprocess () {
>> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${=
prefix}/local/go/src/$(dirname ${PKG_NAME})
>> -}
>> -
>> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
>> diff --git a/recipes-devtools/go/go-distribution_git.bb b/recipes-devt=
ools/go/go-distribution_git.bb
>> deleted file mode 100644
>> index dd98a317..00000000
>> --- a/recipes-devtools/go/go-distribution_git.bb
>> +++ /dev/null
>> @@ -1,39 +0,0 @@
>> -DESCRIPTION =3D "The Docker toolset to pack, ship, store, and deliver=
 content"
>> -HOMEPAGE =3D "https://github.com/docker/distribution"
>> -SECTION =3D "devel/go"
>> -LICENSE =3D "Apache-2.0"
>> -LIC_FILES_CHKSUM =3D "file://src/${PKG_NAME}/LICENSE;md5=3Dd2794c0df5=
b907fdace235a619d80314"
>> -
>> -SRCNAME =3D "distribution"
>> -
>> -PKG_NAME =3D "github.com/docker/${SRCNAME}"
>> -SRC_URI =3D "git://${PKG_NAME}.git;branch=3Ddocker/1.13;destsuffix=3D=
git/src/${PKG_NAME};protocol=3Dhttps"
>> -
>> -SRCREV =3D "28602af35aceda2f8d571bad7ca37a54cf0250bc"
>> -PV =3D "2.6.0+git"
>> -
>> -S =3D "${WORKDIR}/git"
>> -
>> -# NO-OP the do compile rule because this recipe is source only.
>> -do_compile() {
>> -}
>> -
>> -do_install() {
>> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
>> -       for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
>> -           if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
>> -               mkdir -p ${D}${prefix}/local/go/$(dirname $j)
>> -           fi
>> -           cp $j ${D}${prefix}/local/go/$j
>> -       done
>> -       cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/=
${PKG_NAME}/
>> -}
>> -
>> -SYSROOT_PREPROCESS_FUNCS +=3D "go_distribution_digeset_sysroot_prepro=
cess"
>> -
>> -go_distribution_digeset_sysroot_preprocess () {
>> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${=
prefix}/local/go/src/$(dirname ${PKG_NAME})
>> -}
>> -
>> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
>> diff --git a/recipes-devtools/go/go-fsnotify_git.bb b/recipes-devtools=
/go/go-fsnotify_git.bb
>> deleted file mode 100644
>> index 052658b8..00000000
>> --- a/recipes-devtools/go/go-fsnotify_git.bb
>> +++ /dev/null
>> @@ -1,29 +0,0 @@
>> -DESCRIPTION =3D "A golang registry for global request variables."
>> -HOMEPAGE =3D "https://github.com/go-fsnotify/fsnotify"
>> -SECTION =3D "devel/go"
>> -LICENSE =3D "BSD-3-Clause"
>> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D68f2948d3c4943313d07e084a3=
62486c"
>> -
>> -SRCNAME =3D "fsnotify"
>> -
>> -PKG_NAME =3D "github.com/fsnotify/${SRCNAME}"
>> -SRC_URI =3D "git://${PKG_NAME}.git;branch=3Dmain;protocol=3Dhttps"
>> -
>> -SRCREV =3D "af855d7e6014ec848882bb2ed7d40d536872d275"
>> -PV =3D "v1.5.1+git"
>> -
>> -S =3D "${WORKDIR}/git"
>> -
>> -do_install() {
>> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
>> -       cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
>> -}
>> -
>> -SYSROOT_PREPROCESS_FUNCS +=3D "go_fsnotify_sysroot_preprocess"
>> -
>> -go_fsnotify_sysroot_preprocess () {
>> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${=
prefix}/local/go/src/$(dirname ${PKG_NAME})
>> -}
>> -
>> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
>> diff --git a/recipes-devtools/go/go-libtrust_git.bb b/recipes-devtools=
/go/go-libtrust_git.bb
>> deleted file mode 100644
>> index c578008a..00000000
>> --- a/recipes-devtools/go/go-libtrust_git.bb
>> +++ /dev/null
>> @@ -1,29 +0,0 @@
>> -DESCRIPTION =3D "Primitives for identity and authorization"
>> -HOMEPAGE =3D "https://github.com/docker/libtrust"
>> -SECTION =3D "devel/go"
>> -LICENSE =3D "Apache-2.0"
>> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D435b266b3899aa8a959f17d41c=
56def8"
>> -
>> -SRCNAME =3D "libtrust"
>> -
>> -PKG_NAME =3D "github.com/docker/${SRCNAME}"
>> -SRC_URI =3D "git://${PKG_NAME}.git;branch=3Dmaster;protocol=3Dhttps"
>> -
>> -SRCREV =3D "9cbd2a1374f46905c68a4eb3694a130610adc62a"
>> -PV =3D "0.0+git"
>> -
>> -S =3D "${WORKDIR}/git"
>> -
>> -do_install() {
>> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
>> -       cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
>> -}
>> -
>> -SYSROOT_PREPROCESS_FUNCS +=3D "go_libtrust_sysroot_preprocess"
>> -
>> -go_libtrust_sysroot_preprocess () {
>> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${=
prefix}/local/go/src/$(dirname ${PKG_NAME})
>> -}
>> -
>> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
>> diff --git a/recipes-devtools/go/go-logrus_git.bb b/recipes-devtools/g=
o/go-logrus_git.bb
>> deleted file mode 100644
>> index 211d07c9..00000000
>> --- a/recipes-devtools/go/go-logrus_git.bb
>> +++ /dev/null
>> @@ -1,29 +0,0 @@
>> -DESCRIPTION =3D "A golang registry for global request variables."
>> -HOMEPAGE =3D "https://github.com/Sirupsen/logrus"
>> -SECTION =3D "devel/go"
>> -LICENSE =3D "MIT"
>> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8dadfef729c08ec4e631c4f6fc=
5d43a0"
>> -
>> -SRCNAME =3D "logrus"
>> -
>> -PKG_NAME =3D "github.com/sirupsen/${SRCNAME}"
>> -SRC_URI =3D "git://${PKG_NAME};branch=3Dmaster;protocol=3Dhttps"
>> -
>> -SRCREV =3D "d26492970760ca5d33129d2d799e34be5c4782eb"
>> -PV =3D "0.11.0+git"
>> -
>> -S =3D "${WORKDIR}/git"
>> -
>> -do_install() {
>> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
>> -       cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
>> -}
>> -
>> -SYSROOT_PREPROCESS_FUNCS +=3D "go_logrus_sysroot_preprocess"
>> -
>> -go_logrus_sysroot_preprocess () {
>> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${=
prefix}/local/go/src/$(dirname ${PKG_NAME})
>> -}
>> -
>> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
>> diff --git a/recipes-devtools/go/go-mux_git.bb b/recipes-devtools/go/g=
o-mux_git.bb
>> deleted file mode 100644
>> index 0d69fc58..00000000
>> --- a/recipes-devtools/go/go-mux_git.bb
>> +++ /dev/null
>> @@ -1,31 +0,0 @@
>> -DESCRIPTION =3D "A powerful URL router and dispatcher for golang."
>> -HOMEPAGE =3D "https://github.com/gorilla/mux"
>> -SECTION =3D "devel/go"
>> -LICENSE =3D "BSD-3-Clause"
>> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc30eee78985cf2584cded5f89b=
a3d787"
>> -
>> -SRCNAME =3D "mux"
>> -
>> -PKG_NAME =3D "github.com/gorilla/${SRCNAME}"
>> -SRC_URI =3D "git://${PKG_NAME}.git;branch=3Dmain;protocol=3Dhttps"
>> -
>> -SRCREV =3D "85123bf20e069b156415b871dea10517f6a8938a"
>> -
>> -S =3D "${WORKDIR}/git"
>> -
>> -do_configure[noexec] =3D "1"
>> -do_compile[noexec] =3D "1"
>> -
>> -do_install() {
>> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
>> -       cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
>> -}
>> -
>> -SYSROOT_PREPROCESS_FUNCS +=3D "go_mux_sysroot_preprocess"
>> -
>> -go_mux_sysroot_preprocess () {
>> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${=
prefix}/local/go/src/$(dirname ${PKG_NAME})
>> -}
>> -
>> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
>> diff --git a/recipes-devtools/go/go-patricia_git.bb b/recipes-devtools=
/go/go-patricia_git.bb
>> deleted file mode 100644
>> index 0a3c3f35..00000000
>> --- a/recipes-devtools/go/go-patricia_git.bb
>> +++ /dev/null
>> @@ -1,29 +0,0 @@
>> -DESCRIPTION =3D "A generic patricia trie (also called radix tree) imp=
lemented in Go (Golang)"
>> -HOMEPAGE =3D "https://github.com/gorilla/context"
>> -SECTION =3D "devel/go"
>> -LICENSE =3D "MIT"
>> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9949b99212edd6b1e24ce70237=
6c3baf"
>> -
>> -SRCNAME =3D "go-patricia"
>> -
>> -PKG_NAME =3D "github.com/tchap/${SRCNAME}"
>> -SRC_URI =3D "git://${PKG_NAME}.git;branch=3Dmaster;protocol=3Dhttps"
>> -
>> -SRCREV =3D "666120de432aea38ab06bd5c818f04f4129882c9"
>> -PV =3D "2.2.6+git"
>> -
>> -S =3D "${WORKDIR}/git"
>> -
>> -do_install() {
>> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
>> -       cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
>> -}
>> -
>> -SYSROOT_PREPROCESS_FUNCS +=3D "go_patricia_sysroot_preprocess"
>> -
>> -go_patricia_sysroot_preprocess () {
>> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${=
prefix}/local/go/src/$(dirname ${PKG_NAME})
>> -}
>> -
>> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
>> diff --git a/recipes-devtools/go/go-pty_git.bb b/recipes-devtools/go/g=
o-pty_git.bb
>> deleted file mode 100644
>> index 132e82d1..00000000
>> --- a/recipes-devtools/go/go-pty_git.bb
>> +++ /dev/null
>> @@ -1,28 +0,0 @@
>> -DESCRIPTION =3D "PTY interface for Go"
>> -HOMEPAGE =3D "https://github.com/creack/pty"
>> -SECTION =3D "devel/go"
>> -LICENSE =3D "MIT"
>> -LIC_FILES_CHKSUM =3D "file://License;md5=3D93958070863d769117fa33b129=
020050"
>> -
>> -SRCNAME =3D "pty"
>> -
>> -PKG_NAME =3D "github.com/creack/${SRCNAME}"
>> -SRC_URI =3D "git://${PKG_NAME}.git;branch=3Dmaster;protocol=3Dhttps"
>> -
>> -SRCREV =3D "05017fcccf23c823bfdea560dcc958a136e54fb7"
>> -
>> -S =3D "${WORKDIR}/git"
>> -
>> -do_install() {
>> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
>> -       cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
>> -}
>> -
>> -SYSROOT_PREPROCESS_FUNCS +=3D "go_pty_sysroot_preprocess"
>> -
>> -go_pty_sysroot_preprocess () {
>> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${=
prefix}/local/go/src/$(dirname ${PKG_NAME})
>> -}
>> -
>> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
>> diff --git a/recipes-devtools/go/go-systemd_git.bb b/recipes-devtools/=
go/go-systemd_git.bb
>> deleted file mode 100644
>> index 3aa837aa..00000000
>> --- a/recipes-devtools/go/go-systemd_git.bb
>> +++ /dev/null
>> @@ -1,31 +0,0 @@
>> -DESCRIPTION =3D "Go bindings to systemd socket activation, journal, D=
-Bus, and unit files"
>> -HOMEPAGE =3D "https://github.com/coreos/go-systemd"
>> -SECTION =3D "devel/go"
>> -LICENSE =3D "Apache-2.0"
>> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D19cbd64715b51267a47bf3750c=
c6a8a5"
>> -
>> -SRCNAME =3D "systemd"
>> -
>> -PKG_NAME =3D "github.com/coreos/go-${SRCNAME}"
>> -SRC_URI =3D "git://${PKG_NAME}.git;branch=3Dmain;protocol=3Dhttps"
>> -
>> -SRCREV =3D "b4a58d95188dd092ae20072bac14cece0e67c388"
>> -PV =3D "4+git"
>> -
>> -RDEPENDS:${PN} +=3D "bash"
>> -
>> -S =3D "${WORKDIR}/git"
>> -
>> -do_install() {
>> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
>> -       cp -r ${S}/* ${D}${prefix}/local/go/src/${PKG_NAME}/
>> -}
>> -
>> -SYSROOT_PREPROCESS_FUNCS +=3D "go_systemd_sysroot_preprocess"
>> -
>> -go_systemd_sysroot_preprocess () {
>> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${=
prefix}/local/go/src/$(dirname ${PKG_NAME})
>> -}
>> -
>> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
>> diff --git a/recipes-devtools/go/grpc-go_git.bb b/recipes-devtools/go/=
grpc-go_git.bb
>> deleted file mode 100644
>> index 7989c02f..00000000
>> --- a/recipes-devtools/go/grpc-go_git.bb
>> +++ /dev/null
>> @@ -1,45 +0,0 @@
>> -DESCRIPTION =3D "The Go language implementation of gRPC. HTTP/2 based=
 RPC"
>> -HOMEPAGE =3D "https://github.com/grpc/grpc-go"
>> -SECTION =3D "devel/go"
>> -LICENSE =3D "Apache-2.0"
>> -LIC_FILES_CHKSUM =3D "file://src/${PKG_NAME}/LICENSE;md5=3D3b83ef9638=
7f14655fc854ddc3c6bd57"
>> -
>> -SRCNAME =3D "grpc-go"
>> -
>> -PKG_NAME =3D "google.golang.org/grpc"
>> -SRC_URI =3D "git://github.com/grpc/${SRCNAME}.git;destsuffix=3Dgit/sr=
c/${PKG_NAME};branch=3Dv1.59.x;protocol=3Dhttps"
>> -
>> -SRCREV =3D "7765221f4bf6104973db7946d56936cf838cad46"
>> -PV =3D "1.59.0+git"
>> -
>> -S =3D "${WORKDIR}/git"
>> -
>> -# NO-OP the do compile rule because this recipe is source only.
>> -do_compile() {
>> -}
>> -
>> -do_install() {
>> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
>> -       for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
>> -           if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
>> -               mkdir -p ${D}${prefix}/local/go/$(dirname $j)
>> -           fi
>> -           cp $j ${D}${prefix}/local/go/$j
>> -       done
>> -       cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/=
${PKG_NAME}/
>> -}
>> -
>> -SYSROOT_PREPROCESS_FUNCS +=3D "go_grpc_sysroot_preprocess"
>> -
>> -go_grpc_sysroot_preprocess () {
>> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${=
prefix}/local/go/src/$(dirname ${PKG_NAME})
>> -}
>> -
>> -FILES:${PN} +=3D " \
>> -    ${prefix}/local/go/src/${PKG_NAME}/* \
>> -"
>> -
>> -# some CVEs are reported with "cpe:2.3:a:grpc:grpc:*:*:*:*:*:go:*:*"
>> -# it's better to have false positives than false negatives
>> -CVE_PRODUCT +=3D "grpc"
>> diff --git a/recipes-devtools/go/notary_git.bb b/recipes-devtools/go/n=
otary_git.bb
>> deleted file mode 100644
>> index 1b877d62..00000000
>> --- a/recipes-devtools/go/notary_git.bb
>> +++ /dev/null
>> @@ -1,39 +0,0 @@
>> -DESCRIPTION =3D "Notary is a Docker project that allows anyone to hav=
e trust over arbitrary collections of data"
>> -HOMEPAGE =3D "https://github.com/docker/notary"
>> -SECTION =3D "devel/go"
>> -LICENSE =3D "Apache-2.0"
>> -LIC_FILES_CHKSUM =3D "file://src/${PKG_NAME}/LICENSE;md5=3D3596b980bb=
036e0875174ed15e4b982a"
>> -
>> -SRCNAME =3D "notary"
>> -
>> -PKG_NAME =3D "github.com/docker/${SRCNAME}"
>> -SRC_URI =3D "git://${PKG_NAME}.git;destsuffix=3Dgit/src/${PKG_NAME};b=
ranch=3Dmaster;protocol=3Dhttps"
>> -
>> -SRCREV =3D "d6e1431feb32348e0650bf7551ac5cffd01d857b"
>> -PV =3D "0.6.1+git"
>> -
>> -S =3D "${WORKDIR}/git"
>> -
>> -# NO-OP the do compile rule because this recipe is source only.
>> -do_compile() {
>> -}
>> -
>> -do_install() {
>> -       install -d ${D}${prefix}/local/go/src/${PKG_NAME}
>> -       for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
>> -           if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
>> -               mkdir -p ${D}${prefix}/local/go/$(dirname $j)
>> -           fi
>> -           cp $j ${D}${prefix}/local/go/$j
>> -       done
>> -       cp -r ${S}/src/${PKG_NAME}/LICENSE ${D}${prefix}/local/go/src/=
${PKG_NAME}/
>> -}
>> -
>> -SYSROOT_PREPROCESS_FUNCS +=3D "go_notary_sysroot_preprocess"
>> -
>> -go_notary_sysroot_preprocess () {
>> -    install -d ${SYSROOT_DESTDIR}${prefix}/local/go/src/${PKG_NAME}
>> -    cp -r ${D}${prefix}/local/go/src/${PKG_NAME} ${SYSROOT_DESTDIR}${=
prefix}/local/go/src/$(dirname ${PKG_NAME})
>> -}
>> -
>> -FILES:${PN} +=3D "${prefix}/local/go/src/${PKG_NAME}/*"
>> --
>> 2.42.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#8587): https://lists.yoctoproject.org/g/meta-virtu=
alization/message/8587
>> Mute This Topic: https://lists.yoctoproject.org/mt/104598181/1050810
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsu=
b [bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>


