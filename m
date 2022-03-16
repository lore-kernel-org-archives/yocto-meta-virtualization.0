Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44677C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 16:22:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.27073.1647447751999638935
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 16 Mar 2022 09:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Bh/DfN0E;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=00749dbd31=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22GFphqP027934;
	Wed, 16 Mar 2022 09:22:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=4lZN0lLa2G1TFz4aui8xaFZuIaoNpmCaGTuyGobbV6g=;
 b=Bh/DfN0E7dWdK/nxL8PyKEjiu7GrBYnjB49tC+ctpwM85f8I7wBrwmFKQnZO4HrMSqwT
 LdG6NJYK7kecbsfLQF/q8AUNP1J5sVhPLGTpiglOPtTqofOelUbDT2Eh3PVgD6eAQaNK
 +MLtZoE0AK0U3kIshtpJ6nVoZgCgVWLVa4AjOdFhK9DFtLUrFHKYBct9upN4qiBYkuau
 bCawpHHrbaSbjVGvANEsKP9661/SmxTbIxkIdhfIfq4R8GLbcg4DKo+Caz7m+92XlT08
 +dDXwyEM+Uh/6x7n6GYbMWmci2fRNdlRCrZy0MVSsr9gX8a88xTbVGaQWVnJSkZCX3br Ng==
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3erqp9bh7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Mar 2022 09:22:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vnz2YIxdHLZZGjgLsTYVHB3BASPNUZkmksG2Xfswd8ssmwAMNj0Uo9LeGJP73H1tMhb6+nCRguB8TErCA6XB9Sw55tn4N7HWQTq1lolsIQy/r9qVeIuLY2/NN617QApV/D+xNArnCWa03bv5hDV6XUB7X/vktQ5j6RTLIPJOeFMMggtOOMIyFe3BALTEeSBkRE3fNIcULP5y4Huz1zGA7SRV39s0Pe65fUKtMGm2mcUtm2wkJv3Ck52eMME7+XF5fC1Qo8nsjEolk+SuzwC2v2/V3Z/LT8aWHiQuaw+2guc1nz9hgJFpQTcXZvw7tROapuLgW3wvGxqz/h8Lhkqlow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4lZN0lLa2G1TFz4aui8xaFZuIaoNpmCaGTuyGobbV6g=;
 b=PpZFT1XOO+YN7HPSRHh3JkSyfYXOtr2Jg0QUgjUD/YLSYHPeEzTEcqxXHDoYA3yjCa7rIz9H90S8OtEhVEx934YFBO4m82P6DRExcK+0sGl30H68QOyygcbnYt7GVYKJSP95+ZBfLH/LeFG7gEzj0MCchPUgFeggdya0tGJ+/46O2Mt8SAzEKaaev64Lk19dK+PsQ1ex1SvUdcKiRI15vxpsWgkhm6UlmoQaX0B5BjuhQM8rXkVXJtWPNXK4fOU+/MBVKKaUI0lioeFq+PGmD2UAyGxkF94RODq7wRFg39aPJkfOtTIOKLNL2kKhEmlAuW/Xgoieu9Vxdeck/vdmYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by BN6PR11MB1841.namprd11.prod.outlook.com (2603:10b6:404:102::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Wed, 16 Mar
 2022 16:22:28 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::19c6:8fec:7ecd:a91]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::19c6:8fec:7ecd:a91%5]) with mapi id 15.20.5061.028; Wed, 16 Mar 2022
 16:22:28 +0000
Message-ID: <9708c3c0-532f-97ba-6c1a-4511766ad2b2@windriver.com>
Date: Wed, 16 Mar 2022 12:22:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [meta-virtualization][PATCH] ceph: set CXXFLAGS and CFLAGS
Content-Language: en-CA
To: sakib.sajal@windriver.com, meta-virtualization@lists.yoctoproject.org,
        Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20220316152020.29113-1-sakib.sajal@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20220316152020.29113-1-sakib.sajal@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0106.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::47) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63c1ab07-0340-4aaa-6bc8-08da076929c2
X-MS-TrafficTypeDiagnostic: BN6PR11MB1841:EE_
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB184143D303BCF84C3F3DBD85F8119@BN6PR11MB1841.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LVgUflr3YCdYP5BfHjROSVtbyfPUufZhXN9lYPTsQBDIKpOfZYWV5Ph4lYYl3a+RAKJ8ggVtBh/6PAs50HECLE+8ms1KAYU1L+edg9e5XvOO9TIMYqvwpSTslZkxA7iYEKozOynaseZXJgzSBl9bZy5cheA5scyLTmxDVi/4vkSah1tEC0yrJ6z+JOY6tkZqOgm7RervUO/NmDlfKeScWYLLUdQ2xX40ZoGh93zFzCJrJLI+9UF1HNaYFJyE7Lxtbq2CfJEC3btww89ZZ7vqqZ0Y0CiLkI8Fiiaw5sxzuKLatoKv+Ut1oQBxNV4JIx+EqoLx5O5SUu+g5Ethy6QNo87OVn4H8gH+cgAOTbS8jhSX50EBKKSahgKQtYZ3QsfB4+Zt1zOhmUcm90/gxt1rvrrJ33bmLpQAY8Bji09EIrlL1z1BOl7LIhdIRevTUhm0mKj3zeBolk9g+8zG/lNYs+QmLBtBcMGHjxSQ79Sf7HqtrZEKKh3Kg0AczNo2y/XuyRgVAa5+x+8xBN6v/SRdpmR/PFfo2QNV/aTki2yHSsr+vAEGjhwdEmlR9/fMYMrcELBzYTw9PGoGRrfY299Celh3/u0X/NP0YuCujUfx0YQB9LJkxMdColQKsEYwr2c/jURvViibG9q1lfPOKdrZDI59DiwaQwPLWdml8IjYtphzfxN/0izOGxDTO/1XpzrW7777e44y0aw15sgtsy97fQmATbAOJyI2IxFFhIIEB1yH5tNawuFfHPD8/ml4JBjNMrz65Yzik9nePmF1I4B42fZC0tRQlb+llVh+UGqT9j2rTJog97jpww8fin3fxtbH6xNWC4XjFcZNY+Lp/IrffXhNlE4lxlBA9pIGFjHV5o0Bk8Opsn+/ivSA0W9uq3iA
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(6506007)(53546011)(31696002)(52116002)(8676002)(66476007)(66556008)(66946007)(38350700002)(38100700002)(83380400001)(6916009)(6512007)(316002)(186003)(26005)(966005)(2906002)(6486002)(508600001)(2616005)(5660300002)(8936002)(31686004)(36756003)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YUZ2ZVpiQmZwMDFwUzU0TFpieVBNYUREN0NzRENteE45clZITXF3TlZTQ3RH?=
 =?utf-8?B?eVZXbEdZeFFpUUh1dWk0aWVyUUlDVCsrWHFGQzBGTXFjT3NWTHJ0YVNFQlhz?=
 =?utf-8?B?QWg5UnBpTzFUV0RQRmZvc2szSFZLMWJPaGZvQVVaNmJqS2tvNm1CYnlJSVQ0?=
 =?utf-8?B?N0dRM2FSSlVhSE52TTNCR25vNU4yYy9OaG1wWGdYdm5tTUs5dEFiNS80WUp3?=
 =?utf-8?B?M3hpY1lYTG9TYW1qa3JyT1hjQlNXL1U3UUdGdjBoQzVJS2lnWXY5TDZ3T1I4?=
 =?utf-8?B?U1JHRmZLdmVQYzdzeWdiRjRDdmVSanNBQTBQd1lwWjJ6OEdsRjhwOTFvczR0?=
 =?utf-8?B?N2VsdTFXeFZ6Rm0vNy92b3pTcWtYL21QOXUzb3ZaM091OUs0OGYvNWxOYTRZ?=
 =?utf-8?B?SDltSHZseTcvdjU0cXU2ckc1cWpTdUFPbnk1Z2ZLWVdmU2hsZ0wyMXpCR3JM?=
 =?utf-8?B?bTZNOEhrclY5VlFKWnRoeXNQekdVZGx1cFdHR1ZkMnRSdHFjSDdHSFNCU2k1?=
 =?utf-8?B?bVB5UUpsV2dGeStoeFFiUnBHNEpPMnhhOWJIZkpBV1AvRVVZTFM4SVVlSnc5?=
 =?utf-8?B?RDNlZ2VyaE4zVXllbittSExDdWVpUWR5ZDkyWTBJem1lNWM4QU5uTm1sekNy?=
 =?utf-8?B?WkZCcWhwRXFrYk4zQ3RuclVWZVRmMWRyeUNTTFc4d0s2TXJqWUc5dm1uMndq?=
 =?utf-8?B?YmoxRm5IbURBT0R3TUs0YnArcjNzRGVRVDcrYy9uUjgzUHE1OUZQRjJBWTVL?=
 =?utf-8?B?bytlaVhWZmFlSmRTZ3A3WFRrRUlVa29BWUxNcGo0TzBVaTlHTWJleW1KYTdq?=
 =?utf-8?B?SVNES2FpMWtreDNHOWNvYmcramcxTWRNRTZpWGdhVEtZaTh0WW9LUXB2aGgx?=
 =?utf-8?B?L1hSdWsybzk0RzhsUmw3NDBjdmVZdEJDMFc2YTY0a2J2b0NRa292UEh4V3Vp?=
 =?utf-8?B?MVg2Zmk1R2o5Tk5VNmVycExCSy95Q1VQd1ZzYnBZUmZmaTl6LzJKZndPTjBH?=
 =?utf-8?B?VWFCbjdGL1g2RUZBV3M5K094S0RVdlFUZGVWb2xNaUJnbHlPWWhXdjRDRFhV?=
 =?utf-8?B?VzIvRXJZMzVCSmlWR0dkb1FvWHUwKzJiVWtON0dPK1RNamlENGxKWU5TZ3d5?=
 =?utf-8?B?OGZEWmZUZDZKSkNiT1dKVlZyTDhVa1lGQ3VvVEpZNENPMXh2UEZFMUhKMVNL?=
 =?utf-8?B?QTJ5dy9sQTJZMUQ1MmJMTzlXZ0JOZlVzOVVmUzRuYzZ1d2x2UXdzeWMrTjdZ?=
 =?utf-8?B?RjdzSDVHcXRlelEwWUlONFpVazM4UVVkdkJyWlpXQzlSY0Q4ZFdpY2I1L1Js?=
 =?utf-8?B?cXZWUFk4bmRrVmJwL2FZdERabUVyN00vU3NhQlkvaXA5UGI1dXE2RUI5R2JM?=
 =?utf-8?B?Zk40NmZGMnhBUU1KUk95cDBHaW0xTklEOVVEZlowSVBSWTI5MFNIaCtqRWhG?=
 =?utf-8?B?WE83K0N5YXBMRzRBaytnNVVpYm9aWlJiVHVpM0pXN2tUdXJrYXJSZVlLODQx?=
 =?utf-8?B?Zk9Mc0cvRmJLbmxLZXNOU0JRMWFXdEM5TmVoRGx6TnovSWZ1TTNhZE1TTXdJ?=
 =?utf-8?B?WEhNNzA3VE45ejc4SXNYUGdEZDRVbEZGQy9OV1ZST3FhZmwwbHU5OGZDTTBu?=
 =?utf-8?B?cW5UdjhVZlBXRnIzb2t4SktWbDNaSGFuZk56WlF0MjhBZktZYW1KRHA3NCtG?=
 =?utf-8?B?TDlMeXpxWVdaOUJreUhJWDdSMjFwQko1bHhwYUg3SGFKQWZhQ3NFdUpPMVor?=
 =?utf-8?B?a3JLTFljR2QxWFR1dWlmaFYvY1pRWU5BY2Q4TVMxZUFwZXRRYnZzYklHbFB5?=
 =?utf-8?B?VTV5QnNKbWFhSkJvakRPWXQxZVMwazlyVFpKenNua05NaURjZVVmTkZPOFE0?=
 =?utf-8?B?RklPajlnOVl6b09ORHcvRHNsbkxXMTdmOTFKcHphMG4xWDRCQm9oRkJHcFVk?=
 =?utf-8?B?Ym1JT0hBMUJqZzFORGh4TlhxUkJ4eHpWVXFrdkVvd0Fid0NzNkV4UTlaSDN3?=
 =?utf-8?B?bUxoSmdsa1J3PT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 63c1ab07-0340-4aaa-6bc8-08da076929c2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 16:22:28.1476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 NzP0Z2kHJMNu8aNRMm25exdhCuJgz4BleyUaLFIMs2G64IthXtdONp585vqj7tAAP1f/01v5z6wdBlDwHQ7BKIbN/Ew+Jp3la8s2rrGa5Zo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1841
X-Proofpoint-GUID: 1zUNU42I6VZXBvvY0-9pGum03Of4PU0P
X-Proofpoint-ORIG-GUID: 1zUNU42I6VZXBvvY0-9pGum03Of4PU0P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-16_06,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 clxscore=1011 priorityscore=1501 mlxlogscore=999 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203160099
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Mar 2022 16:22:33 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7094

On 2022-03-16 11:20, sakib.sajal@windriver.com wrote:
> commit a83623a54a375d3ae9198a135b94379881a2b7a5 was added
> to oe-core which removes 

The phrase:
    "was added ... which removes"
is awkward. As a student of Strunk and White, I suggest:

---
In oe-core, the commit:
    a83623a54a Revert "cmake.bbclass: Set CXXFLAGS and CFLAGS"

drops compiler flags overrides for all cmake-based recipes,
causing the ceph compile to fail with the error:
   ld: cannot find crtn.o: No such file or directory

   collect2: error: ld returned 1 exit status


Add the override back for ceph to fix the build error.

---

It's always good to include the key parts of the error log
so that someone can search the commit logs for help given
a keyword.

Bruce,

Did/does this error show up in your meta-virt testing?


> CXXFLAGS and CFLAGS causing
> compilation for ceph to fail.
> 
> Set CXXFLAGS and CFLAGS to resolve the issue.
> 
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>   recipes-extended/ceph/ceph_15.2.15.bb | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/recipes-extended/ceph/ceph_15.2.15.bb b/recipes-extended/ceph/ceph_15.2.15.bb
> index c72953a..17dbcf3 100644
> --- a/recipes-extended/ceph/ceph_15.2.15.bb
> +++ b/recipes-extended/ceph/ceph_15.2.15.bb
> @@ -66,6 +66,9 @@ EXTRA_OECMAKE = "-DWITH_MANPAGE=OFF \
>                    -DWITH_REENTRANT_STRSIGNAL=ON \
>   "
>   
> +CXXFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
> +CFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"

Does ceph need both of the _ARCH and _OPTIONS to be set?
Since the error is at link time, try adding only TOOLCHAIN_OPTIONS
as is done for:

recipes-core/runx/runx_git.bb

97:        export CFLAGS="${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${CFLAGS}"

98:        export LDFLAGS="${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH} ${LDFLAGS}"




../Randy

> +
>   export STAGING_DIR_HOST
>   
>   do_configure:prepend () {
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7093): https://lists.yoctoproject.org/g/meta-virtualization/message/7093
> Mute This Topic: https://lists.yoctoproject.org/mt/89824093/3616765
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
# Randy MacLeod
# Wind River Linux


