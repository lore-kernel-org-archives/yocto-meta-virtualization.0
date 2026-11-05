Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28297.1793858429798111915
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Nov 2026 22:00:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=RyGZxtP4;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7674; q=dns/txt;
  s=iport01; t=1793858429; x=1795068029;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=wxc6/9y7D6IByZ/akFpnsTctbTkRuO0LwVQHyt6oS/s=;
  b=RyGZxtP4OCRsB5Zkjt/UN2fTA38FFOcEmd55RRnUokw/OYydphtDkwaB
   Pt/JCM3jOMN1opHih/HIPWwixNXcy/udh3UMQeNCCwfK8IlRfgW7G2Wvc
   cCXGOSp+NPw3gFcBAlacKNxpeSMeMff90YmAAqZXM3AHFfFsW67zP+1dT
   lpgbiEk6005ttFQrhxY1H4ovxL+NuEZOqjcc+n9LOSz7p/1Xcc/al5BK8
   AC+fVRC29LEZLW8NSu/P8UrvLIf6WJ1OttytKdlpOJ+Amy6KXazIkSixj
   dpaeC0NbhcK7Wd9wyngVhe/weonUbTf10BHXD9Q7+gFymP75u14QAt9Dj
   Q==;
X-CSE-ConnectionGUID: PqUOBg8+RPisJhpmxCyw5w==
X-CSE-MsgGUID: 28JWBU8GQrqiJqtGPgKCqg==
X-IPAS-Result: =?us-ascii?q?A0AaAABsGuxq/40QJK1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ1YUJJA4RUiBuHOIIhA4ETkDmMVYF+DwEBAQ9EDQQBAYUFAo4dA?=
 =?us-ascii?q?iY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBA?=
 =?us-ascii?q?yMPAVYcAwECAwImAgIrIwgQAQiDAgGCdAMRvD96gTKBAYJmghjbMwELFAGBC?=
 =?us-ascii?q?i4BhT+DHwGFA10YAYR9JxsbgXKBFYJzdoEFgVwChTyCSCIEgiKBDIFaHox6A?=
 =?us-ascii?q?oFShnFIgQIcA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+Fy9YGwYFgR2BHoESg?=
 =?us-ascii?q?QddgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJ?=
 =?us-ascii?q?j8VDGQLGgVhCAINDHI5EDAeJC8FHCZAGwoYGA1IESw3FRkEPQFuB5IvgwoHM?=
 =?us-ascii?q?UoTASuBGxh5JJMbkBaCHqEUCiiDeIwklToaM6pxC5h9jgqIeYw8MxkBAU6Ea?=
 =?us-ascii?q?YFoPIFZcBWDIglKGQ+OOYNrhFDJcjw1CwMvAQEHAgcCDAMLgWiQAi2BTwEB?=
IronPort-Data: A9a23:coVof6DMcrI5WRVW/3niw5YqxClBgxIJ4kV8jS/XYbTApD0r1j1Wz
 jZOCmCEaa2DN2T3eIsnOYW2px8DvZKAzYMyOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb9h2YuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE++xTK2s5bc4iwudsI2FW8
 OwzOS9QcUXW7w626OrTpuhEj8AnKozveYgYoHwllW2fBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxANWMHgBfoO3WjPn8bBZ8klfuogVH0ciZTrxSeoq9fD237nF0qgeCwb4qFEjCMbZ8FvHmym
 zLpxn7gAzMDKPOnxhmu633504cjmgu+Aur+DoaQ8/N2iRiNx3YPFRQSVEmyvfi+jGa6WslDM
 AoF/SEyqrAo806mRcW7WAe3yENopTYVX95WVul/4waXx++Mv0CSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXOIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:iA+lNqslq6ltZn6aklw+Y+CI7skDVNV00zEX/kB9WHVpm6uj5q
 eTdZUgpHvJYVkqNk3I9ersBEDEewK+yXcX2/h1AV7dZmjbUQKTRekIh7cKgQeQeREWndQz6U
 4PScRD4aXLbWRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaDZ2JK2xCe36m+oocfng+OaYE
X-Talos-CUID: =?us-ascii?q?9a23=3AO/eW42m9AbGY3cjEn58O+8GQpSHXOUXE8VD6LB/?=
 =?us-ascii?q?7M15oU5+VUVqA07J7ztU7zg=3D=3D?=
X-Talos-MUID: 9a23:l591ZQbBvmQrweBT7W/OuxtfZOhR+b2vKlkRvq0JmOKdOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="893905788"
Received: from alln-l-core-04.cisco.com ([173.36.16.141])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 06:00:28 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-04.cisco.com (Postfix) with ESMTPS id D5D2C180001A7
	for <meta-virtualization@lists.yoctoproject.org>; Thu,  5 Nov 2026 06:00:27 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id D732FCC1295; Thu,  5 Nov 2026 11:30:25 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][wrynose][PATCH 2/5] docker-moby: Fix CVE-2026-33997
Date: Thu,  5 Nov 2026 11:30:03 +0530
Message-Id: <20261105060006.1286469-2-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105060006.1286469-1-deeratho@cisco.com>
References: <20261105060006.1286469-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: alln-l-core-04.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Nov 2026 06:00:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10146
Content-Type: text/plain; charset="utf-8"

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream Docker 29.x backport for
CVE-2026-33997. It corrects plugin privilege comparison so that the first
and single requested privilege are validated. The upstream fix commit is
referenced in [1], and the public CVE advisory is referenced in [2].

[1] https://github.com/moby/moby/commit/f4d6f25bf0c3fa12d4968320a45685947756a22a
[2] https://github.com/moby/moby/security/advisories/GHSA-pxq6-2prw-chj9

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 recipes-containers/docker/docker-moby_git.bb  |   1 +
 .../docker/files/CVE-2026-33997.patch         | 175 ++++++++++++++++++
 2 files changed, 176 insertions(+)
 create mode 100644 recipes-containers/docker/files/CVE-2026-33997.patch

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index 7561215c..831f7aa6 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -59,6 +59,7 @@ SRC_URI = "\
         file://CVE-2026-42306_p2.patch;patchdir=src/import \
         file://CVE-2026-34040_p1.patch;patchdir=src/import \
         file://CVE-2026-34040_p2.patch;patchdir=src/import \
+        file://CVE-2026-33997.patch;patchdir=src/import \
 	"
 
 DOCKER_COMMIT = "${SRCREV_moby}"
diff --git a/recipes-containers/docker/files/CVE-2026-33997.patch b/recipes-containers/docker/files/CVE-2026-33997.patch
new file mode 100644
index 00000000..08a3a960
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2026-33997.patch
@@ -0,0 +1,175 @@
+From 5f3f8ec951421512c10795d075936f8508d6eeb0 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://github.com/moby/moby/commit/f4d6f25bf0c3fa12d4968320a45685947756a22a]
+
+Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
+(cherry picked from commit 99a095ecf04e8849318f2811bb3f687905eab09b)
+Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
+(cherry picked from commit f4d6f25bf0c3fa12d4968320a45685947756a22a)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ daemon/pkg/plugin/manager.go      | 50 ++++++++++++++++++-------------
+ daemon/pkg/plugin/manager_test.go | 44 ++++++++++++++++++++++++---
+ 2 files changed, 69 insertions(+), 25 deletions(-)
+
+diff --git a/daemon/pkg/plugin/manager.go b/daemon/pkg/plugin/manager.go
+index 03477ace23..ec90e465e4 100644
+--- a/daemon/pkg/plugin/manager.go
++++ b/daemon/pkg/plugin/manager.go
+@@ -1,13 +1,13 @@
+ package plugin
+ 
+ import (
++	"cmp"
+ 	"context"
+ 	"encoding/json"
+ 	"io"
+ 	"os"
+ 	"path/filepath"
+-	"reflect"
+-	"sort"
++	"slices"
+ 	"strings"
+ 	"sync"
+ 	"syscall"
+@@ -337,34 +337,42 @@ func makeLoggerStreams(id string) (stdout, stderr io.WriteCloser) {
+ }
+ 
+ func validatePrivileges(requiredPrivileges, privileges plugin.Privileges) error {
+-	if !isEqual(requiredPrivileges, privileges, isEqualPrivilege) {
++	if len(requiredPrivileges) != len(privileges) {
+ 		return errors.New("incorrect privileges")
+ 	}
+ 
+-	return nil
+-}
+-
+-func isEqual(arrOne, arrOther plugin.Privileges, compare func(x, y plugin.Privilege) bool) bool {
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
+-func isEqualPrivilege(a, b plugin.Privilege) bool {
+-	if a.Name != b.Name {
+-		return false
++// normalizePrivileges returns a normalized copy of privileges with privilege names
++// and each privilege's values sorted for order-insensitive comparison.
++// The input is not mutated.
++func normalizePrivileges(privileges plugin.Privileges) plugin.Privileges {
++	normalized := make(plugin.Privileges, len(privileges))
++	for i, privilege := range privileges {
++		normalized[i] = plugin.Privilege{
++			Name:        privilege.Name,
++			Description: privilege.Description,
++			Value:       slices.Clone(privilege.Value),
++		}
++		slices.Sort(normalized[i].Value)
+ 	}
+ 
+-	return reflect.DeepEqual(a.Value, b.Value)
++	slices.SortFunc(normalized, func(a, b plugin.Privilege) int {
++		return cmp.Compare(a.Name, b.Name)
++	})
++
++	return normalized
+ }
+diff --git a/daemon/pkg/plugin/manager_test.go b/daemon/pkg/plugin/manager_test.go
+index f2078d41f5..e51a3367ae 100644
+--- a/daemon/pkg/plugin/manager_test.go
++++ b/daemon/pkg/plugin/manager_test.go
+@@ -44,12 +44,48 @@ func TestValidatePrivileges(t *testing.T) {
+ 			},
+ 			result: true,
+ 		},
++		"single-element-same": {
++			requiredPrivileges: []plugin.Privilege{
++				{Name: "allow-all-devices", Description: "Description", Value: []string{"true"}},
++			},
++			privileges: []plugin.Privilege{
++				{Name: "allow-all-devices", Description: "Description", Value: []string{"true"}},
++			},
++			result: true,
++		},
++		"single-element-diff-value": {
++			requiredPrivileges: []plugin.Privilege{
++				{Name: "allow-all-devices", Description: "Description", Value: []string{"false"}},
++			},
++			privileges: []plugin.Privilege{
++				{Name: "allow-all-devices", Description: "Description", Value: []string{"true"}},
++			},
++			result: false,
++		},
++		"first-sorted-element-diff-value": {
++			requiredPrivileges: []plugin.Privilege{
++				{Name: "allow-all-devices", Description: "Description", Value: []string{"false"}},
++				{Name: "network", Description: "Description", Value: []string{"host"}},
++			},
++			privileges: []plugin.Privilege{
++				{Name: "allow-all-devices", Description: "Description", Value: []string{"true"}},
++				{Name: "network", Description: "Description", Value: []string{"host"}},
++			},
++			result: false,
++		},
++		"empty-privileges": {
++			requiredPrivileges: []plugin.Privilege{},
++			privileges:         []plugin.Privilege{},
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
-- 
2.35.6

