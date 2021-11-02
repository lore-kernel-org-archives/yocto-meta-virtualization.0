Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4235.1635820471523089451
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 01 Nov 2021 19:34:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=sexNpJjY;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6940edf43f=yanfei.xu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A22Vs3J031416
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 2 Nov 2021 02:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=vrXeW3C9QtsiVOatBiakyXxdbMkCONRbeDh93BZO4EI=;
 b=sexNpJjYxBXOO+ZaYne2PACH1X47RxPToKq0MwMemVEzlLMUJ5iPLs9gxZImDcaCxSK1
 i7URoFY6eNNbtoyTtm7mAKcXsUK5HZjxd4R+sumBeSts/0/XO3KulxtWzaPnk5OeCPCp
 Z20wQAY6E+xEwhG8dCJzX5Mn2+bEPVyxjZRNm5BVIp4Vx1vNyitD2UkP7aTHJApcHRGj
 68L3tjAN+d7WY4ITQ+3uiDmkFvfUcB7dDunPYtVxKjDJqfdZ3YuAQAKJFas6ePlNC2k8
 Nh/NZr8kyNXBAiQAJwRnGTfyapAthrrKxf2+qh5n5CuBr2++sFfpi4Nb60tf7R97tljC VQ== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3c2b7jrrxp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 02 Nov 2021 02:34:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJca+Gg5bO7dTezAPbACVG3FFC+0gaR4RGbYE87RLj1B9hBeExKrTR229kQrRfND3Lb32wM6/8frnpCR/GGP1QD/XDHUaJez8ffpR60BWpAcCoPO+xoETo7+87VxZyOvdt32rtiw8SoxAIB+lEurlR5YJ8kXAD5dFHsgNUDO5XRep9AjaFl8Amxs8vmhgrajQ+vKwqVX7EiN/Wsn77hYMbp+xC3QVM7ywy69b9axu4VUjn6T8wp6JbMneJl40uOCFUCUSw5O8D4445t/xbI116wsOxu8yIHBS+pxeR7TTR8/w+XFsO79VsLxu2tNXo2EqRVcI9sroM7oyB2JzbuTVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vrXeW3C9QtsiVOatBiakyXxdbMkCONRbeDh93BZO4EI=;
 b=PAV+huMOnN0LAbTj0WTDcs0qBq8xzBItgN9ofSd/epflpCQM3PPysPjJtMtitpeBOwTvynFSV+YjlXaSJMa2+sHu9ve5mbnSUzdHrnCutCxnc/bDUaq9FstjMJ62y9jlQ2ciOA2ee9Nkde0DLpm4unIdvUMhjAJhaHllX8ULWGV7PBO5pszzdgJatdsroDREbvvwK9G6YinKkjfCL0gFnhkAtp1RvpUoFrX12gD40i4Nfz4DuoGbXYXrYgSLgaEe/ssWeQ07/vdVzPX1/MiJdNPw5GjSlsvEfPYJUpUXl4QGMsn4T7UaBqRHMKiBjDByw7MAteTY6O7reM1k7r+CYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM8PR11MB5734.namprd11.prod.outlook.com (2603:10b6:8:31::22) by
 DM6PR11MB4596.namprd11.prod.outlook.com (2603:10b6:5:2a6::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14; Tue, 2 Nov 2021 02:34:28 +0000
Received: from DM8PR11MB5734.namprd11.prod.outlook.com
 ([fe80::5db7:737e:8ef0:c831]) by DM8PR11MB5734.namprd11.prod.outlook.com
 ([fe80::5db7:737e:8ef0:c831%3]) with mapi id 15.20.4649.019; Tue, 2 Nov 2021
 02:34:27 +0000
Subject: Re: [meta-virtualization][PATCH] lxc: update to 4.0.11
To: meta-virtualization@lists.yoctoproject.org
References: <16B36487B2CCE6B7.13000@lists.yoctoproject.org>
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
Message-ID: <3e337ee5-0c25-fe58-4bb1-a2e4f58f4fcd@windriver.com>
Date: Tue, 2 Nov 2021 10:34:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <16B36487B2CCE6B7.13000@lists.yoctoproject.org>
X-ClientProxiedBy: HK2PR02CA0152.apcprd02.prod.outlook.com
 (2603:1096:201:1f::12) To DM8PR11MB5734.namprd11.prod.outlook.com
 (2603:10b6:8:31::22)
MIME-Version: 1.0
Received: from [128.224.163.131] (60.247.85.82) by HK2PR02CA0152.apcprd02.prod.outlook.com (2603:1096:201:1f::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend Transport; Tue, 2 Nov 2021 02:34:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6dc9528c-b0b2-422b-0549-08d99da94a16
X-MS-TrafficTypeDiagnostic: DM6PR11MB4596:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB4596905DBB03D730711C87DDE48B9@DM6PR11MB4596.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nVA5qJpVPXoscyJyAt2MgegBoIwugIbKhgTuIm8dtCxJNOhSzMG+HkUjAr8e/GoR+3LzCTronMlcn4ZhZnHmDZHMTy7SQ8FajpByws0Rt/NR0v2awVUusvGCRgIhKvzMi1a7dCyI/OsIodKQiT9PGyPwsbYYsW2WClBiUHZ57DkX0l+8O+6lANKsx61ijtUo5J0Wlhw2dyjO070WNVSVLsClghaPI6rQcL06N/XyxY0cQkMRwbk7zwuOou9i2YFyDdxvjb6kyBbUnSJ7OPNMVCulYCk8Iu2RzcThisDgKiIkaacFPGl1/ZVS71oV6CKSGW+Z5mI9hcKpcf8HUWBbxe5UQ81KgvYCZupYmdmDTCR0EmElkCGiPvc91fdRnjuuUQfYKw0bF8qIRUdRjQXUYu1BFTYrSp8K1/FvKUtP3k6MAku8IpyIWPGc8cjPSwxqrvvGbkc0n4hgZMLBi/RgW1kiW/vvXiikmzuoBnxaeYXxJaDuwP/fDEiraHb4gILqfX2Xywu0kfnG+jisF3/7/zS+4+eH0mBnPPV/RaU1btCo1sU6uRYYECIq1lNHMX0/bPed1Wk9CQyMWTS0L9VvMg9DOO0YGY9JOHxZoEmS+783vAouhQ85L+dUhtk+2mSPSJvjF3ogBtmtr6CQWkjBy96VrREK3xXBza0iEcXZOuen6De8Cf9L87iXv9DitfZcC3gYdfA26msgRiVqJmAvlwk8fPlX1mQE6h5T1AFp/Hr3rITi9jm7hsgyktDy0CO5bC0Vr4mX9ObhQmdDq/yhjXqGehG7VjQu6fK8LASmQ/g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5734.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(86362001)(83380400001)(5660300002)(36756003)(26005)(316002)(16576012)(2906002)(15650500001)(31696002)(6916009)(8936002)(8676002)(2616005)(6706004)(508600001)(6666004)(66946007)(53546011)(38350700002)(31686004)(38100700002)(6486002)(956004)(52116002)(66556008)(66476007)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MFRFSjJQdmxiZkNkVG10UUN1YjZKZ3h2QUM1TjE2UEhINXkyTTNyQzh1R1J4?=
 =?utf-8?B?aE12WmUzUDllVGRsa25HWmZHSWx6TDQ4aVRObzZSR0x0MFZqSCtiRytIT085?=
 =?utf-8?B?TEJISlVhc2RneXNFbktyMy8wTjIwTTRnOFB0Q3Z3d0dQRExBeWVwQlN2UWVD?=
 =?utf-8?B?TjVwTEpLeENZUzkyUFVSeHp6TkRUQ3hZVmtZRHZkN3dHY2tNNUoxWVlqSTdh?=
 =?utf-8?B?cDJzRDB3OGY0c3RLcGFKWW4vcjZNQ1A4eHQ3SDh0aFdJaDhJRWthdHRKY2Fv?=
 =?utf-8?B?NHRuSVk1VHpuVnJhemFydXVmREtQaytFSVNQYlFtWnVuT0graURnQXh1YW5E?=
 =?utf-8?B?WXZNNmZyNHUwdW1ZM2VxaFdWZmlqcUxUNnhyZmZrNzNxNEQ4NVF3UEZMV2o0?=
 =?utf-8?B?dFlTSUh6SHhDU09VYWN0SElydUFkd0l6UlRvR08rL2xRNFZUYnFJUTh4MXhW?=
 =?utf-8?B?dHVQbk0vWHI4RTlzbjZiS05TVGFTdVNRQk1od2QvazlneE5WalBPdmJUNVhO?=
 =?utf-8?B?VmhxYlBHUDFwVTk2WHVpVVJ2bC8zL2x6aDk4dGZCMnVkV3cyVWtGSVkwVTlK?=
 =?utf-8?B?U3Jja1gvRm1xVG5RdVg4VWtHaGQwbUN2VE9FWUx4ak1kN0NVbVozZm9ZZ1F2?=
 =?utf-8?B?eDlsQlA3cWhWTHcwUHhlVzc2K1cyc0VsNk1zZy9mZ1hLMWpqdWIyckpYNFlB?=
 =?utf-8?B?dzlmVFFRSHFRUjJKbjhVRzRBS3BzOG4rWEVWMzhqVkxJUWZidlhPT2pmQ0dI?=
 =?utf-8?B?SjUvLzJUR0NKK0FDNkJLYnlZTFhBZ3BlZjRwdmRBaFFqT1FEYmluY1Njd21U?=
 =?utf-8?B?d1RTNHpnMWFWOWtFRlFpbXNxMEE3c0daTHE5dkZnSDk4Y1ArK2VrQUdYNkI0?=
 =?utf-8?B?T1hKREF1Uit1MWFkZUtpa3Q1Tm1YMnJsVW94R0lDY2d6YXZaSkR4dnVpVERX?=
 =?utf-8?B?NmZveE1SUyttT1BUbzlHWFFmY3N6OE1VdGZRZ1pqOWxvVlQrNnR5SlJUbng4?=
 =?utf-8?B?TkxmUHlOWGdkQ1k4c3lVU2wrRXlpUUpFLytiQnBxc0JrMEsyTjgvM2h2dFIw?=
 =?utf-8?B?QXpXZU9uemNTb25mcWV6cGFTNTVvTzVqdGlqRXRvRThvZ1ArWWpoT0FQS1JG?=
 =?utf-8?B?Y1MvR2dwYXB3SEFHT0dZNi9YK3hRVWcyUTd6c2hPWHZOY2gvSFZxK0xyQytm?=
 =?utf-8?B?ZlVjdzVHajAvTjRXazNYUDh3UDZES3M3aXY1Q3QxNExnVlRhT3VjbXQ1VHd2?=
 =?utf-8?B?cXBWamJ3Qk5vcjFleW9FbkxjZW0zRnNJMlh3L1dndXR4SEh5Z3lkdno5d1Jj?=
 =?utf-8?B?dkhPc3FlTTNxNlRpZzZIVGt5MXZiRlZDVzB5UmsxQlRid3F5UWpCVS8wRjd6?=
 =?utf-8?B?c0RtSk1Qa2xFODI1UjU5SUpZaS81eFVxYk5odlhTWkRRM3JjWlhhQWZIcmND?=
 =?utf-8?B?alh0TUx4NW5acGVXNmFYZWdjSm1iY2ZoaWVkb09YU2ZqcGViYktjS1dReHpN?=
 =?utf-8?B?U2x0M25EVmlBeS9ZYW5TRFpGM3lCU1VBdVE5ejJEUDRoTlYwT2dTbUVObWlB?=
 =?utf-8?B?MkhVMTZPS2JjUy9GajBwaFM5V3NIMmZZL29xYWl6ajBySWVmaEltSjlpQUVY?=
 =?utf-8?B?UjlUejFPUFJ1djdKcWNVT1lWeFp0N1d3dVNxS1hkMW5FVFlDTzZNbmJ1eGNj?=
 =?utf-8?B?L0lqMkY0THRGQ05QNEZIQ2RGZG50MlloTTkvdGZHRTl5NmtzYWFWUTBrZGd0?=
 =?utf-8?B?QjlTRkRBWDZFQ3FidVR3cjA0eW0wUk5VWklKSjNiZTREeFpteG5qZFhmdE9Z?=
 =?utf-8?B?NFFyY2l4UHJHYmJsRFgyT3hZcGI3NWRjOTRzMTZNQTNHVUVuY3F1RXhXbnZx?=
 =?utf-8?B?NzYrSXRORWpGOTBzRG1UNTg2YTlYazVEemszSmRzWWovS1p1QzBHYlZUYjFZ?=
 =?utf-8?B?bHBRVUdob09MeXFUYnpxbFJiZG5xd0NaaFZ6SXRnTWxkS0t6VCthc2l6MktU?=
 =?utf-8?B?d250U2t4TUlhU3RtSExjd3hSd2gyZVRmWDNUTFhQM2x4UVBqMUs0WGVUejNx?=
 =?utf-8?B?TUh0am15OVlxYk52bzZvWXM5T3NVYjdTc0xna1V2T2VWdW5rblZ5ZlE1SDh1?=
 =?utf-8?B?REFvblVzMVM0ODE1V3N4c09vdms4c2ZVV0wxV2UzTmtNeE54aFV2WWwzRkdQ?=
 =?utf-8?Q?wWZAz9yY2c8pvAs1rIG1NvI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dc9528c-b0b2-422b-0549-08d99da94a16
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5734.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 02:34:27.4606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gtrbnph+9nI8/W0yxo8y97x/ynxWHRO3tWXiHKzLMnjdvRAPUpCKpyL35MReUhE+F0Y1R/b0kM1gXjo/0MvTCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4596
X-Proofpoint-GUID: DY8TE-dQyudtDpukUtRiYh6GLK5gfhY2
X-Proofpoint-ORIG-GUID: DY8TE-dQyudtDpukUtRiYh6GLK5gfhY2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-01_08,2021-11-01_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=943
 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111020010
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/1/21 6:13 PM, Xu, Yanfei wrote:
> diff --git a/recipes-containers/lxc/files/tests-add-no-validate-when-using-download-template.patch b/recipes-containers/lxc/files/tests-add-no-validate-when-using-download-template.patch
> deleted file mode 100644
> index f335e796..00000000
> --- a/recipes-containers/lxc/files/tests-add-no-validate-when-using-download-template.patch
> +++ /dev/null
> @@ -1,85 +0,0 @@
> -From 1c2506434e744d8c6a86e42c9d8bae4cde7553f6 Mon Sep 17 00:00:00 2001
> -From: Mark Asselstine<mark.asselstine@windriver.com>
> -Date: Thu, 31 May 2018 15:14:26 -0400
> -Subject: [PATCH] tests: add '--no-validate' when using download template
> -
> -We are usually running the ptests with core-image-minimal which has no
> -mechanism to validate the downloads. Validation isn't really of
> -interest to this test at any rate so simply add '--no-validate' to
> -avoid failing due to no GPG validation.
> -
> -Signed-off-by: Mark Asselstine<mark.asselstine@windriver.com>
> -

The reason about dropping this patch refer to the commit of lxc:

commit 82b850ddaa21e0f4d713e764bd57d3d9235fd319
Author: Christian Brauner <christian.brauner@ubuntu.com>
Date:   Mon Aug 16 17:40:45 2021 +0200

     tests: use busybox in lxc-test-no-new-privs

     Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>

diff --git a/src/tests/lxc-test-no-new-privs 
b/src/tests/lxc-test-no-new-privs
index cfcb43bd6..64988a011 100755
--- a/src/tests/lxc-test-no-new-privs
+++ b/src/tests/lxc-test-no-new-privs
@@ -44,63 +44,26 @@ lxc.net.0.link = lxcbr0
  EOF
  fi

-ARCH=i386
-if type dpkg >/dev/null 2>&1; then
-       ARCH=$(dpkg --print-architecture)
-fi
-
-lxc-create -t download -n c1 -- -d ubuntu -r xenial -a $ARCH
+lxc-create -t busybox -n c1
  echo "lxc.no_new_privs = 1" >> /var/lib/lxc/c1/config

......


Thanks,
Yanfei

