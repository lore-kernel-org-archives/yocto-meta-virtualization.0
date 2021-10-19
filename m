Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4876.1634613393399978042
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 18 Oct 2021 20:16:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=NLLHmJNm;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=592617ddc3=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19J34Lok004863;
	Tue, 19 Oct 2021 03:16:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=U32qR2vC5PcgMstosgSvuToE/q/HMjdjmBX2MAB5oY8=;
 b=NLLHmJNm8MnsVKjUaw9Sq5l9XhA4pFlC+7UPUV0rXLLMQAL6g2uiXMQ++X9ZYZQ7ohsV
 yHesWMQamxqUycS8wALM3SnDX0kg9pOoGieYbx+SdSq5Fp0nTDMID9VWYGenYi6d8JQQ
 vaFsgOAaF15SUpxBXK5bBcWJa4Doqluzu/RlzdNuVw0FMKbhSbq92rjZl5AKpJJGmVjH
 8tRDCgDHvaC1GzWFzApEJMJX1lPZvMTELeEPnKINB1yyE/cdPxC4yNTvOkZqdncky3ld
 FFqOcENs2ShD9s1JISQ2Xoz5HmgGt4mdTivlPXkmBCV5vZkaAK7gQmEK5Sh3t3H0Y6sn ug== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam07lp2048.outbound.protection.outlook.com [104.47.56.48])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bs6hhgqaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Oct 2021 03:16:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LOeoZvXHDE6XrAvXHaGpL6XtMzwt7cSrZ7twBeWZEsNOoUKWGU6A5sXOEFUxdsO9TKpw+qW7Q1SCoSF2JlEq8XxpZV0PVn9T9jiEK8UGwhAs70DKYfOlKpSQYH71BYfA6Nlu1o4zYU492u6vvSyiHll87PvWyYQ1Lkn0nEZ8rOjGOen5foSA7ZHjtGR5DH+GVVqGwN5W7mXgTiICfb5ijKsnE475kDaIMvMWx0ZU5k3ABr1bEJgfCB9jMiYLG4EuLBU1HZQho7Rml4Y1KslmkEVqv3c4Os/Uj/CkTGoxn5Amd1UNK8+k8tcPM751iT3UEDJRe1AYWWPKjx+sH4sccg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U32qR2vC5PcgMstosgSvuToE/q/HMjdjmBX2MAB5oY8=;
 b=cutGOpqkkB51p7Hlo0EO787RbFldJW3zYLWysgOMmqv4BENdS7jDxKeyvhuOx+/H5iVNf4CDUCko5QZxq/ZcVlycRY5+fugciv33h7AeS+i0iuDhJxKMvb/dPi83AbuQY4h2uOJoZT/EQJRmt8rJrjuyMfjrLgT3NdfuzLcD6b8u5bMcMMcSZl74FXsj4SH351CmelzWVRShuBzGegcUnZ4ANTp26bZFY/vfCsQLGskQaZEdqy37v6/8w18IEa+y7KH56FEpUZbl2lnKh9JW7oGFMsOf+RDdbvCZYtHMCT56nc1OwIzHt/QlG3xGjIcljx3IL5QN3B5JTq6H4dojWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by CO6PR11MB5603.namprd11.prod.outlook.com (2603:10b6:5:35c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 03:16:29 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::4c98:111b:1f1e:898f]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::4c98:111b:1f1e:898f%5]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 03:16:28 +0000
Subject: Re: [meta-virtualization] [PATCH v2] ceph: inherit pkgconfig.bbclass
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
        meta-virtualization@lists.yoctoproject.org
References: <20211019025300.39608-1-kai.kang@windriver.com>
 <CADkTA4Pr49xoseG0P1p_O0Ky4gn1cgxCBVFLJeOxCcLyFtOU8w@mail.gmail.com>
From: "kai" <kai.kang@windriver.com>
Message-ID: <3597906f-a4ab-a1b0-ecb1-6a9100d8db44@windriver.com>
Date: Tue, 19 Oct 2021 11:16:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CADkTA4Pr49xoseG0P1p_O0Ky4gn1cgxCBVFLJeOxCcLyFtOU8w@mail.gmail.com>
X-ClientProxiedBy: HK2PR04CA0085.apcprd04.prod.outlook.com
 (2603:1096:202:15::29) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
Received: from [128.224.162.156] (60.247.85.82) by HK2PR04CA0085.apcprd04.prod.outlook.com (2603:1096:202:15::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 03:16:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80d06f7e-ade0-4d88-5b2e-08d992aed759
X-MS-TrafficTypeDiagnostic: CO6PR11MB5603:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB5603650772131D071D1A9DBF95BD9@CO6PR11MB5603.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DulhVPT7ZLmKK0DEKoRJERHBWCTVN8+T3rpCfAum62xnjJK0lY9zdY3kcLaYaLn4p01oM8kQ1GoWGghjdCoXZtYy5Grg+MP+I+d4DhaPAW3E5hApBG9Hwq/fjVQtzLrokIzHAzSHpXmc9nhsN1YG1/TigZ/vUAoGvuTedjyX6xPTg/IbBgD8zNPjJYwtbNWmBV5EExECJ/X7+UC+3F5fK9jAQQbT5gk7rcD7oY4PyRbDeNwtn9TQEKNOR9mMO8Te5pbkZym+KESeKevyBnV0SlNpq/sqr/OkFU6m9adfmk4xraarWCyhghHVbo2Q0niFt9BYugV0LzuUHNFm0NOQxBW/yl/iBt/8Pt5/ANAytt5F1wMtg2Rs9liqauJA9tSFU+6Qs+01G2OeWqkbAlQ4chFPbYO2mFcZi3rXkvzs4xRXa31bZZQIoUwcNtZIs1mMCH3zmekUl4asG2MlyBNU01xQYLh/ptoOoQlEKpmlhBDy/QS5ueBJ/YbKuh3rFUFOjHg2UC1jxuFqkpDLzgynluH0w+rv7eW9Q2se38HvSmb5S1aYBRZa2I0GxG9g8uqFa3aBrLhaqAzAFhbRft7mjBlBdaR3yimUYVBoCBT3Imj6TbWuV2E39OeswMWV+eOxasDnAQfKaS9b9xO7Ddtml4VfDOffNAbCCaT34uwRyvpY2rHTGcPLLfpo9a+3CijpXpypL0/qtt0GPu0tIhVdfuNQby/Uugzh6VERZ3X2WIgQgzoQ+Zh6jU2+e2mUz8058tMrkxP4ekg3fiUoGgHosqJrlfld5HMYd4xGx0AaMgKfje8lNPzbvoNFXvRzun31mO9Y+5dorqf1sFtljTnOjAr2OiShkI+wxLoPquJ6pfjsBQgZMe7L/BWS2VqiJEcPVGO2vcQT7wlXcdao7KX516CGRuKbCqvJDFlmK7bzN98=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(66476007)(86362001)(66946007)(31686004)(8676002)(16576012)(966005)(6486002)(31696002)(52116002)(508600001)(36756003)(5660300002)(6916009)(38350700002)(316002)(6666004)(6706004)(26005)(956004)(53546011)(2906002)(4326008)(8936002)(38100700002)(83380400001)(2616005)(186003)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c2xlZjllS05hc3d5UlcvcUx0ZWxYa2JFWTJ3NTAxZFFSVFd0MlhJM3lHUjU1?=
 =?utf-8?B?MjlrRnJCYTVoek5OWXptWVdsaFM0YmRqdVBzRDk3bnllVjB5NUNkN1I2cFpP?=
 =?utf-8?B?dHFYU3BhcEFic2RZUHFvQlliV2dCZTVNVlR1ekd2RGFCK1A1cW1DdklHMVdk?=
 =?utf-8?B?NzFUS3JaQlZTTk5uRFJaMTBXL3h4QTlyMnE5a2FLSGxMYy8wZzN1cXlpa2Fl?=
 =?utf-8?B?TTlIaDVybjJud0lPS3hlMnRvWDdNMDgvZ2tiRDB6NUppeU9UelJveWExTHJ4?=
 =?utf-8?B?REpnVG1HMUZjT0EyT0ZmSE8rUkhpZG1ObUdLU3ZPRy85RldTL1UrZWh3RG9w?=
 =?utf-8?B?RFJETGNTMWdWbURMbW9SRVV6cGlGTEFCUXhTbmduOHFWemwwWWgrT29EU09W?=
 =?utf-8?B?RnoySDVVR2M5bXd2MEFqOUFYY1hFMFc1QzJBMXFvdTFSdm5PRFloTmFrSFQ1?=
 =?utf-8?B?NFQ4M2ZKemVNWkFNdXlBUjJNUWcvZlRucWlvVXhZUytocDlLdWJEYmMrd2du?=
 =?utf-8?B?bTY5WjcxbEFkSkQxMzZyVVV4aTU4cUhRY0gwbXpoTHlacDJVK3hDcTNGVkZk?=
 =?utf-8?B?NW5DTDd2Z0VtSk9jZHovNkpvSGx1VGd3NjFTcitRdmplODVvY1JybGVSMUhW?=
 =?utf-8?B?ZTYvWVBJYjhZS0YzUVlLRTVEWStZdndycHFWVEZkVEdaQWFoM1NQZjJQY0lQ?=
 =?utf-8?B?enF6OFdKSzRWMU9OaXRYb1R6TDJZL2RodUVUWlVvNklwanhmUFU3M3JIY0hh?=
 =?utf-8?B?ZDRncXB6eTZTRnA1SmZ3RFJqR09IMGs3Vk1qQVlncG03V2d3RDVMVUw0TG45?=
 =?utf-8?B?N0lDRmpEbnQvaGVMdDdla3VMNkltdzdRQUpqcit0T3EwZEhVVG91b2s0T0JR?=
 =?utf-8?B?QUlOL0VGZjhQb0NCUkdYRks4TEtZSkdxZnFNNGNZM1QyK3JldTkvcHU4cElk?=
 =?utf-8?B?bzNnKzlZQ0tsN0Q1dTRGbThZTVdVWXNlVVFNSkh5UlZXejdHVFhWVkxuZUx4?=
 =?utf-8?B?Z0tUdnQ3czRlYVRPS21jUEtLQXpBUXptUWNMZGdLdCs5Y1hFTmFlZ2lzajBi?=
 =?utf-8?B?UnVrYTdld21Eb2RIUm4za29YS3NRZFVwRlI3Ulg0UG1OQzZLTW81U1UzMXZt?=
 =?utf-8?B?V0k4TWgxWEtXQjA4SHJNMjF2TUNDdG1ndlk2Y0REV2lSdjdYcHMwc3diNDlm?=
 =?utf-8?B?aVdxRGwzN08xb2JxNmt1VndLS0N1eGZqa3dWV21IcUlwb3Z2V3BnNnEvQXQ5?=
 =?utf-8?B?dkRoSXA0WmFWUzJlYzFGcUdPb2VYK0QvUTlvWmZySUQ4TTVmV1BjNkhtWEo1?=
 =?utf-8?B?eXhUc3p3NC9URVFET0VjMXI0c2VobGNWU0NUd1duNisyYXQ4Mkp0QTkyVXpp?=
 =?utf-8?B?WnZyc1IxbzJYeE5CUWVpVVIwNDJZUXRBUzRyeEVDWk1oeE1PbWIvVHZzNXcx?=
 =?utf-8?B?SGVoQytJNmx1RGlSSEtDVjN2akkvSE53ZkN3RlZZQXNkNERjK3JrMmVVaUFY?=
 =?utf-8?B?dW82WXBMeGg4cGdQOTRvN3NaR3NYSHZBVElWUjI4cEROQk5NNllLUU5KM2xY?=
 =?utf-8?B?OUhobGp5VXgrZzBhcUxhSWduRDg3bjVLNUw4OEw5OVZRTi9sT21qZ2lDYVI1?=
 =?utf-8?B?MTZBTnJhcVY2NjhPeVJNMG85YnNFbUtMUTFoSXV5WFZxL3pSOHgvenJ2REdk?=
 =?utf-8?B?ckR2YkxvNWk4TFhrOXliYUZxNFpjUmg1YVpGZXJ6Ym1CUkFiRjhRT3pZZHpI?=
 =?utf-8?Q?/wN3aKIXzNDUTs0eIeqNMD8+f1plvZsW8YCP47O?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d06f7e-ade0-4d88-5b2e-08d992aed759
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 03:16:28.6081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PK62Y15Nxn3FFsD5bxMlTYEFFgrVT9Vre4Lll64iWi8bLC8ygIMUkAh7QjHpIlhV/ubKfSizYmdW3LvVj1QXyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5603
X-Proofpoint-ORIG-GUID: s_-cB0CpTlGxEomrKM_0Ml3-Pfvi5vkO
X-Proofpoint-GUID: s_-cB0CpTlGxEomrKM_0Ml3-Pfvi5vkO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_07,2021-10-18_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1011 impostorscore=0 mlxlogscore=935 adultscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110190016
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 19J34Lok004863
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 10/19/21 11:04 AM, Bruce Ashfield wrote:
> On Mon, Oct 18, 2021 at 10:53 PM kai <kai.kang@windriver.com> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> According to oe-core commit
>>
>> 8e26252b45 layer.conf: Extend recipes not to install without explict dep=
endencies
>>
>> pkgconfig-native is not deployed in sysroot by default any more. Inherit
>> pkgconfig.bbclass to make it available for ceph.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>> v2:
>> * correct referenced commit
> v2 is staged on master-next.
>
> If this is needed anywhere else than master (i.e. honister), let me
> know ... It wouldn't break anything on honister, but I'm trying to
> keep the changes there to a minimum.

It is only required by master that the oe-core commit only exists in=20
oe-core master and next release(kirkstone) branches:

$ git br -r --contains 8e26252b45

 =C2=A0 origin/HEAD -> origin/master
 =C2=A0 origin/kirkstone-next
 =C2=A0 origin/master
 =C2=A0 origin/master-next

Regards,
Kai

>
> Cheers,
>
> Bruce
>
>>   recipes-extended/ceph/ceph_15.2.12.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-extended/ceph/ceph_15.2.12.bb b/recipes-extended/ce=
ph/ceph_15.2.12.bb
>> index 6636d7a..693b525 100644
>> --- a/recipes-extended/ceph/ceph_15.2.12.bb
>> +++ b/recipes-extended/ceph/ceph_15.2.12.bb
>> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING-LGPL2.1;md5=3Dfbc09=
3901857fcd118f065f900982c24
>>                       file://COPYING-GPL2;md5=3Db234ee4d69f5fce4486a80fd=
af4a4263 \
>>                       file://COPYING;md5=3D4eb012c221c5fd4b760029a2981a6=
754 \
>>   "
>> -inherit cmake python3native python3-dir systemd
>> +inherit cmake pkgconfig python3native python3-dir systemd
>>   # Disable python pybind support for ceph temporary, when corss compili=
ng pybind,
>>   # pybind mix cmake and python setup environment, would case a lot of e=
rrors.
>>
>> --
>> 2.17.1
>>
>>
>>=20
>>
>

--=20
Kai Kang
Wind River Linux

