Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.5640.1621387435941829686
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 18 May 2021 18:23:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=LUOf4qBE;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0773d2c4f1=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14J1NsDX006002;
	Tue, 18 May 2021 18:23:54 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com with ESMTP id 38mctd86as-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 May 2021 18:23:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F8l3NTlIPJkSLoEaVHA/m1R+UQKN7f70j8WpHQ9kSJg+fbLdwArvVh2im6RfPQbUt2bosYNMbf8bK50eTEjWNMe+HfVbo6RQS/bzOWRoRo/wc0niYji9ghcYoRR6ktF5zi3PjumtBAZn2QkAe9p65cKtZr+NzGxgIOmbOsxqRIQSk12TIQn0UdRGNJ39waHKjrGMYqv4qbJBu58NmPa7Ckxvq0A+wDLJxXRyNMtkXhgDXw6EVC6Xd7r6hq+fdbnJqVtQ5ayMSe8ZolWnWE5mk7MXxBtcYWbCpKYIlhki0eiSV836kFRCar8tXXtz3oZkXFV5//RCE3ng5ylPdw1IXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8X8EoSUQUy1seYd167Ab/labX/Jdetjc26vuX+N8ZxU=;
 b=BkX7cdjzMtNQ3t4imncUisuIBD1yYeZKEQtZ67HRUiddlBz/7NN7IThuYnzkty1/nPVuim1ACLDeTcHTIGPLqcGlglvKVsCcFSJbsHW3rgt45JN3645YOCbaftuH6edVlyYMxviuJULfYW0XZsvLR/nnTvddjsjVVI+CncMkMVL3cCikpwqO+vVpjO1/bQ9cpDQ+A0gBzwlz4eGhsYKmE3RgjBqEeC7X7L7hEmm47rzWkYrpAXfq7hRnyPeEq2T8jbAhqdE002ohe8dvzcPLr1ZkTHMUTZKLmBt0HweVwAiAdQnfFmBAYt1QA7VjW0MCPIrCK5h62EB3rBNo+wXkPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8X8EoSUQUy1seYd167Ab/labX/Jdetjc26vuX+N8ZxU=;
 b=LUOf4qBEsIBhPJoxd+anIdwRr9OKX9CXV9/jAcYleIdfguh7kk5mgtZKZFPWBzO/HXNAinThU1i1moVbU4ubyLfVF5Jmxq32RQ/ODVAFDSNGm0wuvAujiUkXJOMtyed6JPXdpkLoHkuyEJHHug+yhASOKxCE9yfIa2D5PEGh730=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BL0PR11MB3474.namprd11.prod.outlook.com (2603:10b6:208:67::17)
 by MN2PR11MB4551.namprd11.prod.outlook.com (2603:10b6:208:269::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Wed, 19 May
 2021 01:23:52 +0000
Received: from BL0PR11MB3474.namprd11.prod.outlook.com
 ([fe80::b44f:4823:397d:6152]) by BL0PR11MB3474.namprd11.prod.outlook.com
 ([fe80::b44f:4823:397d:6152%3]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 01:23:51 +0000
Subject: Re: [meta-virtualization][PATCH] nativesdk-sloci-image: add recipe
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20210518045546.57617-1-Qi.Chen@windriver.com>
 <CADkTA4MR2hnoB73ohuDrwK7_aSy0ak8mkftb-iev-LyXh6NvXQ@mail.gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <f99fa35d-0f7d-6340-8e62-863588b6a4dc@windriver.com>
Date: Wed, 19 May 2021 09:33:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <CADkTA4MR2hnoB73ohuDrwK7_aSy0ak8mkftb-iev-LyXh6NvXQ@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0016.apcprd03.prod.outlook.com
 (2603:1096:203:c8::21) To BL0PR11MB3474.namprd11.prod.outlook.com
 (2603:10b6:208:67::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HKAPR03CA0016.apcprd03.prod.outlook.com (2603:1096:203:c8::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.4150.11 via Frontend Transport; Wed, 19 May 2021 01:23:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5803a1a-f04f-41fc-ca72-08d91a64c25b
X-MS-TrafficTypeDiagnostic: MN2PR11MB4551:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB45513063C7B4ABB9AD5B80FBED2B9@MN2PR11MB4551.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sTAMbeI5B6J9yKVk+svwiUPfUV4NIoGNsKlsPmrAWMTr87eMneZsgupkSJdW4BBw7E6w85UsSLscP/3BDveo60VebtROi4qyk8+YH2EgEBJx93G9nz30fSnvMAmSnC+G1IXTi6U+kwBGvHZwBVpgr2wSuBGREZ64/J4iJx1MiJT/orPEgKopzXnkTVftL+mmZwMK/e0YQyUnXwaZZetTzwjUwGVBltUo3v3Yj6GP1sMHj7dxXKvUDXn0uoIGCbdXAZ5oFg/lG4kMNzifzHwpCI01fpHX4NHbWkEHsKqmUlHC8mmYlAPufAee6D+0gzGrFmd12zQl/sipd/JPNjptE1ojXYbH9peP31qzzIlKQfvb+qeA6UwnlJDPo9DOliQy241GyiDbJpBkTcOH/N2W7Nswhq/hTnGssUFY6vO98eukVeZps7a6qGfn35IO8+tHVzTMNELeh8i0kDmZOMRLr4w3WOuteH61lxUOGummGavlitd6o7GA4BxhBS/BC4rbpJIVLsBHrtcD0Jtvxf5yaMIMysKyKL3JyxlhRQN5POzQ4Lh+XfsNN4ZSoEkRd+hlfAuUZDuIqp5t/t2Wem2Vl4RubiCvM7lqKoKTYwq2t9GOENTfbS1bAlsZBqrIr2wGpSexzOj7mzMaO+uwoKCFrztVwkz0rxx0/YB4ihPgHcFdXVEwwVjJGzYr/3eqtYKfgq5Lf08JZBCsTWrLkEsrGtnjqPKO+q8oIP50RUNilxiYL4iu5xTE87W1YaUjT2Yva/MYh1xWFPF7D+15nEQGxkEX04WRC9NfPgJit8UwRkFF2VsHLRR8F3hAG9IUy5CVnMFSrSeek3QTdkFNEV4vejzvorlpZvAGTMrVRihJouw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3474.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39850400004)(396003)(136003)(376002)(86362001)(2906002)(8936002)(36756003)(186003)(53546011)(83380400001)(16526019)(31686004)(5660300002)(8676002)(316002)(16576012)(66946007)(66476007)(6706004)(6486002)(966005)(66556008)(6666004)(956004)(31696002)(6916009)(52116002)(4326008)(26005)(38100700002)(38350700002)(2616005)(478600001)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?KzgycnRVWWxkdExIM2FacE5DUm90R3d5eWcxZ3FlOFpzQ0tLRU12Mzhwbitu?=
 =?utf-8?B?ZklheTZaVldCdXREY1FXTU16WUg2Z2VMenJ2aUpZVGJGSldIOTBJcmlMYlU3?=
 =?utf-8?B?Z0I1VTV3ODBVZDEwaDRGMmxpc0hWZGs2YVErcExoUGhHVGFFS0Z4NmVpSW52?=
 =?utf-8?B?VEVwaytaL3dwZ0Y0Rzg4ck44alQ3LzdkaERpVHJNbnRNRXA5dlFXNXUrRVhQ?=
 =?utf-8?B?anpjTVM3SHRzYlFoRGpNSWRjT1VhLzdyMFJCTnVjSkNGOTl2UlAwZGZmZEhW?=
 =?utf-8?B?b2ZFRVlXZ1dtald5ZUoxUmNvSWV2bVVnd1VMV0J4V2NRdHJ5ZzVRS0ZLV2pu?=
 =?utf-8?B?enlndllWZCs0V0E4T1ZqTmJYcEN4RjFHeS9xM1MrWHVhNFQyWXNXanBHZUxo?=
 =?utf-8?B?K3IyV0U2d3NpSmRaa1d0eGtZWlhkQzViK0RkWEtsbTJNOGxNWENrQUJmRngr?=
 =?utf-8?B?bkxyL1k5RmYvak03MDdsYzNKZG05bVAxQStubW5DLzc2QU56NCtjZzRGSUpJ?=
 =?utf-8?B?Q0Z6Z0dnUEYwbDdRV2FjcnIxWTBuOGkyRlpEd1N5SzJobnZHTHJMZTFjM1BR?=
 =?utf-8?B?NHFaTXpZWEpEQ3ZYVXk2TUZXZ21xcGJOZlZxNVM3Ni9qc2FpKzRxSys4VUhI?=
 =?utf-8?B?VVhEN3hvTndNN3JRN1NyWERoSHFxVHg0RG93TDZSRGQ4bFZ2R3NSNXpZQ3RE?=
 =?utf-8?B?RFRNOVNwTGhqelllbkpmZklscmJkS3RlT3pRbXBhdU1UakowWmUzRUh2Ti9z?=
 =?utf-8?B?bXpjeGVpRS9Cb21jVVI4ellpOENHeXd5NHpWbTNmYzhHWXVUb2xVUHdaWmt0?=
 =?utf-8?B?YVhFMmIxN3ZqekNXTEg4czJCeVppeFZsYmNtZW1XRUg0OHo1cXNKejhZTjdC?=
 =?utf-8?B?RC9SYmVrZXVCT1NsMi9CdDdVaVpmb0ttbTVjOFcvRFFrVnVmalFyZGM4b3pv?=
 =?utf-8?B?cUw2bUxBb3c1Nk80bmhIZGxrbWYyQm50elFZSVpXMGdIY1VlK1RKa2R1eTRE?=
 =?utf-8?B?MGVDY0lBb0tGNWRPMHd0ZVY0ZkVYMVhSWnV2ZDNUNFB0M2VrQ1NvWDMxN2Nx?=
 =?utf-8?B?bGhTaUZId2J2RGEvVHQySDVLblFxdktWV1doaHdaUmF4NHZxbGpodXdaaTJp?=
 =?utf-8?B?a3pNK0plcDdpU2s3ek5iQkVjc0ltQjcwZnFRNC9YUXY5QnNROVRmRUJzRzBK?=
 =?utf-8?B?bmRIZWdTZFExMy9sd1JwSUlvM2hEMXNVaEdrNm5NYkl4ZzN4R0liT3ZQaDhO?=
 =?utf-8?B?aEFzSWFtcTVOOTF1ZWVqTzRIOWo4RU1nb0R4bytBUHVPaTJIdmYzZ3lxeHNo?=
 =?utf-8?B?VDlDdEpid2F6VHVzbXZhQlVjQVlxNVFaS0MrbUwrQ1I1Ulc0YVJ2MDFiS0Rp?=
 =?utf-8?B?aU5NSnY5NFB1bmNTUCtNNGorTGNmTmlINEtxK2FmYzQ2cm50NlpPaE92TjZH?=
 =?utf-8?B?M2kzZjNLNjBaYzIzMmZGWXlyL09RbFF6ZVJsSHBmdGZxK3BFa05HVGE5VG5q?=
 =?utf-8?B?TWxxTUQ3QzhyaFRKdS9hOFBjRzlRbURyS2FMVU9lRVZOYVpEdXI5aCtHdnFN?=
 =?utf-8?B?ZEl5L2wwbDQrdnRnNHdPa2pUZVYvTDVlSlhzMWJ1Ujc4aVhvOFZ0bGhjK0Ri?=
 =?utf-8?B?cmZVNG1kZ0VWZHFZa1R1ZTdrYzZISmx4RnorV1BWNEdpWDF5d0RiL0hTM0Zl?=
 =?utf-8?B?M3JNdXhkcFpKVGhHOHpOTFI4Z1pGOFJVN3hJUkRqZ3hBRFkzcDloV3piYVhN?=
 =?utf-8?Q?cXBOIIFZHLyaMY93jXc+UNcc90yOarYvgSnYlvB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5803a1a-f04f-41fc-ca72-08d91a64c25b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 01:23:51.6728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yQW36nE66AzyCqhXvLZWZe+YdCCs1hzuoRNasF4l+JIlWkzhZyRhz/nJl+5t3gMbEbthUmC9bRHiJtcferLFQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4551
X-Proofpoint-GUID: cS_w2HWbmolwY0u4x152u6L5U98bsyD4
X-Proofpoint-ORIG-GUID: cS_w2HWbmolwY0u4x152u6L5U98bsyD4
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-18_11:2021-05-18,2021-05-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0
 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105190006
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/18/2021 08:03 PM, Bruce Ashfield wrote:
> On Tue, May 18, 2021 at 12:55 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>> Add nativesdk-sloci-image recipe which is basically from the
>> sloci-image-native recipe.
>>
> Copying the recipe is a bad idea.
>
> What's wrong with just adding the inherit nativesdk in the existing
> sloci recipe ?
>
> Bruce

Hi Bruce,

This is because a recipe cannot inherit native and nativesdk at the same 
time.
Hongxu once sent a patch to rename the native recipe to 
sloci-image_git.bb and use BBCLASSEXTEND = "native nativesdk", but that 
patch was rejected.
So I figured that adding a nativesdk-sloci-image recipe is only 
remaining way to enable nativesdk support.

Maybe I should extract the common part to sloci-image.inc, and the 
native/nativesdk recipe only contains two lines like below:
require sloci-image.inc
inherit native (or inherit nativesdk)

What do you think?

Best Regards,
Chen Qi


>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   .../sloci-image/nativesdk-sloci-image_git.bb  | 27 +++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>   create mode 100644 recipes-containers/sloci-image/nativesdk-sloci-image_git.bb
>>
>> diff --git a/recipes-containers/sloci-image/nativesdk-sloci-image_git.bb b/recipes-containers/sloci-image/nativesdk-sloci-image_git.bb
>> new file mode 100644
>> index 0000000..3c2b539
>> --- /dev/null
>> +++ b/recipes-containers/sloci-image/nativesdk-sloci-image_git.bb
>> @@ -0,0 +1,27 @@
>> +SUMMARY = "A simple CLI tool for packing rootfs into a single-layer OCI image"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=948cd8e59069fad992b0469af9ad7966"
>> +SRC_URI = "git://github.com/jirutka/sloci-image.git \
>> +           file://0001-sloci-image-fix-variant-quoting.patch \
>> +          "
>> +
>> +
>> +DEPENDS = ""
>> +
>> +SRCREV = "4015e49763e5a738026a5bbfcf32b38b5a4fa650"
>> +PV = "v0.1.0+git${SRCPV}"
>> +
>> +inherit nativesdk
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +do_compile() {
>> +       :
>> +}
>> +
>> +do_install() {
>> +       cd ${S}
>> +        make PREFIX="${exec_prefix}" DESTDIR=${D} install
>> +}
>> +
>> +CLEANBROKEN = "1"
>> --
>> 2.30.2
>>
>>
>> 
>>
>

