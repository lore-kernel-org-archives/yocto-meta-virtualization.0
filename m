Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE047C3DA4A
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 08:03:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.88130.1722585819530908521
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 02 Aug 2024 01:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8944340da6=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 472507QT021381
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 2 Aug 2024 08:03:38 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40rjf18da4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 02 Aug 2024 08:03:38 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 2 Aug 2024 01:03:35 -0700
From: <archana.polampalli@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][scarthgap][PATCH 1/1] docker-moby: fix CVE-2024-41110
Date: Fri, 2 Aug 2024 08:03:22 +0000
Message-ID: <20240802080322.4066357-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: -SxGSLMnrtXyojYmWPNgUN3Exb2kB020
X-Proofpoint-GUID: -SxGSLMnrtXyojYmWPNgUN3Exb2kB020
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_04,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408020055
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 472507QT021381
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 02 Aug 2024 08:03:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8856

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 recipes-containers/docker/docker-moby_git.bb  |   1 +
 .../docker/files/CVE-2024-41110.patch         | 176 ++++++++++++++++++
 2 files changed, 177 insertions(+)
 create mode 100644 recipes-containers/docker/files/CVE-2024-41110.patch

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-conta=
iners/docker/docker-moby_git.bb
index 0abb0b3f..706101d1 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -56,6 +56,7 @@ SRC_URI =3D "\
 	file://0001-libnetwork-use-GO-instead-of-go.patch \
         file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patc=
h \
         file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=3Dsrc=
/import \
+        file://CVE-2024-41110.patch;patchdir=3Dsrc/import \
 	"
=20
 DOCKER_COMMIT =3D "${SRCREV_moby}"
diff --git a/recipes-containers/docker/files/CVE-2024-41110.patch b/recip=
es-containers/docker/files/CVE-2024-41110.patch
new file mode 100644
index 00000000..6dd56a08
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2024-41110.patch
@@ -0,0 +1,176 @@
+From ccfe0a41d438053ee54f0478d3a77b090e40c379 Mon Sep 17 00:00:00 2001
+From: Jameson Hyde <jameson.hyde@docker.com>
+Date: Mon, 26 Nov 2018 14:15:22 -0500
+Subject: [PATCH] Authz plugin security fixes for 0-length content and pa=
th
+ validation Signed-off-by: Jameson Hyde <jameson.hyde@docker.com>
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+fix comments
+
+(cherry picked from commit 9659c3a52bac57e615b5fb49b0652baca448643e)
+Signed-off-by: Pawe=C5=82 Gronowski <pawel.gronowski@docker.com>
+(cherry picked from commit 2ac8a479c53d9b8e67c55f1e283da9d85d2b3415)
+Signed-off-by: Pawe=C5=82 Gronowski <pawel.gronowski@docker.com>
+
+CVE: CVE-2024-41110
+Upstream-Status: Backport [https://github.com/moby/moby/commit/ccfe0a41d=
438053ee54f0478d3a77b090e40c379]
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ pkg/authorization/authz.go           | 38 ++++++++++++++++++---
+ pkg/authorization/authz_unix_test.go | 49 ++++++++++++++++++++++++++--
+ 2 files changed, 80 insertions(+), 7 deletions(-)
+
+diff --git a/pkg/authorization/authz.go b/pkg/authorization/authz.go
+index 1eb44315dd..4c2e90b251 100644
+--- a/pkg/authorization/authz.go
++++ b/pkg/authorization/authz.go
+@@ -8,6 +8,8 @@ import (
+	"io"
+	"mime"
+	"net/http"
++	"net/url"
++	"regexp"
+	"strings"
+
+	"github.com/containerd/log"
+@@ -53,10 +55,23 @@ type Ctx struct {
+	authReq *Request
+ }
+
++func isChunked(r *http.Request) bool {
++	// RFC 7230 specifies that content length is to be ignored if Transfer=
-Encoding is chunked
++	if strings.ToLower(r.Header.Get("Transfer-Encoding")) =3D=3D "chunked"=
 {
++		return true
++	}
++	for _, v :=3D range r.TransferEncoding {
++		if 0 =3D=3D strings.Compare(strings.ToLower(v), "chunked") {
++			return true
++		}
++	}
++	return false
++}
++
+ // AuthZRequest authorized the request to the docker daemon using authZ=
 plugins
+ func (ctx *Ctx) AuthZRequest(w http.ResponseWriter, r *http.Request) er=
ror {
+	var body []byte
+-	if sendBody(ctx.requestURI, r.Header) && r.ContentLength > 0 && r.Cont=
entLength < maxBodySize {
++	if sendBody(ctx.requestURI, r.Header) && (r.ContentLength > 0 || isChu=
nked(r)) && r.ContentLength < maxBodySize {
+		var err error
+		body, r.Body, err =3D drainBody(r.Body)
+		if err !=3D nil {
+@@ -109,7 +124,6 @@ func (ctx *Ctx) AuthZResponse(rm ResponseModifier, r=
 *http.Request) error {
+	if sendBody(ctx.requestURI, rm.Header()) {
+		ctx.authReq.ResponseBody =3D rm.RawBody()
+	}
+-
+	for _, plugin :=3D range ctx.plugins {
+		log.G(context.TODO()).Debugf("AuthZ response using plugin %s", plugin.=
Name())
+
+@@ -147,10 +161,26 @@ func drainBody(body io.ReadCloser) ([]byte, io.Rea=
dCloser, error) {
+	return nil, newBody, err
+ }
+
++func isAuthEndpoint(urlPath string) (bool, error) {
++	// eg www.test.com/v1.24/auth/optional?optional1=3Dsomething&optional2=
=3Dsomething (version optional)
++	matched, err :=3D regexp.MatchString(`^[^\/]+\/(v\d[\d\.]*\/)?auth.*`,=
 urlPath)
++	if err !=3D nil {
++		return false, err
++	}
++	return matched, nil
++}
++
+ // sendBody returns true when request/response body should be sent to A=
uthZPlugin
+-func sendBody(url string, header http.Header) bool {
++func sendBody(inURL string, header http.Header) bool {
++	u, err :=3D url.Parse(inURL)
++	// Assume no if the URL cannot be parsed - an empty request will still=
 be forwarded to the plugin and should be rejected
++	if err !=3D nil {
++		return false
++	}
++
+	// Skip body for auth endpoint
+-	if strings.HasSuffix(url, "/auth") {
++	isAuth, err :=3D isAuthEndpoint(u.Path)
++	if isAuth || err !=3D nil {
+		return false
+	}
+
+diff --git a/pkg/authorization/authz_unix_test.go b/pkg/authorization/au=
thz_unix_test.go
+index c9b18d96e9..275f1dd3d0 100644
+--- a/pkg/authorization/authz_unix_test.go
++++ b/pkg/authorization/authz_unix_test.go
+@@ -174,8 +174,8 @@ func TestDrainBody(t *testing.T) {
+
+ func TestSendBody(t *testing.T) {
+	var (
+-		url       =3D "nothing.com"
+		testcases =3D []struct {
++			url         string
+			contentType string
+			expected    bool
+		}{
+@@ -219,15 +219,58 @@ func TestSendBody(t *testing.T) {
+				contentType: "",
+				expected:    false,
+			},
++			{
++				url:         "nothing.com/auth",
++				contentType: "",
++				expected:    false,
++			},
++			{
++				url:         "nothing.com/auth",
++				contentType: "application/json;charset=3DUTF8",
++				expected:    false,
++			},
++			{
++				url:         "nothing.com/auth?p1=3Dtest",
++				contentType: "application/json;charset=3DUTF8",
++				expected:    false,
++			},
++			{
++				url:         "nothing.com/test?p1=3D/auth",
++				contentType: "application/json;charset=3DUTF8",
++				expected:    true,
++			},
++			{
++				url:         "nothing.com/something/auth",
++				contentType: "application/json;charset=3DUTF8",
++				expected:    true,
++			},
++			{
++				url:         "nothing.com/auth/test",
++				contentType: "application/json;charset=3DUTF8",
++				expected:    false,
++			},
++			{
++				url:         "nothing.com/v1.24/auth/test",
++				contentType: "application/json;charset=3DUTF8",
++				expected:    false,
++			},
++			{
++				url:         "nothing.com/v1/auth/test",
++				contentType: "application/json;charset=3DUTF8",
++				expected:    false,
++			},
+		}
+	)
+
+	for _, testcase :=3D range testcases {
+		header :=3D http.Header{}
+		header.Set("Content-Type", testcase.contentType)
++		if testcase.url =3D=3D "" {
++			testcase.url =3D "nothing.com"
++		}
+
+-		if b :=3D sendBody(url, header); b !=3D testcase.expected {
+-			t.Fatalf("Unexpected Content-Type; Expected: %t, Actual: %t", testca=
se.expected, b)
++		if b :=3D sendBody(testcase.url, header); b !=3D testcase.expected {
++			t.Fatalf("sendBody failed: url: %s, content-type: %s; Expected: %t, =
Actual: %t", testcase.url, testcase.contentType, testcase.expected, b)
+		}
+	}
+ }
+--
+2.40.0
--=20
2.40.0


