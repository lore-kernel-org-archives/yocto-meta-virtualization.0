Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.31937.1630992539930065599
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Sep 2021 22:29:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=LcUoPziU;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4884938210=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1875Klo4020748;
	Tue, 7 Sep 2021 05:28:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=M30PkXvb29eJwnXmU2/cVIjhQ9e9OSwKGw9JnFkdCoo=;
 b=LcUoPziUIGS0hb2DJqhfhk2NDFoZGd1yZSE82WB5W5O0i2jOjg+VB2MI76UeiChx98X4
 lhDNhmoJwj8x6k4BXLp2FBQpe9lEXwPQKJJx/VYeIVLRJtfk2NR85R1YnAvNM6EWvVmX
 W5OdYpVZB0N9dfb4itwBppd9ErLJW3EDk3rGwHn5xsu12YWqB9jjti8u2ioa2SVkRxje
 wWZ9SYkoSEVG5nSRlwyrfDx1CTxzfxhJTxwOygqjvAxOWJJOJLLF6INhP0aeSQrRWvVx
 RHf9yaBsJ1IKLffWvukUEoITGAMiJZtf2NuKgvv1FLnRtcWgdrgh1xnSP4VTsY0ymU/m +Q== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by mx0a-0064b401.pphosted.com with ESMTP id 3awsacr83m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Sep 2021 05:28:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W9ahqrSLyTXT9VUuyVMtabzV0Z1XCyUQgF9B1aqL1JbH/MB0jSb06an2Vk5qOZFgP6+zLDFvEO87x5PSyKcSS/h6O26C6Q2HrsfjiHTnDB493so9whhxdP4AQBQuEPMnFTunOHd2hD2clIl3M8A+GGVBbE5t3PKcPmn7z9aISwGd3SCDiEq0jYGH3GvfhupH5nNEn2s2NmGvAzDNY2D7mT318p6IBJbu7+DUTB9H7IuOKveYWpbZxMjfhXWMhD6+piQMu/rKhcxAS2sLp6gLji3fEUNFJdmcP0LS2ChH8P0K/D7M7d3yZXeA9Fz90E79Ihym9gkzKLFkTGfUK+GvJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=M30PkXvb29eJwnXmU2/cVIjhQ9e9OSwKGw9JnFkdCoo=;
 b=nfpcWyWOiMadL7LIpVtUhu1b9i3e98jAoXHgLi1Obv94JEYAIyKDJV5EIBO2KHiEhl4N6Hr9catQAWMPfJqpU5hGETWjMKZCEONPD1fD/Nevoy/95Y5v2oZ4k7teFFZJUxoXExhmZk+2+csCSSvfGO7LJL2ha1GFKe+0zl5iDnQbI5iXjsCdssNlDvCG0e8eYMtsVYtSbGT2HXDrZRC3NNRqkUIdU5xHFbQtkz5FWSCExG6dlemN15HTSTdrjtjPQVVtv0Kw81To51lY6R0GFoniIGctbhnba23yRWVNCbGeWLQ51Procr9B60mcraBKGGwFfocq5zlVIbm5CZAO0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SN6PR11MB2815.namprd11.prod.outlook.com (2603:10b6:805:62::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Tue, 7 Sep
 2021 05:28:53 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::a544:19b6:196b:f339]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::a544:19b6:196b:f339%5]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 05:28:53 +0000
Subject: Re: [meta-virtualization][PATCH v3] python3: remove the no-longer required bbappend
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>
References: <20210726185823.26402-1-fib@cisco.com>
 <20210726185823.26402-2-fib@cisco.com> <20210729145700.GB40673@gmail.com>
 <SJ0PR11MB4784457572877D025E5E69F5ADED9@SJ0PR11MB4784.namprd11.prod.outlook.com>
 <20210802034542.GA16820@gmail.com>
From: "Changqing Li" <changqing.li@windriver.com>
Message-ID: <714b7089-56d0-d604-83bf-caaa2f0083d0@windriver.com>
Date: Tue, 7 Sep 2021 13:28:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210802034542.GA16820@gmail.com>
X-ClientProxiedBy: HK2PR03CA0063.apcprd03.prod.outlook.com
 (2603:1096:202:17::33) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
Received: from [128.224.162.189] (60.247.85.82) by HK2PR03CA0063.apcprd03.prod.outlook.com (2603:1096:202:17::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.4 via Frontend Transport; Tue, 7 Sep 2021 05:28:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 577ad51e-e8ed-4b5e-3ff1-08d971c06163
X-MS-TrafficTypeDiagnostic: SN6PR11MB2815:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB2815CCAFFA603827D4D38C0F82D39@SN6PR11MB2815.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YblT/sY0Fte5OcETSO/3pCuhZMiAMoVL2RBRbXNcUW8AEFs3Mbyx/9cRmNjZ0aClGK6DEs5I/imc9wBu6ysNYTGqMO/bq9rMBoASDC5uSY6DqWesJb2mw0SAm67w9EaWSksBw0mpa83Y6rLXsteviZPf9k//NcO2SABh3WU0GzF/hoXyAprAJbjmZj5HHSy6etpS+DCDMXJPyH6sfE16rqJFKQwdBtDoFRJomxiiYMl7TzB8oJJWwQx9QUe43U42eegweAe6dNExy/ho5e5oZIYS0v7d0mVeBQgSEyYqQ7GJMT4OJLlo5UOd65FVid0fozA99n2gAZzkTG9j+P2ZRGArcroUG4OK+NIn07OY2YfAq97rWvO++riQiE3IFZdn9kYcAAOqvJ8XVzR/g1pxBuCbaQVGb9t3eIG+hK/EDVXhUYm4qSSoQAuNcLECPR2rlBYISQY8EnNKG9yqtf2dS9XKYMdclUAzwX3IRKkYH2CITImFLNobISJgqaCfLNbvM58hV3WeJtl5EL4N5SBAkFrJVmd2Dy2TCiD56Qw+Ih6U3zIzKgfJpgRvC3TuoGE3gGuGxac70+iTVCDo9r9nWM1XkRzyj5vrKdngI6mZL3q3IsXnZCyURW4ac4TMHn9jE52+aTpvYi/NBCM+kMMLDs5yiAfH8WGZ0xVrii2nArH+0DwCl8+MbHq55QXFlPkcDztMe3SsiWDuG81lpiEjOBAWpunWgy8FVBDbM6kWo8t/y6veoNlXVI7JxzD9j6Z/nh8qruXF6GWdEgz2jWtfAfgike3f+Ed8cavNrQcxr4YORMIuRGsSUm990VNOSjrHdHu/Z1DukGfaolFYqrl6CfZw4K8vU2M1fSuiFiO03X1ARHILev+ezioGbuCYwASU07csm6DqMgKgkzpZjmFMpY/MJSzwboaEJ89/VNRSm+rW70n9/nmYLiUxIOxOYmaf
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(396003)(376002)(39850400004)(956004)(2616005)(166002)(83380400001)(16576012)(316002)(31686004)(38350700002)(26005)(186003)(6486002)(36756003)(66556008)(66946007)(66476007)(53546011)(4326008)(6666004)(31696002)(2906002)(44832011)(5660300002)(8936002)(6706004)(52116002)(8676002)(478600001)(33964004)(966005)(6916009)(38100700002)(86362001)(148743002)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bEo3eFFheDFiTE1IVkU0czJKSW1mdVE4ZXZ5Z1FmVm9jTmkxVlBtQ0J5bk93?=
 =?utf-8?B?Slh1N3VieHpPeFpEOE82RFN0Z0oyc2hEb1drOWJYVEtmWTBudG9TWGhjclRt?=
 =?utf-8?B?Mnh3RzJhWU02dmNoNzJDeEJLTlhmNHdlSVBhNmF4djhPVDZXKzd6SUM0Ny95?=
 =?utf-8?B?RkJ2bHVMTmpxYWRhMk94R1F6WFBrcU9tcGF4Y1J6TnRXeTJoTVR1Q0FLQ3JC?=
 =?utf-8?B?dExoYUpldlVzVGw5M3BvaDE2YTlyWkExOUFCcWFCOUpjTzU0UUMwa081dEpp?=
 =?utf-8?B?UzRHMG4zTDdrNG9OTGxPNnV2emt1UDdHUW1GUFZoM0VubGZqQjBSTVRBdjlo?=
 =?utf-8?B?OE03VEM2TS9PT2F4c1ZRdWhMZEEvbjNaaWxLc29XTkpBcVFGeTZiZk1yOEk5?=
 =?utf-8?B?cUlDLy9adkdWMGlHa21ZWnByZ2p2eW5HSFVYQkJ1a3YvQzcrL1F1WXVzdHNp?=
 =?utf-8?B?ZDg5bHpQMWJMWEkrUStnOFIvUjhLeERob0RtUHN6NFR5WUVMV2E2S25LbXZv?=
 =?utf-8?B?QWRRYXc2OFpvaG1mVGdTeGNpeXhvQzZvakovNnNOUGVYRXc0T3FkWFI2NmNV?=
 =?utf-8?B?SnV1KzVKS1BwbGoyNUNRcUxlbHpzdDBJUWhuUllxcjNwcW02cTI0d09WejJk?=
 =?utf-8?B?RXU1VDJ1WXhuL2RXNDZtamkxQXVBRENIWWp1RlAyN0dmdlNhUWFGK3k4WFl4?=
 =?utf-8?B?d1JBdVVyZjdROUgrcC9mMzBDNi9HNlJJM3drUmlieUZwTFU4OUFqbFl4ZThq?=
 =?utf-8?B?azVzRDZTY254L0ZMMFRWK28wNVRBWmQxRlI5Yld2K3ZLWXRSQ256T0N6QXBV?=
 =?utf-8?B?MjBCM21zOHhpckNJcHh0ZnFmRVhrT3ZmWXY1VjdPeTUydlBzdG8vcTdoeUx2?=
 =?utf-8?B?WUpCOS84dUd5TFBFT1Q0ZHEwUXY5ZW81UlBJMEgvUnlUY2E1QTZBQlhmVVZ5?=
 =?utf-8?B?djVEQkNJb1JKeGwydUI4K243YWVIdFRDdW5iNVdQblZ0T3BjWFZJZzN3UXN4?=
 =?utf-8?B?TlFEOEVaN2R1NlMwZ1JJeHpCNU9qRlI2QnJWUVJmOFRRaGYybEdYUVBQVGc2?=
 =?utf-8?B?VEM3TnhrVW5VTElydHhNK1BVcUE5ejlZNEQ3WFRWYllUUVQxdEtaWGdhNTZk?=
 =?utf-8?B?bG9PWlJ1dm9KNGYydUlWVDRWeGJzT0J0dHhBaFRYdWZVc29oOENLbENuelJq?=
 =?utf-8?B?T2t4Y080YWtJWDA2Zzl2SWwyZ0szNHUrYzdBTFNod0IzeGNIRlNOb1FLWTF2?=
 =?utf-8?B?OEdkQVdyKzBLdnNFejN5dGh5STVBK1ViOVlXUXVVc05OVjRST3JTQlRkZUdp?=
 =?utf-8?B?WmJQV1NrK3podldpc0VPQnJza3ZHejVCWVBiNnR6ZjVGRkJOMU1jSjVXaDhS?=
 =?utf-8?B?T09wQ1F1RUp2MTFBVXhzSzd4cDQvY0xHS2xXUzJ6TnRKem0zTGNuaWdheWtp?=
 =?utf-8?B?eWl6d2FUWDlLZk5wQ3hsV0tDbWJFa2d2bHNmc3k1ZHlLd01xZFpVbGRtcFRT?=
 =?utf-8?B?OGw2cmZEZ2d2U3ZhM3E2TFZ2UjNZc3BWQ0xzMFF4bVlad0hWY2x4UVlFYzRr?=
 =?utf-8?B?ZWI0ZERiOVBSSnIrMFQ2WlVEWnkrV29nMFozSjh3Q1p5OVQvRHpqd216MlRR?=
 =?utf-8?B?aFJ1aERmcU1qelhqN3REaVpSUzlnVUh5WGtsUW1oeGF3U2NaVDFKTFZCKzFq?=
 =?utf-8?B?MFBTc3FlYUJ6NlFIQkpDRDVVRkQzTGVsY0JaVDQ2LzVGalhETjhicWxuUmdC?=
 =?utf-8?Q?FAWLr+csj+C3r+vYi0BtfMO318fefHYt6flhSxY?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 577ad51e-e8ed-4b5e-3ff1-08d971c06163
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 05:28:53.6056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RLShYQgG3Zf1l1IDcOU2yRP5PgMVAoXtZWiLZFkFxUH+IXhn+YoAo0HPrYnkGY5rI68tGC6uIHyT1Ly65s0Qv7mt3mFNWnY8+hK1FpsgCv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2815
X-Proofpoint-GUID: HzuM6i_npF0PhlS7YNi67enJqM09T8zm
X-Proofpoint-ORIG-GUID: HzuM6i_npF0PhlS7YNi67enJqM09T8zm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-07_02,2021-09-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 mlxlogscore=924 adultscore=0 bulkscore=0 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109070037
Content-Type: multipart/alternative;
 boundary="------------B9C098570E1D1ECFD3D62AA0"
Content-Language: en-US

--------------B9C098570E1D1ECFD3D62AA0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 1875Klo4020748


On 8/2/21 11:45 AM, Bruce Ashfield wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> In message: RE: [meta-virtualization][PATCH v3] python3: remove the no-lo=
nger required bbappend
> on 31/07/2021 Ruslan Babayev (fib) wrote:
>
>> Can this be cherry-picked into dunfell please?
> No problem.
>
> It is now on dunfell as well.
>
> Bruce

Hi,=C2=A0 Bruce

Can this be cherry-picked into hardnott please?=C2=A0 python3-native build=
=20
also failed on hardnott.

Thanks

//Changqing

>> -----Original Message-----
>> From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@li=
sts.yoctoproject.org> On Behalf Of Bruce Ashfield
>> Sent: Thursday, July 29, 2021 7:57 AM
>> To: Ruslan Babayev (fib) <fib@cisco.com>
>> Cc: meta-virtualization@lists.yoctoproject.org
>> Subject: Re: [meta-virtualization][PATCH v3] python3: remove the no-long=
er required bbappend
>>
>> merged.
>>
>> Bruce
>>
>> In message: [meta-virtualization][PATCH v3] python3: remove the no-longe=
r required bbappend on 26/07/2021 Ruslan Babayev wrote:
>>
>>> It has been carried over from python2 and is no longer required.  More
>>> importantly it breaks the python3-native build due to
>>> ${STAGING_DIR_TARGET} being "" for native recipes.
>>>
>>> Signed-off-by: Ruslan Babayev <fib@cisco.com>
>>> ---
>>>   recipes-devtools/python/python3_3.%.bbappend       | 1 -
>>>   recipes-devtools/python/python3_virtualization.inc | 8 --------
>>>   2 files changed, 9 deletions(-)
>>>   delete mode 100644 recipes-devtools/python/python3_3.%.bbappend
>>>   delete mode 100644 recipes-devtools/python/python3_virtualization.inc
>>>
>>> diff --git a/recipes-devtools/python/python3_3.%.bbappend
>>> b/recipes-devtools/python/python3_3.%.bbappend
>>> deleted file mode 100644
>>> index 617cacc..0000000
>>> --- a/recipes-devtools/python/python3_3.%.bbappend
>>> +++ /dev/null
>>> @@ -1 +0,0 @@
>>> -require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization',
>>> '${BPN}_virtualization.inc', '', d)} diff --git
>>> a/recipes-devtools/python/python3_virtualization.inc
>>> b/recipes-devtools/python/python3_virtualization.inc
>>> deleted file mode 100644
>>> index 55301c7..0000000
>>> --- a/recipes-devtools/python/python3_virtualization.inc
>>> +++ /dev/null
>>> @@ -1,8 +0,0 @@
>>> -FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>>> -
>>> -DEPENDS +=3D " ncurses"
>>> -
>>> -do_compile_prepend() {
>>> -   export LIBRARY_PATH=3D${STAGING_DIR_TARGET}/lib
>>> -}
>>> -
>>> --
>>> 2.26.2.Cisco
>>>
>>>
>>>=20
>>>

--------------B9C098570E1D1ECFD3D62AA0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/2/21 11:45 AM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210802034542.GA16820@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

In message: RE: [meta-virtualization][PATCH v3] python3: remove the no-longer required bbappend
on 31/07/2021 Ruslan Babayev (fib) wrote:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Can this be cherry-picked into dunfell please?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
No problem.

It is now on dunfell as well.

Bruce
</pre>
    </blockquote>
    <p>Hi,&nbsp; Bruce</p>
    <p>Can this be cherry-picked into hardnott please?&nbsp; python3-native
      build also failed on hardnott.&nbsp; <br>
    </p>
    <p>Thanks<br>
    </p>
    <p>//Changqing<br>
    </p>
    <blockquote type="cite" cite="mid:20210802034542.GA16820@gmail.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
-----Original Message-----
From: <a class="moz-txt-link-abbreviated" href="mailto:meta-virtualization@lists.yoctoproject.org">meta-virtualization@lists.yoctoproject.org</a> <a class="moz-txt-link-rfc2396E" href="mailto:meta-virtualization@lists.yoctoproject.org">&lt;meta-virtualization@lists.yoctoproject.org&gt;</a> On Behalf Of Bruce Ashfield
Sent: Thursday, July 29, 2021 7:57 AM
To: Ruslan Babayev (fib) <a class="moz-txt-link-rfc2396E" href="mailto:fib@cisco.com">&lt;fib@cisco.com&gt;</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:meta-virtualization@lists.yoctoproject.org">meta-virtualization@lists.yoctoproject.org</a>
Subject: Re: [meta-virtualization][PATCH v3] python3: remove the no-longer required bbappend

merged.

Bruce

In message: [meta-virtualization][PATCH v3] python3: remove the no-longer required bbappend on 26/07/2021 Ruslan Babayev wrote:

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">It has been carried over from python2 and is no longer required.  More
importantly it breaks the python3-native build due to
${STAGING_DIR_TARGET} being &quot;&quot; for native recipes.

Signed-off-by: Ruslan Babayev <a class="moz-txt-link-rfc2396E" href="mailto:fib@cisco.com">&lt;fib@cisco.com&gt;</a>
---
 recipes-devtools/python/python3_3.%.bbappend       | 1 -
 recipes-devtools/python/python3_virtualization.inc | 8 --------
 2 files changed, 9 deletions(-)
 delete mode 100644 recipes-devtools/python/python3_3.%.bbappend
 delete mode 100644 recipes-devtools/python/python3_virtualization.inc

diff --git a/recipes-devtools/python/python3_3.%.bbappend
b/recipes-devtools/python/python3_3.%.bbappend
deleted file mode 100644
index 617cacc..0000000
--- a/recipes-devtools/python/python3_3.%.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization',
'${BPN}_virtualization.inc', '', d)} diff --git
a/recipes-devtools/python/python3_virtualization.inc
b/recipes-devtools/python/python3_virtualization.inc
deleted file mode 100644
index 55301c7..0000000
--- a/recipes-devtools/python/python3_virtualization.inc
+++ /dev/null
@@ -1,8 +0,0 @@
-FILESEXTRAPATHS_prepend := &quot;${THISDIR}/${PN}:&quot;
-
-DEPENDS += &quot; ncurses&quot;
-
-do_compile_prepend() {
-   export LIBRARY_PATH=${STAGING_DIR_TARGET}/lib
-}
-
--
2.26.2.Cisco

</pre>
          <br>
          <fieldset class="mimeAttachmentHeader"></fieldset>
          <pre class="moz-quote-pre" wrap="">


</pre>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------B9C098570E1D1ECFD3D62AA0--
