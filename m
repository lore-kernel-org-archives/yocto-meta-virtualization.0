Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.66])
 by mx.groups.io with SMTP id smtpd.web08.4341.1611726662728097565
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 26 Jan 2021 21:51:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=iziFPdc/;
 spf=pass (domain: windriver.com, ip: 40.107.236.66, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZhxFc3eKk6KvY6RsRF8aX+GVBy4Sy7/KPKP8n6dWZXkEqEGnUeoLLdLj3U1Sm2h+flfFhYZdoxH9xQiY4E3XzlV8ekbVAS5Bytju6EnKVSsSc0KO94jChvfoQG3DSbxahJ9TB+nZXUm5Ac4XxFpI5L/jdhwD9QgSeCrDfeBcIMfGmx6SszyrPDXLzb1GOA0jrQfwe2NHHkk8UgI7S8/Gf5jeyhRp6ab984llhIPrhq+RdbOYzwsJQbP24UQaxhBlkEfb05y7VXwVe0zx94K5F+vmjFpcdLfkAZkECFwjT1C7C1kuZY2hxOQyVZrSbcQKD2Kes0CjWwJbPcd9QCBig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Li9C/2TO81s2N3BeTERGaFFtt1NguKEzttlp3s4BRY=;
 b=niAAhoSmMrhcCQgxdUv5g/YwKzd14pfTOWoShSLDAYbe5fuGmzXo/4JF0HprnzOo76cbr8gwDa4i7+Npjgn2qVl1KnUOSea/V18jLG4vE8EBlq2TPnP7aE556sx4b+liDdcLAL9ZSpc6Jt82KRtLp/XgQcAkQAagQqaKhAblevu77F3ceHM6pg1rsvQpMMSIjOU3s0DplST63RhqPCTOKd8MVdCk5dfQhI2OnpfhQkmTfVc4PgMgxQXmS61/kVXQzM3eQ3BOx0D0tCSCc6fyAuVqxHLTpj4FsxPmwxs3O6N7hYLvtTbdsbrSzuCyIwQ4WhnW309wZTsehP4erkbxkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Li9C/2TO81s2N3BeTERGaFFtt1NguKEzttlp3s4BRY=;
 b=iziFPdc/nP5liDMfoszHHFjoRMTrBuDtyEMtkXORtC1i60cG7grBsJpPWnj7LwLFjLuh8K3DNaTROJOOWto0nsywMTwsR0KloTXCV5kcCYFT8VVct8Ji5ccG9R8HStkI4N/Qj687RDrYA0A/idDPn3y+JXNC3BF/CKQjcGApnxU=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA2PR11MB5050.namprd11.prod.outlook.com (2603:10b6:806:fb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Wed, 27 Jan
 2021 05:51:00 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::10d7:6fc7:935:f29]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::10d7:6fc7:935:f29%7]) with mapi id 15.20.3784.017; Wed, 27 Jan 2021
 05:51:00 +0000
Subject: Re: [meta-virtualization] [PATCH] celt051: update SRC_URI
From: "Changqing Li" <changqing.li@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
References: <165B98B8B8245A4C.28472@lists.yoctoproject.org>
Message-ID: <37b49c77-76b0-2175-4e87-eeb4c3f6ccff@windriver.com>
Date: Wed, 27 Jan 2021 13:50:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <165B98B8B8245A4C.28472@lists.yoctoproject.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SJ0PR13CA0060.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::35) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by SJ0PR13CA0060.namprd13.prod.outlook.com (2603:10b6:a03:2c2::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.5 via Frontend Transport; Wed, 27 Jan 2021 05:50:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4dcb0148-a534-47ee-cf95-08d8c287864d
X-MS-TrafficTypeDiagnostic: SA2PR11MB5050:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB50501B3B70716E7EA368ED2B82BB9@SA2PR11MB5050.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	b9PYznueCMXNa51MGWIqw2WL259juaZ3ScYuBOzAYQwEdm/sGDaxtkj56GKk+wO1Bp/8RsuXWrFU+3iR3kV3U+n4qH5FwPmXUtpPRjb0laL6ICwJ4AljM1Fy+Cl+6ILD/fdLvVViSbIew4pNQTyikUf4y1z/t5N/K7xJ97OZ+OOVXZulcmPCThbvLHWf9Pqa2M7fCH/hIAWe/6Pj9y9HXCsmZw234/+FmsMtZjpiDEkjnbzY5Lhac66MoAi2qCxTKDzpkJtcZix2hcsjItEoAhXsaSWhd8NQcTrNfPdsFrYtrPT4RTbhJlZJ2GoBZhJb+Mp6xbR4vy4M76EfKP56QOpFLTB5OQLYpom8DpK3DRaLT8EoIeVKc61O4F/HU6K4wyImlat+6ZyfNNe76QFVopK0fNPTRI6lnFkwR6cW/IqTTu/uw/bxYZ2vQVD41LVwnqTk0AXl2S3yb/vz9JSOteGfhbgWsK7ZqhJMMIHatoNFspKFo0PDEzhmPFRvvCf27OFCbMutFpphRYRJOzTcvtcg8Bh7gR7WnStiB2rfFeY2YG97A9GxRL1v2csCjE4t0CMVVQOLKVO0Hv3RhoRQxQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39850400004)(376002)(136003)(396003)(6486002)(15650500001)(316002)(5660300002)(966005)(478600001)(6916009)(86362001)(52116002)(16576012)(8676002)(6706004)(186003)(16526019)(53546011)(6666004)(31696002)(66946007)(8936002)(66476007)(166002)(66556008)(83380400001)(33964004)(2906002)(26005)(31686004)(36756003)(956004)(44832011)(2616005)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?aERvS1B0OWxmNmxMZENIUTRJNk9uQ0liQnZ6SW85bDFqWElxL2tjclZVZUhm?=
 =?utf-8?B?cWJuanI5Y29zcXYxNlVFYlZHRm4zMWNhOWxXMXlWRmtBMU5jZ0dlVVBUb1B1?=
 =?utf-8?B?K0lWV2dGdlJ6UGVkbk1BRk1WbzhBVitIRlNnQzVBK0UwUTNPSXVHM1Fwa1RF?=
 =?utf-8?B?QjdZZzJsUVR4OGNENFY2RkJDeVlKaUl6NHRiNUpTMzBwYXdrdWV5K3k3THdW?=
 =?utf-8?B?V2RBdi9CcEt2U3l0RERIeFY5bEtmYzhjL04yb2ZGQ3l1ajdlVU5CL2RBU0Zu?=
 =?utf-8?B?RzZWMVBHOENyWVN1dWhIcnBqK1lDNGNVQzdsbi95S0Nrb01zTEtOdXJ4K3JJ?=
 =?utf-8?B?V3F0TzR6L29TTG5mYUNTZ2FHSHlMcHpISXJZSTFXby9YK3NXT21sSkg4bUFI?=
 =?utf-8?B?Q0lweHd6MVNNdWJCN1YrdDhSRjhpMFF1TWlEV2I2bDRHSlJTaElOb25PWkF2?=
 =?utf-8?B?TnArdHNISE0yc0M3R3dKSTJaSS9ESzF3YVFmbFVoM2ovZE9xNHo4ZkxBeUM1?=
 =?utf-8?B?U1NZZlAwT0xzb3A2VkZ5Q1RRelUwV095V3JYRjVIbk8xWVBJMzM2aGMyMVBp?=
 =?utf-8?B?ejdUU1F4UFBEdDRSbkZKVU5UL2o4bWRZaHdxQmZocVBnRHJiOEZPR29jT2ln?=
 =?utf-8?B?ZjBIY1FNUmM2WWxVOVRyTGJxeHRFTDJIUzBBY0RSWThwdmo5ZWo4b2tYY2JW?=
 =?utf-8?B?ejhwTGJGTloxTnJQN0thRm9ya0Z2bWprOFhXMEF3ZTF2Rk1BcEhEK3RCTmhS?=
 =?utf-8?B?MXR0UlBLRXJnZEM4RzlYQmRsOWhLbnhnYkhUeHdsQTV0cTZjQnlwaHdWdytN?=
 =?utf-8?B?MkdxbGdzYzlrYnFnVm5zQmhYTXVMSndzak1pL04vbVc1dTNWeVREVkR2cmo0?=
 =?utf-8?B?eGFsRk8rMzdoOXdENEpsOHZFdHI3bzROZXhkUC9oQVFWTGVzc0tQcFc2bzRi?=
 =?utf-8?B?emRGTHo2dEI2dTJaS2FiMmduQlE5RkFpR2FYK0x3dkpRaTdQYUU0dDR6WWE5?=
 =?utf-8?B?d1JKVEdnelVsb3phTEUydnpJYUFFUUJ4UjhQQlVMZ1hsNGZxc3JLSGppdHBo?=
 =?utf-8?B?M200Z0ZaOXZGMVBaZWlTbzdFNVdpRU5RMzZlOEltcEE5dDB2RitLK0pZaWFs?=
 =?utf-8?B?SndTSTVyeDRYOHEwZ3pMN2hEcDVmSmUwaEN3Nys3Q2J2a09oZmd3cUJvRGd5?=
 =?utf-8?B?ai9rVVVnWGRwVHZwRlJRa3BPTzhURnhtRWNVWE8wUHNqbjl2Z3lhc1p3bVVF?=
 =?utf-8?B?RlFNZnNBV1puM0NpcHJIbE1sY2YzRERGS1ExWlc0UEtnZ3ZBT1NrT1FuM1pP?=
 =?utf-8?B?c2VVRmNza0N6ajFoaTFmR3U4TDBpN1Yyd28rQkJIMXpya1BVaWwxWjVqTGNL?=
 =?utf-8?B?V0h6aUIvbFgyb2xqc2FURm1WRWxkYVpTeEpEblNja0ozamNHUG9JMmtUdWcx?=
 =?utf-8?Q?jzF9BAeo?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dcb0148-a534-47ee-cf95-08d8c287864d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 05:51:00.5463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IYlLXjaFOeIZUbjoXsk/UqHfspZ1Y+Gm+jDCEjnu2WreNiSjIXX7mjclMKODjY3zZXpbetC/uHjYGfoGuR63fYjtgP5qpQkL9muwTNErut4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5050
Content-Type: multipart/alternative;
 boundary="------------3E17E4EB1311DECB9BD9602A"
Content-Language: en-US

--------------3E17E4EB1311DECB9BD9602A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/19/21 5:39 PM, Changqing Li wrote:
> original SRC_URI is not valid now, offical CELT repository
> moved to gitlab
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   recipes-support/celt051/celt051_git.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-support/celt051/celt051_git.bb b/recipes-support/celt051/celt051_git.bb
> index ee388214..6eab5669 100644
> --- a/recipes-support/celt051/celt051_git.bb
> +++ b/recipes-support/celt051/celt051_git.bb
> @@ -17,7 +17,7 @@ PR = "r0"
>   
>   SRCREV = "5555aae843f57241d005e330b9cb65602d56db0f"
>   
> -SRC_URI = "git://git.xiph.org/celt.git;branch=compat-v0.5.1;protocol=https"
> +SRC_URI = "git://gitlab.xiph.org/xiph/celt.git;branch=compat-v0.5.1;protocol=https"

Gitlab is old repo, which is no longer used for active development. but 
at least we can access, the

new repo has down for several monthes.

>   
>   S = "${WORKDIR}/git"
>   
>
> 
>

--------------3E17E4EB1311DECB9BD9602A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/19/21 5:39 PM, Changqing Li wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:165B98B8B8245A4C.28472@lists.yoctoproject.org">
      <pre class="moz-quote-pre" wrap="">original SRC_URI is not valid now, offical CELT repository
moved to gitlab

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 recipes-support/celt051/celt051_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-support/celt051/celt051_git.bb b/recipes-support/celt051/celt051_git.bb
index ee388214..6eab5669 100644
--- a/recipes-support/celt051/celt051_git.bb
+++ b/recipes-support/celt051/celt051_git.bb
@@ -17,7 +17,7 @@ PR = &quot;r0&quot;
 
 SRCREV = &quot;5555aae843f57241d005e330b9cb65602d56db0f&quot;
 
-SRC_URI = &quot;git://git.xiph.org/celt.git;branch=compat-v0.5.1;protocol=https&quot;
+SRC_URI = &quot;git://gitlab.xiph.org/xiph/celt.git;branch=compat-v0.5.1;protocol=https&quot;</pre>
    </blockquote>
    <p>Gitlab is old repo, which is no longer used for active
      development. but at least we can access, the</p>
    <p>new repo has down for several monthes. <br>
    </p>
    <blockquote type="cite" cite="mid:165B98B8B8245A4C.28472@lists.yoctoproject.org">
      <pre class="moz-quote-pre" wrap="">
 
 S = &quot;${WORKDIR}/git&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------3E17E4EB1311DECB9BD9602A--
