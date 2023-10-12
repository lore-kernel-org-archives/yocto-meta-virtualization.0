Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1893CDB482
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 11:53:21 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.59])
 by mx.groups.io with SMTP id smtpd.web11.9237.1697111599983661283
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 12 Oct 2023 04:53:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=xIAr7yF5;
 spf=pass (domain: navimatix.de, ip: 40.107.8.59, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QstIRfk6qBq7HQ4xqu7A73iCBivobIZ4YGF/rGWcW07wm/9jbRUF8xUr8eu2xGXji2L2mCBaWVFwlcUYTZ8kphaHCgnHW1SLiQ8Xb3yMNv1N8KIW0CzA0pwyAil8QqHtoOY9rGpQk0nTdJBgr2M3J13kBBlqMlqQUzl1YAZdQ/3SpzOMNod3a3efmsevqeDsLxFLnIEZvayYlCN24XGI2g+0UJ79my97PndzwkQReQU5ZVp7ujMiq3kLZywbRc9tBzdxR+VfpcPjfUGwCGP8bTAWji7lxLr9V4wbYXOE8YkRtvewXO9TeTHAPgCDz9PnlzibcmX1/tIM+TlmSfhu8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dj1XG5aHxhyNNwqqumtEfSb+uUCi4sOTmtnqcCir4+g=;
 b=ILOvJBgXLGuwm/jU9kni0H+o1V/aAZgQhfjCPrzfrjuyvJFPtRzQcIvfyeC9lmSKYndTO70ZzgoeFpA2VrktHaY58g1nQZNauCvRsum93PcjW97fGbvsLOidLxQt4TlgEEpVCBYqadEB5X23f6ck9PF9q/hJnMR9IRZKtP1HX7HwBS7ZRxZLMxyqva2P/7MSOVplPADowyG/RUOrXy0WwtUC/X7WADGVrlzZxI64zm64Sz7E3emHk2kfbCE4/IAv+kdieoIGOu4hQ05BYH/qxea6hEUGqrI/+mBDtuc1lVuxeFS+v2Rztf0rKjdNtDNyJZxsvBx2gCmt54Fos3zqdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dj1XG5aHxhyNNwqqumtEfSb+uUCi4sOTmtnqcCir4+g=;
 b=xIAr7yF55VZRJs50g7OREDk+OnUISpBV4tM1i/OMPC6ZzL6DZBHymKYxMl2kQ/8vnNvZJQ0+4UpvT05oR6Vds+mFLK+2nGnxq/TsKHIGzR3tgGln86xytF9lM9SDrrXVPMpu0Em9ryTV78dVE8rbW0AW3tFsEyj7/qFbnwmzkp4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26) by GV1PR01MB8817.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.29; Thu, 12 Oct
 2023 11:53:14 +0000
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::e2d5:b5c9:16e3:1417]) by
 VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::e2d5:b5c9:16e3:1417%3]) with mapi id 15.20.6886.028; Thu, 12 Oct 2023
 11:53:14 +0000
From: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
To: meta-virtualization@lists.yoctoproject.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [meta-virtualization][PATCH v2] packagegroup-container: require ipv6 for podman
Date: Thu, 12 Oct 2023 13:52:52 +0200
Message-ID: <9ca767079c48373a2d3117217376b0ab5b2a3143.1697111572.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7a::13) To VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0102MB3136:EE_|GV1PR01MB8817:EE_
X-MS-Office365-Filtering-Correlation-Id: a40f6835-eb9e-444c-7faf-08dbcb19d0c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ts8xW3L+JixwiNNl2zF8g4nBoz3xg4XXjv4itXOHNKloGxtbFpTXATAJ7zXQTAuD5k1aMl0JcljHsMo/L6fxsTL4CpfmxkB7BDg1HkD9GmJ1DlYiUkQeUrhmuYuDlsBgiDRmoQghBU6FrXEEK2GyCdVvIUowEsxf+0g+ac8+NP/2FvZEgWXWOSkaBwkjuzPY+KiUqhKY4f7Q8W5uapAwWyhU6U/pjTGhlXbOk5mW0suUMoIzrf1h6hhwPKN1jYP3FdSa5AmS3qskWDaaqubiNogE8FSNHd4zSDYYwRk4iMXzTeHCWdMQo0M5wwg2tO3SWwkavmbydXHrIBynvyJlxCFruSUfJ5x+/2KSayagBpER1r15111Z2P5vo3siYoWeLJIQRMHckidLL1OzIMirpYVp92lteCnyBSu3ITZJa5Un/K4xmcf+7qarOwV4/LjKoJj7+z98jK8vR2HVBNIuguLSSiADCFtaRQOMpppNe853HKsaButcbIuYn2BxMz4nwYeemT3zHhPcwozVwHytr4demAOOICmlodrv2T+/AxA2HgBlpcqmIN+HZXcd/1AK+7Ujuo+EUD683GQG6Cz6IFMaxi9smQYdrw0F3I8Dt7bDpHErJHSqHSVUlMj9zExV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0102MB3136.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(39840400004)(396003)(366004)(346002)(136003)(376002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(86362001)(36756003)(41300700001)(26005)(4326008)(8676002)(8936002)(66574015)(66946007)(66476007)(66556008)(107886003)(2616005)(6916009)(316002)(2906002)(5660300002)(83380400001)(6506007)(6486002)(52116002)(6666004)(478600001)(6512007)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1jj9SBzUzMxJqJFHh3hWv7iFIUWGRZhSCHTECJ6+48MriS5svYOnEzqI3gJ3?=
 =?us-ascii?Q?jFN25VY5vcI4SQOZTyYieGuliHwjSgFFcxOzPEJHWWMY2gvjlMF4euAPgrNI?=
 =?us-ascii?Q?tQwaDFzeDjfT6D9DX6L3kuzYyOZKU7A45X+cz3UjtKVejIXXcSjn+hzOXkQz?=
 =?us-ascii?Q?kYYkj2PSPc+U24jr4he3db0m6YewHEJujdRipC+aNaIWmuqIoTF/jNcJpocj?=
 =?us-ascii?Q?SBi+RlJvW8BbwWhpGLz8m8lj2qkOGiooPwN2iJO77B+4xCddLEpFXiaHzorG?=
 =?us-ascii?Q?FXYB2fY6I0pJonn4ZdRprQ+ixHG0UjhGbKoDi1R4yQ7nSwAWJdMZdGzdfoMn?=
 =?us-ascii?Q?YMAZU6JK//uYguewkjvqpCkTFnUztHmwHmguFE9UB08P1/GEVYtT3Blx2jP6?=
 =?us-ascii?Q?O+/i2y75gfvvX5lXbGmwgrCzQ9PJdx6cBu2sJHWOhQ5FmpuBQXeAZOBkDbV4?=
 =?us-ascii?Q?YGWHH09MNhB9DpwLqm6tRusnDEDox2zDrnEcaiJmn0mpTYIenCJLBtwv2xW6?=
 =?us-ascii?Q?UKUT/yf2nGsX7hbWjsf4gAGHPAUL2bR/xKz/PJPtWpz5b5b//mVeZbwKLrZJ?=
 =?us-ascii?Q?x/QRL9V6auFy+DgZf9x/QxRxTSSOSXNDfm26Rs99tONCM8qyLboPlj5LcgPi?=
 =?us-ascii?Q?kgXBU6lev8HjmR0f9Lt2Q0SInIVsBQkROHGdsNPnRhorwSoa6gwV+RCgM0b2?=
 =?us-ascii?Q?1B9z/ZLAmTfzACpp87eoDqE5YbDt7x1EAorfyIuUqr+1UzldlzciT0oCMvKz?=
 =?us-ascii?Q?Th8rzNerLvS/y786easRgsFO7i7wfjMWHIgF/NvRcob3YwiWAxtEKoXsQW/X?=
 =?us-ascii?Q?2b9frxM0W70GMUdd0K5d6UDTqXJvok7DbUvEQSNnLlloGs8AzQqq5DiXSwBH?=
 =?us-ascii?Q?g4uXMRK/OYBSqKh71HdkZyBaHCvDF3dNqSYcS08vZyVdctUYmg6B7SLICaOJ?=
 =?us-ascii?Q?qSbiDfBXcd1oSAA2Bk4IQ+/AnCWT8mFIVL1bKiVl0FamwdtmVBgs8rGJg5lY?=
 =?us-ascii?Q?GpVqm3ilFjG5KDwZuGIaJ0zjzlKsCmr3K4MLUuDWABwsHDeAkMWRpLve2WMj?=
 =?us-ascii?Q?Xk9xzziV9bPnJM1/DP04gMTX6lNQdWhDQRjEdgD2Q3gz1sVt5zuLXUY7AmJU?=
 =?us-ascii?Q?9IZQXtz8RG2fkForsPwZsa7Gmm6k/ZtH36kOQm5Srwi6YYYnxdmM8r4NbD2Y?=
 =?us-ascii?Q?bLIZFRwACIcnQZIp8MKQ9rTLuSUkRrrCYknQTgMY6J5HeJh6jp0P3KsXBtuv?=
 =?us-ascii?Q?G45R+ma0X4pnjdwguuDM62h8moHQ7N5REnkUgsaydnNT72+FiMvmEndg9d6Q?=
 =?us-ascii?Q?JIXhXLNahxcCaj6goMID/2NkmhUJS9nMpKjQUHgeS1j04vop3FMU7BfZZGbd?=
 =?us-ascii?Q?8x3AcTcFz5mNa+SCN+Z4/YXKiOcZWz4UFZbGz18tI+ng9cOzh2QVKdijVhZB?=
 =?us-ascii?Q?gEjcw+7atz4Pl/y/ZixQTiX54p5y78TnXE7LRjRz5VD7SeU4FHxvXGzXHQcl?=
 =?us-ascii?Q?WIxdv+46inrBzwVjvD2J693d2xEGXaKUcxWpt225L3F1iwthGxiZPKLGmIhN?=
 =?us-ascii?Q?K0is3x2FDfX0W3xAov0fQwmCcPWz4/ZdJfYy/JmoBQLOYixr4oJLbdTk2P+H?=
 =?us-ascii?Q?3A=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a40f6835-eb9e-444c-7faf-08dbcb19d0c8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 11:53:14.2372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7OjnTpQxoMJx+S2I9PKaJCferu6ljfEujqs0bomYGAAF2CuUWjbzBv8Hm8y3VYK9KrxlrOZS9YMFoEMZjUw2f1fENq+P939OhsQtaSLOQkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR01MB8817
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Oct 2023 11:53:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8351

The recipe *podman* requires the distro feature *ipv6*. Using a distro
without it causes the build of *packagegroup-container* fails, even if
*packagegroup-podman* is not used:

    ERROR: Nothing RPROVIDES 'podman' (but /build/../work/layers-3rdparty/m=
eta-virtualization/recipes-core/packagegroups/packagegroup-container.bb RDE=
PENDS on or otherwise requires it)
    podman was skipped: missing required distro feature 'ipv6' (not in DIST=
RO_FEATURES)
    NOTE: Runtime target 'podman' is unbuildable, removing...
    Missing or unbuildable dependency chain was: ['podman']
    NOTE: Runtime target 'packagegroup-docker' is unbuildable, removing...
    Missing or unbuildable dependency chain was: ['packagegroup-docker', 'p=
odman']

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 recipes-core/packagegroups/packagegroup-container.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/recipes=
-core/packagegroups/packagegroup-container.bb
index 8d418e9..8309a08 100644
--- a/recipes-core/packagegroups/packagegroup-container.bb
+++ b/recipes-core/packagegroups/packagegroup-container.bb
@@ -9,7 +9,7 @@ PACKAGES =3D "\
     packagegroup-lxc \
     packagegroup-docker \
     packagegroup-oci \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp ipv6', \
                          'packagegroup-podman', '', d)} \
     packagegroup-containerd \
     "
--=20
2.34.1


