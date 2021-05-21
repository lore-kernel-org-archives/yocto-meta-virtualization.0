Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.139.1621618225111808412
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 21 May 2021 10:30:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=STorz8FG;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=07758be914=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14LHUOYQ012920
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 21 May 2021 17:30:24 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by mx0a-0064b401.pphosted.com with ESMTP id 38nphwh6ha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 21 May 2021 17:30:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LstxmzV0iv+0Hm1jwmqwXrh8nsFgw7zh8IiHvYTotR+pXMAjRqbK0+lLKhAC+GPKsUvA96FTqOs9TbhH/Kz48+jKmyegHh6szZtGU1Rf8vxaQNRvyshDGQJCOWp4XRE/wc9lUzr1M7HY2a1CuwNpV8EONmRyKuazE/IwIJ+wwG5U2hrcytinJFNVB6fn1NnqKu1BV4zb5zX/IDzKvrrr6woGKKDV12Pcedg50rSam3hgwv7+qdh5SkaPXH6G5lV/Ua62MQqXfrzDLR9DPsiTouLLnezcvzZHAPEeHJsGAFtI4Ir/f4FHD14d8hR2BHEZaVEWy816mA+qXXABya6A8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rs3xyrochf2/7wnG9KT9pqNulUPZ+8DBNlzepMRv9WE=;
 b=Mi6lo/OiSwO0JpXlhW6M7fXygSDmotU6CYR2xXtvPrxNB+sU83bJ+8Ga2ouHYF/fwUm7UkDKsJwxBDocgt+fExLfYdSm96vx5qtDN1LmLkmq1XwdHqm5Eh7Z7NYsrWsuWfwLtvftsBqWupuPdK+OuecZSqHr1p3AXlFCxi1TcbFdFxS5q9N4at4KJtuiCR3ZJFlyt4c2uphCcVTLArcSSJSVFEq0SvYBDLkEvF8173X2DOWwZ/qbNhOIjlfkrOj4SoKKZUj5JCXmzUM/h9DPEtK6Jr1g9wzSYYAIKmxvqK2k4DgZ6OUEQ1ysxjlVlVu+j/xDP7yS6DV+Up3lKMKaXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rs3xyrochf2/7wnG9KT9pqNulUPZ+8DBNlzepMRv9WE=;
 b=STorz8FGKBrvEG1EQ9WFvLZ0Ei51WXoJzhpvDeb486Y/yF5BVCSm0v114bbbOTbYfYVbzri6y72E3lcMhISMSr1kMSt9Aqa2kXh+5C5iPAKslAOesoiC5wXFNu8jNh6y8x7POBbWRLgEk69l3Ljd01ugPd+B2Avmi2pm/f0yYj0=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM5PR11MB1993.namprd11.prod.outlook.com (2603:10b6:3:12::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Fri, 21 May
 2021 17:30:21 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8d3b:70ab:5fc7:9eb5]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8d3b:70ab:5fc7:9eb5%7]) with mapi id 15.20.4150.026; Fri, 21 May 2021
 17:30:21 +0000
Subject: Re: [meta-virtualization] [PATCH] ceph: update to 15.2.12 to address CVEs - IGNORE
To: meta-virtualization@lists.yoctoproject.org
References: <20210521170109.1538167-1-saul.wold@windriver.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <e3d34207-4fa9-2b4a-0ac6-cd837bac2b32@windriver.com>
Date: Fri, 21 May 2021 13:30:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210521170109.1538167-1-saul.wold@windriver.com>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: SJ0PR13CA0212.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::7) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.3] (198.48.226.187) by SJ0PR13CA0212.namprd13.prod.outlook.com (2603:10b6:a03:2c1::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.11 via Frontend Transport; Fri, 21 May 2021 17:30:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 840b6aa4-4fad-43e9-4eb3-08d91c7e1bb9
X-MS-TrafficTypeDiagnostic: DM5PR11MB1993:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB1993E4B8B78CDC0EC6916B7FF8299@DM5PR11MB1993.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	H5l75EYroS/eevGYF+SlN4nswQhKHtQF+QJ2UTXXpAp0BiDQvMYOYEMb6IRP2AE9zyhvEuI57ka7a7vVpCtuI+NkcY2j7N5QNYEAz9XwRP6BMfUUrT+NTqMP4ZZ83TC4qb2GzBhfYDRHR8pofxGfsXjb2XFupt+SBzPZMhYvelCmcXs0PmOZHW6nh10Vbffq5Z3p7Hrs3xwi8hB1N2WxoKJJUW3zVB+gAOQOlwYtDRA1ZoNDdol4iCOcvsWw6Zu0JXKPSc6Skl0JEYCnVTjogUPwHX1WQkmHXd3zCxgBpYECDchOoKDx/fo7MWwXxOdWw+wBJ3ZEv8m52YuafrvI61/etMNWBjQMlewvH+Mtnl0c1Yp3+61Z3FUbgcJu57zl3PgusDPD89JwbhkvPYzC3w9rfr94uc2MIPWvk94OhYSwoxiZ/NN6k3Tof4DPeZ221I3LcEzDtyqQ+P2AUQI3rWg6J8Bbvg5lQzpknevfbR15Xs0avJSVFUylBhxV02cHxgm03wTR3O2mekuvBRyddX7iGmJNVzd2K/F/s4DPjC3JcU/vPEIRw6QapFjcV6wFmrPtKfX0lFHHB4gLXUAidaefbLl56wDXPYrn8jP3xKkBPM8bA77RLoOARaqWJs0xcVhnHp453SGRZNEgMrssrH/6CRvFLip7Kk6h9LvEBFQJQ5Cj1z9ipolgY+nQ3OJOzDxduoDDJdrlk4SoRIY/xMP6QaOQSYYmrAivW7ZUgn8qpdFJpbXaeEWh1in8mqa1zDmaUq8KzQrGZDrarjboo1NuN2E8S5WONlDtWBUL5T8p8RCeRqjs/oOJM+0sqP2JbMZvJ12ejDJcfwAtbmYL9T+Ei+oAb1w/B18LypYWHlo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(396003)(136003)(376002)(346002)(52116002)(316002)(6486002)(16576012)(31696002)(6916009)(6666004)(15650500001)(86362001)(36756003)(83380400001)(38350700002)(38100700002)(956004)(8936002)(2906002)(26005)(66946007)(478600001)(8676002)(5660300002)(966005)(16526019)(186003)(66556008)(66476007)(2616005)(31686004)(53546011)(45980500001)(43740500002)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?UXpOcmhRUnRqVytOU2Z4bDBwRmlUeGdTUGJla1h0NXU5MFVUR1A1azI4OTh3?=
 =?utf-8?B?bzRnWnV4VGkvY3EwWmxYazVURzg1bTRTdEtDaUxtYThXMC9KNXlLa1JaZzB0?=
 =?utf-8?B?RC8wNWRscTFENFhlZHlHK1R2UnNKVmpsclJJQk11YTlQSHhGelJIdHhGMXA5?=
 =?utf-8?B?NU1BNno1T3BPMzJYR3F2K042V21Jbm93UkI1SE9mbzJKUjRFNEFUVGpEZ3RL?=
 =?utf-8?B?S3NGeHpBcHprcmJDbHN0ZnFDQTViQ2UzR2ZoK2tDalBTdU1HVEVvMlJQcFMw?=
 =?utf-8?B?Zkw0Y3B2KzM3blZvVE95Vm5TVFJnUVNIK1I3dVdNWmtXRzM3Qk5JbHlFRzhT?=
 =?utf-8?B?eXBkL1E3QVZHdjNBZTZzSnlnU0xuUjZmRlhkQkpJZURwcU9EM3l1bDhSbVdC?=
 =?utf-8?B?c0FmdWd1Wk5GWlBGN3N1T1RQYUR6dk91VHcwc3FrSFNBdzVjZXFMNldtdU04?=
 =?utf-8?B?U210V1o4c0VsblpqcDhzZmdqQ1lLMXZ6YzdhdGNMcThEcWlzekZyUUpVQmlh?=
 =?utf-8?B?VnlSWmhONmNvbCtIc3hWQzk5OHF3WkxlZUhtTGZoVnpITjZLS3pSZHE2cnl6?=
 =?utf-8?B?SGpFeVl5UVNCcEVyZDhOaVcvWlQ4R3pBY0x6R2hybkpyUGltNElrT1l0MlBF?=
 =?utf-8?B?SGt2OHhRSWs0TnNxTWFKSVAwNk9aZnlyWFZGYitkaldkdWVZSU9IbEwreDM3?=
 =?utf-8?B?OEVpTDdUTnZubU82eHFnRFpKSkU3OHl5bVp0YmRPSXF6V1pDZVRoMEc1UE5R?=
 =?utf-8?B?aXg4TXNYNEdEbThEeTVvSUdKVlI3WU5rWlBockpKZ1VOV0Q3ck1Nb0J1SVF0?=
 =?utf-8?B?OU1vYWgvbUNYWm14QmEvcUNmOFhlTlpFdXk5c1JFQmhBZmZyeTZwcmptVm9C?=
 =?utf-8?B?ZnJUNFRGa21SZTRIc1RGZkQvRE9DMlIxdVB6bHdkbkpGOWc1Nkh2c1ZERS90?=
 =?utf-8?B?NHZVSDBPNEhZNktGUUVOdmdhS2J5WjZNV0hxY2V3cnZIdmxsUVhQRVlzRWVI?=
 =?utf-8?B?RUd0NG5RNm5aZ3N6TnJMak4yODRtb2NQRmxNRkxzUEVIN0E3amlIRWVjVVNi?=
 =?utf-8?B?RVNEcFh5akN0TEoxUmNDWnZvQlpydmtaWXNXUU1uYnAxdVBKUnVQQzZzd05w?=
 =?utf-8?B?UGJNSTlZWWFLaVovZmhZWmFIK2Q2VTUrQlR3MUk3T3RpZkVJejk1UG5yUUlk?=
 =?utf-8?B?QVpWcWtML2tkWUhpcmRWM0NiODVYVHNVN3BGcUpiandlYTBOdW5oTzRFZkl4?=
 =?utf-8?B?WmdURVhOVmF2TmczNzhiU1h6dHRrbXowdU5aZkVwT1pwaVlKMCszUXZUL2gv?=
 =?utf-8?B?NmY2R1g3emU5MCtvZmVQbVNKQmhCems4aExidkd5NnErMEdlOG1BbE5xNXZO?=
 =?utf-8?B?YkRxRlpZOGhaR01ZTlZtdkJBcm1DcVo0K0ZOWUFsbHRFeW05WkJKT2Vqendw?=
 =?utf-8?B?T3FZa1hxZGxRUjRmMHVWRElDQmZ5WXlKdmhFWXFYM0hXU2RPc3ZSMVNnQnN2?=
 =?utf-8?B?YUpLajdmWFpudk1BK3ZDbS9LN2FIVzZ4Wll1ckQ0SGtmTmZZaXE3OUl4WjB0?=
 =?utf-8?B?N2R4N3d5d1p1Yi9OV1M3TDFEcTJ5MFN4WGhQT21JQTZoQ3g0RXJxbTFqVEVK?=
 =?utf-8?B?T1VUc2NDdnArRnVIUmVtKzRkRGFEc2xFKzRldEtZNlM5VU1TVVlzUjV4YTZU?=
 =?utf-8?B?eFMwcWhqZzJhUVQ3dWVqNkhnbGFNUXdjbkdxTUZtMWtSU1hWODloRGFqTVNh?=
 =?utf-8?Q?SjBhNh1s70VA2Ggf9RvUhLDuCr3h3pvtiosNOgt?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 840b6aa4-4fad-43e9-4eb3-08d91c7e1bb9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 17:30:20.8640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QJSPwUO2Lgx+f45Y4SYWrfUGRMMwetTc3bW7pHmJYcSz/xhM0w8GsADmzq4qAkpbPqtrmDgKgnLfUBeqSOSBSP8EpI/Pw9pgxTkpznS4J/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1993
X-Proofpoint-GUID: hPoG3-qjnTfr1jZUClJVyZ08l05Qnv32
X-Proofpoint-ORIG-GUID: hPoG3-qjnTfr1jZUClJVyZ08l05Qnv32
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-21_07:2021-05-20,2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 phishscore=0 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1011
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105210092
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2021-05-21 1:01 p.m., Saul Wold wrote:
> Updated sha*
> 
> Fixes: CVE-2021-3509
> Fixes: CVE-2021-3524
> Fixes: CVE-2021-3531


Thanks for the test email Saul.


We have a new email filter so we're trying to confirm that the mangling
that we saw yesterday is fixed:

> 
> Signed-off-by: Saul Wold <saul.wold@windriver.com>

> ---

Today I see:

>   .../ceph/{ceph_15.2.9.bb => ceph_15.2.12.bb}             | 9 ++++-----

Whereas yesterday in my mangled version, this would show up as:

 
.../ceph/{https://urldefense.com/v3/__http://ceph_15.2.9.bb__;!!AjveYdw8EvQ!J5oI8mC6n_4rfQGE-S3iJWnaD6zWYfXtrSqe-8pKP_UAUzOXalGOzU4j3gBdk-9fDL_8RA$ 
  => 
https://urldefense.com/v3/__http://ceph_15.2.12.bb__;!!AjveYdw8EvQ!J5oI8mC6n_4rfQGE-S3iJWnaD6zWYfXtrSqe-8pKP_UAUzOXalGOzU4j3gBdk--szuRLtw$ 
}             | 9 ++++-----


Ugh!!


Let's see if in a discussion thread that has URLs will get mangled
for Wind River readers:

Here's a free LWN link for those who are reading along! :)

The misc control group
[LWN subscriber-only content]

https://lwn.net/SubscriberLink/856438/7f39950073461e6d/


If your IT group inflicts this system on you, you may find this
repo useful:

https://github.com/cardi/proofpoint-url-decoder

and of course you need to get the IT group to add some exceptions to
the system to allow the mailer lists / text formatted emails to
be delivered without url rewrites.


Sorry for the noise...

../Randy


>   1 file changed, 4 insertions(+), 5 deletions(-)
>   rename recipes-extended/ceph/{ceph_15.2.9.bb => ceph_15.2.12.bb} (91%)
> 
> diff --git a/recipes-extended/ceph/ceph_15.2.9.bb b/recipes-extended/ceph/ceph_15.2.12.bb
> similarity index 91%
> rename from recipes-extended/ceph/ceph_15.2.9.bb
> rename to recipes-extended/ceph/ceph_15.2.12.bb
> index 0d821f0b..9ba72b40 100644
> --- a/recipes-extended/ceph/ceph_15.2.9.bb
> +++ b/recipes-extended/ceph/ceph_15.2.12.bb
> @@ -16,11 +16,10 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
>              file://0001-cmake-add-support-for-python3.9.patch \
>   "
>   
> -SRC_URI[md5sum] = "5a949b91199efe130bfe2e57f200eacd"
> -SRC_URI[sha256sum] = "ea7fa2be68b3570c5c3aa02774dca27de20b6f20a8498f65e5c4ef375a209ace"
> -SRC_URI[sha1sum] = "0503649d7c7d9268cb61b03bbe839106988f87d7"
> -SRC_URI[sha384sum] = "57208c126ea8e640c3979073fd64ce58606f17b4b7ed2e005b0792bdfd51b13391af325658d0f68f961f94175d93e891"
> -SRC_URI[sha512sum] = "1f55b0a13bf06df782831d0c9d5f8617c22442ab97fb186e6ccb08183e02bf1756caf8633fa6b1cf156c3fb7b1bdff90a60a1249adfad0b9450036e2329bf8ff"
> +SRC_URI[sha1sum] = "9c76b298e1e659b9c5501003ac77fb28aab7823d"
> +SRC_URI[sha256sum] = "8710f6700de83765138df8eb4fc7a5e7c66104dd838033e0827a1850f250ac85"
> +SRC_URI[sha384sum] = "2a2f177e5b68f6f5d13b253a8d4daba9e956b4a79a40a4775aee288b60c612fe13b417d6baf77944c32b1181b2136f68"
> +SRC_URI[sha512sum] = "08266a2e9a7ca5a37e03f340873571fd012c630dd898a87241cd97c29760b2bf41fe64c8883e7b08e0f83c26245072cd26e69ecb1db02378d1ec38335ba1cd0f"
>   
>   DEPENDS = "boost bzip2 curl expat gperf-native \
>              keyutils libaio libibverbs lz4 \
> 
> 
> 
> 
> 


-- 
# Randy MacLeod
# Wind River Linux
