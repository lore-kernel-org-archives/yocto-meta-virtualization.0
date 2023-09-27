Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33095E80A92
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 05:55:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11477.1695794096462608209
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 26 Sep 2023 22:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dLNcIooL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=76349c5ec6=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38R4x4kL028253;
	Tue, 26 Sep 2023 22:54:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=vwz34S0jtTAcuPdMHxRxhRysqLkUb8YRLZSlZhN9E58=; b=
	dLNcIooLR6TG5gME5373njvWRspk+tzgqHwhHLShWLl/qhLAym00WSYzjXyzX5TE
	gvUlqlZjauQvQlwItkv60tv0KcEb8QR+cOwhStJKHYNh7AmACktgpwkRoeAAciKh
	5YsB82ESDiWCr6pjmXEg0c8AyHW/yfC3I0Gdcs3jaLA4cqPsPSOS2RMspDYHOeew
	nkWLOdAIAmxGTI8/YJFGVTdm9jQXpUpli56KmE+9TbPvBYohks/Cma76GkOnnZFs
	NBaXj+0zOp9gDiIeZGSRAuqeNOdOAOApGmCRAOjCE5pVLSi0ZsYb2o2hknSHDa3e
	e3jnMSyRVXrVGBBHdIGTjg==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9yhgk9pj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Sep 2023 22:54:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lSEqL3E/qzaIwvXrk9XgC/mNPxm82kybvroelzFiA4tcHKlL78ugrHRQJmS24lpui4nuPSBdzPfvE/S/MI0lckfDR7VogO/MHkyYP+kG2J8nxVXlhVMnp7LYwCV1VFw76iRhTv9g/jbSF4ndF19bQDzubdWI0u/fD52NYw0/g0cYusiZ+q29dyQG11IiyyQB4W/ELfc9QRUoOi1mz66hRDF9Il9tbhqxkgLR7DFvNaQsLIpCot935ySsPzm5GIc47ILTK8JvSgkQQIRhhCFlvXWXCbZ1dmhrieyN7oSLyn+aA/9QKWNOa/7irVve57dwMu2wWmwb9NTR8KxpjypGIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwz34S0jtTAcuPdMHxRxhRysqLkUb8YRLZSlZhN9E58=;
 b=C7EZpKXxq/XbcL3a/as78athh+xfk7/iwZaBTBeOOv51nRhuRwvi84EUMT7TMcweBrhcZBqbMLoK4uzEDG9JLhxls5GtXYkSiEG0nhiD91HfIvt7HBuuRgH0LJT0TjNRwG0duEAvGIrnPF1jLMD9hLKNSo8iVdgrrCvEP6SL3XYANQlVUA3/6ykrQ6jhs17kcUnmuXsnT0u1gELGX+RlQvHxyMeFn/EeKLL0BSdjfjuFz1SBAyufusV9EbmWaXu8aQqoaeWKPQufxmCbaSpuyz8osqMlt+9BK4tt169Chm5gKxZOVGpCr0riTt0qIBYjacKSxsltES3JlllBMCxYMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SN7PR11MB7066.namprd11.prod.outlook.com (2603:10b6:806:299::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 05:54:50 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d%6]) with mapi id 15.20.6813.017; Wed, 27 Sep 2023
 05:54:50 +0000
Message-ID: <ecf3fdd5-d6aa-ba32-d4ae-192184f4251e@windriver.com>
Date: Wed, 27 Sep 2023 13:54:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [meta-virtualization][PATCH] docker-compose: fix textrel QA issue
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <20230918065101.1104194-1-Qi.Chen@windriver.com>
 <ZRDfmy0es8iFFztx@gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <ZRDfmy0es8iFFztx@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SN7PR11MB7066:EE_
X-MS-Office365-Filtering-Correlation-Id: b43cd241-7f34-441f-6281-08dbbf1e432b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kHkZM4Z6W4c3TVpwqWrjIMEd2g3R4xLik12Zg5wqVSkA3+9zGiExqlsGGmcMWmpsaNVoMO843IGeviGvIT7cL0UENopYGexYH5+Tv2w0QSkpKHeQIQKErvOKaHSrFq5zoSebb2PCVk04azhaGOaIYgHgcet7+f5b3HYl2KgY9fjGxY9p+ubDqnaKL81cPGl3guBS3xxIF5OEK6hiv2BW+GB+2AyoCFG7+nJOQg1UOQk+eMdouFHla+6J1mTk5I8jd26YKiux3X4yG3Ss5zIggtpjl5bEnnWDgEhWgUb/FR9YqR97ZL650MRF2yUAxEF/MUHHu8pQTCUzdnIXhTW1jMXy1owlXlGqVJXkCDUEi6DE8H8E3Lb/ic8AeFv/MggSWvxxG2gIK21FTqQh82UjQ+VZs0tYhRAGtCbBa6O9DK1o9IUNqOwnLbm9pvVa5FLKUUKQ2/MIdzHY2XCciMjR3kGX1XYcMZB3mq+cYDydOrgotpaYFgcq0k5D1P+mDi79e7VSst04GC7S1kjAE0TBiLTfZaqzMF+dyJAgm4+4b+4PJYNYFHH5yYMO6v853qF0el5CCySq5x74PrnrMr1ujo955S166IRcO9uLGOjlDJspdIMXJ6yTYzB9mo4KhRLV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(39840400004)(366004)(396003)(230922051799003)(186009)(451199024)(1800799009)(8676002)(41300700001)(316002)(31686004)(66476007)(66946007)(66556008)(6916009)(6512007)(8936002)(4326008)(2906002)(478600001)(6666004)(26005)(6486002)(38100700002)(6506007)(53546011)(5660300002)(83380400001)(36756003)(966005)(66899024)(86362001)(2616005)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UlF6YjlyS05SV0UxeUJLUlRXdmlmbStUSUhWRGdvMHExcUNYdHZMM2NGOTd6?=
 =?utf-8?B?TC9rYS9yV1N6MUFUMVdyV2dPQmRjV0tTSHBYL09IWjNTZkNNVG9hSDR6V2c2?=
 =?utf-8?B?b3YzYldaZkxSUlR4c3EvYVJqMWlMWXpWUU02MmVqbERNZXZybHVEdmVlVDRS?=
 =?utf-8?B?QnVTM1hHTkNJekFSS1lmaHM2WHdSVVNzcWtjbVpEQnphZW1UTkMvVzBsMU85?=
 =?utf-8?B?dFEwQjNUZWl4THlpdzRtYjFIWDZjd1NhQWhTZ2QwWnY5ZVJBOHlJQUM0eGxk?=
 =?utf-8?B?RzJBVXNrVXJZdlBkdElCTUJ0S0JyZVdlQTF0TXNJK0E5bU1rZllCOUtjVm4r?=
 =?utf-8?B?QjBzVGJ3Q2U0UTVNcUU4ZllkbndDTXduQ3FDRkcvdlBwV3JPWVQ4OXBNc2g2?=
 =?utf-8?B?c1JYUDVBQnI4Vm1YM2NEZ3J1Q1VraG92bURhQ24rY2JEdmJ0S21rcGsxUWtj?=
 =?utf-8?B?czZDUGJjV0poeE5uR3RDN1dJaDBrc1Y5eW9QUllHbEkwTEJEN3hkVzFKY0F5?=
 =?utf-8?B?TVZyQ3dZU0MwdnRvNzJNY2ZHazFOUmpUOGYzcVhDazRmSVMwb0JSSHp6a1JL?=
 =?utf-8?B?QkFhU3BVQkNVZWxiYVB2dHkvOWxsM0pSOVpWdjBsN3dNVXRMV21IVmNEZjR5?=
 =?utf-8?B?dDc5c2ZRM3pPZ1lrZGJEeW0vcVFsMmVVVU4yRFZUMUEvZG01cVhVYU0zUE96?=
 =?utf-8?B?R1BOUVBQcnpGNmh5Y0JveW5RQXZ5R1pQd0RFOUF6RzZRelJkMXp2V0dmblJ3?=
 =?utf-8?B?WlV3WjNFQnRTV3JjZHM4TW1yK0FyWnZpTk9hSDh5SllZVkFLQldqWmYzamdO?=
 =?utf-8?B?azBUbW5FcktCQURna0wwT0s2VUllM1lnN3pGUStrVExHU09NSUtQMlg1VzE3?=
 =?utf-8?B?bklaSjBibVJ4bkMyZXJVNEduR1MzeTJzRGNPeUNIU2dOUEo5Y2p6T0VDVTg3?=
 =?utf-8?B?ajhtL1d6TkxVTU9LNlZkRzk0dktBZDBDbncyY1VzVGdwMllRdEZVZEttSi9m?=
 =?utf-8?B?cVpLOFJZTVp2RnRDMzQyRWlQd0hoVnM1VWhtSVZoZVhDZHVwYk9CQ2N0ejl4?=
 =?utf-8?B?azg2RHU1VTdKYUtuakV2U0tpaGsyRmUwKzRmY25WMy9BWFp1Wm9XcUhTOWhE?=
 =?utf-8?B?S1QvaXZpa2xnd0V1c3FqK0grcTJSbVFIemlOVWZFTjlPaENzaGo2aGNkWWF2?=
 =?utf-8?B?Z2ZRYkZUdVlnZGdFS2xBRWlnbmxDZGRwTFFnUlRNQW9iUDFjTmd6YjRHZGVv?=
 =?utf-8?B?YTNTL3BoUGI3bG5McVltWTY1SVIybXFDMk03cTcyRkp5QWw1MjhsRHg5YXBI?=
 =?utf-8?B?c0gxLzdFZmhPdU51TEM5SXM0S1V4aDdQVGtBQUgzVjNyY1hIRmZPa1cyaUdq?=
 =?utf-8?B?ak5la3FmaVorZlVQL1lKUnR1STlnbmx1OHovU3A3UHZGdXJMNUJBQVd1V25n?=
 =?utf-8?B?dU5URnBaQ254ZEIyNk1PYlJvMjZTTHloK1NtYXY4dVNzaFFDNnkzOHMvS0dT?=
 =?utf-8?B?VjFOTHI4emdyWVF1YmdNOUF3QStibGticFY4eUZ4dW9TSGIxNHRscXVXRUsz?=
 =?utf-8?B?VWcxckNaQWwyZVYzZDE4bUN3R2s5TzlrT3Y5YzU4QWdpdE1CTWlQYk9MdjdQ?=
 =?utf-8?B?QUwvbU40c1lNQk5uMXlxLzJMUmdDcExid2xMT2g4S2QwaCt2MVBmZHRZNjll?=
 =?utf-8?B?OXhoUWlwZzczd0R1Y2NIV1pQVmdYREJHUU9tRkd3eHpoU1E2cUd4dklBOXJZ?=
 =?utf-8?B?R0U5NDBLblkrdlZoc2YyMjRzaC9KQmlGTzAvMzcxWEovcU1CbDlDSW9UYis3?=
 =?utf-8?B?cGw5dnlFeXJ0dGpQa2YxaTdrTTM4dS9LYmJVczFpNE9hL3UzNGl3dzlxazls?=
 =?utf-8?B?ZTFGc1NRd0h0aWVwU2FqU2Y3VEhJamVNZHNXekRZQW81R00zUm55c2NMaWYx?=
 =?utf-8?B?NlJBSHp3a3JOQUh2eEhpbnlqby83ekUzMjYrZ3p0VU5kcWFkczVQd2hMcFo2?=
 =?utf-8?B?dmhNMjlncVBJTSt4VXROSkNUQkJyaStiYlJVd0g4eEcrWWxGbm1Pd3ZtMWl6?=
 =?utf-8?B?VkFHMmJqbmVwTjJkc1lUZGhwTmcrUTZFSWcxRm1yMGJCMUtaeGZ1N1VvcEUv?=
 =?utf-8?Q?3YnAJB0ltzx1YbJznAUUjNi2K?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b43cd241-7f34-441f-6281-08dbbf1e432b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 05:54:50.3221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ToeOS+UsBtrT4UAnBDdZyDpyhhzNg9lqT0XoAmBSkB5TCART/wqLwxmmdTpH2rLB64FYoEvDTnJyb/8qFCJvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7066
X-Proofpoint-GUID: s7NhBVKxeMDRyEkFoW4bgVrBDsNPTXfn
X-Proofpoint-ORIG-GUID: s7NhBVKxeMDRyEkFoW4bgVrBDsNPTXfn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_03,2023-09-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 mlxlogscore=679 phishscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2309180000
 definitions=main-2309270048
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 27 Sep 2023 05:55:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8325

Got it. I've sent out V2.

Regards,
Qi

On 9/25/23 09:17, Bruce Ashfield wrote:
> In message: [meta-virtualization][PATCH] docker-compose: fix textrel QA issue
> on 17/09/2023 Chen Qi via lists.yoctoproject.org wrote:
>
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Fix textrel QA issue like below:
>>
>>    ERROR: QA Issue: docker-compose: ELF binary /usr/lib/docker/cli-plugins/
>>           docker-compose has relocations in .text [textrel]
>>
>> The problem could be fixed by adding -buildmode=pie, as this option has
>> already been in GOBUILDFLAGS except for mips and riscv32, let's make
>> use of GOBUILDFLAGS.
> I tend to not use (or like) the defaults in the bbclass, but in this
> case, it is probably ok.
>
>> Also, make use of GO_EXTRA_LDFLAGS to hold our this recipe's specific ldflags.
> I much prefer the explicit GO_LDFLAGS on the build line, versus the
> internally consumed GO_EXTRA_LDFLAGS. So I'd prefer to keep that
> as-is.
>
> Bruce
>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   recipes-containers/docker-compose/docker-compose_git.bb | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/recipes-containers/docker-compose/docker-compose_git.bb b/recipes-containers/docker-compose/docker-compose_git.bb
>> index 274fb520..8c0ddccf 100644
>> --- a/recipes-containers/docker-compose/docker-compose_git.bb
>> +++ b/recipes-containers/docker-compose/docker-compose_git.bb
>> @@ -40,6 +40,8 @@ PACKAGECONFIG ?= ""
>>   
>>   include relocation.inc
>>   
>> +GOBUILDFLAGS:append = " -mod=vendor"
>> +GO_EXTRA_LDFLAGS = "-s -w -X internal.Version=${PV} -X ${COMPOSE_PKG}/internal.Version=${PV}"
>>   do_compile() {
>>       	cd ${S}/src/import
>>   
>> @@ -52,17 +54,14 @@ do_compile() {
>>   	export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
>>   	export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
>>   
>> -	export GOFLAGS="-mod=vendor -trimpath"
>> -
>>   	# our copied .go files are to be used for the build
>>   	ln -sf vendor.copy vendor
>>   	# inform go that we know what we are doing
>>   	cp ${WORKDIR}/modules.txt vendor/
>>   
>> -	GO_LDFLAGS="-s -w -X internal.Version=${PV} -X ${COMPOSE_PKG}/internal.Version=${PV}"
>>   	GO_BUILDTAGS=""
>>   	mkdir -p ./bin
>> -	${GO} build $GOFLAGS -tags "$GO_BUILDTAGS" -ldflags "$GO_LDFLAGS" -o ./bin/docker-compose ./cmd
>> +	${GO} build ${GOBUILDFLAGS} -tags "$GO_BUILDTAGS" -o ./bin/docker-compose ./cmd
>>   }
>>   
>>   do_install() {
>> -- 
>> 2.40.0
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#8312): https://lists.yoctoproject.org/g/meta-virtualization/message/8312
>> Mute This Topic: https://lists.yoctoproject.org/mt/101428849/1050810
>> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


