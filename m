Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6456.1621393345414185434
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 18 May 2021 20:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=IKGq00yH;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0773d2c4f1=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14J2wYuC012011;
	Wed, 19 May 2021 03:02:23 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam07lp2045.outbound.protection.outlook.com [104.47.56.45])
	by mx0a-0064b401.pphosted.com with ESMTP id 38m8uh88xa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 May 2021 03:02:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dKLA/ZFIRcPltognKMvHjlL/qzDHsdP3NqWWi31NufrNK6m2TlnPvkvf8aenblZkqa7EV34HF6jDH79JszysDMaWriOEaT6d5axHxK9iy74bRg/f4NDBBIXC9Y+uWRPtzemtosGZxhQfyjwY9uZ7g4O3mVXLJE16fDYFF8idkneKr/BTLeY5CtBS4JvLfrFrMCXd+bRw4JIQ51EL3PSW4YgbHC10FcUxGchrnPsTkx3nXjHoNznYMco1XLIwsYviCI53Ufz0aZmhEDGCdy3NXmfjRPpvgI9aAW5GeibS7Ugi0EJqTAydnTsoaxOk6aTc/36tyvrOCgWP2WZZl6gYyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUSJg3VpRtYUn0ZuMN9K7FBQPgGNnZiTEXiH2zYLCiY=;
 b=QCHxbaSph5l30onU4JG+258G+r2qmlz0QxIQSihlCeUpgjODzYgRgd/n/zxih5B42gOlJ+JrYwia074vSAY0PS7EhB3OMI2awWdEI35+8AkR6oGfBqDCx0iFLIkRKIATCw8qOuX6ZgXWJjqSVSkWUYuGvamW/L6rYxPKAjJ4doy5kAzLiRcgqeZC6XzYE6UxqmmYNKeGO4nWghxxY/T8AmiM0lYC9ivHFzlFRf+yeLUbtuZGZxnfncGrYP4D2QX9ta1lYUUI9lKPL3BvGKGoQMOvMzBsmqsQnlmHRS37LcCrsO9K8eBZ8KuQw87pqV/qrUMcOkRWBRXK5HofB7DovQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUSJg3VpRtYUn0ZuMN9K7FBQPgGNnZiTEXiH2zYLCiY=;
 b=IKGq00yHgP05LzWuenNRqQ0dPbFG1HL9Osi1vIIiWAepw11huuILFFvqvOVT/jK4FzqLbw1OafljMxsG+pbJvGwl9xGfdppvz8OM1GeCRoePyhTMqmD1LDReCZIb2azboAivu4OT6+0l+5Xj6TuDkkkaD/kIVj24JmT2XVeNqBA=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB3029.namprd11.prod.outlook.com (2603:10b6:a03:8e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.29; Wed, 19 May
 2021 03:02:19 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b%7]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 03:02:19 +0000
Subject: Re: [meta-virtualization][PATCH] nativesdk-sloci-image: add recipe
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20210518045546.57617-1-Qi.Chen@windriver.com>
 <CADkTA4MR2hnoB73ohuDrwK7_aSy0ak8mkftb-iev-LyXh6NvXQ@mail.gmail.com>
 <f99fa35d-0f7d-6340-8e62-863588b6a4dc@windriver.com>
 <CADkTA4M2cxRadTv_C49PvcNLQg-w-oJwfEThVi0oLhUjf-vAog@mail.gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <fac74f8a-1d58-1bfb-9202-45dc4f23c93c@windriver.com>
Date: Wed, 19 May 2021 11:11:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <CADkTA4M2cxRadTv_C49PvcNLQg-w-oJwfEThVi0oLhUjf-vAog@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0053.apcprd04.prod.outlook.com
 (2603:1096:202:14::21) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HK2PR04CA0053.apcprd04.prod.outlook.com (2603:1096:202:14::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.4129.32 via Frontend Transport; Wed, 19 May 2021 03:02:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28f9ed6b-eb8e-4154-6a11-08d91a7283a9
X-MS-TrafficTypeDiagnostic: BYAPR11MB3029:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB302952EBADE0F692A74F57DEED2B9@BYAPR11MB3029.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0iNoWpsSqUF4qUEUVXpxyjZCzVbOsiSx83SBkdh5XNPe2NkiZtdVpaz7taiImZcaGWpIvgQ3eCzGarXCWVyKUy94T6Z9pPd3LA5knBvKJKxmlN23LZQaGl/r1kYwo3cjZsh9ymipbiYH8tZO1xpGFhhhFkS4QegDwbs/GtroEXKZKByBhtZfYgnxJAIa6UxbHhXUXL0ZfTZC0xv2og6FlPX9iVih7k1rFyPWvMBjlsJqjlGM126UDKsY6o3rMe71mMa5WdhShkchutZD49yJYRHROgTIZsZ+xhdIDCZDT72yE3snRgnJcrKmo05x8Ue9wzAzZJSRWR1+ZohyOPyTtzbS/bbsMptfFQxvQ0qJe4CRe0vqxast6T4X605J/pVNr8QTEMWia67faJw7fNgu9F8jqsHJ1fv9WN1fmtQYQdDU6jHZLOjJuZyoqDTodKHECrWTXXuYn6ouF22zVHlDd0Sc5cqRhWtcyAwzGEV8Gn19K8m2p3AcF0sR+ON2HdMZqL8lhUQTgTa2KGtTZnFiRo+1jElsDfb3ceFhiaPP9zjTxOvr7JidT4a7NF98sDMwIHusLf9mxVgkpL2pcrHFcDUQHYwXkQt8GyfICk52dAoCro4mfksG2pSbDFAOBfrvnqCdusO/wM06qgKhmIfFlmxNuW5ICxryx0ioOCmQR2x15t7Vd8Nmnb41kUhcWV7Ci/eFy+U7iaBNj+8w0tLk4ZeFZO6fuwIg5rZGF29j3SX6snaxE88S8tmqBu2PGlDkFgk2l1WwoQh3+FCSWsitcaSkgMIwYNKsVwC+0D5jOnOW5ddQSNggAaUyf+WYX4wnIpCvI4GImqGahAB3y4PwCWHNJnjtx7kgEe0bqiRLQ4M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(396003)(39840400004)(136003)(316002)(956004)(8676002)(66946007)(16526019)(86362001)(16576012)(53546011)(31696002)(2906002)(38100700002)(52116002)(8936002)(66556008)(66476007)(2616005)(36756003)(83380400001)(6706004)(31686004)(6916009)(966005)(6666004)(4326008)(26005)(38350700002)(6486002)(186003)(5660300002)(478600001)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?VHVyK1diRnlWWEVZTC9xWkNJMXU3NEhnRkF1elVoNkxCK1k4aWFUS3g2UFFX?=
 =?utf-8?B?NkVIZzM5SEh0dXlhT0VGZTFzeTlQOHZ6UmxuTk5sMi9YdjA4K3o2MDM3VG8y?=
 =?utf-8?B?ek45c2FjYmR1MGN6SEpvYU94M1JhenEvNTVYbTNVTDA2RkcvMWZFOGgvZ1Yy?=
 =?utf-8?B?MnJmRDZWRC9XNFNFR05sVkozeitSNGRMZzlWYUJmRnhzajZTYkJCbXJmNHhI?=
 =?utf-8?B?cHFkaHNDSnd0VGdCZll6d3piNW5oYWdZMFdLYW5wTWhZanNwTHNzaFlTbDlM?=
 =?utf-8?B?azBKNkI5ZU50SUFvUGFRVHUyQkxuamhMRnlSbmF1bkxrS2F0NVg5dytJSkFD?=
 =?utf-8?B?OSt1OG9NdVE5TmhOWW10RlE1M1VSVDY4WGcyaVFqUS9PT2RxOG1QVEFueS8y?=
 =?utf-8?B?WXFLaWlvUDNXSVFlZ3dQbG1jNVhrL3ZZTkY2dUFiamc0Sm5mTFUzUGZ2azV6?=
 =?utf-8?B?MjVyalVoL2tKRVF1cHIrRkpkdWEydnZseDQwaHZ0b0FMZDlHWlJMWmZkYWJP?=
 =?utf-8?B?cllRM0tnM25LeHZ5TCtiSHVWek5CY3F6Qy94UmdmRUtyN3BnQVJocGVKcExT?=
 =?utf-8?B?K0RjcGdzVVV4QzVVajI4azlja28zbUduWWdiQ2s4c2puT0FZNlREMVR3OHM3?=
 =?utf-8?B?c2ZuQ3FaSTBOQmR2VytXZlJ2alZ5QUNraGYvLzhHYlZsQ2t0OXZ6OWpxZHF6?=
 =?utf-8?B?bExsUHY3RW0vaTNTempVeE9OeEhrN1FYVFMvN2Q1bHNMaURLaE1nZCtaa2F2?=
 =?utf-8?B?Wm02NjdDbnRkV2lpUGZjeWR5NW1zVjVyU0JxWXJnRlREYThzaEx1aVNJMEx6?=
 =?utf-8?B?djZiYzRmRlBOUzdzbUk2NWQ3cGNuRWJCZDQ1MDBtN2VJOUJvRlE2TW5vS012?=
 =?utf-8?B?b3ZGaEdjQmU5MnNLVUxiczRlQUpFSEF6QXhldGY3SVZHenNkQUl0OGxUUDVa?=
 =?utf-8?B?WHNYYkFWZEdTNWZTUkRrdmpyd0owZ043ZFBXRWp3NHpWNkNNOXp4RXp4WEQv?=
 =?utf-8?B?Mkh6TnVsdjRpM0RVRjQzMzE2ZnR3QWV4a0lUNWRBMFY5WUN5cEhoRDBuU0xB?=
 =?utf-8?B?K3kwOEZMYWI2Q3QxRXpENWFQOWFMOVlpU3NKWkFZS0tVeldRMFFmdGo5SXIv?=
 =?utf-8?B?aFNTSllsSGl1WjE5Q1FhM0hNTTI0UHNzSzU5OEd5ZUt3N0dRVTlmTkVxTEs4?=
 =?utf-8?B?Wk55ZzUrak1tYzRVTXdEKzlpQ2sramVFV3I5dDJYTVpVOUpUbXQ2ZkVXM3U3?=
 =?utf-8?B?UWcyVWhRM0pEOW0wcndnTUI2QnFDcm92c3dZRDd4LytUdG1OUEFTNHVKNGFs?=
 =?utf-8?B?bUJyU1NPTmttZ1NwcjJrVzVrMGVzR1BCZ3Y3SkNJOFBwb0VJOEJhY0g5Q05s?=
 =?utf-8?B?SGdLdnhXZVZTcVVhM3dleW1USE5xTlcwTWQzeTI4YUh3T0xTOVNaWTNmN01m?=
 =?utf-8?B?b3JsRU9sNnJvelFYNE9vako4RUNmZUx0dTMvU29nUkdVT01sbVdWL2JLaTN5?=
 =?utf-8?B?anBKdkViNDIxSVhRdEE5KzRQN0RWZkk3SmU1OGg3UTdBMEx6SUVhL2Rienp3?=
 =?utf-8?B?emM1aDVpSHFYejVUTm1hRkM4YTJ4aENWYURzUUt6R2dZdndzMGRuczZYNVo1?=
 =?utf-8?B?ektMblJoeWx0My9TVlhQeVd3alhVQ3EvMkd4U3FGd3RxZjY0dTdLaitoRzFT?=
 =?utf-8?B?amhVMS9rUlNsUzJ2dUd4MWU4eW9ERG1ESjdBRVNPcGVZSDdhOVFLU2VEak9P?=
 =?utf-8?Q?o3eMVmskKfnEC0WVMOBhtxGZsnHEh5rc1n7SEoo?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f9ed6b-eb8e-4154-6a11-08d91a7283a9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 03:02:18.8497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: knqiQ05VlbKKpdUcFiHTwvDo3EHJs6ct46Dgm+FskqDjUhOtG+m4DUoj2hcglQxJW6g7Ze05r8/teuiI1o7OYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3029
X-Proofpoint-GUID: IdKwZmNFEDEyte5jK765FeunoHyNAXsE
X-Proofpoint-ORIG-GUID: IdKwZmNFEDEyte5jK765FeunoHyNAXsE
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-19_01:2021-05-18,2021-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105190021
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/19/2021 10:38 AM, Bruce Ashfield wrote:
> On Tue, May 18, 2021 at 9:23 PM ChenQi <Qi.Chen@windriver.com> wrote:
>> On 05/18/2021 08:03 PM, Bruce Ashfield wrote:
>>> On Tue, May 18, 2021 at 12:55 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>>>> Add nativesdk-sloci-image recipe which is basically from the
>>>> sloci-image-native recipe.
>>>>
>>> Copying the recipe is a bad idea.
>>>
>>> What's wrong with just adding the inherit nativesdk in the existing
>>> sloci recipe ?
>>>
>>> Bruce
>> Hi Bruce,
>>
>> This is because a recipe cannot inherit native and nativesdk at the same
>> time.
>> Hongxu once sent a patch to rename the native recipe to
>> https://urldefense.com/v3/__http://sloci-image_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jvB1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D21g_xdpSg$  and use BBCLASSEXTEND = "native nativesdk", but that
>> patch was rejected.
> It wasn't rejected .. I gave feedback that it shouldn't drop the -native from
> the name, but that it could be both nativesdk and native.
>
> At the time, the recipe needed to be clear that it wasn't for on-target use,
> and was build side only. Having -native in the name was the clarity I was
> looking for (as was the inherit native).
>
> Last I checked, the recipe name could still be -native (it's just a
> name after all),
> but have the BBCLASSEXTEND instead of the include line.
>
> And a quick test with the following change, allowed me to build
> sloci-image-native
> and nativesdk-sloci-image-native:
>
> diff --git a/recipes-containers/sloci-image/https://urldefense.com/v3/__http://sloci-image-native_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jvB1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D20oXeUINQ$
> b/recipes-containers/sloci-image/https://urldefense.com/v3/__http://sloci-image-native_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jvB1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D20oXeUINQ$
> index a68c6d9..fc3c329 100644
> --- a/recipes-containers/sloci-image/https://urldefense.com/v3/__http://sloci-image-native_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jvB1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D20oXeUINQ$
> +++ b/recipes-containers/sloci-image/https://urldefense.com/v3/__http://sloci-image-native_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jvB1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D20oXeUINQ$
> @@ -11,8 +11,6 @@ DEPENDS = ""
>   SRCREV = "4015e49763e5a738026a5bbfcf32b38b5a4fa650"
>   PV = "v0.1.0+git${SRCPV}"
>
> -inherit native
> -
>   S = "${WORKDIR}/git"
>
>   do_compile() {
> @@ -25,3 +23,5 @@ do_install() {
>   }
>
>   CLEANBROKEN = "1"
> +
> +BBCLASSEXTEND = "native nativesdk"
> I'm actually just finishing up some work on OCI image backend switching and
> have some reworking of the sloci-image recipe ... and there are some
> use cases where it can be used on-target (whereas that wasn't the case before).
>
> So the rename to _git is possible, as are the BBCLASSEXTEND changes to
> the newly named https://urldefense.com/v3/__http://sloci-image_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jvB1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D21g_xdpSg$
>
> Luckily we still have sloci-image-native as an available build target,
> so nothing
> breaks with that rename.
>
> I can take care of that change right now, if that sounds like it meets what you
> are looking for (that change being the BBCLASSEXTEND in a renamed sloci
> recipe).
>
> Bruce

Yes. Definitely! What I need is native and nativesdk support of sloci-image.
That would be great! Many thanks!

Best Regards,
Chen Qi

>> So I figured that adding a nativesdk-sloci-image recipe is only
>> remaining way to enable nativesdk support.
>>
>> Maybe I should extract the common part to sloci-image.inc, and the
>> native/nativesdk recipe only contains two lines like below:
>> require sloci-image.inc
>> inherit native (or inherit nativesdk)
>>
>> What do you think?
>>
>> Best Regards,
>> Chen Qi
>>
>>
>>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>>> ---
>>>>    .../sloci-image/https://urldefense.com/v3/__http://nativesdk-sloci-image_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jvB1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D22nEkW98w$   | 27 +++++++++++++++++++
>>>>    1 file changed, 27 insertions(+)
>>>>    create mode 100644 recipes-containers/sloci-image/https://urldefense.com/v3/__http://nativesdk-sloci-image_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jvB1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D22nEkW98w$
>>>>
>>>> diff --git a/recipes-containers/sloci-image/https://urldefense.com/v3/__http://nativesdk-sloci-image_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jvB1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D22nEkW98w$  b/recipes-containers/sloci-image/https://urldefense.com/v3/__http://nativesdk-sloci-image_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jvB1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D22nEkW98w$
>>>> new file mode 100644
>>>> index 0000000..3c2b539
>>>> --- /dev/null
>>>> +++ b/recipes-containers/sloci-image/https://urldefense.com/v3/__http://nativesdk-sloci-image_git.bb__;!!AjveYdw8EvQ!IKbzht5nzzta0IFVO03JT5jvB1r_KWMX8Zmv-RxCOLxOY5eE1caxW8R3D22nEkW98w$
>>>> @@ -0,0 +1,27 @@
>>>> +SUMMARY = "A simple CLI tool for packing rootfs into a single-layer OCI image"
>>>> +LICENSE = "MIT"
>>>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=948cd8e59069fad992b0469af9ad7966"
>>>> +SRC_URI = "git://github.com/jirutka/sloci-image.git \
>>>> +           file://0001-sloci-image-fix-variant-quoting.patch \
>>>> +          "
>>>> +
>>>> +
>>>> +DEPENDS = ""
>>>> +
>>>> +SRCREV = "4015e49763e5a738026a5bbfcf32b38b5a4fa650"
>>>> +PV = "v0.1.0+git${SRCPV}"
>>>> +
>>>> +inherit nativesdk
>>>> +
>>>> +S = "${WORKDIR}/git"
>>>> +
>>>> +do_compile() {
>>>> +       :
>>>> +}
>>>> +
>>>> +do_install() {
>>>> +       cd ${S}
>>>> +        make PREFIX="${exec_prefix}" DESTDIR=${D} install
>>>> +}
>>>> +
>>>> +CLEANBROKEN = "1"
>>>> --
>>>> 2.30.2
>>>>
>>>>
>>>> 
>>>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

