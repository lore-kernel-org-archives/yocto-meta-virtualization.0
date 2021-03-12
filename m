Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.42])
 by mx.groups.io with SMTP id smtpd.web11.5657.1615538360345332502
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 12 Mar 2021 00:39:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=EB8AKmTu;
 spf=pass (domain: windriver.com, ip: 40.107.237.42, mailfrom: daniel.dragomir@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nC9w/lXiZFwoG/JBhL0WBhkkpgGdjD1wxneBtlwlmG6TvjbeenTaUPoE0mSUJTsJJ3CLfUAsOYftKz/4OLrrNBNSV0vRsHA2/KGT7OSB9kZoVv39jB6bVFjfGSMLQINakwKGT0AWKf7orpeVveOmUOPoYoIxv4dkFnMy8VqWY4abSY/gobqhDn6n+kdCqu3LIu+1NGzIEmsTA+pB6CEjhFH37T8tbPrZJnNVqtCwZ9ScwuBYxmDEiws5iIh+eutSdJTuyWp+PD0sBV8pNmdrw3hz9RYS1ErP306ApcsvP2f7W/EtB3Zai79d7Ib/y9RLu18K22JteoyMkTGW4/eMpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mNO9BdCzFJKYSWT9Hgh9Rh7tdDGUQC1cS+xKcr44m3k=;
 b=nKyVH482GuDKCRElhggIuGDK8Mk7Bxk3fmvtTTgD+BEbMELIV6VXFja1SC1DwwwobU+4yWk2FNtpZAV55p3VWjJzyWNGHRnxgupC7chKtbg8p3YqjFrgaafjbKm3HVsWDS9V2MgdWkuoTuar6fR+mOdc3i/tiA50qXNz8qXuxr6IwTh8c6O5qbg04inseTcl8dOsS52vUArx/PJFs1w9VM2hJbpXYlqtJHHp4y7LShIg1Dp+jdp0gaxWzv/OIv3G6zxvc0Fe9H/6Z/aqgmlr2qEe1+NPv/sDAnAbNO1KGH5OvrN43PbKW2B8z4lDBuH8Mqvhq7K+vv+hPLyf22JoGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mNO9BdCzFJKYSWT9Hgh9Rh7tdDGUQC1cS+xKcr44m3k=;
 b=EB8AKmTurmicbg+A2pTuwVGgaRKEE9eMuLypiJlZk5b6SvM0zQrQKGbeYwxo81wpMQwYWWlGCcM3tXxTpnq5uQVi4ESNrx6h+XtT+J3+DupY2VSR1DK26qZO68PyRPxtfoJWHWwzLgl/TTsmU7MA2oJ2OpznEhCd/adkLL9htKA=
Received: from BYAPR11MB3077.namprd11.prod.outlook.com (2603:10b6:a03:90::14)
 by BY5PR11MB4022.namprd11.prod.outlook.com (2603:10b6:a03:18a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Fri, 12 Mar
 2021 08:39:15 +0000
Received: from BYAPR11MB3077.namprd11.prod.outlook.com
 ([fe80::6cc9:d566:d792:5ab2]) by BYAPR11MB3077.namprd11.prod.outlook.com
 ([fe80::6cc9:d566:d792:5ab2%5]) with mapi id 15.20.3912.028; Fri, 12 Mar 2021
 08:39:15 +0000
From: "Daniel Dragomir" <Daniel.Dragomir@windriver.com>
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization][PATCH] lxc: Fix download URL from SRC_URI
Thread-Topic: [meta-virtualization][PATCH] lxc: Fix download URL from SRC_URI
Thread-Index: AQHXFxl4jPVLLx+tXk+ozopq2PhVlqqAB/RB
Date: Fri, 12 Mar 2021 08:39:15 +0000
Message-ID: 
 <BYAPR11MB307762AF44B13DE8A7313B63F76F9@BYAPR11MB3077.namprd11.prod.outlook.com>
References: <166B8AE5719DF3F0.31346@lists.yoctoproject.org>
In-Reply-To: <166B8AE5719DF3F0.31346@lists.yoctoproject.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
x-originating-ip: [2a02:2f0e:c315:4f00:7e90:fc95:d294:c7b1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bfb831ee-bf6a-43ed-17ed-08d8e53251cf
x-ms-traffictypediagnostic: BY5PR11MB4022:
x-microsoft-antispam-prvs: 
 <BY5PR11MB4022700130CFB273A6C46496F76F9@BY5PR11MB4022.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 c6H89toiIE4PYgKzAYr6jkUgu0pJcNfHgVIDltKwKFwBgYgCpYoIfnY+dZVFRqCVaf+VSKspDoSkeG7wlLZ204Is5xOBAugQnObTuU4ywyFepQwTkbPZAOxpD9SqcTQX8kQpzEuTNnqx3ucSWNIuWVsk0Fc352uT4Bz4vQxyFzzmKs/HNMIIDDWC4ataOQNrw3d5YGxE62gtl5abkk+HmFF4k8jSl5QS91BwGUqR0Ruq1dUoPn1Feev3/rOKbEk0+waTjENKdah3zRkISooXiH9oc5o7wgAi7fINxKaup0PRpDLQHygkkl0jADpQyBFxq5IGJ66m6oPFXe5oOWHeDyBNFwhXMh+TLWoAILFTaKL0XHyXYGWU0dIDcYsCI/JN5QfAwor04LxitqGtu/fCviXBQftHDs9h0BrA6m6A9bf8bifm5z3/ZGOZ+1L1FltooZ3AcxdW2Oc40wz1r9UsChQuYUVQ68juOaY1eMjRK7I7yr90Nf9DJjEYdRD1TjUS6CEhKsavhAzbWXe8fDy8ZkfCwyNGTHEYp4uBlH9eyL3k/8iFxft2/4NUPcYNlUT4RFXF8+gPldCYt4f+2j2b2krrYZJsmbHyyN4QKQYYPH9WlANy1F2qx4Ol7unQ8015LSBURUsmr17cHwtaQ4guW5EErj8xxV6U/NxZyUMQc3+zauI7sDWzqF+mgak4Uk+Z
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3077.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(346002)(396003)(366004)(376002)(52536014)(76116006)(91956017)(55016002)(6916009)(66946007)(966005)(66446008)(64756008)(66476007)(9686003)(316002)(66556008)(478600001)(8676002)(8936002)(5660300002)(33656002)(7696005)(18265965003)(71200400001)(186003)(6506007)(83380400001)(86362001)(19627405001)(2906002)(166002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?q5Q/yzgUx0AadHqeAMdAJxxvYNHxEdIQZWdutgnDe+kkOe4XbaU5qYdm47hl?=
 =?us-ascii?Q?YgsQ3W7qtiB4EZuQ4BJGqEZAL5C7bzMd8R0WYz9BjWOF8jgIlGlkIj5iPFz6?=
 =?us-ascii?Q?eFWTKQA47A8JmuV4ahni/STgLqlcdrZp13c9C+28/kvHWVSKZOQicDMy+lJB?=
 =?us-ascii?Q?IBivj8A15b1Q8RkvTVHZSZECFoQu2tAzj/0n1WDZkex0fBkJZMLMjiUNLAoA?=
 =?us-ascii?Q?2JzXnCh1K+HX4IqROshPlCFJmWmTtp41zC1x0tMyX6hgCzqgBGA3VjRlLfIn?=
 =?us-ascii?Q?c/p1p/zRClBw6wKg2nxDhEVqHl+oHPlxK4hVmuQyTkaECW4JKsBgCJ55ChTY?=
 =?us-ascii?Q?hS1Um6ij6iIHL8GYwTQ5NWnH0EjS8mIKLm9HH/OrP4pKxIiL0s0Wj+fQVf/4?=
 =?us-ascii?Q?sVpqDZ/UVvTnUzUrtV9GDSuSRg0ULdhg7PT/xOzp/huDCaEC5+QYYqdDqMQl?=
 =?us-ascii?Q?MLbHCcyK7UT4hNucUTaMd8DNhyUODL2wC5qInd9TWx6v6xFJQ+8RRK2Gq5we?=
 =?us-ascii?Q?cnp1Od8DsIiPYpCmHvjwXdYgMgmcMHDdHvUvIELKr9VFKVB5dVOSsBTz2NP/?=
 =?us-ascii?Q?5fVrwpQJyXf2BZrlx5Y21bogNA+FVQ/Hx4QRpghs23L6gcWmDd7JCRcHMR/X?=
 =?us-ascii?Q?ho/ZhNGamrbyI9I/GOxyIdYmznh5yJGGN3At7FD7I6xk5qyZB2O9B8+Fao3c?=
 =?us-ascii?Q?5Y8zeKPF7O1sO3Ew5qUlccHX0De5w9uX/NfG1Tik5nsE9GGjD24Fvv/CU4aE?=
 =?us-ascii?Q?dPY4ABbzRRRy+9ovZqsFzhb0+SrAaWdPvf3oHQjsN8DwrR95/HQY0ascSeFy?=
 =?us-ascii?Q?99gipTL5O4wOYleG4hPlcsqi7lqHEqk3X6euS/C+tblMaDv9ggyw602/8LFj?=
 =?us-ascii?Q?WvK5vvtRAKdmH/oNDVR4pDAJraHAHmTVuuFIXufrlkbQQQrgJuwvczzMQVld?=
 =?us-ascii?Q?DSYuoJCKO1UAcx8jvYrVxMZdjS5N9p6iFmwNfmGZsLiv82AqAAcyozgX8y3k?=
 =?us-ascii?Q?QCJjVBuQAZyn6qXIoWwP0mYWtx4ovXDqFoM+tESBgPxdOwAVAu4pQcEY+CBV?=
 =?us-ascii?Q?1YPcfA+fsOhGKcIfVutRWReed7jQ4xhlkmEebp0DYMAXdxdcsiEX1VRbcD5e?=
 =?us-ascii?Q?AoqUXsMvljYB9p278lofyTXaECzRrY2tJJkUTCXdUp3IqD2ZleaNk25ut5j+?=
 =?us-ascii?Q?lQV3e1EvmeXb/W/y9JqeWS5J3IYhavlUZhgkBL9TFQ9wbL8EMPDq6vNYOyPm?=
 =?us-ascii?Q?bAYhlGH0QHe3r/iI9enb3TOxGvpDbPFDgoBTG6iEpbbxl6e+OIugfG3r+dIy?=
 =?us-ascii?Q?FyfojBDzybnTbWwgC5oL6Wd71vB8CW9s+PG6nScHGvl1orj60M98XJ4u02zt?=
 =?us-ascii?Q?Db5NFNg=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3077.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfb831ee-bf6a-43ed-17ed-08d8e53251cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 08:39:15.5188
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: STnrcY7/Iv3E6PGsV0hF1cTzZnZWkoPchUrSh3u1hHKjt19xcE1SGF7yf/Cfw0sfc8ivVfObPuQx3xzBiBAxwnuUZkL8M1V87IxEzdZoHnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4022
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BYAPR11MB307762AF44B13DE8A7313B63F76F9BYAPR11MB3077namp_"

--_000_BYAPR11MB307762AF44B13DE8A7313B63F76F9BYAPR11MB3077namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry Bruce! Now I saw there is a similar patch sent on mailing list. Pleas=
e ignore this one.
Still... I don't see the other patch merged upstream on master.
And I have this error on dunfell and thud branches too. Can you backport th=
is change untill thud?

Thanks!
Daniel
________________________________
From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists=
.yoctoproject.org> on behalf of Daniel Dragomir <Daniel.Dragomir@windriver.=
com>
Sent: Friday, March 12, 2021 12:22 PM
To: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists.y=
octoproject.org>
Subject: [meta-virtualization][PATCH] lxc: Fix download URL from SRC_URI

Download URL from linuxcontainers.org for lxc has changed.

URL transformed to HTTPS due to an HSTS policy
--2021-03-12 09:53:23--  https://linuxcontainers.org/downloads/lxc-4.0.6.ta=
r.gz
Resolving linuxcontainers.org (linuxcontainers.org)... 170.39.196.167, 2602=
:fd23:8:1::8
Connecting to linuxcontainers.org (linuxcontainers.org)|170.39.196.167|:443=
... connected.
HTTP request sent, awaiting response... 404 Not Found
2021-03-12 09:53:24 ERROR 404: Not Found.

Signed-off-by: Daniel Dragomir <Daniel.Dragomir@windriver.com>
---
 recipes-containers/lxc/lxc_4.0.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/lxc/lxc_4.0.6.bb b/recipes-containers/lxc/l=
xc_4.0.6.bb
index ddff9af..b422909 100644
--- a/recipes-containers/lxc/lxc_4.0.6.bb
+++ b/recipes-containers/lxc/lxc_4.0.6.bb
@@ -36,7 +36,7 @@ RDEPENDS_${PN}-ptest +=3D "file make gmp nettle gnutls ba=
sh libgcc"

 RDEPENDS_${PN}-networking +=3D "iptables"

-SRC_URI =3D "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
+SRC_URI =3D "http://linuxcontainers.org/downloads/${BPN}/${BPN}-${PV}.tar.=
gz \
         file://lxc-1.0.0-disable-udhcp-from-busybox-template.patch \
         file://run-ptest \
         file://lxc-fix-B-S.patch \
--
2.17.1


--_000_BYAPR11MB307762AF44B13DE8A7313B63F76F9BYAPR11MB3077namp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Sorry Bruce! Now I saw there is a similar patch sent on mailing list. Pleas=
e ignore this one.<br>
Still... I don't see the other patch merged upstream on master.<br>
And I have this error on dunfell and thud branches too. Can you backport th=
is change untill thud?<br>
<br>
Thanks!<br>
Daniel<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> meta-virtualization@l=
ists.yoctoproject.org &lt;meta-virtualization@lists.yoctoproject.org&gt; on=
 behalf of Daniel Dragomir &lt;Daniel.Dragomir@windriver.com&gt;<br>
<b>Sent:</b> Friday, March 12, 2021 12:22 PM<br>
<b>To:</b> meta-virtualization@lists.yoctoproject.org &lt;meta-virtualizati=
on@lists.yoctoproject.org&gt;<br>
<b>Subject:</b> [meta-virtualization][PATCH] lxc: Fix download URL from SRC=
_URI</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Download URL from linuxcontainers.org for lxc has =
changed.<br>
<br>
URL transformed to HTTPS due to an HSTS policy<br>
--2021-03-12 09:53:23--&nbsp; <a href=3D"https://linuxcontainers.org/downlo=
ads/lxc-4.0.6.tar.gz">
https://linuxcontainers.org/downloads/lxc-4.0.6.tar.gz</a><br>
Resolving linuxcontainers.org (linuxcontainers.org)... 170.39.196.167, 2602=
:fd23:8:1::8<br>
Connecting to linuxcontainers.org (linuxcontainers.org)|170.39.196.167|:443=
... connected.<br>
HTTP request sent, awaiting response... 404 Not Found<br>
2021-03-12 09:53:24 ERROR 404: Not Found.<br>
<br>
Signed-off-by: Daniel Dragomir &lt;Daniel.Dragomir@windriver.com&gt;<br>
---<br>
&nbsp;recipes-containers/lxc/lxc_4.0.6.bb | 2 +-<br>
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-containers/lxc/lxc_4.0.6.bb b/recipes-containers/lxc/l=
xc_4.0.6.bb<br>
index ddff9af..b422909 100644<br>
--- a/recipes-containers/lxc/lxc_4.0.6.bb<br>
+++ b/recipes-containers/lxc/lxc_4.0.6.bb<br>
@@ -36,7 +36,7 @@ RDEPENDS_${PN}-ptest +=3D &quot;file make gmp nettle gnut=
ls bash libgcc&quot;<br>
&nbsp;<br>
&nbsp;RDEPENDS_${PN}-networking +=3D &quot;iptables&quot;<br>
&nbsp;<br>
-SRC_URI =3D &quot;<a href=3D""></a>http://linuxcontainers.org/downloads/${=
BPN}-${PV}.tar.gz \<br>
+SRC_URI =3D &quot;<a href=3D""></a>http://linuxcontainers.org/downloads/${=
BPN}/${BPN}-${PV}.tar.gz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://lxc-1.0.=
0-disable-udhcp-from-busybox-template.patch">file://lxc-1.0.0-disable-udhcp=
-from-busybox-template.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://run-ptes=
t">file://run-ptest</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://lxc-fix-=
B-S.patch">file://lxc-fix-B-S.patch</a> \<br>
-- <br>
2.17.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BYAPR11MB307762AF44B13DE8A7313B63F76F9BYAPR11MB3077namp_--
