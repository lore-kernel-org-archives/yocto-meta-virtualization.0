Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1868.1621995173653597776
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 25 May 2021 19:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=RpyValm3;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=07807ce0ef=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14Q29e9Q024498;
	Wed, 26 May 2021 02:12:52 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by mx0a-0064b401.pphosted.com with ESMTP id 38rgn513j9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 May 2021 02:12:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NaZnMi+bsLkOG4f48m+RzcY71xacZdQJnsxI5XUhxLsrmGVODr+OpIssx4Xk4yTboJlPNGnkEIvALPYHTEzZG31hOuyh3a4TgevGZ25G5FzyJnFXWOXitYToUpchtgK0C6z6yG4dbFDoXHE1XDoSh3ecGyHnWSEf992uCHy+BNJGy9jT0t5SYfaNw+Pr47Da7huwfcfo0WRA7fd7k1hfKa7RFYki0g5yxsVIBe0JeUgiy9MM15ANhjqPX7jT8E6zCFTbJo84pHtdfzT50gC926F2G9slOgW6xrpcN6TZT4k6cuNjlIyJGM8S/mpWxFHVToE20BnHVU8OMeUUQTyF+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUmrz7urJgpAf5hRE/6A8Gy+xR+TERB094UveEhjrxk=;
 b=ZkfBkNrh60gNB/r7ltBgKam0rm+20IZgqHm5C1MXABINZoeAL/fDTus5IXuvESUZRNj57kv8gJ5piypZnezkh8UqYRdwd6UsyPOCMnSzEVTMArSfcLCVxdjwjUJUdSxRvnwZ8GLSVfZJ50AADassOfmTC94C4a/wHAgNUbmWjizD3Z/HJ6ws9mINDCPcMBc0aC0DiU5b+UMVH8y48NDKPQJa/spUKs6af7QFFVT/PNIbsEmv/lrr3rmUwn519r9M6eVkmrZeqUEx0bD8u+5hSowxHFNs040d1ey97hjrYy0seMmpYhcwuXz/RDPolZ6vKEeBg6zh6fBBd04EaPwb2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUmrz7urJgpAf5hRE/6A8Gy+xR+TERB094UveEhjrxk=;
 b=RpyValm3O2T5uxyW9hz2aEi0h3pnG/JZllS3JubYxHCHecEBUaTm+hwg1buBqqkltVDzN7A9tbr6kTvpd5mDf4LU1k5HM8TH2/ngITk+g4AYPuIRTRywo3Dq5q9HfGeQd1yBFtaUflOXst2NorKb3wX8ftQ/Q2n+ybUEOTk9Rg4=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB2728.namprd11.prod.outlook.com (2603:10b6:a02:ca::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 26 May
 2021 02:12:50 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b%7]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 02:12:50 +0000
Subject: Re: [meta-virtualization][PATCH] nativesdk-sloci-image: add recipe
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20210518045546.57617-1-Qi.Chen@windriver.com>
 <CADkTA4MR2hnoB73ohuDrwK7_aSy0ak8mkftb-iev-LyXh6NvXQ@mail.gmail.com>
 <f99fa35d-0f7d-6340-8e62-863588b6a4dc@windriver.com>
 <CADkTA4M2cxRadTv_C49PvcNLQg-w-oJwfEThVi0oLhUjf-vAog@mail.gmail.com>
 <fac74f8a-1d58-1bfb-9202-45dc4f23c93c@windriver.com>
 <CADkTA4PCfaOUW5BTJ_4yqA7xmy+gxbU0+Uut60rkCD3okJ_nxA@mail.gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <3f3801ea-e2a0-f730-5cfa-f3198c5d1779@windriver.com>
Date: Wed, 26 May 2021 10:22:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <CADkTA4PCfaOUW5BTJ_4yqA7xmy+gxbU0+Uut60rkCD3okJ_nxA@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0007.apcprd03.prod.outlook.com
 (2603:1096:203:c8::12) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HKAPR03CA0007.apcprd03.prod.outlook.com (2603:1096:203:c8::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.4173.12 via Frontend Transport; Wed, 26 May 2021 02:12:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3dc6b8f6-a043-46cf-be60-08d91febc2c1
X-MS-TrafficTypeDiagnostic: BYAPR11MB2728:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB272829865291B12D30C9CF8BED249@BYAPR11MB2728.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QEBekYas5YxYSY0/err9WT1wvKLglVG+tH+8L8ucfyznW5f+fDf+aFnt+STQwtJkIXmsYrEuCuq9CssVSUyQBYkbbc7344UhN5px6W/ACMFKiQjtCMcS7jhLngREsIF88cqCdWCsr19vvrp+s+DU8XYg2KZVfxC/VpjxdJOUg0izs0/0sa8rgXlqZ0PBoPsM+blCKVS4K1+FVDFoctRX68BJiH7e0WvwuIs0hyJJ5fosFLKg4kkJ1whobMx0BqgyMr6R85pkzGj1VGR/rZ0MuKtXJhv1bjPesrXXHTHWYTssU/iAIc4wSke/XJLv2dXPJ+oB3zLTgePhPj+BCRgrJKNCUI0CnUXbujlqjIio//uNqMbKhzM03DU4+j5ZgRVjyp9Isq32SepCaV7nvIFwzYswiuZur0pprmy07ptPpgzOppDP2ELX3SwZDSIqUVWujyEfyGW+WshbE2eW5ry7GVEovdacPYXb6b1e2tU3dSGPeBCf1a/BoP/jFYG/oMh/IQkYg+Ux8LkCsji0gayXyeIgjk5eus/dPBTx9XwhmFbxF+aegok7hJSrQFACVWxiphtmyLV1wuvfuwNtlfT1x0vL22wOeCSry2XxSMHRN2fQu7+STPSAKG1miGEMRK+WH2h3sSsIfJHL8zfptf/6QrxESrEQgpsRzYAlPzLUgayNWaPPSe1tjzboHM+3M302IPJzgYtKbTGGbHZ7w/3aE/cjwqDyrB3cS9QBL3TCZkIECdRIxrYvzSnk4Je3/apbpWrBxyD+19wgT7lUb5fdF+tAHR8ka3LQOaDm0NLLF39sF3UuzHxh643xqxnbnuL7Tqlb0KO1UDFR7ey1UPOMUT0JF/zJmy0a4YdVoDC2tHo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(39850400004)(136003)(396003)(83380400001)(31686004)(86362001)(2906002)(6486002)(31696002)(6916009)(6706004)(36756003)(8676002)(16576012)(4326008)(8936002)(66476007)(52116002)(53546011)(956004)(478600001)(38350700002)(2616005)(316002)(38100700002)(186003)(26005)(16526019)(6666004)(966005)(66946007)(66556008)(5660300002)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?b3FNUWN0UnM0SGQ1ajJRUlBVNklkcHU5ME1xWUlEb3h5UE9oVFdUTUxXdGph?=
 =?utf-8?B?ZHk1a1ZmT1BNWjlZKzZYc0hXbldra2dRN1h1TTdteDJ3MUJmc25LNDFlVE92?=
 =?utf-8?B?dldIdTBxSmlORWRpVjg4WVpGS1BvR1BVRkVodi96K3lRb1NMNGdnelk5b2ZL?=
 =?utf-8?B?ZStDN2NoSldEUGt1bWhvYWdxR0ZMaGZwcUxDaHZNaWZjcUtEM2ozQjNWOGNq?=
 =?utf-8?B?L0dMcDdSTWdQU2djeExlOUUzd0xhZ1l2M3JtUkdicUdZMjkrMVVGMEEwendT?=
 =?utf-8?B?TXhzQVUzL3JaOG5vakRaUW0vSGlTVGc4Zk5WSExXNlJDZ0x5eEtnT1VvMjVH?=
 =?utf-8?B?b2YxNTRrSmhoaEdyL0Jjb2F6cFMzUXNLaGhjZlNBUStlZFZnMFdrdEh2ckVS?=
 =?utf-8?B?d3JpcDA0NGRxRGFTQkMxK3poRGJYM1dIeUloZnN3Smd1MDNBQ2JsNktQSk1m?=
 =?utf-8?B?UjBWdFlnZllOcXpNSnJWTWFmRkUxTjd3YWE0ZEN2YlRXNGV1OXBFbFhLWmxy?=
 =?utf-8?B?N0pSMDdxZFlvZ1N0T05HZEdMVUhmRmo0OE5EeFVNeStKUjFhU1htUUFteUhD?=
 =?utf-8?B?QVFSeXFKczM0U2Z2bnVWcFMraTVxc3dQaEZQdkMyWFp4SnlMNy9PNXkyTFps?=
 =?utf-8?B?RXRGNHFsdFI3R2N0MjhYdmorNHNkS3p2OGxvektOeklCNHdUMUxFaE5ONWN0?=
 =?utf-8?B?Tk1lVXF3UjhuUDk5VHRMMUFMNWE4L0VpcHYzMmp2OGc4MVFoVjlJbHhyaVUr?=
 =?utf-8?B?bjFJNkRiM09QSW5Nbk9IZHB5N2NFTGt2MDNvaFp2NDIzR0dwZlR3UUh6VjBv?=
 =?utf-8?B?THRHeGxMMTFPQ2todnZpSU9neDFGTjF0TnZrUjlNdzgrOTFPdCtqNGR3SnIr?=
 =?utf-8?B?N25KODVNN3RJUGV2TlR3c1UzMHhISlZRV1dtRWlxdmtjWnBTbFFtNU5EdFUx?=
 =?utf-8?B?all6aUR5bStySXZWRlhCcFUzMnoxcFVNeG9WVm1DMXRGVVoxUm5BdVR4WTNs?=
 =?utf-8?B?bEZDQVUwOWlzNi9idHZJRnVvQjU1NUQ5WTdONW9TMUR6UnhpVURYZWJOUzRB?=
 =?utf-8?B?QjVBZGVPUEl2OWZEQnpBV0lLVGExN1ExWFVqWm5TOHNjWlp3MVZTVVNCU0hJ?=
 =?utf-8?B?QXZyTTc3VDdYcFBuQUtNKzZ1SjMrRUUzL2ZwUFo4VXBURE9WK2hTdG85UFVh?=
 =?utf-8?B?TlNSdWVIQVhaeldJdEZjNUVjNi94ZTJsbnpEQjRWT1FKL0tPa2Y2L0srSnhh?=
 =?utf-8?B?OGVjWUtHSGMvT21PWWR3cW81cWMxdGUrNmdmak1USm02eEZtUURWSFgwUmNx?=
 =?utf-8?B?aUZWZ3NpckFtT1lKbll1cG9uTFFBWE9KTDJtWFlvT1VrTE8yNUVxTDhJZkJV?=
 =?utf-8?B?TXJmUFNpczlmN0pHR01tdEQ2cVB3V1NFNHdHUFJlTncydWdRN2FKdTBmeXZV?=
 =?utf-8?B?OGxmcHlDK0p6b0RoWXozV29ta1c1clVQWVlJWmd3ZDdqbmtQd2tQdnBBUUhN?=
 =?utf-8?B?MysyRTRpMlFkRTR0c2tjbDgwS0JlMUVPQVBqc2d6dDVEekhXVWlaMHcwaUtn?=
 =?utf-8?B?aGJkakpoeEVpb25POGczMXdiMlM3TXlwYjVkTXQ3WlE1SEJkRWd1Mm9zQ2xR?=
 =?utf-8?B?dmZEbGpoNUE4Y29ram9vdlZzOXNzN21FMEI3NWpCQzJWNWtoS1kxaFRCeEVl?=
 =?utf-8?B?S2ZjT2JQWC95TW8rNXdEci8vSVdNMkR5enZ5NVAzcURPSGVFWXJMZDRlMk1i?=
 =?utf-8?Q?PteT7KBj7i4QuWlT4U2PnKIzY5kHIH/3tPCJlDL?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc6b8f6-a043-46cf-be60-08d91febc2c1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 02:12:50.0955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6GNnypYLGZzss3at3olDzouUr765HoQJg2ajUV0CcL3Cn5DKx6U+Pcl+w3VXOs35rObvUImu7ffnpxE8n+DzqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2728
X-Proofpoint-GUID: 6wgBHdNJ2-fubFTFzL3rqgREuFujTz6M
X-Proofpoint-ORIG-GUID: 6wgBHdNJ2-fubFTFzL3rqgREuFujTz6M
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-25_09:2021-05-25,2021-05-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 phishscore=0 spamscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2105260014
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bruce,

Sorry for the late reply.
I've tested nativesdk and native. It's working well.

Best Regards,
Chen Qi

On 05/19/2021 11:09 AM, Bruce Ashfield wrote:
> On Tue, May 18, 2021 at 11:02 PM ChenQi <Qi.Chen@windriver.com> wrote:
>> On 05/19/2021 10:38 AM, Bruce Ashfield wrote:
>>> On Tue, May 18, 2021 at 9:23 PM ChenQi <Qi.Chen@windriver.com> wrote:
>>>> On 05/18/2021 08:03 PM, Bruce Ashfield wrote:
>>>>> On Tue, May 18, 2021 at 12:55 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>>>>>> Add nativesdk-sloci-image recipe which is basically from the
>>>>>> sloci-image-native recipe.
>>>>>>
>>>>> Copying the recipe is a bad idea.
>>>>>
>>>>> What's wrong with just adding the inherit nativesdk in the existing
>>>>> sloci recipe ?
>>>>>
>>>>> Bruce
>>>> Hi Bruce,
>>>>
>>>> This is because a recipe cannot inherit native and nativesdk at the same
>>>> time.
>>>> Hongxu once sent a patch to rename the native recipe to
>>>> https://urldefense.com/v3/__http://sloci-image_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jvB1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D21g_xdpSg$  and use BBCLASSEXTEND = "native nativesdk", but that
>>>> patch was rejected.
>>> It wasn't rejected .. I gave feedback that it shouldn't drop the -native from
>>> the name, but that it could be both nativesdk and native.
>>>
>>> At the time, the recipe needed to be clear that it wasn't for on-target use,
>>> and was build side only. Having -native in the name was the clarity I was
>>> looking for (as was the inherit native).
>>>
>>> Last I checked, the recipe name could still be -native (it's just a
>>> name after all),
>>> but have the BBCLASSEXTEND instead of the include line.
>>>
>>> And a quick test with the following change, allowed me to build
>>> sloci-image-native
>>> and nativesdk-sloci-image-native:
>>>
>>> diff --git a/recipes-containers/sloci-image/https://urldefense.com/v3/__http://sloci-image-native_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jvB1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D20oXeUINQ$
>>> b/recipes-containers/sloci-image/https://urldefense.com/v3/__http://sloci-image-native_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jvB1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D20oXeUINQ$
>>> index a68c6d9..fc3c329 100644
>>> --- a/recipes-containers/sloci-image/https://urldefense.com/v3/__http://sloci-image-native_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jvB1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D20oXeUINQ$
>>> +++ b/recipes-containers/sloci-image/https://urldefense.com/v3/__http://sloci-image-native_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jvB1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D20oXeUINQ$
>>> @@ -11,8 +11,6 @@ DEPENDS = ""
>>>    SRCREV = "4015e49763e5a738026a5bbfcf32b38b5a4fa650"
>>>    PV = "v0.1.0+git${SRCPV}"
>>>
>>> -inherit native
>>> -
>>>    S = "${WORKDIR}/git"
>>>
>>>    do_compile() {
>>> @@ -25,3 +23,5 @@ do_install() {
>>>    }
>>>
>>>    CLEANBROKEN = "1"
>>> +
>>> +BBCLASSEXTEND = "native nativesdk"
>>> I'm actually just finishing up some work on OCI image backend switching and
>>> have some reworking of the sloci-image recipe ... and there are some
>>> use cases where it can be used on-target (whereas that wasn't the case before).
>>>
>>> So the rename to _git is possible, as are the BBCLASSEXTEND changes to
>>> the newly named https://urldefense.com/v3/__http://sloci-image_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jvB1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D21g_xdpSg$
>>>
>>> Luckily we still have sloci-image-native as an available build target,
>>> so nothing
>>> breaks with that rename.
>>>
>>> I can take care of that change right now, if that sounds like it meets what you
>>> are looking for (that change being the BBCLASSEXTEND in a renamed sloci
>>> recipe).
>>>
>>> Bruce
>> Yes. Definitely! What I need is native and nativesdk support of sloci-image.
>> That would be great! Many thanks!
> The change is pushed. Let me know if it causes any issues.
>
> Bruce
>
>> Best Regards,
>> Chen Qi
>>
>>>> So I figured that adding a nativesdk-sloci-image recipe is only
>>>> remaining way to enable nativesdk support.
>>>>
>>>> Maybe I should extract the common part to sloci-image.inc, and the
>>>> native/nativesdk recipe only contains two lines like below:
>>>> require sloci-image.inc
>>>> inherit native (or inherit nativesdk)
>>>>
>>>> What do you think?
>>>>
>>>> Best Regards,
>>>> Chen Qi
>>>>
>>>>
>>>>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>>>>> ---
>>>>>>     .../sloci-image/https://urldefense.com/v3/__http://nativesdk-sloci-image_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jvB1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D22nEkW98w$   | 27 +++++++++++++++++++
>>>>>>     1 file changed, 27 insertions(+)
>>>>>>     create mode 100644 recipes-containers/sloci-image/https://urldefense.com/v3/__http://nativesdk-sloci-image_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jvB1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D22nEkW98w$
>>>>>>
>>>>>> diff --git a/recipes-containers/sloci-image/https://urldefense.com/v3/__http://nativesdk-sloci-image_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jvB1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D22nEkW98w$  b/recipes-containers/sloci-image/https://urldefense.com/v3/__http://nativesdk-sloci-image_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jvB1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D22nEkW98w$
>>>>>> new file mode 100644
>>>>>> index 0000000..3c2b539
>>>>>> --- /dev/null
>>>>>> +++ b/recipes-containers/sloci-image/https://urldefense.com/v3/__http://nativesdk-sloci-image_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jvB1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D22nEkW98w$
>>>>>> @@ -0,0 +1,27 @@
>>>>>> +SUMMARY = "A simple CLI tool for packing rootfs into a single-layer OCI image"
>>>>>> +LICENSE = "MIT"
>>>>>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=948cd8e59069fad992b0469af9ad7966"
>>>>>> +SRC_URI = "git://github.com/jirutka/sloci-image.git \
>>>>>> +           file://0001-sloci-image-fix-variant-quoting.patch \
>>>>>> +          "
>>>>>> +
>>>>>> +
>>>>>> +DEPENDS = ""
>>>>>> +
>>>>>> +SRCREV = "4015e49763e5a738026a5bbfcf32b38b5a4fa650"
>>>>>> +PV = "v0.1.0+git${SRCPV}"
>>>>>> +
>>>>>> +inherit nativesdk
>>>>>> +
>>>>>> +S = "${WORKDIR}/git"
>>>>>> +
>>>>>> +do_compile() {
>>>>>> +       :
>>>>>> +}
>>>>>> +
>>>>>> +do_install() {
>>>>>> +       cd ${S}
>>>>>> +        make PREFIX="${exec_prefix}" DESTDIR=${D} install
>>>>>> +}
>>>>>> +
>>>>>> +CLEANBROKEN = "1"
>>>>>> --
>>>>>> 2.30.2
>>>>>>
>>>>>>
>>>>>> 
>>>>>>
>>> --
>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end
>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>
>

