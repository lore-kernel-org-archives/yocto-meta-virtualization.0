Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46FC8C001DE
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 00:47:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2450.1690850857444020469
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 31 Jul 2023 17:47:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Wf6xrkGv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7577084f87=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3710LjiH006799
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 31 Jul 2023 17:47:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=TdCbQH39/mRXtoPgwJ7
	bgx3wcLuICPnHMvGHLTjWJqs=; b=Wf6xrkGvuGi9OBhih12bMiF0qCGPOtubIUQ
	aHyECybUJNVoZzWAM53RQYc6mCWAAkl5BmxaS453g95LeSHHaZZaXwX9rL4Ueg8i
	qYCJn0RqA9Be3kQwHlDH5sbcFaikeR9keKG0farv3x4sZvTFj8ZugVyeHimSNAYB
	gQ338pfpz9WWcxx54rOkwgzeMgwegJUaNHn0vqkum5XcPdu2qzWneAdzoG6ov6I1
	mcevjeHJU6vKaHeggk7PTgvZaTKv45Mi7pq/fPkPKQDE/Q/FMNw9zPj5IyP9/VZn
	BJ7vpIZNBifmwgUiQIny7rV5DqAfYn/IHnjJAnykF7mDHg1BJZw==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s6daqrhnu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 31 Jul 2023 17:47:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXoziQyF6KaTha1IkMDfNftuCatkTCWRZySmCd4Tz74ZUG5Y2nzcxMNVSjGfDzElzBdwY5w8Ez4WIuTMdzX5jrQevRBl7Xeh527gWQQZTzTZBTL0Mkn903xNqfwqziMNAgEgQtlOOOCD9oxsdmTNitO0hmn4OmaIrXS8bcZj4Zmw2RR06rRxOwwfMjdzk0SYJLE8rOihSjZIFZKPBxBeeZ5xwZswKx/C4p4ce5EZknf0CANgsbTW3bNn7bfvUFaMQpy/jZdaJONumugQEZA6xnD04Ryt1rK4+0zY9J66hkQeZ/l0ML2alGXSsCQx//ZTbWFkUU8R9kXIyDVzlAOKEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TdCbQH39/mRXtoPgwJ7bgx3wcLuICPnHMvGHLTjWJqs=;
 b=h6E+ymRrMYyHO0tdjs1EFfg4mZyr8TdInsXXe5KQNQxbhOkDhb2l4xTNnG9xdt8ZiyNfTcZJwwvJK7pCdPrscRYU6fJtnm1UKlp2mbfuR8daVWOI7sUtytoBEI+2aaNaXnk9f7w85YD+13PWsmd2x5aWOYmlzw39DJmCAaIdndQ4FYGBuvm8J1b6tnyCEP+npzgRyEy0wekn7fPAVtHUB55UOkTEDOJmNuHaCx4tusIpP2QR+RLY1+RC76xUW5rFj3Tr0luSp7bReBIJZbjC5zb8oGxYqhRbqGtITEDUoHoB5oddj4O8L1sgbDsban6GI6Di3LUlwHrvLarFpS+LUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM4PR11MB5312.namprd11.prod.outlook.com (2603:10b6:5:393::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 00:47:33 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::144:140c:a640:f799]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::144:140c:a640:f799%7]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 00:47:33 +0000
Content-Type: multipart/alternative;
 boundary="------------CW7FqmEBpvFSUuHlFw09Rp1s"
Message-ID: <3c950663-dae3-9043-e999-b3209cbf8ad7@windriver.com>
Date: Mon, 31 Jul 2023 20:47:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [meta-virt][PATCH 1/1] python3-nacl: add RCONFLICTS
Content-Language: en-CA
To: joe.slater@windriver.com, meta-virtualization@lists.yoctoproject.org
References: <20230731211217.2154738-1-joe.slater@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20230731211217.2154738-1-joe.slater@windriver.com>
X-ClientProxiedBy: PH8PR07CA0046.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::24) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|DM4PR11MB5312:EE_
X-MS-Office365-Filtering-Correlation-Id: 609dcde2-32a0-47fa-f9e8-08db9228e457
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jsd88xBDOgi/Zm3FZwUXTARXt8aaDDRzHDuONSi8HmGf70qPyeYRL0HjTZruGvwiVrMlhoU+HLJwsYkuMKyVTyP9jVPgE+lvHAUNJkNJ9+5tyoQW2I2Fi6E5mFno4KZ2xPj7Jw/2fEJf8pGtT7bVqLVrDOJwJVeN2Eq+VMCvqACbvO6AL4v/rnU2tcRTKvROd95A7r0dnNqWOE919gXQuWIw5bYrgXEWFiwprAehKAiKXCNCRLdx2AmJCNhOBmMYrDJRfjNjYXqHoEPPY2xAfV9MZghLGgqH+ebBPruooAxJj/fl1IBEzmV/BGEquicJyD05JI5n20MxZlYW8WCzFHUS/R+S4U7nspMBeaW1qOir6zlNTmkbBMsv+0Ls3BlwJb4kIgbisJe3ID0kBzaixqEM3bktCVfsU9m9e+ptmyPEBb1apGMaIJbw4Zy+DpSmY1AmlEHkMOrYDAz8HEhqjMi1FlnBAQ+1nMqJ+VqXAA3Y1EK3CKQDxCNPecUOeKEY0Y/Mnqct2bnFv0dTbdKnqyagBoA4b82d1jeSP92ctgNm+ANCbUOme+KhgTtwqGyY6gZnc+8c+H5RuUjRPqcQs3IGsVH92NH0puN4jX4VSDwVom/a9KU+cyxOXVX6A2MqIrN/8My6aKY8/8B5jedWrA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(396003)(376002)(136003)(39850400004)(451199021)(6512007)(33964004)(6486002)(36756003)(53546011)(2616005)(26005)(6506007)(83380400001)(186003)(66946007)(66556008)(41300700001)(38100700002)(31696002)(66476007)(86362001)(316002)(5660300002)(8936002)(8676002)(31686004)(2906002)(6666004)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RHBlYzZ2K0FSVmlSem1jcFVwUlhYTjVIbHlDd1dKeUVsNXdVMTEraWt4UkVo?=
 =?utf-8?B?emJGc0xrNkJZMXJqMUE0MmhjSnRJN0NjMTVqUE1QanZ6V1JYZlFuN01WSElE?=
 =?utf-8?B?NzdSWGpNcnh1SGlJK0JOZnBNNkxpSktnN2xFL0l3cEhueG8zb1VFQmlzZFZO?=
 =?utf-8?B?ZFFoL2oxMjA5aFBzb25saHY3Mkh1TkhJLzNsejhuYXJxalMxQnNya0hRTTI4?=
 =?utf-8?B?T2w3NWdIUEpwMVRsQUNCdStWaFRmYnZISUZJaU5JQktLRlJtbVRWU0NBaUdV?=
 =?utf-8?B?cllvWHBSWHZTVUhNaDFnbmFxRDNSZUtESnJ4bUtCY1hvL2VKa2tnY3diNFU1?=
 =?utf-8?B?SUV4RnQrS1REaVZlZ09YbjRGeStqeVp5VzY5VVkyTytKMUM2NHBVeWRaUlp3?=
 =?utf-8?B?Y2ZCc3FWakh5bDlPcWhWNDA4RHZXT0VJZW4wK2cxbyswQXlRdlVRQVBiN2Fj?=
 =?utf-8?B?L2RiaklEK2dtNGNUTmM0a1dWV3Njb0dsNEE0TS9Fa3FheVF3dmIrNXZQUHRO?=
 =?utf-8?B?cjF5bGdiWmprY3pDYWFiR3NYNFZkRzFEK2RneUZ6R2pKTUZhSGhOeTN2eng4?=
 =?utf-8?B?SituTy9OOE9ERkJ2bS9ZbXJQdlVGSUJFYnllbStTWFMzOUp2cGQ0T3Y2R2I0?=
 =?utf-8?B?WkR3b09BN0tuVzYrTGFSQ0pvVjRoc1h2REVNL2p6aVRrVXZzTlc4Z1FxdVpu?=
 =?utf-8?B?Vkk0dlBoRU1HYWZRZTFDT3JiU1BWck1SSkJpRFIxL2hlYWY5eUpNajJLUDV0?=
 =?utf-8?B?L1I1RE5INU5BaDAwS3A1alVBZ0FFYkxKRXlzRE9URzUvWmVtajZlZTVsbFVm?=
 =?utf-8?B?dHhIbTNjTjZwZVdmS2ZZVDhJb3ByQUJhS09TQTlVbjVvamNBMno2VGZIY0tV?=
 =?utf-8?B?S1JTWjlyd3RCM3YvR0VWUHQ3ZFB4cGsrWW5HT21DRDUxV2ZFQ0d6d3hwMWdD?=
 =?utf-8?B?em1LMnRXUkZNdlhndWFnWGpMVnpEUUh1aUhWTmxLNU05L082cUtqZmZjQTJC?=
 =?utf-8?B?NXpIcTN5ZXc4TWJjYnZHMGNsb2VSM25YVHZKaFFMRDl0T3A5ZFhVZzNRSlFO?=
 =?utf-8?B?NUM2Q0JkK0twUTZadWxtS1RXUjRMcG1kS2J1MGRiZERTQWZ6enZKa3dPRDdr?=
 =?utf-8?B?dkVCVThBeWplV0l0V2dCcW1iVmRDWDhseGQxRm1XUWlIRHBpWmg3dzI0ck1h?=
 =?utf-8?B?OWNsZ2QvNTlMOG5MU0VMR1JWRDRIajVrT0c5OENvZW1oakl3aUJKM1MxeEIr?=
 =?utf-8?B?SnFDRHl4L3FZZWhwb1hpREtBdnVtb1N2TDlyeEFsZUltN1dNdmdVYTFleHhn?=
 =?utf-8?B?SWdXMjg1NlYwbVpGblhxNEgzM1BmNnBYc1c3TUIrQURuby9nRWJsZHlYWmUx?=
 =?utf-8?B?RGI1WjRwSGs3bm5qQzlnMjNTbG9FL2FnUGQyQlJsZGdPdG5xc0FTenZUNHZX?=
 =?utf-8?B?NVcrdk9WNUxOd0tuT05ndU1EVjVySmtTUGNjQnZZenNqTEYxOUpBSUQ2eU1z?=
 =?utf-8?B?TXU0YlpTTkVTeHN0V3RiYkUvK25jY2FmVHk2RGpxNzlGL1Y1aEEvUjlJOW55?=
 =?utf-8?B?dlpMUjFBR0FpVk1FaE5uY2hGSHFIWGl5WUR2WkV5N2gxY2hDOWRaSDlYNFhR?=
 =?utf-8?B?YWJDSmp6djhKVmJFN1dDR1BPYWYwbWE3cGVqNkpBaFpPRFZROE5BaURJaW0y?=
 =?utf-8?B?SnhvRDBLZktSRlYwS2dvQkhLSW81dmd2NFBWaHU5b0FhNnNEYy9jSHlpSzBG?=
 =?utf-8?B?aTY1MXBrZFVURFphdVNmWmcweTYyNzVsb0RxS3BLdzQxLzNqT1hHUDNndXVz?=
 =?utf-8?B?aUtnM3JvUTRGcjFoWTVqTlAwMHcyTy9XbjJFaUFZUW1KRzJicFFydmhNQzFu?=
 =?utf-8?B?N1YvTjdIUmZUVnB4WnBsN2F2R2tESW5wYlNLTGZxSXpobWRsU1NzWm8yc2dj?=
 =?utf-8?B?ZU1Jbjk4ckJOVmludDd0L0drcWpYeDJMcm9MMTFJZFgvWUczUmhNcTYrcWpw?=
 =?utf-8?B?Qkwva3IraWROZHp1aHdGMGRxbDR4R3FoRng3aVdHYkVqdnpUbHRUR3JtWXhv?=
 =?utf-8?B?ZWhXbEtZeTNNVS91cUw4U29iOHJSclZrRU9VT1oydnJKbDAzaG1hSWg3dTM3?=
 =?utf-8?B?STdSWGdMMkRPc2VqZnNYc0lHMHJQSmdIZVh3RlpRbmtLVFNSa0lLUmV0blNv?=
 =?utf-8?B?OGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 609dcde2-32a0-47fa-f9e8-08db9228e457
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 00:47:33.2747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9YPgWVoHFO5NXFJPSt9RoE92g7fz0vOctL8e6Jx4CAq36Kdyp+4A5AC9b49v1xRN06gUpIyYnPX4KurUY3gvc9syrOJDjktCp6kYdOXoGK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5312
X-Proofpoint-ORIG-GUID: uEgNujHORja-AguwCLcRx6BaL2MfUJ_k
X-Proofpoint-GUID: uEgNujHORja-AguwCLcRx6BaL2MfUJ_k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-31_17,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1011 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308010005
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Aug 2023 00:47:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8155

--------------CW7FqmEBpvFSUuHlFw09Rp1s
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-07-31 17:12, joe.slater@windriver.com wrote:
> From: Joe Slater<joe.slater@windriver.com>
>
> We conflict with python3-pynacl in the meta-python layer.
>
> Signed-off-by: Joe Slater<joe.slater@windriver.com>
> ---
>   recipes-devtools/python/python3-nacl_1.3.0.bb | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/recipes-devtools/python/python3-nacl_1.3.0.bb b/recipes-devtools/python/python3-nacl_1.3.0.bb
> index 42a3cd9d..e6a844bc 100644
> --- a/recipes-devtools/python/python3-nacl_1.3.0.bb
> +++ b/recipes-devtools/python/python3-nacl_1.3.0.bb
> @@ -21,6 +21,10 @@ RDEPENDS:${PN}:class-target += " \
>       python3-pycparser \
>   "
>   
> +# We conflict with a package in meta-python.
> +#
> +RCONFLICTS:${PN} += "python3-pynacl"
> +

Having one version of a package conflict with itself or another version 
in another layer seems wrong...

Usually, if there are two versions we add PREFERRED_VERSION in say this 
file or in a conf file.

Since this is for the master development branch, why not update whatever 
package is
encountering a problem? What is the issue that you're trying to solve?

>   export SODIUM_INSTALL = "system"
>   
>   BBCLASSEXTEND = "native"


-- 
# Randy MacLeod
# Wind River Linux

--------------CW7FqmEBpvFSUuHlFw09Rp1s
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-07-31 17:12,
      <a class="moz-txt-link-abbreviated" href="mailto:joe.slater@windriver.com">joe.slater@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20230731211217.2154738-1-joe.slater@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Joe Slater <a class="moz-txt-link-rfc2396E" href="mailto:joe.slater@windriver.com">&lt;joe.slater@windriver.com&gt;</a>

We conflict with python3-pynacl in the meta-python layer.

Signed-off-by: Joe Slater <a class="moz-txt-link-rfc2396E" href="mailto:joe.slater@windriver.com">&lt;joe.slater@windriver.com&gt;</a>
---
 recipes-devtools/python/python3-nacl_1.3.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-devtools/python/python3-nacl_1.3.0.bb b/recipes-devtools/python/python3-nacl_1.3.0.bb
index 42a3cd9d..e6a844bc 100644
--- a/recipes-devtools/python/python3-nacl_1.3.0.bb
+++ b/recipes-devtools/python/python3-nacl_1.3.0.bb
@@ -21,6 +21,10 @@ RDEPENDS:${PN}:class-target += &quot; \
     python3-pycparser \
 &quot;
 
+# We conflict with a package in meta-python.
+#
+RCONFLICTS:${PN} += &quot;python3-pynacl&quot;
+</pre>
    </blockquote>
    <p>Having one version of a package conflict with itself or another
      version in another layer seems wrong... <br>
    </p>
    <p>Usually, if there are two versions we add PREFERRED_VERSION in
      say this file or in a conf file.</p>
    <p>Since this is for the master development branch, why not update
      whatever package is<br>
      encountering a problem? What is the issue that you're trying to
      solve?<br>
    </p>
    <blockquote type="cite" cite="mid:20230731211217.2154738-1-joe.slater@windriver.com">
      <pre class="moz-quote-pre" wrap="">
 export SODIUM_INSTALL = &quot;system&quot;
 
 BBCLASSEXTEND = &quot;native&quot;
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------CW7FqmEBpvFSUuHlFw09Rp1s--

