Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.9136.1637329422000019556
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 05:43:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ayrDeILt;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=695783f828=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AJDePhu003250;
	Fri, 19 Nov 2021 05:43:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=4+n0YCj46EuIgZIfrdp4E4nx4+A9etGBoyJ6GhJuuJI=;
 b=ayrDeILt1fZnkPEWKWl83e5nvuXYBw3xWb6c4ybAUJvns8vtPFAGsySHU1RhPB1K/2Xz
 sfyL6a6LGLi4ugVgxB4MF6qViB4tTPdVTRsrd+eVyA6OIVX5TY3FhT6c0AB59y6LwhC9
 N2m46qPsTu0dq3AsYLHyDPdpsgGsqwL+wZLBcuIpRj5zuNoLXHWSpnerQn5knSMlx1vD
 c23fffWjENwQP8aKBszDLbp4k0tvXm1d85TTfiISFpbpPA1FuOpYfl1OJy1xGeMfGxOr
 yGMKFl58pvgMi+XoSF+uLDNJMZ1ULsbzSbCCfYFiytt3gD3ourN24g7MiCOwX3VGHOnC Qg== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2046.outbound.protection.outlook.com [104.47.51.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cdssgrvrb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Nov 2021 05:43:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=boSP54D1glWXcjNQ7bRdwJk7ap4AAcBWUclcYEBRgzAVIkOLdGM35UzGalrSIlLFkeLvt6hcPnUKgx5wK46ceka3nfvu9CcKfwkR0XjiE/JftnYjpQsOH3ympW/u2ZdCdJO3a8VbTaHGefwe9PqYTJHutYUSSD6k6nXh3jguCphHNHw/JO6KyqsGimiPdzY5Z8xfoKal+lGxDDLQODrpOT5V93VSYxjCJcp8GTVXzQXhxAplKx4bAvRJ/sA8vVE7POolxZFlahQUx1HUuyb4twy1q3nh0UBUZts5MQ0SyLGjV2j2grIIhzfNhGkXgnkJ/FL5JRK2Y0HMNED9Ur1ouQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+n0YCj46EuIgZIfrdp4E4nx4+A9etGBoyJ6GhJuuJI=;
 b=bECnde0Bof9N/4JnF5T93J0xfbAeWeVBXGVHT69xQkgoWVwGJ67rbBa8E7gCR2LEw7Sa8qZxutDHk/IwbfX8zbyuN9nibt9eG+hN4mOE90tYbl5kTIoMMlZGzWc92v9s0UcBaRqvdDdT1md3T7ESf03I0KBQPvZ4oDokSp5O+QQfarSniS+TkL72xESZ53VPUbCFTEPa8Gh4wNZfBQhZYsJVJuY7RuEyUY89ju62MzokHjdqitNLLHSQguW3o9T435biBppKIBWyZEmOu4SY8BzoFQm9jU5rbQgNtqYJa+u0AVcRVWt+MCR2ykdS7iaiaXZ5EpUO80xlwI9is0ytzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by CO6PR11MB5619.namprd11.prod.outlook.com (2603:10b6:5:358::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 19 Nov
 2021 13:43:34 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::4c98:111b:1f1e:898f]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::4c98:111b:1f1e:898f%6]) with mapi id 15.20.4649.015; Fri, 19 Nov 2021
 13:43:34 +0000
Subject: Re: [meta-virtualization][m-c-s][PATCH] concurrent-ruby: add explicit branch
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>
References: <20211111100725.38963-1-kai.kang@windriver.com>
 <8552b0e951af4cd1b9a0a7d945ccef85@axis.com>
From: "kai" <kai.kang@windriver.com>
Message-ID: <b0b589fc-7e2c-6653-24f1-1bb44ef2c8db@windriver.com>
Date: Fri, 19 Nov 2021 21:43:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <8552b0e951af4cd1b9a0a7d945ccef85@axis.com>
X-ClientProxiedBy: HK2PR02CA0188.apcprd02.prod.outlook.com
 (2603:1096:201:21::24) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
Received: from [128.224.162.156] (60.247.85.82) by HK2PR02CA0188.apcprd02.prod.outlook.com (2603:1096:201:21::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend Transport; Fri, 19 Nov 2021 13:43:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74b3d2fb-2cc3-48cf-6d51-08d9ab6294c1
X-MS-TrafficTypeDiagnostic: CO6PR11MB5619:
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB56193FC0D35588402EEC86B3959C9@CO6PR11MB5619.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5DMXXyk4hFU7P8T6llng3ZL9s5plZlLtfYRD7LiK1VX6OGpgCwyatyY1534KWh8CBm/fL3JxNtN+M1/H94TDO2aPckPPS9HXcXc+vqAjbivUo35CXjiB8T56e3y81Vo4H/Ju1CUAMEWvmVf9WqWRehBRdAQfcbgVOYnEuSvz40mw3bvueUM6bMS0QEL64ni67QMukXz1HIg/FnISevM7/ONkIr80o69YrDmvNg9HRLUdYuQk025KfOAhJGEX/PiJ9oapM70kvWRXSJtZE8bXz43Syuf1V4jOFXaGZ68bLINgOGrZGjjsNqCgSGND2uTOceViK/TOw71ut7oVqMQ4fv3veI44SiymgIVLskGd4sWO4VFZCe+EU5z8SCvJcrZC0e/4BaOyGF5lXeYzKlX28DwSZZp50fgasiPD8RdinqiB2pqGKK831tkUM/1pyNz+ZIMv67S1y1QtBkLsMM0PhzMn53tzi1qPW113UK7oTiMkJTdxWOOX3bdNCeQN1x545bSn4XFgtqvniX+2WbdUw2Rr2kgu8XMGia8LKQAj1z01o6p5cpoHUm0nYJF0SbV/T4mcdkwMmrWdnFF/gj60a5ojWQuMsenofTCMUKs7k69DBurxKOwbpdj3vrZcB6qRKmwBzNU4jJjnt5K/yclTC+5CyX9S2J/Et+/M9sXnXjbd9DJ+mScK3XaNJE0Cs1eHaHH4NTL0QAYHT/Q2ECPPYzcgPMA5giF9eBR1+XH2vwwnejix8c7OPL3iu5X0hapuSLkmquONqeuw0TCfXr037r4qX9C6ZwrBY6zZz4k5XjE1qP0b4U7MhGYrpo7AJhpo6CjsX+0Iwr/nq75wUJWnEDO5XKotPF9OYBC4GMA2p0Nk2c7d+76yQqdgl3HV/Gsm
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(2616005)(16576012)(6666004)(38350700002)(31696002)(6706004)(26005)(956004)(8676002)(110136005)(6486002)(31686004)(66556008)(66946007)(186003)(8936002)(2906002)(36756003)(38100700002)(66476007)(53546011)(86362001)(508600001)(83380400001)(316002)(5660300002)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S0ltYmVRdmJFcVhxRDVBMUlzOWVrYVFsdkpmbk14ZEZzTXk3VlVSRklMUGkv?=
 =?utf-8?B?bTA2WWFoZjhHMDJQbmVUbWNDeFNYQkF1aCs5eTRGR1dlTWd2Rk8zS2tmdU9x?=
 =?utf-8?B?RktsWTYyVVVQWmEvVWlEYmhieGVLQ2ZzR0RndHd6cjhaOTlVWE5EVDNNUS9I?=
 =?utf-8?B?Sm5uQm1HRUVXV3V0dnZEdk50TmRDUXBqOGZHSlZPWTM3UVRONU5zTzROd2tI?=
 =?utf-8?B?N1FDbmdTS2h5NzJDdUs2WTZIcnRSd2thT0pZcE1FUjg1VG9RNUVIbCtpSU56?=
 =?utf-8?B?THlmbEdGYitERThmWWRkRVc5Uk5sb1l5RThYN3NZWTVrcXRJUFY2UXFYeDBW?=
 =?utf-8?B?bTFaOTZ0RXFJMUF0Zm9CZnNrQjl2K0JVSEF5VXpweVhXZDBCM2p0UE9MWm03?=
 =?utf-8?B?eGhhaURjRlZ3bXBkMXpFWU9hdHpmUFgvdmxTQjFLeDFlZ1o4aFBZNFpQNzFH?=
 =?utf-8?B?UWkwNElDRk5ZRVVtTVFPR2NqZmZMMGJIdkdHUlBQWlliSkoxTkIyYmtYeENW?=
 =?utf-8?B?STFOY25YRkRoM013WEttR1pvVUZSWTlLYmZpK2tXN1d2dHUweENVSDNsNFdy?=
 =?utf-8?B?MFBta01TZTlMeTI5N2NtNmlBTUkzcWkraUYrZEdCYTlhdkY3TkcxY0ZuTUlH?=
 =?utf-8?B?Wld1R05XUXJKTk5DVkx2VXZUQVpuQXJnL25nZXpZR01IVGljVmlwZ2FWdCtR?=
 =?utf-8?B?Z2FwRjYydjYxWHMyVWM2WGt0SG9MbUpOb0VqcUx2Zkg2ekx4d3FLNG5SL3Fh?=
 =?utf-8?B?RGZKS3FlTzlWaTBJSmwyaTJ6UDlPTFI1WlB2Q2RFL2JPUWpDRlpZamtKZEpm?=
 =?utf-8?B?T2lYV25jWDN5OXlucXhzVkNRUk45RDg3YVVFMVNmcGVMQ3YwWllLeWxoVUxV?=
 =?utf-8?B?ZngzbXp6QjFyS3llS2UxK0J4QmV6dXRXaEJLUURIRGdkelhyUnRBTFdlVXRE?=
 =?utf-8?B?VHY3eGhhWUV1amhsY1FaaFhlU2RLWjlpUkFFWlF6Q2RCRWROSnBrZ3dxV0VC?=
 =?utf-8?B?LytNNmVWM2ptWGN6VGh3NWdWQW9VdU15WWJVS0VUenlLc2w2L3JrY0tka0xv?=
 =?utf-8?B?Y2pSRHh3SUVPMDJyeTYwVm11bTRZSzBJZzRuRTVtZkdnUVlOaW5IeEZORUNM?=
 =?utf-8?B?ZTFQQWNrMjErMEh1ZGxoRHRqZ3FHa1I1V0FuL1NGV2swelJ6Rm1ZRUxZS0hM?=
 =?utf-8?B?YVFhbElndndMbnZidys3RmdWZkZ1UzRwdmVFVkZ4TDdCcktBRDlXeTc3Sk1Y?=
 =?utf-8?B?WTRSVFVkejRORUNmejg2YjUwNkk2TmZVTlh4R3UxNENwM3hsVERacFFQellG?=
 =?utf-8?B?RUdudUZ6VWpPZ0JVVG1aWkdiSFJnd0F6NmV4QVRGT2tnNGRjanpaVGh4bjEy?=
 =?utf-8?B?blo0eWVUc3VaUlVmQ09YN004ZGhSVmVnYnd5UlpwOFpkUkNZeVhwdi9zU0tU?=
 =?utf-8?B?VStCMTI0bXBzRENwUDY3cFR3L3YvcGFRL0pXaXlkRklUVzhNbWdURE9IMWxu?=
 =?utf-8?B?bEtxc2hEc0ZIU2FsbEdyZlN2a2dYcGwzalM1VDM4YmhTUUlNNmtMVk90NkF2?=
 =?utf-8?B?VnMvU295TUFpbk1HWHdMcmNHa2JPVktyMllyUEFQcTFrS3NxTFFFSml0eGhi?=
 =?utf-8?B?VDdVQlFKaHdsN21DOFJMaEdKR2pqb0RCL2dwTFFIbUplVW9NWnFQSTJrcDFq?=
 =?utf-8?B?ekhXK3l0VTNhVTh1cWZDNm55akszS1BZd29RWWVuMU9iaFNPRUg0TmFoZlFD?=
 =?utf-8?B?a1JkYkFUU0w5VjBNZFZUa3pkUkdqazUvdXB4MGEvdmhTZXB2RDhyOHZGdEow?=
 =?utf-8?B?dERGN3UyelpJRVhvQzkwTmJ6dzNLYXp0djRvOWVFRXFXMFVqRUg3NWE3OVZk?=
 =?utf-8?B?RHkxV3laZjJnOGFRb2FFeFpQc21yRWhKc2RpYTl0WkFCQS9rdW9OVVUzMnhX?=
 =?utf-8?B?aENVZWtwd0dMemFzbmhGVEJITGJXUDYxakpkM3B4Vld6MlJ4d2syOW1lMnVL?=
 =?utf-8?B?clYzaHNuSUsyTXlTbmtlN1dYa2ZIWjkzUzhuMUZka2ZpT0svYVRHQkQ4a3ov?=
 =?utf-8?B?VkpWUWJxY1VyVlQzUDg3U1JhZ2dCUElSb0ZNVTE4VkxnSkdJRzd5SkF4aHBt?=
 =?utf-8?B?RTNaeXROVVR0aFc0c2V4VUcrM0lUTm1QVEY4Y0tKSzRmZUtaeENwNjJ4Q1Nk?=
 =?utf-8?Q?jwkxcKV1WIFFtdeSWswF1JI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74b3d2fb-2cc3-48cf-6d51-08d9ab6294c1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 13:43:34.2038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y0TPuRrKrU/Z+h+iYe4Fw+7yQYlh3y/2qh1ATVqypHfZLKoHoJHu3U8Krubuzn+aZMh1hWYJZ5XVE6r+F+WGcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5619
X-Proofpoint-ORIG-GUID: dguCXQA9tyJcL_4eT1XrTKYN3-LarmPW
X-Proofpoint-GUID: dguCXQA9tyJcL_4eT1XrTKYN3-LarmPW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_09,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=621
 mlxscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111190076
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 11/11/21 7:05 PM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: meta-virtualization@lists.yoctoproject.org <meta-
>> virtualization@lists.yoctoproject.org> On Behalf Of kai
>> Sent: den 11 november 2021 11:07
>> To: meta-virtualization@lists.yoctoproject.org
>> Subject: [meta-virtualization][m-c-s][PATCH] concurrent-ruby: add explicit
>> branch
>>
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Add explicit branch master for concurrent-ruby as the same for other
>> recipes.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.6.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.6.bb
>> b/meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.6.bb
>> index a328203e..61a2c598 100644
>> --- a/meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.6.bb
>> +++ b/meta-openstack/recipes-devtools/ruby/concurrent-ruby_1.1.6.bb
>> @@ -4,7 +4,7 @@ HOMEPAGE = "http://www.concurrent-ruby.com"
>>   LICENSE = "MIT"
>>   LIC_FILES_CHKSUM =
>> "file://LICENSE.md;md5=fde65ae93d18826f70c6fe125aa04297"
>>
>> -SRC_URI = "git://github.com/ruby-concurrency/concurrent-ruby.git;protocol=https;tag=v1.1.6\
>> +SRC_URI = "git://github.com/ruby-concurrency/concurrent-ruby.git;protocol=https;tag=v1.1.6;branch=master \
> While at it, why not remove the tag= and replace it with a proper
> SRCREV = "<sha1>"?

Sorry for late reply.

I am not sure which is better because there is a tag with branch in 
SRC_URI in meta-oe. If you insist remove tag is better, I'll send it 
with v2.

Thanks,

Kai

>
>>   	   file://0001-Removed-check-for-concurrent_ruby.jar.patch"
>>
>>   S = "${WORKDIR}/git"
>> --
>> 2.17.1
> //Peter
>

-- 
Kai Kang
Wind River Linux

