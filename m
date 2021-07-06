Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.710.1625536464672333495
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 05 Jul 2021 18:54:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OdC7Rtyk;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2821a52d36=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1661sMk0007365;
	Tue, 6 Jul 2021 01:54:22 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
	by mx0a-0064b401.pphosted.com with ESMTP id 39keq6gwdd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jul 2021 01:54:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dl3PbjsKgqTqb4o74SWFb1EeDo51vvVrA7sNoUXnzYwisRlDAR/Wq1X0mwD3EZ6PUSkImT8WFBYsGtHT8RIHBd5iAWaaf/DBi+MYZ69+WRhe7WRq0MBesFfN1G6qaw2xcs1gISbkw3BzEHAJZh8SSnHCB8S4F2R/apJ+kiuiWkpLQRidTDKV7gchodSrx9i5XXuUrhLutqkA6cUaXiCh162mcG8MwDwjLpS0dW+X2fRMZHZ5eVpuX0lLOOHSLnYJQZcWN6oKwrNFV5eLiP1yYZVSH7jcEwo6khtFJrX2s2u0BBTSVtC9bF1SZqqf6IcODpK5tmubJxF1NoeN6vkuaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=688CZx0QSUpL9iXUdrel64n7uOamLAY/suCdeTafFS4=;
 b=V5211Sbws1UefBPEqghKqzpL5c2Reiu8YcsCyf8dNQgb4cqRlrd4WrIaqB6NFzLYPuCRN9jpFo4+AY/kO2SwtdcFfxpnQCgVakmAUzcYqmk82KPOHJJlww0AnW8CtyA3DUFFDNPxZhQ9Cc+bswFKyyjdHW3kB2fOvIwb7kKr7ydG3ILuZz6oasDQHXbfEm5kQ2UgUlYyBCjq58M5I9PdaMqgwBnpGRq7sX3HK5dei8DEX9WmLNy0Mvi30JY1XXtsTBE7lednfsCnfl/Z5n+TKC5nirbp27Q9obhSEIgZNswvEqJY5Rr1Ld4fPK0fB4Sxt9noMkXJ2y/6fL4yWcZ33g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=688CZx0QSUpL9iXUdrel64n7uOamLAY/suCdeTafFS4=;
 b=OdC7RtykGj45PaM2qhNzWiDx7tINRn7Df6+incDwf/Pb9R0kM8RCy+sclhQNSBrPA7F93NXVamZRK/02/UXUOOcdX3uew4Ns/m1WylvrljS+DYHoTWaV4hOnSJXxBdN4ULjVANAH5UGovMN6036kGxXSRzotWq8WEd0g3G+ArVY=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MW3PR11MB4556.namprd11.prod.outlook.com (2603:10b6:303:5b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.24; Tue, 6 Jul
 2021 01:54:19 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b9f0:8cd5:8e02:ec8e]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b9f0:8cd5:8e02:ec8e%4]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 01:54:19 +0000
Subject: Re: [meta-virtualization] [PATCH] conmon: switch to main branch
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
        meta-virtualization@lists.yoctoproject.org
References: <20210621054046.15518-1-mingli.yu@windriver.com>
 <CADkTA4ONqYOzDL2qJZDR0Wt3o6U+VZAzPEUew9sVX9wz+XtXWg@mail.gmail.com>
 <71ba6591-ee91-45e7-e145-8567204bcdc5@windriver.com>
 <CA+chaQc3jrrYerGhv8fEe7QjjqXbtVs02pDwanpWHTAxZWdEnA@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <07e0e996-a1b4-37d0-d703-4d4d0eb07deb@windriver.com>
Date: Tue, 6 Jul 2021 10:01:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CA+chaQc3jrrYerGhv8fEe7QjjqXbtVs02pDwanpWHTAxZWdEnA@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0189.apcprd02.prod.outlook.com
 (2603:1096:201:21::25) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.140] (60.247.85.82) by HK2PR02CA0189.apcprd02.prod.outlook.com (2603:1096:201:21::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23 via Frontend Transport; Tue, 6 Jul 2021 01:54:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83a34547-cde7-4291-9f23-08d94020f80f
X-MS-TrafficTypeDiagnostic: MW3PR11MB4556:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4556DE68B5A30527083825E6F11B9@MW3PR11MB4556.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MG+rtL8DGABh1XUTBgoBT0Fe1yGH62Q3hw+ehnYOWd7j7uQETypIMwzbyvYNuOFdIT1CN+aD8Vt1y6bcpQRGBmnmUlpqz5qHRnFpYYIYpTSJv+wD78W1wfbgWgWuh6M0FQaigGaL/1xDuF3XdCuKWbwAR4mEqqKre0U5Z8/GlCB7cTVgHtkqX6xo9Fwm8p4x9E/pcv6dvPnkYF4XHlXseYpKmlicN5fgzGw7vy87RnLJT9+Wu2dcATH5w+mV4h5op3crAaFv9+k76eSykfhyTaaughDR6k/11jNulsDHeOwcJvMt2tgTml2Alvy349L0kYlc5Ad7ungok415+aA11VKsu7u1CBvdGro+gnWDVInyu12VMwNYjdNXKMZm8laPCh/LfcJ8BZRsRRbOXsbaW2f3xUFm3tkqChL5g6vawDLmAYM8PVyfWz9w0/fCU0L31ozLx0zITLI1WDUfYjHzyNKGArHSb5GKjajrNd1QjXJ3Xyy9AUXGEo7qc6/nwldve9jw6Em9x99CKtaxa6ys5rRN8P5SuI9FQHwXzfRJTDYuPafzi4mbPGaFlgxhOhw41fa17JPl1MGrM2sY/kYGxNEUh95SzdDwuKwibGcw7qA+HbTRqQuIm1jxl8q5vyut51QfuP5E8aee9idDcu9QTBnrYjjq10kNZldV7ORG4CIMbQnkfWeRffx8pFe2A3aL2QZZTnWRLoyJCPGYIiSSz5QyfIzqc/o6zK8/Ghvqo9qJvjyx7Wko/HYXfFVpXUOfBk25A0r679junf1iGKfYH09xpUczC36HD51U/MXOz4I47RJqozYEjbtmI9zFj8ic8RDWCv1zJX2gbjwbNOiTSHzpHWccHnMKhcCMmqpUONjeDirAR1Ij5B7t+diAuk/AdBJ80920Ga9FT89a5RYyww==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(376002)(136003)(39850400004)(6486002)(6666004)(4326008)(52116002)(8936002)(316002)(16576012)(2616005)(66946007)(66556008)(956004)(966005)(31686004)(66476007)(53546011)(31696002)(36756003)(6706004)(2906002)(478600001)(26005)(86362001)(16526019)(6916009)(186003)(8676002)(38350700002)(38100700002)(83380400001)(5660300002)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZzZld2NtTm5SMGtkUU05eUtJK2FjTm51SEo5eFdjSktqK0V6WFQ1WndwWE5u?=
 =?utf-8?B?Wko1dTV4c1JRZkZTRTYyQ0lYcng5VnArZTNNQlduR2hySHRvTGtjNGN3dUNL?=
 =?utf-8?B?U3krcEd0NEY5V3dqbEhJaVVGSUxoL1E3VDlzQmVwRWtleTI4ZEJ4L1MvMGJk?=
 =?utf-8?B?cVNhS29URXEwa0FZWEczWDdTWXQrWVkwTy9uU1k3QzhseWZRZUhCbUQzQnFZ?=
 =?utf-8?B?ek1KRllWSnJLV1pHWUVwNThRVXhxTUtjV3FsSW1Gb2RYRmJicFdPN1NLbGNp?=
 =?utf-8?B?NVp5ZHViZzhIZ1UxK1FWUitVbEI0ZWhKQy9FQUJrczlZTHJBQmlISDRiZFAx?=
 =?utf-8?B?NFIyRzlzZE9SUEs5eVlFTDlFWHUzdG9IU2JjUGRHSkJiaVlsRCswck1vRU13?=
 =?utf-8?B?OGU5Uk5kZGlVd0hBcU95RlRaT1AzWVFnQ1hhYmVzeHFqS1hYeTNvNGp4MFJk?=
 =?utf-8?B?MXlEb3VGUFRSY2xGS2taVllsbDh0cmVOaW1DeGpDd3NZQ2N0ZEVXcXF4VnNB?=
 =?utf-8?B?STNkVElydUYzQ1VxOFZQQkd4MEUxRFZsN1lCRzZHYXhCQVM5WVJZOWFYblRT?=
 =?utf-8?B?WFprS01pelpsMnNEOEduWGRFSmR6NDB5Nkhwd0hML1hNRkdUa2MyWE41MlNQ?=
 =?utf-8?B?dGpsUklTSnZ6S1ErNmhjWDJ5cW8rdnMyL2ZPaGdrSENJeEZXb3dUMXRSQjFi?=
 =?utf-8?B?YVpFSEdqUGR6Vkp5QjZkVVlnM1NKa0JGUWNlTnQvWXlaR1ZucVIvMmNsYVFT?=
 =?utf-8?B?dTVkQXZUMkEwd08zcmMxbXZzVS9iejNPc3pnS1V0WkZWaGxwWjZIOWkwOW5o?=
 =?utf-8?B?MHBvUkovUGdEZExpTDRHcTNyV3NwSE9OcEZaWEM0MURBdEJ3emJpa1luNDVw?=
 =?utf-8?B?bVl2K1ppNFBOSWsvcEtwZi9ZMW0zRGZPdGhFS1Fjb0QzMDkzVDJOano4WG5J?=
 =?utf-8?B?NTJvVGovKzgvRzhVM2hFSngxSWtlMVpIeGZsbnlUZzR4b2EwTDRFTy9uSTFJ?=
 =?utf-8?B?WnU4VVhsMnJIcWFoWDJmK1Jna0p6bk0xcytpNW5EWmdOUEtnTk54YW04ZlRQ?=
 =?utf-8?B?LzYrOGRaTGIrR2FpZ0xDVGsrL3dOQ3dRVnJCSG5Ic0RPYlNnZE5vSmRTc1Bs?=
 =?utf-8?B?bFhWN3h3YnlOUXJSQU9xdnVqSCsvMkJLMkFLM1huQ0hISk42TVk1ZmdaQnho?=
 =?utf-8?B?amtkTGRhYXZDRkNBdXJCeUlYN2FzdVZVS1h4eFhRMVRVb3ZpZUp5TGpxTVJ3?=
 =?utf-8?B?N2pLeGo5YXRRZlcwM2x1L0ZmcWtucG9MaWRoYlRvNVdIR3RyZzZoV1QwR2t3?=
 =?utf-8?B?eXU1RUg5WGlhWjFReGVBbGdHbkFFZXY1OWk5a3Y0d084T2JRcU5UT0doSzRZ?=
 =?utf-8?B?QnQreldVaGVKbzVCMHQxVjZNT3JsWEh0M3J4dTJpWUZVblN6SGE5OEY4SGlk?=
 =?utf-8?B?TlZsK3VrR2dxRFRnMSs0SW9ySk5rcGQ0SnFWWVY3NkU1RHEzaTRJMGpVaFdV?=
 =?utf-8?B?Ny9WcjhWNUgwREdJZzFWVzkxS3Q5TnRhbVcrT3VrL08zMHlDZkg5N3cwQytX?=
 =?utf-8?B?OFhHZEcwQnlmdjd1ZmhwLzFsOHpneElHRWQ5YXpKbm5yK3o0QVJVMndKRnRq?=
 =?utf-8?B?bXlpMlNtV1dJQkZTN05nTXQ4S0VBVzVQRzNQWVF6QzRFa3BTa05Ia2hkMVo0?=
 =?utf-8?B?b0thaGk5ZE42V3NvS2wyMVdmdlZQZm8veEpyYXlCUHBDSWlTZnEvWnpQR3RX?=
 =?utf-8?Q?ydLOu45SGWlPOjF1lBrIC2UkaHiz6HC4SX8Gpps?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83a34547-cde7-4291-9f23-08d94020f80f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 01:54:19.6193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 384sR+mK4r0PUM+n/kwW9pFCGC9I4mtGlt/9SdV9c/DpDK3i/t2R75pBQyJWSFXEG7BKa+EdOX1bimpBwxlDmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4556
X-Proofpoint-GUID: IOBCa0hoIp4RLS3z-iEA9woGEahl42kG
X-Proofpoint-ORIG-GUID: IOBCa0hoIp4RLS3z-iEA9woGEahl42kG
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-05_12:2021-07-02,2021-07-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1011 bulkscore=0 mlxscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2107060008
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 1661sMk0007365
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 7/5/21 4:27 PM, Martin Jansa wrote:
> **[Please note: This e-mail is from an EXTERNAL e-mail address]
>=20
> Yes, I see it in:
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?i=
d=3D950b24b2d5fe454c9d3a9eab5691753067e4b7d0=20
> <https://urldefense.com/v3/__https://git.yoctoproject.org/cgit/cgit.cgi/=
meta-virtualization/commit/?id=3D950b24b2d5fe454c9d3a9eab5691753067e4b7d0__=
;!!AjveYdw8EvQ!LOd1jhUL1lTDqPYpPtkx3VUegEfozaL2ilIAtjJX06CKSGmSryem3XvN3YXP=
rKZ4Yjs$>

Oh, yes, I see, thanks Martin very much for your pointing out!

Thanks,

>=20
> On Mon, Jul 5, 2021 at 1:25 AM Yu, Mingli <mingli.yu@windriver.com=20
> <mailto:mingli.yu@windriver.com>> wrote:
>=20
>=20
>=20
>     On 6/21/21 8:58 PM, Bruce Ashfield wrote:
>      > [Please note: This e-mail is from an EXTERNAL e-mail address]
>      >
>      > Thanks for the change.
>      >
>      > I had done the same myself over the weekend, but was still doing
>     a few tests.
>      >
>      > I pushed the change this morning, and have also cherry picked it =
to
>      > older releases.
>=20
>     Thanks Bruce!
>     BTW is this change merged?
>=20
>     Thanks,
>=20
>      >
>      > Bruce
>      >
>      > On Mon, Jun 21, 2021 at 1:41 AM Yu, Mingli
>     <mingli.yu@windriver.com <mailto:mingli.yu@windriver.com>> wrote:
>      >>
>      >> From: Mingli Yu <mingli.yu@windriver.com
>     <mailto:mingli.yu@windriver.com>>
>      >>
>      >> Switch to main branch to fix do_fetch error.
>      >>
>      >> Signed-off-by: Mingli Yu <mingli.yu@windriver.com
>     <mailto:mingli.yu@windriver.com>>
>      >> ---
>      >>=C2=A0 =C2=A0recipes-containers/conmon/conmon_git.bb
>     <https://urldefense.com/v3/__http://conmon_git.bb__;!!AjveYdw8EvQ!LO=
d1jhUL1lTDqPYpPtkx3VUegEfozaL2ilIAtjJX06CKSGmSryem3XvN3YXP1SFgxcA$>
>     | 2 +-
>      >>=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>      >>
>      >> diff --git a/recipes-containers/conmon/conmon_git.bb
>     <https://urldefense.com/v3/__http://conmon_git.bb__;!!AjveYdw8EvQ!LO=
d1jhUL1lTDqPYpPtkx3VUegEfozaL2ilIAtjJX06CKSGmSryem3XvN3YXP1SFgxcA$>
>     b/recipes-containers/conmon/conmon_git.bb
>     <https://urldefense.com/v3/__http://conmon_git.bb__;!!AjveYdw8EvQ!LO=
d1jhUL1lTDqPYpPtkx3VUegEfozaL2ilIAtjJX06CKSGmSryem3XvN3YXP1SFgxcA$>
>      >> index 74f5bfa..974eb07 100644
>      >> --- a/recipes-containers/conmon/conmon_git.bb
>     <https://urldefense.com/v3/__http://conmon_git.bb__;!!AjveYdw8EvQ!LO=
d1jhUL1lTDqPYpPtkx3VUegEfozaL2ilIAtjJX06CKSGmSryem3XvN3YXP1SFgxcA$>
>      >> +++ b/recipes-containers/conmon/conmon_git.bb
>     <https://urldefense.com/v3/__http://conmon_git.bb__;!!AjveYdw8EvQ!LO=
d1jhUL1lTDqPYpPtkx3VUegEfozaL2ilIAtjJX06CKSGmSryem3XvN3YXP1SFgxcA$>
>      >> @@ -8,7 +8,7 @@ DEPENDS =3D "glib-2.0 go-md2man-native"
>      >>
>      >>=C2=A0 =C2=A0SRCREV =3D "31614525ebc5fd9668a6e084b5638d71b903bf6d=
"
>      >>=C2=A0 =C2=A0SRC_URI =3D "\
>      >> -=C2=A0 =C2=A0 git://github.com/containers/conmon.git
>     <https://urldefense.com/v3/__http://github.com/containers/conmon.git=
__;!!AjveYdw8EvQ!LOd1jhUL1lTDqPYpPtkx3VUegEfozaL2ilIAtjJX06CKSGmSryem3XvN3Y=
XPT69BMFQ$>
>     \
>      >> +=C2=A0 =C2=A0 git://github.com/containers/conmon.git;branch=3Dm=
ain
>     <https://urldefense.com/v3/__http://github.com/containers/conmon.git=
;branch=3Dmain__;!!AjveYdw8EvQ!LOd1jhUL1lTDqPYpPtkx3VUegEfozaL2ilIAtjJX06CK=
SGmSryem3XvN3YXPi8yxuZI$>
>     \
>      >>=C2=A0 =C2=A0"
>      >>
>      >>=C2=A0 =C2=A0PV =3D "2.0.28+git${SRCPV}"
>      >> --
>      >> 2.29.2
>      >>
>      >>
>      >>
>      >>
>      >
>      >
>      > --
>      > - Thou shalt not follow the NULL pointer, for chaos and madness a=
wait
>      > thee at its end
>      > - "Use the force Harry" - Gandalf, Star Trek II
>      >
>=20
>    =20
>=20
