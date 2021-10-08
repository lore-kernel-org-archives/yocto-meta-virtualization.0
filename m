Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3979.1633660858344967667
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 07 Oct 2021 19:40:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=QSSoYKR8;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5915bed3d4=yanfei.xu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1982euhr007882;
	Thu, 7 Oct 2021 19:40:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=OHtEqGx6sRi6ekhH6oyNEZohA6i4Ry2b96PpCXWgX3I=;
 b=QSSoYKR8Ps6pSGys48UYuwSTkZoXuhUzEu8Kcul474F6Cp5Pt5AZDQsM0B25+1OxlkoX
 RyGxuMKaMSJaO6OriJwTKMXFyovQhYjQLABbvP61bMad4tig8Myx6E9dEsHdwpNscby7
 SkbvAZX6gLGpQuWoMiW3+8FiwkHD26yLo0wdPV4gZU+jDNXTOjMjn6NQsydesEp2eUOw
 NprC7/GHxy9vOjS3XOsQ4gd5dJQ05ktTWn0RPjbyPDI/UYZnYGXcip6RdwNwzs3hzb5F
 saG2958zV2UCENGsRmZCuMH48z8vvjyrPnoGqx5UrGzaitfpvK5BN5g4A3Q8HZrx20Ws wA== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bhx4n8su1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Oct 2021 19:40:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X10qwRk3n+6s/Fkr6+XMkNqfSwUOxlyP5MV8oAVsxfeD+F6dDDblhFt6QrqAJedNiFUrXx8xRPtK1svA0WFJ3oYW9//V5T5by34DphXczo6CwP8a059GQ+ER81tB2YGP2ieUIJlSpJn6/FMG9fd5f5wzzM3HwOlxeNdNQr+HJCT85T8KS78cNuC7tKGcN1IU9LM/BlBwmopuXjIwnNhjoivoHU6ikPYCltQOWpg0dwsBJ1T1Wc7ZuirR+bCybDcOG4BQZEu/OgNG06tpAFSsD+V5ZmqnhfzWAQbGZqfN4IXhZeBfJ8ox6ODLwNeEEPJC65Lh34ECMANUPBCTr3b4mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHtEqGx6sRi6ekhH6oyNEZohA6i4Ry2b96PpCXWgX3I=;
 b=R1E7vnmOtP0gJ2WomR1oHytUOxvVrKzrZT259zvgPkuOXkvs15QXP5Ym18r2f4WHBxqX8aAuyt5K60GkCT/+eqpqiqtmAQm81VH/obYIdSUt84JHtvkGvzHNUaOFTCtc5j7DnmFxOtnvJjXW9KqXWWzfnaLXaSYyPctj6F/6oiJMWT7ea6p5sk4eWs1f92UjVtFnHqikODbbrTJm+diXnli2oIeXoolM7UZxPRteyOflshXsIDR+QiikE55Y4PQ/6TYjY8WnjjF4wTFpa8ismnJYR5B2sX4DHtaxdBL6UZ4YBXqbn4lqdtt5dEyb/vTTZBzte3HatfeGD20z0NiB6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM8PR11MB5734.namprd11.prod.outlook.com (2603:10b6:8:31::22) by
 DM5PR11MB1484.namprd11.prod.outlook.com (2603:10b6:4:8::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.19; Fri, 8 Oct 2021 02:40:50 +0000
Received: from DM8PR11MB5734.namprd11.prod.outlook.com
 ([fe80::5db7:737e:8ef0:c831]) by DM8PR11MB5734.namprd11.prod.outlook.com
 ([fe80::5db7:737e:8ef0:c831%4]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 02:40:50 +0000
Subject: Re: [meta-virtualization][hardknott][PATCH] openvswitch: Security fix for CVE-2021-36980
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20210929033648.2372012-1-yanfei.xu@windriver.com>
 <20211001025058.GC11771@gmail.com>
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
Message-ID: <e9dc6586-de7f-01fc-902e-674bae9b3c99@windriver.com>
Date: Fri, 8 Oct 2021 10:39:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20211001025058.GC11771@gmail.com>
X-ClientProxiedBy: HKAPR03CA0012.apcprd03.prod.outlook.com
 (2603:1096:203:c8::17) To DM8PR11MB5734.namprd11.prod.outlook.com
 (2603:10b6:8:31::22)
MIME-Version: 1.0
Received: from [128.224.162.160] (60.247.85.82) by HKAPR03CA0012.apcprd03.prod.outlook.com (2603:1096:203:c8::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.5 via Frontend Transport; Fri, 8 Oct 2021 02:40:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37bf0ff9-d440-4898-b858-08d98a050a6f
X-MS-TrafficTypeDiagnostic: DM5PR11MB1484:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB148490F16B9F9A85EA938DCAE4B29@DM5PR11MB1484.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vgOI5BzyoERl3pMSGs0D+R3cpx5A5FghUIULqJzvkk2l+XNd+052mw/cYcE4iUd7Tvm7ejDlazaymJ4xdMlWqT+N2+OwnQOQi39TM/3T12lUVHcYscM60ZTV4q8w7AF0qXDATbC5m0iZg27Jpvz3WOr7SJJsUVRlWT+LxlSf97q6G59dt3EZbb04uIA2ps6yhZtRganaVCtpTp4JE+14tseHzOuDEKLgQagkb21CZlqZL2ANzx/8EqN3CQXLNbi/CyJfMyxEfpa6QWyKtImQVw+j4/3vkEafueP8C1h1g0bl3ZoJIYerCCxkmPg02vGquzw5n8Qqhjpprvz802uQbimhNiatGo5PE8DtrYqAVDuoty5v9tD6ZgZGwi1OqsKFpkq3nCG8bGjy5ox/QGt7RDMVhpX+pRpUOOWr693QBzkWIt/Rr2vfx/AX1iqXP8xEFXq2VblNOx1Fd8DJbWE2tY3RepGb1jGhh1vMRBa/k+V/bm+fcos/vh4OYXeml5lLCoWy/znAECFZh0j89QL5LzSbtnhpmXc+Q3umAt7gsYLlaO+KCDgHjvh9k1EFbn2W7iHKlaPS5LjXHXdmEawqERgMk7WdWG0C0wr8cMWDpqc0luP++IKUqgbXOtEqvdlU6jGll92goy0VGYtDT9vc3IFSSS7s9Fn4YE/UkXToZyVXRfJzF9ta7nIzl3Go4rA7IqJYkL+TpD1ykrvywWomvZP5VKH1KN2ox7zYnOlmEzRdlfqfrvwM6voq4K6QndSORtXSPGC7d6lb6brrA0ZcrWkE/f7ljEKRkjp0y1ZBKAU9ZbxfsWBE01HFAuG5DHVNX/p5sgi9eETVqIIwp+F+Qaxrk5Y471rlYsIrei/t53XW121RSQW7k+kwZi0ujUqfEZ1aSslA03XPJU1E2/eC+w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5734.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(53546011)(66946007)(16576012)(66556008)(8936002)(66476007)(36756003)(186003)(26005)(316002)(6916009)(6706004)(83380400001)(8676002)(52116002)(4326008)(31696002)(966005)(86362001)(508600001)(6666004)(956004)(38100700002)(38350700002)(31686004)(5660300002)(15650500001)(2906002)(2616005)(6486002)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bDFkMTAxREJpZTd0WFQ0cnRXWW9tUWg0R0M4UHVYYTU4UFp4TlowY1p5c2Mr?=
 =?utf-8?B?Tjg4UkpnajRablhJMGpLMVN5NDEwNWVId2krRzB2NU5MZU1IN0dFMC85Yys2?=
 =?utf-8?B?S05DSmllRUY2c2xDTGF1K1VaY1d3dTIxY0RLN0NoZ2cyeGdXbXJPL1RvVGpx?=
 =?utf-8?B?L002SjNXaDQveE8rTVZtbC80ekZBU0svRk1iaXpjT0NvbytLUktWdjJTWE83?=
 =?utf-8?B?ck9mN05Nb2owcEJTVERhcUh1dzV3MXJtUFBTU1YxL1hRZ3ZXc0ZCT0tWWWVk?=
 =?utf-8?B?a3VpT3V5NDBxZjRqY3RIVHF3bnpwWUZWRWxVMlRyVzVraytUSk9LNVc0c2k5?=
 =?utf-8?B?Z0lkbGtYUDRvU2FMdzAzZXJiWEZma0hXWHVnQmlxTndxQ1Y0UUtjNmFQVjhl?=
 =?utf-8?B?YVQ2TVJ5a1Y5V2NTUXIvWUhBN25sR1NoamZMVWxRV1JJYWh3ZVdvSUZMRlU2?=
 =?utf-8?B?S0RhaGNndDhrcTVqT29FT2RYL002SHczVE43eWtSblpERVp6aWx6S1pwWTRl?=
 =?utf-8?B?Y1hPUUNXakc4VFhsOEtDRXY4bnN1UWtFN0JNVERLazI5WHY0T3pLb0w1Mmkz?=
 =?utf-8?B?QlVKMzZ6RTAxa01wSXhjelA3bThPR0I2SkVaRzVtSGhoeDR3bEF6L1EwNHpn?=
 =?utf-8?B?SmI1Q3hXZlhJS2tJcmtrZXZrVUtvL2tFY3NWbnYrUXAxMm1WbGJWbHBycUJ0?=
 =?utf-8?B?TzlYNlZSV2N2OHdPRmg2T0VLU2dIclFINHUwdjMydjBDSzNOVng5WFFXVkVF?=
 =?utf-8?B?bHRBYlU3NnNoZm0yaEJwQWl1dnNzZUFOYmlPVGEwM0gvUVdDWkdva0dvZWdJ?=
 =?utf-8?B?Ni9meHRwSWVrSTF3Qm9nNk1TeHFpSm9jODdiM1VXeStpbi9zeE5RT0p0enBC?=
 =?utf-8?B?RTZmd3NaeVZTdFhQWGx4RXQ2ZXhCbC80Z3J0c1owTExRNElzYXRFTEN5dUxr?=
 =?utf-8?B?cHJadWszdm15bFlYbm1YWlJqRDNCWXRQdVZUODZ1bGVNOThpSWtIQkRoSEM1?=
 =?utf-8?B?dmRZVWUzWUw4STV3YXQrUTNRZS9MbXhpUEZHUE5PVVJoV0NGVTNJL25BMWdv?=
 =?utf-8?B?ZVpXWTNteEhVRktSVlNDeE95K2k1ZTArakhXTWhrb2xwZ0lwa1NvUmZLOUpo?=
 =?utf-8?B?OWVqc1R4Z0ErRTZPenE5VEF2K1dHc0pjODJYY0VmMWpQMXpuRU4wSWlUSklk?=
 =?utf-8?B?OWcwbjB4RDM3T2I1TFQ1SlNtQ04zK0hlUmJHTGE4Zk5XaVMrVWV2cTR3Qkpj?=
 =?utf-8?B?ZGkrUnJMU2pnVDJ6UVM4ODluSi91bnFpQlI0b0NTckVuNjU1cmNjL2tlUG41?=
 =?utf-8?B?Sld4T3hxNDluYWo0NjRrZHl2WUpuVzVPditYVm85L2VhcEpEUFh6ZG1udFd2?=
 =?utf-8?B?VXNpa0NJRTRrSEJYYktnNmxHWXR4dUcyOGhpUE93SFNNRzhZVlR6U0xhZ1Nt?=
 =?utf-8?B?b09BU0tPQi8yTWE1UUpuUzVpNDRtQndMWkYwUm0yQ1JodFAzSWJWNmlaamNV?=
 =?utf-8?B?bUNnTmh4MHgyTjRtRXZYUkZjQmxYZUs4NU4zU0h5VVB1cTdEeHVmR2I5VDkz?=
 =?utf-8?B?S2w2b2lYc3I4ZENEY0tkVWp1WGtMOHZGSE16Z2ZzMEd4U0Z3MDE4SndNNzhY?=
 =?utf-8?B?RU11a2lKUE5VK055L3pHNUcvWVpuNVNDWnR6YlZuRHQvb2FJaVhlcEtrS2xn?=
 =?utf-8?B?VUN3STV2SUxJSHpONlUxb3kvRmhIRDRRazB6UzlabStXMlZxSjlUZE5pVzYw?=
 =?utf-8?Q?5twjd8ospWRkFjdbb0jEP0TSJuQgeAEfM8bH4ZH?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37bf0ff9-d440-4898-b858-08d98a050a6f
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5734.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 02:40:50.7086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 34f0eMFPPMrB/xzshiW4+199GyHYvEh5Rz8XsZ0ZdfT27Vv6kK6TiYkOtYzNCaLS/mc6ghcytqlGq0CxNbZhRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1484
X-Proofpoint-ORIG-GUID: Ra0cjxvwoindLpap2VSjZKepNl2vtYBU
X-Proofpoint-GUID: Ra0cjxvwoindLpap2VSjZKepNl2vtYBU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-07_05,2021-10-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110080013
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 10/1/21 10:50 AM, Bruce Ashfield wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> In message: [meta-virtualization][hardknott][PATCH] openvswitch: Security fix for CVE-2021-36980
> on 29/09/2021 Xu, Yanfei wrote:
> 
>> Open vSwitch (aka openvswitch) 2.11.0 through 2.15.0 has
>> a use-after-free in decode_NXAST_RAW_ENCAP (called from
>> ofpact_decode and ofpacts_decode) during the decoding of
>> a RAW_ENCAP action.
>>
>> Reference:
>> https://nvd.nist.gov/vuln/detail/CVE-2021-36980
>>
>> Patches from:
>> format-patch from ovs v2.15.1
>>
>> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
>> ---
>>   ...use-after-free-while-decoding-RAW_EN.patch | 101 ++++++++++++++++++
>>   .../openvswitch/openvswitch_git.bb            |   1 +
>>   2 files changed, 102 insertions(+)
>>   create mode 100644 recipes-networking/openvswitch/files/0001-ofp-actions-Fix-use-after-free-while-decoding-RAW_EN.patch
>>
>> diff --git a/recipes-networking/openvswitch/files/0001-ofp-actions-Fix-use-after-free-while-decoding-RAW_EN.patch b/recipes-networking/openvswitch/files/0001-ofp-actions-Fix-use-after-free-while-decoding-RAW_EN.patch
>> new file mode 100644
>> index 00000000..c88c097d
>> --- /dev/null
>> +++ b/recipes-networking/openvswitch/files/0001-ofp-actions-Fix-use-after-free-while-decoding-RAW_EN.patch
>> @@ -0,0 +1,101 @@
>> +From 802a31a7070cea910b95d7e926c9da30a1f9e54f Mon Sep 17 00:00:00 2001
>> +From: Ilya Maximets <i.maximets@ovn.org>
>> +Date: Tue, 16 Feb 2021 23:27:30 +0100
>> +Subject: [PATCH] ofp-actions: Fix use-after-free while decoding RAW_ENCAP.
>> +
>> +While decoding RAW_ENCAP action, decode_ed_prop() might re-allocate
>> +ofpbuf if there is no enough space left.  However, function
>> +'decode_NXAST_RAW_ENCAP' continues to use old pointer to 'encap'
>> +structure leading to write-after-free and incorrect decoding.
>> +
>> +  ==3549105==ERROR: AddressSanitizer: heap-use-after-free on address
>> +  0x60600000011a at pc 0x0000005f6cc6 bp 0x7ffc3a2d4410 sp 0x7ffc3a2d4408
>> +  WRITE of size 2 at 0x60600000011a thread T0
>> +    #0 0x5f6cc5 in decode_NXAST_RAW_ENCAP lib/ofp-actions.c:4461:20
>> +    #1 0x5f0551 in ofpact_decode ./lib/ofp-actions.inc2:4777:16
>> +    #2 0x5ed17c in ofpacts_decode lib/ofp-actions.c:7752:21
>> +    #3 0x5eba9a in ofpacts_pull_openflow_actions__ lib/ofp-actions.c:7791:13
>> +    #4 0x5eb9fc in ofpacts_pull_openflow_actions lib/ofp-actions.c:7835:12
>> +    #5 0x64bb8b in ofputil_decode_packet_out lib/ofp-packet.c:1113:17
>> +    #6 0x65b6f4 in ofp_print_packet_out lib/ofp-print.c:148:13
>> +    #7 0x659e3f in ofp_to_string__ lib/ofp-print.c:1029:16
>> +    #8 0x659b24 in ofp_to_string lib/ofp-print.c:1244:21
>> +    #9 0x65a28c in ofp_print lib/ofp-print.c:1288:28
>> +    #10 0x540d11 in ofctl_ofp_parse utilities/ovs-ofctl.c:2814:9
>> +    #11 0x564228 in ovs_cmdl_run_command__ lib/command-line.c:247:17
>> +    #12 0x56408a in ovs_cmdl_run_command lib/command-line.c:278:5
>> +    #13 0x5391ae in main utilities/ovs-ofctl.c:179:9
>> +    #14 0x7f6911ce9081 in __libc_start_main (/lib64/libc.so.6+0x27081)
>> +    #15 0x461fed in _start (utilities/ovs-ofctl+0x461fed)
>> +
>> +Fix that by getting a new pointer before using.
>> +
>> +Credit to OSS-Fuzz.
>> +
>> +Fuzzer regression test will fail only with AddressSanitizer enabled.
>> +
>> +Reported-at: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=27851
>> +Fixes: f839892a206a ("OF support and translation of generic encap and decap")
>> +Acked-by: William Tu <u9012063@gmail.com>
>> +Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
>> +
>> +Upstream-Status: Backport
>> +CVE: CVE-2021-36980
>> +Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
>> +---
>> + lib/ofp-actions.c                                       | 2 ++
>> + tests/automake.mk                                       | 3 ++-
>> + tests/fuzz-regression-list.at                           | 1 +
>> + tests/fuzz-regression/ofp_print_fuzzer-6540965472632832 | 0
>> + 4 files changed, 5 insertions(+), 1 deletion(-)
>> + create mode 100644 tests/fuzz-regression/ofp_print_fuzzer-6540965472632832
>> +
>> +diff --git a/lib/ofp-actions.c b/lib/ofp-actions.c
>> +index e2e829772..0342a228b 100644
>> +--- a/lib/ofp-actions.c
>> ++++ b/lib/ofp-actions.c
>> +@@ -4431,6 +4431,7 @@ decode_NXAST_RAW_ENCAP(const struct nx_action_encap *nae,
>> + {
>> +     struct ofpact_encap *encap;
>> +     const struct ofp_ed_prop_header *ofp_prop;
>> ++    const size_t encap_ofs = out->size;
>> +     size_t props_len;
>> +     uint16_t n_props = 0;
>> +     int err;
>> +@@ -4458,6 +4459,7 @@ decode_NXAST_RAW_ENCAP(const struct nx_action_encap *nae,
>> +         }
>> +         n_props++;
>> +     }
>> ++    encap = ofpbuf_at_assert(out, encap_ofs, sizeof *encap);
>> +     encap->n_props = n_props;
>> +     out->header = &encap->ofpact;
>> +     ofpact_finish_ENCAP(out, &encap);
>> +diff --git a/tests/automake.mk b/tests/automake.mk
>> +index 677b99a6b..fc80e027d 100644
>> +--- a/tests/automake.mk
>> ++++ b/tests/automake.mk
>> +@@ -134,7 +134,8 @@ FUZZ_REGRESSION_TESTS = \
>> +     tests/fuzz-regression/ofp_print_fuzzer-5722747668791296 \
>> +     tests/fuzz-regression/ofp_print_fuzzer-6285128790704128 \
>> +     tests/fuzz-regression/ofp_print_fuzzer-6470117922701312 \
>> +-    tests/fuzz-regression/ofp_print_fuzzer-6502620041576448
>> ++    tests/fuzz-regression/ofp_print_fuzzer-6502620041576448 \
>> ++    tests/fuzz-regression/ofp_print_fuzzer-6540965472632832
>> + $(srcdir)/tests/fuzz-regression-list.at: tests/automake.mk
>> +     $(AM_V_GEN)for name in $(FUZZ_REGRESSION_TESTS); do \
>> +             basename=`echo $$name | sed 's,^.*/,,'`; \
>> +diff --git a/tests/fuzz-regression-list.at b/tests/fuzz-regression-list.at
>> +index e3173fb88..2347c690e 100644
>> +--- a/tests/fuzz-regression-list.at
>> ++++ b/tests/fuzz-regression-list.at
>> +@@ -21,3 +21,4 @@ TEST_FUZZ_REGRESSION([ofp_print_fuzzer-5722747668791296])
>> + TEST_FUZZ_REGRESSION([ofp_print_fuzzer-6285128790704128])
>> + TEST_FUZZ_REGRESSION([ofp_print_fuzzer-6470117922701312])
>> + TEST_FUZZ_REGRESSION([ofp_print_fuzzer-6502620041576448])
>> ++TEST_FUZZ_REGRESSION([ofp_print_fuzzer-6540965472632832])
>> +diff --git a/tests/fuzz-regression/ofp_print_fuzzer-6540965472632832 b/tests/fuzz-regression/ofp_print_fuzzer-6540965472632832
>> +new file mode 100644
>> +index 000000000..e69de29bb
>> +--
>> +2.27.0
>> +
>> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
>> index 16ec4c72..56f1297c 100644
>> --- a/recipes-networking/openvswitch/openvswitch_git.bb
>> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
>> @@ -30,6 +30,7 @@ SRC_URI += "git://github.com/openvswitch/ovs.git;protocol=git;branch=branch-2.15
>>               file://0001-ovs-use-run-instead-of-var-run-for-in-systemd-units.patch \
>>               file://0001-openvswitch-fix-do_configure-with-DPDK-19.11-error.patch \
>>               file://0001-openvswitch-fix-netdev-dpdk-compile-error.patch \
>> +            file://0001-ofp-actions-Fix-use-after-free-while-decoding-RAW_EN.patch \
> 

Sorry for this late rely due to a long vocation.

> You are carrying local patches to your ovs recipe that don't match meta-virt.
> 
> As such, this didn't directly apply. I fixed it up and merged it.
>  > But you should consider carrying those patches in a bbappend, so that
> upstream sends like this have proper context, and I can be more sure
> of the testing that is done on submissions.
> 

Thanks for remainding.

> I also took this as an opportunity to bump OVS in master, since I wanted
> to be sure that we have the same CVE addressed there.
> 

I notice the ovs has been updated to 2.15.1, thanks a lot.

Cheers,
Yanfei

> Bruce
> 
>>              "
>>
>>   LIC_FILES_CHKSUM = "file://LICENSE;md5=1ce5d23a6429dff345518758f13aaeab"
>> --
>> 2.27.0
>>
> 
>>
>> 
>>
> 
