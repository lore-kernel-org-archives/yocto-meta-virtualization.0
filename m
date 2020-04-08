Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.80])
 by mx.groups.io with SMTP id smtpd.web12.14574.1586361490666663254
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Apr 2020 08:58:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Ek6OR5/J;
 spf=pass (domain: windriver.com, ip: 40.107.70.80, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fr2+dJskrkFpUVobRyiEPe+7fkbLGAMow9cziZUC0D3K+wjlOYd+cGaGkp541C0FCSgzh5D5DfcLKWA7DadfR2jU9/rH679BBgbXUc8cEw86/DOhN2xyScjUMBGLAeRjrOFRcN3hvHpwi2vTLHA5r0NKRiBmSvXDOXif/i8/Xfd52iaVGKiqazHr5dyjh7vQfcptVSC0jsD+OXMvY8EDtV9sQ3gIL+WNJizsvFNE0ZL0QXf2UyQcljkAWa8AFZa5BDs2kce8o/YcC4iyZXygkeJiT1tr4QAUo2Tx7V/f5d+4CC3OYopkMZadBaVB6yhma7lcmagzuhqA4+RNDhjnXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEEhq22LcedbyMGHqYMYt/iGBCWQfigUbMSnz8aoJzg=;
 b=YcLZlcNuKF+xGDNjH72I1WgcD5lK6o/UyTkn50Z9IpsV8nYD/FpUiNKHq/gt4c0zC8zgvk2NQUgJR7e5F0DAijpcLtXyrUIA8pHwk4vMtqzcOs+JpGUuwHKNiOwUmJSuuKxCSwRdm6hjJu19kLgymY8rAHCfU/V2B2SK7z/KZOcit+cCz7niL6KWAUvtA+O/YR/jT8lbdcXQeE2XLVp6m5cpdUvZOLVIAPDewFuOpcoQmPRlNfzblfCqji4SPmiZ+YwuX6c3g+7Bg62TxUsHiQ9TqW9N1a4Kk/KvVXA8yDeLLTVOArX2kspOC5uGbCr/S/UKpvup4E/Z5daqVUG44A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEEhq22LcedbyMGHqYMYt/iGBCWQfigUbMSnz8aoJzg=;
 b=Ek6OR5/Jio2egVEXp0kt5ENBqFIiayJX9r9wFurHrOqiDyuy2PPJdITwaWqs6xp2ukmda8O27QGo5VS7JI0Ma1pXKpOtFk4IF0m9sYvMwolJ7BkXLMiPkRy2rKvVHvEff1K7rlW1AWPrpnIbTjd+3IlIn8eM5ApKJJ+R9ug6kZI=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Trevor.Gamblin@windriver.com; 
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB0017.namprd11.prod.outlook.com (2603:10b6:405:6c::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.20; Wed, 8 Apr
 2020 15:58:08 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::c19b:ca1f:13b8:fccd]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::c19b:ca1f:13b8:fccd%7]) with mapi id 15.20.2878.021; Wed, 8 Apr 2020
 15:58:08 +0000
Subject: Re: [meta-virtualization] [meta-openstack][PATCH] python3-debtcollector: add python3-wrapt to RDEPENDS
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
References: <1603DC1950C57386.15536@lists.yoctoproject.org>
Message-ID: <19fa8f3f-1d74-4552-0c0f-9bb20eef58f7@windriver.com>
Date: Wed, 8 Apr 2020 11:58:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
In-Reply-To: <1603DC1950C57386.15536@lists.yoctoproject.org>
X-ClientProxiedBy: YTBPR01CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::23) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTBPR01CA0010.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15 via Frontend Transport; Wed, 8 Apr 2020 15:58:07 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75d88cba-9f64-4531-bd02-08d7dbd5a18a
X-MS-TrafficTypeDiagnostic: BN6PR11MB0017:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB00174D9B1D4751F53F09A3769FC00@BN6PR11MB0017.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:597;
X-Forefront-PRVS: 0367A50BB1
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(346002)(136003)(376002)(366004)(396003)(39840400004)(66946007)(31686004)(966005)(33964004)(2906002)(66556008)(478600001)(6916009)(66476007)(36756003)(44832011)(2616005)(52116002)(16526019)(53546011)(186003)(956004)(26005)(16576012)(5660300002)(31696002)(6486002)(81166007)(8676002)(316002)(8936002)(81156014)(86362001);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: windriver.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7/dag8TTh9fKmd43exbTtQA3q4lycU8XINRUlOm/5P7NpmJ/dtWWH42k7OiLsIrXxSuTpgwX8hQQ3i3+dwfw2FIK6s/rwrj/FePusUEKSyds1Tododi7z9+9L+y2T/xw8LmYT7goMw0LEZJLoBRAxbxBGX07Dr5ukS024IqsFErIco6bbDe8buJC0cLndHtPBoIFiFj1NB0rlYDLYZ2Eh5/ttaTqTOQxsNxvMzidGaVLQD79ox5MkMr2REx9ACTRA2No0xv5vE+4AEWzyy57D0btSxpQ6BEPrcUw2EeHo6uwVqjGNHkAndh0D3oVUiN5zpZSTQuHg9JNVUb4WhaWZ1tZWSNbHY63oweDrRhopY2pxx+7GY0BJW7YliG4FDGp8z2kLs+r0MhqBUeGKcsBNA9GmzR/GlTgIL20P3iLZT8+nK5PIbF3fYHlSOQCyvKM7hJKD67vpOwvZ4KFFUJYJhMLnZqEthbzF0tCXF/GtfMUu7/lKff7Bdj2JEdrxqQq787+uqQLz23CoP5p1A3CTQ==
X-MS-Exchange-AntiSpam-MessageData: 
	zCiZPK11q9fPiWCB7Hgwr92PuPlpx5w+uM0DEA6zh4BNj+3ZWv+loSayCmLRRLnxzmRDL9BupsogxtixUZ8jZNbbAPQ7C6puqMuJkIdizdQkhS6daVgdFLvGqO7qlt0yw+AKpNVJ+guZ3e+DIzJUOQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75d88cba-9f64-4531-bd02-08d7dbd5a18a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2020 15:58:08.3643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LbKkmrf70TMckvg/bckUPpWtcu1XEClljfAvVtW7GrJar3MUZ2TJ462WB1AcJWVeigtLRZgiylOe7cLqwiAAjZ+jdnnC5XBvbvzOZJPtWJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB0017
Content-Type: multipart/alternative;
 boundary="------------DB4A92466681B0F8297CEF38"
Content-Language: en-US

--------------DB4A92466681B0F8297CEF38
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

v2 incoming - needs python-six in RDEPENDS as well.

On 4/8/20 9:44 AM, Trevor Gamblin wrote:
> Add python3-wrapt to RDEPENDS, as debtcollector requires it
> for some functionality:
>
> |root@qemux86-64:~# python3
> |Python 3.7.6 (default, Apr  6 2020, 18:11:01)
> |[GCC 9.2.0] on linux
> |Type "help", "copyright", "credits" or "license" for more information.
> |>>> from debtcollector import removals
> |Traceback (most recent call last):
> |  File "<stdin>", line 1, in <module>
> |  File "/usr/lib64/python3.7/site-packages/debtcollector/removals.py", line 19, in <module>
> |    import wrapt
> |ModuleNotFoundError: No module named 'wrapt'
> |>>>
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-openstack/recipes-devtools/python/python-debtcollector.inc | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-debtcollector.inc b/meta-openstack/recipes-devtools/python/python-debtcollector.inc
> index d519bfd..f8b5e43 100644
> --- a/meta-openstack/recipes-devtools/python/python-debtcollector.inc
> +++ b/meta-openstack/recipes-devtools/python/python-debtcollector.inc
> @@ -22,4 +22,5 @@ DEPENDS += " \
>   # RDEPENDS_default:
>   RDEPENDS_${PN} += " \
>           ${PYTHON_PN}-pbr \
> +        ${PYTHON_PN}-wrapt \
>           "
>
> 

--------------DB4A92466681B0F8297CEF38
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>v2 incoming - needs python-six in RDEPENDS as well.<br>
    </p>
    <div class="moz-cite-prefix">On 4/8/20 9:44 AM, Trevor Gamblin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1603DC1950C57386.15536@lists.yoctoproject.org">
      <pre class="moz-quote-pre" wrap="">Add python3-wrapt to RDEPENDS, as debtcollector requires it
for some functionality:

|root@qemux86-64:~# python3
|Python 3.7.6 (default, Apr  6 2020, 18:11:01)
|[GCC 9.2.0] on linux
|Type &quot;help&quot;, &quot;copyright&quot;, &quot;credits&quot; or &quot;license&quot; for more information.
|&gt;&gt;&gt; from debtcollector import removals
|Traceback (most recent call last):
|  File &quot;&lt;stdin&gt;&quot;, line 1, in &lt;module&gt;
|  File &quot;/usr/lib64/python3.7/site-packages/debtcollector/removals.py&quot;, line 19, in &lt;module&gt;
|    import wrapt
|ModuleNotFoundError: No module named 'wrapt'
|&gt;&gt;&gt;

Signed-off-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
---
 meta-openstack/recipes-devtools/python/python-debtcollector.inc | 1 &#43;
 1 file changed, 1 insertion(&#43;)

diff --git a/meta-openstack/recipes-devtools/python/python-debtcollector.inc b/meta-openstack/recipes-devtools/python/python-debtcollector.inc
index d519bfd..f8b5e43 100644
--- a/meta-openstack/recipes-devtools/python/python-debtcollector.inc
&#43;&#43;&#43; b/meta-openstack/recipes-devtools/python/python-debtcollector.inc
@@ -22,4 &#43;22,5 @@ DEPENDS &#43;= &quot; \
 # RDEPENDS_default:
 RDEPENDS_${PN} &#43;= &quot; \
         ${PYTHON_PN}-pbr \
&#43;        ${PYTHON_PN}-wrapt \
         &quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------DB4A92466681B0F8297CEF38--
