Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73956C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 04:16:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.30650.1699848989805283513
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 12 Nov 2023 20:16:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WRpFhfeK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9681c4334b=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AD4GTjv013669;
	Mon, 13 Nov 2023 04:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=o+TjR
	IUonupf6Yz77gedAhbN3WPRMT0rDInAn/6bZiA=; b=WRpFhfeKSb/xEGVuDVSos
	bpSs74xcdhH9AEqOAYJGTiruWIOn/IflIUnhojdeOdTfnLa3FfsdI/3O7WUKExQL
	HTqhvGB3M8796GxWNsGhDxXoVYiNsCXj00QP5RIfZVIuCov8huS11JX7UCZ4Glib
	2Al68p33u6gH0xbUA19m77irqiYAMBuvzpgCMV2aQ6G8UVTShQY7c3qap3XnGa2C
	3N8YzDFcC5pLMO8UXdxpf6L+9UliFtp1lVbeQfjW2UFyd3iDqSlwWEw6CJy4zxxF
	a9hDYykCYvgBq8yYiiS6OdNvTSEVB8ozD8qaFSG48nXe6q0aG51K7rIbkbvFKAua
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ua0k6998f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Nov 2023 04:16:28 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 12 Nov 2023 20:16:29 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][kirkstone][PATCH v2 1/2] kubernetes: Fix CVE-2023-2431
Date: Mon, 13 Nov 2023 04:16:09 +0000
Message-ID: <20231113041609.1888228-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: 7jtc3pbBDt5h-BWd3qbw72kDmlvKrn-b
X-Proofpoint-ORIG-GUID: 7jtc3pbBDt5h-BWd3qbw72kDmlvKrn-b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-12_24,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311060001
 definitions=main-2311130036
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Nov 2023 04:16:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8457

From: Soumya Sambu <soumya.sambu@windriver.com>

A security issue was discovered in Kubelet that allows pods to bypass the
seccomp profile enforcement. Pods that use localhost type for seccomp profile
but specify an empty profile field, are affected by this issue. In this
scenario, this vulnerability allows the pod to run in unconfined (seccomp
disabled) mode. This bug affects Kubelet.

CVE: CVE-2023-2431
Affected Versions
v1.27.0 - v1.27.1
v1.26.0 - v1.26.4
v1.25.0 - v1.25.9
<= v1.24.13

master branch(kubernetes v1.28.2) is not impacted
mickledore branch(kubernetes v1.27.5) is not impacted

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-2431

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../kubernetes/kubernetes/CVE-2023-2431.patch | 863 ++++++++++++++++++
 .../kubernetes/kubernetes_git.bb              |   1 +
 2 files changed, 864 insertions(+)
 create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2023-2431.patch

diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2023-2431.patch b/recipes-containers/kubernetes/kubernetes/CVE-2023-2431.patch
new file mode 100644
index 00000000..56c3a6e1
--- /dev/null
+++ b/recipes-containers/kubernetes/kubernetes/CVE-2023-2431.patch
@@ -0,0 +1,863 @@
+From 73174f870735251e7d4240cdc36983d1bef7db5f Mon Sep 17 00:00:00 2001
+From: Craig Ingram <cjingram@google.com>
+Date: Fri, 24 Feb 2023 15:24:49 -0500
+Subject: [PATCH] Return error for localhost seccomp type with no localhost
+ profile defined
+
+CVE: CVE-2023-2431
+
+Upstream-Status: Backport [https://github.com/kubernetes/kubernetes/commit/73174f870735251e7d4240cdc36983d1bef7db5f]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ pkg/kubelet/kuberuntime/helpers.go            |  66 ++--
+ pkg/kubelet/kuberuntime/helpers_test.go       | 350 ++++--------------
+ .../kuberuntime_container_linux.go            |  16 +-
+ .../kuberuntime_container_linux_test.go       |  22 +-
+ pkg/kubelet/kuberuntime/security_context.go   |  15 +-
+ 5 files changed, 153 insertions(+), 316 deletions(-)
+
+diff --git a/pkg/kubelet/kuberuntime/helpers.go b/pkg/kubelet/kuberuntime/helpers.go
+index fa580335cf8..b36e01166f8 100644
+--- a/pkg/kubelet/kuberuntime/helpers.go
++++ b/pkg/kubelet/kuberuntime/helpers.go
+@@ -209,28 +209,32 @@ func toKubeRuntimeStatus(status *runtimeapi.RuntimeStatus) *kubecontainer.Runtim
+	return &kubecontainer.RuntimeStatus{Conditions: conditions}
+ }
+
+-func fieldProfile(scmp *v1.SeccompProfile, profileRootPath string, fallbackToRuntimeDefault bool) string {
++func fieldProfile(scmp *v1.SeccompProfile, profileRootPath string, fallbackToRuntimeDefault bool) (string, error) {
+	if scmp == nil {
+		if fallbackToRuntimeDefault {
+-			return v1.SeccompProfileRuntimeDefault
++			return v1.SeccompProfileRuntimeDefault, nil
+		}
+-		return ""
++		return "", nil
+	}
+	if scmp.Type == v1.SeccompProfileTypeRuntimeDefault {
+-		return v1.SeccompProfileRuntimeDefault
+-	}
+-	if scmp.Type == v1.SeccompProfileTypeLocalhost && scmp.LocalhostProfile != nil && len(*scmp.LocalhostProfile) > 0 {
+-		fname := filepath.Join(profileRootPath, *scmp.LocalhostProfile)
+-		return v1.SeccompLocalhostProfileNamePrefix + fname
++		return v1.SeccompProfileRuntimeDefault, nil
++	}
++	if scmp.Type == v1.SeccompProfileTypeLocalhost {
++		if scmp.LocalhostProfile != nil && len(*scmp.LocalhostProfile) > 0 {
++			fname := filepath.Join(profileRootPath, *scmp.LocalhostProfile)
++			return v1.SeccompLocalhostProfileNamePrefix + fname, nil
++		} else {
++			return "", fmt.Errorf("localhostProfile must be set if seccompProfile type is Localhost.")
++		}
+	}
+	if scmp.Type == v1.SeccompProfileTypeUnconfined {
+-		return v1.SeccompProfileNameUnconfined
++		return v1.SeccompProfileNameUnconfined, nil
+	}
+
+	if fallbackToRuntimeDefault {
+-		return v1.SeccompProfileRuntimeDefault
++		return v1.SeccompProfileRuntimeDefault, nil
+	}
+-	return ""
++	return "", nil
+ }
+
+ func annotationProfile(profile, profileRootPath string) string {
+@@ -243,7 +247,7 @@ func annotationProfile(profile, profileRootPath string) string {
+ }
+
+ func (m *kubeGenericRuntimeManager) getSeccompProfilePath(annotations map[string]string, containerName string,
+-	podSecContext *v1.PodSecurityContext, containerSecContext *v1.SecurityContext, fallbackToRuntimeDefault bool) string {
++	podSecContext *v1.PodSecurityContext, containerSecContext *v1.SecurityContext, fallbackToRuntimeDefault bool) (string, error) {
+	// container fields are applied first
+	if containerSecContext != nil && containerSecContext.SeccompProfile != nil {
+		return fieldProfile(containerSecContext.SeccompProfile, m.seccompProfileRoot, fallbackToRuntimeDefault)
+@@ -252,7 +256,7 @@ func (m *kubeGenericRuntimeManager) getSeccompProfilePath(annotations map[string
+	// if container field does not exist, try container annotation (deprecated)
+	if containerName != "" {
+		if profile, ok := annotations[v1.SeccompContainerAnnotationKeyPrefix+containerName]; ok {
+-			return annotationProfile(profile, m.seccompProfileRoot)
++			return annotationProfile(profile, m.seccompProfileRoot), nil
+		}
+	}
+
+@@ -263,46 +267,50 @@ func (m *kubeGenericRuntimeManager) getSeccompProfilePath(annotations map[string
+
+	// as last resort, try to apply pod annotation (deprecated)
+	if profile, ok := annotations[v1.SeccompPodAnnotationKey]; ok {
+-		return annotationProfile(profile, m.seccompProfileRoot)
++		return annotationProfile(profile, m.seccompProfileRoot), nil
+	}
+
+	if fallbackToRuntimeDefault {
+-		return v1.SeccompProfileRuntimeDefault
++		return v1.SeccompProfileRuntimeDefault, nil
+	}
+
+-	return ""
++	return "", nil
+ }
+
+-func fieldSeccompProfile(scmp *v1.SeccompProfile, profileRootPath string, fallbackToRuntimeDefault bool) *runtimeapi.SecurityProfile {
++func fieldSeccompProfile(scmp *v1.SeccompProfile, profileRootPath string, fallbackToRuntimeDefault bool) (*runtimeapi.SecurityProfile, error) {
+	if scmp == nil {
+		if fallbackToRuntimeDefault {
+			return &runtimeapi.SecurityProfile{
+				ProfileType: runtimeapi.SecurityProfile_RuntimeDefault,
+-			}
++			}, nil
+		}
+		return &runtimeapi.SecurityProfile{
+			ProfileType: runtimeapi.SecurityProfile_Unconfined,
+-		}
++		}, nil
+	}
+	if scmp.Type == v1.SeccompProfileTypeRuntimeDefault {
+		return &runtimeapi.SecurityProfile{
+			ProfileType: runtimeapi.SecurityProfile_RuntimeDefault,
+-		}
++		}, nil
+	}
+-	if scmp.Type == v1.SeccompProfileTypeLocalhost && scmp.LocalhostProfile != nil && len(*scmp.LocalhostProfile) > 0 {
+-		fname := filepath.Join(profileRootPath, *scmp.LocalhostProfile)
+-		return &runtimeapi.SecurityProfile{
+-			ProfileType:  runtimeapi.SecurityProfile_Localhost,
+-			LocalhostRef: fname,
++	if scmp.Type == v1.SeccompProfileTypeLocalhost {
++		if scmp.LocalhostProfile != nil && len(*scmp.LocalhostProfile) > 0 {
++			fname := filepath.Join(profileRootPath, *scmp.LocalhostProfile)
++			return &runtimeapi.SecurityProfile{
++				ProfileType:  runtimeapi.SecurityProfile_Localhost,
++				LocalhostRef: fname,
++			}, nil
++		} else {
++			return nil, fmt.Errorf("localhostProfile must be set if seccompProfile type is Localhost.")
+		}
+	}
+	return &runtimeapi.SecurityProfile{
+		ProfileType: runtimeapi.SecurityProfile_Unconfined,
+-	}
++	}, nil
+ }
+
+ func (m *kubeGenericRuntimeManager) getSeccompProfile(annotations map[string]string, containerName string,
+-	podSecContext *v1.PodSecurityContext, containerSecContext *v1.SecurityContext, fallbackToRuntimeDefault bool) *runtimeapi.SecurityProfile {
++	podSecContext *v1.PodSecurityContext, containerSecContext *v1.SecurityContext, fallbackToRuntimeDefault bool) (*runtimeapi.SecurityProfile, error) {
+	// container fields are applied first
+	if containerSecContext != nil && containerSecContext.SeccompProfile != nil {
+		return fieldSeccompProfile(containerSecContext.SeccompProfile, m.seccompProfileRoot, fallbackToRuntimeDefault)
+@@ -316,12 +324,12 @@ func (m *kubeGenericRuntimeManager) getSeccompProfile(annotations map[string]str
+	if fallbackToRuntimeDefault {
+		return &runtimeapi.SecurityProfile{
+			ProfileType: runtimeapi.SecurityProfile_RuntimeDefault,
+-		}
++		}, nil
+	}
+
+	return &runtimeapi.SecurityProfile{
+		ProfileType: runtimeapi.SecurityProfile_Unconfined,
+-	}
++	}, nil
+ }
+
+ func ipcNamespaceForPod(pod *v1.Pod) runtimeapi.NamespaceMode {
+diff --git a/pkg/kubelet/kuberuntime/helpers_test.go b/pkg/kubelet/kuberuntime/helpers_test.go
+index 25065f30411..70ad7250ce2 100644
+--- a/pkg/kubelet/kuberuntime/helpers_test.go
++++ b/pkg/kubelet/kuberuntime/helpers_test.go
+@@ -242,17 +242,18 @@ func TestFieldProfile(t *testing.T) {
+		scmpProfile     *v1.SeccompProfile
+		rootPath        string
+		expectedProfile string
++		expectedError   string
+	}{
+		{
+			description:     "no seccompProfile should return empty",
+			expectedProfile: "",
+		},
+		{
+-			description: "type localhost without profile should return empty",
++			description: "type localhost without profile should return error",
+			scmpProfile: &v1.SeccompProfile{
+				Type: v1.SeccompProfileTypeLocalhost,
+			},
+-			expectedProfile: "",
++			expectedError: "localhostProfile must be set if seccompProfile type is Localhost.",
+		},
+		{
+			description: "unknown type should return empty",
+@@ -279,7 +280,7 @@ func TestFieldProfile(t *testing.T) {
+			description: "SeccompProfileTypeLocalhost should return localhost",
+			scmpProfile: &v1.SeccompProfile{
+				Type:             v1.SeccompProfileTypeLocalhost,
+-				LocalhostProfile: utilpointer.StringPtr("profile.json"),
++				LocalhostProfile: utilpointer.String("profile.json"),
+			},
+			rootPath:        "/test/",
+			expectedProfile: "localhost//test/profile.json",
+@@ -287,8 +288,13 @@ func TestFieldProfile(t *testing.T) {
+	}
+
+	for i, test := range tests {
+-		seccompProfile := fieldProfile(test.scmpProfile, test.rootPath, false)
+-		assert.Equal(t, test.expectedProfile, seccompProfile, "TestCase[%d]: %s", i, test.description)
++		seccompProfile, err := fieldProfile(test.scmpProfile, test.rootPath, false)
++		if test.expectedError != "" {
++			assert.EqualError(t, err, test.expectedError, "TestCase[%d]: %s", i, test.description)
++		} else {
++			assert.NoError(t, err, "TestCase[%d]: %s", i, test.description)
++			assert.Equal(t, test.expectedProfile, seccompProfile, "TestCase[%d]: %s", i, test.description)
++		}
+	}
+ }
+
+@@ -298,17 +304,18 @@ func TestFieldProfileDefaultSeccomp(t *testing.T) {
+		scmpProfile     *v1.SeccompProfile
+		rootPath        string
+		expectedProfile string
++		expectedError   string
+	}{
+		{
+			description:     "no seccompProfile should return runtime/default",
+			expectedProfile: v1.SeccompProfileRuntimeDefault,
+		},
+		{
+-			description: "type localhost without profile should return runtime/default",
++			description: "type localhost without profile should return error",
+			scmpProfile: &v1.SeccompProfile{
+				Type: v1.SeccompProfileTypeLocalhost,
+			},
+-			expectedProfile: v1.SeccompProfileRuntimeDefault,
++			expectedError: "localhostProfile must be set if seccompProfile type is Localhost.",
+		},
+		{
+			description: "unknown type should return runtime/default",
+@@ -335,7 +342,7 @@ func TestFieldProfileDefaultSeccomp(t *testing.T) {
+			description: "SeccompProfileTypeLocalhost should return localhost",
+			scmpProfile: &v1.SeccompProfile{
+				Type:             v1.SeccompProfileTypeLocalhost,
+-				LocalhostProfile: utilpointer.StringPtr("profile.json"),
++				LocalhostProfile: utilpointer.String("profile.json"),
+			},
+			rootPath:        "/test/",
+			expectedProfile: "localhost//test/profile.json",
+@@ -343,8 +350,13 @@ func TestFieldProfileDefaultSeccomp(t *testing.T) {
+	}
+
+	for i, test := range tests {
+-		seccompProfile := fieldProfile(test.scmpProfile, test.rootPath, true)
+-		assert.Equal(t, test.expectedProfile, seccompProfile, "TestCase[%d]: %s", i, test.description)
++		seccompProfile, err := fieldProfile(test.scmpProfile, test.rootPath, true)
++		if test.expectedError != "" {
++			assert.EqualError(t, err, test.expectedError, "TestCase[%d]: %s", i, test.description)
++		} else {
++			assert.NoError(t, err, "TestCase[%d]: %s", i, test.description)
++			assert.Equal(t, test.expectedProfile, seccompProfile, "TestCase[%d]: %s", i, test.description)
++		}
+	}
+ }
+
+@@ -359,6 +371,7 @@ func TestGetSeccompProfilePath(t *testing.T) {
+		containerSc     *v1.SecurityContext
+		containerName   string
+		expectedProfile string
++		expectedError   string
+	}{
+		{
+			description:     "no seccomp should return empty",
+@@ -369,91 +382,6 @@ func TestGetSeccompProfilePath(t *testing.T) {
+			containerName:   "container1",
+			expectedProfile: "",
+		},
+-		{
+-			description: "annotations: pod runtime/default seccomp profile should return runtime/default",
+-			annotation: map[string]string{
+-				v1.SeccompPodAnnotationKey: v1.SeccompProfileRuntimeDefault,
+-			},
+-			expectedProfile: "runtime/default",
+-		},
+-		{
+-			description: "annotations: pod docker/default seccomp profile should return docker/default",
+-			annotation: map[string]string{
+-				v1.SeccompPodAnnotationKey: v1.DeprecatedSeccompProfileDockerDefault,
+-			},
+-			expectedProfile: "docker/default",
+-		},
+-		{
+-			description: "annotations: pod runtime/default seccomp profile with containerName should return runtime/default",
+-			annotation: map[string]string{
+-				v1.SeccompPodAnnotationKey: v1.SeccompProfileRuntimeDefault,
+-			},
+-			containerName:   "container1",
+-			expectedProfile: "runtime/default",
+-		},
+-		{
+-			description: "annotations: pod docker/default seccomp profile with containerName should return docker/default",
+-			annotation: map[string]string{
+-				v1.SeccompPodAnnotationKey: v1.DeprecatedSeccompProfileDockerDefault,
+-			},
+-			containerName:   "container1",
+-			expectedProfile: "docker/default",
+-		},
+-		{
+-			description: "annotations: pod unconfined seccomp profile should return unconfined",
+-			annotation: map[string]string{
+-				v1.SeccompPodAnnotationKey: v1.SeccompProfileNameUnconfined,
+-			},
+-			expectedProfile: "unconfined",
+-		},
+-		{
+-			description: "annotations: pod unconfined seccomp profile with containerName should return unconfined",
+-			annotation: map[string]string{
+-				v1.SeccompPodAnnotationKey: v1.SeccompProfileNameUnconfined,
+-			},
+-			containerName:   "container1",
+-			expectedProfile: "unconfined",
+-		},
+-		{
+-			description: "annotations: pod localhost seccomp profile should return local profile path",
+-			annotation: map[string]string{
+-				v1.SeccompPodAnnotationKey: "localhost/chmod.json",
+-			},
+-			expectedProfile: seccompLocalhostPath("chmod.json"),
+-		},
+-		{
+-			description: "annotations: pod localhost seccomp profile with containerName should return local profile path",
+-			annotation: map[string]string{
+-				v1.SeccompPodAnnotationKey: "localhost/chmod.json",
+-			},
+-			containerName:   "container1",
+-			expectedProfile: seccompLocalhostPath("chmod.json"),
+-		},
+-		{
+-			description: "annotations: container localhost seccomp profile with containerName should return local profile path",
+-			annotation: map[string]string{
+-				v1.SeccompContainerAnnotationKeyPrefix + "container1": "localhost/chmod.json",
+-			},
+-			containerName:   "container1",
+-			expectedProfile: seccompLocalhostPath("chmod.json"),
+-		},
+-		{
+-			description: "annotations: container localhost seccomp profile should override pod profile",
+-			annotation: map[string]string{
+-				v1.SeccompPodAnnotationKey:                            v1.SeccompProfileNameUnconfined,
+-				v1.SeccompContainerAnnotationKeyPrefix + "container1": "localhost/chmod.json",
+-			},
+-			containerName:   "container1",
+-			expectedProfile: seccompLocalhostPath("chmod.json"),
+-		},
+-		{
+-			description: "annotations: container localhost seccomp profile with unmatched containerName should return empty",
+-			annotation: map[string]string{
+-				v1.SeccompContainerAnnotationKeyPrefix + "container1": "localhost/chmod.json",
+-			},
+-			containerName:   "container2",
+-			expectedProfile: "",
+-		},
+		{
+			description:     "pod seccomp profile set to unconfined returns unconfined",
+			podSc:           &v1.PodSecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeUnconfined}},
+@@ -480,14 +408,14 @@ func TestGetSeccompProfilePath(t *testing.T) {
+			expectedProfile: seccompLocalhostPath("filename"),
+		},
+		{
+-			description:     "pod seccomp profile set to SeccompProfileTypeLocalhost with empty LocalhostProfile returns empty",
+-			podSc:           &v1.PodSecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost}},
+-			expectedProfile: "",
++			description:   "pod seccomp profile set to SeccompProfileTypeLocalhost with empty LocalhostProfile returns error",
++			podSc:         &v1.PodSecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost}},
++			expectedError: "localhostProfile must be set if seccompProfile type is Localhost.",
+		},
+		{
+-			description:     "container seccomp profile set to SeccompProfileTypeLocalhost with empty LocalhostProfile returns empty",
+-			containerSc:     &v1.SecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost}},
+-			expectedProfile: "",
++			description:   "container seccomp profile set to SeccompProfileTypeLocalhost with empty LocalhostProfile returns error",
++			containerSc:   &v1.SecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost}},
++			expectedError: "localhostProfile must be set if seccompProfile type is Localhost.",
+		},
+		{
+			description:     "container seccomp profile set to SeccompProfileTypeLocalhost returns 'localhost/' + LocalhostProfile",
+@@ -500,41 +428,16 @@ func TestGetSeccompProfilePath(t *testing.T) {
+			containerSc:     &v1.SecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeRuntimeDefault}},
+			expectedProfile: "runtime/default",
+		},
+-		{
+-			description: "prioritise container field over container annotation, pod field and pod annotation",
+-			podSc:       &v1.PodSecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost, LocalhostProfile: getLocal("field-pod-profile.json")}},
+-			containerSc: &v1.SecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost, LocalhostProfile: getLocal("field-cont-profile.json")}},
+-			annotation: map[string]string{
+-				v1.SeccompPodAnnotationKey:                            "localhost/annota-pod-profile.json",
+-				v1.SeccompContainerAnnotationKeyPrefix + "container1": "localhost/annota-cont-profile.json",
+-			},
+-			containerName:   "container1",
+-			expectedProfile: seccompLocalhostPath("field-cont-profile.json"),
+-		},
+-		{
+-			description: "prioritise container annotation over pod field",
+-			podSc:       &v1.PodSecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost, LocalhostProfile: getLocal("field-pod-profile.json")}},
+-			annotation: map[string]string{
+-				v1.SeccompPodAnnotationKey:                            "localhost/annota-pod-profile.json",
+-				v1.SeccompContainerAnnotationKeyPrefix + "container1": "localhost/annota-cont-profile.json",
+-			},
+-			containerName:   "container1",
+-			expectedProfile: seccompLocalhostPath("annota-cont-profile.json"),
+-		},
+-		{
+-			description: "prioritise pod field over pod annotation",
+-			podSc:       &v1.PodSecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost, LocalhostProfile: getLocal("field-pod-profile.json")}},
+-			annotation: map[string]string{
+-				v1.SeccompPodAnnotationKey: "localhost/annota-pod-profile.json",
+-			},
+-			containerName:   "container1",
+-			expectedProfile: seccompLocalhostPath("field-pod-profile.json"),
+-		},
+	}
+
+	for i, test := range tests {
+-		seccompProfile := m.getSeccompProfilePath(test.annotation, test.containerName, test.podSc, test.containerSc, false)
+-		assert.Equal(t, test.expectedProfile, seccompProfile, "TestCase[%d]: %s", i, test.description)
++		seccompProfile, err := m.getSeccompProfilePath(test.annotation, test.containerName, test.podSc, test.containerSc, false)
++		if test.expectedError != "" {
++			assert.EqualError(t, err, test.expectedError, "TestCase[%d]: %s", i, test.description)
++		} else {
++			assert.NoError(t, err, "TestCase[%d]: %s", i, test.description)
++			assert.Equal(t, test.expectedProfile, seccompProfile, "TestCase[%d]: %s", i, test.description)
++		}
+	}
+ }
+
+@@ -549,6 +452,7 @@ func TestGetSeccompProfilePathDefaultSeccomp(t *testing.T) {
+		containerSc     *v1.SecurityContext
+		containerName   string
+		expectedProfile string
++		expectedError   string
+	}{
+		{
+			description:     "no seccomp should return runtime/default",
+@@ -559,91 +463,6 @@ func TestGetSeccompProfilePathDefaultSeccomp(t *testing.T) {
+			containerName:   "container1",
+			expectedProfile: v1.SeccompProfileRuntimeDefault,
+		},
+-		{
+-			description: "annotations: pod runtime/default seccomp profile should return runtime/default",
+-			annotation: map[string]string{
+-				v1.SeccompPodAnnotationKey: v1.SeccompProfileRuntimeDefault,
+-			},
+-			expectedProfile: v1.SeccompProfileRuntimeDefault,
+-		},
+-		{
+-			description: "annotations: pod docker/default seccomp profile should return docker/default",
+-			annotation: map[string]string{
+-				v1.SeccompPodAnnotationKey: v1.DeprecatedSeccompProfileDockerDefault,
+-			},
+-			expectedProfile: "docker/default",
+-		},
+-		{
+-			description: "annotations: pod runtime/default seccomp profile with containerName should return runtime/default",
+-			annotation: map[string]string{
+-				v1.SeccompPodAnnotationKey: v1.SeccompProfileRuntimeDefault,
+-			},
+-			containerName:   "container1",
+-			expectedProfile: v1.SeccompProfileRuntimeDefault,
+-		},
+-		{
+-			description: "annotations: pod docker/default seccomp profile with containerName should return docker/default",
+-			annotation: map[string]string{
+-				v1.SeccompPodAnnotationKey: v1.DeprecatedSeccompProfileDockerDefault,
+-			},
+-			containerName:   "container1",
+-			expectedProfile: "docker/default",
+-		},
+-		{
+-			description: "annotations: pod unconfined seccomp profile should return unconfined",
+-			annotation: map[string]string{
+-				v1.SeccompPodAnnotationKey: v1.SeccompProfileNameUnconfined,
+-			},
+-			expectedProfile: "unconfined",
+-		},
+-		{
+-			description: "annotations: pod unconfined seccomp profile with containerName should return unconfined",
+-			annotation: map[string]string{
+-				v1.SeccompPodAnnotationKey: v1.SeccompProfileNameUnconfined,
+-			},
+-			containerName:   "container1",
+-			expectedProfile: "unconfined",
+-		},
+-		{
+-			description: "annotations: pod localhost seccomp profile should return local profile path",
+-			annotation: map[string]string{
+-				v1.SeccompPodAnnotationKey: "localhost/chmod.json",
+-			},
+-			expectedProfile: seccompLocalhostPath("chmod.json"),
+-		},
+-		{
+-			description: "annotations: pod localhost seccomp profile with containerName should return local profile path",
+-			annotation: map[string]string{
+-				v1.SeccompPodAnnotationKey: "localhost/chmod.json",
+-			},
+-			containerName:   "container1",
+-			expectedProfile: seccompLocalhostPath("chmod.json"),
+-		},
+-		{
+-			description: "annotations: container localhost seccomp profile with containerName should return local profile path",
+-			annotation: map[string]string{
+-				v1.SeccompContainerAnnotationKeyPrefix + "container1": "localhost/chmod.json",
+-			},
+-			containerName:   "container1",
+-			expectedProfile: seccompLocalhostPath("chmod.json"),
+-		},
+-		{
+-			description: "annotations: container localhost seccomp profile should override pod profile",
+-			annotation: map[string]string{
+-				v1.SeccompPodAnnotationKey:                            v1.SeccompProfileNameUnconfined,
+-				v1.SeccompContainerAnnotationKeyPrefix + "container1": "localhost/chmod.json",
+-			},
+-			containerName:   "container1",
+-			expectedProfile: seccompLocalhostPath("chmod.json"),
+-		},
+-		{
+-			description: "annotations: container localhost seccomp profile with unmatched containerName should return runtime/default",
+-			annotation: map[string]string{
+-				v1.SeccompContainerAnnotationKeyPrefix + "container1": "localhost/chmod.json",
+-			},
+-			containerName:   "container2",
+-			expectedProfile: v1.SeccompProfileRuntimeDefault,
+-		},
+		{
+			description:     "pod seccomp profile set to unconfined returns unconfined",
+			podSc:           &v1.PodSecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeUnconfined}},
+@@ -670,14 +489,14 @@ func TestGetSeccompProfilePathDefaultSeccomp(t *testing.T) {
+			expectedProfile: seccompLocalhostPath("filename"),
+		},
+		{
+-			description:     "pod seccomp profile set to SeccompProfileTypeLocalhost with empty LocalhostProfile returns runtime/default",
+-			podSc:           &v1.PodSecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost}},
+-			expectedProfile: v1.SeccompProfileRuntimeDefault,
++			description:   "pod seccomp profile set to SeccompProfileTypeLocalhost with empty LocalhostProfile returns error",
++			podSc:         &v1.PodSecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost}},
++			expectedError: "localhostProfile must be set if seccompProfile type is Localhost.",
+		},
+		{
+-			description:     "container seccomp profile set to SeccompProfileTypeLocalhost with empty LocalhostProfile returns runtime/default",
+-			containerSc:     &v1.SecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost}},
+-			expectedProfile: v1.SeccompProfileRuntimeDefault,
++			description:   "container seccomp profile set to SeccompProfileTypeLocalhost with empty LocalhostProfile returns error",
++			containerSc:   &v1.SecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost}},
++			expectedError: "localhostProfile must be set if seccompProfile type is Localhost.",
+		},
+		{
+			description:     "container seccomp profile set to SeccompProfileTypeLocalhost returns 'localhost/' + LocalhostProfile",
+@@ -690,41 +509,16 @@ func TestGetSeccompProfilePathDefaultSeccomp(t *testing.T) {
+			containerSc:     &v1.SecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeRuntimeDefault}},
+			expectedProfile: "runtime/default",
+		},
+-		{
+-			description: "prioritise container field over container annotation, pod field and pod annotation",
+-			podSc:       &v1.PodSecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost, LocalhostProfile: getLocal("field-pod-profile.json")}},
+-			containerSc: &v1.SecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost, LocalhostProfile: getLocal("field-cont-profile.json")}},
+-			annotation: map[string]string{
+-				v1.SeccompPodAnnotationKey:                            "localhost/annota-pod-profile.json",
+-				v1.SeccompContainerAnnotationKeyPrefix + "container1": "localhost/annota-cont-profile.json",
+-			},
+-			containerName:   "container1",
+-			expectedProfile: seccompLocalhostPath("field-cont-profile.json"),
+-		},
+-		{
+-			description: "prioritise container annotation over pod field",
+-			podSc:       &v1.PodSecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost, LocalhostProfile: getLocal("field-pod-profile.json")}},
+-			annotation: map[string]string{
+-				v1.SeccompPodAnnotationKey:                            "localhost/annota-pod-profile.json",
+-				v1.SeccompContainerAnnotationKeyPrefix + "container1": "localhost/annota-cont-profile.json",
+-			},
+-			containerName:   "container1",
+-			expectedProfile: seccompLocalhostPath("annota-cont-profile.json"),
+-		},
+-		{
+-			description: "prioritise pod field over pod annotation",
+-			podSc:       &v1.PodSecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost, LocalhostProfile: getLocal("field-pod-profile.json")}},
+-			annotation: map[string]string{
+-				v1.SeccompPodAnnotationKey: "localhost/annota-pod-profile.json",
+-			},
+-			containerName:   "container1",
+-			expectedProfile: seccompLocalhostPath("field-pod-profile.json"),
+-		},
+	}
+
+	for i, test := range tests {
+-		seccompProfile := m.getSeccompProfilePath(test.annotation, test.containerName, test.podSc, test.containerSc, true)
+-		assert.Equal(t, test.expectedProfile, seccompProfile, "TestCase[%d]: %s", i, test.description)
++		seccompProfile, err := m.getSeccompProfilePath(test.annotation, test.containerName, test.podSc, test.containerSc, true)
++		if test.expectedError != "" {
++			assert.EqualError(t, err, test.expectedError, "TestCase[%d]: %s", i, test.description)
++		} else {
++			assert.NoError(t, err, "TestCase[%d]: %s", i, test.description)
++			assert.Equal(t, test.expectedProfile, seccompProfile, "TestCase[%d]: %s", i, test.description)
++		}
+	}
+ }
+
+@@ -747,6 +541,7 @@ func TestGetSeccompProfile(t *testing.T) {
+		containerSc     *v1.SecurityContext
+		containerName   string
+		expectedProfile *runtimeapi.SecurityProfile
++		expectedError   string
+	}{
+		{
+			description:     "no seccomp should return unconfined",
+@@ -781,14 +576,14 @@ func TestGetSeccompProfile(t *testing.T) {
+			},
+		},
+		{
+-			description:     "pod seccomp profile set to SeccompProfileTypeLocalhost with empty LocalhostProfile returns unconfined",
+-			podSc:           &v1.PodSecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost}},
+-			expectedProfile: unconfinedProfile,
++			description:   "pod seccomp profile set to SeccompProfileTypeLocalhost with empty LocalhostProfile returns error",
++			podSc:         &v1.PodSecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost}},
++			expectedError: "localhostProfile must be set if seccompProfile type is Localhost.",
+		},
+		{
+-			description:     "container seccomp profile set to SeccompProfileTypeLocalhost with empty LocalhostProfile returns unconfined",
+-			containerSc:     &v1.SecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost}},
+-			expectedProfile: unconfinedProfile,
++			description:   "container seccomp profile set to SeccompProfileTypeLocalhost with empty LocalhostProfile returns error",
++			containerSc:   &v1.SecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost}},
++			expectedError: "localhostProfile must be set if seccompProfile type is Localhost.",
+		},
+		{
+			description: "container seccomp profile set to SeccompProfileTypeLocalhost returns 'localhost/' + LocalhostProfile",
+@@ -817,8 +612,13 @@ func TestGetSeccompProfile(t *testing.T) {
+	}
+
+	for i, test := range tests {
+-		seccompProfile := m.getSeccompProfile(test.annotation, test.containerName, test.podSc, test.containerSc, false)
+-		assert.Equal(t, test.expectedProfile, seccompProfile, "TestCase[%d]: %s", i, test.description)
++		seccompProfile, err := m.getSeccompProfile(test.annotation, test.containerName, test.podSc, test.containerSc, false)
++		if test.expectedError != "" {
++			assert.EqualError(t, err, test.expectedError, "TestCase[%d]: %s", i, test.description)
++		} else {
++			assert.NoError(t, err, "TestCase[%d]: %s", i, test.description)
++			assert.Equal(t, test.expectedProfile, seccompProfile, "TestCase[%d]: %s", i, test.description)
++		}
+	}
+ }
+
+@@ -841,6 +641,7 @@ func TestGetSeccompProfileDefaultSeccomp(t *testing.T) {
+		containerSc     *v1.SecurityContext
+		containerName   string
+		expectedProfile *runtimeapi.SecurityProfile
++		expectedError   string
+	}{
+		{
+			description:     "no seccomp should return RuntimeDefault",
+@@ -875,14 +676,14 @@ func TestGetSeccompProfileDefaultSeccomp(t *testing.T) {
+			},
+		},
+		{
+-			description:     "pod seccomp profile set to SeccompProfileTypeLocalhost with empty LocalhostProfile returns unconfined",
+-			podSc:           &v1.PodSecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost}},
+-			expectedProfile: unconfinedProfile,
++			description:   "pod seccomp profile set to SeccompProfileTypeLocalhost with empty LocalhostProfile returns error",
++			podSc:         &v1.PodSecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost}},
++			expectedError: "localhostProfile must be set if seccompProfile type is Localhost.",
+		},
+		{
+-			description:     "container seccomp profile set to SeccompProfileTypeLocalhost with empty LocalhostProfile returns unconfined",
+-			containerSc:     &v1.SecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost}},
+-			expectedProfile: unconfinedProfile,
++			description:   "container seccomp profile set to SeccompProfileTypeLocalhost with empty LocalhostProfile returns error",
++			containerSc:   &v1.SecurityContext{SeccompProfile: &v1.SeccompProfile{Type: v1.SeccompProfileTypeLocalhost}},
++			expectedError: "localhostProfile must be set if seccompProfile type is Localhost.",
+		},
+		{
+			description: "container seccomp profile set to SeccompProfileTypeLocalhost returns 'localhost/' + LocalhostProfile",
+@@ -911,8 +712,13 @@ func TestGetSeccompProfileDefaultSeccomp(t *testing.T) {
+	}
+
+	for i, test := range tests {
+-		seccompProfile := m.getSeccompProfile(test.annotation, test.containerName, test.podSc, test.containerSc, true)
+-		assert.Equal(t, test.expectedProfile, seccompProfile, "TestCase[%d]: %s", i, test.description)
++		seccompProfile, err := m.getSeccompProfile(test.annotation, test.containerName, test.podSc, test.containerSc, true)
++		if test.expectedError != "" {
++			assert.EqualError(t, err, test.expectedError, "TestCase[%d]: %s", i, test.description)
++		} else {
++			assert.NoError(t, err, "TestCase[%d]: %s", i, test.description)
++			assert.Equal(t, test.expectedProfile, seccompProfile, "TestCase[%d]: %s", i, test.description)
++		}
+	}
+ }
+
+diff --git a/pkg/kubelet/kuberuntime/kuberuntime_container_linux.go b/pkg/kubelet/kuberuntime/kuberuntime_container_linux.go
+index 6cb9e54729e..54670673bcd 100644
+--- a/pkg/kubelet/kuberuntime/kuberuntime_container_linux.go
++++ b/pkg/kubelet/kuberuntime/kuberuntime_container_linux.go
+@@ -46,15 +46,23 @@ func (m *kubeGenericRuntimeManager) applyPlatformSpecificContainerConfig(config
+		libcontainercgroups.IsCgroup2UnifiedMode() {
+		enforceMemoryQoS = true
+	}
+-	config.Linux = m.generateLinuxContainerConfig(container, pod, uid, username, nsTarget, enforceMemoryQoS)
++	cl, err := m.generateLinuxContainerConfig(container, pod, uid, username, nsTarget, enforceMemoryQoS)
++	if err != nil {
++		return err
++	}
++	config.Linux = cl
+	return nil
+ }
+
+ // generateLinuxContainerConfig generates linux container config for kubelet runtime v1.
+-func (m *kubeGenericRuntimeManager) generateLinuxContainerConfig(container *v1.Container, pod *v1.Pod, uid *int64, username string, nsTarget *kubecontainer.ContainerID, enforceMemoryQoS bool) *runtimeapi.LinuxContainerConfig {
++func (m *kubeGenericRuntimeManager) generateLinuxContainerConfig(container *v1.Container, pod *v1.Pod, uid *int64, username string, nsTarget *kubecontainer.ContainerID, enforceMemoryQoS bool) (*runtimeapi.LinuxContainerConfig, error) {
++	sc, err := m.determineEffectiveSecurityContext(pod, container, uid, username)
++	if err != nil {
++		return nil, err
++	}
+	lc := &runtimeapi.LinuxContainerConfig{
+		Resources:       &runtimeapi.LinuxContainerResources{},
+-		SecurityContext: m.determineEffectiveSecurityContext(pod, container, uid, username),
++		SecurityContext: sc,
+	}
+
+	if nsTarget != nil && lc.SecurityContext.NamespaceOptions.Pid == runtimeapi.NamespaceMode_CONTAINER {
+@@ -125,7 +133,7 @@ func (m *kubeGenericRuntimeManager) generateLinuxContainerConfig(container *v1.C
+		}
+	}
+
+-	return lc
++	return lc, nil
+ }
+
+ // calculateLinuxResources will create the linuxContainerResources type based on the provided CPU and memory resource requests, limits
+diff --git a/pkg/kubelet/kuberuntime/kuberuntime_container_linux_test.go b/pkg/kubelet/kuberuntime/kuberuntime_container_linux_test.go
+index 46817e00fb0..98f635cc932 100644
+--- a/pkg/kubelet/kuberuntime/kuberuntime_container_linux_test.go
++++ b/pkg/kubelet/kuberuntime/kuberuntime_container_linux_test.go
+@@ -47,6 +47,8 @@ func makeExpectedConfig(m *kubeGenericRuntimeManager, pod *v1.Pod, containerInde
+	restartCountUint32 := uint32(restartCount)
+	envs := make([]*runtimeapi.KeyValue, len(opts.Envs))
+
++	l, _ := m.generateLinuxContainerConfig(container, pod, new(int64), "", nil, enforceMemoryQoS)
++
+	expectedConfig := &runtimeapi.ContainerConfig{
+		Metadata: &runtimeapi.ContainerMetadata{
+			Name:    container.Name,
+@@ -64,7 +66,7 @@ func makeExpectedConfig(m *kubeGenericRuntimeManager, pod *v1.Pod, containerInde
+		Stdin:       container.Stdin,
+		StdinOnce:   container.StdinOnce,
+		Tty:         container.TTY,
+-		Linux:       m.generateLinuxContainerConfig(container, pod, new(int64), "", nil, enforceMemoryQoS),
++		Linux:       l,
+		Envs:        envs,
+	}
+	return expectedConfig
+@@ -215,7 +217,8 @@ func TestGenerateLinuxContainerConfigResources(t *testing.T) {
+			},
+		}
+
+-		linuxConfig := m.generateLinuxContainerConfig(&pod.Spec.Containers[0], pod, new(int64), "", nil, false)
++		linuxConfig, err := m.generateLinuxContainerConfig(&pod.Spec.Containers[0], pod, new(int64), "", nil, false)
++		assert.NoError(t, err)
+		assert.Equal(t, test.expected.CpuPeriod, linuxConfig.GetResources().CpuPeriod, test.name)
+		assert.Equal(t, test.expected.CpuQuota, linuxConfig.GetResources().CpuQuota, test.name)
+		assert.Equal(t, test.expected.CpuShares, linuxConfig.GetResources().CpuShares, test.name)
+@@ -329,6 +332,8 @@ func TestGenerateContainerConfigWithMemoryQoSEnforced(t *testing.T) {
+		memoryLow       int64
+		memoryHigh      int64
+	}
++	l1, _ := m.generateLinuxContainerConfig(&pod1.Spec.Containers[0], pod1, new(int64), "", nil, true)
++	l2, _ := m.generateLinuxContainerConfig(&pod2.Spec.Containers[0], pod2, new(int64), "", nil, true)
+	tests := []struct {
+		name     string
+		pod      *v1.Pod
+@@ -338,7 +343,7 @@ func TestGenerateContainerConfigWithMemoryQoSEnforced(t *testing.T) {
+			name: "Request128MBLimit256MB",
+			pod:  pod1,
+			expected: &expectedResult{
+-				m.generateLinuxContainerConfig(&pod1.Spec.Containers[0], pod1, new(int64), "", nil, true),
++				l1,
+				128 * 1024 * 1024,
+				int64(float64(256*1024*1024) * m.memoryThrottlingFactor),
+			},
+@@ -347,7 +352,7 @@ func TestGenerateContainerConfigWithMemoryQoSEnforced(t *testing.T) {
+			name: "Request128MBWithoutLimit",
+			pod:  pod2,
+			expected: &expectedResult{
+-				m.generateLinuxContainerConfig(&pod2.Spec.Containers[0], pod2, new(int64), "", nil, true),
++				l2,
+				128 * 1024 * 1024,
+				int64(pod2MemoryHigh),
+			},
+@@ -355,7 +360,8 @@ func TestGenerateContainerConfigWithMemoryQoSEnforced(t *testing.T) {
+	}
+
+	for _, test := range tests {
+-		linuxConfig := m.generateLinuxContainerConfig(&test.pod.Spec.Containers[0], test.pod, new(int64), "", nil, true)
++		linuxConfig, err := m.generateLinuxContainerConfig(&test.pod.Spec.Containers[0], test.pod, new(int64), "", nil, true)
++		assert.NoError(t, err)
+		assert.Equal(t, test.expected.containerConfig, linuxConfig, test.name)
+		assert.Equal(t, linuxConfig.GetResources().GetUnified()["memory.min"], strconv.FormatInt(test.expected.memoryLow, 10), test.name)
+		assert.Equal(t, linuxConfig.GetResources().GetUnified()["memory.high"], strconv.FormatInt(test.expected.memoryHigh, 10), test.name)
+@@ -578,7 +584,8 @@ func TestGenerateLinuxContainerConfigNamespaces(t *testing.T) {
+		},
+	} {
+		t.Run(tc.name, func(t *testing.T) {
+-			got := m.generateLinuxContainerConfig(&tc.pod.Spec.Containers[0], tc.pod, nil, "", tc.target, false)
++			got, err := m.generateLinuxContainerConfig(&tc.pod.Spec.Containers[0], tc.pod, nil, "", tc.target, false)
++			assert.NoError(t, err)
+			if diff := cmp.Diff(tc.want, got.SecurityContext.NamespaceOptions); diff != "" {
+				t.Errorf("%v: diff (-want +got):\n%v", t.Name(), diff)
+			}
+@@ -669,7 +676,8 @@ func TestGenerateLinuxContainerConfigSwap(t *testing.T) {
+	} {
+		t.Run(tc.name, func(t *testing.T) {
+			m.memorySwapBehavior = tc.swapSetting
+-			actual := m.generateLinuxContainerConfig(&tc.pod.Spec.Containers[0], tc.pod, nil, "", nil, false)
++			actual, err := m.generateLinuxContainerConfig(&tc.pod.Spec.Containers[0], tc.pod, nil, "", nil, false)
++			assert.NoError(t, err)
+			assert.Equal(t, tc.expected, actual.Resources.MemorySwapLimitInBytes, "memory swap config for %s", tc.name)
+		})
+	}
+diff --git a/pkg/kubelet/kuberuntime/security_context.go b/pkg/kubelet/kuberuntime/security_context.go
+index c9d33e44305..3b575c8e974 100644
+--- a/pkg/kubelet/kuberuntime/security_context.go
++++ b/pkg/kubelet/kuberuntime/security_context.go
+@@ -24,7 +24,7 @@ import (
+ )
+
+ // determineEffectiveSecurityContext gets container's security context from v1.Pod and v1.Container.
+-func (m *kubeGenericRuntimeManager) determineEffectiveSecurityContext(pod *v1.Pod, container *v1.Container, uid *int64, username string) *runtimeapi.LinuxContainerSecurityContext {
++func (m *kubeGenericRuntimeManager) determineEffectiveSecurityContext(pod *v1.Pod, container *v1.Container, uid *int64, username string) (*runtimeapi.LinuxContainerSecurityContext, error) {
+	effectiveSc := securitycontext.DetermineEffectiveSecurityContext(pod, container)
+	synthesized := convertToRuntimeSecurityContext(effectiveSc)
+	if synthesized == nil {
+@@ -36,9 +36,16 @@ func (m *kubeGenericRuntimeManager) determineEffectiveSecurityContext(pod *v1.Po
+
+	// TODO: Deprecated, remove after we switch to Seccomp field
+	// set SeccompProfilePath.
+-	synthesized.SeccompProfilePath = m.getSeccompProfilePath(pod.Annotations, container.Name, pod.Spec.SecurityContext, container.SecurityContext, m.seccompDefault)
++	var err error
++	synthesized.SeccompProfilePath, err = m.getSeccompProfilePath(pod.Annotations, container.Name, pod.Spec.SecurityContext, container.SecurityContext, m.seccompDefault)
++	if err != nil {
++		return nil, err
++	}
+
+-	synthesized.Seccomp = m.getSeccompProfile(pod.Annotations, container.Name, pod.Spec.SecurityContext, container.SecurityContext, m.seccompDefault)
++	synthesized.Seccomp, err = m.getSeccompProfile(pod.Annotations, container.Name, pod.Spec.SecurityContext, container.SecurityContext, m.seccompDefault)
++	if err != nil {
++		return nil, err
++	}
+
+	// set ApparmorProfile.
+	synthesized.ApparmorProfile = apparmor.GetProfileNameFromPodAnnotations(pod.Annotations, container.Name)
+@@ -74,7 +81,7 @@ func (m *kubeGenericRuntimeManager) determineEffectiveSecurityContext(pod *v1.Po
+	synthesized.MaskedPaths = securitycontext.ConvertToRuntimeMaskedPaths(effectiveSc.ProcMount)
+	synthesized.ReadonlyPaths = securitycontext.ConvertToRuntimeReadonlyPaths(effectiveSc.ProcMount)
+
+-	return synthesized
++	return synthesized, nil
+ }
+
+ // convertToRuntimeSecurityContext converts v1.SecurityContext to runtimeapi.SecurityContext.
+--
+2.40.0
diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index 59892c92..dc741bbf 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -30,6 +30,7 @@ SRC_URI:append = " \
            file://0001-cross-don-t-build-tests-by-default.patch;patchdir=src/import \
            file://0001-build-golang.sh-convert-remaining-go-calls-to-use.patch;patchdir=src/import \
            file://0001-Makefile.generated_files-Fix-race-issue-for-installi.patch;patchdir=src/import \
+           file://CVE-2023-2431.patch;patchdir=src/import \
            file://cni-containerd-net.conflist \
            file://k8s-init \
            file://99-kubernetes.conf \
-- 
2.40.0


