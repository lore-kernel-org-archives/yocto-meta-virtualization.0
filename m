Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.4221.1634609065177742343
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Oct 2021 19:04:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=QgmTjivv;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=592617ddc3=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19J204F8028880;
	Tue, 19 Oct 2021 02:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=cw9H+6Y9fn1ra+fZnP9fDutrRwQQv+8fCRpO+7k/M0Y=;
 b=QgmTjivv/z0FAv1Irao2u2I2chvWG8X3VaUdTnKnUA8kAnQtK2Ou2S87U177YNRNgdWA
 RxyPKPIKH2Mknnzbq462COKMYUimr6t++8lJXO8PuVXj3tlcralOXS9yeO8wuGN8yBKu
 6hlbhfb4NgPNp6Iom2gms5piANZn6LaTufwZmB7f4LrzSnBfMdgoue+lsZp3Y4+0f+fz
 jWphYZpwH6R3pK+f/ik9x0u9p/k6pOeduO/aTXbAqu57RxELFCBgND3+8p2Vi0B29wun
 yepnrHKMr/tIEOd3v+sIwbU0AmCl8UktXNyEmbzDVysk5MyjfkWtqqRgx+kTTOoYOUuO Aw== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bs9apgj4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Oct 2021 02:04:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJnZM3uz2eAssb97fRkzhhqJ8NnnZoS4bUPrsKdWFNC8zV/CiaOp1trF8c6RMxB9W8IgLQt+Wtw1l64eFsUA5WjWYL+JH3MxvCdzbjRM8ZVyNWrRAjh2f/iDLvGR0uxoP5/B4uZXs05CI3e3H6s8M4lyBlccYY0BjUdLluFG+90iyOI+dLKV+ELEIsoTYVzePxePiwVXTzu17gMd+CiPmjZstJpclmbuG2kS1R5eQG+28tyvms5/ualYhuAi3UHHaKJbEgpc6KXen1Sdf9tvniGOKRLCgBMoi42qmgmJrx5Xx7UEHrknJS+QWdnsrVyRJGmOAt/YDYmbEo5fA6AFIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cw9H+6Y9fn1ra+fZnP9fDutrRwQQv+8fCRpO+7k/M0Y=;
 b=RJszVH7XnlVK7C5zedtYvn9vnEiXEr3T8s/YNlSnRrXgOCQxe0S0+L0ODviDYyynMuCY+nLGWzL9r9Yf/Z/9VKLEi+BGnTfmRTf7qSBqcfayqjY5mv3bYRZSE5F8wsTtH9Jma1gmW9IOPPLqAN1CJw43j0CPR3iE1t7Q3f8fbG+oytNXquvzsjOfOcm8uqrh4wlNuVSE8J39e72ymftGHpg3Xjtw+79lXMSRdt4Evk+hn0X5EAg5hf4tudvtzPD+1OsCgzkmwQetFN/eKzIGu+On4YJ1mrG0KnIUQ7UnLFnGFyF4nBSV2zvXzYcpGaqsmgMMn+DXKc47C2oARyRnrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by CO6PR11MB5650.namprd11.prod.outlook.com (2603:10b6:5:35a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 02:04:20 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::4c98:111b:1f1e:898f]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::4c98:111b:1f1e:898f%5]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 02:04:20 +0000
Subject: Re: [meta-virtualization] [PATCH] ceph: inherit pkgconfig.bbclass
To: Martin Jansa <martin.jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20211015093705.39812-1-kai.kang@windriver.com>
 <CA+chaQcDzC0r2HPeLSDO5WfXMHidaRXw1G1fd2-H4dDwp0soWQ@mail.gmail.com>
From: "kai" <kai.kang@windriver.com>
Message-ID: <6f755656-54b8-9db5-7141-7a7a1de18b80@windriver.com>
Date: Tue, 19 Oct 2021 10:04:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CA+chaQcDzC0r2HPeLSDO5WfXMHidaRXw1G1fd2-H4dDwp0soWQ@mail.gmail.com>
X-ClientProxiedBy: SL2PR01CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:100:41::29) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
Received: from [128.224.162.156] (60.247.85.82) by SL2PR01CA0017.apcprd01.prod.exchangelabs.com (2603:1096:100:41::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18 via Frontend Transport; Tue, 19 Oct 2021 02:04:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a47fd91-85ab-4f3d-2f5d-08d992a4c361
X-MS-TrafficTypeDiagnostic: CO6PR11MB5650:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB56504FA82EE9C86B5273FAC595BD9@CO6PR11MB5650.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Tv0Nr1dL4sfbABcITS30TAONRF/pHbc+S0/yb2Mks7hSlqxg/8g8TNzgfmB/dYRladJZZMJIl22/ieutBBZMeG+G3qTXCWWTed/J1BTrrBt0JPAZLQZ/w4WJwM+5eOkuHP98vOtiZLUp2I0Ijyp+CDA6TtHS4BReKTe6NVOCVUcvTvbg0iGyCp5rCCctQ9K03kyLzcK1L5V1JyEc0jXKKkyPVcErpgrNCdLrckKOijKLTjrN2RaDdpzoWTkPopIabaEyVzc1DDAaIIQI7Zy963S6jxfJDw/Sw7OGTCj68T8k4buBBQu40zRrR+XR/FQoJQQg50M88XLW8umLBEG1Epun+2QZPvdPOcR9w+APR7HxZyFhXX4/cB3u2HoDiKJnEiGY192fo1MUPJ08R0zd6afYMq+2EBOpg6FqgilGcA3ZagqxuUEZx/je0XOwfbTDHlIzivgpEL9Zux2PHQ/ryKRg2g776LQPvXRh3PNlN9OPGPOtud/r9m/XZgWGxlbbHUnOt9Z2GyC4ULGicrYpRMFY+go8fAm9DKjaDyPNNSnF3igL4FQoXlcpGNUp9tovNM4aOn3C9pIPPhyxY0t96U42hlmn/AuCgmHsCSi6B7qr/BMQWvC6xuJWpFDxF33jHstiayzHGuFwE4PqJvIse836goqZkq3A2+a2n56iTv3QsT4cXVzqls+6uBQocyapOcLUDvxV5/lfp52mSTSynLm7OQLzF0i4I8+tCzw72T1JZi+9o9oinQovupSerJIfw0Jrk+qJuIYV7ppswskGy74CrH4ApiWvbgdqvXTyCJCK49HWJ+3PBTaM+P0iaZ5rVb2+cVFyrNpR5D52eNEnkx1RajY5Acn1W18jjJQx1Y0f0UBw4HYho038RYQ2gYiA
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(6706004)(6916009)(316002)(16576012)(83380400001)(66556008)(956004)(166002)(4326008)(508600001)(6486002)(31686004)(2906002)(36756003)(66476007)(31696002)(66946007)(8936002)(8676002)(38100700002)(52116002)(38350700002)(26005)(5660300002)(6666004)(966005)(2616005)(33964004)(186003)(53546011)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QXVkbG9kZXVRRE93OE9VTExXdjM3M0U0UzdweDhtV2VEL0Mya2R2MWxVczhE?=
 =?utf-8?B?T1VwUVV2eFhwNWhkKzhheFc3TW50aUk5OU1mWU9ZOXI3S25MSEIremU1Y3M2?=
 =?utf-8?B?THRvMjFIamdLZmx6MjEwZzJvTkVLVXVadUlRNG1yVE15SmlwczNoVGZ3Z1hy?=
 =?utf-8?B?TXJ2NHk0dEZTL2VyT3laZCtXbG5KdWRMWHMyelBmdStybm9aYUZxZHNPdmhq?=
 =?utf-8?B?MjIxVHlOeFFjRnVQa3I1akRaeHRPMHVWUWVnczVueVZpTUplN01kZW5FTDZ1?=
 =?utf-8?B?aFlRcFRpZHlaQU9tek5OWndiUU9od1plUU5mb2luUldTaFJiWTNhQjBScTRh?=
 =?utf-8?B?VllFbUcwWHMvcis0dWpSVzVMMy9Pek1adzFMZGlpeHA0dmlrMXJYYmgzSHl6?=
 =?utf-8?B?ZVlNcGFQUUpXZ0dtNng1aS84cnptWlF5Mnp0ZURGZy8yWU9pdC96Q3dnME0z?=
 =?utf-8?B?ck4wRUQzdUtRZ3hteXg4UEdkNEUyRGxEVWhhNDJQNlVZcy9UalJQaFdZWHlk?=
 =?utf-8?B?ZlNQc3VzL2RuQm9oMkplQWEyNDRFNUVxeHhaWG5uaUNhU1NpU01QTmt6ZTRI?=
 =?utf-8?B?aW9TSDZXc3JqbFhIZXdydGp5c2ZNY2thSzFRcjYrY1BWYmZFUXdhRGVmTE1j?=
 =?utf-8?B?UGdzR1o4bWtzcURkSytmVEtDYW1sMjIwV1g0L0VNVWpzbXFBdUZDcXB5ZmZP?=
 =?utf-8?B?Y0M1dU5YTUFibExFeFUvTDhKZkpIbE5hbjBOMXF0dTFpdU5XRUQ5aU9qcmo2?=
 =?utf-8?B?SzAyLzZtOFRWSXVRVXZETDk3anZzZ1liYU1Ma2xMRTdIM1dhUU1wNVoyMVhq?=
 =?utf-8?B?ZW84ZmVpQXUwU3F2c0o3ZTZUZjJkMlYzSkFLRXd3VkwvMVQrenk4OW94dThU?=
 =?utf-8?B?eHMxbmFyRHVqbnVnZEx0Wmx5NXFnTHRwd0VoQ25zZDRuNWgyKzZabmJDOXJD?=
 =?utf-8?B?bzIrdUJjbkRZb1M3bE4wRklBVWhHT3RTN0IxeUxXUTBFcTF2OUxra05YbDVp?=
 =?utf-8?B?eTVFdjdGeVdSbG45WmZ4d0taYjFUUDF0MmdoVWdzMlVMTDljcTFJWllZbDM3?=
 =?utf-8?B?Ui85R0tEbkpyN0JuWWFSN3BrT3o1NThCVlcyNkM5V3lMeUdtTnQvTlp4M1No?=
 =?utf-8?B?ZjNGcEpTRmNMeDdWSVpoZDVRV3plNm1iTmltdzBpL1lWMlFTOWdzTHNvRlhk?=
 =?utf-8?B?SzgwZzlNenRaOWFQNTRMNVlkSzhIVFVKNWhxUmlaUHprcEd0Ny9hUG43cjQx?=
 =?utf-8?B?Z3dyQ3lpV0tUN0N2SC8rQmNpK21wbkxsL3JTRjBLMEdNZG9yRW4rUXNVSjJV?=
 =?utf-8?B?TEh6TG12eVVCc2k3VzlqK29BYVZaUkN6bGw1bFk0NmNxV1hRbkNoZzJacHNv?=
 =?utf-8?B?cVhtR3Q2Y0FscFVhc21Tem52RExwWHA5d2htMzlBakF1bHVaQU5jZXRXR0VO?=
 =?utf-8?B?M0ErRXpQaVluTStEZXhHaUxscWpGeTFDYU1GSWJCa3djaVUwVnlISEFNQ3BQ?=
 =?utf-8?B?b01NVmI3U203bmZ1Q2JuRThtcU8vTnRGWmI4V2RKVFgxbzdjb1l3eVlFT25S?=
 =?utf-8?B?VGlQSWpEUkozT2lhTjFPcmpHTTRWVGhWQlZzQllpR3VKV1ZxcXR3UzJmMVBp?=
 =?utf-8?B?ZWVQRU5XU2UrcmpBeDVmOHlHd3ZVS21xbzBrclQ5SW1hc3R1QUJGQXRNNVBp?=
 =?utf-8?B?MUQ4S3lGai9vKzF0bUN3QnB2c3RUdVB3VjBBQVJWSFd0Y1ZuL3FlUDVrdVY3?=
 =?utf-8?Q?HPJU5dWk9ddyHeToYDzvFpJqz8pxlcIM6maHels?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a47fd91-85ab-4f3d-2f5d-08d992a4c361
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 02:04:20.4782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6IeiCQqd7atXgN0FUNGTzs2SFA6pQ2UfM8vpJLOSGfO+01vu9evQjCmlwD0iotgbUQygYB44PkAhV1SWPmnexg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5650
X-Proofpoint-GUID: it6PmcVcey-68omxC34oUXEUXP03PKOq
X-Proofpoint-ORIG-GUID: it6PmcVcey-68omxC34oUXEUXP03PKOq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_07,2021-10-18_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 bulkscore=0 mlxlogscore=956 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110190011
Content-Type: multipart/alternative;
 boundary="------------9E1795A6670D580795E8C0C7"
Content-Language: en-US

--------------9E1795A6670D580795E8C0C7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 19J204F8028880

On 10/15/21 5:52 PM, Martin Jansa wrote:
>
>
> On Fri, Oct 15, 2021 at 11:37 AM kai <kai.kang@windriver.com=20
> <mailto:kai.kang@windriver.com>> wrote:
>
>     From: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>
>     According to oe-core commit
>
>     652fdf8719 sstate: Allow validation of sstate singatures against
>     list of keys
>
>
> I think you should refer to this oe-core commit instead:
> https://git.openembedded.org/openembedded-core/commit/?id=3D8e26252b45b76=
60c7c67c702411bdec187a76ffc=20
> <https://urldefense.com/v3/__https://git.openembedded.org/openembedded-co=
re/commit/?id=3D8e26252b45b7660c7c67c702411bdec187a76ffc__;!!AjveYdw8EvQ!Oq=
pKHpxJolz3bOaQE_okg1SweTyz2-VSUwISYZZHfluMUOPETvbidzkHFC8R2i6sEg$>=20
>

Sorry, just ref the commit in Yocto. Will ref to URL link next time.

Regards,
Kai

>
>     pkgconfig-native is not deployed in sysroot by default any more.
>     Inherit
>     pkgconfig.bbclass to make it work for ceph.
>
>     Signed-off-by: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>     ---
>     =C2=A0recipes-extended/ceph/ceph_15.2.12.bb
>     <https://urldefense.com/v3/__http://ceph_15.2.12.bb__;!!AjveYdw8EvQ!O=
qpKHpxJolz3bOaQE_okg1SweTyz2-VSUwISYZZHfluMUOPETvbidzkHFC__tW5c3Q$>
>     | 2 +-
>     =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git a/recipes-extended/ceph/ceph_15.2.12.bb
>     <https://urldefense.com/v3/__http://ceph_15.2.12.bb__;!!AjveYdw8EvQ!O=
qpKHpxJolz3bOaQE_okg1SweTyz2-VSUwISYZZHfluMUOPETvbidzkHFC__tW5c3Q$>
>     b/recipes-extended/ceph/ceph_15.2.12.bb
>     <https://urldefense.com/v3/__http://ceph_15.2.12.bb__;!!AjveYdw8EvQ!O=
qpKHpxJolz3bOaQE_okg1SweTyz2-VSUwISYZZHfluMUOPETvbidzkHFC__tW5c3Q$>
>     index 6636d7a..693b525 100644
>     --- a/recipes-extended/ceph/ceph_15.2.12.bb
>     <https://urldefense.com/v3/__http://ceph_15.2.12.bb__;!!AjveYdw8EvQ!O=
qpKHpxJolz3bOaQE_okg1SweTyz2-VSUwISYZZHfluMUOPETvbidzkHFC__tW5c3Q$>
>     +++ b/recipes-extended/ceph/ceph_15.2.12.bb
>     <https://urldefense.com/v3/__http://ceph_15.2.12.bb__;!!AjveYdw8EvQ!O=
qpKHpxJolz3bOaQE_okg1SweTyz2-VSUwISYZZHfluMUOPETvbidzkHFC__tW5c3Q$>
>     @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D
>     "file://COPYING-LGPL2.1;md5=3Dfbc093901857fcd118f065f900982c24
>     =C2=A0file://COPYING-GPL2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>     =C2=A0file://COPYING;md5=3D4eb012c221c5fd4b760029a2981a6754 \
>     =C2=A0"
>     -inherit cmake python3native python3-dir systemd
>     +inherit cmake pkgconfig python3native python3-dir systemd
>     =C2=A0# Disable python pybind support for ceph temporary, when corss
>     compiling pybind,
>     =C2=A0# pybind mix cmake and python setup environment, would case a l=
ot
>     of errors.
>
>     --=20
>     2.17.1
>
>
>    =20
>

--=20
Kai Kang
Wind River Linux


--------------9E1795A6670D580795E8C0C7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 10/15/21 5:52 PM, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CA+chaQcDzC0r2HPeLSDO5WfXMHidaRXw1G1fd2-H4dDwp0soWQ@mail.gmail.com">
      
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Fri, Oct 15, 2021 at
            11:37 AM kai &lt;<a href="mailto:kai.kang@windriver.com" moz-do-not-send="true">kai.kang@windriver.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">From: Kai Kang &lt;<a href="mailto:kai.kang@windriver.com" target="_blank" moz-do-not-send="true">kai.kang@windriver.com</a>&gt;<br>
            <br>
            According to oe-core commit<br>
            <br>
            652fdf8719 sstate: Allow validation of sstate singatures
            against list of keys<br>
          </blockquote>
          <div><br>
          </div>
          <div>I think you should refer to this oe-core commit instead:</div>
          <div><a href="https://urldefense.com/v3/__https://git.openembedded.org/openembedded-core/commit/?id=8e26252b45b7660c7c67c702411bdec187a76ffc__;!!AjveYdw8EvQ!OqpKHpxJolz3bOaQE_okg1SweTyz2-VSUwISYZZHfluMUOPETvbidzkHFC8R2i6sEg$" moz-do-not-send="true">https://git.openembedded.org/openembedded-core/commit/?id=8e26252b45b7660c7c67c702411bdec187a76ffc</a>
            <br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>Sorry, just ref the commit in Yocto. Will ref to URL link next
      time.</p>
    <p>Regards,<br>
      Kai<br>
    </p>
    <blockquote type="cite" cite="mid:CA+chaQcDzC0r2HPeLSDO5WfXMHidaRXw1G1fd2-H4dDwp0soWQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            pkgconfig-native is not deployed in sysroot by default any
            more. Inherit<br>
            pkgconfig.bbclass to make it work for ceph.<br>
            <br>
            Signed-off-by: Kai Kang &lt;<a href="mailto:kai.kang@windriver.com" target="_blank" moz-do-not-send="true">kai.kang@windriver.com</a>&gt;<br>
            ---<br>
            &nbsp;recipes-extended/ceph/<a href="https://urldefense.com/v3/__http://ceph_15.2.12.bb__;!!AjveYdw8EvQ!OqpKHpxJolz3bOaQE_okg1SweTyz2-VSUwISYZZHfluMUOPETvbidzkHFC__tW5c3Q$" rel="noreferrer" target="_blank" moz-do-not-send="true">ceph_15.2.12.bb</a>
            | 2 +-<br>
            &nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
            <br>
            diff --git a/recipes-extended/ceph/<a href="https://urldefense.com/v3/__http://ceph_15.2.12.bb__;!!AjveYdw8EvQ!OqpKHpxJolz3bOaQE_okg1SweTyz2-VSUwISYZZHfluMUOPETvbidzkHFC__tW5c3Q$" rel="noreferrer" target="_blank" moz-do-not-send="true">ceph_15.2.12.bb</a>
            b/recipes-extended/ceph/<a href="https://urldefense.com/v3/__http://ceph_15.2.12.bb__;!!AjveYdw8EvQ!OqpKHpxJolz3bOaQE_okg1SweTyz2-VSUwISYZZHfluMUOPETvbidzkHFC__tW5c3Q$" rel="noreferrer" target="_blank" moz-do-not-send="true">ceph_15.2.12.bb</a><br>
            index 6636d7a..693b525 100644<br>
            --- a/recipes-extended/ceph/<a href="https://urldefense.com/v3/__http://ceph_15.2.12.bb__;!!AjveYdw8EvQ!OqpKHpxJolz3bOaQE_okg1SweTyz2-VSUwISYZZHfluMUOPETvbidzkHFC__tW5c3Q$" rel="noreferrer" target="_blank" moz-do-not-send="true">ceph_15.2.12.bb</a><br>
            +++ b/recipes-extended/ceph/<a href="https://urldefense.com/v3/__http://ceph_15.2.12.bb__;!!AjveYdw8EvQ!OqpKHpxJolz3bOaQE_okg1SweTyz2-VSUwISYZZHfluMUOPETvbidzkHFC__tW5c3Q$" rel="noreferrer" target="_blank" moz-do-not-send="true">ceph_15.2.12.bb</a><br>
            @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =
            &quot;<a class="moz-txt-link-freetext" href="file://COPYING-LGPL2.1;md5=fbc093901857fcd118f065f900982c24">file://COPYING-LGPL2.1;md5=fbc093901857fcd118f065f900982c24</a><br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;<a class="moz-txt-link-freetext" href="file://COPYING-GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263">file://COPYING-GPL2;md5=b234ee4d69f5fce4486a80fdaf4a4263</a> \<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;<a class="moz-txt-link-freetext" href="file://COPYING;md5=4eb012c221c5fd4b760029a2981a6754">file://COPYING;md5=4eb012c221c5fd4b760029a2981a6754</a> \<br>
            &nbsp;&quot;<br>
            -inherit cmake python3native python3-dir systemd<br>
            +inherit cmake pkgconfig python3native python3-dir systemd<br>
            &nbsp;# Disable python pybind support for ceph temporary, when
            corss compiling pybind,<br>
            &nbsp;# pybind mix cmake and python setup environment, would case
            a lot of errors.<br>
            <br>
            -- <br>
            2.17.1<br>
            <br>
            <br>
            <br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------9E1795A6670D580795E8C0C7--
