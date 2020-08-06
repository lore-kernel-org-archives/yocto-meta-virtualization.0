Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com [67.219.246.112])
 by mx.groups.io with SMTP id smtpd.web11.2429.1596703144486608428
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 06 Aug 2020 01:39:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@harman.com header.s=harman2020 header.b=QBQLJ25h;
 spf=pass (domain: harman.com, ip: 67.219.246.112, mailfrom: nicolas.lavocat@harman.com)
Return-Path: <Nicolas.Lavocat@harman.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=harman.com;
	s=harman2020; t=1596703143; i=@harman.com;
	bh=y7JiuaeReoDqfZ+v+AAZJQWKuYuNGa1yTcN401Q1aPk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=QBQLJ25hripv8W1rTiZZvzzmQWbwrISODdt3tiungf0UBukPXxb6g1YEeQjpSYyxz
	 I+90f82uJMh+o1FwlK9hlZkrzZp/7PNEblZfSxp8yA8gHMbw2eDpLARDnt9kyXFhcD
	 4XBBq5TNbn9i88et5pfx9TUVyH3r/+2MY2SnC7cdlC8LybhiTu7qNFvY6trcm0uOj0
	 zRKVCrbWbdrm0/NNNeW1O77cmZLoL2JRxwZGXQqjbTgiaLx9nnd9hSPf5uO3MfEgFm
	 1HxONBftVXDEtCzQlh1cMfEngfFEsD5N9Dp7Jc1Gr/e7fziq3RAozfBc0Xc58pY/iY
	 D0fligFOGpmnw==
Received: from [100.112.5.167] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-c.us-east-1.aws.symcld.net id BE/D9-04232-7A1CB2F5; Thu, 06 Aug 2020 08:39:03 +0000
Authentication-Results: mx.messagelabs.com; dkim=none (message not 
  signed); dmarc=fail (p=none adkim=r aspf=r) header.from=harman.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRWlGSWpSXmKPExsVyqPAOq+7yg9r
  xBrPmc1ks+vKM1YHRY+apR8wBjFGsmXlJ+RUJrBnnPk9nKzjMXXH58yr2BsZPnF2MXBxCAgsY
  JWZ9m8MG4axnlHj96TxTFyMnB5uAkcSqve9YQWwRAQOJc+fmM3cxcnAwA9m/G2RAwsICvhLHn
  zSDlbAIqEism/0YrJVXwF5i4u3HzCC2hICOxPvNH1gh4oISJ2c+YQGxmQU0JVq3/2aHsOUlmr
  fOBqsXElCXmPrpPeMERt5ZSFpmIWmZhaRlASPzKkazpKLM9IyS3MTMHF1DAwNdQ0MjXRNdQ1N
  jvcQq3WS90mLd1MTiEl1DvcTyYr3iytzknBS9vNSSTYzAkEspYJm5g7HtzQe9Q4ySHExKorxf
  12vHC/El5adUZiQWZ8QXleakFh9ilOHgUJLgPbAfKCdYlJqeWpGWmQMMf5i0BAePkghvNUiat
  7ggMbc4Mx0idYpRUUqcV/AAUEIAJJFRmgfXBou5S4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJ
  WEeUNAxvNk5pXATX8FtJgJaPHPJZogi0sSEVJSDUzCHbEd/afbJO9LJtj7+7POXDdpb7+hzba
  zLAtqXjMYbUiOP9G7fZqWovbSuYnWd/aGZ28w8ooQXd6/YqeI/cFlwr5n5WeUxzvGW59jaavj
  zMjwO9Iwf4269edve/Teykr6F19RU5KxrXpfGDLd+eWKhRwGU2IV5Fv9owVece2btOTY1j+8n
  eq1TWUca4I3yoXvaDC3XDr/+EGuwsZ7heHys/b+WmQTasEgpal+26/03YSf4mZeDREx2cJpVj
  HLiv4+P3n1//o7un+5zRlUJ72/VqKRfEvT9FQvezXLnWl6Sz5zCfds8xFQYtrYem/3lPU/2m8
  e2Wn8zyw/8fpM2SmR32bsCOhTvf6DNcLLUImlOCPRUIu5qDgRADcXGhE0AwAA
X-Env-Sender: Nicolas.Lavocat@harman.com
X-Msg-Ref: server-23.tower-402.messagelabs.com!1596703104!384702!20
X-Originating-IP: [194.113.220.5]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11737 invoked from network); 6 Aug 2020 08:39:03 -0000
Received: from unknown (HELO HIMDWSMB10.ad.harman.com) (194.113.220.5)
  by server-23.tower-402.messagelabs.com with ECDHE-RSA-AES256-SHA384 encrypted SMTP; 6 Aug 2020 08:39:03 -0000
Received: from HIRPUX-MAIL (10.68.121.117) by HIMDWSMB10.ad.harman.com
 (10.70.51.30) with Microsoft SMTP Server id 15.0.1497.2; Thu, 6 Aug 2020
 10:39:01 +0200
Received: from w-fr-nicolasl.redbend.com (w-fr-nicolasl.redbend.com [10.68.122.91])
	by HIRPUX-MAIL (Postfix) with ESMTP id C0A1BC0281;
	Thu,  6 Aug 2020 11:37:07 +0200 (CEST)
From: "Lavocat, Nicolas" <Nicolas.Lavocat@harman.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Nicolas Lavocat <nicolas.lavocat@harman.com>
Subject: [meta-virtualization][PATCH] libvirt: fix install error without qemu
Date: Thu, 6 Aug 2020 10:38:59 +0200
Message-ID: <20200806083859.23530-1-nicolas.lavocat@harman.com>
X-Mailer: git-send-email 2.18.0.129.ge333175
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

An error occurs during the install step of libvirt when the variable
PACKAGECONFIG does not contain qemu.

Indeed, in this case, the operation "chown -R qemu:qemu
${D}/${localstatedir}/lib/libvirt/qemu" fails, since the folder
${D}/${localstatedir}/lib/libvirt/qemu has not been created.

The fix consist in doing this operation only if
the variable =E2=80=9CPACKAGECONFIG=E2=80=9D contains =E2=80=9Cqemu=E2=80=9D.
remark: issue present since the Warrior release of yocto.

Upstream-Status: Pending

Signed-off-by: Nicolas Lavocat <nicolas.lavocat@harman.com>
---
 recipes-extended/libvirt/libvirt_6.1.0.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt_6.1.0.bb b/recipes-extended/libvirt/libvirt_6.1.0.bb
index 9aa78b7..f301a0e 100644
--- a/recipes-extended/libvirt/libvirt_6.1.0.bb
+++ b/recipes-extended/libvirt/libvirt_6.1.0.bb
@@ -340,10 +340,12 @@ do_install_append() {
 			break
 			;;
 		*)
-			chown -R qemu:qemu ${D}/${localstatedir}/lib/libvirt/qemu
-			echo "d qemu qemu 0755 ${localstatedir}/cache/libvirt/qemu none" \
-			    >> ${D}${sysconfdir}/default/volatiles/99_libvirt
-			break
+			if ${@bb.utils.contains('PACKAGECONFIG', 'qemu', 'true', 'false', d)}; then
+				chown -R qemu:qemu ${D}/${localstatedir}/lib/libvirt/qemu
+				echo "d qemu qemu 0755 ${localstatedir}/cache/libvirt/qemu none" \
+				    >> ${D}${sysconfdir}/default/volatiles/99_libvirt
+				break
+			fi
 			;;
 	esac
 
-- 
2.18.0.129.ge333175

