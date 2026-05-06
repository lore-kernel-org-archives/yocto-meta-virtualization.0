Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF08BCD3436
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 11:11:13 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15980.1778065872324859293
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 06 May 2026 04:11:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=K/EQXVFt;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3746; q=dns/txt;
  s=iport01; t=1778065872; x=1779275472;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=+52+2sTlFKKWwqtg5JbVdoUqWKm3JvNfXvmWRKt5f2Q=;
  b=K/EQXVFty3a+Wig12JYLU3z8akO3M0olEp3TLLKlTB8GVOHsdim/0LyB
   ot79Yy8Nu2+MihrvY/PFK9QNXpLx1sMIEkbsO+c0bb4wsAPANi4zFLIxJ
   SFfWCTJ8AnlhwRrjHJ/uZikPeZilcbUcFJpO1EnVkozCgkLECC3jHmTKW
   bo2xNAy6t5//9CA/vOZGOU/LL+HURjePG15shCiYZCpe6KuMGzRHw30MT
   Iui6u/k65oKP2t9PgjfAayxKMwqRNIvOKCgp4pOxDSYm2OWaTa9lpmIr9
   nqOaXKQSVla5EY00bXtrTRvxYaHQQbhqp+AD+XiRb3SbT7gWezXvRaSoB
   A==;
X-CSE-ConnectionGUID: 2HQNkSlCSd6dAMhfTvs1Sw==
X-CSE-MsgGUID: 09Mxyq55SkuXx6I0Kbe1MQ==
X-IPAS-Result: =?us-ascii?q?A0C/KgAWIftp/5T/Ja1agS6BBhCBUzFTgQaBI4hsA4Ush?=
 =?us-ascii?q?ggBmjaIVg8BAQENAQFRBAEBhQYCDI0lAiY4EwECBAMCAwEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QoBAQUBAQECAQcFgQ4ThlyGXRZnEgEMcycEAQ0NGoR+FkADAQKoTAGBPQKKK?=
 =?us-ascii?q?niBNIEBuhOBTYhZASqBNQGEFoR6JxsbgXKBV4MmhEWCF4F8gi8EgiKBDoQcg?=
 =?us-ascii?q?VCCFocIgUQiAyYzLAFVExcLBwWBMzMDIAovLQIULw8aMh1wDCcSLBc0WBsHB?=
 =?us-ascii?q?YFLgkhvFFaBBYRgeCMvA052AwttPTcGDhsDBIE1BYlpB4JIp1yBfKF6CiiDd?=
 =?us-ascii?q?ItqliQXhASNE5lUmQYiqHQCBAIEBQIQAQEGgX8lgVlwFYMjUhkP2EOBNgEBB?=
 =?us-ascii?q?wIHDQMLgWiRfQEB?=
IronPort-PHdr: A9a23:CM9SeB0mGRkHIcrxsmDPmlBlVkEcU/3cNwoR7N8gk71RN/jl9JX5N
 0uZ7vJo3xfFXoTevupNkPGe87vhVmoJ/YubvTgcfYZNWR4IhYRenwEpDMOfT0yuBPXrdCc9W
 s9FUTdY
IronPort-Data: A9a23:0k/zCK+G/w0HYqXjpKxdDrUD5X+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 2YWDG+FMvjbambyet0nPt/j8RtVsZ6Hmt9gSAVlqHpEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rb+W8xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mpyyHjEAX9gWAsbzpKs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2lsHbQ++d1zKlpCq
 /AxDTADUg6Y3tmplefTpulE3qzPLeHxN48Z/3UlxjbDALN/GNbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP00n1lQ/UPrSmM+ki3TleiFYr3qepLE85C7YywkZPL3Fb4eNK4zWGpoO9qqej
 jqX2nToG0xHD9+C+Srb0yqPjOKWuBquDer+E5X9rJaGmma7w2EPAVgIVEGnvPC9i1y3R9NYL
 WQQ+zEytu4j80e3ScHnWB+1q2LCuQQTM+e8CMUg4w2Lj66R6AGDCy1dF3hKaccts4k9QjlCO
 kK1ou4FzAdH6dW9YXmc7byT6zi1PEAowaUqPEfokSNtDwHfnbwO
IronPort-HdrOrdr: A9a23:NnHEOaD6wvD0mlXlHei4sseALOsnbusQ8zAXPh9KOH9om52j9/
 xGws576fatskdsZJhBo7y90KnpewK7yXcH2/hvAV7CZniqhILGFvAZ0WKP+UyFJ8SczJ8Q6U
 4DSdkCNDSYNzET5qiKgnjcLz9K+qj/zEncv5ak854bd3ATV0gP1XYfNi+rVmdNaE1tA50/GJ
 CA5sxBiQaBVB0sBPiTNz0uZcSGg8fEuq7HTHc9aiIP2U2jnDmo4Ln1H1yi2AsCUzRA+LEm8W
 LUuQ307KeuvpiAu1DhPmnogKh+qZ/E8J9uFcaMgs8aJnHHkQCzfrlsXLWEoXQcvPyvwExCqq
 iMnz4Qe+BIr1/BdGC8phXgnyP61iw11nPkwViExVP+vM3CQi4gAcYpv/MYTvKZ0TtigDhP6t
 MP44urjesSMfoGplW72zH8bWApqqNzmwtlrQdctQ0HbWJUUs4ukWVWxjIlLH5HJlO11KkXVM
 9zEcrb+PFaNXmeb3zfoy1T5ebEZAVqIv9DKXJy4PB8FFNt7StEJ0d0/r1uol4QsJ06UJVK/O
 LCL+Bhk6xPVNYfaeZnCP4GWtbfMB2EffvgChPlHb3cLtBPB1vd75rspLkl7uCjf5IFiJM0hZ
 TaSVtd8Wo/YVjnB8GC1IBCtkmlehT2YR39jsVFo5RpsLz1Q7TmdSWFVVA1isOl5/ESGNfSVf
 q/MI9fR/XjMWztE4BU2BCWYegYFVAOFMkO/torUVOHpczGboXsq+zAaf7WYKHgFD41M1mPdU
 frnAKDUPmownrbL0MQ2iKhKE8FUnaPj65NLA==
X-Talos-CUID: 9a23:/YvKGWM3/Gi6Ku5DAgle0k0vHusefiPR5VLQLXOmEj9SV+jA
X-Talos-MUID: 9a23:Bjsr0wivBU8sYhinHG8L6sMpbJZN87W3VR02kog2q5elbQ96Nm64tWHi
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 May 2026 11:11:09 +0000
Received: from alln-opgw-4.cisco.com (alln-opgw-4.cisco.com [173.37.147.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 820C618000148
	for <meta-virtualization@lists.yoctoproject.org>; Wed,  6 May 2026 11:11:09 +0000 (GMT)
X-CSE-ConnectionGUID: HVzwlz6zSveKEJ4OnKjEtw==
X-CSE-MsgGUID: XvJSmYWuQ8Sd96q/YZaGFQ==
Authentication-Results: alln-opgw-4.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.23,219,1770595200"; 
   d="scan'208,217";a="74057313"
Received: from mail-dm2pr0701cu00101.outbound.protection.outlook.com (HELO DM2PR0701CU001.outbound.protection.outlook.com) ([40.93.13.65])
  by alln-opgw-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 May 2026 11:11:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HrcMs6bhqoP1im3X8N0jBAOmBCq7cfZ38nZPBBWhGX4WxILmy4cJGucpdPGkCY5NUePVkP0/88Ns9fK1plysxoH59oKLoVomn5g0ARIrCiSzgl4JEy2RejaIdO/EqqnMX4Vfc546sWNEdNKtTliVSmn9U6AQVqoH5904cQWd/aUGdWpTk1NDaXwvQogHXG0Wfc6AwDC/B1ZMLwehd9JJm+G+beYe9qJBEv3NZS3OcF0SZA5EHAz/JlCAQTfZDRsyEazscz6U+LHZzmE2K/AvElqQchkoPCaxLv8GfFtWY/hlT7e7e4Uqpwqx8cS/b1QwIJFpgWcNYxiWDg4KYLFI2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+52+2sTlFKKWwqtg5JbVdoUqWKm3JvNfXvmWRKt5f2Q=;
 b=nRl8wdT4lA67g5d88pEqTiF44qb8yxzMJ6j6Wfkgk111II6pKWXW5JPaY+IPwyw9M2ixOB+FDDFCpXRi7JA9Irt66Wm+SYLTQztxNbN9Dkma1nhK/Ser/sP0n16BW2GGj25Q4xZZ8/gI29ReSMULIrpENrjosQ8OVYPYJfVaxgaATaAT6nS37cZ9DsqFw49DojsU9sF27NkMNS5152UdjZNEXLEeqK+xETCFllbLh4+ds7B0jfuGnw15CR9B3+LQF48Lc3n7FkrJv/4U7oepUIftezYkvUyDhpMtj248+Nig9Fmik/1C9FBH7u3Vydx5R5i0W2LIUrk1I/tabyQ1CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) by
 MN2PR11MB4648.namprd11.prod.outlook.com (2603:10b6:208:26f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 11:11:07 +0000
Received: from DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543]) by DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543%2]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 11:11:07 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>, "bruce.ashfield@gmail.com"
	<bruce.ashfield@gmail.com>
CC: "Viral Chavda (vchavda)" <vchavda@cisco.com>
Subject: meta-virtualization: Wrynose (Yocto 6.0) Release Timeline
Thread-Topic: meta-virtualization: Wrynose (Yocto 6.0) Release Timeline
Thread-Index: AQHc3TaiX9MFz15NlUCpPeyX3PdcvA==
Date: Wed, 6 May 2026 11:11:07 +0000
Message-ID: 
 <DM4PR11MB61893678145DA76AD96D0B39C43F2@DM4PR11MB6189.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6189:EE_|MN2PR11MB4648:EE_
x-ms-office365-filtering-correlation-id: 565bb539-7393-4452-cb67-08deab602bf0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|56012099003|18002099003|8096899003;
x-microsoft-antispam-message-info: 
 1D8QRDlTnJDKArt6xnUdWsUxaQqeQ4gGKbYgSScONGQF/SLAyXoZZZ9zLLSe6yWxD1h6i//N7vTHCUoEY1CWea3FdiSlOwui+3zUnY+rL0+AaKFAUQveR3TOQnrBsShirK3XD4yWhzaTJ4K6M39vLzZm2mat0wydpmS0REJEkSUxqxwNJg2blgwzSnrXe0ZhU7JEHrTKT7lQDCKXxsQs7GD7pA6aGQiEKG2sUXtwiUbx0wDF6oB+2Zmb+ru0dbGerRUTSWFaqKmR7BLKCL9tyy5WwBMcCgoZYtne36G10W7wyAloFOwYxeKoJjjA7ZtKOA0lAaTArgym9Hl79VeJYi1q966zh1IDiEMFpP0YbqRPN/mtvhV5mVcR5ypRkDeonB57ouA3em2JQTrQDDG2z5MDaBvF7smWjhL8GpnlF20QV8COM4UuK0nvCS+LGUCrAKk+J6Od+zPefzPyO0IATp1FgL8VX9vHndG14qnXQhqcO9YxKLMCBbOmsliaHlBosOMPibMVEjAJNjtQfsIzp70j/KCb5VYXhz4V81CM8fr6qFXEPknVxfq/lJEcl2dRO99V1L1XHmIBrsGLjjw2Celgg8Np+qArEmk0DFIXGY3D3Sqjc8xFQVoNiwXftWiJzz8MXVZzALCXQwDvi46pk9dTBA1Kj5YWmuvm7U+ewkHxwBDxeYBt+9eQ8PfvyQan9NCFR7fza9OjKNOWwTPJIpLX+gVkFPI6/xQRayYRqSMMLbD2P8bIhW/DZxwykmvD
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(56012099003)(18002099003)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?oeH+pKUGmywQRyEMNgNHc8aKw3WpZCzRfLJDzTG1i+WazYdsKKKGBUeRc6?=
 =?iso-8859-1?Q?KqPh+6wECGK8yDqoXbxbkfgYJeb5i4Trol5O6eFu8NSM6meFsd5UdTyMaa?=
 =?iso-8859-1?Q?J52+M+p6fJWLGT41rJh21a+0d1qfZ4p2mKXwHkX13HaljTHfGCM3/U3fba?=
 =?iso-8859-1?Q?u3n3o1jolNtP8EctZm5dn8Fbnhp9krVrYMJMn0QXE2EPH2BVr68FoCUI7E?=
 =?iso-8859-1?Q?N1sxS55RTtY+86fTqRCNgFkMEEcpg3isu15QzLvvCOJvl3qUh93Z6UlOoC?=
 =?iso-8859-1?Q?defBOsuCrcWMx6qoObTtJ5rJQci7F8glEXppj/ZEppKzTbLMkZL2REwdk5?=
 =?iso-8859-1?Q?oyFpBsCCxHsCo/GHwlu5jVA95pNWpW8jpGpcHlMpAXNNLGwcIJ6btHdfRr?=
 =?iso-8859-1?Q?hJa+lLFC5JBMhxt/27KLQiJb/suz5DMQ6P0sGOmF2eWIz8w9O6wkZKkhcJ?=
 =?iso-8859-1?Q?8RyhRFcQifg6xycyl1ZsaVojkIv8x92fizG0Tpjrde3uHOuwTjkyZQpCRx?=
 =?iso-8859-1?Q?P+rjjbg+tpGV7kqQ5FOnY8h1PuWMbbowhCLJb1HVr0T0eh66hXHugvJAQ+?=
 =?iso-8859-1?Q?vCvocnYml5pscAUPqfeQu7GL10SowP+OEsZ+RJtglqt/TzvMUhEyKEyYn1?=
 =?iso-8859-1?Q?YG0F4mZFUEtQ3ZDFZsGesONlmcjgWDyJvpuK1/w9GS8kySTr+3eZP2Xspb?=
 =?iso-8859-1?Q?6Y0Mt/q4Xb4WBO8d0/ScOLBhLZ7YdsJpHPZicYT/XBAzxuevxu0rLxsSSR?=
 =?iso-8859-1?Q?kuG0raM5remgNlmh1HX5HHzur1AV9g5aljVEHv86spLazWWOCoSgS64m48?=
 =?iso-8859-1?Q?AhHgQACYI9ok/zvmBV3Fl91px/9USRcaG2HL/wnd3PJ/lBSlBp9TrwGdyR?=
 =?iso-8859-1?Q?O3uhw6UJYfykCyMUITbPuGm+CgIHAjEmxkMQJ0yfTQ15u/gTqc6aBoVRLT?=
 =?iso-8859-1?Q?5A6QG8a2L74SyI/9tCxog1ctAg+zNs5xwUd+tA81L/XEJLIJvO6ao2AFTz?=
 =?iso-8859-1?Q?4VdIZSb6DJg2mDkxzAdj/TeAceiCbRAb7pFt0tcBOvSyWEZy8vTsj76/OQ?=
 =?iso-8859-1?Q?y9y/oT9UcHXSlvqW7Lazdv3Mvma2s4glY2hR+IwAkpJmkkFwJtWtKVActd?=
 =?iso-8859-1?Q?9lHyELIm+QKuhC+ytxvkfMCRrHW5cKJHuVpREr4oe2BvqW+kS6g9LIWnAr?=
 =?iso-8859-1?Q?UUWPiLpEg9OtSLfp4euYMgXUrQ4YnPKNJYMDT8VGsjEHcLPSLMSpn1uWbH?=
 =?iso-8859-1?Q?M7Jtb4Dag11+DkXNbJWr/SB4UEECSqx/DO3pqp1tWkghcaQMcNKSwibpa8?=
 =?iso-8859-1?Q?TngXO39OHROT7dKibVpOL3ZVStLzfSoOz7fp4qiqhPWXha2cGom7cTWH8A?=
 =?iso-8859-1?Q?Nj0CShC4rX4CIR7PnhHNgRCR4gD140lDrUS8BYgMeO5LLkPichtjz3E17i?=
 =?iso-8859-1?Q?0w9ctMwT1ck8KdL7dIqdHTPGaddeY3jgoEFTeEvh/0vDMkWzr77BWatt1I?=
 =?iso-8859-1?Q?a7vIDySMLyoqvHyg+miPnCzT4Tm1Yh59vAWXA/ipoPRysDO15WZEmu1KnZ?=
 =?iso-8859-1?Q?zh32NejijHf4VpagMlxNhVNtg99kSbmo5PwI+9jwHzKhlmM+qM+qqAYiN2?=
 =?iso-8859-1?Q?66wWTXiIDl4KiZ8cEsovdN6X9adf3v/v7sgQxQeu1ljYBdoyJY5Hr3IFpY?=
 =?iso-8859-1?Q?z1Tp+4wbkECiW6Tcu6WbBnC9/MVozH6gTnbBUSJS3KcduQg6tVQE28ZsoZ?=
 =?iso-8859-1?Q?kjUHP6qL+10WFrQbzENswO0LT4SlmbUQOYJ3X8bXdIxO3x?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB61893678145DA76AD96D0B39C43F2DM4PR11MB6189namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	IY0wHq5NcmYx8pZZKLOnxXe6X7FCK6DBVZ7JX7lnPOEasCwmhR1F+WPKI+PFkk8nJWqYW+ubrrQAXhkcson/DdbMc9nYeqN1xvyQYrDXB6oNx4T5i5TqVhFD9qjZ+8KyOq8s53GdzzHwNjxRJyzSvr00HTJO10XwaNfpNjWiRK+lWjLcM3oY2/njGLDlJ6DMK6qVbWXXirJJpM6/7hRJMA1trgJJad8jjD0NHxz0vwlwm2JIJhdshZ7yW7KYlD041f6+XKvcYiXw1mbsHbAffInVsw0Ff3fSn0DgLTjunTiJjrWXiff+m82fUdx3N+yLH9BPUVG/ZWnN2o/edZMpRA==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 565bb539-7393-4452-cb67-08deab602bf0
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2026 11:11:07.5421
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nBujXRYKdOJav86GuNSTp3J7dw3PhCxMaywZh4sTHZmSvzCOK4L8IVDe8ivXfDM1PVnYz4Gnkxd+Jwdu5gAZPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4648
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-4.cisco.com [173.37.147.252];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.252, alln-opgw-4.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 06 May 2026 11:11:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9786

--_000_DM4PR11MB61893678145DA76AD96D0B39C43F2DM4PR11MB6189namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

I hope this message finds you well.
I understand that the Yocto Project Wrynose (6.0) release is now available,=
 and that corresponding branches have been created for OE-Core, meta-openem=
bedded, meta-selinux, and bitbake. However, I do not see a dedicated Wrynos=
e branch for the meta-virtualization layer at this time.
Could you please advise whether there is a planned timeline for Wrynose rel=
ease for meta-virtualization layer?
Thank you for your time and guidance.
Regards,
Deepak

--_000_DM4PR11MB61893678145DA76AD96D0B39C43F2DM4PR11MB6189namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
Hi Bruce,</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
I hope this message finds you well.</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
line-height: 20px; background-color: rgb(255, 255, 255); margin: 1em 0px; f=
ont-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvet=
ica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
I understand that the Yocto Project <b>Wrynose (6.0)</b>&nbsp;release is no=
w available, and that corresponding branches have been created for
<b>OE-Core, meta-openembedded, meta-selinux, and bitbake</b>. However, I do=
 not see a dedicated
<b>Wrynose branch</b>&nbsp;for the <b>meta-virtualization</b>&nbsp;layer at=
 this time.</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
line-height: 20px; background-color: rgb(255, 255, 255); margin: 1em 0px; f=
ont-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvet=
ica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Could you please advise whether there is a planned timeline for Wrynose rel=
ease for
<b>meta-virtualization</b>&nbsp;layer?</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
line-height: 20px; background-color: rgb(255, 255, 255); margin: 1em 0px; f=
ont-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvet=
ica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Thank you for your time and guidance.</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
line-height: 20px; background-color: rgb(255, 255, 255); margin: 1em 0px; f=
ont-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvet=
ica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Regards,<br>
Deepak</div>
</body>
</html>

--_000_DM4PR11MB61893678145DA76AD96D0B39C43F2DM4PR11MB6189namp_--

