Received: from outbound-ip23b.ess.barracuda.com (outbound-ip23b.ess.barracuda.com [209.222.82.220])
 by mx.groups.io with SMTP id smtpd.web12.2093.1600821271613132055
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 22 Sep 2020 17:34:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@digi.com header.s=selector1 header.b=Qnh1Ajav;
 spf=pass (domain: digi.com, ip: 209.222.82.220, mailfrom: david.burns@digi.com)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107]) by mx3.us-east-2b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Wed, 23 Sep 2020 00:34:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EfwI2xilsboJQSK/lh7qGLPS5bAn+ZUgL/0wDqM3XFAeBTbY7I0SK5Exl3xDFQhZWwKJ1gQC4l7fnmwk05LDNrN4j44DZnBcKiR0yKszkqBR38cZIzibVlPg9GaaR6dTTcmdCeJOqsV3zHM7lxbNrIp4ISKSNHtg8tdRvZsh70XI0y0UI5vDCHhYq/ZOs8VlpyEqS40f3MClUBOBzIGNgkvjQaS4J3NTHy0VfMr/oOLt89ATRnW445zAxwRF0+qA2yMD+0UuDCEqjt6lNj6LpJQA5hu2/zGBdxBcpMJKTvpbZvbud5TpmTsP/vEIJjmveoe2NSsgaw9PifXO5gNSkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tp6WmCcT9UjwaJopdF9CHBPrEZQ0s1y3o2z4NRYNb3c=;
 b=AYtnGl1GmrGDBtF11FdzyoNVV0L3VhpBWC1uIcqBFtv85KOJzpi/BLh64zv4oEki8vNewpmFbM89IGdghSRmf5l8LalLlafRmTStPLPyd2yhV98FKAGusByfnGh7SkmI4THzrPEzEjtUt+Gk+WTgyqWuD6BR9H91vQkkg3cqF+06VhfMQO/JksmRuRo9lU7DGk4QRjxAw707xUcRQT8S9rXA64zFfK4UgTCoFBv2zyp/+NXlM7eSqy3U0334P4cIrP4qBSU1I79yatAB4c/wDY04mPDMfmBUFi3uYula5f+aqWtY4Hyfb5vcIk4NCyG91brvlFeHnijJohSLILkoPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tp6WmCcT9UjwaJopdF9CHBPrEZQ0s1y3o2z4NRYNb3c=;
 b=Qnh1AjavhL1hDYdoE5Ry0qVzY7rbe897uW46aArVVAI2TcIxFpCeJq4iiboAcXJnzAxrzx3hxVakj2l07LHpsfY2TB3HBBlRC3QlkPK7zCu6IHOe87Uc769oYNBH4W9UTJ5zLvRlLziQPie9oC4LoCsRNVGO3pYtiVRJ6U1oYak=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=digi.com;
Received: from BYAPR10MB2517.namprd10.prod.outlook.com (2603:10b6:a02:b4::26)
 by BYAPR10MB3031.namprd10.prod.outlook.com (2603:10b6:a03:8a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.24; Wed, 23 Sep
 2020 00:34:28 +0000
Received: from BYAPR10MB2517.namprd10.prod.outlook.com
 ([fe80::79f7:7ff0:e70f:bf69]) by BYAPR10MB2517.namprd10.prod.outlook.com
 ([fe80::79f7:7ff0:e70f:bf69%6]) with mapi id 15.20.3391.024; Wed, 23 Sep 2020
 00:34:27 +0000
From: dburns@digi.com
To: meta-virtualization@lists.yoctoproject.org
CC: David Burns <dburns@digi.com>
Subject: [meta-virtualization][m-c-s][PATCH] salt: Move to version 3001.1 and fix RDEPENDS
Date: Wed, 23 Sep 2020 10:36:24 +1000
Message-ID: <20200923003624.188111-1-dburns@digi.com>
X-Mailer: git-send-email 2.28.0
X-ClientProxiedBy: SYXPR01CA0130.ausprd01.prod.outlook.com
 (2603:10c6:0:30::15) To BYAPR10MB2517.namprd10.prod.outlook.com
 (2603:10b6:a02:b4::26)
Return-Path: dburns@digi.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (117.20.71.45) by SYXPR01CA0130.ausprd01.prod.outlook.com (2603:10c6:0:30::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Wed, 23 Sep 2020 00:34:26 +0000
X-Mailer: git-send-email 2.28.0
X-Originating-IP: [117.20.71.45]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56a07d7f-502f-4ba4-d9e8-08d85f586dac
X-MS-TrafficTypeDiagnostic: BYAPR10MB3031:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR10MB3031ECCF5A796A5C8EE77BEB9E380@BYAPR10MB3031.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TAXZoUQUjea2rBZkYNK7fr2/5AQbvnizmzF9chKYBnt706FLxsfzTDwu00khazERbCoJv8yv7lAJjatZr3cwLdzblNcwwVmuhrQaXUbTLuhY9pvrzmTiy/4S3uUzn5z1ao5VkqU5J6sAMBMzvJBtZifcZIdvU1cRKazLKVa/vRnGd8idbIuNEYPiQIr5zXkBty3QyrLAeq8x0KZmgQrz6U7N0e891/SY8aEDh1rISDfh1zPqlclpS87sG7osYFWU3qR7SajAuRQFNMM2SjWGVtHJfGbX9NFzAhQm2sJXzHT5YYmcXifz/tUXrBoT/Uv9USB3avShXm7ugnGtwwkYb2y4Zxaqeygx0yZcQLIyj5sjvhlaCVf0Hsz6AF6tJ+35SPiFltNMkDmqI9/22aVuXaZr9ybALL4ztF3ANbKE/tNv1bl/bon+VNEM9cRGXF8hYaJbsBoj8YqvknJYl3nufQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2517.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(346002)(136003)(39850400004)(6512007)(478600001)(26005)(186003)(6486002)(316002)(107886003)(4326008)(36756003)(66946007)(83380400001)(66556008)(66476007)(8676002)(69590400008)(6916009)(16526019)(8936002)(956004)(1076003)(5660300002)(52116002)(2906002)(2616005)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	sN8djK03weiWxc2t9kq8jfBlLW2v94uZA5pLH2y0zWcm7I8HJArJKK+IDxFJ2PlhaK94xdoDouW7mj+KCk7H2ohpgdmSLb9Kn+S4xx5fUxXFdNhgK+jx59s4D/jocdn9ZkU3hhUsJE6WZ2xq6V2C4nxMYcM9VyqcJTgDHZXmYylL+dC5Wbx9PHlP3fWb7U62iCKpqKpcWx082kdD23DfDx+Ad2c5ZDAEFM8Jho2aNIJd8BPLQG0lPgiu7QOxI1khkXPhJl28wW49wfLlW1Wx6t1nACii2CfRzCZmdd7hoS8sND2hbbndHG6Cz8qWz9Nzof30i1xFogeZus1+6thIn7Oxrj0iMg1LDUkXb902PnlZLDXJTAIoHiwuLjkJ5NhLcd7Kw2QAczBClCob2P7HDKlnyYdpUVOS5Bo0uU1/9rBzYWdyaI2t1661Hu4x/8xUJZR97jtfv7GGDVc7qubhhOao0ZOJD3Lqx3Glh1B8j3/3EI+NfZmNBZgrgVMu2xrknQUzsmQWvu0SsUMhl5KeZegcmI8miW4PDjp1WoBBko48FLtIFt/AvA/R1kAi9uihO1lAhpCBIQHr2Fu1AsfQM2iGuFdM8OWZwiy7DDGs4G+WdBXzPI2ErIsKRF7FcHQCcBFYOyk3idfwy8Vn3wC3hA==
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a07d7f-502f-4ba4-d9e8-08d85f586dac
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2517.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2020 00:34:27.6939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gl2K6+WxcRvznbMmy9u6q/xcpiFcnfQcgy/HjMi91Fz0Q5a7ay8HtUwgs6U/uh5Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3031
X-BESS-ID: 1600821269-893005-6970-20783-1
X-BESS-VER: 2019.1_20200918.2058
X-BESS-Apparent-Source-IP: 104.47.70.107
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.227080 [from 
	cloudscan8-187.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 MSGID_FROM_MTA_HEADER  META: Message-Id was added by a relay 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=MSGID_FROM_MTA_HEADER, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Move to a new minor version of salt, 3001.1 that includes a number of
bug fixes.

Salt also needs the python3-distro runtime dependency for all of the
packages in the recipe, not just the salt-master package so it has been
included in the common package.

A runtime dependency on python-pycryptodomex has been added to the
salt-master and salt-minion packages as both have required it since the
3001 salt version.

Signed-off-by: David Burns <dburns@digi.com>
---
 .../salt/{salt_3001.bb =3D> salt_3001.1.bb}              | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-openstack/recipes-support/salt/{salt_3001.bb =3D> salt_3001.1.=
bb} (96%)

diff --git a/meta-openstack/recipes-support/salt/salt_3001.bb b/meta-openst=
ack/recipes-support/salt/salt_3001.1.bb
similarity index 96%
rename from meta-openstack/recipes-support/salt/salt_3001.bb
rename to meta-openstack/recipes-support/salt/salt_3001.1.bb
index 04ef1c7c..9b485d69 100644
--- a/meta-openstack/recipes-support/salt/salt_3001.bb
+++ b/meta-openstack/recipes-support/salt/salt_3001.1.bb
@@ -21,8 +21,8 @@ PACKAGECONFIG[tcp] =3D ",,python3-pycrypto"
 SRC_URI =3D "https://files.pythonhosted.org/packages/source/s/${PN}/${PN}-=
${PV}.tar.gz \
 "
=20
-SRC_URI[md5sum] =3D "ae06cef7557e237a954491a069e79a25"
-SRC_URI[sha256sum] =3D "5ca60d1b2cc8e63db50995bd8b117914eeaf57c48ce2b3a373=
1ee57163adf154"
+SRC_URI[md5sum] =3D "4174a6dd2c7eee808086ca06bdd928c9"
+SRC_URI[sha256sum] =3D "e9ebb4d92fae8dabf21b8749dc126e4a4048bf8f613f5b1b85=
1fe4b8226b5abc"
=20
=20
 SYSTEMD_AUTO_ENABLE_${PN}-master =3D "disable"
@@ -87,7 +87,7 @@ Between the remote execution system, and state management=
 Salt addresses the bac
=20
 SUMMARY_${PN}-minion =3D "client package for salt, the distributed remote =
execution system"
 DESCRIPTION_${PN}-minion =3D "${DESCRIPTION_COMMON} This particular packag=
e provides the worker agent for salt."
-RDEPENDS_${PN}-minion =3D "${PN}-common (=3D ${EXTENDPKGV}) python3-msgpac=
k"
+RDEPENDS_${PN}-minion =3D "${PN}-common (=3D ${EXTENDPKGV}) python3-msgpac=
k python3-pycryptodomex (>=3D 3.9.7)"
 RDEPENDS_${PN}-minion +=3D "${@bb.utils.contains('PACKAGECONFIG', 'zeromq'=
, 'python3-pycrypto python3-pyzmq (>=3D 13.1.0)', '',d)}"
 RDEPENDS_${PN}-minion +=3D "${@bb.utils.contains('PACKAGECONFIG', 'tcp', '=
python3-pycrypto', '',d)}"
 RRECOMMENDS_${PN}-minion_append_x64 =3D "dmidecode"
@@ -98,7 +98,7 @@ FILES_${PN}-minion =3D "${bindir}/${PN}-minion ${sysconfd=
ir}/${PN}/minion.d/ ${CON
 SUMMARY_${PN}-common =3D "shared libraries that salt requires for all pack=
ages"
 DESCRIPTION_${PN}-common =3D"${DESCRIPTION_COMMON} This particular package=
 provides shared libraries that \
 salt-master, salt-minion, and salt-syndic require to function."
-RDEPENDS_${PN}-common =3D "python3-dateutil python3-jinja2 python3-pyyaml =
python3-requests (>=3D 1.0.0)"
+RDEPENDS_${PN}-common =3D "python3-dateutil python3-jinja2 python3-pyyaml =
python3-requests (>=3D 1.0.0) python3-distro"
 RRECOMMENDS_${PN}-common =3D "lsb-release"
 RSUGGESTS_${PN}-common =3D "python3-mako python3-git"
 RCONFLICTS_${PN}-common =3D "python3-mako (< 0.7.0)"
@@ -127,7 +127,7 @@ FILES_${PN}-api =3D "${bindir}/${PN}-api ${CONFFILES_${=
PN}-api} ${systemd_system_u
=20
 SUMMARY_${PN}-master =3D "remote manager to administer servers via salt"
 DESCRIPTION_${PN}-master =3D"${DESCRIPTION_COMMON} This particular package=
 provides the salt controller."
-RDEPENDS_${PN}-master =3D "${PN}-common (=3D ${EXTENDPKGV}) python3-msgpac=
k python3-distro"
+RDEPENDS_${PN}-master =3D "${PN}-common (=3D ${EXTENDPKGV}) python3-msgpac=
k python3-pycryptodomex (>=3D 3.9.7)"
 RDEPENDS_${PN}-master +=3D "${@bb.utils.contains('PACKAGECONFIG', 'zeromq'=
, 'python3-pycrypto python3-pyzmq (>=3D 13.1.0)', '',d)}"
 RDEPENDS_${PN}-master +=3D "${@bb.utils.contains('PACKAGECONFIG', 'tcp', '=
python3-pycrypto', '',d)}"
 CONFFILES_${PN}-master=3D"${sysconfdir}/init.d/${PN}-master  ${sysconfdir}=
/${PN}/master"
--=20
2.28.0

