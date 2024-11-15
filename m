Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC5F1D65C7E
	for <webhook@archiver.kernel.org>; Fri, 15 Nov 2024 14:12:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.21786.1731679968908842363
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 15 Nov 2024 06:12:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=104972aa64=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AFCTZn2010685
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 15 Nov 2024 14:12:48 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42uwtud4xh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 15 Nov 2024 14:12:47 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jpg/vsBen7uTyelpfvvM7uM6Dy6y0oI21bisXQi6zOg+6RI1wdlhMlw9zkCfC9c2hLWncjOfCn7ZQNiPvK0D4TOF/WJy2IW/Ty/5eOuI1lFc4f5K5RYpG3BL99AQdpklG0Kqar0b5UPKX4izGD9S6V2motMlSAdaiXYblQBe0JIQMkMIkntFWpWgEGTCMtG+U31nOZHftKheHGfaYUjq9iAXvBwv3Ha1QY+Au52eG23NZnvME8Z8Jj/ashy7/Dkio8GfVCEojYjBojGS9w49uORqdkx/eCZOf5wSmNjZ+1/HY5H3QrpkWgxg+PmY7+EuQng7J+ggPNlmOv6pcSTlvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcusjYKvzjgebntxyJt5Rp0dPZMKL30eybZ0EqJAEGg=;
 b=G+AOGxsJe9hJmcRWOHg9kuou+TOVAabKxNzMQJJ8/HHMv+hGS43Pg2ewREPefDliLbHrC7zOc+1sAyeB1jnfotF7DLz5CWAL6UKvkgcoo/HCVxFQXWjCU5y74uvK6b7HROGaE6NMSst8VbFFZb2s0J9VMYUTCL52N7ZMcuE/tdV/nrqVohMxZTFYgXOZapF8wo1BbTPPuxgyghV9/qwO65lgMoXcp6PwnOnTVOMhGAjLaSQpLBop/RjS35aRclcrDEGT3d1R0B93q3Ehz7jifn8c+c1RGQrPChVxZ1jBJDwnPPjvJ9S/eliQeGYZw9Xmu5thG5qbrWvCJb+vEqYSVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by DM6PR11MB4753.namprd11.prod.outlook.com (2603:10b6:5:2ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20; Fri, 15 Nov
 2024 14:12:45 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%4]) with mapi id 15.20.8137.027; Fri, 15 Nov 2024
 14:12:43 +0000
From: peng.zhang1.cn@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] cri-o: enable ptest
Date: Fri, 15 Nov 2024 22:12:31 +0800
Message-Id: <20241115141231.1778125-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.35.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:194::8) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|DM6PR11MB4753:EE_
X-MS-Office365-Filtering-Correlation-Id: 68447c9a-a4f5-4a23-a90b-08dd057f92ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VarBMnBGB4XN1N92rRPXfbrw1lkOK0BKSxIyUHzCAzIoH9dHffXCa2S2l2P/?=
 =?us-ascii?Q?7KsZloF3LlBuLSPlytmYJacb/NCzqHrDw299Ycg+m8Fmkg9G5k8W1nS8KF5a?=
 =?us-ascii?Q?a9eqJNn98UnILXUXAvMfqIvhcNAGifQbJrWP9MMUfViswvQhrA5sTyu4Fg/8?=
 =?us-ascii?Q?EplFq1kTLIBHzMUr5KxzQWgOKQFrwkUV9t5Umfi3DwLBecMdHai98Ba9/vfa?=
 =?us-ascii?Q?g5PaHyJVFLpX3GOxe8y4YPtcH0CCgjukCFaFaxaAADs4uJ+8t5xrNhV4Tqpb?=
 =?us-ascii?Q?G7McntLBXLXUzD+pH4Crd9DYnBX8Zj6alvlQOVExuLDar1XdxPlx933Q1lo8?=
 =?us-ascii?Q?XgOuBG1NS+hJxwLl4plm9ARFPFPgil+R+8MeubG6dcNTwCLjXdXMcNl0VnYO?=
 =?us-ascii?Q?Yu/qv+z8KVf8CoZ5z7pT1OZa0b2Zn89HH+VUu8io3AZwKIB1ZGu+K/hM+KXr?=
 =?us-ascii?Q?DDYJt3TuhPAA3vPKGZb0Z5oU5RLw4XHcNcqVyOHfbcs6PR+ckNHoi7TvAUxW?=
 =?us-ascii?Q?cuKk4wvCrNEOFe79FI/KBRri5qRCDojTFlzedUDVQDB0ZzQgZZrt4UylnfHn?=
 =?us-ascii?Q?FKXVdG/TL8NK65AbIEtzJ6tOCRA6ByupqeGugzkbCs9+XfSxA1VV4RMSqMgQ?=
 =?us-ascii?Q?A1jO9Lq0z36nBeD41wB2fXTNxpK/svA33h/NynARYeCBhwbIDy1r58+QWUaV?=
 =?us-ascii?Q?OxPpfQWvwf8nUby8fwO2sQ1/cjmKvOT/mUt1o9AaevOtisu1kjY8hwDnoPGt?=
 =?us-ascii?Q?kfyrzJiNNi2ItXH6e/wUBVMRC6uqPSSAwhsn3lO5aypPREcEUzPj4NaVYpwc?=
 =?us-ascii?Q?hIf0Am9nsh4xMTkh5M2+Un9ycEvHYC/MY+xI3K3ERIf/4GF4te2K+0Hmxm+U?=
 =?us-ascii?Q?uCivftArWr5utkaYxGtFA5nMWvyas5IJWG8aYjVN+du+gLRIb8zD4eZ+SX02?=
 =?us-ascii?Q?DkXit3imw9BZw/qhB4ovjnLrQd81P50ut1jNZwQFAsXkEb062UO1cN+96Ent?=
 =?us-ascii?Q?2882IxrzSYGadHI7eO5ZVDQukM4moyCVa6lo2V8z+chDzydPSZaNxdjgmVEp?=
 =?us-ascii?Q?OBRsCq582N+iH/SJb7KCzO5UEid4bl16FenFwIg2gsqVg9BIztEKnHxMoFh5?=
 =?us-ascii?Q?i/hszI73s4vc5Bnr6buCe/skPX2hsuX8VFi7oD05hcpuki5bQCGikl90BmnK?=
 =?us-ascii?Q?vv7pv96VW2f8UWTJS5kjLMKiUy5nNjZ76xeCj7nHdbrlarc/mlBHsBBegxi8?=
 =?us-ascii?Q?FaBXcYVUqZDw2iSeWtntBGLqFbgf8EDUqZGZge4VZDBdGywSYGeFEyaWK86s?=
 =?us-ascii?Q?6Floylk97BuOWiQTgdnBobeK?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5SqiHlug8CaHkYYtwKrPm6W3M7wtOXoyrTLHvNUkmLZKqHJM1exKd//NoTsP?=
 =?us-ascii?Q?ggOJZYqHT7Iw59wXGR9b7CZttmqY+JDOkIo7cAGkTjutHUk5xSrN9ySK2qum?=
 =?us-ascii?Q?ekymrGgffd0v07yEmbHIatuU1fYiMkBhpHvi2DAqEJ0l8Y5LJY6qX5y8pQAq?=
 =?us-ascii?Q?3jqfmXtU0ZKNRKbbNbvtjiXZKlKL44fDPVW0K5RTg1iyes5r1+UXvpJJISIl?=
 =?us-ascii?Q?qtXhw0gfc6wN+DX48CqUmH0/a+6CCjJ0ehn8dKV90OnZgTrg1+qCWQOK4Gq/?=
 =?us-ascii?Q?DlV+C2KqRNADZukZ6QKFiRDTcGs8m3kdbh7EQpNUOpnl1qs/PxM7wi76UTPc?=
 =?us-ascii?Q?BVoAqT23X5IzayxIJ5y2G6s8eNvP7BUVaqB4QUx+4rTFYboN6UMOwBAHSJkv?=
 =?us-ascii?Q?QNz86BJr5sgr71J5WtKU+RCFvO+HuHQSG+iBy39g92cHPkU2QW/pVsnEpe4I?=
 =?us-ascii?Q?iDMiAc51H5tl/wjNK61zGa8WGPkOw2ctS0rtnPANdUpd3tB6FmH9Ge+r/4UV?=
 =?us-ascii?Q?UAR5oPr0Hu7ufMEqGNJVuhgTMr5oFZ0W+pa3vTzcyGW3QUepAMWoN3N3QnyV?=
 =?us-ascii?Q?hLh23hMsnNHt3IVAmpT2SaIvGxGLaqcyyz73zDLmLCQMqdvzoWP8RyLiv6s2?=
 =?us-ascii?Q?+/1RHLdldODzATo0ugyqWjsQEEwAPuE14dMiJIUR07d/hZpU4MGzwJks7mVx?=
 =?us-ascii?Q?7Wm6WR/M1D9nDsUM7U0buqRYh3MtRdJfgYexJqcyRFrrnGMKJDBjmUcRXhRb?=
 =?us-ascii?Q?igo33VhJTh0O7IQK+rSJNMVMVu8ZVbxprfx9j/Xyp+u/PAnQMcKJAywT3Xu+?=
 =?us-ascii?Q?DdvlsOxTDErCPx+AhVSsBlDjL2XiGm7VapjF0yl0SmywJ0BV77o9QsgcNMK0?=
 =?us-ascii?Q?MfOmr+VFjodyi5lloRoYq5mYDj9GMETNKhTJNGuSMeQ57qLy9LMk5hO4uO9u?=
 =?us-ascii?Q?yHRbGS73TD30SI7E9oAb4Lu1Flln8TeHx872gQ+TujDW8TMXnCaPZy2CKTbA?=
 =?us-ascii?Q?OnWMnFqxk6+2A2ATmrifeGjZTAciVmTRh6vYa0V6fNykkgsYpMsEdsNmDo2K?=
 =?us-ascii?Q?zC0BcgJtgx9bFnCcWItdiim3CV75HI6IYtrZkQbTJsd6QIcQ/RvmWuJ0tbDu?=
 =?us-ascii?Q?5E8GF24ZSYGycwaBxPvSiWrUj8iFQtdH4tT1AFR2eMl8Skyszo/4kEcYk5KU?=
 =?us-ascii?Q?TCXFGjBC4t6dyTHgrMjBXaBivjPTCKlwaGXZ+kVqVx6cGcmS7L6295aVKozK?=
 =?us-ascii?Q?3lDKaec5MdNHQySpFzycQg6FnDN+8y5KhSDg/gQl2heCpoSTnGknkavWwmYZ?=
 =?us-ascii?Q?9q160XiIq2/Zi4glIhj55ujgr9jIwzdxqnKp6ZNYDjbR6hh62Ti4orOiu6zU?=
 =?us-ascii?Q?PDdMJMIObpOaA2JctHO80rhJvJy/E3lzfhoo4go9v1amB1Pbt1lq7/Iep6ut?=
 =?us-ascii?Q?z5I8ljsYhy2SOzo36hMBA5sqqeMQvYX3HrIscSeuMhNV1Gtusdn2nX0+SqX+?=
 =?us-ascii?Q?ek9tmlHGX16jeIAMQKhk8oyurfupKjKWi2IxT6eFq0VqCEEOAUwhNlXEtRHL?=
 =?us-ascii?Q?T0wBFj2+GaYt5+AFQicyZ1zZnjfrPBpvtKQ6tPg6RJNDEepSNngbP5sLMWqi?=
 =?us-ascii?Q?zA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68447c9a-a4f5-4a23-a90b-08dd057f92ac
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 14:12:43.8260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6jj6EI2N/xfp2PkCxLYBzWySxb3PFWSDrUbeIBatCsioUXPSQXNTfpolF+ocNXi7IjZwJh5mIQeUreI6prqX7vwHgjxmVjkH/txbBcO7WAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4753
X-Proofpoint-GUID: iKhhSZJVQ0Vz77N_eGLJehC7ZromOmaj
X-Authority-Analysis: v=2.4 cv=BPnhr0QG c=1 sm=1 tr=0 ts=673756e0 cx=c_pps a=hHPfuxNGWHHq0fQgDGst2w==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=f_bcOQHoh6RH22ex4_8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: iKhhSZJVQ0Vz77N_eGLJehC7ZromOmaj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_05,2024-11-14_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 clxscore=1011 mlxscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411150121
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 15 Nov 2024 14:12:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8971

From: Zhang Peng <peng.zhang1.cn@windriver.com>

The ptest build for cri-o was previously disabled due to issues
introduced with Go 1.11, which borken the build process. With the
current Go version, these issues no longer occur, and the ptest build is
now functional.
This commit enables ptest support and resolves the "TMPDIR
[buildpaths]" issue encountered during the ptest build process.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 recipes-containers/cri-o/cri-o_git.bb         | 37 ++++++++++++++++++-
 .../0001-Add-trimpath-to-build-nri.test.patch | 31 ++++++++++++++++
 recipes-containers/cri-o/files/run-ptest      | 11 ++++++
 3 files changed, 77 insertions(+), 2 deletions(-)
 create mode 100644 recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.patch
 create mode 100644 recipes-containers/cri-o/files/run-ptest

diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index efc86fbe..596a43e2 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -17,7 +17,9 @@ At a high level, we expect the scope of cri-o to be restricted to the following
 SRCREV_cri-o = "20c06a19cb395445620c31730c0f1a0a1922eaae"
 SRC_URI = "\
 	git://github.com/kubernetes-sigs/cri-o.git;branch=release-1.31;name=cri-o;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
+        file://0001-Add-trimpath-to-build-nri.test.patch \
         file://crio.conf \
+        file://run-ptest \
 	"
 
 # Apache-2.0 for docker
@@ -28,7 +30,7 @@ GO_IMPORT = "import"
 
 PV = "1.31.0+git${SRCREV_cri-o}"
 
-inherit features_check
+inherit features_check ptest
 REQUIRED_DISTRO_FEATURES ?= "seccomp"
 
 DEPENDS = " \
@@ -69,6 +71,13 @@ do_compile() {
 	oe_runmake binaries
 }
 
+do_compile_ptest() {
+    set +e
+
+    cd ${S}/src/import
+
+    oe_runmake test-binaries
+}
 SYSTEMD_PACKAGES = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
 SYSTEMD_SERVICE:${PN} = "${@bb.utils.contains('DISTRO_FEATURES','systemd','crio.service','',d)}"
 SYSTEMD_AUTO_ENABLE:${PN} = "enable"
@@ -100,6 +109,14 @@ do_install() {
     install -d ${D}${localstatedir}/lib/crio
 }
 
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/test
+    install -d ${D}${PTEST_PATH}/bin
+    install -d ${D}${PTEST_PATH}/vendor
+    cp -rf ${S}/src/import/test ${D}${PTEST_PATH}
+    cp -rf ${S}/src/import/bin ${D}${PTEST_PATH}
+    cp -rf ${S}/src/import/vendor ${D}${PTEST_PATH}
+}
 FILES:${PN}-config = "${sysconfdir}/crio/config/*"
 FILES:${PN} += "${systemd_unitdir}/system/*"
 FILES:${PN} += "/usr/local/bin/*"
@@ -109,7 +126,23 @@ FILES:${PN} += "/usr/share/containers/oci/hooks.d"
 ALLOW_EMPTY:${PN} = "1"
 
 INSANE_SKIP:${PN} += "ldflags already-stripped textrel"
+INSANE_SKIP:${PN}-ptest += "textrel"
 
-deltask compile_ptest_base
+RDEPENDS:${PN}-ptest += " \
+    bash \
+    bats \
+    cni \
+    crictl \
+    bind-utils \
+    coreutils \
+    dbus-daemon-proxy \
+    iproute2 \
+    util-linux-unshare \
+    jq \
+    ipcalc \
+    slirp4netns \
+    parallel \
+    podman \
+"
 
 COMPATIBLE_HOST = "^(?!(qemu)?mips).*"
diff --git a/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.patch b/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.patch
new file mode 100644
index 00000000..c6be41f0
--- /dev/null
+++ b/recipes-containers/cri-o/files/0001-Add-trimpath-to-build-nri.test.patch
@@ -0,0 +1,31 @@
+From 0bf230f59d211044e7993543e010b0d7f9dcead3 Mon Sep 17 00:00:00 2001
+From: Peng Zhang <peng.zhang1.cn@windriver.com>
+Date: Fri, 25 Oct 2024 10:42:02 +0800
+Subject: [PATCH] Add --trimpath to build nri.test
+
+when build test-binary, TMPDIR[buildpaths] error found in nri.test
+to fix this error, add "--trimpath" option to build nri.test.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Peng Zhang <peng.zhang1.cn@windriver.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae/src/import/Makefile
+===================================================================
+--- cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae.orig/src/import/Makefile
++++ cri-o-1.31.0+git20c06a19cb395445620c31730c0f1a0a1922eaae/src/import/Makefile
+@@ -169,7 +169,7 @@ test/checkcriu/checkcriu: $(GO_FILES)
+ 	$(GO_BUILD) $(GCFLAGS) $(GO_LDFLAGS) -tags "$(BUILDTAGS)" -o $@ ./test/checkcriu
+ 
+ test/nri/nri.test: $(wildcard test/nri/*.go)
+-	$(GO) test --tags "test $(BUILDTAGS)" -c ./test/nri -o $@
++	$(GO) test --tags "test $(BUILDTAGS)" -c ./test/nri -o $@ ${TRIMPATH}
+ 
+ bin/crio: $(GO_FILES)
+ 	$(GO_BUILD) $(GCFLAGS) $(GO_LDFLAGS) -tags "$(BUILDTAGS)" -o $@ ./cmd/crio
+-- 
+2.34.1
+
diff --git a/recipes-containers/cri-o/files/run-ptest b/recipes-containers/cri-o/files/run-ptest
new file mode 100644
index 00000000..62abe959
--- /dev/null
+++ b/recipes-containers/cri-o/files/run-ptest
@@ -0,0 +1,11 @@
+#!/bin/sh
+
+./test/test_runner.sh | while IFS= read -r line; do
+	if [[ $line =~ ^not\ ok ]]; then
+		echo "FAIL: ${line#not ok }"
+	elif [[ $line =~ ^ok && ! $line =~ \#\ skip ]]; then
+		echo "PASS: ${line#ok }"
+	elif [[ $line =~ ^ok.*#\ skip ]]; then
+		echo "SKIP: ${line#ok }"
+	fi
+done
-- 
2.35.5


