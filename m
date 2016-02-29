Return-Path: <bogdan.purcareata@nxp.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5BAA3E00D41; Mon, 29 Feb 2016 09:00:58 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [65.55.169.99 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 5564 seconds by postgrey-1.32 at yocto-www;
	Mon, 29 Feb 2016 09:00:49 PST
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0099.outbound.protection.outlook.com [65.55.169.99])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C12E3E00CE1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 29 Feb 2016 09:00:49 -0800 (PST)
Received: from CH1PR03CA011.namprd03.prod.outlook.com (10.255.156.156) by
	BLUPR03MB312.namprd03.prod.outlook.com (10.141.48.28) with Microsoft
	SMTP Server (TLS) id 15.1.415.20; Mon, 29 Feb 2016 15:28:03 +0000
Received: from BL2FFO11OLC005.protection.gbl (10.255.156.132) by
	CH1PR03CA011.outlook.office365.com (10.255.156.156) with Microsoft SMTP
	Server (TLS) id 15.1.415.20 via Frontend Transport;
	Mon, 29 Feb 2016 15:28:03 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; yoctoproject.org; dkim=none (message not signed)
	header.d=none; yoctoproject.org;
	dmarc=none action=none header.from=nxp.com; 
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11OLC005.mail.protection.outlook.com (10.173.160.91) with
	Microsoft
	SMTP Server (TLS) id 15.1.422.5 via Frontend Transport; Mon, 29 Feb 2016
	15:28:02 +0000
Received: from localhost.localdomain (fsr-ub1464-106.ea.freescale.net
	[10.171.74.6])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u1TFS0Eu022648 for <meta-virtualization@yoctoproject.org>;
	Mon, 29 Feb 2016 08:28:01 -0700
From: Bogdan Purcareata <bogdan.purcareata@nxp.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 29 Feb 2016 15:27:59 +0000
Message-ID: <1456759679-385-1-git-send-email-bogdan.purcareata@nxp.com>
X-Mailer: git-send-email 2.1.4
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131012332831743725;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11OLC005;
	1:FREJHDzWhKRXZMJPo+gtoXlOhLIweVNdFsYBTZW1NZm88rvHSSKFC931aLnPg31+70Ibz85qziuPyr1ZfSW0drWJRmQCHPjsix20lnLjXUhq52CG9rSPnu4/vzjiuT7KsMhtwXpQyOZSmZDgp8GNj5l99WvGN34h6mGc4gpYQ4UTn1OdMs6XFYXethV/A+oJabNyeuQ3kksD5ttTySo8e0ZUNiN1/IXqS5d7sUGvVqEcyoBsg1tPDhYsUYQp4aKyfLOovtrc7kk0xQ+SBSqHcM/kOfrnqm1Tc56VeuZxZh7ymw/7nH+wyhBdu1orKoKDHVU1dcYE6JFWLOQdwJtUYUUAJ6TiKH/aRFEPxKfyuDn4lKAj+8SHQilqGaPAD0xF2dbZo6BFCYXYPjfv2Qbb0vtEDOUX4BOJOnnH+olgJH+FHmQ4exT9lEFXYx3hicPx
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(1110001)(339900001)(189002)(199003)(85426001)(50466002)(5008740100001)(11100500001)(5003940100001)(6806005)(450100001)(33646002)(104016004)(92566002)(189998001)(107886002)(5001960100002)(110136002)(15395725005)(87936001)(49486002)(36756003)(47776003)(50986999)(86362001)(2351001)(575784001)(229853001)(48376002)(105606002)(106466001)(1096002)(1220700001)(15975445007)(77096005)(19580395003)(19580405001)(586003)(50226001)(2906002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR03MB312;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 87592f06-3f20-4de1-9eed-08d3411cea18
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB312;
	2:UYOyzxJk4wNK7XKGQM7/l6meWAmvwVDU7obcsv4YwDd/WcxSJqMxzOgqS9YEZE1z5qZv9f4mQeeD4sXpSimci2HGnCslpEseojxJZVTRpcgYmkSvzLl/X0bM2mqpHjZsq5xOv/FkIgKSYahmR1rOgLO2xlHjjzHklhk752R/f0whTouOX0bLFpTgQ+t47LTv;
	3:hhkBebaSFTNBgVf0y16RuSKUUvEC+bbB1kd29WM5pKLcyakdH/EyK7fGWSYgki4wuQYnJp5ZaNt5R970FS1bC6wYpzCh+Ke16U0qYonswk/fmF5lc0IaVZYC14m9DeQwcDfNiAZZTIQLe7aD7skAI8hM34mQ7yVK2SdEzAF+tU8Fkwol9fe1exmfnP7wNj2Hgymt0qPUBpu0Ff1m1oYN1OZf8BdyNVWH4Fh2H9GkUO0=;
	25:YVK6Dyik6sU8wHq8vgT2JOkN8SERe2ftZ8MlQ5SCNU0qQGU4bHlpn5sWidxaaPew5TrqImH42/dKSbRmX96w1ro03zF4HQ9dTz3YjY+HoNCfM/0rNE2/OH+WOXdZhWGzOKVsfcGUkFFv665ektVz6N6nb3PSUlekl31nWNLh+HvgEwIkusx+QuMxaq0xaUQfiM42pBs5Zx4QxCFuUwDP1WgyY4bUV+kc29YgjdrFl3q5nQnQx7J7bJ7OyfGrKVvZojU5CB51O62p2cvt/+fzU95kw3P/OFHRseQ3yvPK2oMMUo4G0JsYajgxH16kzKaNilTZxCKUTVliuI1iVuXt2g==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR03MB312;
X-Microsoft-Antispam-PRVS: <BLUPR03MB312F8F705B29A60C892B48CEABA0@BLUPR03MB312.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13024025)(13018025)(8121501046)(13015025)(13017025)(5005006)(13023025)(10201501046)(3002001);
	SRVR:BLUPR03MB312; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BLUPR03MB312; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB312;
	4:CROQ6Hf9L0mgMBrPE+DE/x0+HvGz/9NcuZctb05eiA7Q+XlcZrufLLteWAjbJTswZaeeagKtNvdSCx0GHQiuxWBZEbOJn/ZDozDYUnM4OzrDL9d4taq5KrTwXw3PA8bc9IhL8PlpcmGkMZYMcUTlYdUWaoYUW6bzwy10FhsgE2wJYrwLPMH06/6QJTtnBsDegczHtxIgxTwkildDdT8KIw8hk+AQPrYlXIJ7PrtnVvc/VnfF+TbD/AkFfy8Ez2QlZBWGF8at/tebrim5iXtY/kaToyU6wIswnwIsLRPDmLyKriWodbQq9oX+bDaeshsyKObeGIMyEDDDA9Blkgn4D8QHVNNFRbaFtEfZvX+1c9GuOe3RqD7vTsWhqPtHHsQ8QprQyDHwaeq/BiSgq0c+txlUFOkfLXCGwmWmguTMy9YQeaNtD9b6dyVrCnBbZxrVHqZFBcoXrODFuh/IIophGYJC9VUMCP26q8HaT9xL8HhSCu5wH30rIVQP+EsSL92J
X-Forefront-PRVS: 0867F4F1AA
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR03MB312;
	23:BCbwGcC0rVscanTmod0uTKQBWcUI+bBeEDykmVcEsp?=
	=?us-ascii?Q?t6rjnSUAwSulJYsNoyP57CFQug9aU0dC3rTSaddC4u0sYNuUP00ygLPSwZYu?=
	=?us-ascii?Q?ctCz6TOaVg5IcUh58s3HpPmq1aQK2ZvG5MiDIWSp7CuTRDV1cpaRjh0bGng+?=
	=?us-ascii?Q?cZBAx9yPP8z0QUmXFbDwWc0CYIYLh0cNSY53OEqSbHDZhICA+tRpIww3Slok?=
	=?us-ascii?Q?0TvkcoyWdgC6vj/HAo/MgEGHHh/STw1wUjAjZeOwYXvjjLRdA0wnWnjBt5Wu?=
	=?us-ascii?Q?5jEIx9nEn/5clZbJc3qco9W+VZMtOnLCGPfgit2CxgzzUnbj2MNiHkWhjJIH?=
	=?us-ascii?Q?bXoPr84eGPL0GC1jtOqdegeXRKULonAkFqIqYMRWoQRgnTFEpmBYVNotsm7l?=
	=?us-ascii?Q?8InwC6eGVGyN/+W7ve4dp1igkvHqB8hgZsVxeZvtpQSlJwtDinInRKlJ/fza?=
	=?us-ascii?Q?0xYKYV5n+tvRhABm/EriIh1SJL8z2f5M4UvVO4LieQPlqQcv815N5f0pg1jR?=
	=?us-ascii?Q?6/PnQqA3Yix1+6vsdR30y5ihh5KlNRVX/igYJHad8GWnSaQ7lpUfpTdeq2sE?=
	=?us-ascii?Q?d1NNculCn2yGBx6ekBh6pECeyhly5fbJZ1smy53VFeSihi8WWJLOvMHSH6jw?=
	=?us-ascii?Q?++Mqmtc28DoIOiYw0nk4wN2OyDcxkIEQBXQhDhz56pKLhk+IpljnR8teQO6Q?=
	=?us-ascii?Q?owLpSexP5Z2t3A7g9uo/1oX/dBh7B0fe+yTGPAyvRZKOS5/Jaltz1t7PRXO1?=
	=?us-ascii?Q?CjhlX2OhB/qPRCufkp8zyZ7LM3ElWTMNGjqYS31DXS2Q4uTwhznIAsuQm0gk?=
	=?us-ascii?Q?78cp6HzpIb+Uhi3E4MC+LLn3mBBpsMvxie7IpSjjKOjKVTpWlWLrUo78dpr8?=
	=?us-ascii?Q?fh3k48+1ZY5SoDA2S0ew6NdwxrdsnYM/CouS1LU5MI075HLNwn+BEC5hz/Cv?=
	=?us-ascii?Q?O5MAot3Up0zupdW+luy1niNH3QxyrcPc/lxGoo9J5Z6WUK5NU1DDjPnCWpqq?=
	=?us-ascii?Q?jaWXH5Ov48HwrvOXuABwdMmoXlaJsU4OkoRkRRkNC15saMPg4gr6kahM7YCN?=
	=?us-ascii?Q?mg6of/d/WazF59QmDvM4HtmTvI8yhPVggGnhbsM5Kj0oa+pOVhDZcIsgn6j+?=
	=?us-ascii?Q?OAbR2bWzU=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB312;
	5:+7AvV53nCCu065TshM39ZmtIteo7vdYfc4N2recXaL+wsaG0VlAqZB36OyPWgnzp/bRRsIEkBD7yD/bBai+jJtXfPBhco17BpjVb6tZUg1yhw/bgH2BgeZCvuYX6euA66kyLvUukYPw0Uh319pITStNPfAPVcsmujQTEFVzAIQA=;
	24:cyDduXsvMbbyq8OoOr0Yil/UqxWd0H0JTkuRemgzDnITnmZWCwAd2qs3gXcTJqVFDE+3Wxcgheued/QLlsOUjpXGScwzpOI2lPy7K73Ju74=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2016 15:28:02.6439 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR03MB312
Subject: [PATCH] lxc: upstream fixes for lxc-execute
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Feb 2016 17:00:58 -0000
Content-Type: text/plain

These patches address some warnings that LXC throws when running
an application container. They are currently applied in the official
repository.

Signed-off-by: Bogdan Purcareata <bogdan.purcareata@nxp.com>
---
 ...s-Create-dev-shm-folder-if-it-doesn-t-exi.patch | 39 ++++++++++++
 ...if_needed-only-safe-mount-when-rootfs-is-.patch | 69 ++++++++++++++++++++++
 ...t_symlink-Account-when-prefix-is-empty-st.patch | 37 ++++++++++++
 recipes-containers/lxc/lxc_1.1.4.bb                |  3 +
 4 files changed, 148 insertions(+)
 create mode 100644 recipes-containers/lxc/files/lxc_setup_fs-Create-dev-shm-folder-if-it-doesn-t-exi.patch
 create mode 100644 recipes-containers/lxc/files/mount_proc_if_needed-only-safe-mount-when-rootfs-is-.patch
 create mode 100644 recipes-containers/lxc/files/open_without_symlink-Account-when-prefix-is-empty-st.patch

diff --git a/recipes-containers/lxc/files/lxc_setup_fs-Create-dev-shm-folder-if-it-doesn-t-exi.patch b/recipes-containers/lxc/files/lxc_setup_fs-Create-dev-shm-folder-if-it-doesn-t-exi.patch
new file mode 100644
index 0000000..751a7ac
--- /dev/null
+++ b/recipes-containers/lxc/files/lxc_setup_fs-Create-dev-shm-folder-if-it-doesn-t-exi.patch
@@ -0,0 +1,39 @@
+From 81e3c9cf8b2f230d761738da28e9dc69fb90ec46 Mon Sep 17 00:00:00 2001
+From: Bogdan Purcareata <bogdan.purcareata@nxp.com>
+Date: Fri, 8 Jan 2016 15:38:44 +0000
+Subject: [PATCH] lxc_setup_fs: Create /dev/shm folder if it doesn't exist
+
+When running application containers with lxc-execute, /dev is
+populated only with device entries. Since /dev is a tmpfs mount in
+the container environment, the /dev/shm folder not being present is not
+a sufficient reason for the /dev/shm mount to fail.
+
+Create the /dev/shm directory if not present.
+
+Upstream-status: Accepted
+[https://github.com/lxc/lxc/commit/81e3c9cf8b2f230d761738da28e9dc69fb90ec46]
+
+Signed-off-by: Bogdan Purcareata <bogdan.purcareata@nxp.com>
+Acked-by: Serge E. Hallyn <serge.hallyn@ubuntu.com>
+---
+ src/lxc/initutils.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/lxc/initutils.c b/src/lxc/initutils.c
+index 45df60f..8d9016c 100644
+--- a/src/lxc/initutils.c
++++ b/src/lxc/initutils.c
+@@ -47,6 +47,10 @@ extern void lxc_setup_fs(void)
+ 	if (mount_fs("proc", "/proc", "proc"))
+ 		INFO("failed to remount proc");
+ 
++	/* if /dev has been populated by us, /dev/shm does not exist */
++	if (access("/dev/shm", F_OK) && mkdir("/dev/shm", 0777))
++		INFO("failed to create /dev/shm");
++
+ 	/* if we can't mount /dev/shm, continue anyway */
+ 	if (mount_fs("shmfs", "/dev/shm", "tmpfs"))
+ 		INFO("failed to mount /dev/shm");
+-- 
+1.9.1
+
diff --git a/recipes-containers/lxc/files/mount_proc_if_needed-only-safe-mount-when-rootfs-is-.patch b/recipes-containers/lxc/files/mount_proc_if_needed-only-safe-mount-when-rootfs-is-.patch
new file mode 100644
index 0000000..c3afd85
--- /dev/null
+++ b/recipes-containers/lxc/files/mount_proc_if_needed-only-safe-mount-when-rootfs-is-.patch
@@ -0,0 +1,69 @@
+From f267d6668e3a95cb2247accb169cf1bc7f8ffcab Mon Sep 17 00:00:00 2001
+From: Bogdan Purcareata <bogdan.purcareata@nxp.com>
+Date: Wed, 20 Jan 2016 10:53:57 +0000
+Subject: [PATCH] mount_proc_if_needed: only safe mount when rootfs is defined
+
+The safe_mount function was introduced in order to address CVE-2015-1335,
+one of the vulnerabilities being a mount with a symlink for the
+destination path. In scenarios such as lxc-execute with no rootfs, the
+destination path is the host /proc, which is previously mounted by the
+host, and is unmounted and mounted again in a new set of namespaces,
+therefore eliminating the need to check for it being a symlink.
+
+Mount the rootfs normally if the rootfs is NULL, keep the safe mount
+only for scenarios where a different rootfs is defined.
+
+Upstream-status: Accepted
+[https://github.com/lxc/lxc/commit/f267d6668e3a95cb2247accb169cf1bc7f8ffcab]
+
+Signed-off-by: Bogdan Purcareata <bogdan.purcareata@nxp.com>
+Acked-by: Serge E. Hallyn <serge.hallyn@ubuntu.com>
+---
+ src/lxc/conf.c  |  1 +
+ src/lxc/utils.c | 10 +++++++++-
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/src/lxc/conf.c b/src/lxc/conf.c
+index 632dde3..1e30c0c 100644
+--- a/src/lxc/conf.c
++++ b/src/lxc/conf.c
+@@ -3509,6 +3509,7 @@ int ttys_shift_ids(struct lxc_conf *c)
+ 	return 0;
+ }
+ 
++/* NOTE: not to be called from inside the container namespace! */
+ int tmp_proc_mount(struct lxc_conf *lxc_conf)
+ {
+ 	int mounted;
+diff --git a/src/lxc/utils.c b/src/lxc/utils.c
+index 4e96a50..0bc7a20 100644
+--- a/src/lxc/utils.c
++++ b/src/lxc/utils.c
+@@ -1704,6 +1704,8 @@ int safe_mount(const char *src, const char *dest, const char *fstype,
+  *
+  * Returns < 0 on failure, 0 if the correct proc was already mounted
+  * and 1 if a new proc was mounted.
++ *
++ * NOTE: not to be called from inside the container namespace!
+  */
+ int mount_proc_if_needed(const char *rootfs)
+ {
+@@ -1737,8 +1739,14 @@ int mount_proc_if_needed(const char *rootfs)
+ 	return 0;
+ 
+ domount:
+-	if (safe_mount("proc", path, "proc", 0, NULL, rootfs) < 0)
++	if (!strcmp(rootfs,"")) /* rootfs is NULL */
++		ret = mount("proc", path, "proc", 0, NULL);
++	else
++		ret = safe_mount("proc", path, "proc", 0, NULL, rootfs);
++
++	if (ret < 0)
+ 		return -1;
++
+ 	INFO("Mounted /proc in container for security transition");
+ 	return 1;
+ }
+-- 
+1.9.1
+
diff --git a/recipes-containers/lxc/files/open_without_symlink-Account-when-prefix-is-empty-st.patch b/recipes-containers/lxc/files/open_without_symlink-Account-when-prefix-is-empty-st.patch
new file mode 100644
index 0000000..28f9889
--- /dev/null
+++ b/recipes-containers/lxc/files/open_without_symlink-Account-when-prefix-is-empty-st.patch
@@ -0,0 +1,37 @@
+From 01074e5b34719537cef474c6b81d4f55e6427639 Mon Sep 17 00:00:00 2001
+From: Bogdan Purcareata <bogdan.purcareata@nxp.com>
+Date: Fri, 8 Jan 2016 15:38:35 +0000
+Subject: [PATCH] open_without_symlink: Account when prefix is empty string
+
+In the current implementation, the open_without_symlink function
+will default to opening the root mount only if the passed rootfs
+prefix is null. It doesn't account for the case where this prefix
+is passed as an empty string.
+
+Properly handle this second case as well.
+
+Upstream-Status: Accepted
+[https://github.com/lxc/lxc/commit/01074e5b34719537cef474c6b81d4f55e6427639]
+
+Signed-off-by: Bogdan Purcareata <bogdan.purcareata@nxp.com>
+Acked-by: Serge E. Hallyn <serge.hallyn@ubuntu.com>
+---
+ src/lxc/utils.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/lxc/utils.c b/src/lxc/utils.c
+index ed8c4c4..4e96a50 100644
+--- a/src/lxc/utils.c
++++ b/src/lxc/utils.c
+@@ -1575,7 +1575,7 @@ static int open_without_symlink(const char *target, const char *prefix_skip)
+ 	fulllen = strlen(target);
+ 
+ 	/* make sure prefix-skip makes sense */
+-	if (prefix_skip) {
++	if (prefix_skip && strlen(prefix_skip) > 0) {
+ 		curlen = strlen(prefix_skip);
+ 		if (!is_subdir(target, prefix_skip, curlen)) {
+ 			ERROR("WHOA there - target '%s' didn't start with prefix '%s'",
+-- 
+1.9.1
+
diff --git a/recipes-containers/lxc/lxc_1.1.4.bb b/recipes-containers/lxc/lxc_1.1.4.bb
index 4006deb..e017dcf 100644
--- a/recipes-containers/lxc/lxc_1.1.4.bb
+++ b/recipes-containers/lxc/lxc_1.1.4.bb
@@ -34,6 +34,9 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://make-some-OpenSSH-tools-optional.patch \
 	file://lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch \
 	file://logs-optionally-use-base-filenames-to-report-src-fil.patch \
+	file://open_without_symlink-Account-when-prefix-is-empty-st.patch \
+	file://lxc_setup_fs-Create-dev-shm-folder-if-it-doesn-t-exi.patch \
+	file://mount_proc_if_needed-only-safe-mount-when-rootfs-is-.patch \
 	"
 
 SRC_URI[md5sum] = "d33c4bd9c57755c0e2b0e2acbc3f171d"
-- 
1.9.1


