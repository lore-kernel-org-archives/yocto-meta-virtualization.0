Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.80])
 by mx.groups.io with SMTP id smtpd.web10.8082.1602752473226744104
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 15 Oct 2020 02:01:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=N0ToB9xM;
 spf=pass (domain: windriver.com, ip: 40.107.223.80, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yzx6lpmY0oyhXdgEshEC5xdmyEXO2+rm1RGDOcTL1xENxgG2Dw7Qn1ntSbY7L2OsAgyDwszfEhRst1NpjwUM8m6TpJw+MWDGUJA2HrWPrwL4shIAhfPGSIWhSER5zCKgxbuEiFV7NhSFpfBfoUcQ1nyCO09bNPgRYNVv44fkI6VV8WLTjpeMGrOjdBPfX3nM00tFXMT2EkKPVERpc8yTJ8PU1vlLwEHHIIRl+kIlBHJZHROxzPemKPpz0CkIS950VEtZZvfUOU2dgfsfMpX+sWnSBVEuEo79UN2Ok658eTmzzBdek5yscdYZaBcvqtuaZf2h68SugGYSPTI2T9LYGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k++K9CQxtn+e6lhzFjiPQAdwV9fKyf0+KWe/bpIgeKg=;
 b=CqEcjAv5jxrb64FX4us2ypHaH/NXoOVLouevPnZBh2dB/ZeIZr/+H2F+z5+h2L6jRDQ7c4AHnLx4le973sNOeJg0TdBW2qI96y+SxptVkW8b4VE+HSNBk3P3PuWg7WtZ5X9FCmXIR2HFukO9RKeNJpy9/cZbCu3hZu77zcoCJRONzt33gWKQ36mbGAFJq3giy6jCwW15U62HCNAnXgzUP1O0AYZd4PfQqWq74rTn0h9AATnUgr9PiODxOVnE5MxrMuV5bDH/O6Ku8GDWrWcDHeiCRpQwuTQffLR2ICWfGsZQ9xCGlwbTWMVouT6QksVLh302BQIguy+NELi28OI6uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k++K9CQxtn+e6lhzFjiPQAdwV9fKyf0+KWe/bpIgeKg=;
 b=N0ToB9xMETuLq/II/w1808VkJjTHoa+pA4v4hjLBfx69ZuYavG4utX6AYRBwhF0KKDNiCzRXvdo09ubX1LNFjfcjsy+jh750aSELrKvxViRoSyisRpbVbXisD/S2HYDkWjfdM7hDvSxrpTrcVCMGqfLAnQ3TwMIzIDCL6kCZNn4=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2909.namprd11.prod.outlook.com (2603:10b6:805:d5::13)
 by SA2PR11MB4876.namprd11.prod.outlook.com (2603:10b6:806:119::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Thu, 15 Oct
 2020 09:01:10 +0000
Received: from SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::8036:479:efe2:744d]) by SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::8036:479:efe2:744d%5]) with mapi id 15.20.3455.030; Thu, 15 Oct 2020
 09:01:10 +0000
From: "Robert Yang" <liezhi.yang@windriver.com>
To: meta-virtualization@lists.yoctoproject.org,
	bruce.ashfield@gmail.com
Subject: [meta-virtualization][PATCH] kubernetes: Fix race issue for installing go2make
Date: Thu, 15 Oct 2020 02:01:04 -0700
Message-Id: <20201015090104.26472-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: BYAPR08CA0016.namprd08.prod.outlook.com
 (2603:10b6:a03:100::29) To SN6PR11MB2909.namprd11.prod.outlook.com
 (2603:10b6:805:d5::13)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by BYAPR08CA0016.namprd08.prod.outlook.com (2603:10b6:a03:100::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22 via Frontend Transport; Thu, 15 Oct 2020 09:01:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfb96bdd-4870-47fa-ffd0-08d870e8dc81
X-MS-TrafficTypeDiagnostic: SA2PR11MB4876:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB4876395A5006D3FD2E4B9ED2FF020@SA2PR11MB4876.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	H5sTmU7okdMOfOub0VMohBKjqZ0WYy3pgI2IkktYgHs0UMKS6aDiSgDGWBLUJFrQafbNdqCFLniUKn5aBRCcq7BObXLRGfqMi+ZCM0b/kX1KrSTXqV6Bua+6rc1SgLj9rZKQQrkmZsdxbNR6yh/kXYi9dtZfWRlaTyTkPMnBBIVCfANEWiSEuXNh0em9AQPRn+G7cZcZKPrwzn/evg0j0TniGq2aNE4uVQ3Qx8unts0Qn9n3imI8QehaN6TIiWCz/X5yO5mruFCQXCddK/osM7wjzLTpJYJY2dSjCawgwh1Mdc/c8ZCILtdAgqCNGMelcpTqGXrxzQZ/STNqhUeTQztMYgtk7IF2dEpMFJHeArDB1FeKpD2ai2JN4rUJX52V
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39850400004)(366004)(346002)(396003)(6506007)(36756003)(6486002)(2906002)(52116002)(5660300002)(1076003)(2616005)(956004)(86362001)(83380400001)(478600001)(316002)(66556008)(26005)(186003)(6512007)(6666004)(8936002)(8676002)(66946007)(34490700002)(66476007)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	4kpY8pIGL1CwksamZvJNXWBbiVyABe5ZD9wcuILL8kKTyApEl2k9X1S5ireu3CDzupO7l+FVY2M3+Vb7/2wFiGofn24HSxD3WP0I7BOHEU2oxyATvdp1uNH4HpEjdsyf6ibMAIsqnmGYnDqN/Q6z9cz25lfyQDNFCp3BNm+fKaTnWQku0s6gnq3SEu7zSArltkhJ6yL/2wE2uSzYJ8o7sGM6oRYP7xhXsl3TmdxobKTocqtpGYRhowifADXe7Khi4XXnN/c0BS9vmvQVjPXSR2nCtspDIhqfRmKOFj2E7xjOYexmbLfQaeMPAi4nvsNhYxJoJJVe7PbB4KnOUaA+FBBw4ezHpWiVf12vG6Nxmv0VQGVPB0pgDbV21zKU2hW2yJxd8mduP7AyF1+zhc4ps526rGa7jbgf3d0Qg/JV5tjkWTkp9ENKCtV58Rhws1cN35WpEone2ap+5PdrW73OslW9TUmcE98By9op+IhTryKOJb1WMmMrcjX915c9qrqYeOG45ftpLZwYMmaAY5cfBxe88nda9DqfWQRDoEHfSK4pBilPYK9INeehSMGm9kWAq+k/H87HhZdpj9jXCopYlQ1Z3AIUPu4a5pJFt9aXevUMTkusJmM7znXL5YVzMQXOVY+HeDWa67u/vDdcidSo3g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb96bdd-4870-47fa-ffd0-08d870e8dc81
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2020 09:01:10.8665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UKKRfYdIeoOVoKQMFnYe0Qt+qymgUFeV8oFI2QSqL6Za/FoqaT34W++8oY+F4pkcbVUUabVe/GrPmxr5yIxDcn8ZxYyb5u4t+MdtwSIT0S4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4876
Content-Type: text/plain

The src/import/build/root/Makefile.generated_files are called several times
during the build, so the following target which installs go2make will also run
several times:

$(META_DIR)/$(GO_PKGDEPS_FILE): FORCE

It runs automatically when the Makefile is called because of:
sinclude $(META_DIR)/$(GO_PKGDEPS_FILE)

So there is a race issue of go2make when parallel build:
hack/run-in-gopath.sh: line 34: build/tmp-glibc/work/corei7-64-wrs-linux/kubernetes/1.18.8-r0/git/src/import/_output/local/go/bin/go2make: No suc h file or directory

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...ed_files-Fix-race-issue-for-installi.patch | 48 +++++++++++++++++++
 .../kubernetes/kubernetes_git.bb              |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 recipes-containers/kubernetes/kubernetes/0001-Makefile.generated_files-Fix-race-issue-for-installi.patch

diff --git a/recipes-containers/kubernetes/kubernetes/0001-Makefile.generated_files-Fix-race-issue-for-installi.patch b/recipes-containers/kubernetes/kubernetes/0001-Makefile.generated_files-Fix-race-issue-for-installi.patch
new file mode 100644
index 0000000..97273e4
--- /dev/null
+++ b/recipes-containers/kubernetes/kubernetes/0001-Makefile.generated_files-Fix-race-issue-for-installi.patch
@@ -0,0 +1,48 @@
+From 441df8a24a2c80e320f140b5d9bc352c7ce8a64a Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 15 Oct 2020 07:27:35 +0000
+Subject: [PATCH] src/import/build/root/Makefile.generated_files: Fix race issue for installing
+ go2make
+
+The src/import/build/root/Makefile.generated_files are called several times during the build, so the
+following target which installs go2make will also run several times:
+
+$(META_DIR)/$(GO_PKGDEPS_FILE): FORCE
+
+It runs automatically when the Makefile is called because of:
+sinclude $(META_DIR)/$(GO_PKGDEPS_FILE)
+
+So there is a race issue of go2make when parallel build:
+hack/run-in-gopath.sh: line 34: build/tmp-glibc/work/corei7-64-wrs-linux/kubernetes/1.18.8-r0/git/src/import/_output/local/go/bin/go2make: No such file or directory
+
+It is because the first process is using go2make, but then the second process
+removes it and reinstall it.
+
+Check whether go2make has been installed or not before install it can fix the
+problem.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ src/import/build/root/Makefile.generated_files | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/import/build/root/Makefile.generated_files b/src/import/build/root/Makefile.generated_files
+index c8cbf27..e3f1593 100644
+--- a/src/import/build/root/Makefile.generated_files
++++ b/src/import/build/root/Makefile.generated_files
+@@ -63,7 +63,9 @@ $(META_DIR)/$(GO_PKGDEPS_FILE): FORCE
+ 	if [[ "$(DBG_CODEGEN)" == 1 ]]; then          \
+ 	    echo "DBG: calculating Go dependencies";  \
+ 	fi
+-	hack/run-in-gopath.sh go install ./hack/make-rules/helpers/go2make
++	if [ ! -e _output/local/go/bin/go2make ]; then \
++		hack/run-in-gopath.sh go install ./hack/make-rules/helpers/go2make; \
++	fi
+ 	hack/run-in-gopath.sh go2make                     \
+ 	    k8s.io/kubernetes/...                         \
+ 	    --prune  k8s.io/kubernetes/staging            \
+-- 
+2.26.2
+
diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index 76c8202..1053d97 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/kubernetes/kubernetes.git;branch=release-1.19;name=k
            file://0001-cross-don-t-build-tests-by-default.patch \
            file://0001-generate-bindata-unset-GOBIN.patch \
            file://0001-build-golang.sh-convert-remaining-go-calls-to-use.patch \
+           file://0001-Makefile.generated_files-Fix-race-issue-for-installi.patch \
           "
 
 DEPENDS += "rsync-native \
-- 
2.17.1

