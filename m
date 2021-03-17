Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.89])
 by mx.groups.io with SMTP id smtpd.web11.2746.1615959685463486233
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 16 Mar 2021 22:41:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=b3cb/s31;
 spf=pass (domain: windriver.com, ip: 40.107.70.89, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jeXYhlcRKEXprxgvjTDQzPPz9cQciPsrr9Gdkm9OPvJF3Ro9FJkeECOr0B4EO9aBKRAkmKka0Ls1aJK9cXO7uVUGVhiptnLbi9Nm9d1fsIZ1hzO7rIhS65Kvxga1xqNnjS2DUbYaRb20K89jnqGnGLa0NkgGM7Rs9GndG6x2ZYo+U2Pe5DLs7G0ZgerupeEkb+Cq9xvXu4Mv8bIZHOGiKi/qHHW6uZb0g+M1+xFskHW7l2T4K5ram/C6ejqgXRT4bZrAAxs6FjOlIGHMYeBruDkkHCP8j14RQNeW3dknCn/U5Od/GqojbekVkl42+clFUE0aPqulshSOyyF9BPwgAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uz+09Vuvb6FpqaKM0b2aaXsNo84sjtydVTpW6yML/E0=;
 b=UVQw2DVbmtwhgCIUW0g8aXmPlqmtVaa3Eu7tFCC5KDU66GVL4LR/+RH84Q6tUiAUv0g67HjBED9WHW/MD6bYO8GA0A58qfGC3jmpYlAWFje3faxmfNumrYSByewdoulBINcLT1cA4O3U+hjmkR6DcbWnd50eB4qcf2JHDMuOq+q5XvT2QnIbGXZF76Ommq9qfieLQGtM7Hqu5LonW2h5RdiyT68lPXC10+Mt8+RahfcjE6dSLFXkW/pn4d2RRzwO/dnx1dVNA/bDb2XhaOt3p2A5rpZqjThsMD/pxgNd2yHPKDfdL9ELPFxFhG+bOMO+keImyfNgWCaMNZAMda4cqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uz+09Vuvb6FpqaKM0b2aaXsNo84sjtydVTpW6yML/E0=;
 b=b3cb/s31zCALstbrTinyiDtj6Mr5dyTJZdqliQR70b/dmB3W8tGlcyJTK5sK1zx4l+UrRd4lCoFjAqH6E49+WAvtekjjy3UhlKzomfG/PBBfForHqkgWMczCffGMujR7J4EnRsQN5BZwhIzLEAIMFVZVbjW/o1GPW1OvWy9PXQ8=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by SJ0PR11MB4942.namprd11.prod.outlook.com (2603:10b6:a03:2ac::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 05:41:23 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::d9b:3f7c:136d:e60]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::d9b:3f7c:136d:e60%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 05:41:23 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] runc-docker: adjust patch to fit latest version
Date: Wed, 17 Mar 2021 13:41:05 +0800
Message-Id: <20210317054105.28887-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0120.apcprd03.prod.outlook.com
 (2603:1096:203:b0::36) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK0PR03CA0120.apcprd03.prod.outlook.com (2603:1096:203:b0::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 05:41:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32ea0764-4165-450c-e5af-08d8e9074c9d
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4942:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4942501F72A010980DD3B66CED6A9@SJ0PR11MB4942.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LMxPPFDtUWHL9+bYj/ErzZ+GiXPyhjJh7O0ihVhboNt8Gl3+S0SGgAePoSqTgu4LQ1yOi62P+z+npDHE96Ug4t3mbcrA5JdRokmkVwbj0rP1FWBGf3SMYyplFmVUsibMoqi4Z8das++fz+nYVBQ/vTw1UU77g8nrd4ol3gtWCrrPXQ7WL5I/Dit3m9qx95ZKGHvDGWjLyYKQ+RMZjjOfS9fB5tN3suXLr9SlZkfT1bCujBuPjK4HNpxloCfPB5cfMHKZqEtHa2o5Ri6zbStOVeVzio2C8qph8GWOgQju8UzpngYkZ/WUcK4a9eRVZ16aCVJvo2UmhUqcY+Q7f8vb9nz/IUoJlz9x4IAfxVQHE4qpVnGT+SkpMKMssCreNXtxk3aXnxxWUqEU22hHUoyhXLwfytsclp6p/A6V6C7AKUroiBWG7Cm2zm+fs2wfoqNf6t1S2UlcUt5sGmbTOJd3wODBDS7pMDYv97O1xkQC5g6GKCXI1YD9YIKIeDLZ7VyimQELtgMWRj/Q+Uy4mQAbPBWVH63ypfVBcsmsq5PEk98zIo5JljmUzvgD7+owol7m
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(366004)(39850400004)(6916009)(6486002)(956004)(1076003)(86362001)(186003)(16526019)(2616005)(36756003)(478600001)(6666004)(6512007)(316002)(5660300002)(66556008)(6506007)(66946007)(66476007)(8676002)(8936002)(52116002)(83380400001)(26005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?pd5xBuxSqNIOXBGzN+xvhA96aMTLdkl/tprEg8mQndLngGFZtaYZU7vVphBY?=
 =?us-ascii?Q?rFeug76EntMaq6TnqrzfrxK0KEgtlMV46zQoiQlNUfM0rSsE3HaikMYlelni?=
 =?us-ascii?Q?DouGDixgZ6Og9JlA6lHy6/IgzG0Dg6hnIjsLM1C8kaWpWIyT0XOKuyTY2aPv?=
 =?us-ascii?Q?3tQZFNJLYEPPBUdPmJGMehJmqkUrsA1Ez8LGoJTIoQ00qG+p80/oRBczx2mp?=
 =?us-ascii?Q?t7uaUSzmVjD6AOYMbi6/twAmQ2U0PUKquHK275dDSvcFsDI4pqaKg+a/4jbo?=
 =?us-ascii?Q?HkZeXX4Vb4g8qAvGzk09OdrawdAFR8GIK8MqMJ7k3EaBTebkJvg0ZxMpXior?=
 =?us-ascii?Q?fDVbdiDAWjHkTMiMux5DSI60vbZuZPBMIebegLiZzHDWcIzX/GxaY+VzQlMQ?=
 =?us-ascii?Q?w25gOTPdGfyRtETC6PGYrhQk/D5KafxZthAeNike792UJM0ljt4ks07xJXoh?=
 =?us-ascii?Q?RFqOg1I1Nwtdh9kL4cMh7wHSgLsA3/6dCdITzA0Fj44jlJVtElaXULMD1drr?=
 =?us-ascii?Q?F36o0XHQvU0/eoQlxu3G5wyB1b3MRfSHc/boXCqfeckTbLmc+SULV+8dSfKa?=
 =?us-ascii?Q?stZLWSc7ZMyStEJXSihznoAwfln8SfxGfemc5RGZOLzTFVwVxPDPMPrXSAgi?=
 =?us-ascii?Q?mbplZ3V0tyu9xssA1zOL/E1no6DGF8Rj/0VXOF1CpDTjnSKKubQ7oXtm4uiC?=
 =?us-ascii?Q?HjThIUEXqabixqev7D7p1SJrvsT3O4uTiE0Lu+zcNRAQgH5hPaoj+5yTrM8+?=
 =?us-ascii?Q?YqYItp6nud4qF4d3SBrQPJ48K7ujfG19pQ/KkM8MEJl5ohCGGowjFTSEleBH?=
 =?us-ascii?Q?fVp7t5BWM1TinwfgCiHCdXyMoloPxY9N2/VK+wHs2S3kw4DxcNO+HzH7vDxe?=
 =?us-ascii?Q?ziGNq6AK0Ep+bRcutX+hIXrlFR/tu5AVR19A2grJ2mGLkjh/4ld0JVv/lArX?=
 =?us-ascii?Q?plHS+gBfGx+ZTfDH4+7/gjDzr+om2L4LYng3oeNEJrb7w9rQxGcQJeJGzDD8?=
 =?us-ascii?Q?RpgZOLz06kZlIMOomjg71a2XmnoKMITw4SASlI8Ao94X/69nbBZv7PlDRNgP?=
 =?us-ascii?Q?qlSUrOm5A/GPyUWC1F4OdetqFvwKybP6HTsLufrUWtHRVdudzjdXb2BvMWca?=
 =?us-ascii?Q?S2Kp9yXno5jSwfktk6CRiQRiGef/dGksM7cSCPZiYwvKCgImcGZlnRxOrqsF?=
 =?us-ascii?Q?8EFlIsO0cnnr069MCvu3GYjp2ZZtXuB1x1WqPVltYjotYaXRQgctKvNyhVBi?=
 =?us-ascii?Q?+LPnZF/5XASJsqRbS7qjWwlh9Fr09gGJLgjRgeSz+s3JQYlbGw3DGQVlmN40?=
 =?us-ascii?Q?PjNPuz6HxfF7wcd/Ega661xT?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32ea0764-4165-450c-e5af-08d8e9074c9d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 05:41:23.6182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z0NacmkgqLYHExRLxw1guTvG19TnNoGo/w4qBB+e0yzOMGPoqgQgA+Giq7OO8/49r+/Hd0LCnC/jSnogMAd+Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4942
Content-Type: text/plain

Adjust patch to fit the latest version.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...docker-Makefile-respect-GOBUILDFLAGS.patch | 37 +++++++++++++++++++
 recipes-containers/runc/runc-docker_git.bb    |  2 +-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 recipes-containers/runc/runc-docker/0001-runc-docker-Makefile-respect-GOBUILDFLAGS.patch

diff --git a/recipes-containers/runc/runc-docker/0001-runc-docker-Makefile-respect-GOBUILDFLAGS.patch b/recipes-containers/runc/runc-docker/0001-runc-docker-Makefile-respect-GOBUILDFLAGS.patch
new file mode 100644
index 00000000..7ea9109a
--- /dev/null
+++ b/recipes-containers/runc/runc-docker/0001-runc-docker-Makefile-respect-GOBUILDFLAGS.patch
@@ -0,0 +1,37 @@
+From c8ac2963cf17d4ee45b8b6ccbdfd81fe52e7092a Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 16 Mar 2021 22:27:45 -0700
+Subject: [PATCH] Makefile: respect GOBUILDFLAGS for runc and remove recvtty
+ from static
+
+Upstream-Status: Inappropriate [OE Specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ Makefile | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/import/Makefile b/src/import/Makefile
+index e13d8f1d..409b61dd 100644
+--- a/src/import/Makefile
++++ b/src/import/Makefile
+@@ -23,7 +23,7 @@ ifeq ($(shell $(GO) env GOOS),linux)
+ 		GO_BUILDMODE := "-buildmode=pie"
+ 	endif
+ endif
+-GO_BUILD := $(GO) build -trimpath $(MOD_VENDOR) $(GO_BUILDMODE) $(EXTRA_FLAGS) -tags "$(BUILDTAGS)" \
++GO_BUILD := $(GO) build $(GOBUILDFLAGS) -trimpath $(MOD_VENDOR) $(GO_BUILDMODE) $(EXTRA_FLAGS) -tags "$(BUILDTAGS)" \
+ 	-ldflags "-X main.gitCommit=$(COMMIT) -X main.version=$(VERSION) $(EXTRA_LDFLAGS)"
+ GO_BUILD_STATIC := CGO_ENABLED=1 $(GO) build -trimpath $(MOD_VENDOR) $(EXTRA_FLAGS) -tags "$(BUILDTAGS) netgo osusergo" \
+ 	-ldflags "-w -extldflags -static -X main.gitCommit=$(COMMIT) -X main.version=$(VERSION) $(EXTRA_LDFLAGS)"
+@@ -40,7 +40,6 @@ recvtty:
+ 
+ static:
+ 	$(GO_BUILD_STATIC) -o runc .
+-	$(GO_BUILD_STATIC) -o contrib/cmd/recvtty/recvtty ./contrib/cmd/recvtty
+ 
+ release:
+ 	script/release.sh -r release/$(VERSION) -v $(VERSION)
+-- 
+2.30.2
+
diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
index 118bfc1d..9e7043ad 100644
--- a/recipes-containers/runc/runc-docker_git.bb
+++ b/recipes-containers/runc/runc-docker_git.bb
@@ -5,7 +5,7 @@ include runc.inc
 SRCREV_runc-docker = "b4cb54c2ea78b90f9d8284316aeaeff876f61dfc"
 SRC_URI = "git://github.com/opencontainers/runc;nobranch=1;name=runc-docker \
            file://0001-runc-Add-console-socket-dev-null.patch \
-           file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
+           file://0001-runc-docker-Makefile-respect-GOBUILDFLAGS.patch \
            file://0001-runc-docker-SIGUSR1-daemonize.patch \
           "
 
-- 
2.17.1

