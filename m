Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D75C4167B
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 04:17:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.30655.1699849028502093690
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 12 Nov 2023 20:17:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ow2yY5iK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9681c4334b=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AD4H7Jl014357;
	Mon, 13 Nov 2023 04:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=WWI9X
	Qy7l/mHJ5HNALPb/oyaGaN3EpCVVIWzdhuhV4A=; b=ow2yY5iK34IhSZT4ds8nD
	TGGlRM0vSb+3tzeF8Xq0yLY7lybgbgDpwvt8o94e4FVk8N0yHr4XD7GQoWJAJorq
	4DIJrsvOm/QHy8xMmqkRoZI3cZLJ3/m9mN8B2Xyis/4FQ8M/xbJBDfdNl9eFw3Ma
	UaLxxLMu0BjkhyUgDd56q7RdVZWYI2Evo7d+kA4402XkJal+/JdcdUgYIR5Auuzr
	njDIparX21XblQgTQKsPIrIgW9fvjMwAbdnA1DzHHTdhmxHpyPH6y72xSa3du8wN
	CXYanI2AAfQjG8tlP7MaZU8T3WHhC/zsBck0uyqNUwiNgoYpZfogrWNSIniPEuX8
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ua0k6998q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Nov 2023 04:17:07 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 12 Nov 2023 20:17:08 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][kirkstone][PATCH v2 2/2] kubernetes: Fix CVE-2023-2727, CVE-2023-2728
Date: Mon, 13 Nov 2023 04:16:41 +0000
Message-ID: <20231113041641.1888686-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: 3cocMHIgTHpEUVQVuiR_k7gXMd66Kn8G
X-Proofpoint-ORIG-GUID: 3cocMHIgTHpEUVQVuiR_k7gXMd66Kn8G
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
 <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Nov 2023 04:17:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8458

From: Soumya Sambu <soumya.sambu@windriver.com>

Users may be able to launch containers using images that are restricted by
ImagePolicyWebhook when using ephemeral containers, Kubernetes clusters are
only affected if the ImagePolicyWebhook admission plugin is used together
with ephemeral containers.

Users may be able to launch containers that bypass the mountable secrets
policy enforced by the ServiceAccount admission plugin when using ephemeral
containers. The policy ensures pods running with a service account may only
reference secrets specified in the service account's secrets field. Kuberenetes
clusters are only affected if the ServiceAccount admission plugin and the
`kubernetes.io/enforce-mountab'le-secrets` annotation are used teogether with
ephemeralcontainers.

CVE: CVE-2023-2727, CVE-2023-2728

Affected Versions
1.27.0 - v1.27.2
v1.26.0 - v1.26.5
v1.25.0 - v1.25.10
<= v1.24.14

master branch(kubernetes v1.28.2) is not impacted
mickledore branch(kubernetes v1.27.5) is not impacted

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-2727
https://nvd.nist.gov/vuln/detail/CVE-2023-2728

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../CVE-2023-2727-CVE-2023-2728.patch         | 559 ++++++++++++++++++
 .../kubernetes/kubernetes_git.bb              |   1 +
 2 files changed, 560 insertions(+)
 create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2023-2727-CVE-2023-2728.patch

diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2023-2727-CVE-2023-2728.patch b/recipes-containers/kubernetes/kubernetes/CVE-2023-2727-CVE-2023-2728.patch
new file mode 100644
index 00000000..2a9e8489
--- /dev/null
+++ b/recipes-containers/kubernetes/kubernetes/CVE-2023-2727-CVE-2023-2728.patch
@@ -0,0 +1,559 @@
+From f754a4dee31455a0d7fc0f51cb85348af9ea5e1f Mon Sep 17 00:00:00 2001
+From: Rita Zhang <rita.z.zhang@gmail.com>
+Date: Tue, 30 May 2023 20:35:33 +0000
+Subject: [PATCH] Add ephemeralcontainer to imagepolicy securityaccount
+ admission plugin
+
+Signed-off-by: Rita Zhang <rita.z.zhang@gmail.com>
+
+CVE: CVE-2023-2727, CVE-2023-2728
+
+Upstream-Status: Backport [https://github.com/kubernetes/kubernetes/commit/f754a4dee31455a0d7fc0f51cb85348af9ea5e1f]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ plugin/pkg/admission/imagepolicy/admission.go |  28 ++--
+ .../admission/imagepolicy/admission_test.go   | 148 +++++++++++++++++-
+ .../pkg/admission/serviceaccount/admission.go |  57 ++++++-
+ .../serviceaccount/admission_test.go          |  88 +++++++++++
+ 4 files changed, 297 insertions(+), 24 deletions(-)
+
+diff --git a/plugin/pkg/admission/imagepolicy/admission.go b/plugin/pkg/admission/imagepolicy/admission.go
+index aea4f713eb5..3dfcbf95eef 100644
+--- a/plugin/pkg/admission/imagepolicy/admission.go
++++ b/plugin/pkg/admission/imagepolicy/admission.go
+@@ -46,6 +46,7 @@ import (
+
+ // PluginName indicates name of admission plugin.
+ const PluginName = "ImagePolicyWebhook"
++const ephemeralcontainers = "ephemeralcontainers"
+
+ // AuditKeyPrefix is used as the prefix for all audit keys handled by this
+ // pluggin. Some well known suffixes are listed below.
+@@ -132,8 +133,9 @@ func (a *Plugin) webhookError(pod *api.Pod, attributes admission.Attributes, err
+
+ // Validate makes an admission decision based on the request attributes
+ func (a *Plugin) Validate(ctx context.Context, attributes admission.Attributes, o admission.ObjectInterfaces) (err error) {
+-	// Ignore all calls to subresources or resources other than pods.
+-	if attributes.GetSubresource() != "" || attributes.GetResource().GroupResource() != api.Resource("pods") {
++	// Ignore all calls to subresources other than ephemeralcontainers or calls to resources other than pods.
++	subresource := attributes.GetSubresource()
++	if (subresource != "" && subresource != ephemeralcontainers) || attributes.GetResource().GroupResource() != api.Resource("pods") {
+		return nil
+	}
+
+@@ -144,13 +146,21 @@ func (a *Plugin) Validate(ctx context.Context, attributes admission.Attributes,
+
+	// Build list of ImageReviewContainerSpec
+	var imageReviewContainerSpecs []v1alpha1.ImageReviewContainerSpec
+-	containers := make([]api.Container, 0, len(pod.Spec.Containers)+len(pod.Spec.InitContainers))
+-	containers = append(containers, pod.Spec.Containers...)
+-	containers = append(containers, pod.Spec.InitContainers...)
+-	for _, c := range containers {
+-		imageReviewContainerSpecs = append(imageReviewContainerSpecs, v1alpha1.ImageReviewContainerSpec{
+-			Image: c.Image,
+-		})
++	if subresource == "" {
++		containers := make([]api.Container, 0, len(pod.Spec.Containers)+len(pod.Spec.InitContainers))
++		containers = append(containers, pod.Spec.Containers...)
++		containers = append(containers, pod.Spec.InitContainers...)
++		for _, c := range containers {
++			imageReviewContainerSpecs = append(imageReviewContainerSpecs, v1alpha1.ImageReviewContainerSpec{
++				Image: c.Image,
++			})
++		}
++	} else if subresource == ephemeralcontainers {
++		for _, c := range pod.Spec.EphemeralContainers {
++			imageReviewContainerSpecs = append(imageReviewContainerSpecs, v1alpha1.ImageReviewContainerSpec{
++				Image: c.Image,
++			})
++		}
+	}
+	imageReview := v1alpha1.ImageReview{
+		Spec: v1alpha1.ImageReviewSpec{
+diff --git a/plugin/pkg/admission/imagepolicy/admission_test.go b/plugin/pkg/admission/imagepolicy/admission_test.go
+index d1f81d51950..a9188462fb9 100644
+--- a/plugin/pkg/admission/imagepolicy/admission_test.go
++++ b/plugin/pkg/admission/imagepolicy/admission_test.go
+@@ -37,7 +37,6 @@ import (
+	api "k8s.io/kubernetes/pkg/apis/core"
+
+	"fmt"
+-	"io/ioutil"
+	"os"
+	"path/filepath"
+	"text/template"
+@@ -67,7 +66,7 @@ imagePolicy:
+ `
+
+ func TestNewFromConfig(t *testing.T) {
+-	dir, err := ioutil.TempDir("", "")
++	dir, err := os.MkdirTemp("", "")
+	if err != nil {
+		t.Fatal(err)
+	}
+@@ -92,7 +91,7 @@ func TestNewFromConfig(t *testing.T) {
+		{data.Key, clientKey},
+	}
+	for _, file := range files {
+-		if err := ioutil.WriteFile(file.name, file.data, 0400); err != nil {
++		if err := os.WriteFile(file.name, file.data, 0400); err != nil {
+			t.Fatal(err)
+		}
+	}
+@@ -196,7 +195,7 @@ current-context: default
+		// Use a closure so defer statements trigger between loop iterations.
+		t.Run(tt.msg, func(t *testing.T) {
+			err := func() error {
+-				tempfile, err := ioutil.TempFile("", "")
++				tempfile, err := os.CreateTemp("", "")
+				if err != nil {
+					return err
+				}
+@@ -211,7 +210,7 @@ current-context: default
+					return fmt.Errorf("failed to execute test template: %v", err)
+				}
+
+-				tempconfigfile, err := ioutil.TempFile("", "")
++				tempconfigfile, err := os.CreateTemp("", "")
+				if err != nil {
+					return err
+				}
+@@ -359,7 +358,7 @@ func (m *mockService) HTTPStatusCode() int { return m.statusCode }
+ // newImagePolicyWebhook creates a temporary kubeconfig file from the provided arguments and attempts to load
+ // a new newImagePolicyWebhook from it.
+ func newImagePolicyWebhook(callbackURL string, clientCert, clientKey, ca []byte, cacheTime time.Duration, defaultAllow bool) (*Plugin, error) {
+-	tempfile, err := ioutil.TempFile("", "")
++	tempfile, err := os.CreateTemp("", "")
+	if err != nil {
+		return nil, err
+	}
+@@ -381,7 +380,7 @@ func newImagePolicyWebhook(callbackURL string, clientCert, clientKey, ca []byte,
+		return nil, err
+	}
+
+-	tempconfigfile, err := ioutil.TempFile("", "")
++	tempconfigfile, err := os.CreateTemp("", "")
+	if err != nil {
+		return nil, err
+	}
+@@ -595,17 +594,23 @@ func TestContainerCombinations(t *testing.T) {
+		test                 string
+		pod                  *api.Pod
+		wantAllowed, wantErr bool
++		subresource          string
++		operation            admission.Operation
+	}{
+		{
+			test:        "Single container allowed",
+			pod:         goodPod("good"),
+			wantAllowed: true,
++			subresource: "",
++			operation:   admission.Create,
+		},
+		{
+			test:        "Single container denied",
+			pod:         goodPod("bad"),
+			wantAllowed: false,
+			wantErr:     true,
++			subresource: "",
++			operation:   admission.Create,
+		},
+		{
+			test: "One good container, one bad",
+@@ -627,6 +632,8 @@ func TestContainerCombinations(t *testing.T) {
+			},
+			wantAllowed: false,
+			wantErr:     true,
++			subresource: "",
++			operation:   admission.Create,
+		},
+		{
+			test: "Multiple good containers",
+@@ -648,6 +655,8 @@ func TestContainerCombinations(t *testing.T) {
+			},
+			wantAllowed: true,
+			wantErr:     false,
++			subresource: "",
++			operation:   admission.Create,
+		},
+		{
+			test: "Multiple bad containers",
+@@ -669,6 +678,8 @@ func TestContainerCombinations(t *testing.T) {
+			},
+			wantAllowed: false,
+			wantErr:     true,
++			subresource: "",
++			operation:   admission.Create,
+		},
+		{
+			test: "Good container, bad init container",
+@@ -692,6 +703,8 @@ func TestContainerCombinations(t *testing.T) {
+			},
+			wantAllowed: false,
+			wantErr:     true,
++			subresource: "",
++			operation:   admission.Create,
+		},
+		{
+			test: "Bad container, good init container",
+@@ -715,6 +728,8 @@ func TestContainerCombinations(t *testing.T) {
+			},
+			wantAllowed: false,
+			wantErr:     true,
++			subresource: "",
++			operation:   admission.Create,
+		},
+		{
+			test: "Good container, good init container",
+@@ -738,6 +753,123 @@ func TestContainerCombinations(t *testing.T) {
+			},
+			wantAllowed: true,
+			wantErr:     false,
++			subresource: "",
++			operation:   admission.Create,
++		},
++		{
++			test: "Good container, good init container, bad ephemeral container when updating ephemeralcontainers subresource",
++			pod: &api.Pod{
++				Spec: api.PodSpec{
++					ServiceAccountName: "default",
++					SecurityContext:    &api.PodSecurityContext{},
++					Containers: []api.Container{
++						{
++							Image:           "good",
++							SecurityContext: &api.SecurityContext{},
++						},
++					},
++					InitContainers: []api.Container{
++						{
++							Image:           "good",
++							SecurityContext: &api.SecurityContext{},
++						},
++					},
++					EphemeralContainers: []api.EphemeralContainer{
++						{
++							EphemeralContainerCommon: api.EphemeralContainerCommon{
++								Image:           "bad",
++								SecurityContext: &api.SecurityContext{},
++							},
++						},
++					},
++				},
++			},
++			wantAllowed: false,
++			wantErr:     true,
++			subresource: "ephemeralcontainers",
++			operation:   admission.Update,
++		},
++		{
++			test: "Good container, good init container, bad ephemeral container when updating subresource=='' which sets initContainer and container only",
++			pod: &api.Pod{
++				Spec: api.PodSpec{
++					ServiceAccountName: "default",
++					SecurityContext:    &api.PodSecurityContext{},
++					Containers: []api.Container{
++						{
++							Image:           "good",
++							SecurityContext: &api.SecurityContext{},
++						},
++					},
++					InitContainers: []api.Container{
++						{
++							Image:           "good",
++							SecurityContext: &api.SecurityContext{},
++						},
++					},
++					EphemeralContainers: []api.EphemeralContainer{
++						{
++							EphemeralContainerCommon: api.EphemeralContainerCommon{
++								Image:           "bad",
++								SecurityContext: &api.SecurityContext{},
++							},
++						},
++					},
++				},
++			},
++			wantAllowed: true,
++			wantErr:     false,
++			subresource: "",
++			operation:   admission.Update,
++		},
++
++		{
++			test: "Bad container, good ephemeral container when updating subresource=='ephemeralcontainers' which sets ephemeralcontainers only",
++			pod: &api.Pod{
++				Spec: api.PodSpec{
++					ServiceAccountName: "default",
++					SecurityContext:    &api.PodSecurityContext{},
++					Containers: []api.Container{
++						{
++							Image:           "bad",
++							SecurityContext: &api.SecurityContext{},
++						},
++					},
++					EphemeralContainers: []api.EphemeralContainer{
++						{
++							EphemeralContainerCommon: api.EphemeralContainerCommon{
++								Image:           "good",
++								SecurityContext: &api.SecurityContext{},
++							},
++						},
++					},
++				},
++			},
++			wantAllowed: true,
++			wantErr:     false,
++			subresource: "ephemeralcontainers",
++			operation:   admission.Update,
++		},
++		{
++			test: "Good ephemeral container",
++			pod: &api.Pod{
++				Spec: api.PodSpec{
++					ServiceAccountName: "default",
++					SecurityContext:    &api.PodSecurityContext{},
++					EphemeralContainers: []api.EphemeralContainer{
++						{
++							EphemeralContainerCommon: api.EphemeralContainerCommon{
++								Image:           "good",
++								SecurityContext: &api.SecurityContext{},
++							},
++						},
++					},
++				},
++			},
++			wantAllowed: true,
++			wantErr:     false,
++			subresource: "ephemeralcontainers",
++			operation:   admission.Update,
+		},
+	}
+	for _, tt := range tests {
+@@ -759,7 +891,7 @@ func TestContainerCombinations(t *testing.T) {
+				return
+			}
+
+-			attr := admission.NewAttributesRecord(tt.pod, nil, api.Kind("Pod").WithVersion("version"), "namespace", "", api.Resource("pods").WithVersion("version"), "", admission.Create, &metav1.CreateOptions{}, false, &user.DefaultInfo{})
++			attr := admission.NewAttributesRecord(tt.pod, nil, api.Kind("Pod").WithVersion("version"), "namespace", "", api.Resource("pods").WithVersion("version"), tt.subresource, tt.operation, &metav1.CreateOptions{}, false, &user.DefaultInfo{})
+
+			err = wh.Validate(context.TODO(), attr, nil)
+			if tt.wantAllowed {
+diff --git a/plugin/pkg/admission/serviceaccount/admission.go b/plugin/pkg/admission/serviceaccount/admission.go
+index 035d54ea8ea..f6e25f3c19d 100644
+--- a/plugin/pkg/admission/serviceaccount/admission.go
++++ b/plugin/pkg/admission/serviceaccount/admission.go
+@@ -100,7 +100,7 @@ var _ = genericadmissioninitializer.WantsExternalKubeInformerFactory(&Plugin{})
+ // 5. If MountServiceAccountToken is true, it adds a VolumeMount with the pod's ServiceAccount's api token secret to containers
+ func NewServiceAccount() *Plugin {
+	return &Plugin{
+-		Handler: admission.NewHandler(admission.Create),
++		Handler: admission.NewHandler(admission.Create, admission.Update),
+		// TODO: enable this once we've swept secret usage to account for adding secret references to service accounts
+		LimitSecretReferences: false,
+		// Auto mount service account API token secrets
+@@ -140,7 +140,10 @@ func (s *Plugin) Admit(ctx context.Context, a admission.Attributes, o admission.
+	if shouldIgnore(a) {
+		return nil
+	}
+-
++	if a.GetOperation() != admission.Create {
++		// we only mutate pods during create requests
++		return nil
++	}
+	pod := a.GetObject().(*api.Pod)
+
+	// Don't modify the spec of mirror pods.
+@@ -157,7 +160,7 @@ func (s *Plugin) Admit(ctx context.Context, a admission.Attributes, o admission.
+
+	serviceAccount, err := s.getServiceAccount(a.GetNamespace(), pod.Spec.ServiceAccountName)
+	if err != nil {
+-		return admission.NewForbidden(a, fmt.Errorf("error looking up service account %s/%s: %v", a.GetNamespace(), pod.Spec.ServiceAccountName, err))
++		return admission.NewForbidden(a, fmt.Errorf("error looking up service account %s/%s: %w", a.GetNamespace(), pod.Spec.ServiceAccountName, err))
+	}
+	if s.MountServiceAccountToken && shouldAutomount(serviceAccount, pod) {
+		s.mountServiceAccountToken(serviceAccount, pod)
+@@ -180,6 +183,15 @@ func (s *Plugin) Validate(ctx context.Context, a admission.Attributes, o admissi
+
+	pod := a.GetObject().(*api.Pod)
+
++	if a.GetOperation() == admission.Update && a.GetSubresource() == "ephemeralcontainers" {
++		return s.limitEphemeralContainerSecretReferences(pod, a)
++	}
++
++	if a.GetOperation() != admission.Create {
++		// we only validate pod specs during create requests
++		return nil
++	}
++
+	// Mirror pods have restrictions on what they can reference
+	if _, isMirrorPod := pod.Annotations[api.MirrorPodAnnotationKey]; isMirrorPod {
+		if len(pod.Spec.ServiceAccountName) != 0 {
+@@ -205,6 +217,10 @@ func (s *Plugin) Validate(ctx context.Context, a admission.Attributes, o admissi
+		return nil
+	}
+
++	// Require container pods to have service accounts
++	if len(pod.Spec.ServiceAccountName) == 0 {
++		return admission.NewForbidden(a, fmt.Errorf("no service account specified for pod %s/%s", a.GetNamespace(), pod.Name))
++	}
+	// Ensure the referenced service account exists
+	serviceAccount, err := s.getServiceAccount(a.GetNamespace(), pod.Spec.ServiceAccountName)
+	if err != nil {
+@@ -221,10 +237,7 @@ func (s *Plugin) Validate(ctx context.Context, a admission.Attributes, o admissi
+ }
+
+ func shouldIgnore(a admission.Attributes) bool {
+-	if a.GetResource().GroupResource() != api.Resource("pods") {
+-		return true
+-	}
+-	if a.GetSubresource() != "" {
++	if a.GetResource().GroupResource() != api.Resource("pods") || (a.GetSubresource() != "" && a.GetSubresource() != "ephemeralcontainers") {
+		return true
+	}
+	obj := a.GetObject()
+@@ -350,6 +363,36 @@ func (s *Plugin) limitSecretReferences(serviceAccount *corev1.ServiceAccount, po
+	return nil
+ }
+
++func (s *Plugin) limitEphemeralContainerSecretReferences(pod *api.Pod, a admission.Attributes) error {
++	// Require ephemeral container pods to have service accounts
++	if len(pod.Spec.ServiceAccountName) == 0 {
++		return admission.NewForbidden(a, fmt.Errorf("no service account specified for pod %s/%s", a.GetNamespace(), pod.Name))
++	}
++	// Ensure the referenced service account exists
++	serviceAccount, err := s.getServiceAccount(a.GetNamespace(), pod.Spec.ServiceAccountName)
++	if err != nil {
++		return admission.NewForbidden(a, fmt.Errorf("error looking up service account %s/%s: %w", a.GetNamespace(), pod.Spec.ServiceAccountName, err))
++	}
++	if !s.enforceMountableSecrets(serviceAccount) {
++		return nil
++	}
++	// Ensure all secrets the ephemeral containers reference are allowed by the service account
++	mountableSecrets := sets.NewString()
++	for _, s := range serviceAccount.Secrets {
++		mountableSecrets.Insert(s.Name)
++	}
++	for _, container := range pod.Spec.EphemeralContainers {
++		for _, env := range container.Env {
++			if env.ValueFrom != nil && env.ValueFrom.SecretKeyRef != nil {
++				if !mountableSecrets.Has(env.ValueFrom.SecretKeyRef.Name) {
++					return fmt.Errorf("ephemeral container %s with envVar %s referencing secret.secretName=\"%s\" is not allowed because service account %s does not reference that secret", container.Name, env.Name, env.ValueFrom.SecretKeyRef.Name, serviceAccount.Name)
++				}
++			}
++		}
++	}
++	return nil
++}
++
+ func (s *Plugin) mountServiceAccountToken(serviceAccount *corev1.ServiceAccount, pod *api.Pod) {
+	// Find the volume and volume name for the ServiceAccountTokenSecret if it already exists
+	tokenVolumeName := ""
+diff --git a/plugin/pkg/admission/serviceaccount/admission_test.go b/plugin/pkg/admission/serviceaccount/admission_test.go
+index ca43abf9c3f..f5359253985 100644
+--- a/plugin/pkg/admission/serviceaccount/admission_test.go
++++ b/plugin/pkg/admission/serviceaccount/admission_test.go
+@@ -545,6 +545,34 @@ func TestAllowsReferencedSecret(t *testing.T) {
+	if err := admissiontesting.WithReinvocationTesting(t, admit).Admit(context.TODO(), attrs, nil); err != nil {
+		t.Errorf("Unexpected error: %v", err)
+	}
++
++	pod2 = &api.Pod{
++		Spec: api.PodSpec{
++			ServiceAccountName: DefaultServiceAccountName,
++			EphemeralContainers: []api.EphemeralContainer{
++				{
++					EphemeralContainerCommon: api.EphemeralContainerCommon{
++						Name: "container-2",
++						Env: []api.EnvVar{
++							{
++								Name: "env-1",
++								ValueFrom: &api.EnvVarSource{
++									SecretKeyRef: &api.SecretKeySelector{
++										LocalObjectReference: api.LocalObjectReference{Name: "foo"},
++									},
++								},
++							},
++						},
++					},
++				},
++			},
++		},
++	}
++	// validate enforces restrictions on secret mounts when operation==create and subresource=='' or operation==update and subresource==ephemeralcontainers"
++	attrs = admission.NewAttributesRecord(pod2, nil, api.Kind("Pod").WithVersion("version"), ns, "myname", api.Resource("pods").WithVersion("version"), "ephemeralcontainers", admission.Update, &metav1.UpdateOptions{}, false, nil)
++	if err := admit.Validate(context.TODO(), attrs, nil); err != nil {
++		t.Errorf("Unexpected error: %v", err)
++	}
+ }
+
+ func TestRejectsUnreferencedSecretVolumes(t *testing.T) {
+@@ -622,6 +650,66 @@ func TestRejectsUnreferencedSecretVolumes(t *testing.T) {
+	if err := admissiontesting.WithReinvocationTesting(t, admit).Admit(context.TODO(), attrs, nil); err == nil || !strings.Contains(err.Error(), "with envVar") {
+		t.Errorf("Unexpected error: %v", err)
+	}
++
++	pod2 = &api.Pod{
++		Spec: api.PodSpec{
++			ServiceAccountName: DefaultServiceAccountName,
++			InitContainers: []api.Container{
++				{
++					Name: "container-1",
++					Env: []api.EnvVar{
++						{
++							Name: "env-1",
++							ValueFrom: &api.EnvVarSource{
++								SecretKeyRef: &api.SecretKeySelector{
++									LocalObjectReference: api.LocalObjectReference{Name: "foo"},
++								},
++							},
++						},
++					},
++				},
++			},
++		},
++	}
++	attrs = admission.NewAttributesRecord(pod2, nil, api.Kind("Pod").WithVersion("version"), ns, "myname", api.Resource("pods").WithVersion("version"), "", admission.Update, &metav1.UpdateOptions{}, false, nil)
++	if err := admissiontesting.WithReinvocationTesting(t, admit).Admit(context.TODO(), attrs, nil); err != nil {
++		t.Errorf("admit only enforces restrictions on secret mounts when operation==create. Unexpected error: %v", err)
++	}
++	attrs = admission.NewAttributesRecord(pod2, nil, api.Kind("Pod").WithVersion("version"), ns, "myname", api.Resource("pods").WithVersion("version"), "", admission.Create, &metav1.CreateOptions{}, false, nil)
++	if err := admit.Validate(context.TODO(), attrs, nil); err == nil || !strings.Contains(err.Error(), "with envVar") {
++		t.Errorf("validate only enforces restrictions on secret mounts when operation==create and subresource==''. Unexpected error: %v", err)
++	}
++
++	pod2 = &api.Pod{
++		Spec: api.PodSpec{
++			ServiceAccountName: DefaultServiceAccountName,
++			EphemeralContainers: []api.EphemeralContainer{
++				{
++					EphemeralContainerCommon: api.EphemeralContainerCommon{
++						Name: "container-2",
++						Env: []api.EnvVar{
++							{
++								Name: "env-1",
++								ValueFrom: &api.EnvVarSource{
++									SecretKeyRef: &api.SecretKeySelector{
++										LocalObjectReference: api.LocalObjectReference{Name: "foo"},
++									},
++								},
++							},
++						},
++					},
++				},
++			},
++		},
++	}
++	attrs = admission.NewAttributesRecord(pod2, nil, api.Kind("Pod").WithVersion("version"), ns, "myname", api.Resource("pods").WithVersion("version"), "", admission.Update, &metav1.UpdateOptions{}, false, nil)
++	if err := admissiontesting.WithReinvocationTesting(t, admit).Admit(context.TODO(), attrs, nil); err != nil {
++		t.Errorf("admit only enforces restrictions on secret mounts when operation==create and subresource==''. Unexpected error: %v", err)
++	}
++	attrs = admission.NewAttributesRecord(pod2, nil, api.Kind("Pod").WithVersion("version"), ns, "myname", api.Resource("pods").WithVersion("version"), "ephemeralcontainers", admission.Update, &metav1.UpdateOptions{}, false, nil)
++	if err := admit.Validate(context.TODO(), attrs, nil); err == nil || !strings.Contains(err.Error(), "with envVar") {
++		t.Errorf("validate enforces restrictions on secret mounts when operation==update and subresource==ephemeralcontainers. Unexpected error: %v", err)
++	}
+ }
+
+ func TestAllowUnreferencedSecretVolumesForPermissiveSAs(t *testing.T) {
+--
+2.40.0
diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index dc741bbf..b0c87c47 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -31,6 +31,7 @@ SRC_URI:append = " \
            file://0001-build-golang.sh-convert-remaining-go-calls-to-use.patch;patchdir=src/import \
            file://0001-Makefile.generated_files-Fix-race-issue-for-installi.patch;patchdir=src/import \
            file://CVE-2023-2431.patch;patchdir=src/import \
+           file://CVE-2023-2727-CVE-2023-2728.patch;patchdir=src/import \
            file://cni-containerd-net.conflist \
            file://k8s-init \
            file://99-kubernetes.conf \
-- 
2.40.0


