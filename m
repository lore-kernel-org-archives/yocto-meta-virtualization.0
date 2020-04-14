Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.76])
 by mx.groups.io with SMTP id smtpd.web11.6515.1586847344250933701
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Apr 2020 23:55:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=kpdDf4v4;
 spf=pass (domain: windriver.com, ip: 40.107.237.76, mailfrom: hongxu.jia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i0GGpGnCTNVeREpk6CfKIPPiE40Wtt7CGyyxJj6+dz0ugTQhLW7Keme+omxLTlYHXqaqDvEiH1UdEt+ng8xvkVeOCAIDnUih0KPB3Gqqi5oBtJHxKTw0XHTHHg2osDoS6ehFYKhdQyLj+1c7O7QaPzWtQHD/wLu43BFBa3Aej0vaCwdbtv7yxM/E5a+xOi0qoecfJIVfviZnw+2tOGjCcjf43XGGjf+4qd/1jLtJkS9eFw6oY8bUQ1PVdhpjfILVsfth/wvZcOBc5OcnvnVjYaDxj0kjUMzg8cJ1X0vZ5SKCDJo4pWiwpVNCsLSrSk0LtQLNyFHEgD42f8ndm5I6+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2DhhjPO13BtkQkb3biVLgR8iqqfT/c9KlqVsgoiYaI=;
 b=XWaGH/VkNiYc9/SY7vHgUCdeR1nN99nPcS4D7+uW9kSOI7Az3bE0tzgeG85Z6UD9HnfcyHWb5aks8rmmIXHVUzEYK7LtB7eTP/+fpaeJ/mPtkopCPummd4S6qnGKm/sw6ldEATEnrws4038TRpGiwCQTnpk39rfTPKmwouuJFw0FVwLIEnr6PFCROUddV4psOVpGzosy3o04CQmWj01C/peRdqO9TQVbTvFAfPvt0H9kgO1qstH4bJpl6ZkrV/dJB8vEwNZsEZ+AwfRE6r62OUn7kR8UJmcRw75NVWed0rNXk4TY2bfHBZHZEdrTsP9mZWfKRXU5vzX4PKocwXawaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2DhhjPO13BtkQkb3biVLgR8iqqfT/c9KlqVsgoiYaI=;
 b=kpdDf4v467xIivjMu4FXt8onS+luztbPOiRSSTtC3/OI943PhHUA9Q6ecKo6iUdtTB2PVrPfglVQ7SIMgHNBT/F1JcjmO9pUAQyosVSeXhS6/Rwcxa/ldWSLsJGJAAqJTaEiX+tZzjRhi8YxzAUHKtCC3aoiQCCh1tMDPrGDJ+g=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hongxu.Jia@windriver.com; 
Received: from DM6PR11MB4380.namprd11.prod.outlook.com (2603:10b6:5:14e::20)
 by DM6PR11MB3001.namprd11.prod.outlook.com (2603:10b6:5:6e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.28; Tue, 14 Apr
 2020 06:55:42 +0000
Received: from DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::8c63:fa6f:d4fa:c4a0]) by DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::8c63:fa6f:d4fa:c4a0%5]) with mapi id 15.20.2900.028; Tue, 14 Apr 2020
 06:55:42 +0000
Subject: Re: [meta-virtualization][PATCH 1/3] cni: mark as incompatible with mips for 0.7.1 version
From: "hongxu" <hongxu.jia@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
References: <16059D1ABDED3589.10852@lists.yoctoproject.org>
Message-ID: <d0db9ab9-c636-9a53-313a-2cf053395465@windriver.com>
Date: Tue, 14 Apr 2020 14:55:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <16059D1ABDED3589.10852@lists.yoctoproject.org>
X-ClientProxiedBy: HK2PR0302CA0023.apcprd03.prod.outlook.com
 (2603:1096:202::33) To DM6PR11MB4380.namprd11.prod.outlook.com
 (2603:10b6:5:14e::20)
Return-Path: hongxu.jia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.134] (60.247.85.82) by HK2PR0302CA0023.apcprd03.prod.outlook.com (2603:1096:202::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.18 via Frontend Transport; Tue, 14 Apr 2020 06:55:40 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b22a9eef-a505-48f3-b463-08d7e040d8c3
X-MS-TrafficTypeDiagnostic: DM6PR11MB3001:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3001F23053E913BE54A9697894DA0@DM6PR11MB3001.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-Forefront-PRVS: 0373D94D15
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4380.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(366004)(376002)(39850400004)(346002)(396003)(136003)(956004)(52116002)(2616005)(8936002)(66946007)(186003)(6666004)(66556008)(36756003)(26005)(16526019)(66476007)(44832011)(5660300002)(31696002)(33964004)(53546011)(6706004)(6916009)(2906002)(966005)(16576012)(81156014)(8676002)(86362001)(31686004)(316002)(478600001)(6486002)(78286006);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: windriver.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NmQhle/Uqzia3yUzXoEWsD4UhzcIHr3JwDG8GUxTIBoVIfXbbHcsGHgBaezjcY5Su5keSZyb+T892LLYVhKDIljwBOW4HIRJ8zcTK3PvAhaCsw7uuN6p7AKtHYNfE6RG1q592E0o85Jx2Etb82qr7m1zbm/I5aRch4QmpMyR7R5664FWwMDUGIsHYoDUZC/NXu6MmOERxPOpcaou67A6A/bSAECv7/NJ3JVapYeIi5MDjtJsgVPeT2Hfeenxmdt4zrzYUmBmjUYytIDM3GZ4oXNmyZb/v6lUJuyQxShKSX5Nnp4GBhyUts/6638HQzkjLCe2IkbKW9LBZ5QV5OZ1ByOgjJ5c6q1pRwJU1y5UaEMcLfKi10W/eqrdAHRnRKafOseWPXBpbVaJVfsIFLwsNjIwaPf5vUjKJ3uN3NZjFOXgtFx1CNnNhd/CSVsZHgliGKsUufMSKt1DG/Is6INEGa96sNwl/VBqPBRdCCMAhEAWI0+xB4iOazbg5Y2T7mVXDH6WDB6JmO7mLCrtkPkjUj0iczdNW0iB73nJcIbk/yO7zEwPURxMMtPVyu5BEZXt8THm4CqhGcKwXlbpP0Wr/D2PtxQeXQhxyzyU+3fAYjw=
X-MS-Exchange-AntiSpam-MessageData: 
	uyHUbVfQsz+H7bYUzHdYbcmSWbyRxytOmOdMtEgtCfjs8vYYvwszst2RfUuB9afl7po8drhhhMIhArKBHt0YciHenFAvAY7YVm4/OTA3KRQHYCr29KnIrJjIDj2GUEpD4O+SYPFRJN7MD8P2pYLyjg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b22a9eef-a505-48f3-b463-08d7e040d8c3
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2020 06:55:41.9465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q0NoMERHHYTir4RQhI8s+J9ovKmVoOBBDh6pCPtJRvZZWR0NyD+d32+j/YPpoGxyMTXoqEY4yvPHqTCMTJR6hJ3JWDIpn2QL3O4zsf37H9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3001
Content-Type: multipart/alternative;
 boundary="------------F8F3BEB53D8C603A0411B0F8"
Content-Language: en-US

--------------F8F3BEB53D8C603A0411B0F8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Please ignore this, it has already been merged

//Hongxu

On 4/14/20 2:52 PM, hongxu wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Issue: LINUXEXEC-6667
>
> This version does not build successfully for mips. So mark
> it as incompatible to make things clear.
>
> (LOCAL REV: NOT UPSTREAM) –- wrlinux specific
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   recipes-networking/cni/cni_0.7.1.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/recipes-networking/cni/cni_0.7.1.bb b/recipes-networking/cni/cni_0.7.1.bb
> index fdcc084..a37d0c3 100644
> --- a/recipes-networking/cni/cni_0.7.1.bb
> +++ b/recipes-networking/cni/cni_0.7.1.bb
> @@ -27,6 +27,8 @@ GO_IMPORT = "import"
>   
>   PV = "0.7.1"
>   
> +COMPATIBLE_HOST_mips = "null"
> +
>   inherit go
>   inherit goarch
>   
>
> 



--------------F8F3BEB53D8C603A0411B0F8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Please ignore this, it has already been
      merged</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">//Hongxu<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 4/14/20 2:52 PM, hongxu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16059D1ABDED3589.10852@lists.yoctoproject.org">
      <pre class="moz-quote-pre" wrap="">From: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>

Issue: LINUXEXEC-6667

This version does not build successfully for mips. So mark
it as incompatible to make things clear.

(LOCAL REV: NOT UPSTREAM) –- wrlinux specific

Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
---
 recipes-networking/cni/cni_0.7.1.bb | 2 &#43;&#43;
 1 file changed, 2 insertions(&#43;)

diff --git a/recipes-networking/cni/cni_0.7.1.bb b/recipes-networking/cni/cni_0.7.1.bb
index fdcc084..a37d0c3 100644
--- a/recipes-networking/cni/cni_0.7.1.bb
&#43;&#43;&#43; b/recipes-networking/cni/cni_0.7.1.bb
@@ -27,6 &#43;27,8 @@ GO_IMPORT = &quot;import&quot;
 
 PV = &quot;0.7.1&quot;
 
&#43;COMPATIBLE_HOST_mips = &quot;null&quot;
&#43;
 inherit go
 inherit goarch
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------F8F3BEB53D8C603A0411B0F8--
