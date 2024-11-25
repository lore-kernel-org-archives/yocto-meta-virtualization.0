Return-Path: <stanley.stanton@taitcommunications.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE9DD59D6B
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 20:45:56 +0000 (UTC)
Received: from AUS01-ME3-obe.outbound.protection.outlook.com (AUS01-ME3-obe.outbound.protection.outlook.com [40.107.108.186])
 by mx.groups.io with SMTP id smtpd.web10.29145.1732567548455124616
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 Nov 2024 12:45:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@taitcommunications.com header.s=selector1 header.b=osEYI4+S;
 spf=permerror, err=parse error for token &{10 18 _extspf.taitcommunications.com}: parse error for token &{10 18 _spf.adp.com}: parse error for token &{10 18 1._spf.adp.com}: limit exceeded (domain: taitcommunications.com, ip: 40.107.108.186, mailfrom: stanley.stanton@taitcommunications.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZN0/dV4DDJJtfT4MV09+gn/RwrFudPLr9MjoAfNlaJIboCVIWHtxYuajjrgx+OgSGmBna7QlvP+vAN/XeOqYgQ3iVOcOvBLahlfIR83QUMXxO1Pi+2DF+Lwg9Pvt0TU0v8unq1srplPbLiXTIb8zauIYFG/4gK5m7oZwY4jTy/CN0pH2yN5+Swvj2MAfD2r9GrBY4cLaeaL8xlfKJ6GuDA/NItzUFnIF0BGziZ1/1ZZnLh9cpaDBT+Ms3YFy8AKEfVrLaQpikdAl/y6c2aHq3EcKsPWUztBrFv8pi+wqk8Z26iy6Ml2erlDCmD7guf2Fn2PSqkTyejGXk9lwcrD1EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SRv44y5N0HbGzZNiwbGoAHmrrWKXVuQ8phcEbdY+mcM=;
 b=u6SE3P0PSr0vJkrdWrYjt5pGE2Gk0HjOYOdg3AzngmRSazQQvenqxsLwB/qqHv4yq4rQrnfZIr7d6Ci0HSdRSF7KE/Mb9letJmn4Hy0GgkL9RcVxwyd/4Jk6Ij5UYrTBqfl/8rY9nGE07DxWOA6f7dXLBfqN7baCsuMNiEoQcEosIAJDKO4VRl5hfXP+6zcmMPKuL5HS2+ql9AQ04hlmRwmTWo47NpgfgWRYCXd6PSxSxqlviKJUmc16gkwDbD9TZVlqQBtMB4P9YiBC9kVUX8prPFnZXQOH8+lTiqPQJHKQXzjFo6UKeDFYLDNLSojSphuTqWBdIFnJygeAeJPpFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=taitcommunications.com; dmarc=pass action=none
 header.from=taitcommunications.com; dkim=pass
 header.d=taitcommunications.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=taitcommunications.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SRv44y5N0HbGzZNiwbGoAHmrrWKXVuQ8phcEbdY+mcM=;
 b=osEYI4+ShnFRqzUQ7Muqopkuh9uzK8+klF7sAcLL31QTTx+i6n/WyNiMl5gR2a82ZH1aP67Wm95z6+NQ2OPOr/PLEr7h/4xBR5M8gD2Z/J6LckUhZPCxaWO4HyWyYShaCnRKJHJooB6X9bZkNPThSFh97vIS8Zt0I0sxKdKNXQJ54cyFJxbIM96uEHzWxhfvIuSWNLR27ldhGJou906jHDfRubEPeqdAFpOYmyGXWEB2n5QM+J7faIyAnVWcMB16e7LOsLWkeHmZgMQD4mn9TlKEz8P/OXwhFMTAd1zq1ZmdCI5Mvv2Olh6Eh2+zIa58bN9/hLpIN0N6syuU/3bQ4w==
Received: from ME3P282MB2369.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:109::11)
 by SYBP282MB3526.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:1b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.12; Mon, 25 Nov
 2024 20:45:42 +0000
Received: from ME3P282MB2369.AUSP282.PROD.OUTLOOK.COM
 ([fe80::fb3f:80f9:487e:67f6]) by ME3P282MB2369.AUSP282.PROD.OUTLOOK.COM
 ([fe80::fb3f:80f9:487e:67f6%5]) with mapi id 15.20.8207.010; Mon, 25 Nov 2024
 20:45:42 +0000
From: Stanley Stanton <stanley.stanton@taitcommunications.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization] [PATCH v2] xen.inc: python 3.12: fix
 datetime deprecation warning
Thread-Topic: [meta-virtualization] [PATCH v2] xen.inc: python 3.12: fix
 datetime deprecation warning
Thread-Index: AQHbOjYjx3TZNZjgiUuKGFXzMEE64LLBJ+YAgAdZVBM=
Date: Mon, 25 Nov 2024 20:45:41 +0000
Message-ID: 
 <ME3P282MB2369EF3A93134024271E46BA852E2@ME3P282MB2369.AUSP282.PROD.OUTLOOK.COM>
References: 
 <CADkTA4Mc5RRPd_vJ5Bt4KDrCyvfB_H4EGwojXY+SAN8F--puqg@mail.gmail.com>
 <20241119034817.3051733-1-stanley.stanton@taitcommunications.com>
 <Zz63giXvpIojHO/S@gmail.com>
In-Reply-To: <Zz63giXvpIojHO/S@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=taitcommunications.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ME3P282MB2369:EE_|SYBP282MB3526:EE_
x-ms-office365-filtering-correlation-id: d940ba1c-b4ed-4839-d638-08dd0d92208d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|4022899009|376014|10070799003|1800799024|366016|8096899003|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?U9tibvMOIMUex8LpeC3U/ky0TFd903mD1AiiXecRH5bpg2Oxb0LGPyPXdYEQ?=
 =?us-ascii?Q?D9po/aN9uRveYuFsXVvJLH+9vgmwqfuML3pHDjj/r4iNEu/Ht8uBKRYLSTbs?=
 =?us-ascii?Q?6NYO8Eb24oF9dIUAWnjgHGOL4+waGEG3lISIElCz9ZBnUVUbpKezBlVV9T3A?=
 =?us-ascii?Q?0W/fwpEhgS02j1pA5S7vo6qCfRKpUiAFfYjfwX5WRsgphFVSndV/gHTmedXu?=
 =?us-ascii?Q?5F+nwIHIXcnzCiydX6AjzkiINMBstKEKtpk2E9NBu04Jo91wh0DEMe4O2Vhk?=
 =?us-ascii?Q?hGyh0SCTiiE28KSstr4QEiiJi0WA+ZQTLqJvasnqRXKsWiLXoRjsGTbj2Pk9?=
 =?us-ascii?Q?Zvmr26QTH+LWbq8532GCibPz/h2EW//OpPkpUHA0FkHVD7R21YbHsBLkphfv?=
 =?us-ascii?Q?2DcyLAa1EhWAapSpFn9ft5t/YIjOd4jJdXnjkiSxJbNMqik/dhgCawR4KqFM?=
 =?us-ascii?Q?vho8X5saC+IGbrk9GoM7CePSWeZKhIePZ1C2fLe+9jJGSZaDpNHUUMjMt5yd?=
 =?us-ascii?Q?e8wmyZCLNDzJZHzXNdc1HCqoFkw4UhXlc7M9jTaIz8h592a2toupgsnZkPjh?=
 =?us-ascii?Q?sSvTWN2xfQNkX62pntbUN1Ndlz1qZvESrxWAWx0cPgit6BO8vefsGNl1CAEG?=
 =?us-ascii?Q?BMk2AZEA0GHbZRCo9Fwfk8VcGLiDJNzzp6k6gk/plLPdo8aBNS7RVQ3acg+Y?=
 =?us-ascii?Q?hJas+fWlcMu6+9Lx5d6LdymeVO6NpDHB/DLgsV8JrOQKV1ldU7a7ImtrQ9tp?=
 =?us-ascii?Q?+C7MUwiJA9NRvB85JsOEk7tOy9mIlWX3NRANraOKK0IY5MQfFsINzNY6uxIa?=
 =?us-ascii?Q?WRQwi9hj4kGsNLWZQn9mg4Iwd3s1VkLpap+fM6GczX4OPuAelkA2rvfTQcuo?=
 =?us-ascii?Q?oufCfchO5wOtbetXmNJgUsFrwZKO4KL8NPHfHM+wmGvKMC4KQV11tp352i8o?=
 =?us-ascii?Q?on2mqPvG0qzsnJDREPewEmH2tnXViHSFN8PnOsfoAfxacuuuvqpccNsYA0FH?=
 =?us-ascii?Q?x//fOwpBItY3TlX40/N+o0hcfjY+LrxQbTjQfg3mmdVnnpQUswv3YqzVUtP8?=
 =?us-ascii?Q?lrRBegOgVA5sNE5b6tQ40ZFxgmoJevHSlk/5CNlnf6abNcrkskjn4bBfFW0O?=
 =?us-ascii?Q?HmA7ybyMWsOs3XKnKLVgdU5QpWwkvkuC+6NPh33s+B+QvC16VLwMgIuTHGmM?=
 =?us-ascii?Q?IqHK7HiSnKkny1wBdDz9QxQeNE6m8R1Uhu9zCi/fQDi7b8c1imZKBuVZV614?=
 =?us-ascii?Q?SA7DriOx4afrzkcXu6HBdSP6EatutEcKpr/kg2AnLv5xTIYwK5dMywLdRROG?=
 =?us-ascii?Q?VXJ5XqWdVxRt8DYubq02Vkh7UZ+cmdqEA22QsqBwv151h6QHvsUG5TLuaDso?=
 =?us-ascii?Q?kUrhP04=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ME3P282MB2369.AUSP282.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(10070799003)(1800799024)(366016)(8096899003)(7053199007)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ILb6eECsLiSyP+ZSTQZTmWsn+5tA4xpf2SS7r2UYUp3x2UMM8XrjLsGXaMJr?=
 =?us-ascii?Q?WGfkhykzUNSkP9ChOKiDAetdSmTZYTeQSTsookClHp90jcZwV/TUR2924Db2?=
 =?us-ascii?Q?gOblPvLQTR7QeX27aGAv5Q3k8SO//+pvUNbYMjiPNd/wOa4lcTQI4b1lRykF?=
 =?us-ascii?Q?7r8RB+ysdBY6nPPeUT5jiR8CdfkOf/GkMhzP6lbZ5+hpCx8e4svqV9YR71Gu?=
 =?us-ascii?Q?WRXyfT/3IVFiVQe8wfquavejjUaTjbW1wCANUiQD0XAn7wpTpcU4lRS/FKQ/?=
 =?us-ascii?Q?cIQM79wmeKEyaaI0Ncr12QtUsJc+7X/M3WrWPmVT+HnevZCWkJp+XXiN9qWi?=
 =?us-ascii?Q?XAxjaDwKYyzt6E5mUPvEVbFgrc6j5ne9CMWvsULBqvL0Pbpd+Od4XkI5p8eK?=
 =?us-ascii?Q?k23/Siqjvwtm5YpoT6d+XlXK8pNfUjhDlhxr4iw7hjCsRIOmWfZrlBgdS6Dw?=
 =?us-ascii?Q?WjIfwe1TsbkBcf1CVDVgFG0js80xz6muA8duH6UBYZgaw8eF66yyESH3zwGD?=
 =?us-ascii?Q?BXJ2vU8RM8EBbSO2gjNi85yiobSwtjL72eUwY3mtsUTum7WNzt21l5lAL/wr?=
 =?us-ascii?Q?MJHizWUTn069fVCP1f7+kMu8HxD4YvtqJi0VTwogwcD9poadYg8J3lNNxz1z?=
 =?us-ascii?Q?8PKhRcfGmRQp/anYcUVz3206jL5dlAdb0MXAjWArypFqk2AmaQVnFZzFwJsE?=
 =?us-ascii?Q?4CD0TYh0dH6sbZDLQLcVImQfmaQb+TsSbliZfrIoqRVTwz1EdnbSEu4Wfxqz?=
 =?us-ascii?Q?Pzyi+Fxfl/A52Ckefi21KduufLaPiMlKGVOQh/CfHoOM5Iksj931OgD3GKNY?=
 =?us-ascii?Q?YzVBRnt5/5mAT1ZQqwF1I7Z5IJpx4J9GzCPinl07NwnK7ssaVIh25ZIfA1da?=
 =?us-ascii?Q?W3EfGVv7QPkn6WCzRtMPBK3P2absdQ2JEsTxjJvMqaUYZqRJAoLmYaD8/WMh?=
 =?us-ascii?Q?LlDm3DOMdFEaxMYSFsvzNJH0vmNuKBSlN9EtrigNGGsVJnQ1eCcIKHkoQ/9p?=
 =?us-ascii?Q?KG+SADitB5Meh3QVNb013P1yDjCxvTxPgxkRBZ6w+/Cjpn7YuACqB72auyRG?=
 =?us-ascii?Q?5Bvpj/gokxM45yPGGEBc89Eaa68AcAG5dBa0HnUA5ottC38+wVjjm0q2w8dH?=
 =?us-ascii?Q?I+mWTU4i36fvvMvJD6Ws9l9FeKVEtqHydI/i8LUJDum6DNro/G9kKpL4hafH?=
 =?us-ascii?Q?gGyC/LOzSF/Kt3x1jBoQ18786cdm71G0DTd0tKG5Cie06178su7ovRRkECIR?=
 =?us-ascii?Q?7PljKmylUcNDYS5xITBFfmQU1Op3VoW37fY6Eo47q2vlbKhsSrfqg6nUgeM5?=
 =?us-ascii?Q?Fve+fYqRgBf/B84MVF1BZVFq4RBsALqD/81rsIJpb9EMer1Vln5PTw1pT17C?=
 =?us-ascii?Q?+6O4V2Ha4TkoPksy7IfdXBuiC+3QGIe/XbTYmVFh+enVRFeumuy5yYhax0hN?=
 =?us-ascii?Q?bWPYuG9m23n8aelKiMjpzGhh2b0m4ZTiiA4dPGPPt/x2pjgr8TmYIZ52TGL+?=
 =?us-ascii?Q?/UWFMT7nHHWat8Y6s2sqo6We3JiuZlNwl5TRuQFdBXnt2LPt9p+19+UafcFx?=
 =?us-ascii?Q?5FzZZaq0SEF9kGAIwFJF5tbfXmS6gwwGsQCVXS198DYYNjTlN7FF7Pbh49Bc?=
 =?us-ascii?Q?2RBEJiuwouvNrGW+ng1tOnYa8rYK/dXSb91VhSZxQFsTcSt6brJnFbzBsvPD?=
 =?us-ascii?Q?a3mEw/UxiVa2TTratzHN+vUGRRM=3D?=
Content-Type: multipart/alternative;
	boundary="_000_ME3P282MB2369EF3A93134024271E46BA852E2ME3P282MB2369AUSP_"
MIME-Version: 1.0
X-OriginatorOrg: taitcommunications.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ME3P282MB2369.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d940ba1c-b4ed-4839-d638-08dd0d92208d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2024 20:45:41.8680
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9ac1691-179e-406f-90a3-6d5b9a817466
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZxxnHIgBVyyY4kgA9smxLe9QArSdKJhLITK0ja1OYtrlquhdyYCyr5iYb4tktuSOjKSLyYeHtvxadomF2BpZW+pxTT+WZXSLxAn7BtNMJQJ79DtyDju+AmFVy36tkwLT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYBP282MB3526
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 25 Nov 2024 20:45:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9013

--_000_ME3P282MB2369EF3A93134024271E46BA852E2ME3P282MB2369AUSP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

I'd like to request this patch be cherry-picked to scarthgap.

Thanks,
Stan

________________________________
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Sent: Thursday, November 21, 2024 5:30 PM
To: Stanley Stanton <stanley.stanton@taitcommunications.com>
Cc: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists.y=
octoproject.org>
Subject: Re: [meta-virtualization] [PATCH v2] xen.inc: python 3.12: fix dat=
etime deprecation warning

[You don't often get email from bruce.ashfield@gmail.com. Learn why this is=
 important at https://aka.ms/LearnAboutSenderIdentification ]

v2 is merged to master. Request cherry-picks to any other
branches of interest.

Bruce

In message: [meta-virtualization] [PATCH v2] xen.inc: python 3.12: fix date=
time deprecation warning
on 19/11/2024 Stanley Stanton via lists.yoctoproject.org wrote:

> Parsing xen.inc with a host distro that provides python 3.12 (such as Ubu=
ntu
> 24.04) generates the following deprecation warning:
>
> DeprecationWarning: datetime.datetime.utcfromtimestamp() is deprecated an=
d scheduled for removal in a future version.
> Use timezone-aware objects to represent datetimes in UTC: datetime.dateti=
me.fromtimestamp(timestamp, datetime.UTC)
>
> This warning comes from the use of datetime.datetime.utcfromtimestamp()
> in get_build_time_vars.
>
> datetime.UTC seems to be a getter wrapper for datetime.timezone.utc,
> which is already available on older host distro python versions
> (I have tested only with python 3.10 provided by Ubuntu 22.04)
> so, opt to use that instead to prevent a breaking change.
>
> Signed-off-by: Stanley Stanton <stanley.stanton@taitcommunications.com>
> ---
>  recipes-extended/xen/xen.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index dcd281b5..63790f73 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -151,7 +151,7 @@ def get_build_time_vars(d):
>      source_date_epoch =3D d.getVar('SOURCE_DATE_EPOCH')
>      if source_date_epoch is not None:
>          import datetime
> -        utc_datetime =3D datetime.datetime.utcfromtimestamp(float(source=
_date_epoch))
> +        utc_datetime =3D  datetime.datetime.fromtimestamp(float(source_d=
ate_epoch), datetime.timezone.utc)
>          return " XEN_BUILD_DATE=3D" + utc_datetime.strftime("%Y-%m-%d") =
+ \
>                 " XEN_BUILD_TIME=3D" + utc_datetime.strftime("%H:%M:%S")
>      return ""
> --
> 2.43.0
>
>
> --
>
> This communication is confidential. We only send and receive email on the
> basis of the terms set out at https://aus01.safelinks.protection.outlook.=
com/?url=3Dhttp%3A%2F%2Fwww.taitcommunications.com%2Femail_disclaimer&data=
=3D05%7C02%7Cstanley.stanton%40taitcommunications.com%7C031f9b33b39345c39da=
608dd09e550c8%7Cb9ac1691179e406f90a36d5b9a817466%7C0%7C0%7C6386776027089054=
73%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAi=
OiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DTsw5pm4dY=
CwVwQAEJAVqa6ChRJKHV%2FyOOLkiLFWo8zE%3D&reserved=3D0<http://www.taitcommuni=
cations.com/email_disclaimer>
> <https://aus01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.t=
aitcommunications.com%2Femail_disclaimer&data=3D05%7C02%7Cstanley.stanton%4=
0taitcommunications.com%7C031f9b33b39345c39da608dd09e550c8%7Cb9ac1691179e40=
6f90a36d5b9a817466%7C0%7C0%7C638677602708929015%7CUnknown%7CTWFpbGZsb3d8eyJ=
FbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIl=
dUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DzbqbUs9GZKe3d%2BhWA3U0b4MrfWFqqYzTgpiPJ=
JHsc1I%3D&reserved=3D0<http://www.taitcommunications.com/email_disclaimer>>
>

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8976): https://aus01.safelinks.protection.outlook.com=
/?url=3Dhttps%3A%2F%2Flists.yoctoproject.org%2Fg%2Fmeta-virtualization%2Fme=
ssage%2F8976&data=3D05%7C02%7Cstanley.stanton%40taitcommunications.com%7C03=
1f9b33b39345c39da608dd09e550c8%7Cb9ac1691179e406f90a36d5b9a817466%7C0%7C0%7=
C638677602708943105%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiI=
wLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&=
sdata=3Dxe6ynKi6mSTfH9UchDc8oNCr19kX60IuRArtqoGPKpM%3D&reserved=3D0<https:/=
/lists.yoctoproject.org/g/meta-virtualization/message/8976>
> Mute This Topic: https://aus01.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Flists.yoctoproject.org%2Fmt%2F109659338%2F1050810&data=3D05%7C0=
2%7Cstanley.stanton%40taitcommunications.com%7C031f9b33b39345c39da608dd09e5=
50c8%7Cb9ac1691179e406f90a36d5b9a817466%7C0%7C0%7C638677602708954926%7CUnkn=
own%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zM=
iIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DPNTWHSzu3JHYVAm3Ee=
vly2O%2BxIr%2Fz6oq%2BxGnX43T2pU%3D&reserved=3D0<https://lists.yoctoproject.=
org/mt/109659338/1050810>
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://aus01.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Flists.yoctoproject.org%2Fg%2Fmeta-virtualization%2Funsub&data=3D05%=
7C02%7Cstanley.stanton%40taitcommunications.com%7C031f9b33b39345c39da608dd0=
9e550c8%7Cb9ac1691179e406f90a36d5b9a817466%7C0%7C0%7C638677602708969331%7CU=
nknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW=
4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DOBh4KvfqkwNa17q=
x%2F39cjPhgp4U%2ByKv3B6sQiMB4q90%3D&reserved=3D0<https://lists.yoctoproject=
.org/g/meta-virtualization/unsub> [bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--_000_ME3P282MB2369EF3A93134024271E46BA852E2ME3P282MB2369AUSP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi Bruce,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I'd like to request this patch be cherry-picked to scarthgap.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Stan</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Bruce Ashfield &lt;br=
uce.ashfield@gmail.com&gt;<br>
<b>Sent:</b> Thursday, November 21, 2024 5:30 PM<br>
<b>To:</b> Stanley Stanton &lt;stanley.stanton@taitcommunications.com&gt;<b=
r>
<b>Cc:</b> meta-virtualization@lists.yoctoproject.org &lt;meta-virtualizati=
on@lists.yoctoproject.org&gt;<br>
<b>Subject:</b> Re: [meta-virtualization] [PATCH v2] xen.inc: python 3.12: =
fix datetime deprecation warning</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[You don't often get email from bruce.ashfield@gma=
il.com. Learn why this is important at
<a href=3D"https://aka.ms/LearnAboutSenderIdentification">https://aka.ms/Le=
arnAboutSenderIdentification</a> ]<br>
<br>
v2 is merged to master. Request cherry-picks to any other<br>
branches of interest.<br>
<br>
Bruce<br>
<br>
In message: [meta-virtualization] [PATCH v2] xen.inc: python 3.12: fix date=
time deprecation warning<br>
on 19/11/2024 Stanley Stanton via lists.yoctoproject.org wrote:<br>
<br>
&gt; Parsing xen.inc with a host distro that provides python 3.12 (such as =
Ubuntu<br>
&gt; 24.04) generates the following deprecation warning:<br>
&gt;<br>
&gt; DeprecationWarning: datetime.datetime.utcfromtimestamp() is deprecated=
 and scheduled for removal in a future version.<br>
&gt; Use timezone-aware objects to represent datetimes in UTC: datetime.dat=
etime.fromtimestamp(timestamp, datetime.UTC)<br>
&gt;<br>
&gt; This warning comes from the use of datetime.datetime.utcfromtimestamp(=
)<br>
&gt; in get_build_time_vars.<br>
&gt;<br>
&gt; datetime.UTC seems to be a getter wrapper for datetime.timezone.utc,<b=
r>
&gt; which is already available on older host distro python versions<br>
&gt; (I have tested only with python 3.10 provided by Ubuntu 22.04)<br>
&gt; so, opt to use that instead to prevent a breaking change.<br>
&gt;<br>
&gt; Signed-off-by: Stanley Stanton &lt;stanley.stanton@taitcommunications.=
com&gt;<br>
&gt; ---<br>
&gt;&nbsp; recipes-extended/xen/xen.inc | 2 +-<br>
&gt;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.i=
nc<br>
&gt; index dcd281b5..63790f73 100644<br>
&gt; --- a/recipes-extended/xen/xen.inc<br>
&gt; +++ b/recipes-extended/xen/xen.inc<br>
&gt; @@ -151,7 +151,7 @@ def get_build_time_vars(d):<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; source_date_epoch =3D d.getVar('SOURCE_D=
ATE_EPOCH')<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if source_date_epoch is not None:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; import datetime<=
br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; utc_datetime =3D datetime.=
datetime.utcfromtimestamp(float(source_date_epoch))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; utc_datetime =3D&nbsp; dat=
etime.datetime.fromtimestamp(float(source_date_epoch), datetime.timezone.ut=
c)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot; XE=
N_BUILD_DATE=3D&quot; + utc_datetime.strftime(&quot;%Y-%m-%d&quot;) + \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; &quot; XEN_BUILD_TIME=3D&quot; + utc_datetime.str=
ftime(&quot;%H:%M:%S&quot;)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;&quot;<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt;<br>
&gt; This communication is confidential. We only send and receive email on =
the<br>
&gt; basis of the terms set out at <a href=3D"http://www.taitcommunications=
.com/email_disclaimer">
https://aus01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.tait=
communications.com%2Femail_disclaimer&amp;data=3D05%7C02%7Cstanley.stanton%=
40taitcommunications.com%7C031f9b33b39345c39da608dd09e550c8%7Cb9ac1691179e4=
06f90a36d5b9a817466%7C0%7C0%7C638677602708905473%7CUnknown%7CTWFpbGZsb3d8ey=
JFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsI=
ldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DTsw5pm4dYCwVwQAEJAVqa6ChRJKHV%2FyO=
OLkiLFWo8zE%3D&amp;reserved=3D0</a><br>
&gt; &lt;<a href=3D"http://www.taitcommunications.com/email_disclaimer">htt=
ps://aus01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.taitcom=
munications.com%2Femail_disclaimer&amp;data=3D05%7C02%7Cstanley.stanton%40t=
aitcommunications.com%7C031f9b33b39345c39da608dd09e550c8%7Cb9ac1691179e406f=
90a36d5b9a817466%7C0%7C0%7C638677602708929015%7CUnknown%7CTWFpbGZsb3d8eyJFb=
XB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldU=
IjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DzbqbUs9GZKe3d%2BhWA3U0b4MrfWFqqYzTgpi=
PJJHsc1I%3D&amp;reserved=3D0</a>&gt;<br>
&gt;<br>
<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#8976): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/8976">
https://aus01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.y=
octoproject.org%2Fg%2Fmeta-virtualization%2Fmessage%2F8976&amp;data=3D05%7C=
02%7Cstanley.stanton%40taitcommunications.com%7C031f9b33b39345c39da608dd09e=
550c8%7Cb9ac1691179e406f90a36d5b9a817466%7C0%7C0%7C638677602708943105%7CUnk=
nown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4z=
MiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3Dxe6ynKi6mSTfH=
9UchDc8oNCr19kX60IuRArtqoGPKpM%3D&amp;reserved=3D0</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/10965933=
8/1050810">
https://aus01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.y=
octoproject.org%2Fmt%2F109659338%2F1050810&amp;data=3D05%7C02%7Cstanley.sta=
nton%40taitcommunications.com%7C031f9b33b39345c39da608dd09e550c8%7Cb9ac1691=
179e406f90a36d5b9a817466%7C0%7C0%7C638677602708954926%7CUnknown%7CTWFpbGZsb=
3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFp=
bCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DPNTWHSzu3JHYVAm3Eevly2O%2BxIr=
%2Fz6oq%2BxGnX43T2pU%3D&amp;reserved=3D0</a><br>
&gt; Group Owner: meta-virtualization+owner@lists.yoctoproject.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/unsub">
https://aus01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.y=
octoproject.org%2Fg%2Fmeta-virtualization%2Funsub&amp;data=3D05%7C02%7Cstan=
ley.stanton%40taitcommunications.com%7C031f9b33b39345c39da608dd09e550c8%7Cb=
9ac1691179e406f90a36d5b9a817466%7C0%7C0%7C638677602708969331%7CUnknown%7CTW=
FpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOI=
joiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DOBh4KvfqkwNa17qx%2F39c=
jPhgp4U%2ByKv3B6sQiMB4q90%3D&amp;reserved=3D0</a>
 [bruce.ashfield@gmail.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_ME3P282MB2369EF3A93134024271E46BA852E2ME3P282MB2369AUSP_--

