Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD3C4C5DF86
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 11:32:27 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4979.1787139139751535154
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Aug 2026 04:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=e1exwTaj;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=33986; q=dns/txt;
  s=iport01; t=1787139139; x=1788348739;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=mXgE5UfiWIFKgdpznzxYupvf/BkWDDeP52aFtIA4Pxk=;
  b=e1exwTajYe91qrTqf3MmLBvtdF6N+lm4mRtRbJaRB+dZQsCj1bs1/kyN
   ulQlF7NfFqzaF3vnCyyxSszL8k8Fbol5CZAGPI2d96/MiqrY375kao5BW
   jYaQdkMsuoYgMW94MQUz/JlqSmaW6lDQ/vML+3/UvwJWksQ9viSPSH4eo
   8GdYYM5/LsRqz8juxgTZu6FN7zQgBC182kQC3N5DMPx98Pf7HOclO/w+J
   0+OGIBu6G+viQpzC42Wpd8Z+sRwNLOa9lUGrKrZB3uMa3pPt1GdG0Hyqk
   QDmqVsGWn4nM4517jM79zMENk6Yey3UrUUGUtyx86psy3kUdHGHTebhVF
   Q==;
X-CSE-ConnectionGUID: I+YknH4wS9quffU0VXzWVg==
X-CSE-MsgGUID: MhqYBk46TFagMT8e89Bfpg==
X-IPAS-Result: =?us-ascii?q?A0BGAwCwk4Vq/5H/Ja1agS6BK4E9MVMWcgKBDxJJA4ggA?=
 =?us-ascii?q?4UriHkDgROdCIF4Bg8BAQENAQEuARUNBAEBhD9GAo1rAiY0CQ4BAgQDAgMBA?=
 =?us-ascii?q?QEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Thk8NhloBAQEBAwF4EAIBCBEDAQEBI?=
 =?us-ascii?q?QENJwodCAIEDgUIgnuCHRZBAwECDrlLAooceIE0gQGCZoECAQFD3AABCxQBg?=
 =?us-ascii?q?TiFP4MeAQEqgTWCXYEjGAGEfCcbG4FygRVCgjE4PoEFgVwCAgGBRxgeHoNXg?=
 =?us-ascii?q?jAEgiJ6EhuBPx6BD5A4UnIiAyYzLAFVExcLBwWBI0MDgQYjSwUtHYEjIR0XF?=
 =?us-ascii?q?x5YGwYFEiAqQUQjAz44gQhBAoF1PyMZNnqBCV6BKyphAQIQF0YuFYIKAoJzg?=
 =?us-ascii?q?SheAgFJRREKCwttPTcUGQMEgTUFjV0HWyCCRzFKEwEHJAUSGCEjCCAyNhAZI?=
 =?us-ascii?q?pMMQo8eR4E1giGKQ5UXCiiDdowhjT6IMheEBIFXiz2ZVAuYfYJZiF6CU5Vzh?=
 =?us-ascii?q?RsCBAIEBQIQAQEGgWg8gVlwFYMiCUoZD1aRTYRdNscGeQIJAy8BAQcCBw4DC?=
 =?us-ascii?q?4FokAGBfQEB?=
IronPort-PHdr: A9a23:gQChPRWapQYIufeI0h5BwVUbYKXV8K3PAWYlg6HPw5pUeailupP6M
 1Oav7NmjUTCWsPQ7PcXw+bVsqW1QWUb+t7Bq3ENdpVQSgUIwdsbhQ0uAcOJSAX7IffmYjZ8H
 ZFqX15+9Hb9Ok9QcPs=
IronPort-Data: A9a23:BTQMMq/aUmhSLHBa+savDrUD5X+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 GRMUGmOM/neMWH8LYhzadvk8EkDvJeBxt4yQQJupX9EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsYjtFs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kXfrwb/MYrHlof7
 OEWJg1VUCCRuNy5lefTpulE3qzPLeHxN48Z/3UlxjbDALN+EdbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0An1lQ/UPrSmM+ki3TleiFYr3qepLE85C7YywkZPL3FbYCNKobaGpkN9qqej
 kfG5lXTAU1ECPKWxh+5on/818XBhSyuDer+E5X9rJaGmma7w2EPAVgIVEGnvPC9i1y3R9NYL
 WQQ+zEytu4j80e3ScHnWB+1q2LCuQQTM+e8CMUg4w2Lj66R6AGDCy1cHnhKaccts4k9QjlCO
 kK1ou4FzAdH6dW9YXmc7byT6zi1PEAowaUqPEfokSNtDwHfnbwO
IronPort-HdrOrdr: A9a23:62f++KOB5/4ia8BcT8H255DYdb4zR+YMi2TDiHoBKiC9I/b5qy
 nxppUmPEfP+UgssREb9expOMG7MBXhHO1OkPgs1NaZLUbbUQSTXftfBOfZslnd8mjFh5FgPM
 RbAuZD4b/LfCVHZK/BiWHSfadDsby6GeKT9JvjJhxWPHhXgtRbnnxE43GgYzVLrWd9dP0EPa
 vZzPBq4xCnfnMaZNm6AH4qY8jvzuegqLvWJTQ9K1oC8gehsROEgYSWLzGomjsOWTJGxrkvtV
 PCjxH44aubtfS6wA/31mPY7Zha8eGRi+erAvbituElbhHXziq4boVoXLOP+Bovpvu01VosmN
 7Q5z89IsVa8RrqDyKIiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FcyHe91ErsLhHoe
 B2NiOixt9q5CH77WPADuvzJldXf42P0CMfeNso/jhiuE0lGedsRMIkjRho+dw7bVLHAcgcYZ
 pT5YfnlbZrWGLfSWzFtW9yx9HpdHEyEhCaBnUmgKWuomJrdLQT9TpF+CTZ9U1wqa7UR/R/lp
 b5G7Utm7dUQsAMa6VhQO8HXMusE2TIBQnBKWSIPD3cZes60l/22tbKCY8OlaqXUY1NyIF3lI
 XKUVteu2J3c0XyCdeW1JkO9hzWWm2yUTnk18kbvvFCy/HBbauuNTfGREElksOmrflaCsrHW+
 yrMJYTB/P4N2PhFYtAwgW7UZhPLnsVVtETp78AKh+zi9OOLpevuv3Qcf7VKraoGTE4WnnnCn
 9GRzT3LNUo1DHjZpY5ummmZ5rAQD2JwXsrKtmuwwE68vl4CrFx
X-Talos-CUID: 9a23:IALdgWx5WMAPH+A/4QYHBgU1WfEmdF2B00yBOlK2B1sxdo2HdmGfrfY=
X-Talos-MUID: 9a23:rVsbyQhE+lF2WKJXY5HqJcMpEcdx0o6tVB4xv5wJnvXUOHwhETmFg2Hi
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 11:32:17 +0000
Received: from rcdn-opgw-2.cisco.com (rcdn-opgw-2.cisco.com [72.163.7.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id D178718000583
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Aug 2026 11:32:16 +0000 (GMT)
X-CSE-ConnectionGUID: kvkBRx6oTK22RzcG6b1RKw==
X-CSE-MsgGUID: tUINRRc9ROuYXNUc8ShmGw==
Authentication-Results: rcdn-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,231,1779148800"; 
   d="scan'208,217";a="71965401"
Received: from mail-centralusazon11010044.outbound.protection.outlook.com (HELO DM1PR04CU001.outbound.protection.outlook.com) ([52.101.61.44])
  by rcdn-opgw-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 11:32:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EmGNp4ZDClF613jNv1TDTAbbGsYwDp2b1GdqP/NWC14a/cp/9uLRh6q3xEdBjk0HQAIVwXZ5bpmpTE+AB3wkc5aS5gaDS4FoB+LOz4ZkfMV6VXAmli/MJa+gtlClQU5Qe5crQGwk5pS84DMiSo820ZcNpF+RBVQ/naInW6m2l9x47iRGyJL4ufShoS50gEk39XU5BxacCXtF4UAak7AJg3c9gx7mD7G4OZJ6wlPFqsJGnY2+xr3B2NM4+5dHBVQnE5ddQQmKznExpZx9nuu3nTzWKZnBAXbJ1o2EFhlngS4ausfHk4VRyiY/Z2R9JEREDhSbLuNZciQCQd4o49EtIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXgE5UfiWIFKgdpznzxYupvf/BkWDDeP52aFtIA4Pxk=;
 b=o1qIP3GPNm2W4ZKVrjqEyHTfP00kZvCqxffQvqwP62YkEJl+hBvu/JCVllsiVawfAYArfQ/5QyRtTW2BNlacXYl8tWvjG1ogF7dl6JvKqA5F8RwwlNOikymUd50e3oqDl1qCUP7k3/LBVMv2yK2OLY/tfv6bv51m4lpHoYXyC/5fG/RG/45/KoiJRMEL/d2u9GGxMZWlsII7qDzJR08G/hnPgekeAePQXQ1Ehxs+3WZhhWEO/szeWrpQ86j42/ffXvnsilz16BieDSdOInD9iOM8f5a1I4myKemmmuJtVED1MDdRIU7hbnBYthO7d4np6SBLD5Ed3M4EIe45M4PzHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) by
 SJ5PPFEC87B8781.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::85c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 11:32:14 +0000
Received: from DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543]) by DM4PR11MB6189.namprd11.prod.outlook.com
 ([fe80::ecd9:17f7:f13f:5543%2]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 11:32:14 +0000
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	<deeratho@cisco.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization][scarthgap][PATCH] podman: fix
 CVE-2026-57231
Thread-Topic: [meta-virtualization][scarthgap][PATCH] podman: fix
 CVE-2026-57231
Thread-Index: AQHdGqkhXUqLPuV77U2XCZGgj0W/XralZukM
Date: Wed, 19 Aug 2026 11:32:14 +0000
Message-ID: 
 <DM4PR11MB6189F4607465621C4D8D06D0C4A52@DM4PR11MB6189.namprd11.prod.outlook.com>
References: <18C4EF03B45CE706.2705241@lists.yoctoproject.org>
In-Reply-To: <18C4EF03B45CE706.2705241@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6189:EE_|SJ5PPFEC87B8781:EE_
x-ms-office365-filtering-correlation-id: 60f4917f-ff88-4203-b8e9-08defde58439
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|56012099006|10067099003|3023799007|6133799003|22082099003|18002099003|11063799006|8096899003|13003099007|38070700021;
x-microsoft-antispam-message-info: 
 5/SYgSh0CF59PsVUZcS88xw20MWXBKgD1Todq0POC9wHoYYwfgHJIr3+dMPdAQaYUjCp/P3Hz+rnekjhWmLuUiwREIjPp17hGT21Aq72WFdQ2NMYc2yWNxsleectqSqz0NjL49waIfMqIYKLFGyuCtTq2AV13DtCrpjyhkBNPagPjcH6ikRJAv+MY6l/Bv8ZFAD7V9zxozs78mk6+5qcPowpXX9sU1tkAqTOpdFcYynGB2PZN1gYrmoc36MKugNeVCMDD/osxGzxllny8zmfNyolzQ+7XUiZabADHEyXN8pkMAUo7APJ30H6L+UhSKiGbUyRvn5wAjB+46ABbVSOPBZZiREXQmAgMWwiqOnLQNJQJ5UF80Wnq/DK3KElEZ/exJH9g36hrcGEk27Pvl9E12H7L/rH4fMq4hY7IMINMj/arhYM/453G3h9bM9uD9pXtGpRJk/Qt74yAu7eieopcjFZuaQfPzWfOmQEE5k55VJ61GbtVuRtRd5OlzKH/y+NtMGS3TvexsICX0ceXfhYsKEMhk7f3cUR9JlUe41scgjZBx5ZmHdLZBWWEMFD9oxYWk2ycRt0ErJeAwnp+yrEuTB2WkHOtPZpjI7dY/2bzCiiaPGIxnUGbwxm7tA1wZbSXwPFNFlgGOVRhs4pTmVD8ggEt1m0QQiguG96UvZef8dA2IK587lASJVcSLIiekWEvB7+zuKNf/rp3cYJajw5cPM9zYyqjZd5HBvhGraHhwM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(10067099003)(3023799007)(6133799003)(22082099003)(18002099003)(11063799006)(8096899003)(13003099007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?DUqn1U+qylx/jP4wPblee9d7FCG/ytyJQ8U1SnaPMDeaqfpIpk4W1dR9lE?=
 =?iso-8859-1?Q?0Aued/pDGSSwJgwBEG1PEW1WG+MR80/lYr9wAWnxC2fQ3lIX9zuZMU8TCp?=
 =?iso-8859-1?Q?a+LwI39wlxG2lVXDmMAToKhq9l7qwMNCVHZlOvbLV4zpZzjtFGyTAgmkxG?=
 =?iso-8859-1?Q?I/cuTrTMfGHzOgg1+k0N+kIP9UIZMW4IfI8Xq9bS0kwAgLn5+/hJlWVClC?=
 =?iso-8859-1?Q?7GD+AO+N5ojy9SyKvN5L8dGwOw+vJsGxTWYO/SQj8OKq4XlZx/SZPH+sOb?=
 =?iso-8859-1?Q?DTFLQVIuWKIkLmoE1huPGoLzXeh2fn8FVtfMSHcQW+GkSIZxO1ObeSjmco?=
 =?iso-8859-1?Q?ufydS+RFXgBN0kp49tVI7/Ekmp5LMS5PLsTxCNK1D/9PQ3Cosy0KloZ5Rg?=
 =?iso-8859-1?Q?jL5mAtlMcMyoJBS21I0RkxByCTW8pmVCzNNoBQwCdit3IDcCGj9pLBl+1E?=
 =?iso-8859-1?Q?Lu6hDYKa3qCSWrUyeMyaYtK8QoUyR8H5tyNm3J2l1RFxRH7obdLbjYcMYM?=
 =?iso-8859-1?Q?v4XgzBaL7p2kmc2QDPCxYSNQQ+UeZlCmD7EnAkrcr9zW5UW6F5bMrYEDWy?=
 =?iso-8859-1?Q?YC1VCIqHxBdyIIQAShiIfgblHWqfsk5jIeR2FfxfwP7zqa5VM85mDlfyJo?=
 =?iso-8859-1?Q?47M5PHcj5bmlDiz7tKo2IaUvwhb5LHIXkY2cGGvEh+hsXAThwJ2SsQzOXP?=
 =?iso-8859-1?Q?elQ99i97l/1B69XtwcxkCKjLiwi9ioDZVFWGG3rGHiXE5NSSA1NVM8/3xC?=
 =?iso-8859-1?Q?b3uQ9/NTtu+bkLUIZ7EtFRh2oPX3i8n+gWHPbwn5tqu1rPdYCilfKKpZ8/?=
 =?iso-8859-1?Q?XxH+c9Pe8CzemH3La9pvlQtJ8Ds1V/zSeVmYAtCBwuFr7SODTjpMIs0TkP?=
 =?iso-8859-1?Q?4+AeUE7oIuQV1zYZPuW48thM6EGJFZr+ex78u8ObI2zRbFdZmDRLcXGHMb?=
 =?iso-8859-1?Q?QwIoGgOcOIll8oQzZ+UFsKHFM9mkOud08BDZay0ZGRerDTSF1Ws0Q+NEjx?=
 =?iso-8859-1?Q?lmfPoa4gELpVsGNGtAvpJNd2bGtXLIpQck7J8xPaMp3tXhJ44vFXuCIkqF?=
 =?iso-8859-1?Q?Dlwvlu5cFfbDnX+GHg2K13GDz9yRJ8+BFh0GCSstlW/wLFC//U1r2g6zSN?=
 =?iso-8859-1?Q?Uo18AIbpT067XjMS2e6XuGc8qHEryPG7ydF9MMz/ZCS0QC500iBArAzimB?=
 =?iso-8859-1?Q?+7r0sDuGEzeDMI4rmlR6z+GeiIm7HlyN/0QlExyMADz2SocQYXtV1Z0mwn?=
 =?iso-8859-1?Q?m3Zrnq+ILfsLxOupEtlXDploKlhqXEm/F2iRsU7LE7TJSIW2f5txsghU3X?=
 =?iso-8859-1?Q?Bjkifwtg3e3FCdZgV0IBUZU2KKX4m70e8xjrV5+Iuy6J+6VsKa46iJzaSX?=
 =?iso-8859-1?Q?D7O56oqd2NZDGarNn33iRMPI7uQf4z7O1UPXuxIh84xUpJeNzPu4STLJuM?=
 =?iso-8859-1?Q?3HbuXAm1olBamcbJBg1sUYGRMBIt4x65nbZpmeOdUU9gnQbXDbzWBsRHaY?=
 =?iso-8859-1?Q?jnSJGZXnTme7u9Z8efyQKCZn8C5vy/Vmv19ri3vDoDCIjw6Lpk5bM3A56F?=
 =?iso-8859-1?Q?1ePj6BPF6QqOITopcVk854xSP7yr9/vnWaDmdYZtUl3lackRfY/tnIji6G?=
 =?iso-8859-1?Q?KSTuOtAlQM7QHhYRddLgXb4cgbCfUQt3TBOyu/W/Gty9DDQ1CRP4goWYrR?=
 =?iso-8859-1?Q?+AzeTwfba+ZD1d1Fpo6Q2CzrnJsMRtRDL8sA9oCniRMxLVuKI8YRL0FY2L?=
 =?iso-8859-1?Q?xcjxUdpy2lqLb1mKWRAnB64eorkUB8wQ0cQiXM2D0GV8Hn?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB6189F4607465621C4D8D06D0C4A52DM4PR11MB6189namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	EMkV2QGopKve6j0xYRbBF0ScQKeYCP8Kl3HXWFNMJzQ1RhNpHuovZx0UvxEyfmiAunFfyu/C7TLStamnY2UjRlAF+23vVJiF+TWofmjlqskOLqi0HdOitzj2jw8WqixjeVj7YFfB7XQLeJYmZpCCIyty8aUBvcrQvyqVMiTHW5mrMCP8h71xhJx7GXEmneX7qVyXZkttpm2TC72mDulEcU1MrKsrgOuww8SXIx1ZqSV3jIVHe97xvMjjDB3G84QDjzjZ0YzvWfE3B36dTiKBqLzujlnLWLz+x1Lk91whgSrbaV4NHAih27rftIxWb7fKUa+yGODZJn7useinNrIeBA==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60f4917f-ff88-4203-b8e9-08defde58439
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2026 11:32:14.0282
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pua+95M3l/1sdsdQAkHoPaPwcGO5khQ6mULWTNXk/9iL3h7SwFRk1+NivBN/6gkeySQD+RiH1JfhUxYFmV5V8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFEC87B8781
X-Outbound-Client-TLS: ANONYMOUS;rcdn-opgw-2.cisco.com [72.163.7.163];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 72.163.7.163, rcdn-opgw-2.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Aug 2026 11:32:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10048

--_000_DM4PR11MB6189F4607465621C4D8D06D0C4A52DM4PR11MB6189namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,
I hope you're doing well.
I wanted to follow up on the patch below. It appears it may have been misse=
d during the review process. Could you please take a look when you have a c=
hance and share your feedback?
Thank you for your time.
Regards,
Deepak
________________________________
From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists=
.yoctoproject.org> on behalf of Deepak Rathore via lists.yoctoproject.org <=
deeratho=3Dcisco.com@lists.yoctoproject.org>
Sent: Thursday, July 23, 2026 7:12 PM
To: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists.y=
octoproject.org>
Subject: [meta-virtualization][scarthgap][PATCH] podman: fix CVE-2026-57231

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream v5.8 branch backport for
CVE-2026-57231. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2]. The backported
commit link is recorded in the embedded patch header.

[1] https://github.com/podman-container-tools/podman/commit/85832029d537c2c=
0df89e47d4a03d55ba099a848
[2] https://security-tracker.debian.org/tracker/CVE-2026-57231

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../podman/podman/CVE-2026-57231.patch        | 219 ++++++++++++++++++
 recipes-containers/podman/podman_git.bb       |   1 +
 2 files changed, 220 insertions(+)
 create mode 100644 recipes-containers/podman/podman/CVE-2026-57231.patch

diff --git a/recipes-containers/podman/podman/CVE-2026-57231.patch b/recipe=
s-containers/podman/podman/CVE-2026-57231.patch
new file mode 100644
index 00000000..696ab99d
--- /dev/null
+++ b/recipes-containers/podman/podman/CVE-2026-57231.patch
@@ -0,0 +1,219 @@
+From efe48c92c248c7cee352b51e7cd7e9875180b6e9 Mon Sep 17 00:00:00 2001
+From: Paul Holzinger <pholzing@redhat.com>
+Date: Wed, 17 Jun 2026 18:41:23 +0200
+Subject: [PATCH] fix image host env leak
+
+When parsing image envs we need to be strict about the format, only the
+"key=3Dvalue" format must be accepted. Just keys must be rejected as they
+are not valid according to the image spec.
+
+CVE: CVE-2026-57231
+Upstream-Status: Backport [https://github.com/podman-container-tools/podma=
n/commit/85832029d537c2c0df89e47d4a03d55ba099a848]
+
+Signed-off-by: Paul Holzinger <pholzing@redhat.com>
+(cherry picked from commit 6c431b73dbf8e4b20b778644d7a80caebdb75050)
+Signed-off-by: Paul Holzinger <pholzing@redhat.com>
+(cherry picked from commit 85832029d537c2c0df89e47d4a03d55ba099a848)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ pkg/specgen/generate/container.go      | 17 +++++--
+ pkg/specgen/generate/container_test.go | 66 ++++++++++++++++++++++++++
+ pkg/specgen/generate/kube/kube.go      |  7 ++-
+ test/system/030-run.bats               | 52 ++++++++++++++++++++
+ 4 files changed, 135 insertions(+), 7 deletions(-)
+ create mode 100644 pkg/specgen/generate/container_test.go
+
+diff --git a/pkg/specgen/generate/container.go b/pkg/specgen/generate/cont=
ainer.go
+index f224453da7..53346732d9 100644
+--- a/pkg/specgen/generate/container.go
++++ b/pkg/specgen/generate/container.go
+@@ -61,6 +61,18 @@ func getImageFromSpec(ctx context.Context, r *libpod.Ru=
ntime, s *specgen.SpecGen
+        return image, resolvedName, inspectData, err
+ }
+
++func ParseImageEnvs(imageEnvs []string) (map[string]string, error) {
++      envs :=3D make(map[string]string, len(imageEnvs))
++      for _, env :=3D range imageEnvs {
++              key, val, hasValue :=3D strings.Cut(env, "=3D")
++              if !hasValue || key =3D=3D "" {
++                      return nil, fmt.Errorf("invalid image env variable =
%q", env)
++              }
++              envs[key] =3D val
++      }
++      return envs, nil
++}
++
+ // Fill any missing parts of the spec generator (e.g. from the image).
+ // Returns a set of warnings or any fatal error that occurred.
+ func CompleteSpec(ctx context.Context, r *libpod.Runtime, s *specgen.Spec=
Generator) ([]string, error) {
+@@ -122,15 +134,14 @@ func CompleteSpec(ctx context.Context, r *libpod.Run=
time, s *specgen.SpecGenerat
+        if err !=3D nil {
+                return nil, fmt.Errorf("parsing fields in containers.conf:=
 %w", err)
+        }
+-      var envs map[string]string
+
+        // Image Environment defaults
+        if inspectData !=3D nil {
+                // Image envs from the image if they don't exist
+                // already, overriding the default environments
+-              envs, err =3D envLib.ParseSlice(inspectData.Config.Env)
++              envs, err :=3D ParseImageEnvs(inspectData.Config.Env)
+                if err !=3D nil {
+-                      return nil, fmt.Errorf("env fields from image faile=
d to parse: %w", err)
++                      return nil, err
+                }
+                defaultEnvs =3D envLib.Join(envLib.DefaultEnvVariables(), =
envLib.Join(defaultEnvs, envs))
+        }
+diff --git a/pkg/specgen/generate/container_test.go b/pkg/specgen/generate=
/container_test.go
+new file mode 100644
+index 0000000000..22a64330b1
+--- /dev/null
++++ b/pkg/specgen/generate/container_test.go
+@@ -0,0 +1,66 @@
++//go:build !remote && (linux || freebsd)
++
++package generate
++
++import (
++      "testing"
++
++      "github.com/stretchr/testify/assert"
++      "github.com/stretchr/testify/require"
++)
++
++func TestParseImageEnvs(t *testing.T) {
++      tests :=3D []struct {
++              name      string
++              imageEnvs []string
++              want      map[string]string
++              wantErr   bool
++      }{
++              {
++                      name: "no env",
++                      want: map[string]string{},
++              },
++              {
++                      name:      "single env",
++                      imageEnvs: []string{"TEST=3D1"},
++                      want: map[string]string{
++                              "TEST": "1",
++                      },
++              },
++              {
++                      name:      "multiple envs",
++                      imageEnvs: []string{"TEST=3D1", "ABC=3Db", "PATH=3D=
/bin"},
++                      want: map[string]string{
++                              "TEST": "1",
++                              "ABC":  "b",
++                              "PATH": "/bin",
++                      },
++              },
++              {
++                      name:      "invalid env without value",
++                      imageEnvs: []string{"HOST"},
++                      wantErr:   true,
++              },
++              {
++                      name:      "invalid env asterisk",
++                      imageEnvs: []string{"*"},
++                      wantErr:   true,
++              },
++              {
++                      name:      "invalid env no key",
++                      imageEnvs: []string{"=3D123"},
++                      wantErr:   true,
++              },
++      }
++      for _, tt :=3D range tests {
++              t.Run(tt.name, func(t *testing.T) {
++                      got, err :=3D ParseImageEnvs(tt.imageEnvs)
++                      if tt.wantErr {
++                              require.Error(t, err)
++                              return
++                      }
++
++                      assert.Equal(t, tt.want, got)
++              })
++      }
++}
+diff --git a/pkg/specgen/generate/kube/kube.go b/pkg/specgen/generate/kube=
/kube.go
+index 25afd00f6d..0ba2ffa6d5 100644
+--- a/pkg/specgen/generate/kube/kube.go
++++ b/pkg/specgen/generate/kube/kube.go
+@@ -436,10 +436,9 @@ func ToSpecGen(ctx context.Context, opts *CtrSpecGenO=
ptions) (*specgen.SpecGener
+        s.Annotations[define.KubeHealthCheckAnnotation] =3D "true"
+
+        // Environment Variables
+-      envs :=3D map[string]string{}
+-      for _, env :=3D range imageData.Config.Env {
+-              key, val, _ :=3D strings.Cut(env, "=3D")
+-              envs[key] =3D val
++      envs, err :=3D generate.ParseImageEnvs(imageData.Config.Env)
++      if err !=3D nil {
++              return nil, err
+        }
+
+        for _, env :=3D range opts.Container.Env {
+diff --git a/test/system/030-run.bats b/test/system/030-run.bats
+index 56acf6c5e1..e59edd364a 100644
+--- a/test/system/030-run.bats
++++ b/test/system/030-run.bats
+@@ -1454,4 +1454,56 @@ search               | $IMAGE           |
+     is "$output" "Error.*: $expect" "podman emits useful diagnostic when =
no entrypoint is set"
+ }
+
++@test "podman run host env leak" {
++    # We need to create a invalid image config env value without "=3D"
++    skopeo copy containers-storage:$IMAGE dir:$PODMAN_TMPDIR
++    config_digest=3D$(jq -r .config.digest $PODMAN_TMPDIR/manifest.json)
++    plain_digest=3D${config_digest#*:}
++    newfile=3D"$PODMAN_TMPDIR/newfile"
++    # Append bad env to existing image envs
++    jq  '.config.Env +=3D ["HOST*"]' $PODMAN_TMPDIR/$plain_digest >$newfi=
le
++    # Get new digest and size so we can update the manifest
++    newdigest=3D"$(sha256sum $newfile | cut -d" " -f 1)"
++    size=3D$(stat -c %s $newfile)
++    mv $newfile $PODMAN_TMPDIR/$newdigest
++    jq ".config.digest =3D \"sha256:$newdigest\" | .config.size=3D$size" =
$PODMAN_TMPDIR/manifest.json > $PODMAN_TMPDIR/manifest.json.new
++    mv $PODMAN_TMPDIR/manifest.json.new $PODMAN_TMPDIR/manifest.json
++
++    image=3D"localhost/envimage:123"
++    skopeo copy dir:$PODMAN_TMPDIR containers-storage:$image
++
++    run_podman image inspect $image --format '{{.Config.Env}}'
++    assert "$output" =3D~ "HOST\*" "invalid env in image"
++
++    HOSTENV=3D123 run_podman 125 run --rm $image printenv HOSTENV
++    assert "$output" =3D~ 'invalid image env variable "HOST\*"' "Host env=
 leak from image env on podman run"
++
++    podname=3D"p-$(safename)"
++    ctrname=3D"c-$(safename)"
++
++    fname=3D"$PODMAN_TMPDIR/kube_$(safename).yaml"
++    echo "
++apiVersion: v1
++kind: Pod
++metadata:
++  labels:
++    app: test
++  name: $podname
++spec:
++  restartPolicy: Never
++  containers:
++    - name: $ctrname
++      image: $image
++      command:
++      - printenv
++      - HOSTENV
++" > $fname
++
++    run_podman 125 kube play $fname
++    assert "$output" =3D~ 'invalid image env variable "HOST\*"' "Host env=
 leak from image env on kube play"
++
++    run_podman pod rm $podname
++    run_podman rmi $image
++}
++
+ # vim: filetype=3Dsh
+--
+2.51.0
diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/p=
odman/podman_git.bb
index c714e73f..3eb5f426 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -26,6 +26,7 @@ SRC_URI =3D " \
     [file://CVE-2024-9341.patch;patchdir=3Dsrc/import]file://CVE-2024-9341=
.patch;patchdir=3Dsrc/import \
     [file://CVE-2026-55686-dependent.patch;patchdir=3Dsrc/import]file://CV=
E-2026-55686-dependent.patch;patchdir=3Dsrc/import \
     [file://CVE-2026-55686.patch;patchdir=3Dsrc/import]file://CVE-2026-556=
86.patch;patchdir=3Dsrc/import \
+    [file://CVE-2026-57231.patch;patchdir=3Dsrc/import]file://CVE-2026-572=
31.patch;patchdir=3Dsrc/import \
 "

 LICENSE =3D "Apache-2.0"
--
2.35.6


--_000_DM4PR11MB6189F4607465621C4D8D06D0C4A52DM4PR11MB6189namp_
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
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Hi Bruce,</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
I hope you're doing well.</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
I wanted to follow up on the patch below. It appears it may have been misse=
d during the review process. Could you please take a look when you have a c=
hance and share your feedback?</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Thank you for your time.</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontSer=
vice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);=
">
Regards,<br>
Deepak</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg">
<div style=3D"direction: ltr; font-family: Calibri, sans-serif; font-size: =
11pt; color: rgb(0, 0, 0);">
<b>From:</b> meta-virtualization@lists.yoctoproject.org &lt;meta-virtualiza=
tion@lists.yoctoproject.org&gt; on behalf of Deepak Rathore via lists.yocto=
project.org &lt;deeratho=3Dcisco.com@lists.yoctoproject.org&gt;<br>
<b>Sent:</b> Thursday, July 23, 2026 7:12 PM<br>
<b>To:</b> meta-virtualization@lists.yoctoproject.org &lt;meta-virtualizati=
on@lists.yoctoproject.org&gt;<br>
<b>Subject:</b> [meta-virtualization][scarthgap][PATCH] podman: fix CVE-202=
6-57231</div>
<div style=3D"direction: ltr;">&nbsp;</div>
</div>
<div style=3D"font-size: 11pt;">From: Deepak Rathore &lt;deeratho@cisco.com=
&gt;<br>
<br>
This patch applies the upstream v5.8 branch backport for<br>
CVE-2026-57231. The upstream fix commit is referenced in [1],<br>
and the public CVE advisory is referenced in [2]. The backported<br>
commit link is recorded in the embedded patch header.<br>
<br>
[1] <a href=3D"https://github.com/podman-container-tools/podman/commit/8583=
2029d537c2c0df89e47d4a03d55ba099a848" id=3D"OWA429e0ccf-fead-651a-240c-cd8a=
cb0eecf8" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://github.com/podman-container-tools/podman/commit/85832029d537c2c0df8=
9e47d4a03d55ba099a848</a><br>
[2] <a href=3D"https://security-tracker.debian.org/tracker/CVE-2026-57231" =
id=3D"OWAd6e13b6a-cffc-4510-1eb3-14c2857419a9" class=3D"OWAAutoLink" data-a=
uth=3D"NotApplicable">
https://security-tracker.debian.org/tracker/CVE-2026-57231</a><br>
<br>
Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
---<br>
&nbsp;.../podman/podman/CVE-2026-57231.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; | 219 ++++++++++++++++++<br>
&nbsp;recipes-containers/podman/podman_git.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp;&nbsp; 1 +<br>
&nbsp;2 files changed, 220 insertions(+)<br>
&nbsp;create mode 100644 recipes-containers/podman/podman/CVE-2026-57231.pa=
tch<br>
<br>
diff --git a/recipes-containers/podman/podman/CVE-2026-57231.patch b/recipe=
s-containers/podman/podman/CVE-2026-57231.patch<br>
new file mode 100644<br>
index 00000000..696ab99d<br>
--- /dev/null<br>
+++ b/recipes-containers/podman/podman/CVE-2026-57231.patch<br>
@@ -0,0 +1,219 @@<br>
+From efe48c92c248c7cee352b51e7cd7e9875180b6e9 Mon Sep 17 00:00:00 2001<br>
+From: Paul Holzinger &lt;pholzing@redhat.com&gt;<br>
+Date: Wed, 17 Jun 2026 18:41:23 +0200<br>
+Subject: [PATCH] fix image host env leak<br>
+<br>
+When parsing image envs we need to be strict about the format, only the<br=
>
+&quot;key=3Dvalue&quot; format must be accepted. Just keys must be rejecte=
d as they<br>
+are not valid according to the image spec.<br>
+<br>
+CVE: CVE-2026-57231<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/podman-container-=
tools/podman/commit/85832029d537c2c0df89e47d4a03d55ba099a848" id=3D"OWA7b03=
15a6-99da-ce47-8646-4d82a869bdac" class=3D"OWAAutoLink" data-auth=3D"NotApp=
licable">https://github.com/podman-container-tools/podman/commit/85832029d5=
37c2c0df89e47d4a03d55ba099a848</a>]<br>
+<br>
+Signed-off-by: Paul Holzinger &lt;pholzing@redhat.com&gt;<br>
+(cherry picked from commit 6c431b73dbf8e4b20b778644d7a80caebdb75050)<br>
+Signed-off-by: Paul Holzinger &lt;pholzing@redhat.com&gt;<br>
+(cherry picked from commit 85832029d537c2c0df89e47d4a03d55ba099a848)<br>
+Signed-off-by: Deepak Rathore &lt;deeratho@cisco.com&gt;<br>
+---<br>
+ pkg/specgen/generate/container.go&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 17 ++++=
+--<br>
+ pkg/specgen/generate/container_test.go | 66 ++++++++++++++++++++++++++<br=
>
+ pkg/specgen/generate/kube/kube.go&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 7=
 ++-<br>
+ test/system/030-run.bats&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 52 ++++++++++++++++++++<br>
+ 4 files changed, 135 insertions(+), 7 deletions(-)<br>
+ create mode 100644 pkg/specgen/generate/container_test.go<br>
+<br>
+diff --git a/pkg/specgen/generate/container.go b/pkg/specgen/generate/cont=
ainer.go<br>
+index f224453da7..53346732d9 100644<br>
+--- a/pkg/specgen/generate/container.go<br>
++++ b/pkg/specgen/generate/container.go<br>
+@@ -61,6 +61,18 @@ func getImageFromSpec(ctx context.Context, r *libpod.Ru=
ntime, s *specgen.SpecGen<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return image, resolvedName, ins=
pectData, err<br>
+ }<br>
+<br>
++func ParseImageEnvs(imageEnvs []string) (map[string]string, error) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; envs :=3D make(map[string]string, len(imag=
eEnvs))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for _, env :=3D range imageEnvs {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; key, val, hasValue :=3D strings.Cut(env, &quot;=3D&quot;)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if !hasValue || key =3D=3D &quot;&quot; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return nil, fmt.Error=
f(&quot;invalid image env variable %q&quot;, env)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; envs[key] =3D val<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return envs, nil<br>
++}<br>
++<br>
+ // Fill any missing parts of the spec generator (e.g. from the image).<br=
>
+ // Returns a set of warnings or any fatal error that occurred.<br>
+ func CompleteSpec(ctx context.Context, r *libpod.Runtime, s *specgen.Spec=
Generator) ([]string, error) {<br>
+@@ -122,15 +134,14 @@ func CompleteSpec(ctx context.Context, r *libpod.Run=
time, s *specgen.SpecGenerat<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if err !=3D nil {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; return nil, fmt.Errorf(&quot;parsing fields in containers.=
conf: %w&quot;, err)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var envs map[string]string<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Image Environment defaults<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if inspectData !=3D nil {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; // Image envs from the image if they don't exist<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; // already, overriding the default environments<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; envs, err =3D envLib.ParseSlice(inspectData.Config.Env)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; envs, err :=3D ParseImageEnvs(inspectData.Config.Env)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if err !=3D nil {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return nil, fmt.Error=
f(&quot;env fields from image failed to parse: %w&quot;, err)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return nil, err<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; defaultEnvs =3D envLib.Join(envLib.DefaultEnvVariables(), =
envLib.Join(defaultEnvs, envs))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+diff --git a/pkg/specgen/generate/container_test.go b/pkg/specgen/generate=
/container_test.go<br>
+new file mode 100644<br>
+index 0000000000..22a64330b1<br>
+--- /dev/null<br>
++++ b/pkg/specgen/generate/container_test.go<br>
+@@ -0,0 +1,66 @@<br>
++//go:build !remote &amp;&amp; (linux || freebsd)<br>
++<br>
++package generate<br>
++<br>
++import (<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;testing&quot;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;github.com/stretchr/testify/assert&q=
uot;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;github.com/stretchr/testify/require&=
quot;<br>
++)<br>
++<br>
++func TestParseImageEnvs(t *testing.T) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tests :=3D []struct {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; imageEnvs []string<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; want&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; map[string]string<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; wantErr&nbsp;&nbsp; bool<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; name: &quot;no env&qu=
ot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; want: map[string]stri=
ng{},<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; },<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; name:&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; &quot;single env&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; imageEnvs: []string{&=
quot;TEST=3D1&quot;},<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; want: map[string]stri=
ng{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; &quot;TEST&quot;: &quot;1&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; },<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; name:&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; &quot;multiple envs&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; imageEnvs: []string{&=
quot;TEST=3D1&quot;, &quot;ABC=3Db&quot;, &quot;PATH=3D/bin&quot;},<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; want: map[string]stri=
ng{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; &quot;TEST&quot;: &quot;1&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; &quot;ABC&quot;:&nbsp; &quot;b&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; &quot;PATH&quot;: &quot;/bin&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; },<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; name:&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; &quot;invalid env without value&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; imageEnvs: []string{&=
quot;HOST&quot;},<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wantErr:&nbsp;&nbsp; =
true,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; },<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; name:&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; &quot;invalid env asterisk&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; imageEnvs: []string{&=
quot;*&quot;},<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wantErr:&nbsp;&nbsp; =
true,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; },<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; name:&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; &quot;invalid env no key&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; imageEnvs: []string{&=
quot;=3D123&quot;},<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wantErr:&nbsp;&nbsp; =
true,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; },<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for _, tt :=3D range tests {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; t.Run(tt.name, func(t *testing.T) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; got, err :=3D ParseIm=
ageEnvs(tt.imageEnvs)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if tt.wantErr {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; require.Error(t, err)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; return<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert.Equal(t, tt.wa=
nt, got)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; })<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++}<br>
+diff --git a/pkg/specgen/generate/kube/kube.go b/pkg/specgen/generate/kube=
/kube.go<br>
+index 25afd00f6d..0ba2ffa6d5 100644<br>
+--- a/pkg/specgen/generate/kube/kube.go<br>
++++ b/pkg/specgen/generate/kube/kube.go<br>
+@@ -436,10 +436,9 @@ func ToSpecGen(ctx context.Context, opts *CtrSpecGenO=
ptions) (*specgen.SpecGener<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s.Annotations[define.KubeHealth=
CheckAnnotation] =3D &quot;true&quot;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Environment Variables<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; envs :=3D map[string]string{}<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for _, env :=3D range imageData.Config.Env=
 {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; key, val, _ :=3D strings.Cut(env, &quot;=3D&quot;)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; envs[key] =3D val<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; envs, err :=3D generate.ParseImageEnvs(ima=
geData.Config.Env)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if err !=3D nil {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; return nil, err<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for _, env :=3D range opts.Cont=
ainer.Env {<br>
+diff --git a/test/system/030-run.bats b/test/system/030-run.bats<br>
+index 56acf6c5e1..e59edd364a 100644<br>
+--- a/test/system/030-run.bats<br>
++++ b/test/system/030-run.bats<br>
+@@ -1454,4 +1454,56 @@ search&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | $IMAGE&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
+&nbsp;&nbsp;&nbsp;&nbsp; is &quot;$output&quot; &quot;Error.*: $expect&quo=
t; &quot;podman emits useful diagnostic when no entrypoint is set&quot;<br>
+ }<br>
+<br>
++@test &quot;podman run host env leak&quot; {<br>
++&nbsp;&nbsp;&nbsp; # We need to create a invalid image config env value w=
ithout &quot;=3D&quot;<br>
++&nbsp;&nbsp;&nbsp; skopeo copy containers-storage:$IMAGE dir:$PODMAN_TMPD=
IR<br>
++&nbsp;&nbsp;&nbsp; config_digest=3D$(jq -r .config.digest $PODMAN_TMPDIR/=
manifest.json)<br>
++&nbsp;&nbsp;&nbsp; plain_digest=3D${config_digest#*:}<br>
++&nbsp;&nbsp;&nbsp; newfile=3D&quot;$PODMAN_TMPDIR/newfile&quot;<br>
++&nbsp;&nbsp;&nbsp; # Append bad env to existing image envs<br>
++&nbsp;&nbsp;&nbsp; jq&nbsp; '.config.Env +=3D [&quot;HOST*&quot;]' $PODMA=
N_TMPDIR/$plain_digest &gt;$newfile<br>
++&nbsp;&nbsp;&nbsp; # Get new digest and size so we can update the manifes=
t<br>
++&nbsp;&nbsp;&nbsp; newdigest=3D&quot;$(sha256sum $newfile | cut -d&quot; =
&quot; -f 1)&quot;<br>
++&nbsp;&nbsp;&nbsp; size=3D$(stat -c %s $newfile)<br>
++&nbsp;&nbsp;&nbsp; mv $newfile $PODMAN_TMPDIR/$newdigest<br>
++&nbsp;&nbsp;&nbsp; jq &quot;.config.digest =3D \&quot;sha256:$newdigest\&=
quot; | .config.size=3D$size&quot; $PODMAN_TMPDIR/manifest.json &gt; $PODMA=
N_TMPDIR/manifest.json.new<br>
++&nbsp;&nbsp;&nbsp; mv $PODMAN_TMPDIR/manifest.json.new $PODMAN_TMPDIR/man=
ifest.json<br>
++<br>
++&nbsp;&nbsp;&nbsp; image=3D&quot;localhost/envimage:123&quot;<br>
++&nbsp;&nbsp;&nbsp; skopeo copy dir:$PODMAN_TMPDIR containers-storage:$ima=
ge<br>
++<br>
++&nbsp;&nbsp;&nbsp; run_podman image inspect $image --format '{{.Config.En=
v}}'<br>
++&nbsp;&nbsp;&nbsp; assert &quot;$output&quot; =3D~ &quot;HOST\*&quot; &qu=
ot;invalid env in image&quot;<br>
++<br>
++&nbsp;&nbsp;&nbsp; HOSTENV=3D123 run_podman 125 run --rm $image printenv =
HOSTENV<br>
++&nbsp;&nbsp;&nbsp; assert &quot;$output&quot; =3D~ 'invalid image env var=
iable &quot;HOST\*&quot;' &quot;Host env leak from image env on podman run&=
quot;<br>
++<br>
++&nbsp;&nbsp;&nbsp; podname=3D&quot;p-$(safename)&quot;<br>
++&nbsp;&nbsp;&nbsp; ctrname=3D&quot;c-$(safename)&quot;<br>
++<br>
++&nbsp;&nbsp;&nbsp; fname=3D&quot;$PODMAN_TMPDIR/kube_$(safename).yaml&quo=
t;<br>
++&nbsp;&nbsp;&nbsp; echo &quot;<br>
++apiVersion: v1<br>
++kind: Pod<br>
++metadata:<br>
++&nbsp; labels:<br>
++&nbsp;&nbsp;&nbsp; app: test<br>
++&nbsp; name: $podname<br>
++spec:<br>
++&nbsp; restartPolicy: Never<br>
++&nbsp; containers:<br>
++&nbsp;&nbsp;&nbsp; - name: $ctrname<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; image: $image<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; command:<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - printenv<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - HOSTENV<br>
++&quot; &gt; $fname<br>
++<br>
++&nbsp;&nbsp;&nbsp; run_podman 125 kube play $fname<br>
++&nbsp;&nbsp;&nbsp; assert &quot;$output&quot; =3D~ 'invalid image env var=
iable &quot;HOST\*&quot;' &quot;Host env leak from image env on kube play&q=
uot;<br>
++<br>
++&nbsp;&nbsp;&nbsp; run_podman pod rm $podname<br>
++&nbsp;&nbsp;&nbsp; run_podman rmi $image<br>
++}<br>
++<br>
+ # vim: filetype=3Dsh<br>
+--<br>
+2.51.0<br>
diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/p=
odman/podman_git.bb<br>
index c714e73f..3eb5f426 100644<br>
--- a/recipes-containers/podman/podman_git.bb<br>
+++ b/recipes-containers/podman/podman_git.bb<br>
@@ -26,6 +26,7 @@ SRC_URI =3D &quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp; [file://CVE-2024-9341.patch;patchdir=3Dsrc/import]=
file://CVE-2024-9341.patch;patchdir=3Dsrc/import \<br>
&nbsp;&nbsp;&nbsp;&nbsp; [file://CVE-2026-55686-dependent.patch;patchdir=3D=
src/import]file://CVE-2026-55686-dependent.patch;patchdir=3Dsrc/import \<br=
>
&nbsp;&nbsp;&nbsp;&nbsp; [file://CVE-2026-55686.patch;patchdir=3Dsrc/import=
]file://CVE-2026-55686.patch;patchdir=3Dsrc/import \<br>
+&nbsp;&nbsp;&nbsp; [file://CVE-2026-57231.patch;patchdir=3Dsrc/import]file=
://CVE-2026-57231.patch;patchdir=3Dsrc/import \<br>
&nbsp;&quot;<br>
&nbsp;<br>
&nbsp;LICENSE =3D &quot;Apache-2.0&quot;<br>
--<br>
2.35.6<br>
<br>
</div>
</body>
</html>

--_000_DM4PR11MB6189F4607465621C4D8D06D0C4A52DM4PR11MB6189namp_--

