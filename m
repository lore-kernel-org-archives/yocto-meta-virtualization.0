Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 688B2C25B48
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 01:23:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.34619.1698197019089974037
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 18:23:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=iT92aZTT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=86627674a5=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39P1322R006302;
	Tue, 24 Oct 2023 18:23:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=3fOCqaYfA8MwLILXdmrwH4XS3VUZ4SVdaKRzvSDds9A=; b=
	iT92aZTTEW8g/ZZai1/ZZuGMtNBDwHzN1M7tbltPo70O7gJf+HPoOS8PT3Rrxa97
	IjuG4kD7lWo9+nlz/QGuKj0VCA33y5qvHICRjjm9petE8/1p3FksAhWqAmfBS31d
	G8mGdKn0mLN9TAZSeRiK2ALft8QQTAlxQCXwODchSgDjI+zHZjHIF17oSi4zKULh
	6eNpdjU6MqnkIKAlJhE06B/RovaxTEGCAYU8pBrJSD3Un3DrdIfKmExZZFYpEKn6
	4F+GadHAjTxSsoUT6kl6a3u8EwMW4Yye+B6bgnBHCn1iv/FnNsyQF15cNTqu3uFq
	DcWa7vijmSO3vMBQVJK+Eg==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tv9x03tbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Oct 2023 18:23:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QL1aRfgWMnetpsbHlz8m65vYWI1htLwynqmsu+Rq9g7J8dTyPYYeSbOUQIXbg6uWnv7wIWutQ1MgWDmm/ofQxS53c6CN8lw6R0Ho64yb/ucE1PULgzk+mb5Gs2r2FFqEx3jK9N3x9n+X9zfKgY2U/+yMXTbAbMyjZ0xmgtxqMMP+TBVTRJQBytTgblqHd7SmGbPY+8vCkQ/TdHJLPj2mnTopah+0q3TrSr757lCWbji5NcRUlcTFuXXIb2j7raW0L6r9eNOZOROl1lH3QwaO/zY28a2pB1epzFlaw3M/Nvzfl2AGgBTy2ZXjhbR8DGYdMlDdZ0aOTSzmLqZtCUZyCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3fOCqaYfA8MwLILXdmrwH4XS3VUZ4SVdaKRzvSDds9A=;
 b=AOBdfALB7tvOZ1J6xgdtDWuxS8aF+AIH6DyFGvainWTvFoFh14K32KiNAoXKoQKK5AOcyQagRQSwPASjyE3pepQMP/4qyGTVXk3dPHVL8Wgu/sQ87LZeBJWiI1CEN1VMtW3+gIq631sS50WZW7gbt5oJVcl5w1Epc0EaFKxZKPkP1rGz0Msjt5is0+67vnLGyIoFRMywJCE6isKX+BzFHtlwId+wWpgnvk21Q4tr7dl2ZkZjX54T5nHG+v83zN/GvHuJuRgu/zOHTQjDaJMkCWycI1UK2Gxyrwz1bWPe4Jp/pS5Ai6+hHKLEG3ITmyWlcmV484Vs0KqyFgD3BeOZZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 PH7PR11MB6007.namprd11.prod.outlook.com (2603:10b6:510:1e2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Wed, 25 Oct
 2023 01:23:32 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::4657:c76c:d491:3c23]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::4657:c76c:d491:3c23%6]) with mapi id 15.20.6907.032; Wed, 25 Oct 2023
 01:23:32 +0000
Message-ID: <497f912d-93ed-2d45-5841-d5aa96e8a6bb@windriver.com>
Date: Wed, 25 Oct 2023 09:23:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-virtualization] [PATCH 1/2] podman & umoci: mark
 incompatible with mips
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
        Kai Kang <kai.kang@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20231024152415.1259420-1-kai.kang@windriver.com>
 <CADkTA4NHqeJS0NG7a-vQkt7MAmeVqoide=sPE3YeAwDEtwT0Sg@mail.gmail.com>
From: Kai <kai.kang@windriver.com>
In-Reply-To: <CADkTA4NHqeJS0NG7a-vQkt7MAmeVqoide=sPE3YeAwDEtwT0Sg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYAPR01CA0235.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::31) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|PH7PR11MB6007:EE_
X-MS-Office365-Filtering-Correlation-Id: b731d940-e530-472e-39f0-08dbd4f9006f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WuTvhsUvdwhHFH0s/4YCo9tgzRPQE6RHIXqT87oCdV5Htbbtbewxopcj/FzAqINdUChzwI/ANlAL/y0gOr+CZfSHbrb0veI4G9dvG5eGoBRyCb+HOEcEhsuQHXDGu2yAkombj6HWjjn3Kx10zuDmfCt5WsuqQ5oe4zySpaggOVrpV2UwxXXUhXazcBabDF9K+D9VCOODnAu/CHtahtrYigW2s34uouz3VC+PMRzBZ4YwwQtfqVQv2Zguvcj5icVjIvzmMndw+W4micYPucB/3ceNTTP9aC2Bix3yCRsQIa+ZhnA6DKGqzmzMTDrIh8ShAAuO162jSYklWc8b0rYpydLNVvfRtyDVlRpR7qe9vp7C6149eWVUZNavFF8rKH7JyiQWVC5BZjof80w2DpwCyp9DWvzXMnqrM3q+avM9KDUf8cODnl0ll9KrOn2C1EJGFUGl6ZExgQhUdSLPRhx3cSoCizyPUCTg9AZRh+y5IJP7hqxeXfVcJY8CasntnAWwQ8E+SngwjIaLsnh0VIhRS+9yqYDfO/SWq4w3rv4XW3/nEL65P5472xh2oKKMPgYGvf1hyfBjSD1DCGXhkb7N1DHibT9b6ZWCVF8UPa+qoHenZRrq/XtdAxya6hh8xyaY+ZMXZAzJLdZ7qByGYWHiAq9lLz5UsZNteWlFyKO8iyQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(366004)(136003)(376002)(396003)(346002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(6666004)(6512007)(6506007)(53546011)(83380400001)(2906002)(26005)(5660300002)(4326008)(478600001)(8676002)(41300700001)(966005)(8936002)(6486002)(66556008)(66476007)(86362001)(2616005)(316002)(31696002)(110136005)(66946007)(38100700002)(36756003)(31686004)(66899024)(43740500002)(45980500001)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WnM3VVRPNi9sVDVaQjNFQno3RmtJZkpEeWlQdkJGQmJlb1kzUmY4T25rbk9Z?=
 =?utf-8?B?Mis5SHd6N3N5djZoUUoyRE16Y0xNM1RBNy90Z2ZTaUNaQzc4MHlxYzcwMlh2?=
 =?utf-8?B?MEVUcUIwb1ppclJwc0g2dW5XemlNd2tkbjBWb0ZmQTc1SVBybnZPc3l2MktI?=
 =?utf-8?B?a0xHZzFmUVpTKzNURXF5dmtnWHplcmZXQ0s1WGVJMmRsZnNlTXpmY0lzYzE5?=
 =?utf-8?B?cjBEZDUxZmt1bytSemVLdjlWcHdhUEl2WjVibUNMYlYxTGN0WStUQXhvS2xH?=
 =?utf-8?B?TkJLcWNpemJaSk82TFpLNzI1OVFKY3NaTUJNZUhEZkxveC93ZmNDQjh0N2Mz?=
 =?utf-8?B?VC9TeCtRL3hDM1kwZlg4K21RNFpkc1VYM3RzNWNYQlJnR2t2TjNRUnI5NlN2?=
 =?utf-8?B?OUZGMGV2T0NjU05IQXU1ZFJvdmNCWFNvQ25IRktKWW5IOHY4RmtqQTdVMDFK?=
 =?utf-8?B?aVdCK3BNSkU4dDdzSjU0WUVWblhtVk5hZHZ1U3JOcXhzSGx6dDZiSzA0bjRv?=
 =?utf-8?B?Q0tjQVBRa1J5Mmswby8rVzhkQURZK0IwclpLVHVseHEyblFYdzg3UkFUY3d0?=
 =?utf-8?B?d2VkT09DZWorYzFzUUNUQmlqckhKU0pyMmtFWkYrdnVNbER3a2dGMG9oRWcv?=
 =?utf-8?B?cGgxYWd5SUZURUxLU2lhc25BYWwrdWRNUHlRSkNja1hpMUZRSldtaUVYc3N2?=
 =?utf-8?B?ekJsMVpTdHVETzJ2V2U1OFR2Y1Rxam5QNmR2N3hCNXdvSXhzMEMyVkpEc1Q2?=
 =?utf-8?B?RHZFckprSENzWGgwTklNdk5BVEZDZ1pWOFl4UzZHQ3RWc2hES0NWRGFpOVEx?=
 =?utf-8?B?bE45VDVzbzcyM0lMYjFsQkF0TVhhMkdMQVBSZ1d6bjJweTBWUHN0WlFuSm14?=
 =?utf-8?B?OHdQajllRkpNWVhWL3grbjNWVk0wS0NlckRQZytpTHBuK1I3TGo2TEZTY1FT?=
 =?utf-8?B?c0Fkc25zelhGTzk3R3BoNGN1bW4vOWplUE9ncmJEcDAyZ2Z3T3Q4UzdUNHV1?=
 =?utf-8?B?c05EOUVlcXB4VVNiY2xNOUh6SU8yUXorVEdESkF1YVZxSldEWCtQMkZJVGZU?=
 =?utf-8?B?enQ3cmFWSkU1MStiSkd3YmgrL3hqNXVLVEMvdm9GemRVZnZXdm9CYk1ldzdo?=
 =?utf-8?B?OFJDTFRhK1ppdExseWZDVmU3K3lTT2NIUDlrMyt5dmxGTUpTbXpJcWNNaWxN?=
 =?utf-8?B?LzVBZmNTWmJlYXU2RjYvcDVIalB2a0VFUVFscmtoT2dxTjN2WnllakdMNng1?=
 =?utf-8?B?VWh3Yi8vT1kzWmY2RThxZkhEL1lpM2VYV3hVSE5CSFN2Ty8vVXpZMncwTll3?=
 =?utf-8?B?QnIwRmpGdVRpRTE3TGEzZkk5dzNycTNUTFd2aittM1BFSFIzWGZLaTJkcy9W?=
 =?utf-8?B?S2tYcGp3ck8zNUY4a3dNMDVsazRJN0F6aGs4Q1NTQVVlenhTN1ZKRnhQSk1I?=
 =?utf-8?B?ajVwSTZiamtPencvUW5INitXQzVYc0d5WG83dit5WklBeFh5QUFIQ3FibTFv?=
 =?utf-8?B?OUxtVVNZQ1E5NnlmUlFOclVZWlp2MDhMNUJyRjQ2ZUxPNUlyTXhMK1R0aS9Q?=
 =?utf-8?B?NDlVelRMWjJpeGRSS2xsNU8xMHY3WUpMOVhGUUdxbkdIZkZEMXRPWXd5MFVr?=
 =?utf-8?B?YmU5T3VTWUpGUjhUNUpVNHRDZXVTdW1XUzRvR1lkRWN3OXNIS0NOSWdFRDlY?=
 =?utf-8?B?VTNqbkZFdWx5alBLV2Z2OUVWcjQ0cTljcXpZbk0wRTkwWGQ5NTQxaXhCc3FW?=
 =?utf-8?B?dTZ0V1oxWmF3VDlzcHA1VHRMOXBQU2I1SzBsRTRPOUp1cWFhUGJGaHdldDc1?=
 =?utf-8?B?aHpVY0pwVmVVdWljZmE0bkZ2eUNac1JaTUNKVUttd0FWNDJ3WGxHWW1xVWZK?=
 =?utf-8?B?QXA1VnZyN3pmSGN3b3hHQWJtakhnc1cxbnRvTGtGb0hOb0k0dzJvcjE3aExY?=
 =?utf-8?B?ZlAxcW5NM2YxREJvMytPdFUxaTZHVTg5MmRtK0JHTmxsa29OM2F3aWpvSmN0?=
 =?utf-8?B?ZFJ0RUl4YzZndC9KU1Bvc3F1Rjd5ejViNmUxaUNTV3duZW9teVZNaHFCaVY5?=
 =?utf-8?B?cmVwMm9MUVhsTTBFN3RlaTlUZmJRc1B5aUo4TGpDa25wL01nb21pOENMZmVX?=
 =?utf-8?Q?Y8G93H7SSroZQclVHx5V7sYjP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b731d940-e530-472e-39f0-08dbd4f9006f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 01:23:32.5319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zmYsZ8Ozo4KSGrNyVGOLawQrgvKgJDHMu1s0BBIP6+WZuzWJGgdLRRPsbkH4ovzrG/EXHHgRBxc9+KC/VNDm0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6007
X-Proofpoint-ORIG-GUID: 3dOreRVGi75BaoozONHFN53iB2RwuZse
X-Proofpoint-GUID: 3dOreRVGi75BaoozONHFN53iB2RwuZse
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-25_01,2023-10-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 mlxlogscore=999
 spamscore=0 phishscore=0 malwarescore=0 impostorscore=0 clxscore=1011
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310170000 definitions=main-2310250010
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 39P1322R006302
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 25 Oct 2023 01:23:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8394

On 10/24/23 23:45, Bruce Ashfield wrote:
> podman has already been marked as incompatible with mips on master.
>
> Is your branch out of date, or did you miss where it was in the recipe =
?

There is a local podman recipe with specific version and causes the=20
issue. When reproduce
with Yocto & meta-virt, I didn't check the error messages carefully.

Sorry for inconvenience, v2 will be sent.

Regards,
Kai


>
> Bruce
>
> On Tue, Oct 24, 2023 at 11:29=E2=80=AFAM Kai Kang <kai.kang@eng.windriv=
er.com> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Since runtime dependency skopeo has been marked incompatible with mips=
,
>> set for podman and umoci accordingly.
>>
>> buildah and podman-tui rdepends on podman, so mark for them too.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   recipes-containers/buildah/buildah_git.bb       | 2 ++
>>   recipes-containers/podman-tui/podman-tui_git.bb | 2 ++
>>   recipes-containers/podman/podman_git.bb         | 2 ++
>>   recipes-containers/umoci/umoci_git.bb           | 2 ++
>>   4 files changed, 8 insertions(+)
>>
>> diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-conta=
iners/buildah/buildah_git.bb
>> index 5155cbb1..ef1feead 100644
>> --- a/recipes-containers/buildah/buildah_git.bb
>> +++ b/recipes-containers/buildah/buildah_git.bb
>> @@ -20,6 +20,8 @@ inherit pkgconfig
>>   inherit features_check
>>   REQUIRED_DISTRO_FEATURES =3D "seccomp ipv6"
>>
>> +COMPATIBLE_HOST =3D "^(?!mips).*"
>> +
>>   GO_IMPORT =3D "github.com/containers/buildah"
>>   GO_INSTALL =3D "${GO_IMPORT}"
>>   GO_WORKDIR =3D "${GO_INSTALL}"
>> diff --git a/recipes-containers/podman-tui/podman-tui_git.bb b/recipes=
-containers/podman-tui/podman-tui_git.bb
>> index 1a40d0ec..0b1924f9 100644
>> --- a/recipes-containers/podman-tui/podman-tui_git.bb
>> +++ b/recipes-containers/podman-tui/podman-tui_git.bb
>> @@ -41,6 +41,8 @@ PODMAN_PKG =3D "github.com/containers/podman-tui"
>>   inherit go goarch
>>   inherit pkgconfig
>>
>> +COMPATIBLE_HOST =3D "^(?!mips).*"
>> +
>>   do_configure[noexec] =3D "1"
>>
>>   BUILD_TAGS ?=3D "exclude_graphdriver_btrfs exclude_graphdriver_devic=
emapper"
>> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-contain=
ers/podman/podman_git.bb
>> index dc80eb6c..3e9fec33 100644
>> --- a/recipes-containers/podman/podman_git.bb
>> +++ b/recipes-containers/podman/podman_git.bb
>> @@ -9,6 +9,8 @@ DESCRIPTION =3D "Podman is a daemonless container engi=
ne for developing, \
>>   inherit features_check
>>   REQUIRED_DISTRO_FEATURES ?=3D "seccomp ipv6"
>>
>> +COMPATIBLE_HOST =3D "^(?!mips).*"
>> +
>>   DEPENDS =3D " \
>>       go-metalinter-native \
>>       go-md2man-native \
>> diff --git a/recipes-containers/umoci/umoci_git.bb b/recipes-container=
s/umoci/umoci_git.bb
>> index feaf6dff..62b42b8e 100644
>> --- a/recipes-containers/umoci/umoci_git.bb
>> +++ b/recipes-containers/umoci/umoci_git.bb
>> @@ -17,6 +17,8 @@ GO_IMPORT =3D "github.com/opencontainers/umoci"
>>   inherit goarch
>>   inherit go
>>
>> +COMPATIBLE_HOST =3D "^(?!mips).*"
>> +
>>   # This disables seccomp and apparmor, which are on by default in the
>>   # go package.
>>   EXTRA_OEMAKE=3D"BUILDTAGS=3D''"
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#8386): https://lists.yoctoproject.org/g/meta-virtu=
alization/message/8386
>> Mute This Topic: https://lists.yoctoproject.org/mt/102160041/1050810
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsu=
b [bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>

--=20
Kai Kang
Wind River Linux


