Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.116])
 by mx.groups.io with SMTP id smtpd.web11.693.1626829892220580370
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 20 Jul 2021 18:11:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pPArLSYN;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.116, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1626829890; i=@fujitsu.com;
	bh=d6W/Ewo13683cW/Jptq1ydbRqk5VJub1tf6g+nYV81U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=pPArLSYNwFopwLkoeDD5AQqLTKAcbIFEBpkOkbwZUD8Tur1CADtD+vIC0oglpwOoB
	 GQFvqnr44bIH1G0p/YSp0zwEU9hH/GYuOAd5zcGJRsNgNMC0+Ly7Np4IOIUaH1EEDE
	 AYHO/58wyLXKmWxaKGN+kV4eLmpCqNyk80b7Yr8KIZKuT7yROi0j+Yn/gT7Y70E8Gn
	 Wux1x7HzSaS6/XP1fiLNC9nIXwkm+qjoNsAy7nwhIrngNJecKnRb8ii+eofMc1XcSA
	 hK4iGBy6V4QeApDNt5SD6HAFflnQWPNEFmCD6RJUeo6SRZScOTFgAVeoULSoRf9q4F
	 IxwlGHkOVXrMg==
Received: from [100.113.6.207] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-central-1.aws.symcld.net id 5C/49-07230-14477F06; Wed, 21 Jul 2021 01:11:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MRqutY8j3
  BYMNnVotFX56xOjB6zDz1iDmAMYo1My8pvyKBNePeJtmCP2wVj5tesTQwzmLrYuTiEBLYziTx
  59UlJgjnJKNE48RG5i5GTg42ATWJ6bdusILYIgIGEufOzQeLMwuoSLz43cMOYgsLJEo8OPUJz
  GYRUJV413yOCcTmFXCUmPxzPguILSGgIDHl4XtmiLigxMmZT1gg5khIHHzxghmiRlFi9uVmoD
  gHkF0pceNx6gRG3llIOmYh6VjAyLSK0TKpKDM9oyQ3MTNH19DAQNfQ0FjXVNfQ1FgvsUo3SS+
  1VDc5Na+kKBEoq5dYXqxXXJmbnJOil5dasokRGF4phawzdzB+ev1B7xCjJAeTkijvWbZvCUJ8
  SfkplRmJxRnxRaU5qcWHGGU4OJQkeFOKvicICRalpqdWpGXmAEMdJi3BwaMkwvswDyjNW1yQm
  FucmQ6ROsWoKCXOOwWkTwAkkVGaB9cGi69LjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5Vx
  cDTeHJzCuBm/4KaDET0OJd076CLC5JREhJNTCd2Fm1tlRP7kKGcCXvv5z+/rv/pilLfL68ZXJ
  r3segH2JhLAeefvE8nB+wRefJXAMxe74lzD3GPC4/BEpOHfnqsvHDt7aZW5tmnQq2a1qe8LI0
  WaM3tafQpF/sVZZyQG3wjc6MgM0BeiFrj33QeG/7Wb2MS9fq4ok4HgOpg39WNf289PtLRYzPb
  MXNkhrlasab4y+9XO0XVzbBU21e2da2iM9Tov0FhUwFmASCIt+fWxSaqsX5apN947Ol9+/av9
  lqWsnQ45F0w9NN3TH602YVuU2fvk8JPbFh9kvtV45czWv5LZI//LboPuXwr0NofcqDah6nrbM
  L7zHp3tw+/+yNJ/MZUs54FRaV9rvPzlBiKc5INNRiLipOBADbLy+zKgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-245.messagelabs.com!1626829888!83128!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17847 invoked from network); 21 Jul 2021 01:11:29 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-13.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Jul 2021 01:11:29 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16L1BLql017370
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 21 Jul 2021 02:11:28 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Wed, 21 Jul 2021 02:11:19 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [meta-virtualization] [PATCH] open-iscsi-user: use update-alternatives for libcap-ng.so
Date: Wed, 21 Jul 2021 09:11:08 +0800
Message-ID: <1626829868-1763-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

libcap-ng also uses the doc 'libcap-ng.so'.

libcap-ng has a priority of 100.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
index 139ce1db..a05004a1 100644
--- a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
+++ b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
@@ -29,6 +29,11 @@ do_compile () {
         oe_runmake user
 }
 
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "60"
+ALTERNATIVE_${PN}-dev = "libcap-ng.so"
+ALTERNATIVE_LINK_NAME[libcap-ng.so] = "${libdir}/libcap-ng.so"
 
 do_install () {
         oe_runmake DESTDIR="${D}" install_user
-- 
2.25.1

