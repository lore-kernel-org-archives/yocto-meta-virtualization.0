Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com [67.219.250.114])
 by mx.groups.io with SMTP id smtpd.web12.6942.1591158786700405421
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 02 Jun 2020 21:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@opengear.com header.s=selector1 header.b=kwVHts26;
 spf=pass (domain: digi.com, ip: 67.219.250.114, mailfrom: dan.callaghan@digi.com)
Return-Path: <Dan.Callaghan@digi.com>
Received: from [100.112.133.94] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.us-west-2.aws.symcld.net id 96/50-40102-00827DE5; Wed, 03 Jun 2020 04:33:04 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDJsWRWlGSWpSXmKPExsWSoW+9WpdB43q
  cwYQ/KhaLvjxjdWD0mHnqEXMAYxRrZl5SfkUCa0bLyf1MBXM4KvYvmsbcwLifvYuRi4NRYCmz
  xIlnH5kgnGMsEjfu/IHKbGKUOPdzCWMXIycHi8AOFokXkwMhEssZJfb/mQnWIiSwiEmi98pmZ
  gjnEaPE3e/b2EBa2AQMJNbNnQpmiwjoSfxteMMMYjMD2b0H/7OD2MICMRLzd59ngVihKnG3ZR
  8riM0r4CBx4PJjJhBbQkBe4vr2XawQvfISzVtnQ82RkDj44gXYYgmBqYwSl7+/BisSElCXWL3
  6KRvEIEGJkzOfsEAM0pH4u6iRFeLSnUwSE9d9ANrAAeTUS/zZWYRumYSAtcTh7kXsELasxNGz
  c6Dm+Eo0dV1mhpm5ueErO8gYCQEVidtPbCDCBRLrGl+yQdhqEnv23of6RUZiz7nvULacxKnec
  0wTGHVmIXltFpLXZiH5YAEj8ypGs6SizPSMktzEzBxdQwMDXUNDI11DYxNdU73EKt0kvdJi3f
  LU4hJdI73E8mK94src5JwUvbzUkk2MwCSSUtDGuoPx/OsPeocYJTmYlER53fdeixPiS8pPqcx
  ILM6ILyrNSS0+xCjDwaEkwVundj1OSLAoNT21Ii0zB5jQYNISHDxKIrweqkBp3uKCxNzizHSI
  1ClGY44JL+cuYubYPHfpImYhlrz8vFQpcd4fIJMEQEozSvPgBsES7SVGWSlhXkYGBgYhnoLUo
  tzMElT5V4ziHIxKwrxLQKbwZOaVwO17BXQKE9Ap9n3XQE4pSURISTUw9etOE42Jm3r+Z5DpX1
  s29QN9B+YZ/Hkl8fjFZH7hw1fj/h06yjBX9aTMVm2N90udH+9rv/bgkczDgn/+4VP+X7ty7c1
  zi0hTw9YlB9JWtfAyrw7ZLbBvqp3Aso6EhNheaZdlp1Q3inZ3M3yPPf+eT64z/kKGofqG9wlM
  WeHrm7PaeDVP7BU/6RPxWUtngZfttQXmfevX1Omue9NZfuj27Op9/0SFr6zOcgmfHJI24+e52
  O8RP89yGapwuyo/ntv6LGKxenJze5nACw/NUr1VYsdMPS/FSzCnfd875dXxuxxLSttKb3mf2l
  zXriJy222ndudVsXc/Fwaz8MzeMEvtlejM5zK7g7OW/H7IJhr+V4mlOCPRUIu5qDgRAIuqH1k
  vBAAA
X-Env-Sender: Dan.Callaghan@digi.com
X-Msg-Ref: server-3.tower-354.messagelabs.com!1591158783!1978994!1
X-Originating-IP: [104.47.59.171]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26564 invoked from network); 3 Jun 2020 04:33:04 -0000
Received: from mail-dm6nam12lp2171.outbound.protection.outlook.com (HELO NAM12-DM6-obe.outbound.protection.outlook.com) (104.47.59.171)
  by server-3.tower-354.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Jun 2020 04:33:04 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqP3QHfv+4Be95k4OwPfw15G7rS+ImDy6yI9sKmzHXwtXg9PQcpPXkYzWbJ4JwvWThltSVgRjMMb583lJMq3EwFXdGw4vXUN9dKCl/B/2JOz2igHQULLP3NbHS6a87Cfeyx7QULuliDZKB/gb1PKhGcjf52D9XrCtm7kGtKn7uQIoXrxvN1ApPn/zFe38mWi5l2SBPlmHBrq5lCH4LKHQBCZbQCQVB5JVjeUHUAkHJA2F/ljxH37qqYkh1B0986DNkJL+CKs5XkiuDEew1OWOHMwvkZVjFv3SDViQLg5IrIy0cZTCljdWWqv3YKARbu1LgtrhEmkRWDPYZJuwCrJSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uv/v+xYK/+fVwXOHPUo5vkHS98LnkjAR7lLR/XnNhiU=;
 b=GYE/3ikmsGv/vmUlyMnxLrPS15wwpAwCGNpm1xIUiOP4kf2wyNnfBMBBzUdSNlCojQJU+vXdapJQ3HuK7R9frPxs5dLasvV8jgbdtCl9Kyw9Masp7a06lLRuuCBvPHPnMjzcgz47VI6bFhBuNQvIlZuRkoCvth6r9J9W5hnlDfwXYaaJolDpXr5Rh9vnQ6opCXwUUTOVSqpJaWDP6XhPjCV8zGW1bK2raH1fWqHjUQInknHjXb8E92zXUIBwTW81CA3pmvAElRo3INaqi1DKcyIJg6NgbZrClZJOAPfbpvLYQSo4/Lz8e9XrHt1xrx34J0iYIqakjPmnw2yRDOhmDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=opengear.com;
 dkim=pass header.d=opengear.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uv/v+xYK/+fVwXOHPUo5vkHS98LnkjAR7lLR/XnNhiU=;
 b=kwVHts263lMPc3YSt0Azfi7iZTXmFuW0aBryz3Apjj+QUfoxtNqd/f7symywq32RyItzWUQndRkCaOa12q91IKLTjEemzsJhiryRTGtIDsCh36UE3n9KBDpboy3Wh8IhF+7LpbJhMOM3YElbMUguxCBj8v7hf9sh0+JIdeCj1tNqJ/EGBvG3r8FUK7X81x4PbpoI0VeRXZY6MQ69eZ3CJBfPsrwnK0cBE/XOQtCY9rEnyz9gj/JzPhwdmjQBhdZsAXoPJ2TtBNERcbqzdJR24E3EZu4ZxXYbrcHrxKZ7d+gnjvARotD4ZQHsvQeC8nElCV5WaK2aYvx4xE5MPD/fbw==
Received: from CY4PR1001MB2118.namprd10.prod.outlook.com
 (2603:10b6:910:40::35) by CY4PR1001MB2167.namprd10.prod.outlook.com
 (2603:10b6:910:43::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Wed, 3 Jun
 2020 04:33:02 +0000
Received: from CY4PR1001MB2118.namprd10.prod.outlook.com
 ([fe80::b50b:b7e4:7b57:9af7]) by CY4PR1001MB2118.namprd10.prod.outlook.com
 ([fe80::b50b:b7e4:7b57:9af7%7]) with mapi id 15.20.3045.024; Wed, 3 Jun 2020
 04:33:02 +0000
From: "Dan Callaghan" <dan.callaghan@opengear.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Dan Callaghan <dan.callaghan@opengear.com>
Subject: [meta-virtualization][PATCH] docker: enable docker.socket instead of docker.service
Date: Wed,  3 Jun 2020 14:32:45 +1000
Message-Id: <20200603043245.604769-1-dan.callaghan@opengear.com>
X-Mailer: git-send-email 2.25.4
X-ClientProxiedBy: SYXPR01CA0144.ausprd01.prod.outlook.com
 (2603:10c6:0:30::29) To CY4PR1001MB2118.namprd10.prod.outlook.com
 (2603:10b6:910:40::35)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from galangal.danc.bne.opengear.com (2001:44b8:21b0:d600:329c:23ff:fef3:d4d4) by SYXPR01CA0144.ausprd01.prod.outlook.com (2603:10c6:0:30::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Wed, 3 Jun 2020 04:33:01 +0000
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)	id 1AC9C42945C7; Wed,  3 Jun 2020 14:32:54 +1000 (AEST)
X-Mailer: git-send-email 2.25.4
X-Originating-IP: [2001:44b8:21b0:d600:329c:23ff:fef3:d4d4]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a097ea1f-bef2-488d-3c05-08d807773393
X-MS-TrafficTypeDiagnostic: CY4PR1001MB2167:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CY4PR1001MB2167FF0D1199E84981E7C04D90880@CY4PR1001MB2167.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-Forefront-PRVS: 04238CD941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	R0s/6KRHYuC5eC/25/bmKejAgIbQxK04NRt6/FuLhK9XeZpDHr0ZtAMfPd6bwiDffpBRiGSCkZB19Arwp1LOUmACM7QESSffZfcBxFLMKirTvIwHx9IMhthQ2CuGqWIibwrJiR81BC60Y+ypqMEgnIVzqAeEQXxurmtvKRoB1NWbA/rvuPgPjOX7wGG/aHAaNcWcw0ga2M2qplaOCqJlwq0Lm9O1LFGmSIc/EEDMtc9xqJy84mIqdzNe3oPout47T3EnbmnKu4g4WAZzDkbSIN5iIr2rYDhXsu2jeTB3nGmrJtnPzXwe8fbRF0hZPajU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1001MB2118.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(376002)(366004)(346002)(39850400004)(396003)(1076003)(52116002)(66556008)(478600001)(5660300002)(6916009)(2906002)(66476007)(66946007)(36756003)(44832011)(186003)(316002)(4326008)(8676002)(107886003)(42186006)(426003)(6666004)(6266002)(42882007)(2616005)(83380400001)(83170400001)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	8/3GsOxQ5ksW0t/KTMFQnQ6HuBAfUSIHgx1m3to2M24gyzI8HcMINOL6qZu9VBsQLBLo92Nc8SVNASpcpHHVYERn7stS2lqNbKJsew8+0h97TUqrClTXwKNNY9LArOZB2MohYURsOZx1oSEi7Md47IyLYF3Ll+WUAbMb+hJxe633nUrv5Y6O1uQw/spB5hCbSTtkuAkDvzOLOodnJNYpNfraxoNdtkSf1vgLX8kuYknql3spy5SOF8GuwB3O1/JejpsxiaCuG+sn7vY4el+U6VDerfSJAXisKsxSPwGPk7P1ih1H5LYBuZYmWwiffN99t3wf6hRFQrmUMjqaQUkCQr5+nVMZP+B9fxq/lJ+hUfrG4v583matkROg5pfGXpyc/139iWeSpZtrw8/SL5adj2Ef+pX0gm2a2g/lE5zIDocoKiYcK/oCziUMYDfDAm4aEpGZrIQ8oeGgO8CePEiHfbwX7V+dMpWguCkUKRtMLuQTDQ+ZImmb6KxrmWEGH7xSRZQC5qyEHxKQzKzLm3nWtiuiz9bLWpxIC7f13PyQGevfobHBwm5iGijqDl3GarS/
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a097ea1f-bef2-488d-3c05-08d807773393
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2020 04:33:02.1874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0VcJfv8pFeCO1aw6/AlqZB205aN2HPHI+/fOgjuTw/iyPnz42h6Ejbp385OVGFWmSbMwRICqOMnIUZOD5lac/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2167
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The docker daemon supports systemd socket activation. If we enable
docker.socket (and not docker.service) then the daemon will be started
when it is first used.

Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
---
 recipes-containers/docker/docker.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/docker/docker.inc
index 32d4a2e..4bcb409 100644
--- a/recipes-containers/docker/docker.inc
+++ b/recipes-containers/docker/docker.inc
@@ -49,7 +49,7 @@ PACKAGECONFIG[transient-config] = "transient-config"
 inherit systemd update-rc.d
 
 SYSTEMD_PACKAGES = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
-SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('DISTRO_FEATURES','systemd','docker.service','',d)}"
+SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('DISTRO_FEATURES','systemd','docker.socket','',d)}"
 SYSTEMD_AUTO_ENABLE_${PN} = "enable"
 
 INITSCRIPT_PACKAGES += "${@bb.utils.contains('DISTRO_FEATURES','sysvinit','${PN}','',d)}"
-- 
2.25.4

