Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 760BFC0015E
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 08:43:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.43853.1690188226549054508
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 24 Jul 2023 01:43:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=l3vWHfvM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6569dd7269=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36O6vbln016184
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 24 Jul 2023 08:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=PPS06212021; bh=XnLdGCSDk2aJeiw0wN
	7PC3tW7+SAjG2xHX68U5crt4M=; b=l3vWHfvM0KY8DslMd7yDLhq+s1XqN7ghLU
	cHiJV6V++pd8eRRaWCn/kwBigUfIu+fNAVhq/DSvR6F++xGyY2BJ/vvmKef9BT/J
	C107pHIe5MqW+En4mHM0SkF/4SHFJ9gE7JsaQQJSMNh9NxDFhZr2DYbbXRKEx7+8
	RlxlxsdilZedvMN0tmJMqek02y2I4vma5Mp6O5QmKfF3SzJ+Tp6LIBKD9nCmiNMn
	OMjeSmTm1QTZRnU3uMUGYzyMr53T+c7uKskecjgoVVxrY7EeXEOWUtBxNCC6ril8
	wtva8AW8Gl3H8dONBOhT0e0lui3TgzZu1pTLP7REuSwGRM7Uhnrw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s1a78rbsw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 24 Jul 2023 08:43:45 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 01:43:42 -0700
From: nmali <narpat.mali@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: <hari.gpillai@windriver.com>
Subject: [meta-virtualization][mickledore][PATCH 1/1] docker-distribution: fix for CVE-2023-2253
Date: Mon, 24 Jul 2023 08:43:18 +0000
Message-ID: <20230724084318.1082352-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: 5_aKZCc8kYva7i11ZBY-6ZcIJCIVOU2z
X-Proofpoint-GUID: 5_aKZCc8kYva7i11ZBY-6ZcIJCIVOU2z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-24_06,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 clxscore=1011 priorityscore=1501
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2306200000
 definitions=main-2307240077
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 36O6vbln016184
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 24 Jul 2023 08:43:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8131

From: Narpat Mali <narpat.mali@windriver.com>

A flaw was found in the `/v2/_catalog` endpoint in distribution/distribut=
ion,
which accepts a parameter to control the maximum number of records return=
ed
(query string: `n`). This vulnerability allows a malicious user to submit=
 an
unreasonably large value for `n,` causing the allocation of a massive str=
ing
array, possibly causing a denial of service through excessive use of memo=
ry.

References:
https://github.com/distribution/distribution/security/advisories/GHSA-hqx=
w-f8mx-cpmw
https://github.com/distribution/distribution/commit/521ea3d973cb0c7089ebb=
cdd4ccadc34be941f54

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../docker-distribution_git.bb                |   1 +
 ...ix-runaway-allocation-on-v2-_catalog.patch | 669 ++++++++++++++++++
 2 files changed, 670 insertions(+)
 create mode 100644 recipes-containers/docker-distribution/files/0001-Fix=
-runaway-allocation-on-v2-_catalog.patch

diff --git a/recipes-containers/docker-distribution/docker-distribution_g=
it.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
index d05d0131..74bc2cb5 100644
--- a/recipes-containers/docker-distribution/docker-distribution_git.bb
+++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
@@ -7,6 +7,7 @@ SRCREV_distribution=3D "dc5b207fdd294c57dfef59017df60088b=
27d2668"
 SRC_URI =3D "git://github.com/docker/distribution.git;branch=3Drelease/2=
.8;name=3Ddistribution;destsuffix=3Dgit/src/github.com/docker/distributio=
n;protocol=3Dhttps \
            file://docker-registry.service \
            file://0001-build-use-to-use-cross-go-compiler.patch \
+           file://0001-Fix-runaway-allocation-on-v2-_catalog.patch \
           "
=20
 PACKAGES =3D+ "docker-registry"
diff --git a/recipes-containers/docker-distribution/files/0001-Fix-runawa=
y-allocation-on-v2-_catalog.patch b/recipes-containers/docker-distributio=
n/files/0001-Fix-runaway-allocation-on-v2-_catalog.patch
new file mode 100644
index 00000000..69da7054
--- /dev/null
+++ b/recipes-containers/docker-distribution/files/0001-Fix-runaway-alloc=
ation-on-v2-_catalog.patch
@@ -0,0 +1,669 @@
+From 521ea3d973cb0c7089ebbcdd4ccadc34be941f54 Mon Sep 17 00:00:00 2001
+From: "Jose D. Gomez R" <jose.gomez@suse.com>
+Date: Mon, 24 Apr 2023 18:52:27 +0200
+Subject: [PATCH] Fix runaway allocation on /v2/_catalog
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Introduced a Catalog entry in the configuration struct. With it,
+it's possible to control the maximum amount of entries returned
+by /v2/catalog (`GetCatalog` in registry/handlers/catalog.go).
+
+It's set to a default value of 1000.
+
+`GetCatalog` returns 100 entries by default if no `n` is
+provided. When provided it will be validated to be between `0`
+and `MaxEntries` defined in Configuration. When `n` is outside
+the aforementioned boundary, ErrorCodePaginationNumberInvalid is
+returned.
+
+`GetCatalog` now handles `n=3D0` gracefully with an empty response
+as well.
+
+Signed-off-by: Jos=C3=A9 D. G=C3=B3mez R. <1josegomezr@gmail.com>
+Co-authored-by: Cory Snider <corhere@gmail.com>
+
+CVE: CVE-2023-2253
+
+Upstream-Status: Backport [https://github.com/distribution/distribution/=
commit/521ea3d973cb0c7089ebbcdd4ccadc34be941f54]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ configuration/configuration.go      |  18 +-
+ configuration/configuration_test.go |   4 +
+ registry/api/v2/descriptors.go      |  17 ++
+ registry/api/v2/errors.go           |   9 +
+ registry/handlers/api_test.go       | 316 +++++++++++++++++++++++++---
+ registry/handlers/catalog.go        |  54 +++--
+ 6 files changed, 376 insertions(+), 42 deletions(-)
+
+diff --git a/configuration/configuration.go b/configuration/configuratio=
n.go
+index dd315485..1e696613 100644
+--- a/configuration/configuration.go
++++ b/configuration/configuration.go
+@@ -193,7 +193,8 @@ type Configuration struct {
+		} `yaml:"pool,omitempty"`
+	} `yaml:"redis,omitempty"`
+
+-	Health Health `yaml:"health,omitempty"`
++	Health  Health  `yaml:"health,omitempty"`
++	Catalog Catalog `yaml:"catalog,omitempty"`
+
+	Proxy Proxy `yaml:"proxy,omitempty"`
+
+@@ -244,6 +245,16 @@ type Configuration struct {
+	} `yaml:"policy,omitempty"`
+ }
+
++// Catalog is composed of MaxEntries.
++// Catalog endpoint (/v2/_catalog) configuration, it provides the confi=
guration
++// options to control the maximum number of entries returned by the cat=
alog endpoint.
++type Catalog struct {
++	// Max number of entries returned by the catalog endpoint. Requesting =
n entries
++	// to the catalog endpoint will return at most MaxEntries entries.
++	// An empty or a negative value will set a default of 1000 maximum ent=
ries by default.
++	MaxEntries int `yaml:"maxentries,omitempty"`
++}
++
+ // LogHook is composed of hook Level and Type.
+ // After hooks configuration, it can execute the next handling automati=
cally,
+ // when defined levels of log message emitted.
+@@ -670,6 +681,11 @@ func Parse(rd io.Reader) (*Configuration, error) {
+					if v0_1.Loglevel !=3D Loglevel("") {
+						v0_1.Loglevel =3D Loglevel("")
+					}
++
++					if v0_1.Catalog.MaxEntries <=3D 0 {
++						v0_1.Catalog.MaxEntries =3D 1000
++					}
++
+					if v0_1.Storage.Type() =3D=3D "" {
+						return nil, errors.New("no storage configuration provided")
+					}
+diff --git a/configuration/configuration_test.go b/configuration/configu=
ration_test.go
+index 0d6136e1..48cc9980 100644
+--- a/configuration/configuration_test.go
++++ b/configuration/configuration_test.go
+@@ -71,6 +71,9 @@ var configStruct =3D Configuration{
+			},
+		},
+	},
++	Catalog: Catalog{
++		MaxEntries: 1000,
++	},
+	HTTP: struct {
+		Addr         string        `yaml:"addr,omitempty"`
+		Net          string        `yaml:"net,omitempty"`
+@@ -524,6 +527,7 @@ func copyConfig(config Configuration) *Configuration=
 {
+	configCopy.Version =3D MajorMinorVersion(config.Version.Major(), config=
.Version.Minor())
+	configCopy.Loglevel =3D config.Loglevel
+	configCopy.Log =3D config.Log
++	configCopy.Catalog =3D config.Catalog
+	configCopy.Log.Fields =3D make(map[string]interface{}, len(config.Log.F=
ields))
+	for k, v :=3D range config.Log.Fields {
+		configCopy.Log.Fields[k] =3D v
+diff --git a/registry/api/v2/descriptors.go b/registry/api/v2/descriptor=
s.go
+index a9616c58..c3bf90f7 100644
+--- a/registry/api/v2/descriptors.go
++++ b/registry/api/v2/descriptors.go
+@@ -134,6 +134,19 @@ var (
+		},
+	}
+
++	invalidPaginationResponseDescriptor =3D ResponseDescriptor{
++		Name:        "Invalid pagination number",
++		Description: "The received parameter n was invalid in some way, as de=
scribed by the error code. The client should resolve the issue and retry =
the request.",
++		StatusCode:  http.StatusBadRequest,
++		Body: BodyDescriptor{
++			ContentType: "application/json",
++			Format:      errorsBody,
++		},
++		ErrorCodes: []errcode.ErrorCode{
++			ErrorCodePaginationNumberInvalid,
++		},
++	}
++
+	repositoryNotFoundResponseDescriptor =3D ResponseDescriptor{
+		Name:        "No Such Repository Error",
+		StatusCode:  http.StatusNotFound,
+@@ -490,6 +503,7 @@ var routeDescriptors =3D []RouteDescriptor{
+							},
+						},
+						Failures: []ResponseDescriptor{
++							invalidPaginationResponseDescriptor,
+							unauthorizedResponseDescriptor,
+							repositoryNotFoundResponseDescriptor,
+							deniedResponseDescriptor,
+@@ -1578,6 +1592,9 @@ var routeDescriptors =3D []RouteDescriptor{
+								},
+							},
+						},
++						Failures: []ResponseDescriptor{
++							invalidPaginationResponseDescriptor,
++						},
+					},
+				},
+			},
+diff --git a/registry/api/v2/errors.go b/registry/api/v2/errors.go
+index 97d6923a..87e9f3c1 100644
+--- a/registry/api/v2/errors.go
++++ b/registry/api/v2/errors.go
+@@ -133,4 +133,13 @@ var (
+		longer proceed.`,
+		HTTPStatusCode: http.StatusNotFound,
+	})
++
++	ErrorCodePaginationNumberInvalid =3D errcode.Register(errGroup, errcod=
e.ErrorDescriptor{
++		Value:   "PAGINATION_NUMBER_INVALID",
++		Message: "invalid number of results requested",
++		Description: `Returned when the "n" parameter (number of results
++		to return) is not an integer, "n" is negative or "n" is bigger than
++		the maximum allowed.`,
++		HTTPStatusCode: http.StatusBadRequest,
++	})
+ )
+diff --git a/registry/handlers/api_test.go b/registry/handlers/api_test.=
go
+index 2d3edc74..bf037d45 100644
+--- a/registry/handlers/api_test.go
++++ b/registry/handlers/api_test.go
+@@ -81,21 +81,23 @@ func TestCheckAPI(t *testing.T) {
+
+ // TestCatalogAPI tests the /v2/_catalog endpoint
+ func TestCatalogAPI(t *testing.T) {
+-	chunkLen :=3D 2
+	env :=3D newTestEnv(t, false)
+	defer env.Shutdown()
+
+-	values :=3D url.Values{
+-		"last": []string{""},
+-		"n":    []string{strconv.Itoa(chunkLen)}}
++	maxEntries :=3D env.config.Catalog.MaxEntries
++	allCatalog :=3D []string{
++		"foo/aaaa", "foo/bbbb", "foo/cccc", "foo/dddd", "foo/eeee", "foo/ffff=
",
++	}
+
+-	catalogURL, err :=3D env.builder.BuildCatalogURL(values)
++	chunkLen :=3D maxEntries - 1
++
++	catalogURL, err :=3D env.builder.BuildCatalogURL()
+	if err !=3D nil {
+		t.Fatalf("unexpected error building catalog url: %v", err)
+	}
+
+	// -----------------------------------
+-	// try to get an empty catalog
++	// Case No. 1: Empty catalog
+	resp, err :=3D http.Get(catalogURL)
+	if err !=3D nil {
+		t.Fatalf("unexpected error issuing request: %v", err)
+@@ -113,23 +115,22 @@ func TestCatalogAPI(t *testing.T) {
+		t.Fatalf("error decoding fetched manifest: %v", err)
+	}
+
+-	// we haven't pushed anything to the registry yet
++	// No images pushed =3D no image returned
+	if len(ctlg.Repositories) !=3D 0 {
+-		t.Fatalf("repositories has unexpected values")
++		t.Fatalf("repositories returned unexpected entries (expected: %d, ret=
urned: %d)", 0, len(ctlg.Repositories))
+	}
+
++	// No pagination should be returned
+	if resp.Header.Get("Link") !=3D "" {
+		t.Fatalf("repositories has more data when none expected")
+	}
+
+-	// -----------------------------------
+-	// push something to the registry and try again
+-	images :=3D []string{"foo/aaaa", "foo/bbbb", "foo/cccc"}
+-
+-	for _, image :=3D range images {
++	for _, image :=3D range allCatalog {
+		createRepository(env, t, image, "sometag")
+	}
+
++	// -----------------------------------
++	// Case No. 2: Catalog populated & n is not provided nil (n internally=
 will be min(100, maxEntries))
+	resp, err =3D http.Get(catalogURL)
+	if err !=3D nil {
+		t.Fatalf("unexpected error issuing request: %v", err)
+@@ -143,27 +144,60 @@ func TestCatalogAPI(t *testing.T) {
+		t.Fatalf("error decoding fetched manifest: %v", err)
+	}
+
+-	if len(ctlg.Repositories) !=3D chunkLen {
+-		t.Fatalf("repositories has unexpected values")
++	// it must match max entries
++	if len(ctlg.Repositories) !=3D maxEntries {
++		t.Fatalf("repositories returned unexpected entries (expected: %d, ret=
urned: %d)", maxEntries, len(ctlg.Repositories))
+	}
+
+-	for _, image :=3D range images[:chunkLen] {
++	// it must return the first maxEntries entries from the catalog
++	for _, image :=3D range allCatalog[:maxEntries] {
+		if !contains(ctlg.Repositories, image) {
+			t.Fatalf("didn't find our repository '%s' in the catalog", image)
+		}
+	}
+
++	// fail if there's no pagination
+	link :=3D resp.Header.Get("Link")
+	if link =3D=3D "" {
+		t.Fatalf("repositories has less data than expected")
+	}
++	// -----------------------------------
++	// Case No. 2.1: Second page (n internally will be min(100, maxEntries=
))
++
++	// build pagination link
++	values :=3D checkLink(t, link, maxEntries, ctlg.Repositories[len(ctlg.=
Repositories)-1])
++
++	catalogURL, err =3D env.builder.BuildCatalogURL(values)
++	if err !=3D nil {
++		t.Fatalf("unexpected error building catalog url: %v", err)
++	}
+
+-	newValues :=3D checkLink(t, link, chunkLen, ctlg.Repositories[len(ctlg=
.Repositories)-1])
++	resp, err =3D http.Get(catalogURL)
++	if err !=3D nil {
++		t.Fatalf("unexpected error issuing request: %v", err)
++	}
++	defer resp.Body.Close()
++
++	checkResponse(t, "issuing catalog api check", resp, http.StatusOK)
++
++	dec =3D json.NewDecoder(resp.Body)
++	if err =3D dec.Decode(&ctlg); err !=3D nil {
++		t.Fatalf("error decoding fetched manifest: %v", err)
++	}
++
++	expectedRemainder :=3D len(allCatalog) - maxEntries
++	if len(ctlg.Repositories) !=3D expectedRemainder {
++		t.Fatalf("repositories returned unexpected entries (expected: %d, ret=
urned: %d)", expectedRemainder, len(ctlg.Repositories))
++	}
+
+	// -----------------------------------
+-	// get the last chunk of data
++	// Case No. 3: request n =3D maxentries
++	values =3D url.Values{
++		"last": []string{""},
++		"n":    []string{strconv.Itoa(maxEntries)},
++	}
+
+-	catalogURL, err =3D env.builder.BuildCatalogURL(newValues)
++	catalogURL, err =3D env.builder.BuildCatalogURL(values)
+	if err !=3D nil {
+		t.Fatalf("unexpected error building catalog url: %v", err)
+	}
+@@ -181,18 +215,239 @@ func TestCatalogAPI(t *testing.T) {
+		t.Fatalf("error decoding fetched manifest: %v", err)
+	}
+
+-	if len(ctlg.Repositories) !=3D 1 {
+-		t.Fatalf("repositories has unexpected values")
++	if len(ctlg.Repositories) !=3D maxEntries {
++		t.Fatalf("repositories returned unexpected entries (expected: %d, ret=
urned: %d)", maxEntries, len(ctlg.Repositories))
+	}
+
+-	lastImage :=3D images[len(images)-1]
+-	if !contains(ctlg.Repositories, lastImage) {
+-		t.Fatalf("didn't find our repository '%s' in the catalog", lastImage)
++	// fail if there's no pagination
++	link =3D resp.Header.Get("Link")
++	if link =3D=3D "" {
++		t.Fatalf("repositories has less data than expected")
++	}
++
++	// -----------------------------------
++	// Case No. 3.1: Second (last) page
++
++	// build pagination link
++	values =3D checkLink(t, link, maxEntries, ctlg.Repositories[len(ctlg.R=
epositories)-1])
++
++	catalogURL, err =3D env.builder.BuildCatalogURL(values)
++	if err !=3D nil {
++		t.Fatalf("unexpected error building catalog url: %v", err)
+	}
+
++	resp, err =3D http.Get(catalogURL)
++	if err !=3D nil {
++		t.Fatalf("unexpected error issuing request: %v", err)
++	}
++	defer resp.Body.Close()
++
++	checkResponse(t, "issuing catalog api check", resp, http.StatusOK)
++
++	dec =3D json.NewDecoder(resp.Body)
++	if err =3D dec.Decode(&ctlg); err !=3D nil {
++		t.Fatalf("error decoding fetched manifest: %v", err)
++	}
++
++	expectedRemainder =3D len(allCatalog) - maxEntries
++	if len(ctlg.Repositories) !=3D expectedRemainder {
++		t.Fatalf("repositories returned unexpected entries (expected: %d, ret=
urned: %d)", expectedRemainder, len(ctlg.Repositories))
++	}
++
++	// -----------------------------------
++	// Case No. 4: request n < maxentries
++	values =3D url.Values{
++		"n": []string{strconv.Itoa(chunkLen)},
++	}
++
++	catalogURL, err =3D env.builder.BuildCatalogURL(values)
++	if err !=3D nil {
++		t.Fatalf("unexpected error building catalog url: %v", err)
++	}
++
++	resp, err =3D http.Get(catalogURL)
++	if err !=3D nil {
++		t.Fatalf("unexpected error issuing request: %v", err)
++	}
++	defer resp.Body.Close()
++
++	checkResponse(t, "issuing catalog api check", resp, http.StatusOK)
++
++	dec =3D json.NewDecoder(resp.Body)
++	if err =3D dec.Decode(&ctlg); err !=3D nil {
++		t.Fatalf("error decoding fetched manifest: %v", err)
++	}
++
++	// returns the requested amount
++	if len(ctlg.Repositories) !=3D chunkLen {
++		t.Fatalf("repositories returned unexpected entries (expected: %d, ret=
urned: %d)", expectedRemainder, len(ctlg.Repositories))
++	}
++
++	// fail if there's no pagination
+	link =3D resp.Header.Get("Link")
+-	if link !=3D "" {
+-		t.Fatalf("catalog has unexpected data")
++	if link =3D=3D "" {
++		t.Fatalf("repositories has less data than expected")
++	}
++
++	// -----------------------------------
++	// Case No. 4.1: request n < maxentries (second page)
++
++	// build pagination link
++	values =3D checkLink(t, link, chunkLen, ctlg.Repositories[len(ctlg.Rep=
ositories)-1])
++
++	catalogURL, err =3D env.builder.BuildCatalogURL(values)
++	if err !=3D nil {
++		t.Fatalf("unexpected error building catalog url: %v", err)
++	}
++
++	resp, err =3D http.Get(catalogURL)
++	if err !=3D nil {
++		t.Fatalf("unexpected error issuing request: %v", err)
++	}
++	defer resp.Body.Close()
++
++	checkResponse(t, "issuing catalog api check", resp, http.StatusOK)
++
++	dec =3D json.NewDecoder(resp.Body)
++	if err =3D dec.Decode(&ctlg); err !=3D nil {
++		t.Fatalf("error decoding fetched manifest: %v", err)
++	}
++
++	expectedRemainder =3D len(allCatalog) - chunkLen
++	if len(ctlg.Repositories) !=3D expectedRemainder {
++		t.Fatalf("repositories returned unexpected entries (expected: %d, ret=
urned: %d)", expectedRemainder, len(ctlg.Repositories))
++	}
++
++	// -----------------------------------
++	// Case No. 5: request n > maxentries | return err: ErrorCodePaginatio=
nNumberInvalid
++	values =3D url.Values{
++		"n": []string{strconv.Itoa(maxEntries + 10)},
++	}
++
++	catalogURL, err =3D env.builder.BuildCatalogURL(values)
++	if err !=3D nil {
++		t.Fatalf("unexpected error building catalog url: %v", err)
++	}
++
++	resp, err =3D http.Get(catalogURL)
++	if err !=3D nil {
++		t.Fatalf("unexpected error issuing request: %v", err)
++	}
++	defer resp.Body.Close()
++
++	checkResponse(t, "issuing catalog api check", resp, http.StatusBadRequ=
est)
++	checkBodyHasErrorCodes(t, "invalid number of results requested", resp,=
 v2.ErrorCodePaginationNumberInvalid)
++
++	// -----------------------------------
++	// Case No. 6: request n > maxentries but <=3D total catalog | return =
err: ErrorCodePaginationNumberInvalid
++	values =3D url.Values{
++		"n": []string{strconv.Itoa(len(allCatalog))},
++	}
++
++	catalogURL, err =3D env.builder.BuildCatalogURL(values)
++	if err !=3D nil {
++		t.Fatalf("unexpected error building catalog url: %v", err)
++	}
++
++	resp, err =3D http.Get(catalogURL)
++	if err !=3D nil {
++		t.Fatalf("unexpected error issuing request: %v", err)
++	}
++	defer resp.Body.Close()
++
++	checkResponse(t, "issuing catalog api check", resp, http.StatusBadRequ=
est)
++	checkBodyHasErrorCodes(t, "invalid number of results requested", resp,=
 v2.ErrorCodePaginationNumberInvalid)
++
++	// -----------------------------------
++	// Case No. 7: n =3D 0 | n is set to max(0, min(defaultEntries, maxEnt=
ries))
++	values =3D url.Values{
++		"n": []string{"0"},
++	}
++
++	catalogURL, err =3D env.builder.BuildCatalogURL(values)
++	if err !=3D nil {
++		t.Fatalf("unexpected error building catalog url: %v", err)
++	}
++
++	resp, err =3D http.Get(catalogURL)
++	if err !=3D nil {
++		t.Fatalf("unexpected error issuing request: %v", err)
++	}
++	defer resp.Body.Close()
++
++	checkResponse(t, "issuing catalog api check", resp, http.StatusOK)
++
++	dec =3D json.NewDecoder(resp.Body)
++	if err =3D dec.Decode(&ctlg); err !=3D nil {
++		t.Fatalf("error decoding fetched manifest: %v", err)
++	}
++
++	// it must be empty
++	if len(ctlg.Repositories) !=3D 0 {
++		t.Fatalf("repositories returned unexpected entries (expected: %d, ret=
urned: %d)", 0, len(ctlg.Repositories))
++	}
++
++	// -----------------------------------
++	// Case No. 8: n =3D -1 | n is set to max(0, min(defaultEntries, maxEn=
tries))
++	values =3D url.Values{
++		"n": []string{"-1"},
++	}
++
++	catalogURL, err =3D env.builder.BuildCatalogURL(values)
++	if err !=3D nil {
++		t.Fatalf("unexpected error building catalog url: %v", err)
++	}
++
++	resp, err =3D http.Get(catalogURL)
++	if err !=3D nil {
++		t.Fatalf("unexpected error issuing request: %v", err)
++	}
++	defer resp.Body.Close()
++
++	checkResponse(t, "issuing catalog api check", resp, http.StatusOK)
++
++	dec =3D json.NewDecoder(resp.Body)
++	if err =3D dec.Decode(&ctlg); err !=3D nil {
++		t.Fatalf("error decoding fetched manifest: %v", err)
++	}
++
++	// it must match max entries
++	if len(ctlg.Repositories) !=3D maxEntries {
++		t.Fatalf("repositories returned unexpected entries (expected: %d, ret=
urned: %d)", expectedRemainder, len(ctlg.Repositories))
++	}
++
++	// -----------------------------------
++	// Case No. 9: n =3D 5, max =3D 5, total catalog =3D 4
++	values =3D url.Values{
++		"n": []string{strconv.Itoa(maxEntries)},
++	}
++
++	envWithLessImages :=3D newTestEnv(t, false)
++	for _, image :=3D range allCatalog[0:(maxEntries - 1)] {
++		createRepository(envWithLessImages, t, image, "sometag")
++	}
++
++	catalogURL, err =3D envWithLessImages.builder.BuildCatalogURL(values)
++	if err !=3D nil {
++		t.Fatalf("unexpected error building catalog url: %v", err)
++	}
++
++	resp, err =3D http.Get(catalogURL)
++	if err !=3D nil {
++		t.Fatalf("unexpected error issuing request: %v", err)
++	}
++	defer resp.Body.Close()
++
++	checkResponse(t, "issuing catalog api check", resp, http.StatusOK)
++
++	dec =3D json.NewDecoder(resp.Body)
++	if err =3D dec.Decode(&ctlg); err !=3D nil {
++		t.Fatalf("error decoding fetched manifest: %v", err)
++	}
++
++	// it must match max entries
++	if len(ctlg.Repositories) !=3D maxEntries-1 {
++		t.Fatalf("repositories returned unexpected entries (expected: %d, ret=
urned: %d)", maxEntries-1, len(ctlg.Repositories))
+	}
+ }
+
+@@ -207,7 +462,7 @@ func checkLink(t *testing.T, urlStr string, numEntri=
es int, last string) url.Val
+	urlValues :=3D linkURL.Query()
+
+	if urlValues.Get("n") !=3D strconv.Itoa(numEntries) {
+-		t.Fatalf("Catalog link entry size is incorrect")
++		t.Fatalf("Catalog link entry size is incorrect (expected: %v, returne=
d: %v)", urlValues.Get("n"), strconv.Itoa(numEntries))
+	}
+
+	if urlValues.Get("last") !=3D last {
+@@ -2023,6 +2278,9 @@ func newTestEnvMirror(t *testing.T, deleteEnabled =
bool) *testEnv {
+		Proxy: configuration.Proxy{
+			RemoteURL: "http://example.com",
+		},
++		Catalog: configuration.Catalog{
++			MaxEntries: 5,
++		},
+	}
+	config.Compatibility.Schema1.Enabled =3D true
+
+@@ -2039,6 +2297,9 @@ func newTestEnv(t *testing.T, deleteEnabled bool) =
*testEnv {
+				"enabled": false,
+			}},
+		},
++		Catalog: configuration.Catalog{
++			MaxEntries: 5,
++		},
+	}
+
+	config.Compatibility.Schema1.Enabled =3D true
+@@ -2291,7 +2552,6 @@ func checkResponse(t *testing.T, msg string, resp =
*http.Response, expectedStatus
+	if resp.StatusCode !=3D expectedStatus {
+		t.Logf("unexpected status %s: %v !=3D %v", msg, resp.StatusCode, expec=
tedStatus)
+		maybeDumpResponse(t, resp)
+-
+		t.FailNow()
+	}
+
+diff --git a/registry/handlers/catalog.go b/registry/handlers/catalog.go
+index eca98468..83ec0a9c 100644
+--- a/registry/handlers/catalog.go
++++ b/registry/handlers/catalog.go
+@@ -9,11 +9,13 @@ import (
+	"strconv"
+
+	"github.com/docker/distribution/registry/api/errcode"
++	v2 "github.com/docker/distribution/registry/api/v2"
+	"github.com/docker/distribution/registry/storage/driver"
++
+	"github.com/gorilla/handlers"
+ )
+
+-const maximumReturnedEntries =3D 100
++const defaultReturnedEntries =3D 100
+
+ func catalogDispatcher(ctx *Context, r *http.Request) http.Handler {
+	catalogHandler :=3D &catalogHandler{
+@@ -38,29 +40,55 @@ func (ch *catalogHandler) GetCatalog(w http.Response=
Writer, r *http.Request) {
+
+	q :=3D r.URL.Query()
+	lastEntry :=3D q.Get("last")
+-	maxEntries, err :=3D strconv.Atoi(q.Get("n"))
+-	if err !=3D nil || maxEntries < 0 {
+-		maxEntries =3D maximumReturnedEntries
++
++	entries :=3D defaultReturnedEntries
++	maximumConfiguredEntries :=3D ch.App.Config.Catalog.MaxEntries
++
++	// parse n, if n unparseable, or negative assign it to defaultReturned=
Entries
++	if n :=3D q.Get("n"); n !=3D "" {
++		parsedMax, err :=3D strconv.Atoi(n)
++		if err =3D=3D nil {
++			if parsedMax > maximumConfiguredEntries {
++				ch.Errors =3D append(ch.Errors, v2.ErrorCodePaginationNumberInvalid=
.WithDetail(map[string]int{"n": parsedMax}))
++				return
++			} else if parsedMax >=3D 0 {
++				entries =3D parsedMax
++			}
++		}
+	}
+
+-	repos :=3D make([]string, maxEntries)
++	// then enforce entries to be between 0 & maximumConfiguredEntries
++	// max(0, min(entries, maximumConfiguredEntries))
++	if entries < 0 || entries > maximumConfiguredEntries {
++		entries =3D maximumConfiguredEntries
++	}
+
+-	filled, err :=3D ch.App.registry.Repositories(ch.Context, repos, lastE=
ntry)
+-	_, pathNotFound :=3D err.(driver.PathNotFoundError)
++	repos :=3D make([]string, entries)
++	filled :=3D 0
+
+-	if err =3D=3D io.EOF || pathNotFound {
++	// entries is guaranteed to be >=3D 0 and < maximumConfiguredEntries
++	if entries =3D=3D 0 {
+		moreEntries =3D false
+-	} else if err !=3D nil {
+-		ch.Errors =3D append(ch.Errors, errcode.ErrorCodeUnknown.WithDetail(e=
rr))
+-		return
++	} else {
++		returnedRepositories, err :=3D ch.App.registry.Repositories(ch.Contex=
t, repos, lastEntry)
++		if err !=3D nil {
++			_, pathNotFound :=3D err.(driver.PathNotFoundError)
++			if err !=3D io.EOF && !pathNotFound {
++				ch.Errors =3D append(ch.Errors, errcode.ErrorCodeUnknown.WithDetail=
(err))
++				return
++			}
++			// err is either io.EOF or not PathNotFoundError
++			moreEntries =3D false
++		}
++		filled =3D returnedRepositories
+	}
+
+	w.Header().Set("Content-Type", "application/json; charset=3Dutf-8")
+
+	// Add a link header if there are more entries to retrieve
+	if moreEntries {
+-		lastEntry =3D repos[len(repos)-1]
+-		urlStr, err :=3D createLinkEntry(r.URL.String(), maxEntries, lastEntr=
y)
++		lastEntry =3D repos[filled-1]
++		urlStr, err :=3D createLinkEntry(r.URL.String(), entries, lastEntry)
+		if err !=3D nil {
+			ch.Errors =3D append(ch.Errors, errcode.ErrorCodeUnknown.WithDetail(e=
rr))
+			return
+--
+2.40.0
--=20
2.40.0


