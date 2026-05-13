Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E90CD4F24
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 15:10:26 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9930.1778685021269632446
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 May 2026 08:10:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ALyzrHf/;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7422; q=dns/txt;
  s=iport01; t=1778685021; x=1779894621;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CMRliGsV7G0mkrIl4CIzMD/agZ1pGypwruIRYjZAFp8=;
  b=ALyzrHf/7ICdBUG1RIVXc2wEaONPG7fPkjVnHZSI3wdGv5ktOhEH7xhN
   hT2ho9BUjvbez3TmLkX51nVWs6xA17U7s4LOMQ6TJ9s0zMw8WV/ysc6/q
   UMM5V6ocun7qDoMN0QSRefWblLP+YfDbubD+BD72iL4hcRF7RVeTPOsAu
   eZOrrauWtVc9yvQc3n0M0uINMHnfvsJru08rZa1XG7MtQx6FlR2fiuDKN
   iNkgRUOqdiPqQ+N9mfxCtKgHrXuzuCRG5fKBjiKqYqdAu18xGpQ2+FsTl
   mymeSxRqpE90vUcQRxIxPGXKm0zHjMvI/qxJvsFaiTD3+SvfGKB0MZTaV
   Q==;
X-CSE-ConnectionGUID: h+dp+k0BQmGwiXmnRDyfsA==
X-CSE-MsgGUID: aFpVQisfSTuf5h8g2cLY4w==
X-IPAS-Result: =?us-ascii?q?A0CVAwDzkgRq/5D/Ja1aHgEBCxIMhGdyX0JJA4RUj1OCI?=
 =?us-ascii?q?YEWkDeOTw8BAQEPRA0EAQGSOgImOBMBAgQDAgMBAQEBAQEBAQEBAQsBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NhloBKQ8BcgMBAgMCJgItIxgJgwIBgnMCARGyfHqBMoEBg?=
 =?us-ascii?q?maBAgJDUNsoAQsUAYEKLoU/gxoBhQJbGAGEeycbG4FygRWCcnaBBYFcAoU7g?=
 =?us-ascii?q?kciBIIigQ6BXR6MfUiBAhwDWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XM1gbB?=
 =?us-ascii?q?wWBS4IFcmqBAoRfeCMsA06BQwMLGA1IESw3FBsEPQFuB4o/HQ+CKQcxShMBK?=
 =?us-ascii?q?4EbGHkkkxuQFIIhoQ4KKIN0jB6VOhozhVulEAuYe4s2glOIeYw7MxkCToRog?=
 =?us-ascii?q?X8lgVlwFYMiCUoZD444g2uEUEPDSCQ1CwMvAQEHAgcCCwMLgWiQAi2BTgEB?=
IronPort-Data: A9a23:IQSZaKiuYHN8k7HDElpdzLpZX161MxEKZh0ujC45NGQN5FlHY01je
 htvW2zUbKuPZmKgL9ojbtuy8UJVu5DUydRqSFdu+C03ESljpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeEULOZ82QsaDxMtvvY8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUYuepvQmIW3
 8UdBy8MXhWFvc6nzqmSH7wEasQLdKEHPasFsX1miDWcBvE8TNWbHOPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgt/5JEWxI9EglHzfjBCoU6VooI84nPYy0p6172F3N/9JYDTHJwKxBfGz
 o7A123XGi8jNceR8gaY/C+s1uCVlgfKBJ1HQdVU8dYv2jV/3Fc7DRAKXB6loOOll0e6WsBWN
 00T/AIqrLMu7wq6SdLhWAWip3yJtQJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZN5ottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:W7cYIKr/kMgwh78q3gT/tF0aV5odeYIsimQD101hICG9Ffbo8v
 xG/c5rtyMc5wx+ZJhNo7290cq7MBDhHPxOgLX5VI3KNGKNhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjizEht7t2uqUuEimpRGsZd0zs=
X-Talos-CUID: =?us-ascii?q?9a23=3ApqdOZ2tKVJslO0r1xrAWBi9m6IslMXHFj3SICXa?=
 =?us-ascii?q?9JnloeLiTc3OB9rhNxp8=3D?=
X-Talos-MUID: 9a23:D8f2ngmndH9j10bq1d3vdnprGt9W2qW1BnsxjJtbu5mLbydUCmuC2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,232,1770595200"; 
   d="scan'208";a="741117296"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 13 May 2026 15:10:20 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 2EB4F18000488
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 13 May 2026 15:10:20 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id C5C2BCDE20D; Wed, 13 May 2026 08:10:19 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][scarthgap][PATCH 1/2] docker-moby: Fix CVE-2026-33997
Date: Wed, 13 May 2026 08:09:12 -0700
Message-ID: <20260513151011.3114690-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3552.cisco.com [171.68.249.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 13 May 2026 15:10:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9794

From: Deepak Rathore <deeratho@cisco.com>

Pick the version-specific cherry-pick [1] of the upstream fix [2] mentioned in [3].

[1] https://github.com/moby/moby/commit/d5986c0430124d82ce87b439638d8ebb16916e40
[2] https://github.com/moby/moby/commit/99a095ecf04e8849318f2811bb3f687905eab09b
[3] https://security-tracker.debian.org/tracker/CVE-2026-33997

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index e66416db..26dce276 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -56,6 +56,7 @@ SRC_URI = "\
 	file://0001-libnetwork-use-GO-instead-of-go.patch \
         file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
         file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=src/import \
+		file://CVE-2026-33997.patch;patchdir=src/import \
 	"
 
 DOCKER_COMMIT = "${SRCREV_moby}"
diff --git a/recipes-containers/docker/files/CVE-2026-33997.patch b/recipes-containers/docker/files/CVE-2026-33997.patch
new file mode 100644
index 00000000..9da4b3cf
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2026-33997.patch
@@ -0,0 +1,179 @@
+From 7e35ad066ee0c89e15fca9e9b95933b79ba315b7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Pawe=C5=82=20Gronowski?= <pawel.gronowski@docker.com>
+Date: Thu, 19 Mar 2026 19:18:23 +0100
+Subject: [PATCH] plugin: Fix off-by-one in privilege validation
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fix an off-by-one error in isEqual() where the comparison loop started
+at index 1 instead of 0, causing the first privilege (after sorting
+alphabetically by name) to never be validated.
+
+This allowed a malicious plugin to request different values for
+whichever privilege sorts first — most notably "allow-all-devices",
+which grants unrestricted rwm access to all host devices.
+
+The bug also meant that plugins requesting exactly one privilege had
+zero iterations of the comparison loop, bypassing validation entirely.
+
+Also fix an existing test case ("diff-order-but-same-value") that only
+passed due to the off-by-one bug, and add test cases for single-element
+and first-sorted-element mismatches.
+
+CVE: CVE-2026-33997
+Upstream-Status: Backport [https://github.com/moby/moby/commit/d5986c0430124d82ce87b439638d8ebb16916e40]
+
+Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
+(cherry picked from commit 99a095ecf04e8849318f2811bb3f687905eab09b)
+Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
+(cherry picked from commit d5986c0430124d82ce87b439638d8ebb16916e40)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ plugin/manager.go      | 50 ++++++++++++++++++++++++------------------
+ plugin/manager_test.go | 44 +++++++++++++++++++++++++++++++++----
+ 2 files changed, 69 insertions(+), 25 deletions(-)
+
+diff --git a/plugin/manager.go b/plugin/manager.go
+index 81f3d67b80..d98b968c7d 100644
+--- a/plugin/manager.go
++++ b/plugin/manager.go
+@@ -1,14 +1,14 @@
+ package plugin // import "github.com/docker/docker/plugin"
+ 
+ import (
++	"cmp"
+ 	"context"
+ 	"encoding/json"
+ 	"io"
+ 	"os"
+ 	"path/filepath"
+-	"reflect"
+ 	"regexp"
+-	"sort"
++	"slices"
+ 	"strings"
+ 	"sync"
+ 	"syscall"
+@@ -331,34 +331,42 @@ func makeLoggerStreams(id string) (stdout, stderr io.WriteCloser) {
+ }
+ 
+ func validatePrivileges(requiredPrivileges, privileges types.PluginPrivileges) error {
+-	if !isEqual(requiredPrivileges, privileges, isEqualPrivilege) {
++	if len(requiredPrivileges) != len(privileges) {
+ 		return errors.New("incorrect privileges")
+ 	}
+ 
+-	return nil
+-}
+-
+-func isEqual(arrOne, arrOther types.PluginPrivileges, compare func(x, y types.PluginPrivilege) bool) bool {
+-	if len(arrOne) != len(arrOther) {
+-		return false
+-	}
+-
+-	sort.Sort(arrOne)
+-	sort.Sort(arrOther)
++	a := normalizePrivileges(requiredPrivileges)
++	b := normalizePrivileges(privileges)
+ 
+-	for i := 1; i < arrOne.Len(); i++ {
+-		if !compare(arrOne[i], arrOther[i]) {
+-			return false
++	for i := range a {
++		if a[i].Name != b[i].Name {
++			return errors.New("incorrect privileges")
++		}
++		if !slices.Equal(a[i].Value, b[i].Value) {
++			return errors.New("incorrect privileges")
+ 		}
+ 	}
+ 
+-	return true
++	return nil
+ }
+ 
+-func isEqualPrivilege(a, b types.PluginPrivilege) bool {
+-	if a.Name != b.Name {
+-		return false
++// normalizePrivileges returns a normalized copy of privileges with privilege names
++// and each privilege's values sorted for order-insensitive comparison.
++// The input is not mutated.
++func normalizePrivileges(privileges types.PluginPrivileges) types.PluginPrivileges {
++	normalized := make(types.PluginPrivileges, len(privileges))
++	for i, privilege := range privileges {
++		normalized[i] = types.PluginPrivilege{
++			Name:        privilege.Name,
++			Description: privilege.Description,
++			Value:       slices.Clone(privilege.Value),
++		}
++		slices.Sort(normalized[i].Value)
+ 	}
+ 
+-	return reflect.DeepEqual(a.Value, b.Value)
++	slices.SortFunc(normalized, func(a, b types.PluginPrivilege) int {
++		return cmp.Compare(a.Name, b.Name)
++	})
++
++	return normalized
+ }
+diff --git a/plugin/manager_test.go b/plugin/manager_test.go
+index 62ccf2149d..6d58865044 100644
+--- a/plugin/manager_test.go
++++ b/plugin/manager_test.go
+@@ -44,12 +44,48 @@ func TestValidatePrivileges(t *testing.T) {
+ 			},
+ 			result: true,
+ 		},
++		"single-element-same": {
++			requiredPrivileges: []types.PluginPrivilege{
++				{Name: "allow-all-devices", Description: "Description", Value: []string{"true"}},
++			},
++			privileges: []types.PluginPrivilege{
++				{Name: "allow-all-devices", Description: "Description", Value: []string{"true"}},
++			},
++			result: true,
++		},
++		"single-element-diff-value": {
++			requiredPrivileges: []types.PluginPrivilege{
++				{Name: "allow-all-devices", Description: "Description", Value: []string{"false"}},
++			},
++			privileges: []types.PluginPrivilege{
++				{Name: "allow-all-devices", Description: "Description", Value: []string{"true"}},
++			},
++			result: false,
++		},
++		"first-sorted-element-diff-value": {
++			requiredPrivileges: []types.PluginPrivilege{
++				{Name: "allow-all-devices", Description: "Description", Value: []string{"false"}},
++				{Name: "network", Description: "Description", Value: []string{"host"}},
++			},
++			privileges: []types.PluginPrivilege{
++				{Name: "allow-all-devices", Description: "Description", Value: []string{"true"}},
++				{Name: "network", Description: "Description", Value: []string{"host"}},
++			},
++			result: false,
++		},
++		"empty-privileges": {
++			requiredPrivileges: []types.PluginPrivilege{},
++			privileges:         []types.PluginPrivilege{},
++			result:             true,
++		},
+ 	}
+ 
+ 	for key, data := range testData {
+-		err := validatePrivileges(data.requiredPrivileges, data.privileges)
+-		if (err == nil) != data.result {
+-			t.Fatalf("Test item %s expected result to be %t, got %t", key, data.result, (err == nil))
+-		}
++		t.Run(key, func(t *testing.T) {
++			err := validatePrivileges(data.requiredPrivileges, data.privileges)
++			if (err == nil) != data.result {
++				t.Fatalf("expected result to be %t, got %t", data.result, (err == nil))
++			}
++		})
+ 	}
+ }
+-- 
+2.44.4
+
-- 
2.35.6


